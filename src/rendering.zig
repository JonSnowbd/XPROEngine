const std = @import("std");
const xpro = @import("xpro.zig");
const ray = xpro.raylib;

const RenderType = enum {
    Rect,
    RectHollow,
    Tex,
    Text,
    Circle
};

const RenderOrder = struct {
    typ: RenderType = RenderType.Rect,

    position: xpro.Vec = .{},
    size:     xpro.Vec = .{},
    origin:   xpro.Vec = .{},
    rotation: f32 = 0,

    color: xpro.Color = .{.r=255,.g=255,.b=255,.a=255},
    texture: ?xpro.Texture = null,
    source: xpro.Rect = .{},

    text: []const u8 = "",
    depth:    f32 = 0,
    y_depth: ?f32 = null,
    thickness:f32 = 0,

    shader: ?*xpro.Shader = null,
    font:   ?*xpro.Font = null,
};
fn orderSort(ctx:void, lhs:RenderOrder, rhs:RenderOrder) bool {
    var ldep = lhs.depth+(lhs.y_depth orelse 0);
    var rdep = rhs.depth+(rhs.y_depth orelse 0);
    // Niche checks
    if(ldep == rdep) {
        // Avoid texture breaks by Textures first, then primitives.
        if(lhs.typ != RenderType.Tex and rhs.typ == RenderType.Tex) {
            return false;
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
/// `(xpro.zig).deinit()` will call this for you.
pub fn deinit() !void {
    orders.deinit();
}

pub fn flush() void {
    std.sort.sort(RenderOrder, orders.items, {}, orderSort);
    ray.ClearBackground(xpro.theme.Clear);
    for (orders.items) |*order, i| {
        // if(order.*.shader != current_shader) {
        //     gk.gfx.endPass();
        //     gk.gfx.beginPass(.{.shader = order.*.shader, .trans_mat = xpro.cam.transMat()});
        //     current_shader = order.*.shader;
        // }
        var posX: c_int = @floatToInt(c_int, order.position.x);
        var posY: c_int = @floatToInt(c_int, order.position.y);
        var sizeX: c_int = @floatToInt(c_int, order.size.x);
        var sizeY: c_int = @floatToInt(c_int, order.size.y);
        switch (order.*.typ) {
            RenderType.Tex => {
                if(order.texture != null) {
                    var dest = xpro.Rect{
                        .x = order.position.x - (order.size.x * order.origin.x),
                        .y = order.position.y - (order.size.y * order.origin.y),
                        .width = order.size.x,
                        .height = order.size.y,
                    };
                    ray.DrawTexturePro(order.texture.?, order.source, dest, order.origin, order.rotation, order.color);
                }
            },
            RenderType.Rect => {
                ray.DrawRectangle(posX, posY, sizeX, sizeY, order.color);
            },
            RenderType.RectHollow => {
                ray.DrawRectangleLines(posX, posY, sizeX, sizeY, order.color);
            },
            RenderType.Text => {
                ray.DrawText(order.text.ptr, posX, posY, 10, order.color);
            },
            RenderType.Circle => {
                ray.DrawEllipse(posX, posY, order.size.x, order.size.y, order.color);
            }
        }
    }
    orders.items.len = 0;
}

pub fn tex(depth:f32, pos: xpro.Vec, _texture: ?xpro.Texture, size: xpro.Vec, source:xpro.Rect, y_depth:?f32) void {
    orders.append(.{
        .typ = RenderType.Tex,
        .size= size,
        .position = pos,
        .source = source,
        .texture = _texture,
        .depth = depth,
        .y_depth = y_depth
    }) catch unreachable;
}
pub fn texPro(depth:f32, pos: xpro.Vec, _texture: ?xpro.Texture, size: xpro.Vec, source:xpro.Rect, y_depth:?f32, rot: f32, origin: xpro.Vec, color: xpro.Color) void {
    orders.append(.{
        .typ = RenderType.Tex,
        .size= size,
        .position = pos,
        .source = source,
        .texture = _texture,
        .depth = depth,
        .origin = origin,
        .rotation = rot,
        .y_depth = y_depth,
        .color = color,
    }) catch unreachable;
}
pub fn rect(depth:f32, x:f32, y:f32, w:f32, h:f32, col:xpro.Color, y_depth:?f32) void {
    orders.append(.{
        .typ = RenderType.Rect,
        .position = .{.x=x,.y=y},
        .color = col,
        .depth = depth,
        .size = .{.x=w, .y=h}
    }) catch unreachable;
}
pub fn rectPro(depth:f32, target: Rect, col: xpro.Color, y_depth:?f32) void {
    rect(depth, target.x, target.y, target.w, target.h, col, y_depth);
}
pub fn rectHollow(depth:f32, x:f32, y:f32, w:f32, h:f32, thick:f32, col:xpro.Color, y_depth:?f32) void {
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
pub fn text(depth:f32, message:[]const u8, x:f32, y:f32, y_depth:?f32, font:?*xpro.Font) void {
    orders.append(.{
        .typ = RenderType.Text,
        .position = .{.x=x, .y=y},
        .text = message,
        .y_depth = y_depth,
        .depth = depth,
        .font = font
    }) catch unreachable;
}
pub fn ellipse(depth:f32, x:f32, y:f32, sizeX:f32, sizeY:f32, col:xpro.Color, y_depth:?f32) void {
    orders.append(.{
        .typ = RenderType.Circle,
        .position = .{.x=x,.y=y},
        .size = .{.x=sizeX,.y=sizeY},
        .color = col,
        .depth = depth,
        .y_depth=y_depth,
    }) catch unreachable;
}
pub fn textFmt(depth:f32, fmt:[]const u8, vars: anytype, x:f32, y:f32, y_depth:?f32, font:?*xpro.Font) void {
    const _text: []const u8 = std.fmt.allocPrint(xpro.mem.ringBuffer, fmt, vars) catch {
        text(depth, "Failed to alloc the format", x, y, y_depth, font);
        return;
    };
    text(depth, _text, x, y, y_depth, font);
}