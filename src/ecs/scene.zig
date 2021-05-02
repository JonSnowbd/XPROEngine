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
    const BasicSystemType:       type = fn() void;
    const ContainerSystemType:   type = fn(*xpro.scene.Container) void;
    const TraditionalSystemType: type = fn(*xpro.World) void;
    const AdvancedSystemType:    type = fn(*DefaultGameScene) void;

    const SignatureTag = enum {
        basic,
        container,
        traditional,
        advanced
    };
    const Adapter = union(SignatureTag) {
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

    /// Returns a stack allocated game scene. Recommended if you're storing this somewhere yourself.
    pub fn init(alloc:*std.mem.Allocator) @This() {
        return .{
            .allocator = alloc,
            .scene = Container.init(alloc, DefaultGameScene.update),
            .updateSystems = std.ArrayList(Adapter).init(alloc),
            .renderSystems = std.ArrayList(Adapter).init(alloc),
        };
    }
    /// Returns a heap allocated game scene pointer. Recommended for create-and-go scenes you dont have to manage
    /// yourself. TODO: Register to xpro as a scene to be deinit'd on exit, and allow the ability to "jump" back to (or deinit)
    /// any heap allocated scenes.
    pub fn initHeap(alloc:*std.mem.Allocator) *@This() {
        var memory: *@This() = alloc.create(@This()) catch unreachable;
        memory.allocator = alloc;
        memory.scene = Container.init(alloc, DefaultGameScene.update);
        memory.updateSystems = std.ArrayList(Adapter).init(alloc);
        memory.renderSystems = std.ArrayList(Adapter).init(alloc);

        return memory;
    }

    /// **systemFn** must be a function with one of the following signatures:
    /// `fn() void;`
    /// `fn(*xpro.scene.Container) void;`
    /// `fn(*xpro.World) void;`
    /// `fn(*DefaultGameScene) void;`
    pub fn addUpdateSystem(self: *DefaultGameScene, comptime systemFn: anytype) !void {
        switch(@TypeOf(systemFn)) {
            BasicSystemType       => {try self.updateSystems.append(.{.basic=@as(BasicSystemType,systemFn)});},
            ContainerSystemType   => {try self.updateSystems.append(.{.container=@as(ContainerSystemType,systemFn)});},
            TraditionalSystemType => {try self.updateSystems.append(.{.traditional=@as(TraditionalSystemType,systemFn)});},
            AdvancedSystemType    => {try self.updateSystems.append(.{.advanced=@as(AdvancedSystemType,systemFn)});},
            else => @compileError("Failed to coerce `systemFn` into any application system function.")
        }
    }
    /// **systemFn** must be a function with one of the following signatures:
    /// `fn() void;`
    /// `fn(*xpro.scene.Container) void;`
    /// `fn(*xpro.World) void;`
    /// `fn(*DefaultGameScene) void;`
    pub fn addRenderSystem(self: *DefaultGameScene, comptime systemFn: anytype) !void {
        switch(@TypeOf(systemFn)) {
            BasicSystemType       => {try self.renderSystems.append(.{.basic=@as(BasicSystemType,systemFn)});},
            ContainerSystemType   => {try self.renderSystems.append(.{.container=@as(ContainerSystemType,systemFn)});},
            TraditionalSystemType => {try self.renderSystems.append(.{.traditional=@as(TraditionalSystemType,systemFn)});},
            AdvancedSystemType    => {try self.renderSystems.append(.{.advanced=@as(AdvancedSystemType,systemFn)});},
            else => @compileError("Failed to coerce `systemFn` into any application system function.")
        }
    }

    /// Adds the default update systems, allowing sprite animation, attached entities, and game camera logic.
    pub fn addDefaultUpdateSystems(self: *DefaultGameScene) !void {
        try self.addUpdateSystem(xpro.systems.updateAnimation);
        try self.addUpdateSystem(xpro.systems.updateAttachments);
        try self.addUpdateSystem(xpro.systems.updateGameCamera);
    }
    /// Adds the default render systems, allowing the drawing of tilemaps, shadow, sprites, and particles.
    pub fn addDefaultRenderSystems(self: *DefaultGameScene) !void {
        try self.addRenderSystem(xpro.systems.drawTilemaps);
        try self.addRenderSystem(xpro.systems.drawShadows);
        try self.addRenderSystem(xpro.systems.drawSprites);
        try self.addRenderSystem(xpro.systems.drawParticleSystems);
    }

    // TODO: Remove/Disable/Enable systems by function pointer.
    // TODO: Debug version of update that times each system for profiling.

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

    const entWrapper = struct {
        const component = struct {
            
        };
        name: []const u8,
        components: []const component,
    };
    pub fn save(comptime path: []const u8) void {
        const ds = xpro.serialization.deserializer(std.builtin.Endian.Big, xpro.serialization.Packing.Byte, entWrapper);
    }
    pub fn load(comptime path: []const u8) void {

    }
};