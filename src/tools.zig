const editor = @import("tools/editor.zig");
const console = @import("tools/console.zig");
const xpro = @import("xpro.zig");

const std = @import("std");

var allocator: *std.mem.Allocator = undefined;

pub fn init(alloc: *std.mem.Allocator) void {
    allocator = alloc;
    console.init(allocator);
    editor.prefabs = std.ArrayList(editor.prefabPair).init(allocator);
}

/// `filePath` is the pseudo file path of the scene, used for saving and loading.
pub fn run(filePath: []const u8, scene: *xpro.scene.Container) void {
    if(xpro.debug) {
        editor.run(filePath, scene);
        console.run();
    }
}

// Console related functions
pub fn log(message: []const u8) void {
    if(console.log.items.len + 1 >= 100) { // TODO: Swap to a FIFO structure for log, then up the limit.
        var msg = console.log.orderedRemove(0);
        allocator.free(msg);
    }
    var ownedMessage: []const u8 = allocator.dupeZ(u8, message) catch unreachable;
    std.debug.print("{s}\n", .{message});
    console.log.append(ownedMessage) catch unreachable;
}
pub fn logFmt(comptime fmt: []const u8, args: anytype) void {
    if(console.log.items.len + 1 > 100) { // TODO: Swap to a FIFO structure for log, then up the limit.
        var msg = console.log.orderedRemove(0);
        allocator.free(msg);
    }
    var fmtComp = std.fmt.allocPrint(xpro.mem.ringBuffer, fmt, args) catch unreachable;
    var ownedMessage: []const u8 = allocator.dupeZ(u8, fmtComp) catch unreachable;
    std.debug.print("{s}\n", .{ownedMessage});
    console.log.append(ownedMessage) catch unreachable;
}
pub fn registerCommand(command: []const u8, func: fn([]const u8) void) void {
    if(!console.cmds.contains(command)) {
        console.cmds.put(command, func) catch unreachable;
    }
}

// Library related functions
pub fn registerPrefab(prefabName: []const u8, prefabFn: fn() xpro.Entity) void {
    editor.prefabs.append(editor.prefabPair{.name=prefabName,.spawnFn=prefabFn}) catch unreachable;
}
pub fn registerPrefabCategory(catName: []const u8) void {
    editor.prefabs.append(editor.prefabPair{.name=catName, .spawnFn=null}) catch unreachable;
}