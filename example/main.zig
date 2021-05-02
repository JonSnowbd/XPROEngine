const std = @import("std");
const xpro = @import("xpro");
const raylib = xpro.raylib;

const scenes = @import("scenes.zig");

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

const userSettings = struct {
    userName: []const u8 = "Player",
    buttonPresses: i32 = 0,
};

var user: userSettings = .{};

pub fn main() !void {
    // try xpro.loadUser(&user);
    try xpro.init(&gpa.allocator);
    try xpro.run(init);
    // try xpro.saveUser(&user);
    try xpro.deinit();
}

fn init() !void {
    xpro.serialization.register(xpro.components.Depth);
    xpro.serialization.register(xpro.components.Position);
    xpro.serialization.register(xpro.components.Name);
    xpro.serialization.register(xpro.components.Tilemap);

    var img = raylib.LoadImage("icon.png");
    img.UseAsWindowIcon();

    xpro.currentScene = &scenes.hubScene(&gpa.allocator).scene;
}