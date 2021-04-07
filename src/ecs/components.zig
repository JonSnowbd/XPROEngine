const std = @import("std");
const xpro = @import("../xpro.zig");
const ecs = @import("ecs");
const gk = @import("gamekit");

pub usingnamespace @import("components.render.zig");
pub usingnamespace @import("components.update.zig");

pub const Name = struct {
    value: []const u8,
    pub fn init(val: []const u8) @This() {
        return .{
            .value=val
        };
    }
};
pub const Editable = struct{
    editor: ?fn(*xpro.scene.Container, *ecs.Registry, ecs.Entity) void = null,
    pub fn init(editFn: ?fn(*xpro.scene.Container, *ecs.Registry, ecs.Entity) void) @This() {
        return .{
            .editor=editFn,
        };
    }
};
