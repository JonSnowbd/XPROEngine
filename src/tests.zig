const std = @import("std");
const xpro = @import("xpro.zig");

test "physics rect on rect sweeping" {
    var mover = xpro.Rect{.x=0,.y=0,.w=10,.h=10};
    var static = xpro.Rect{.x=20,.y=0,.w=10,.h=10};
    var velocity = xpro.Vec{.x=20,.y=0};
    var notEnough = xpro.Vec{.x=3,.y=3};

    std.testing.expect(xpro.physics.sweepRect(mover, static, velocity) == 0.5);
    std.testing.expect(xpro.physics.sweepRect(mover, static, notEnough) == 1.0);
}

test "serialization" {
    var testAlloc: *std.mem.Allocator = std.testing.allocator;
    var world = xpro.World.init(testAlloc);
    xpro.serialization.verbose = true;
    var ent = world.create();
    world.add(ent, xpro.components.Depth.init(10));
    world.add(ent, xpro.components.Position.init(10,10));
    world.add(ent, xpro.components.Name.init("Salted Caramel"));
    world.add(ent, xpro.components.Serializable{});

    var ent2 = world.create();
    world.add(ent2, xpro.components.Position.init(2,17));
    world.add(ent2, xpro.components.Name.init("Taffy"));
    world.add(ent2, xpro.components.Serializable{});
    var data = xpro.serialization.serialize(testAlloc, &world);
    defer testAlloc.free(data);

    var newWorld = xpro.World.init(testAlloc);

    var bits = std.ArrayList(u8).init(testAlloc);
    bits.appendSlice(data) catch unreachable;
    xpro.serialization.deserialize(testAlloc, &bits, &newWorld);

}