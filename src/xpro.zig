const std = @import("std");
pub const render = @import("rendering.zig");
pub const mem = @import("mem.zig");
pub const scene = @import("ecs/scene.zig");
pub const load = @import("loader.zig");
pub const inspector = @import("inspector/inspector.zig");
pub const physics = @import("physics.zig");

pub const component = @import("ecs/components.zig");
pub const system = @import("ecs/systems.zig");
pub const entity = @import("ecs/entities.zig");

const gk = @import("gamekit");
// Re-exporting types!
pub const Vec2 = gk.math.Vec2;
pub const Rect = gk.math.Rect;

/// The clear color of the background.
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
pub var currentScene: scene.Container = undefined;
/// Whether or not the debug interface is open.
pub var debug: bool = false;

var userInit: fn() anyerror!void = undefined;

pub fn init(allocator: *std.mem.Allocator) !void {
    mem.initTmpAllocator();
    load.init(allocator);
    try render.init(allocator);
}

pub fn run(userInitFn: fn() anyerror!void) !void {
    userInit = userInitFn;
    try gk.run(.{
        .init = _init,
        .update = update,
        .render = _render,
        .shutdown = _shutdown,
        .update_rate = 60,
        .window = .{
            .title = "XPro",
            .width = 1280,
            .height = 720,
        }
    });
}

fn deinit() !void {
    load.deinit();
    try render.deinit();
}

var lastMousePos: gk.math.Vec2 = .{};
var worldLastMousePos: gk.math.Vec2 = .{};
fn update() !void {
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

    if(debug)
        inspector.update(&currentScene);
}

fn _init() !void {
    try userInit();
}
fn _render() !void {
    render.flush();
}

fn _shutdown() !void {
    try deinit();
}