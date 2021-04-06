const std = @import("std");
const gk = @import("gamekit");
const load = @import("../loader.zig");

/// Trait that lets you disable an entities visibility. Animation play logic will still
/// update in the background.
pub const Invisible = struct {};
pub const Position = struct {
    value: gk.math.Vec2 = .{},
    pub fn init(x: f32, y: f32) @This() {
        return .{ .value = .{ .x = x, .y = y } };
    }
};
pub const Bounds = struct {
    value: gk.math.Rect = .{},
    pub fn init(aabb: gk.math.Rect) @This() {
        return .{
            .value = aabb,
        };
    }
};
pub const Depth = struct {
    value: f32 = 0,
    pub fn init(val: f32) @This() {
        return .{ .value = val };
    }
};
pub const Sprite = struct {
    texture: gk.gfx.Texture = undefined,
    source: gk.math.RectI = .{},
    origin: gk.math.Vec2 = .{},
    hFlip: bool = false,
    vFlip: bool = false,
    pub fn init(path: []const u8) @This() {
        var tex = load.texture(path);
        return .{ .texture = tex, .source = .{ .x = 0, .y = 0., .w = @floatToInt(i32, tex.width), .h = @floatToInt(i32, tex.height) } };
    }
    pub fn initOrigin(path: []const u8, x: f32, y: f32) @This() {
        var tex = load.texture(path);
        return .{ .texture = tex, .source = .{ .x = 0, .y = 0., .w = @floatToInt(i32, tex.width), .h = @floatToInt(i32, tex.height) }, .origin = .{ .x = x, .y = y } };
    }
    pub fn initSrc(path: []const u8, x: i32, y: i32, w: i32, h: i32) @This() {
        return .{ .texture = load.texture(path), .source = .{ .x = x, .y = y, .w = w, .h = h } };
    }
    pub fn initSrcOrigin(path: []const u8, x: i32, y: i32, w: i32, h: i32, ox: f32, oy: f32) @This() {
        return .{ .texture = load.texture(path), .source = .{ .x = x, .y = y, .w = w, .h = h }, .origin = .{ .x = x, .y = y } };
    }
};
pub const Tilemap = struct {
    texture: gk.gfx.Texture = undefined,
    tileSize: f32 = 0.0,
    data: [][]i32 = undefined,
    xSize: i32 = 0,
    ySize: i32 = 0,
    sourceLookup: []gk.math.RectI = undefined,

    allocator: *std.mem.Allocator = undefined,

    pub fn init(allocator: *std.mem.Allocator, texture: []const u8, size: f32, xTiles: i32, yTiles: i32) @This() {
        var ret: @This() = .{
            .texture = load.texture(texture),
            .tileSize = size,
            .data = allocator.alloc([]i32,@intCast(usize,yTiles)) catch unreachable,
            .xSize = xTiles,
            .ySize = yTiles,
            .allocator = allocator
        };

        for(ret.data) |*dat| {
            dat.* = allocator.alloc(i32, @intCast(usize,xTiles)) catch unreachable;
            for(dat.*) |*cell| {
                cell.* = -1;
            }
        }

        const textureXTiles = @floatToInt(i32, @round(ret.texture.width / size));
        const textureYTiles = @floatToInt(i32, @round(ret.texture.height / size));

        ret.sourceLookup = allocator.alloc(gk.math.RectI, @intCast(usize, textureXTiles * textureYTiles)) catch unreachable;
        const sizeInt = @floatToInt(i32, ret.tileSize);

        var y: i32 = 0;
        while(y<textureYTiles) {
            var x: i32 = 0;
            while(x<textureXTiles) {
                ret.sourceLookup[@intCast(usize, textureXTiles * x + y)] = .{
                    .x=y*sizeInt,
                    .y=x*sizeInt,
                    .w=sizeInt,
                    .h=sizeInt
                };
                x += 1;
            }
            y+=1;
        }

        return ret;
    }
    pub fn deinit(self:*Tilemap) void {
        self.allocator.free(self.data);
    }
    pub fn readTilemapData(filepath: []const u8) []usize {}
};
pub const CharacterAnimation = struct {
    pub const Tag = enum { Run, Idle };
    fps: i32 = 8,
    cycle: f32 = 0,
    idle: []const gk.math.RectI = undefined,
    run: []const gk.math.RectI = undefined,
    currentFrame: usize = 0,
    currentAnimation: Tag = .Idle,
    pub fn init(fps: i32, idle: []const gk.math.RectI, run: []const gk.math.RectI) @This() {
        var value = @This(){ .fps = fps, .idle = idle, .run = run };
        return value;
    }
    pub fn set(self: *CharacterAnimation, newAnim: Tag) void {
        if (newAnim == self.currentAnimation) return;
        self.currentAnimation = newAnim;
        self.currentFrame = 0;
    }
};
pub const ParticleSystem = struct {
    pub const Particle = struct { baseSize: gk.math.Vec2 = .{}, offset: gk.math.Vec2 = .{}, rotation: f32 = 0, scale: f32 = 1, life: f32 = 0, texIndex: i32 = 0, seed: i32 = 0, system: *ParticleSystem = undefined };

    spawnCycle: f32 = 0.075,
    currentSpawnTimer: f32 = 0,
    particles: []Particle = undefined,
    liveParticles: usize = 0,
    spawner: fn (*Particle) void = undefined,
    affector: fn (*Particle) void = undefined,
    lifeTime: f32 = -1,
    textureSheet: gk.gfx.Texture = undefined,
    sheetTileSize: i32 = 16,
    maxTiles: i32 = 0,

    allocator: *std.mem.Allocator,

    pub fn init(alloc: *std.mem.Allocator, texture: gk.gfx.Texture, tileSize: i32, max_particles: usize, affectFn: fn (*Particle) void, spawnFn: fn (*Particle) void) @This() {
        var part_array: []Particle = alloc.alloc(Particle, max_particles) catch unreachable;
        var self: @This() = .{
            .allocator = alloc,
            .particles = part_array,
            .affector = affectFn,
            .spawner = spawnFn,
            .sheetTileSize = tileSize,
            .textureSheet = texture,
            .maxTiles = @floatToInt(i32, texture.width / @intToFloat(f32, tileSize)),
        };

        for (self.particles) |*p| {
            p.system = &self;
        }

        return self;
    }
    pub fn deinit(self: @This()) void {
        self.allocator.free(self.particles);
    }
};
