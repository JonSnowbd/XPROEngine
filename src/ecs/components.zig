const std = @import("std");
const xpro = @import("../xpro.zig");
const ecs = @import("ecs");
const gk = @import("gamekit");

const load = xpro.load;

pub const SpatialHashSingleton = struct {
    pub const Presence = struct {
        x: usize,
        y: usize,
        xSpan: usize,
        ySpan: usize
    };
    pub const HashMap = std.AutoHashMap(ecs.Entity, Presence);

    lookup: HashMap,
};

/// Mostly of debug value, this names an entity.
pub const Name = struct {
    value: []const u8,
    pub fn init(val: []const u8) @This() {
        return .{
            .value=val
        };
    }
};
/// For debugging, marks an entity as editable in imgui.
pub const Editable = struct{
    editor: ?fn(*xpro.scene.Container, *ecs.Registry, ecs.Entity) void = null,
    pub fn init(editFn: ?fn(*xpro.scene.Container, *ecs.Registry, ecs.Entity) void) @This() {
        return .{
            .editor=editFn,
        };
    }
};
/// Marks an entity as a point of focus for the camera to track.
pub const CameraFocus = struct{};
/// Gives an entity a colliders with given offset and size. Supports only circle and rectangle.
pub const Collider = struct {
    pub const Type = enum {
        circle,
        rectangle
    };
    colliderType: Type = .rectangle,
    offset: gk.math.Vec2 = .{},
    size: gk.math.Vec2 = .{},
    /// If important, expensive sweep collisions will be used for accurate movement.
    important: bool = true,

    /// This is centered.
    pub fn initRect(offsetX:f32,offsetY:f32,sizeX:f32,sizeY:f32) @This() {
        return .{
            .colliderType = .rectangle,
            .offset = .{.x=offsetX-(sizeX*0.5),.y=offsetY-(sizeY*0.5)},
            .size = .{.x=sizeX,.y=sizeY},
        };
    }
    pub fn initCirc(offsetX:f32,offsetY:f32,radius:f32) @This() {
        return .{
            .colliderType = .circle,
            .offset = .{.x=offsetX,.y=offsetY},
            .size = .{.x=radius,.y=radius},
        };
    }
};

/// Trait that lets you disable an entities visibility. Animation play logic will still
/// update in the background.
pub const Invisible = struct {};
pub const Position = struct {
    value: gk.math.Vec2 = .{},
    pub fn init(x: f32, y: f32) @This() {
        return .{ .value = .{ .x = x, .y = y } };
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
    /// Origin x+y are both normalized origins between 0 and 1.
    pub fn initOrigin(path: []const u8, x: f32, y: f32) @This() {
        var tex = load.texture(path);
        return .{ .texture = tex, .source = .{ .x = 0, .y = 0., .w = @floatToInt(i32, tex.width), .h = @floatToInt(i32, tex.height) }, .origin = .{ .x = x, .y = y } };
    }
    /// Init with a source rectangle.
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
