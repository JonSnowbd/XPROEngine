const std = @import("std");
const xpro = @import("xpro");
const systems = @import("ecs.zig");

usingnamespace xpro.imgui;

pub fn ghostEntity() xpro.Entity {
    var world = &xpro.currentScene.world;
    var ghost = world.create();
    world.add(ghost, xpro.components.Serializable{});
    world.add(ghost, xpro.components.Name.init("Player1"));
    world.add(ghost, xpro.components.Editable{});

    // Set up a source rect
    xpro.bootstrap.sprite(world, ghost, 0, 0, 10, "content/ghost.png", 0.5, 0.85);
    var spr = world.get(xpro.components.Sprite, ghost);
    spr.source = .{.x=0,.y=0,.width=32,.height=32};
    spr.color = .{.r=200,.g=95,.b=58};
    
    return ghost;
}
pub fn floorEntity() xpro.Entity {
    var world = &xpro.currentScene.world;
    var tm = world.create();
    world.add(tm, xpro.components.Name.init("Floor"));
    world.add(tm, xpro.components.Position.init(0,0));
    world.add(tm, xpro.components.Depth.init(0));
    world.add(tm, xpro.components.Tilemap.init(xpro.allocator,"content/tiles.png",32,30,30));
    world.add(tm, xpro.components.Serializable{});
    world.add(tm, xpro.components.Editable{});

    var tiles = world.get(xpro.components.Tilemap, tm);

    return tm;
}

pub fn hubScene(allocator: *std.mem.Allocator) *xpro.scene.DefaultGameScene {
    var hub = xpro.scene.DefaultGameScene.initHeap(allocator);

    // Updates
    hub.addUpdateSystem(systems.debugControls, "DebugControls") catch unreachable;
    hub.addDefaultUpdateSystems() catch unreachable;
    hub.addUpdateSystem(systems.ghostController, "Ghost") catch unreachable;

    // Renders
    hub.addDefaultRenderSystems() catch unreachable;

    return hub;
} 