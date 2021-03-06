const std = @import("std");
const xpro = @import("../xpro.zig");
const ecs = @import("ecs");

const cmp = xpro.components;

/// Creates an entity with components required for it to be a drawable sprite.
/// Consider getting and editing the sprite component afterwards if you need a source rect.
pub fn spriteCreate(reg: *xpro.World, x:f32, y:f32, depth:f32, texturePath: []const u8, originX: f32, originY: f32) xpro.Entity {
    var entity = reg.create();
    sprite(reg,entity,x,y,depth,texturePath, originX, originY);
    return entity;
}
/// Hooks up an entity with any missing components required for it to be a drawable sprite.
/// Consider getting and editing the sprite component afterwards if you need a source rect.
pub fn sprite(reg: *xpro.World, ent: xpro.Entity, x:f32, y:f32, depth:f32, texturePath: []const u8, originX: f32, originY: f32) void {
    if(!reg.has(cmp.Position, ent))
        reg.add(ent, cmp.Position.init(x,y));
    if(!reg.has(cmp.Depth, ent))
        reg.add(ent, cmp.Depth.init(depth));
    if(!reg.has(cmp.Sprite, ent))
        reg.add(ent, cmp.Sprite.initOrigin(texturePath, originX, originY));
}

pub fn editable(reg: *xpro.World, ent: xpro.Entity, name: []const u8, editFunc: cmp.Editable.fnSignature) void {
    if(!reg.has(cmp.Editable))
        reg.add(ent, cmp.Editable.init(editFunc));
    if(!reg.has(cmp.Name))
        reg.add(ent, cmp.Name.init(name));
}

pub fn particleSystemCreate(reg: *xpro.World, allocator: *std.mem.Allocator, x:f32, y:f32, depth:f32, texturePath: []const u8, tileSize: i32, maxParticles: usize, affector: fn (*Particle) void, spawner: fn (*Particle) void) xpro.Entity {
    var entity = reg.create();
    particleSystem(reg, entity, allocator, x, y, depth, texturePath, tileSize, maxParticles, affector, spawner);
    return entity;
}

const Particle = xpro.component.ParticleSystem.Particle;
pub fn particleSystem(reg: *xpro.World, ent: xpro.Entity, allocator: *std.mem.Allocator, x:f32, y:f32, depth:f32, texturePath: []const u8, tileSize: i32, maxParticles: usize, affector: fn (*Particle) void, spawner: fn (*Particle) void) void {
    if(!reg.has(cmp.Position, ent))
        reg.add(ent, cmp.Position.init(x,y));
    if(!reg.has(cmp.Depth, ent))
        reg.add(ent, cmp.Depth.init(depth));
    if(!reg.has(cmp.ParticleSystem, ent))
        reg.add(ent, cmp.ParticleSystem.init(allocator, xpro.load.texture(texturePath), tileSize, maxParticles, affector, spawner));
}