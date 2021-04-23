const std = @import("std");
const img_impl = @import("cimgui_impl.zig");
pub const ecs = @import("ecs");
pub const raylib = @import("raylib");
pub const imgui = @import("imgui");
pub const render = @import("rendering.zig");
pub const mem = @import("mem.zig");
pub const scene = @import("ecs/scene.zig");
pub const load = @import("loader.zig");
pub const physics = @import("physics.zig");

pub const components = @import("ecs/components.zig");
pub const systems = @import("ecs/systems.zig");

/// A series of functions used to add components automatically to fulfill
/// basic system signatures.
pub const bootstrap = @import("ecs/entities.zig");
pub const theme = @import("theme.zig");

// Re-exporting types!
pub const Vec = raylib.Vector2;
pub const Rect = raylib.Rectangle;
pub const Color = raylib.Color;
pub const Texture = raylib.Texture2D;
pub const Camera = raylib.Camera2D;
pub const Shader = raylib.Shader;
pub const Font = raylib.SpriteFont;

pub const Entity = ecs.Entity;
pub const World = ecs.Registry;

/// The amount of time its been since the last render
pub var dt: f32 = 0.0;
/// The position of the mouse on screen. Does not take camera into account.
pub var mousePos: Vec = .{};
/// The position of the mouse in world, taking into account camera position and zoom.
pub var worldMousePos: Vec = .{};
/// The delta of the mouse on screen. Does not take the camera into account.
pub var mouseDelta: Vec = .{};
/// The delta of the mouse in world, taking into account camera position and zoom.
pub var worldMouseDelta: Vec = .{};
/// The universal camera used in the game.
pub var cam: Camera = .{};
/// The currently playing scene that is updated every frame.
pub var currentScene: scene.Container = undefined;
/// Whether or not the debug interface is open.
pub var debug: bool = false;

pub fn init(allocator: *std.mem.Allocator) !void {
    mem.initTmpAllocator();
    load.init(allocator);
    try render.init(allocator);
    
    var offX = @intToFloat(f32,raylib.GetScreenWidth()) / 2.0;
    var offY = @intToFloat(f32,raylib.GetScreenHeight()) / 2.0;
    cam.offset = .{.x=offX,.y=offY};
    cam.target.x = 0;
    cam.target.y = 0;
}

pub fn run(userInitFn: fn() anyerror!void) !void {
    raylib.InitWindow(1280,720, "XPRO");
    raylib.SetTargetFPS(144);
    img_impl.init();

    try userInitFn();
    while(!raylib.WindowShouldClose()) {
        img_impl.newFrame();
        update();

        raylib.BeginDrawing();
        // Center camera:


        std.debug.print("{any}\n", .{cam.target});
        raylib.BeginMode2D(cam);
        render.flush();
        raylib.EndMode2D();

        img_impl.flush();
        raylib.EndDrawing();
    }

    img_impl.deinit();
}

pub fn deinit() !void {
    load.deinit();
    try render.deinit();
    raylib.CloseWindow();
}

var lastMousePos: Vec = .{};
var worldLastMousePos: Vec = .{};
fn update() void {
    // DT
    dt = raylib.GetFrameTime();

    // Input
    mousePos = raylib.GetMousePosition();
    worldMousePos = raylib.GetScreenToWorld2D(mousePos, cam);

    mouseDelta = .{.x=mousePos.x-lastMousePos.x, .y=mousePos.y-lastMousePos.y};
    worldMouseDelta = .{.x=worldMousePos.x-worldLastMousePos.x, .y=worldMousePos.y-worldLastMousePos.y};

    lastMousePos = mousePos;
    worldLastMousePos = worldMousePos;

    currentScene.updateFn(&currentScene);
}

pub fn quickFmt(comptime fmt: []const u8, args: anytype) []const u8 {
    return std.fmt.allocPrint(mem.ringBuffer, fmt, args) catch unreachable;
}