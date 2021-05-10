const std = @import("std");

// pub const BinInterface = struct{
//     serialize:    fn(*BinInterface, *BinaryStream, anytype) void,
//     deserialize:  fn(*BinInterface, *BinaryStream, anytype) void,
//     compatible:   fn(*BinInterface, anytype) bool,

//     pub fn parent(self: *BinInterface, comptime T: type) *T {
//         return @fieldParentPtr(T, "interface", self);
//     }
// };
// fn BinCache(comptime T: type) type {
//     return struct {
//         interface: BinInterface,
//         fn serializeWrap(interface: *BinInterface, stream: *BinaryStream, ptr: anytype) void {

//         }
//     };
// }
pub const BinaryStream = struct {
    allocator: *std.mem.Allocator = undefined,
    backing: std.ArrayList(u8) = undefined,
    header: usize = 0,
    /// Inits a binary stream based on the given file path.
    pub fn init(alloc: *std.mem.Allocator) @This() {
        return .{
            .allocator = alloc,
            .backing = std.ArrayList(u8).init(alloc),
        };
    }
    pub fn deinit(self: *BinaryStream) void {
        self.backing.deinit();
    }
    pub fn loadFromFile(self: *BinaryStream, folder: *std.fs.Dir, fileName: []const u8) !void {
        self.backing.items.len = 0;
        var fileBytes = try folder.readFileAlloc(self.allocator, fileName, 32000000);
        defer self.allocator.free(fileBytes);

        for(fileBytes) |b| {
            try self.backing.append(b);
        }
    }
    pub fn clear(self: *BinaryStream) void {
        self.backing.len = 0;
    }
    pub fn write(self: *BinaryStream, ptr: anytype) void {
        const T = @TypeOf(ptr.*);
        switch(@typeInfo(T)) {
            .Struct => {
                inline for(std.meta.fields(T)) |field| {
                    // Ignore _vars. Hacky, will make this an option later on.
                    if(!std.mem.startsWith(u8, field.name, "_")) {
                        self.write(&@field(ptr.*, field.name));  
                    }
                }
            },
            .Array => |arr| {
                @compileError("Array serialization not implemented yet.");
                // var size:usize = @intCast(usize, arr.len);
                // self.write(&size);

                // // Write array
                // var i = 0; while(i < size) : (i += 1) {

                // }
            },
            .Pointer => |pointerField| switch(pointerField.size) {
                .Slice => {
                    const sliceType: type = pointerField.child;

                    var solid: []const sliceType = @as([]const sliceType, ptr.*);
                    var count: usize = solid.len;
                    self.write(&count);
                    for(solid) |*s| {
                        self.write(s);
                    }
                },
                else => {std.log.err("These pointers are not quite recoverable yet", .{});}
            },
            else => {
                var bytes = std.mem.asBytes(ptr);
                for(bytes) |b| {
                    self.backing.append(b) catch unreachable;
                }
            }
        }
    }
    pub fn done(self: *BinaryStream) bool {
        return self.header+1 >= self.backing.items.len;
    }
    pub fn read(self: *BinaryStream, ptr: anytype) void {
        if(self.done()) {
            self.header = 0;
        }
        const T = @TypeOf(ptr.*);
        switch(@typeInfo(T)) {
            .Struct => {
                inline for(std.meta.fields(T)) |field| {
                    // Ignore _vars. Hacky, will make this an option later on.
                    if(!std.mem.startsWith(u8, field.name, "_")) {
                        self.read(&@field(ptr.*, field.name));  
                    }
                }
            },
            .Array => |arr| {
                std.log.err("These arrays are not quite recoverable yet", .{});
                // var size:usize = @intCast(usize, arr.len);
                // self.read(&size);

                // // Write array
                // var i = 0; while(i < size) : (i += 1) {

                // }
            },
            .Pointer => |pointerField| switch(pointerField.size) {
                .Slice => {
                    const sliceType: type = pointerField.child;

                    var count: usize = 0;
                    self.read(&count);

                    var array = self.allocator.alloc(sliceType, count) catch unreachable;
                    for(array) |*s| {
                        self.read(s);
                    }
                    ptr.* = array[0..];
                },
                else => {std.log.err("These pointers are not quite recoverable yet", .{});}
            },
            else => {
                const s = @intCast(usize,@sizeOf(T));
                var byteSlice = self.backing.items[self.header..self.header+s];

                var cast: *align(1) T = @ptrCast(*align(1) T, byteSlice.ptr);
                ptr.* = cast.*;
                self.header += s;
            }
        }
    }
};


test "basic serialization" {
    // Init
    const testStruct = struct {
        string: []const u8 = undefined,
        time: f64 = undefined,
        _skip: i32 = undefined,
    };

    var stream = BinaryStream.init(std.testing.allocator);
    defer stream.deinit();

    // Serialize structs
    var testVal = testStruct{
        .string = "Greetings everyone, this ends with an exclamation!",
        .time = 390000000.5,
        ._skip = 10
    };
    var dummyVal: i32 = 200;
    stream.write(&testVal);
    stream.write(&dummyVal);

    // Deserialize them
    var testValDeserialized = testStruct{
        .string = "",
        .time = 0,
        ._skip = 0
    };
    var dummyValDeserialized: i32 = 0;
    stream.read(&testValDeserialized);
    stream.read(&dummyValDeserialized);

    // Test
    std.testing.expect(std.mem.eql(u8, testValDeserialized.string, testVal.string));
    std.testing.expect(testVal.time == testValDeserialized.time);
    std.testing.expect(testValDeserialized._skip == 0 and testVal._skip == 10);
    std.testing.expect(dummyVal == dummyValDeserialized);

    // Slices are heap allocated.
    std.testing.allocator.free(testValDeserialized.string);
}