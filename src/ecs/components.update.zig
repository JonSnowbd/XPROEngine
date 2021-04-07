const std = @import("std");
const gk = @import("gamekit");
const load = @import("../loader.zig");

pub const CameraFocus = struct{};
pub const Collider = struct {
    pub const Type = enum {
        circle,
        rectangle
    };
    offset: gk.math.Vec2 = .{},
    size: gk.math.Vec2 = .{},
};