const std = @import("std");
const gk = @import("gamekit");
const load = @import("../loader.zig");
const xpro = @import("../xpro.zig");
const ecs = @import("ecs");

pub usingnamespace @import("components.render.zig");
pub usingnamespace @import("components.update.zig");
pub usingnamespace @import("components.hero.zig");

pub const Name = struct {
    value: []const u8,
    pub fn init(val: []const u8) @This() {
        return .{
            .value=val
        };
    }
};
pub const Editable = struct{
    editor: ?fn(*xpro.scene.BasicScene, *ecs.Registry, ecs.Entity) void = null,
    pub fn init(editFn: ?fn(*xpro.scene.BasicScene, *ecs.Registry, ecs.Entity) void) @This() {
        return .{
            .editor=editFn,
        };
    }
};
