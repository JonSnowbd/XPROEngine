const std = @import("std");
const flecs = @import("flecs");
const gk = @import("gamekit");

pub const Visible = struct{};
pub const Position = struct{
    value:gk.math.Vec2 = .{},
};
pub const Sprite = struct {
    texture: []const u8,
    source: gk.math.RectI
};

pub fn newWorld() flecs.World {
    var w = flecs.World.init();
    return w;
}