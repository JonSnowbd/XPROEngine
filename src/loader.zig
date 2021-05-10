const std = @import("std");
const xpro = @import("xpro.zig");
const ray = xpro.raylib;

// Loaded container generic container.
fn LoadContainer(comptime T: type, initFromPathFn: fn([]const u8) T) type {
    return struct {
        /// A function that takes the absolute path of an asset and loads it.
        pub const initFn: fn([]const u8) T = initFromPathFn;
        /// The string hashmap of (absolute asset path -> asset)
        pub var hash: std.StringHashMap(T) = undefined;

        pub fn init(alloc: *std.mem.Allocator) void {
            @This().hash = std.StringHashMap(T).init(alloc);
        }
        pub fn deinit() void {}
        pub fn get(path: []const u8) T {
            var truePath = std.fs.path.join(xpro.mem.ringBuffer, &[_][]const u8{xpro.basePath,path}) catch unreachable;
            if(@This().hash.contains(truePath)) {
                var retrievedValue = @This().hash.get(truePath);
                return retrievedValue.?;
            }
            var value: T = @This().initFn(truePath);
            @This().hash.put(truePath, value) catch unreachable;
            xpro.tools.logFmt("Loaded {s} asset: {s}", .{@typeName(T), truePath});
            return value;
        }
    }; 
}

// Definitions
fn initTexturefromPath(path: []const u8) xpro.Texture { 
    var delimited: []const u8 = xpro.mem.ringBuffer.dupeZ(u8, path) catch unreachable;
    return xpro.raylib.LoadTexture(delimited.ptr);
}
const TextureContainer = LoadContainer(xpro.Texture, initTexturefromPath);

fn initImageFromPath(path: []const u8) xpro.Image { 
    var delimited: []const u8 = xpro.mem.ringBuffer.dupeZ(u8, path) catch unreachable;
    return xpro.raylib.LoadImage(delimited.ptr);
}
const ImageContainer = LoadContainer(xpro.Image, initImageFromPath);

fn initFontFromPath(path: []const u8) xpro.Font {
    var delimited: []const u8 = xpro.mem.ringBuffer.dupeZ(u8, path) catch unreachable;
    return xpro.raylib.LoadFont(delimited.ptr);
}
const FontContainer = LoadContainer(xpro.Font, initFontFromPath);

// Initialization
var allocator: *std.mem.Allocator = undefined;
pub fn init(alloc:*std.mem.Allocator) void {
    allocator = alloc;
    TextureContainer.init(allocator);
    ImageContainer.init(allocator);
    FontContainer.init(allocator);
}
pub fn deinit() void {
    TextureContainer.deinit();
    ImageContainer.deinit();
    FontContainer.deinit();
}

// Forwards
pub fn texture(path: []const u8) xpro.Texture {
    return TextureContainer.get(path);
}
pub fn textureImgui(path: []const u8) *c_void {
    return texture(path).forImgui();
}
pub fn image(path: []const u8) xpro.Image {
    return ImageContainer.get(path);
}
pub fn font(path: []const u8) xpro.Font {
    return FontContainer.get(path);
}