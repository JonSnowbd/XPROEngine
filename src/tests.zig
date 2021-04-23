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