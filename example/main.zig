const std = @import("std");
const xpro = @import("xpro");
const raylib = xpro.raylib;
usingnamespace xpro.imgui;

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

const GameScene = struct {
    scene: xpro.scene.Container,

    fn init(allocator: *std.mem.Allocator) @This() {
        var scn = xpro.scene.Container.init(allocator, GameScene.update);

        var ent = scn.register.create();
        xpro.bootstrap.sprite(&scn.register, ent, 0, 0, 10, "content/xpro.png");

        return @This(){
            .scene = scn,
        };
    }

    fn update(scene: *xpro.scene.Container) void {
        var self: *GameScene = scene.parent(GameScene);

xpro.cam.target = xpro.cam.target.addv(xpro.mouseDelta);

        if(igBegin("Testing Window", null, ImGuiWindowFlags_None)) {
            igImage(xpro.load.textureImgui("content/zig.png"), ImVec2{.x=100,.y=100}, ImVec2.zero, ImVec2.one, ImVec4.white, ImVec4.white);
        }
        igEnd();

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
}