const std = @import("std");
const gk = @import("gamekit");
const xpro = @import("xpro.zig");

test "physics rect on rect sweeping" {
    var mover = gk.math.Rect{.x=0,.y=0,.w=10,.h=10};
    var static = gk.math.Rect{.x=20,.y=0,.w=10,.h=10};
    var velocity = gk.math.Vec2{.x=20,.y=0};
    var notEnough = gk.math.Vec2{.x=3,.y=3};

    std.testing.expect(xpro.physics.sweepRect(mover, static, velocity) == 0.5);
    std.testing.expect(xpro.physics.sweepRect(mover, static, notEnough) == 1.0);
}