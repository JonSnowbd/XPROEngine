const std = @import("std");
const xpro = @import("xpro");

const cmp = xpro.ecs.component;
const ent = xpro.ecs.entity;
const sys = xpro.ecs.system;
const gk = @import("gamekit");

const particles = @import("particleSystems.zig");

pub const GameScene = struct {
    scene: xpro.scene.BasicScene,

    pub fn init() @This() {
        var self: @This() = .{
            .scene = xpro.scene.BasicScene.init(std.heap.page_allocator, defaultUpdate)
        };

        ent.spawnBrother(&self.scene.register, 0,0, .left);
        ent.spawnSister(&self.scene.register, 200,0, .right);

        var partsystem = self.scene.register.create();
        self.scene.register.add(partsystem, cmp.Position.init(200,-20));
        self.scene.register.add(partsystem, cmp.ParticleSystem.init(
            std.heap.page_allocator,
            xpro.load.texture("content/shimmer.png"),
            16,
            32,
            particles.reverseGravityAffector,
            particles.pointSpawner
        ));
        self.scene.register.add(partsystem, cmp.Depth{.value=1});

        return self;
    }
    pub fn deinit(self: *@This()) void {
        self.scene.deinit();
    }

    pub fn defaultUpdate(scene: *xpro.scene.BasicScene) void {
        var self: *@This() = scene.parent(@This());

        // Update
        if(xpro.debug == false) {
            sys.updateCharacterInput(&scene.register);
        }

        sys.updateBrotherSystem(&scene.register);
        sys.updateSisterSystem(&scene.register);
        sys.updateAnimation(&scene.register);
        sys.updateGameCamera(&scene.register, .Averaged);

        // Render
        sys.drawSprites(&scene.register);
        sys.drawParticleSystems(&scene.register);

        if(gk.input.keyPressed(gk.inputRaw.Keys.f1)){
            xpro.debug = !xpro.debug;
        }
            
    }
};