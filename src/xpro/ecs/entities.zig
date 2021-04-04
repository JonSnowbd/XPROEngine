const std = @import("std");
const ecs = @import("ecs");
const gk = @import("gamekit");
const xpro = @import("../core.zig");

const cmp = @import("components.zig");

pub fn spawnBrother(reg: *ecs.Registry, x:f32,y:f32, mouse: gk.inputRaw.MouseButton) void {
    var ent = reg.create();
    reg.add(ent, cmp.Position.init(x,y));
    reg.add(ent, cmp.Sprite.initOrigin("content/Sheets/Brother.png", 0.5, 0.95));
    reg.add(ent, cmp.CameraFocus{});
    reg.add(ent, cmp.Depth{.value=10});


    var idle: []const gk.math.RectI = &.{
        .{.x=0,.y=0,.w=64,.h=64},
        .{.x=64,.y=0,.w=64,.h=64},
        .{.x=128,.y=0,.w=64,.h=64},
        .{.x=192,.y=0,.w=64,.h=64},
    };
    reg.add(ent, cmp.CharacterAnimation.init(8, idle));
    reg.add(ent, cmp.CharacterInput.init(mouse));
    reg.add(ent, cmp.Brother{});
}