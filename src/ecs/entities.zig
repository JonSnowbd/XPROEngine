const std = @import("std");
const xpro = @import("../xpro.zig");
const ecs = @import("ecs");

const cmp = @import("components.zig");

/// Creates an entity with components required for it to be a drawable sprite.
/// Consider getting and editing the sprite component afterwards if you need a source rect.
pub fn spriteCreate(reg: *ecs.Registry, x:f32, y:f32, depth:f32, texturePath: []const u8) ecs.Entity {
    var entity = reg.create();
    sprite(reg,entity,x,y,depth,texturePath);
    return entity;
}
/// Hooks up an entity with any missing components required for it to be a drawable sprite.
/// Consider getting and editing the sprite component afterwards if you need a source rect.
pub fn sprite(reg: *ecs.Registry, ent: ecs.Entity, x:f32, y:f32, depth:f32, texturePath: []const u8) void {
    if(!reg.has(cmp.Position, ent))
        reg.add(ent, cmp.Position.init(x,y));
    if(!reg.has(cmp.Depth, ent))
        reg.add(ent, cmp.Depth.init(depth));
    if(!reg.has(cmp.Sprite, ent))
        reg.add(ent, cmp.Sprite.init(texturePath));
}

pub fn particleSystemCreate(reg: *ecs.Registry, allocator: *std.mem.Allocator, x:f32, y:f32, depth:f32, texturePath: []const u8, tileSize: i32, maxParticles: usize, affector: fn (*Particle) void, spawner: fn (*Particle) void) ecs.Entity {
    var entity = reg.create();
    particleSystem(reg, entity, allocator, x, y, depth, texturePath, tileSize, maxParticles, affector, spawner);
    return entity;
}

const Particle = xpro.component.ParticleSystem.Particle;
pub fn particleSystem(reg: *ecs.Registry, ent: ecs.Entity, allocator: *std.mem.Allocator, x:f32, y:f32, depth:f32, texturePath: []const u8, tileSize: i32, maxParticles: usize, affector: fn (*Particle) void, spawner: fn (*Particle) void) void {
    if(!reg.has(cmp.Position, ent))
        reg.add(ent, cmp.Position.init(x,y));
    if(!reg.has(cmp.Depth, ent))
        reg.add(ent, cmp.Depth.init(depth));
    if(!reg.has(cmp.ParticleSystem, ent))
        reg.add(ent, cmp.ParticleSystem.init(allocator, xpro.load.texture(texturePath), tileSize, maxParticles, affector, spawner));
}