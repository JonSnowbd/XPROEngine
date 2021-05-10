const xpro = @import("../xpro.zig");
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

pub fn igXProVector(label: []const u8, vec: *xpro.Vec) void {
    var values: [2]f32 = .{vec.x,vec.y};
    if(igInputFloat2(label.ptr,&values,"%.2f",ImGuiInputTextFlags_None)) {
        vec.x = values[0];
        vec.y = values[1];
    }
}
pub fn igXProColor(label: []const u8, col: *xpro.Color) void {
    var values: [4]f32 = .{
        @intToFloat(f32, col.r) / 255.0,
        @intToFloat(f32, col.g) / 255.0,
        @intToFloat(f32, col.b) / 255.0,
        @intToFloat(f32, col.a) / 255.0
    };
    if(xpro.imgui.igColorEdit4(label.ptr,&values,ImGuiColorEditFlags_DisplayRGB)) {
        col.r = @floatToInt(u8,std.math.clamp(255.0*values[0], 0, 255));
        col.g = @floatToInt(u8,std.math.clamp(255.0*values[1], 0, 255));
        col.b = @floatToInt(u8,std.math.clamp(255.0*values[2], 0, 255));
        col.a = @floatToInt(u8,std.math.clamp(255.0*values[3], 0, 255));
    }
}