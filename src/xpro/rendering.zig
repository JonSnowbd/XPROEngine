const std = @import("std");
const gk = @import("gamekit");
const math = gk.math;
const Vec2 = gk.math.Vec2;
const Rect = gk.math.Rect;
const RectI = gk.math.RectI;

const xpro = @import("core.zig");

const draw = gk.gfx.draw;

const RenderType = enum {
    Rect,
    RectHollow,
    Tex,
    Text,
    Circle
};

const RenderOrder = struct {
    typ: RenderType = RenderType.Rect,
    position: Vec2 = .{},
    transform: gk.math.Mat32 = .{},
    color: gk.math.Color = gk.math.Color.fromBytes(255,255,255,255),
    texture: ?gk.gfx.Texture = null,
    size: Vec2 = .{},
    source: RectI = .{},
    depth: f32 = 0,
    text: []const u8 = "",
    shader: ?*gk.gfx.Shader = null,
    y_depth: ?f32 = null,
    thickness:f32 = 0,
    font:?*gk.gfx.FontBook = null,
};
fn orderSort(ctx:void, lhs:RenderOrder, rhs:RenderOrder) bool {
    var ldep = lhs.depth+(lhs.y_depth orelse 0);
    var rdep = rhs.depth+(rhs.y_depth orelse 0);
    // Niche checks
    if(ldep == rdep) {
        // Avoid texture breaks by primitive first, then textures.
        if(lhs.typ != RenderType.Tex and rhs.typ == RenderType.Tex) {
            return true;
        }
    }

    return ldep < rdep;
}
var orders: std.ArrayList(RenderOrder) = undefined;

/// You do not need to call this unless you are using the rendering standalone, as
/// `(xpro.zig).init(alloc)` will call this for you.
pub fn init(allocator:*std.mem.Allocator) !void {
    orders = std.ArrayList(RenderOrder).init(allocator);
}
/// You do not need to call this unless you are using the rendering standalone, as
/// `(xpro.zig).init(alloc)` will call this for you.
pub fn deinit() !void {
    orders.deinit();
}

pub fn flush() void {
    var current_shader: ?*gk.gfx.Shader = null;

    std.sort.sort(RenderOrder, orders.items, {}, orderSort);

    gk.gfx.beginPass(.{.color=xpro.clear, .trans_mat = xpro.cam.transMat()});
    for (orders.items) |*order, i| {
        if(order.*.shader != current_shader) {
            gk.gfx.endPass();
            gk.gfx.beginPass(.{.shader = order.*.shader, .trans_mat = xpro.cam.transMat()});
            current_shader = order.*.shader;
        }
        switch (order.*.typ) {
            RenderType.Tex => {
                if(order.*.texture != null) {
                    draw.texViewport(order.*.texture.?, order.*.source, order.*.transform);
                }
            },
            RenderType.Rect => {
                draw.rect(order.*.position, order.*.size.x, order.*.size.y, order.*.color);
            },
            RenderType.RectHollow => {
                draw.hollowRect(order.*.position, order.*.size.x, order.*.size.y, order.*.thickness, order.*.color);
            },
            RenderType.Text => {
                draw.text(order.*.text, order.*.position.x, order.*.position.y, order.*.font);
            },
            else => {}
        }
    }
    gk.gfx.endPass();

    orders.items.len = 0;
}

pub fn tex(depth:f32, mat:gk.math.Mat32, _texture: ?gk.gfx.Texture, source:RectI, y_depth:?f32) void {
    orders.append(.{
        .typ = RenderType.Tex,
        .transform = mat,
        .source = source,
        .texture = _texture,
        .depth = depth,
        .y_depth = y_depth
    }) catch unreachable;
}
pub fn rect(depth:f32, x:f32, y:f32, w:f32, h:f32, col:gk.math.Color, y_depth:?f32) void {
    orders.append(.{
        .typ = RenderType.Rect,
        .position = .{.x=x,.y=y},
        .color = col,
        .depth = depth,
        .size = .{.x=w, .y=h}
    }) catch unreachable;
}
pub fn rectPro(depth:f32, target: Rect, col: gk.math.Color, y_depth:?f32) void {
    rect(depth, target.x, target.y, target.w, target.h, col, y_depth);
}
pub fn rectHollow(depth:f32, x:f32, y:f32, w:f32, h:f32, thick:f32, col:gk.math.Color, y_depth:?f32) void {
    orders.append(.{
        .typ = RenderType.RectHollow,
        .position = .{.x=x,.y=y},
        .size = .{.x=w,.y=h},
        .color = col,
        .depth = depth,
        .y_depth=y_depth,
        .thickness=thick
    }) catch unreachable;
}
pub fn text(depth:f32, message:[]const u8, x:f32, y:f32, y_depth:?f32, font:?*gk.gfx.FontBook) void {
    orders.append(.{
        .typ = RenderType.Text,
        .position = .{.x=x, .y=y},
        .text = message,
        .y_depth = y_depth,
        .depth = depth,
        .font = font
    }) catch unreachable;
}
pub fn textFmt(depth:f32, fmt:[]const u8, vars: anytype, x:f32, y:f32, y_depth:?f32, font:?*gk.gfx.FontBook) void {
    const _text: []const u8 = std.fmt.allocPrint(xpro.mem.ringBuffer, fmt, vars) catch {
        text(depth, "Failed to alloc the format", x, y, y_depth, font);
        return;
    };
    text(depth, _text, x, y, y_depth, font);
}