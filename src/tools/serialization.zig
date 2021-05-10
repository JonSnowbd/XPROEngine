const std = @import("std");
const xpro = @import("../xpro.zig");

/// Whether or not the serializer should talk about its process with `std.debug.print`. Can be useful
/// for debugging which serializer goes wrong.
pub var verbose = false;
fn log(comptime fmt: []const u8, args: anytype) void {
    if(verbose) {
        std.debug.print(fmt, args);
    }
}

const SerInfo = struct{
    serialize: fn(*SerInfo, *xpro.binarySerializer.BinaryStream, *xpro.World, xpro.Entity) void,
    deserialize: fn(*SerInfo, *xpro.binarySerializer.BinaryStream, *xpro.World, xpro.Entity) void,
    canSerialize: fn(*SerInfo, *xpro.World, xpro.Entity) bool,

    pub fn parent(self: *SerInfo, comptime T: type) *T {
        return @fieldParentPtr(T, "pair", self);
    }
};
var serializers: std.ArrayList(SerInfo) = undefined;
fn SerializationWrapper(comptime T: type) type {
    return struct {
        pair: SerInfo,
        pub fn init() @This() {
            return .{
                .pair = .{.serialize = @This()._serialize, .deserialize = @This()._deserialize, .canSerialize = @This()._canSerialize},
            };
        }
        pub fn _serialize(self: *SerInfo, stream: *xpro.binarySerializer.BinaryStream, world: *xpro.World, ent: xpro.Entity) void {
            var this: *@This() = self.parent(@This());
            const value: *T = world.get(T, ent);
            stream.write(value);
        }
        pub fn _deserialize(self: *SerInfo, stream: *xpro.binarySerializer.BinaryStream, world: *xpro.World, ent: xpro.Entity) void {
            var this: *@This() = self.parent(@This());
            var value = T{};
            stream.read(&value);
            world.add(ent, value);
            log("  - Added: {any}\n", .{value});
        }
        pub fn _canSerialize(self: *SerInfo, world: *xpro.World, ent: xpro.Entity) bool {
            return world.has(T, ent);
        }
    };
}

pub fn init(allocator: *std.mem.Allocator) void {
    serializers = std.ArrayList(SerInfo).init(allocator);
}

// and this registers them into serializers.
pub fn register(comptime T: type) void {
    if(@sizeOf(T) == 0) { @compileError("Null sized components are a no go in registerSerializable."); }
    serializers.append(SerializationWrapper(T).init().pair) catch unreachable;
}

pub fn serialize(allocator: *std.mem.Allocator, world: *xpro.World) xpro.binarySerializer.BinaryStream {
    var stream = xpro.binarySerializer.BinaryStream.init(allocator);

    var view = world.view(.{xpro.components.Serializable}, .{xpro.components.Disabled});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        log("> Serializing Entity#{any}\n", .{ent});
        for(serializers.items) |*ser,  i| {
            const castSet: *SerInfo = ser;
            if(castSet.canSerialize(castSet, world, ent)) {
                log("  - Registered a component under Serializer#{any}\n", .{i});

                var target:usize = i+1;
                stream.write(&target);
                castSet.serialize(castSet, &stream, world, ent);
            }
        }
        const nullterm: usize = 0;
        stream.write(&nullterm);
        log("  - End\n", .{});
    }

    return stream;
}
pub fn deserialize(allocator: *std.mem.Allocator, stream: *xpro.binarySerializer.BinaryStream, world: *xpro.World) void {
    while(!stream.done()) {
        var ent = world.create();
        world.add(ent, xpro.components.Serializable{});
        log("> Recreating entity as Entity#{any}\n", .{ent});
        var going = true;
        while(going) {
            var pairIndex: usize = 0;
            stream.read(&pairIndex);
            if(pairIndex == 0) {
                going = false;
                log("  - End\n", .{});
                break;
            } else {
                log("  - Reconstructing from index#{any}\n", .{pairIndex});
                var pair: *SerInfo = &serializers.items[pairIndex-1];
                pair.deserialize(pair, stream, world, ent);
            }
        }

    }
}