const xpro = @import("xpro.zig");
const std = @import("std");

pub usingnamespace @import("imgui");

/// Creates an image centered and taking max width. Good for header images.
pub fn igXproSpanImage(texturePath: []const u8) void {
    var tex = xpro.load.texture(texturePath);
    var sp = igGetWindowContentRegionWidth();
    igImage(tex.forImgui(), ImVec2{.x=sp,.y=sp * (@intToFloat(f32,tex.height) / @intToFloat(f32,tex.width))}, ImVec2.zero, ImVec2.one, ImVec4.white, ImVec4.transparent);
} 

pub fn igXproImage(texturePath: []const u8, size:ImVec2, fill:ImVec4, border:ImVec4) void {
    var tex = xpro.load.texture(texturePath);
    var sp = igGetWindowContentRegionWidth();
    igImage(tex.forImgui(), size, ImVec2.zero, ImVec2.one, fill, border);
}

pub fn igFmtText(comptime fmtStr: []const u8, args: anytype) void {
    var string: []const u8 = xpro.mem.ringBuffer.dupeZ(u8,std.fmt.allocPrint(xpro.mem.ringBuffer, fmtStr, args) catch unreachable) catch unreachable;
    igText(string.ptr);
}