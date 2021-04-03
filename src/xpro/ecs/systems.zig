const std = @import("std");
const ecs = @import("ecs");
const gk = @import("gamekit");
const cmp = @import("components.zig");
const render = @import("../rendering.zig");
const xpro = @import("../core.zig");


pub fn updateCharacterInput(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.CharacterInput}, .{});
    var iter = view.iterator();

    for(view.raw()) |*inp| {
        inp.queuedAction = .Nothing;

        if(gk.input.mousePressed(inp.mouseButton)) {
            if(gk.input.keyDown(gk.inputRaw.Keys.q)) {
                inp.queuedAction = .LightOrder;
                continue;
            }
            if(gk.input.keyDown(gk.inputRaw.Keys.w)) {
                inp.queuedAction = .HeavyOrder;
                continue;
            }
            if(gk.input.keyDown(gk.inputRaw.Keys.e)) {
                inp.queuedAction = .MobilityOrder;
                continue;
            }
            inp.queuedAction = .MoveOrder;
        }
    }
}
pub fn updateBrotherSystem(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.CharacterInput, cmp.Brother, cmp.Position}, .{});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        var pos = view.get(cmp.Position, ent);
        var brother = view.get(cmp.Brother, ent);
        var inp = view.get(cmp.CharacterInput, ent);

        if(inp.queuedAction == .MoveOrder) {
            brother.moving = true;
            brother.movementTarget = xpro.world_mouse_pos;
            inp.queuedAction = .Nothing;
        }

        if(brother.moving) {
            var diff = brother.movementTarget.subv(pos.value).normalize();
            if(pos.value.distance(brother.movementTarget) < (100.0 * xpro.dt)) {
                pos.value = brother.movementTarget;
                brother.moving = false;
            } else{
                pos.value = pos.value.addv(diff.scale(100.0 * xpro.dt));
            }
        }
    }
}
pub fn updateAnimation(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Sprite, cmp.CharacterAnimation}, .{cmp.Invisible});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        var anim = view.get(cmp.CharacterAnimation, ent);
        var sprite = view.get(cmp.Sprite, ent);

        const requiredDelta: f32 = 1.0/@intToFloat(f32, anim.fps);
        anim.cycle += xpro.dt;
        if(anim.cycle >requiredDelta) {
            anim.cycle -= requiredDelta;
            anim.currentFrame += 1;
            if(anim.currentFrame >= anim.idle.len) {
                anim.currentFrame = 0;
            }
        }
        sprite.source = anim.idle[anim.currentFrame];
    }
}

pub const GameCameraUpdateStyle = enum {
    First,
    Last,
    Averaged
};
pub fn updateGameCamera(reg: *ecs.Registry, style: GameCameraUpdateStyle) void {
    var view = ecs.Registry.view(reg, .{cmp.CameraFocus, cmp.Position}, .{cmp.Invisible});
    var iter = view.iterator();

    var total = gk.math.Vec2{};
    var last = gk.math.Vec2{};
    var count: i32 = 0;

    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        if(count == 0 and style == .First) {
            xpro.cam.pos = pos.value;
            return;
        }
        last = pos.value;
        total = total.addv(pos.value);
        count += 1;
    }
    if(style == .Averaged) {
        xpro.cam.pos = total.scaleDiv(@intToFloat(f32, count));
    }
    if(style == .Last) {
        xpro.cam.pos = last;
    }
}
pub fn drawSprites(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Position, cmp.Sprite, cmp.Depth}, .{cmp.Invisible});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        const spr = view.getConst(cmp.Sprite, ent);
        const depth = view.getConst(cmp.Depth, ent);

        var matrix = gk.math.Mat32.identity;
        matrix.translate(pos.value.x, pos.value.y);
        matrix.translate(-(@intToFloat(f32,spr.source.w) * spr.origin.x), -(@intToFloat(f32,spr.source.h) * spr.origin.y));
        render.tex(depth.value, matrix, spr.texture, spr.source, pos.value.y);
        render.rect(depth.value, pos.value.x-1, pos.value.y-1, 2,2, gk.math.Color.pink, null);
    }
}
pub fn drawParticleSystems(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Position, cmp.ParticleSystem, cmp.Depth}, .{cmp.Invisible});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        const depth = view.getConst(cmp.Depth, ent);
        var particle = view.get(cmp.ParticleSystem, ent);

        xpro.render.rect(10, pos.value.x-1, pos.value.y-1, 2, 2, gk.math.Color.red, null);

        if(particle.currentSpawnTimer < 0 and particle.liveParticles < particle.particles.len) {
            particle.spawner(&particle.particles[particle.liveParticles]);
            particle.liveParticles += 1;
            particle.currentSpawnTimer += particle.spawnCycle;
        }
        particle.currentSpawnTimer -= xpro.dt;

        if(particle.lifeTime != -1 and particle.lifeTime > 0.0) {
            particle.lifeTime -= xpro.dt;
        }

        for(particle.particles) |*p, index| {
            if(index > particle.liveParticles) {
                break;
            }
            if(p.*.life >= 0.0) {
                p.*.life -= xpro.dt;
                if(p.*.life < 0.0) {
                    p.* = particle.particles[particle.liveParticles-1];
                    particle.liveParticles -= 1;
                }
            } else {
                continue;
            }
            particle.affector(p);
            
            var mat = gk.math.Mat32.identity;

            var o: f32 = (@intToFloat(f32, particle.sheetTileSize) * 0.5);
            mat.translate(pos.value.x+p.*.offset.x - o, pos.value.y+p.*.offset.y - o);
            xpro.render.tex(depth.value,mat,particle.textureSheet,.{
                .x = p.*.texIndex * particle.sheetTileSize,
                .y = 0,
                .w = particle.sheetTileSize,
                .h = particle.sheetTileSize
            }, pos.value.y);
        }
    }
}