const std = @import("std");

pub var verbose: bool = true;

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("RayExample", "src/example.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    link(exe, "");
    exe.addPackage(pkg(""));
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    addGameContent("src/exampleContent") catch unreachable;
}

/// Links the raylib C Source files into the .exe. rayPkgPath is a path to this folder containing build.zig, relative
/// from your own build.zig(or whatever is using this file.). If you want ziglang extern definitions, you will also
/// need to add the package from `build.pkg(rayPkgPath)` to your .exe.
pub fn link(exe: *std.build.LibExeObjStep, comptime rayPkgPath: []const u8) void {
    const debugFlags = &[_][]const u8 {
        "-std=c99",
        "-DPLATFORM_DESKTOP",
        "-D_POSIX_C_SOURCE",
        "-DGL_SILENCE_DEPRECATION",
    };
    const releaseFlags = &[_][]const u8 {
        "-std=c99",
        "-DPLATFORM_DESKTOP",
        "-D_POSIX_C_SOURCE",
        "-DGL_SILENCE_DEPRECATION",
        "-Os"
    };
    const flags = if(std.builtin.mode == std.builtin.Mode.Debug) debugFlags else releaseFlags;

    exe.addSystemIncludeDir(rayPkgPath++"src/raylib/src");
    exe.addSystemIncludeDir(rayPkgPath++"src/raylib/src/external/glfw/include");
    exe.addSystemIncludeDir(rayPkgPath++"src/raylib/src/external/glfw/deps/mingw");

    const targ = std.zig.system.NativeTargetInfo.detect(std.heap.page_allocator, exe.target) catch unreachable;

    switch(targ.target.os.tag) {
        .windows => {
            exe.linkSystemLibrary("winmm");
            exe.linkSystemLibrary("gdi32");
            exe.linkSystemLibrary("opengl32");
        },
        .macos => {
            std.debug.print("Sorry, raylib on mac isn't supported yet.\n", .{});
            std.os.exit(1);
        },
        else => { // Probably linux
            exe.linkSystemLibrary("GL");
            exe.linkSystemLibrary("m");
            exe.linkSystemLibrary("pthread");
            exe.linkSystemLibrary("dl");
            exe.linkSystemLibrary("rt");
            exe.linkSystemLibrary("X11");
        }
    }
    exe.linkLibC();

    // TODO: Add 
    exe.addCSourceFile(rayPkgPath++"src/raylib/src/core.c", flags);
    exe.addCSourceFile(rayPkgPath++"src/raylib/src/models.c", flags);
    exe.addCSourceFile(rayPkgPath++"src/raylib/src/raudio.c", flags);
    exe.addCSourceFile(rayPkgPath++"src/raylib/src/rglfw.c", flags);
    exe.addCSourceFile(rayPkgPath++"src/raylib/src/shapes.c", flags);
    exe.addCSourceFile(rayPkgPath++"src/raylib/src/text.c", flags);
    exe.addCSourceFile(rayPkgPath++"src/raylib/src/textures.c", flags);
    exe.addCSourceFile(rayPkgPath++"src/raylib/src/utils.c", flags);
}
pub fn pkg(comptime rayPkgPath: []const u8) std.build.Pkg {
    return .{
        .name = "raylib",
        .path = rayPkgPath ++ "src/raylib_binding.zig",
    };
}

pub const AddContentErrors = error {
    PermissionError,
    WriteError,
    FileError,
    FolderError,
    RecursionError
};


const path = std.fs.path;
const fs = std.fs;

/// Pass in a relative path to a folder, and its content is added to the zig-cache/bin output.
/// TODO: Lookup where zig defines the output folder to make it bulletproof.
pub fn addGameContent(comptime baseContentPath: []const u8) AddContentErrors!void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};

    const zigBin: []const u8 = path.join(&gpa.allocator, &[_][]const u8{"zig-cache","bin"}) catch return error.FolderError;
    defer gpa.allocator.free(zigBin);
    fs.cwd().makePath(zigBin) catch return error.FolderError;

    var sourceFolder: fs.Dir = fs.cwd().openDir(baseContentPath, .{.iterate=true}) catch return error.FolderError;
    defer sourceFolder.close();
    var iterator: fs.Dir.Iterator = sourceFolder.iterate();
    while(iterator.next() catch return error.FolderError) |target| {
        var x: fs.Dir.Entry = target;
        if(x.kind == .Directory) {
            const source: []const u8 = path.join(&gpa.allocator, &[_][]const u8 {baseContentPath, x.name}) catch return error.RecursionError;
            const targetFolder: []const u8 = path.join(&gpa.allocator, &[_][]const u8 {zigBin, x.name}) catch return error.RecursionError;
            defer gpa.allocator.free(source);
            defer gpa.allocator.free(targetFolder);
            try innerAddContent(&gpa.allocator, source, targetFolder);
        }
        if(x.kind == .File) {
            try copy(&gpa.allocator, baseContentPath, zigBin, x.name);
        }
    }
}
fn innerAddContent(allocator: *std.mem.Allocator, folder: []const u8, dest: []const u8) AddContentErrors!void {
    var sourceFolder: fs.Dir = fs.cwd().openDir(folder, .{.iterate=true}) catch return error.FolderError;
    defer sourceFolder.close();

    var iterator: fs.Dir.Iterator = sourceFolder.iterate();
    while(iterator.next() catch return error.FolderError) |target| {
        var x: fs.Dir.Entry = target;
        if(x.kind == .Directory) {
            const source: []const u8 = path.join(allocator, &[_][]const u8 {folder, x.name}) catch return error.RecursionError;
            const targetFolder: []const u8 = path.join(allocator, &[_][]const u8 {dest, x.name}) catch return error.RecursionError;
            defer allocator.free(source);
            defer allocator.free(targetFolder);
            try innerAddContent(allocator, source, targetFolder);
        }
        if(x.kind == .File) {
            try copy(allocator, folder, dest, x.name);
        }
    }
}
fn copy(allocator: *std.mem.Allocator, from: []const u8, to: []const u8, filename: []const u8) AddContentErrors!void {
    fs.cwd().makePath(to) catch return error.FolderError;
    var source = fs.cwd().openDir(from, .{}) catch return error.FileError;
    var dest = fs.cwd().openDir(to, .{}) catch return error.FileError;

    var sfile = source.openFile(filename, .{}) catch return error.FileError;
    defer sfile.close();
    var dfile = dest.openFile(filename, .{}) catch {
        source.copyFile(filename, dest, filename, .{}) catch return error.PermissionError;
        if(verbose)
            std.debug.print("COPY: {s}/{s} to {s}/{s}\n", .{from, filename, to, filename});
        return;
    };
    defer dfile.close();
    
    var sstat = sfile.stat() catch return error.FileError;
    var dstat = dfile.stat() catch return error.FileError;

    if(sstat.mtime > dstat.mtime) {
        source.copyFile(filename, dest, filename, .{}) catch return error.PermissionError;
        if(verbose)
            std.debug.print("OVERWRITE: {s}\\{s} to {s}\\{s}\n", .{from, filename, to, filename});
    } else {
        std.debug.print("SKIP: {s}\\{s}\n", .{from, filename});
    }

}