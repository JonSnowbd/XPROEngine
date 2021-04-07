const std = @import("std");
const ecs = @import("ecs");
const cmp = @import("components.zig");


pub const Container = struct {
    register: ecs.Registry = undefined,
    allocator: *std.mem.Allocator = undefined,
    updateFn: fn(*Container) void = undefined,
    shutdownFn: ?fn(*Container) void = null,
    pub fn init(_alloc:*std.mem.Allocator, function: fn (*Container) void) @This() {
        var val = @This(){
            .register = ecs.Registry.init(_alloc),
            .allocator = _alloc,
            .updateFn = function
        };
        return val;
    }
    pub fn deinit(self:*Container) void  {
        self.register.deinit();
        if(self.shutdownFn) {
            self.shutdownFn(self);
        }
    }
    pub fn parent(self: *Container, comptime T: type) *T {
        return @fieldParentPtr(T, "scene", self);
    }
};