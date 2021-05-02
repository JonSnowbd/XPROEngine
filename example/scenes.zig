const std = @import("std");
const xpro = @import("xpro");
const systems = @import("systems.zig");

pub fn ghostEntity(world: *xpro.World, x: f32, y:f32) xpro.Entity {
    var ghost = world.create();
    world.add(ghost, xpro.components.Serializable{});


    // Set up a source rect
    xpro.bootstrap.sprite(world, ghost, x,y,10,"content/ghost.png",0.5,0.85);
    var spr = world.get(xpro.components.Sprite, ghost);
    spr.source = .{.x=0,.y=0,.width=32,.height=32};
    spr.color = .{.r=200,.g=95,.b=58};
    
    return ghost;
}

pub fn floorEntity(allocator: *std.mem.Allocator, world: *xpro.World) xpro.Entity {
    var tm = world.create();
    
    world.add(tm, xpro.components.Position.init(0,0));
    world.add(tm, xpro.components.Depth.init(9));
    world.add(tm, xpro.components.Tilemap.init(allocator,"content/tiles.png",32,30,30));
    world.add(tm, xpro.components.Serializable{});

    var tiles = world.get(xpro.components.Tilemap, tm);
    tiles.data[0][0] = 0;
    tiles.data[1][0] = 0;
    tiles.data[2][0] = 0;

    return tm;
}

pub fn hubScene(allocator: *std.mem.Allocator) *xpro.scene.DefaultGameScene {
    var hub = xpro.scene.DefaultGameScene.initHeap(allocator);

    // Updates
    hub.addUpdateSystem(systems.debugControls) catch unreachable;
    hub.addDefaultUpdateSystems() catch unreachable;
    hub.addUpdateSystem(systems.ghostController) catch unreachable;

    // Renders
    hub.addDefaultRenderSystems() catch unreachable;

    var player = ghostEntity(&hub.scene.world, 0, 0);
    var ground = floorEntity(allocator, &hub.scene.world);

    return hub;
} 