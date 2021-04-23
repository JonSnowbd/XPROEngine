const std = @import("std");
const xpro = @import("xpro.zig");

/// Given a rectangle that moves, a static rectangle, and the mover's velocity, returns
/// an f32 that represents how far into the velocity that a collision happens. Useful
/// for proper collision that is far more accurate than an intersection. If 1.0 is returned,
/// no collision occured.
///
/// Quite a bit more expensive than simple methods of collision detection, but accurate and
/// avoids popping through thin geometry if used properly.
pub fn sweepRect(mover: xpro.Rect, static:xpro.Rect, velocity: xpro.Vec) f32 {
    // Calculate sweep through distances:
    var xInvEntry: f32 = undefined;
    var yInvEntry: f32 = undefined;
    var xInvExit: f32 = undefined;
    var yInvExit: f32 = undefined;

    if(velocity.x > 0.0) {
        xInvEntry = static.x - (mover.x+mover.w);
        xInvExit = (static.x+static.w) - mover.x;
    } else {
        xInvEntry = (static.x+static.w) - mover.x;
        xInvExit = static.x - (mover.x+mover.w);
    }
    
    if (velocity.y > 0.0) {
        yInvEntry = static.y - (mover.y+mover.h);
        yInvExit = (static.y+static.h) - mover.y;
    } else {
        yInvEntry = (static.y+static.h) - mover.y;
        yInvExit = static.y - (mover.y+mover.h);
    }

    var xEntry: f32 = undefined;
    var yEntry: f32 = undefined;
    var xExit: f32 = undefined;
    var yExit: f32 = undefined;

    if(velocity.x == 0.0) {
        xEntry = -std.math.inf(f32);
        xExit = std.math.inf(f32);
    } else {
        xEntry = xInvEntry / velocity.x;
        xExit = xInvExit / velocity.x;
    }

    if(velocity.y == 0.0) {
        yEntry = -std.math.inf(f32);
        yExit = std.math.inf(f32);
    } else {
        yEntry = yInvEntry / velocity.y;
        yExit = yInvExit / velocity.y;
    }

    var et: f32 = std.math.max(xEntry, yEntry);
    var exitTime = std.math.min(xExit, yExit);

    if(et > exitTime or (xEntry < 0.0 and yEntry < 0.0) or xEntry > 1.0 or yEntry > 1.0) {
        return 1.0;
    }

    return et;
}