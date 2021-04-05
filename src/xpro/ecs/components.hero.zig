const std = @import("std");
const gk = @import("gamekit");
const load = @import("../loader.zig");

pub const CharacterInput = struct {
    pub const Order = enum(i32) {
        Nothing=-1,
        Move=0,
        Light=1,
        Heavy=2,
        Mobility=3
    };
    mouseButton: gk.inputRaw.MouseButton = gk.inputRaw.MouseButton.left,
    queuedAction: Order = .Nothing,
    pub fn init(inputButton: gk.inputRaw.MouseButton) @This() {
        return @This(){.mouseButton=inputButton};
    }
};
pub const Brother = struct {
    movementTarget: gk.math.Vec2 = .{},
    moving: bool = false,
};
pub const Sister = struct {
    movementTarget: gk.math.Vec2 = .{},
    moving: bool = false,
};