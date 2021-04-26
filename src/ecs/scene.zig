const std = @import("std");
const xpro = @import("../xpro.zig");
const ecs = @import("ecs");

pub const Container = struct {
    world: xpro.World = undefined,
    allocator: *std.mem.Allocator = undefined,
    updateFn: fn(*Container) void = undefined,
    shutdownFn: ?fn(*Container) void = null,
    pub fn init(_alloc:*std.mem.Allocator, function: fn (*Container) void) @This() {
        var val = @This(){
            .world = xpro.World.init(_alloc),
            .allocator = _alloc,
            .updateFn = function
        };
        return val;
    }
    pub fn deinit(self:*Container) void  {
        self.world.deinit();
        if(self.shutdownFn) {
            self.shutdownFn(self);
        }
    }
    pub fn parent(self: *Container, comptime T: type) *T {
        return @fieldParentPtr(T, "scene", self);
    }
};

pub const DefaultGameScene = struct {
    // Signatures
    pub const BasicSystemType:       type = fn() void;
    pub const ContainerSystemType:   type = fn(*xpro.scene.Container) void;
    pub const TraditionalSystemType: type = fn(*xpro.World) void;
    pub const AdvancedSystemType:    type = fn(*DefaultGameScene) void;

    pub const SignatureTag = enum {
        basic,
        container,
        traditional,
        advanced
    };
    pub const Adapter = union(SignatureTag) {
        basic: BasicSystemType,
        container: ContainerSystemType,
        traditional: TraditionalSystemType,
        advanced: AdvancedSystemType
    };

    // Variables
    scene: Container = undefined,
    allocator: *std.mem.Allocator = undefined,
    
    updateSystems: std.ArrayList(Adapter) = undefined,
    renderSystems: std.ArrayList(Adapter) = undefined,

    pub fn init(alloc:*std.mem.Allocator) @This() {
        return .{
            .allocator = alloc,
            .scene = Container.init(alloc, DefaultGameScene.update),
            .updateSystems = std.ArrayList(Adapter).init(alloc),
            .renderSystems = std.ArrayList(Adapter).init(alloc),
        };
    }
    pub fn initHeap(alloc:*std.mem.Allocator) *@This() {
        var memory: *@This() = alloc.create(@This()) catch unreachable;
        memory.allocator = alloc;
        memory.scene = Container.init(alloc, DefaultGameScene.update);
        memory.updateSystems = std.ArrayList(Adapter).init(alloc);
        memory.renderSystems = std.ArrayList(Adapter).init(alloc);

        return memory;
    }

    pub fn addUpdateSystem(self: *DefaultGameScene, comptime systemFn: anytype) !void {
        switch(@TypeOf(systemFn)) {
            BasicSystemType       => {try self.updateSystems.append(.{.basic=@as(BasicSystemType,systemFn)});},
            ContainerSystemType   => {try self.updateSystems.append(.{.container=@as(ContainerSystemType,systemFn)});},
            TraditionalSystemType => {try self.updateSystems.append(.{.traditional=@as(TraditionalSystemType,systemFn)});},
            AdvancedSystemType    => {try self.updateSystems.append(.{.advanced=@as(AdvancedSystemType,systemFn)});},
            else => @compileError("Failed to coerce `systemFn` into any application system function.")
        }
    }
    pub fn addRenderSystem(self: *DefaultGameScene, comptime systemFn: anytype) !void {
        switch(@TypeOf(systemFn)) {
            BasicSystemType       => {try self.renderSystems.append(.{.basic=@as(BasicSystemType,systemFn)});},
            ContainerSystemType   => {try self.renderSystems.append(.{.container=@as(ContainerSystemType,systemFn)});},
            TraditionalSystemType => {try self.renderSystems.append(.{.traditional=@as(TraditionalSystemType,systemFn)});},
            AdvancedSystemType    => {try self.renderSystems.append(.{.advanced=@as(AdvancedSystemType,systemFn)});},
            else => @compileError("Failed to coerce `systemFn` into any application system function.")
        }
    }

    pub fn addDefaultUpdateSystems(self: *DefaultGameScene) !void {
        try self.addUpdateSystem(xpro.systems.updateAnimation);
        try self.addUpdateSystem(xpro.systems.updateAttachments);
        try self.addUpdateSystem(xpro.systems.updateGameCamera);
    }
    pub fn addDefaultRenderSystems(self: *DefaultGameScene) !void {
        try self.addRenderSystem(xpro.systems.drawTilemaps);
        try self.addRenderSystem(xpro.systems.drawShadows);
        try self.addRenderSystem(xpro.systems.drawSprites);
        try self.addRenderSystem(xpro.systems.drawParticleSystems);
    }

    pub fn update(scene: *Container) void {
        var self: *@This() = scene.parent(@This());

        for(self.updateSystems.items) |updateSys| {
            switch(updateSys) {
                SignatureTag.basic => |basicSys| basicSys(),
                SignatureTag.container => |containerSys| containerSys(&self.scene),
                SignatureTag.traditional => |traditionalSys| traditionalSys(&self.scene.world),
                SignatureTag.advanced => |advancedSys| advancedSys(self),
            }
        }
        for(self.renderSystems.items) |renderSys| {
            switch(renderSys) {
                SignatureTag.basic => |basicSys| basicSys(),
                SignatureTag.container => |containerSys| containerSys(&self.scene),
                SignatureTag.traditional => |traditionalSys| traditionalSys(&self.scene.world),
                SignatureTag.advanced => |advancedSys| advancedSys(self),
            }
        }
    }
};