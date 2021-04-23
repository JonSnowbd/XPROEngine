const std = @import("std");
const xpro = @import("xpro.zig");
const ray = @import("raylib");

const textureHashType = std.StringHashMap(xpro.Texture);
var textureHash: textureHashType = undefined;
var allocator: *std.mem.Allocator = undefined;

pub fn init(alloc:*std.mem.Allocator) void {
    allocator = alloc;
    textureHash = textureHashType.init(allocator);
}
pub fn deinit() void {
    textureHash.deinit();
}

pub fn texture(path: []const u8) xpro.Texture {
    if(textureHash.contains(path)) {
        var ret = textureHash.get(path);
        return ret.?;
    }
    var tex = xpro.Texture.init(path.ptr);
    textureHash.put(path, tex) catch unreachable;
    std.debug.print("Successfully loaded texture: {s}\n", .{path});
    return tex;
}
pub fn textureImgui(path: []const u8) *c_void {
    return texture(path).forImgui();
}