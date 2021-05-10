const std = @import("std");
const xpro = @import("xpro");
const raylib = xpro.raylib;
const prefabs = @import("prefabs.zig");

var gpa = std.heap.GeneralPurposeAllocator(.{}){};
var alloc = &gpa.allocator;

const userSettings = struct {
    userName: []const u8 = "Player",
    buttonPresses: i32 = 0,
};
var user: userSettings = .{}; // From this...

pub fn main() !void {
    try xpro.init(alloc);
    try xpro.loadUser(&user); // to here
    try xpro.run(gameInit);
    try xpro.saveUser(&user); // and here
    try xpro.deinit();
}

fn helloCommand(command: []const u8) void {
    xpro.tools.log("Hello to you too!");
}

fn gameInit() !void {
    // Registering components to be serializable in this project
    xpro.serialization.register(xpro.components.Depth);
    xpro.serialization.register(xpro.components.CameraFocus);
    xpro.serialization.register(xpro.components.Invisible);
    xpro.serialization.register(xpro.components.Position);
    xpro.serialization.register(xpro.components.Name);
    xpro.serialization.register(xpro.components.Tilemap);
    xpro.serialization.register(xpro.components.Sprite);
    xpro.serialization.register(xpro.components.Editable);

    // Registering functions that can be called from console.
    xpro.tools.registerCommand("hello", helloCommand);
    xpro.cam.zoom = 2.0;

    // Registering editor prefabs. This is your main way of having ingame
    // spawnable entities to edit with.
    xpro.tools.registerPrefabCategory("Entities"); // Simple collapsible headers to organize your library.
    xpro.tools.registerPrefab("Player (Ghost)", prefabs.ghostEntity);
    xpro.tools.registerPrefabCategory("Tilemaps");
    xpro.tools.registerPrefab("Tilemap (Station)", prefabs.floorEntity);

    // Set up a window icon
    var img = xpro.load.image("icon.png");
    img.UseAsWindowIcon();

    // No special needed, you handle your own scene management if you need
    // Swapping and deiniting.
    xpro.currentScene = &prefabs.hubScene(alloc).scene;
}