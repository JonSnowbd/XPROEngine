const std = @import("std");
const gk = @import("gamekit");
const ecs = @import("ecs");
const xpro = @import("../xpro.zig");

const cmp = @import("components.zig");

pub fn spriteCreate(reg: *ecs.Registry, x:f32, y:f32, depth:f32, texturePath: []const u8) ecs.Entity {
    var entity = reg.create();
    sprite(reg,entity,x,y,depth,texturePath);
    return entity;
}
pub fn sprite(reg: *ecs.Registry, ent: ecs.Entity, x:f32, y:f32, depth:f32, texturePath: []const u8) void {
    if(!reg.has(cmp.Position, ent))
        reg.add(ent, cmp.Position.init(x,y));
    if(!reg.has(cmp.Depth, ent))
        reg.add(ent, cmp.Depth.init(depth));
    if(!reg.has(cmp.Sprite, ent))
        reg.add(ent, cmp.Sprite.init(texturePath));
}