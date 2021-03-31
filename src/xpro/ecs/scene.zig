const std = @import("std");
const ecs = @import("ecs");
const cmp = @import("components.zig");


pub const BasicScene = struct {
    register: ecs.Registry,
    allocator: *std.mem.Allocator,
    updateFn: fn(*BasicScene) void,
    shutdownFn: ?fn(*BasicScene) void = null,
    pub fn init(_alloc:*std.mem.Allocator, function: fn (*BasicScene) void) @This() {
        var val = @This(){
            .register = ecs.Registry.init(_alloc),
            .allocator = _alloc,
            .updateFn = function
        };
        return val;
    }
    pub fn deinit(self:*BasicScene) void  {
        self.register.deinit();
        if(self.shutdownFn) {
            self.shutdownFn(self);
        }
    }
    pub fn parent(self: *BasicScene, comptime T: type) *T {
        return @fieldParentPtr(T, "scene", self);
    }
};