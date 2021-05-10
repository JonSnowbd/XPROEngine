const std = @import("std");
const img_impl = @import("cimgui_impl.zig");
pub const folders = @import("deps/known-folders/known-folders.zig");
pub const ecs = @import("ecs");
pub const raylib = @import("raylib");
pub const imgui = @import("tools/imgui.zig");
pub const render = @import("rendering.zig");
pub const mem = @import("mem.zig");
pub const scene = @import("ecs/scene.zig");
pub const load = @import("loader.zig");
pub const binarySerializer = @import("tools/binser.zig");
pub const serialization = @import("tools/serialization.zig");

pub const physics = struct {
    pub const sweep = @import("physics/sweep.zig");
};

pub const components = @import("ecs/components.zig");
pub const systems = @import("ecs/systems.zig");
pub const tools = @import("tools.zig");

/// A series of functions used to add components automatically to fulfill
/// basic system signatures.
pub const bootstrap = @import("ecs/bootstrap.zig");
pub const theme = @import("theme.zig");

// Re-exporting types! Make it feel more like a centralized library.
pub const Vec = raylib.Vector2;
pub const Rect = raylib.Rectangle;
pub const Color = raylib.Color;
pub const Texture = raylib.Texture2D;
pub const Image = raylib.Image;
pub const Camera = raylib.Camera2D;
pub const Shader = raylib.Shader;
pub const Font = raylib.SpriteFont;
pub const Keys = raylib.KeyboardKey;
pub const Mouse = raylib.MouseButton;

pub const Entity = ecs.Entity;
pub const World = ecs.Registry;

/// The amount of time its been since the last update/render
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
/// The origin of the camera. 0.5 = center on each axis.
pub var camOrigin: Vec = .{.x=0.5,.y=0.5};
/// The currently playing scene that is updated every frame.
pub var currentScene: *scene.Container = undefined;
/// Whether or not the debug interface is open.
pub var debug: bool = false;
/// Multiplier for dt.
pub var timeScale: f32 = 1.0;

/// The basepath, for now its just the executable directory, eventually I will add
/// some flexibility to add multiple base paths for pseudo mod support.
pub var basePath: []const u8 = undefined;

pub var allocator: *std.mem.Allocator = undefined;

pub fn init(alloc: *std.mem.Allocator) !void {
    allocator = alloc;
    basePath = (try folders.getPath(alloc, folders.KnownFolder.executable_dir)) orelse "";
    tools.init(alloc);
    mem.initTmpAllocator(alloc);
    load.init(alloc);
    try render.init(alloc);
    serialization.init(alloc);

    raylib.SetConfigFlags(@enumToInt(raylib.ConfigFlags.FLAG_WINDOW_RESIZABLE));
    raylib.InitWindow(1280,720, "XPRO");

    // Set camera state.
    cam.target.x = 0;
    cam.target.y = 0;
    cam.zoom = 1;

    tools.log("XPro start up complete!");
}

pub fn run(userInitFn: fn() anyerror!void) !void {
    var monitor_rate = raylib.GetMonitorRefreshRate(raylib.GetCurrentMonitor());
    raylib.SetTargetFPS(monitor_rate);

    img_impl.init();

    try userInitFn();
    while(!raylib.WindowShouldClose()) {
        img_impl.newFrame();

        var offX = @intToFloat(f32,raylib.GetScreenWidth()) * camOrigin.x;
        var offY = @intToFloat(f32,raylib.GetScreenHeight()) * camOrigin.y;
        cam.offset.x = offX;
        cam.offset.y = offY;

        update();

        raylib.BeginDrawing();
        raylib.BeginMode2D(cam);
        render.flush();
        raylib.EndMode2D();
        img_impl.flush();
        raylib.EndDrawing();
    }
}

pub fn deinit() !void {
    load.deinit();
    img_impl.deinit();
    render.deinit();
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
    currentScene.updateFn(currentScene);
}

pub fn keyPressed(key: Keys) bool {
    var io = imgui.igGetIO();
    if(io.*.WantCaptureKeyboard) return false;

    return raylib.IsKeyPressed(@enumToInt(key));
}
pub fn keyReleased(key: Keys) bool {
    var io = imgui.igGetIO();
    if(io.*.WantCaptureKeyboard) return false;

    return raylib.IsKeyReleased(@enumToInt(key));
}
pub fn keyDown(key: Keys) bool {
    var io = imgui.igGetIO();
    if(io.*.WantCaptureKeyboard) return false;

    return raylib.IsKeyDown(@enumToInt(key));
}
pub fn keyUp(key: Keys) bool {
    var io = imgui.igGetIO();
    if(io.*.WantCaptureKeyboard) return false;

    return raylib.IsKeyUp(@enumToInt(key));
}

pub fn loadUser(comptime userConfig: anytype) !void {
    switch(@typeInfo(@TypeOf(userConfig))) {
        .Pointer => { },
        else => { @compileError("Userconfig needs to be a pointer."); }
    }
    var stream = binarySerializer.BinaryStream.init(allocator);
    defer stream.deinit();
    var folder = try std.fs.openDirAbsolute(basePath, .{});
    defer folder.close();

    var userFile = folder.openFile("user", .{}) catch |err| switch(err) {
        error.FileNotFound => {
            // File not found means exit early.
            return;
        },
        else => {return err;}
    };
    defer userFile.close();
    try stream.loadFromFile(&folder, "user");
    stream.read(userConfig);
}
pub fn saveUser(comptime userConfig: anytype) !void {
    switch(@typeInfo(@TypeOf(userConfig))) {
        .Pointer => { },
        else => { @compileError("Userconfig needs to be a pointer."); }
    }
    var stream = binarySerializer.BinaryStream.init(allocator);
    defer stream.deinit();
    var folder = try std.fs.openDirAbsolute(basePath, .{});
    defer folder.close();

    stream.write(userConfig);
    try folder.writeFile("user", stream.backing.items);
}