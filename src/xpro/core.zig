const std = @import("std");
const gk = @import("gamekit");
pub const render = @import("rendering.zig");
pub const mem = @import("mem.zig");

const ShadowShaderFs: []const u8 = @embedFile("shaders/shadows_fs.glsl");

pub var clear: gk.math.Color = gk.math.Color.fromRgbBytes(20,20,20);
/// The amount of time its been since the last render
pub var dt: f32 = 0.0;
/// The position of the mouse on screen. Does not take camera into account.
pub var mouse_pos: gk.math.Vec2 = .{};
/// The position of the mouse in world, taking into account camera position and zoom.
pub var world_mouse_pos: gk.math.Vec2 = .{};
/// The delta of the mouse on screen. Does not take the camera into account.
pub var mouse_delta: gk.math.Vec2 = .{};
/// The delta of the mouse in world, taking into account camera position and zoom.
pub var world_mouse_delta: gk.math.Vec2 = .{};
/// The universal camera used in the game.
pub var cam: gk.utils.Camera = .{};
/// Resets the camera back to 0,0 position, ignoring zoom.
pub fn reset_cam() void {
    self.cam.pos.x = 0.0;
    self.cam.pos.y = 0.0;
}

pub fn init(allocator: *std.mem.Allocator) !void {
    mem.initTmpAllocator();
    try render.init(allocator);
}
pub fn deinit() !void {
    try render.deinit();
}

var last_mouse_pos: gk.math.Vec2 = .{};
var world_last_mouse_pos: gk.math.Vec2 = .{};
pub fn update() !void {
    // DT
    dt = gk.time.timestep.raw_deltatime;
    // Input
    mouse_pos = gk.input.mousePos();
    world_mouse_pos = cam.screenToWorld(mouse_pos);
    //world_mouse_pos.y = -world_mouse_pos.y; // flipped for some reason???

    mouse_delta = .{.x=mouse_pos.x-last_mouse_pos.x, .y=mouse_pos.y-last_mouse_pos.y};
    world_mouse_delta = .{.x=world_mouse_pos.x-world_last_mouse_pos.x, .y=world_mouse_pos.y-world_last_mouse_pos.y};

    last_mouse_pos = mouse_pos;
    world_last_mouse_pos = world_mouse_pos;
}