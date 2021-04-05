const std = @import("std");
const gk = @import("gamekit");
pub const render = @import("rendering.zig");
pub const mem = @import("mem.zig");
pub const ecs = @import("ecs.zig");
pub const scene = @import("ecs/scene.zig");
pub const load = @import("loader.zig");
pub const balance = @import("balance.zig");
pub const inspector = @import("inspector/inspector.zig");

pub var clear: gk.math.Color = gk.math.Color.fromRgbBytes(20,20,20);
/// The amount of time its been since the last render
pub var dt: f32 = 0.0;
/// The position of the mouse on screen. Does not take camera into account.
pub var mousePos: gk.math.Vec2 = .{};
/// The position of the mouse in world, taking into account camera position and zoom.
pub var worldMousePos: gk.math.Vec2 = .{};
/// The delta of the mouse on screen. Does not take the camera into account.
pub var mouseDelta: gk.math.Vec2 = .{};
/// The delta of the mouse in world, taking into account camera position and zoom.
pub var worldMouseDelta: gk.math.Vec2 = .{};
/// The universal camera used in the game.
pub var cam: gk.utils.Camera = .{};
/// The currently playing scene that is updated every frame.
pub var currentScene: scene.BasicScene = undefined;
pub var debug: bool = false;

/// Resets the camera back to default.
pub fn reset_cam() void {
    self.cam.pos = .{};
}

pub fn init(allocator: *std.mem.Allocator) !void {
    mem.initTmpAllocator();
    load.init(allocator);
    try render.init(allocator);
}
pub fn deinit() !void {
    load.deinit();
    try render.deinit();
}

var lastMousePos: gk.math.Vec2 = .{};
var worldLastMousePos: gk.math.Vec2 = .{};
pub fn update() !void {
    // DT
    dt = (1.0/@intToFloat(f32, gk.time.frame_time)) / 10;

    // Input
    mousePos = gk.input.mousePos();
    worldMousePos = cam.screenToWorld(mousePos);

    mouseDelta = .{.x=mousePos.x-lastMousePos.x, .y=mousePos.y-lastMousePos.y};
    worldMouseDelta = .{.x=worldMousePos.x-worldLastMousePos.x, .y=worldMousePos.y-worldLastMousePos.y};

    lastMousePos = mousePos;
    worldLastMousePos = worldMousePos;

    currentScene.updateFn(&currentScene);

    if(gk.input.keyPressed(gk.inputRaw.Keys.f1))
        debug = !debug;

    if(debug)
        inspector.update(&currentScene);
}