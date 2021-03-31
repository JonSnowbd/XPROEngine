const std = @import("std");
const gk = @import("gamekit");
const load = @import("../loader.zig");

pub const Invisible = struct{};
pub const Position = struct{
    value:gk.math.Vec2 = .{},
};
pub const Sprite = struct {
    texture: gk.gfx.Texture = undefined,
    source: gk.math.RectI = .{},
    pub fn init(path: []const u8) @This() {
        var tex = load.texture(path);
        return .{
            .texture=tex,
            .source=.{.x=0,.y=0.,.w=@floatToInt(i32, tex.width),.h=@floatToInt(i32, tex.height)}
        };
    }
    pub fn initSrc(path: []const u8, x:i32,y:i32, w:i32,h:i32) @This() {
        return .{
            .texture=load.texture(path),
            .source = .{.x=x, .y=y, .w=w, .h=h}
        };
    }
};