const std = @import("std");
const ecs = @import("ecs");
const gk = @import("gamekit");
const xpro = @import("../xpro.zig");

const cmp = @import("components.zig");

fn characterMixin(reg: *ecs.Registry, x:f32, y:f32, mouse: gk.inputRaw.MouseButton) ecs.Entity {
    var ent = reg.create();
    reg.add(ent, cmp.Position.init(x,y));
    reg.add(ent, cmp.CameraFocus{});
    reg.add(ent, cmp.Depth{.value=10});
    reg.add(ent, cmp.CharacterInput.init(mouse));
    reg.add(ent, cmp.Editable{});

    return ent;
}

pub fn spawnBrother(reg: *ecs.Registry, x:f32,y:f32, mouse: gk.inputRaw.MouseButton) void {
    var ent = characterMixin(reg, x, y, mouse);
    var idle: []const gk.math.RectI = &.{
        .{.x=64*0,.y=0,.w=64,.h=64},
        .{.x=64*1,.y=0,.w=64,.h=64},
        .{.x=64*2,.y=0,.w=64,.h=64},
        .{.x=64*3,.y=0,.w=64,.h=64},
    };
    var run: []const gk.math.RectI = &.{
        .{.x=64*6,.y=0,.w=64,.h=64},
        .{.x=64*7,.y=0,.w=64,.h=64},
        .{.x=64*8,.y=0,.w=64,.h=64},
        .{.x=64*9,.y=0,.w=64,.h=64},
    };
    reg.add(ent, cmp.CharacterAnimation.init(8, idle, run));
    reg.add(ent, cmp.Brother{});
    reg.add(ent, cmp.Name.init("Brother Entity"));
    reg.add(ent, cmp.Sprite.initOrigin("content/Sheets/Brother.png", 0.5, 0.95));
}


pub fn spawnSister(reg: *ecs.Registry, x:f32,y:f32, mouse: gk.inputRaw.MouseButton) void {
    var ent = characterMixin(reg, x, y, mouse);
    reg.add(ent, cmp.Sprite.initOrigin("content/Sheets/Sister.png", 0.5, 0.95));
    var idle: []const gk.math.RectI = &.{
        .{.x=64*0,.y=0,.w=64,.h=64},
    };
    var run: []const gk.math.RectI = &.{
        .{.x=64*0,.y=0,.w=64,.h=64},

    };
    reg.add(ent, cmp.CharacterAnimation.init(8, idle, run));
    reg.add(ent, cmp.Sister{});
    reg.add(ent, cmp.Name.init("Sister Entity"));
}