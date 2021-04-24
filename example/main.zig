const std = @import("std");
const xpro = @import("xpro");
const raylib = xpro.raylib;
usingnamespace xpro.imgui;

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

const GameScene = struct {
    scene: xpro.scene.Container,

    fn init(allocator: *std.mem.Allocator) @This() {
        var scn = xpro.scene.Container.init(allocator, GameScene.update);

        return @This(){
            .scene = scn,
        };
    }

    fn update(scene: *xpro.scene.Container) void {
        var self: *GameScene = scene.parent(GameScene);

        if(raylib.IsMouseButtonDown(@enumToInt(raylib.MouseButton.MOUSE_MIDDLE_BUTTON))) {
            xpro.cam.target = xpro.cam.target.subv(xpro.worldMouseDelta);
        }
        if(raylib.IsKeyPressed(@enumToInt(raylib.KeyboardKey.KEY_F1))) {
            xpro.debug = !xpro.debug;
        }

        xpro.systems.defaultUpdateSystems(&scene.register);
        xpro.systems.defaultDrawSystems(&scene.register);
    }
};

pub fn main() !void {
    try xpro.init(&gpa.allocator);
    try xpro.run(init);
    try xpro.deinit();
}

fn init() !void {
    std.debug.print("Welcome to xpro! Creating a few starter entities.\n", .{});
    xpro.currentScene = GameScene.init(&gpa.allocator).scene;

    
    var zig = xpro.currentScene.register.create();
    xpro.bootstrap.sprite(&xpro.currentScene.register, zig, 0, 0, 10, "content/zig.png", 0.5, 0.9);
    xpro.currentScene.register.add(zig, xpro.components.Shadow.init(100,20));
}