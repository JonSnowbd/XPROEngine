const std = @import("std");
const xpro = @import("xpro");
const cmp = xpro.ecs.component;

pub fn reverseGravityAffector(particle: *cmp.ParticleSystem.Particle) void {
    particle.*.offset.y -= 75 * xpro.dt;
}

var seed: u64 = 0; //
pub fn pointSpawner(particle: *cmp.ParticleSystem.Particle) void {
    var rng = std.rand.Isaac64.init(seed);
    if(seed > 380135830) { seed = 0; } // arbitrary overflow avoidance :')
    seed += 1;
    particle.*.texIndex = 0;
    particle.*.baseSize = .{.x=10,.y=10};
    particle.*.rotation = 0.0;
    particle.*.scale = 1.0;
    particle.*.life = 0.1 + rng.random.float(f32);
    particle.*.seed = rng.random.int(i32);
    particle.*.offset = .{
        .x=@intToFloat(f32, std.rand.Random.intRangeAtMost(&rng.random, i32, -5,5)),
        .y=@intToFloat(f32, std.rand.Random.intRangeAtMost(&rng.random, i32, -5,5)),
    };
}