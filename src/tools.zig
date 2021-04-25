pub const editor = @import("tools/editor.zig");
pub const console = @import("tools/console.zig");

const std = @import("std");

pub fn init(allocator: *std.mem.Allocator) void {
    console.init(allocator);
}