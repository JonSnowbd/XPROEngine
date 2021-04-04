const std = @import("std");
const gk = @import("gamekit");
const load = @import("../loader.zig");

// Traits
pub const Invisible = struct{};
pub const CameraFocus = struct{};

pub const Position = struct{
    value:gk.math.Vec2 = .{},
    pub fn init(x:f32, y:f32) @This() {
        return .{.value=.{.x=x, .y=y }};
    }
};
pub const Bounds = struct {
    value:gk.math.Rect = .{},
};
pub const Depth = struct {
    value:f32 = 0,
};
pub const Sprite = struct {
    texture: gk.gfx.Texture = undefined,
    source: gk.math.RectI = .{},
    origin: gk.math.Vec2 = .{},
    hFlip: bool = false,
    vFlip: bool = false,
    pub fn init(path: []const u8) @This() {
        var tex = load.texture(path);
        return .{
            .texture=tex,
            .source=.{.x=0,.y=0.,.w=@floatToInt(i32, tex.width),.h=@floatToInt(i32, tex.height)}
        };
    }
    pub fn initOrigin(path: []const u8, x:f32, y:f32) @This() {
        var tex = load.texture(path);
        return .{
            .texture=tex,
            .source=.{.x=0,.y=0.,.w=@floatToInt(i32, tex.width),.h=@floatToInt(i32, tex.height)},
            .origin=.{.x=x,.y=y}
        }; 
    }
    pub fn initSrc(path: []const u8, x:i32,y:i32, w:i32,h:i32) @This() {
        return .{
            .texture=load.texture(path),
            .source = .{.x=x, .y=y, .w=w, .h=h}
        };
    }
};
pub const Tilemap = struct {
    texture: gk.gfx.Texture = undefined,
    tileSize: i32 = 0,


    pub fn init(texture: []const u8, size: i32) @This() {
        return .{
            .texture = load.texture(texture),
            .tileSize = size,
        };
    }

    pub fn readTilemapData(filepath: []const u8) []usize {

    }
};
pub const CharacterAnimation = struct {
    fps: i32 = 8,
    cycle:f32 = 0,
    idle: []const gk.math.RectI = undefined,
    currentFrame: usize = 0,
    pub fn init(fps:i32, idle: []const gk.math.RectI) @This() {
        var value = @This(){
            .fps = fps,
            .idle = idle,
        };
        return value;
    }
};
pub const CharacterInputType = enum(i32) {
    Nothing=-1,
    MoveOrder=0,
    LightOrder=1,
    HeavyOrder=2,
    MobilityOrder=3
};
pub const CharacterInput = struct {
    mouseButton: gk.inputRaw.MouseButton = gk.inputRaw.MouseButton.left,
    queuedAction: CharacterInputType = .Nothing,
    pub fn init(inputButton: gk.inputRaw.MouseButton) @This() {
        return @This(){.mouseButton=inputButton};
    }
};
pub const Brother = struct {
    movementTarget: gk.math.Vec2 = .{},
    moving: bool = false,
};
pub const ParticleSystem = struct {
    pub const Particle = struct {
        baseSize:gk.math.Vec2 = .{},
        offset:gk.math.Vec2 = .{},
        rotation:f32 = 0,
        scale:f32 = 1,
        life:f32 = 0,
        texIndex:i32 = 0,
        seed:i32 = 0,
        system: *ParticleSystem = undefined
    };

    spawnCycle: f32 = 0.075,
    currentSpawnTimer: f32 = 0,
    particles: []Particle = undefined,
    liveParticles: usize = 0,
    spawner: fn(*Particle) void = undefined,
    affector: fn(*Particle) void = undefined,
    lifeTime: f32 = -1,
    textureSheet: gk.gfx.Texture = undefined,
    sheetTileSize: i32 = 16,
    maxTiles:i32 = 0,

    allocator: *std.mem.Allocator,

    pub fn init(alloc:*std.mem.Allocator, texture:gk.gfx.Texture, tileSize:i32, max_particles:usize, affectFn: fn(*Particle) void, spawnFn: fn(*Particle) void) @This() {
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

        for(self.particles) |*p| {
            p.system = &self;
        }

        return self;
    }
    pub fn deinit(self: @This()) void {
        self.allocator.free(self.particles);
    }
};