const std = @import("std");
const ecs = @import("ecs");
const cmp = @import("components.zig");
const render = @import("../rendering.zig");
const xpro = @import("../xpro.zig");//gk

const balance = xpro.balance;

pub fn updateAttachments(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Position, cmp.AttachedTo}, .{});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        var pos = view.get(cmp.Position, ent);
        const attachment = view.getConst(cmp.AttachedTo, ent);

        if(!reg.has(cmp.Position, attachment.parent))
            continue;

        const target = view.getConst(cmp.Position, attachment.parent);

        pos.value = target.value.addv(attachment.offset);
    } 
}
pub fn updateAnimation(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Sprite, cmp.Animation}, .{cmp.Invisible});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        var anim: *cmp.Animation = view.get(cmp.Animation, ent);
        var sprite: *cmp.Sprite = view.get(cmp.Sprite, ent);

        const requiredDelta: f32 = 1.0/@intToFloat(f32, anim.fps);
        anim.cycle += xpro.dt;
        if(anim.cycle >requiredDelta) {
            anim.cycle -= requiredDelta;
            anim.currentFrame += 1;
            if(anim.currentFrame >= anim.currentAnimation.len) {
                anim.currentFrame = 0;
            }
        }
        sprite.source = anim.currentAnimation[anim.currentFrame];
    }
}

pub const GameCameraUpdateStyle = enum {
    First,
    Last,
    Averaged
};
pub fn updateGameCamera(reg: *ecs.Registry, style: GameCameraUpdateStyle) void {
    if(xpro.debug)
        return;
    
    var view = ecs.Registry.view(reg, .{cmp.CameraFocus, cmp.Position}, .{cmp.Invisible});
    var iter = view.iterator();
    if(iter.entities.len == 0) { return; }

    var total = xpro.Vec{};
    var last = xpro.Vec{};
    var count: i32 = 0;

    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        if(count == 0 and style == .First) {
            xpro.cam.target = pos.value;
            return;
        }
        last = pos.value;
        total = total.addv(pos.value);
        count += 1;
    }
    if(style == .Averaged) {
        xpro.cam.target = total.scaleDiv(@intToFloat(f32, count));
    }
    if(style == .Last) {
        xpro.cam.target = last;
    }
}
pub fn drawSprites(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Position, cmp.Sprite, cmp.Depth}, .{cmp.Invisible});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        const spr = view.getConst(cmp.Sprite, ent);
        const depth = view.getConst(cmp.Depth, ent);

        var dest = xpro.Vec{.x=spr.source.width,.y=spr.source.height};
        render.tex(depth.value, pos.value, spr.texture,dest, spr.source, pos.value.y);

        if(xpro.debug){
            render.rect(depth.value, pos.value.x-1, pos.value.y-1, 2,2, xpro.Color{}, null);
        }
    }
}
pub fn drawShadows(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Position, cmp.Shadow, cmp.Depth}, .{cmp.Invisible});
    var iter = view.iterator();
    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        const shad = view.getConst(cmp.Shadow, ent);
        const depth = view.getConst(cmp.Depth, ent);

        render.ellipse(depth.value, pos.value.x, pos.value.y, shad.size.x, shad.size.y, 9, xpro.Color{.r=0,.g=0,.b=0,.a=100}, pos.value.y-0.001);
    }
}
pub fn drawParticleSystems(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Position, cmp.ParticleSystem, cmp.Depth}, .{cmp.Invisible});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        const depth = view.getConst(cmp.Depth, ent);
        var particle = view.get(cmp.ParticleSystem, ent);

        if(xpro.debug)
            render.rect(depth.value, pos.value.x-1, pos.value.y-1, 2,2, xpro.Color{}, null);

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

            var o: f32 = (@intToFloat(f32, particle.sheetTileSize) * 0.5);
            var finalPos = xpro.Vec{.x=pos.value.x+p.*.offset.x - o, .y=pos.value.y+p.*.offset.y - o};
            var size = xpro.Vec{.x=@intToFloat(f32,particle.sheetTileSize),.y=@intToFloat(f32,particle.sheetTileSize)};
            xpro.render.tex(depth.value,finalPos,particle.textureSheet, size,.{
                .x = @intToFloat(f32, p.*.texIndex * particle.sheetTileSize),
                .y = 0,
                .width = @intToFloat(f32,particle.sheetTileSize),
                .height = @intToFloat(f32,particle.sheetTileSize)
            }, pos.value.y);
            if(xpro.debug)
                xpro.render.rect(depth.value, pos.value.x+p.*.offset.x - o-1, pos.value.y+p.*.offset.y - o-1, 2,2, xpro.theme.Debug, null);
        }
    }
}
pub fn drawTilemaps(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Position, cmp.Tilemap, cmp.Depth}, .{cmp.Invisible});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        const depth = view.getConst(cmp.Depth, ent);
        var tile = view.get(cmp.Tilemap, ent);

        if(xpro.debug)
            render.rectHollow(depth.value, pos.value.x, pos.value.y, @intToFloat(f32, tile.xSize) * tile.tileSize, @intToFloat(f32, tile.ySize) * tile.tileSize, 1, xpro.theme.Debug, null);

        for(tile.data) |row, y| {
            for(row) |data, x| {
                if(data == -1) continue;

                // var u = @intCast(usize, data);

                // var yPos = pos.value.y + @intToFloat(f32, y) * tile.tileSize;
                // var finalPos = xpro.Vec{.x=pos.value.x + @intToFloat(f32, x) * tile.tileSize, .y=yPos};
                // render.tex(depth.value, mat, tile.texture, tile.sourceLookup[u], yPos);
            }

        }
    }
}

pub fn defaultDrawSystems(reg: *ecs.Registry) void {
    drawShadows(reg);
    drawSprites(reg);
    drawParticleSystems(reg);
    drawTilemaps(reg);
}
pub fn defaultUpdateSystems(reg: *ecs.Registry) void {
    updateAnimation(reg);
    updateGameCamera(reg, .Averaged);
    updateAttachments(reg);
}