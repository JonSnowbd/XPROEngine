const std = @import("std");
const xpro = @import("xpro");

const cmp = xpro.ecs.component;
const sys = xpro.ecs.system;
const gk = @import("gamekit");

const particles = @import("particleSystems.zig");

pub const GameScene = struct {
    scene: xpro.scene.BasicScene,

    pub fn init() @This() {
        var self: @This() = .{
            .scene = xpro.scene.BasicScene.init(std.heap.page_allocator, defaultUpdate)
        };

        var ent = self.scene.register.create();
        self.scene.register.add(ent, cmp.Position.init(200,0));
        self.scene.register.add(ent, cmp.Sprite.initOrigin("content/Sheets/Brother.png",0.5,0.95));
        self.scene.register.add(ent, cmp.CameraFocus{});
        self.scene.register.add(ent, cmp.Depth{.value=1});
        self.scene.register.add(ent, cmp.CharacterInput{});
        self.scene.register.add(ent, cmp.Brother{});

        var two = self.scene.register.create();
        self.scene.register.add(two, cmp.Position.init(-100,0));
        self.scene.register.add(two, cmp.Sprite.initOrigin("content/Sheets/Brother.png",0.5,0.95));
        self.scene.register.add(two, cmp.CameraFocus{});
        self.scene.register.add(two, cmp.Depth{.value=1});
        self.scene.register.add(two, cmp.CharacterInput{.mouseButton = gk.inputRaw.MouseButton.right});
        self.scene.register.add(two, cmp.Brother{});

        var idle_anim: []gk.math.RectI = std.heap.page_allocator.alloc(gk.math.RectI, 4) catch unreachable;
        
        idle_anim[0] = .{.x=0,.y=0,.w=64,.h=64};
        idle_anim[1] = .{.x=64,.y=0,.w=64,.h=64};
        idle_anim[2] = .{.x=128,.y=0,.w=64,.h=64};
        idle_anim[3] = .{.x=192,.y=0,.w=64,.h=64};

        self.scene.register.add(ent, cmp.CharacterAnimation.init(8, idle_anim));
        self.scene.register.add(two, cmp.CharacterAnimation.init(8, idle_anim));

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
        sys.updateCharacterInput(&scene.register);
        sys.updateGameCamera(&scene.register, .Averaged);
        sys.updateBrotherSystem(&scene.register);
        sys.updateAnimation(&scene.register);

        // Render
        sys.drawSprites(&scene.register);
        sys.drawParticleSystems(&scene.register);
    }
};