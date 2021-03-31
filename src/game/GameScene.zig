const std = @import("std");
const xpro = @import("xpro");

const cmp = xpro.ecs.component;
const sys = xpro.ecs.system;
pub const GameScene = struct {
    scene: xpro.scene.BasicScene,

    pub fn init() @This() {
        var self: @This() = .{
            .scene = xpro.scene.BasicScene.init(std.heap.page_allocator, defaultUpdate)
        };

        var ent = self.scene.register.create();
        self.scene.register.add(ent, cmp.Position{});
        self.scene.register.add(ent, cmp.Sprite.init("content/Sheets/Brother.png"));

        return self;
    }
    pub fn deinit(self: *@This()) void {
        self.scene.deinit();
    }

    pub fn defaultUpdate(scene: *xpro.scene.BasicScene) void {
        var self: *@This() = scene.parent(@This());
        sys.drawSprites(&scene.register);
    }
};