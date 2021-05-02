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

/// A list of information that determines how a struct will be serialized/deserialized,
/// like fields to skip.
/// TODO: Implement a HashSet for O(1) lookup without using a HashMap
pub const SerializationOption = struct {
    /// A list of the hashes of the names of the fields to be skipped
    /// from the struct.
    skip: []const u32 = undefined,

    pub fn init(comptime skips: [][]const u8) SerializationOption {
        return SerializationOption{
            .skip = comptime blk: {
                var x: []const u32 = .{};
                for(skips) |string| {
                    x = x ++ []u32{std.hash.Adler32.hash(string)};
                }
                break :blk x;
            }
        };
    }

    pub fn isSkipped(self: *SerializationOption, name: []const u8) bool {
        var hash = std.hash.Adler32.hash(name);
        for(skip) |val| {
            if(val == hash) return true;
        }
        return false;
    }
};
const SerializationPair = struct{
    options: ?SerializationOption = null,
    serialize: fn(*SerializationPair, *std.ArrayList(u8), *xpro.World, xpro.Entity) void,
    deserialize: fn(*SerializationPair, *std.ArrayList(u8), usize, *xpro.World, xpro.Entity) usize,
    canSerialize: fn(*SerializationPair, *xpro.World, xpro.Entity) bool,

    pub fn parent(self: *SerializationPair, comptime T: type) *T {
        return @fieldParentPtr(T, "pair", self);
    }
};
var serializers: std.ArrayList(SerializationPair) = undefined;
fn SerializationWrapper(comptime T: type) type {
    return struct {
        pair: SerializationPair,
        pub fn init() @This() {
            return .{
                .pair = .{.serialize = @This()._serialize, .deserialize = @This()._deserialize, .canSerialize = @This()._canSerialize},
            };
        }
        pub fn _serialize(self: *SerializationPair, bytes: *std.ArrayList(u8), world: *xpro.World, ent: xpro.Entity) void {
            var this: *@This() = self.parent(@This());
            const value: *T = world.get(T, ent);
            insertMemory(bytes, value) catch unreachable;
        }
        pub fn _deserialize(self: *SerializationPair, bytes: *std.ArrayList(u8), start: usize, world: *xpro.World, ent: xpro.Entity) usize {
            var this: *@This() = self.parent(@This());
            var value = T{};
            var new = retrieveMemory(bytes, start, &value) catch unreachable;
            log("  - Added: {any}\n", .{value});
            world.add(ent, value);
            return new;
        }
        pub fn _canSerialize(self: *SerializationPair, world: *xpro.World, ent: xpro.Entity) bool {
            return world.has(T, ent);
        }
    };
}

pub fn init(allocator: *std.mem.Allocator) void {
    serializers = std.ArrayList(SerializationPair).init(allocator);
}

// and this registers them into serializers.
pub fn register(comptime T: type) void {
    if(@sizeOf(T) == 0) { @compileError("Null sized components are a no go in registerSerializable."); }
    serializers.append(SerializationWrapper(T).init().pair) catch unreachable;
}
pub fn registerEx(comptime T: type, opts: SerializationOption) void {
    if(@sizeOf(T) == 0) { @compileError("Null sized components are a no go in registerSerializable."); }
    var wrapper = SerializationWrapper(T).init();
    wrapper.pair.options = opts;
    serializers.append(wrapper.pair) catch unreachable;
}

pub fn serialize(allocator: *std.mem.Allocator, world: *xpro.World) []const u8 {
    var bytes = std.ArrayList(u8).init(allocator);
    defer bytes.deinit();

    var view = world.view(.{xpro.components.Serializable}, .{xpro.components.Disabled});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        log("> Serializing Entity#{any}\n", .{ent});
        for(serializers.items) |*ser,  i| {
            const castSet: *SerializationPair = ser;
            if(castSet.canSerialize(castSet, world, ent)) {
                log("  - Registered a component under Serializer#{any}\n", .{i});
                insertMemory(&bytes,&(i+1)) catch unreachable;
                castSet.serialize(castSet, &bytes, world, ent);
            }
        }
        const nullterm: usize = 0;
        insertMemory(&bytes, &nullterm) catch unreachable;
        log("  - End\n", .{});
    }

    return allocator.dupe(u8, bytes.items) catch unreachable;
}
pub fn deserialize(allocator: *std.mem.Allocator, bytes: *std.ArrayList(u8), world: *xpro.World) void {
    var index:usize = 0;
    while(index < bytes.items.len) {
        var ent = world.create();
        world.add(ent, xpro.components.Serializable{});
        log("> Recreating entity as Entity#{any}\n", .{ent});
        var going = true;
        while(going) {
            var pairIndex: usize = 0;
            index = retrieveMemory(bytes, index, &pairIndex) catch unreachable;
            if(pairIndex == 0) {
                going = false;
                log("  - End\n", .{});
                break;
            } else {
                log("  - Reconstructing from index#{any}\n", .{pairIndex});
                var pair: *SerializationPair = &serializers.items[pairIndex-1];
                index = pair.deserialize(pair, bytes, index, world, ent);
            }
        }

    }
}

fn insertMemory(bytes: *std.ArrayList(u8), ptr: anytype) !void {
    const T = @TypeOf(ptr.*);

    switch(@typeInfo(T)) {
        .Struct => {
            var in_bytes = std.mem.asBytes(ptr);
            inline for(std.meta.fields(T)) |field| {
                const fieldCast: std.builtin.TypeInfo.StructField = field;
                switch(@typeInfo(fieldCast.field_type)) {
                    // For arrays we serialize in first the length of the array for the deserializer to
                    // know how big to make the slice.
                    .Array => {
                        var indexSize = @intCast(usize,@sizeOf(usize));
                        try insertMemorySmall(bytes, &indexSize);
                        var arrayBytes = std.mem.asBytes(&@field(ptr.*, fieldCast.name));
                        var i: usize = 0;
                        while(i < arrayBytes.len) {
                            try bytes.append(arrayBytes[i]);
                            i+=1;
                        }
                    },
                    // Re-assigning a memory pointer isnt something I want to attempt.
                    .Pointer => { continue; log("  - WARNING: Pointer types are not serialized, consider skipping {s}", .{fieldCast.name}); },
                    // Otherwise its a simple insert.
                    else => {
                        var offset = @intCast(usize, @byteOffsetOf(T, fieldCast.name));
                        var length = @intCast(usize, @sizeOf(fieldCast.field_type));

                        var i = offset;
                        while(i < offset+length) {
                            try bytes.append(in_bytes[i]);
                            i+=1;
                        }
                    }
                }
            }
        },
        else => {
            // Simple component types don't need anything complex.
            try insertMemorySmall(bytes, ptr);
        }
    }
}
fn insertMemorySmall(bytes: *std.ArrayList(u8), ptr: anytype) !void {
    const T = @TypeOf(ptr.*);
    var in_bytes = std.mem.asBytes(ptr);
    var length = @intCast(usize, @sizeOf(T));
    var i: usize = 0;
    while(i < length) {
        try bytes.append(in_bytes[i]);
        i+=1;
    }
}
/// Returns the index it left off at.
fn retrieveMemory(bytes: *std.ArrayList(u8), startIndex: usize, ptr: anytype) !usize {
    const T = @TypeOf(ptr.*);
    switch(@typeInfo(T)) {
        .Struct => {
            var byteIndex: usize = startIndex;
            inline for(std.meta.fields(T)) |field| {
                const fieldCast: std.builtin.TypeInfo.StructField = field;
                switch(@typeInfo(fieldCast.field_type)) {
                    .Array => |arrInfo| {
                        // extract the serialized count
                        var arrayLen: usize = 0;
                        byteIndex = startIndex + try retrieveMemorySmall(bytes, startIndex, &arrayLen);

                        // Then get the bits out!
                        var typeSize: usize = @intCast(usize,@sizeOf(arrInfo.child)) * arrayLen;
                        var slice = bytes[byteIndex..byteIndex+typeSize];
                        @field(ptr.*, fieldCast.name) = @ptrCast([]const arrInfo.child, @alignCast(@alignOf(arrInfo.child),slice.ptr));
                    },
                    .Pointer => { continue; log("  - WARNING: Pointer types are not serialized, consider skipping {s}", .{fieldCast.name}); },
                    else => {
                        byteIndex += try (retrieveMemorySmall(bytes, byteIndex, &@field(ptr.*, fieldCast.name)));
                    }
                }
            }
            return byteIndex;
        },
        else => {
            var newIndex = startIndex + try retrieveMemorySmall(bytes, startIndex, ptr);
            return newIndex;
        }
    }


}
/// Returns how many bytes it *moved forward*, not the byte index it moved *to*
fn retrieveMemorySmall(bytes: *std.ArrayList(u8), startIndex: usize, ptr: anytype) !usize {
    const T = @TypeOf(ptr.*);
    var size = @intCast(usize, @sizeOf(T));
    var slice = bytes.items[startIndex..startIndex+size];
    var cast: *align(1) T = @ptrCast(*align(1) T, slice.ptr);
    ptr.* = cast.*;
    return size;
}