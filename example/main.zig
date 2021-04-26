const std = @import("std");
const xpro = @import("xpro");
const raylib = xpro.raylib;

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

pub fn main() !void {
    try xpro.init(&gpa.allocator);
    try xpro.run(init);
    try xpro.deinit();
}

fn init() !void {
    var img = raylib.LoadImage("content/icon.png");
    img.UseAsWindowIcon();

    var mainScene = xpro.scene.DefaultGameScene.initHeap(&gpa.allocator);
    mainScene.addUpdateSystem(controls) catch unreachable;
    mainScene.addDefaultUpdateSystems() catch unreachable;
    mainScene.addDefaultRenderSystems() catch unreachable;
    xpro.currentScene = &mainScene.scene;

    var zig = mainScene.scene.world.create();
    xpro.bootstrap.sprite(&mainScene.scene.world, zig, 0, 0, 10, "content/zig.png", 0.5, 0.9);
    mainScene.scene.world.add(zig, xpro.components.Shadow.init(100,20));
}

fn controls() void {
    if(raylib.IsMouseButtonDown(@enumToInt(raylib.MouseButton.MOUSE_MIDDLE_BUTTON))) {
        xpro.cam.target = xpro.cam.target.subv(xpro.worldMouseDelta);
    }
    if(raylib.IsKeyPressed(@enumToInt(raylib.KeyboardKey.KEY_GRAVE))) {
        xpro.tools.console.consoleOpen = !xpro.tools.console.consoleOpen;
    }
    if(raylib.IsKeyPressed(@enumToInt(raylib.KeyboardKey.KEY_F1))) {
        xpro.tools.editor.editorOpen = !xpro.tools.editor.editorOpen;
    }
}