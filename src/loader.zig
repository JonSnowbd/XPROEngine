const std = @import("std");
const gk = @import("gamekit");

const textureHashType = std.StringHashMap(gk.gfx.Texture);
var textureHash: textureHashType = undefined;
var allocator: *std.mem.Allocator = undefined;

pub fn init(alloc:*std.mem.Allocator) void {
    allocator = alloc;
    textureHash = textureHashType.init(allocator);
}
pub fn deinit() void {
    textureHash.deinit();
}

pub fn texture(path: []const u8) gk.gfx.Texture {
    if(textureHash.contains(path)) {
        var ret = textureHash.get(path);
        return ret.?;
    }
    var tex = gk.gfx.Texture.initFromFile(allocator, path, gk.renderkit.TextureFilter.nearest) catch unreachable;
    textureHash.put(path, tex) catch unreachable;
    std.debug.print("Successfully loaded texture: {s}\n", .{path});
    return tex;
}