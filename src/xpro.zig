const std = @import("std");
const img_impl = @import("cimgui_impl.zig");
pub const ecs = @import("ecs");
pub const raylib = @import("raylib");
pub const imgui = @import("imgui.zig");
pub const render = @import("rendering.zig");
pub const mem = @import("mem.zig");
pub const scene = @import("ecs/scene.zig");
pub const load = @import("loader.zig");
pub const physics = @import("physics.zig");

pub const components = @import("ecs/components.zig");
pub const systems = @import("ecs/systems.zig");
pub const tools = @import("tools.zig");

/// A series of functions used to add components automatically to fulfill
/// basic system signatures.
pub const bootstrap = @import("ecs/bootstrap.zig");
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
/// The delta time, unaffected by timescale.
pub var rawDt: f32 = 0.0;
/// The position of the mouse on screen. Does not take camera into account.
pub var mousePos: Vec = .{};
/// The position of the mouse in world, taking into account camera position, rotation, and zoom.
pub var worldMousePos: Vec = .{};
/// The delta of the mouse on screen. Does not take the camera into account.
pub var mouseDelta: Vec = .{};
/// The delta of the mouse in world, taking into account camera position, rotation, and zoom.
pub var worldMouseDelta: Vec = .{};
/// The universal camera used in the game.
pub var cam: Camera = .{};
/// The currently playing scene that is updated every frame.
pub var currentScene: scene.Container = undefined;
/// Whether or not the debug interface is open.
pub var debug: bool = false;
/// Multiplier for dt.
pub var timeScale: f32 = 1.0;

pub fn init(allocator: *std.mem.Allocator) !void {
    mem.initTmpAllocator();
    load.init(allocator);
    tools.init(allocator);
    try render.init(allocator);

    raylib.SetConfigFlags(@enumToInt(raylib.ConfigFlags.FLAG_WINDOW_RESIZABLE));
    raylib.InitWindow(1280,720, "XPRO");

    // Set camera state.
    var offX = @intToFloat(f32,raylib.GetScreenWidth()) / 2.0;
    var offY = @intToFloat(f32,raylib.GetScreenHeight()) / 2.0;
    cam.offset.x = offX;
    cam.offset.y = offY;
    cam.target.x = 0;
    cam.target.y = 0;
    cam.zoom = 2;

    log("XPro start up complete!");
}

pub fn run(userInitFn: fn() anyerror!void) !void {
    var monitor_rate = raylib.GetMonitorRefreshRate(raylib.GetCurrentMonitor());
    raylib.SetTargetFPS(monitor_rate);

    img_impl.init();

    try userInitFn();
    while(!raylib.WindowShouldClose()) {
        img_impl.newFrame();

        tools.editor.run();
        tools.console.run();

        update();

        raylib.BeginDrawing();
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
fn update() void {
    var io = imgui.igGetIO();
    // DT
    rawDt = raylib.GetFrameTime();
    dt = rawDt * timeScale;

    // Input
    mousePos = raylib.GetMousePosition();

    var invMat = raylib.MatrixInvert(raylib.GetCameraMatrix2D(cam));
    var transpose = raylib.Vector3Transform(.{.x=mousePos.x, .y=mousePos.y}, invMat);
    worldMousePos = .{.x=transpose.x,.y=transpose.y};

    if(io.*.WantCaptureMouse) {
        mouseDelta = .{};
        worldMouseDelta = .{};
    } else {
        mouseDelta = mousePos.subv(lastMousePos);
        worldMouseDelta = mouseDelta.scaleDiv(cam.zoom);
    }

    lastMousePos = mousePos;
    currentScene.updateFn(&currentScene);
}

pub fn log(message: []const u8) void {
    tools.console.log.append(message) catch unreachable;
}

pub fn keyPressed(key: raylib.KeyboardKey) bool {
    var io = imgui.igGetIO();
    if(io.*.WantCaptureKeyboard) return false;

    return raylib.IsKeyPressed(@enumToInt(key));
}
pub fn keyReleased(key: raylib.KeyboardKey) bool {
    var io = imgui.igGetIO();
    if(io.*.WantCaptureKeyboard) return false;

    return raylib.IsKeyReleased(@enumToInt(key));
}
pub fn keyDown(key: raylib.KeyboardKey) bool {
    var io = imgui.igGetIO();
    if(io.*.WantCaptureKeyboard) return false;

    return raylib.IsKeyDown(@enumToInt(key));
}
pub fn keyUp(key: raylib.KeyboardKey) bool {
    var io = imgui.igGetIO();
    if(io.*.WantCaptureKeyboard) return false;

    return raylib.IsKeyUp(@enumToInt(key));
}