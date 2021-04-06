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

        var tm = self.scene.register.create();
        self.scene.register.add(tm, cmp.Position.init(0,0));

        var tilemap = cmp.Tilemap.init(std.heap.page_allocator, "content/Tiles/DungeonWorld.png", 64, 10,10);
        tilemap.data[0][0] = 1;
        tilemap.data[0][1] = 2;
        tilemap.data[0][2] = 2;
        tilemap.data[0][3] = 2;
        tilemap.data[0][4] = 3;
        self.scene.register.add(tm, tilemap);
        self.scene.register.add(tm, cmp.Depth.init(0));
        self.scene.register.add(tm, cmp.Name.init("Tilemap"));
        self.scene.register.add(tm, cmp.Editable.init(xpro.inspector.editor.tilemapEditor));

        return self;
    }
    pub fn deinit(self: *@This()) void {
        self.scene.deinit();
    }

    pub fn defaultUpdate(scene: *xpro.scene.BasicScene) void {
        var self: *@This() = scene.parent(@This());

        // Update
        if(xpro.debug == false)
            sys.updateCharacterInput(&scene.register);

        sys.updateBrotherSystem(&scene.register);
        sys.updateSisterSystem(&scene.register);
        sys.updateAnimation(&scene.register);

        if(xpro.debug == false) 
            sys.updateGameCamera(&scene.register, .Averaged);

        // Render
        sys.drawSprites(&scene.register);
        sys.drawParticleSystems(&scene.register);
        sys.drawTilemaps(&scene.register);

        if(gk.input.keyPressed(gk.inputRaw.Keys.f1)){
            xpro.debug = !xpro.debug;
        }
            
    }
};