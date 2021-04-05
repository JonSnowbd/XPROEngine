const std = @import("std");
const path = std.fs.path;
const gamekit_build = @import("src/deps/gamekit/build.zig");
const ecs_build = @import("src/deps/ecs/build.zig");
const u = @import("src/util.zig");

const alloc = std.heap.page_allocator;

pub fn build(b: *std.build.Builder) void {
    // Add game content over:
    add_game_content("content") catch unreachable;

    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
    const exe = b.addExecutable("XProEngine", "src/main.zig");

    exe.setTarget(target);
    exe.setBuildMode(mode);
    gamekit_build.addGameKitToArtifact(b, exe, target, "./src/deps/gamekit/");
    ecs_build.linkArtifact(b, exe, target, .static, "./src/deps/ecs/");

    var forwarded_deps: std.ArrayList(std.build.Pkg) = std.ArrayList(std.build.Pkg).init(b.allocator);
    for (exe.packages.items) |package| {
        forwarded_deps.append(package) catch unreachable;
    }

    exe.addPackage(.{
        .name="xpro",
        .path="./src/xpro/xpro.zig",
        .dependencies = forwarded_deps.items
    });
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}

fn add_game_content(folder: []const u8) 
(
    u.ErrorOf(path.join)||
    u.ErrorOf(std.fs.Dir.openDir)||
    u.ErrorOf(std.fs.Dir.makePath)||
    u.ErrorOf(std.fs.Dir.copyFile)
) !void {
    // Construct paths.
    const zig_cache: []const u8 = try path.join(alloc, &[_][]const u8 {"zig-cache", "bin", folder});
    defer alloc.free(zig_cache);

    const source_cache: []const u8 = try path.join(alloc, &[_][]const u8 {folder});
    defer alloc.free(source_cache);

    // Ensure path exists.
    try std.fs.cwd().makePath(zig_cache);

    // Make folders.
    var source_folder: std.fs.Dir = try std.fs.cwd().openDir(source_cache, .{.iterate=true,});
    defer source_folder.close();
    var dest_folder: std.fs.Dir = try std.fs.cwd().openDir(zig_cache, .{});
    defer dest_folder.close();

    // Iterate over all the files.
    var file_iterator: std.fs.Dir.Iterator = source_folder.iterate();
    while (try file_iterator.next()) |target| {
        // Copy files
        if(target.kind == .File) {
            // If the dest doesnt exist or errors, just copy.
            var dest_file_info: std.fs.File = dest_folder.openFile(target.name, .{}) catch {
                try source_folder.copyFile(target.name, dest_folder, target.name, .{});
                continue;
            };
            defer dest_file_info.close();

            var source_file_info: std.fs.File = source_folder.openFile(target.name, .{}) catch {
                continue;
            };
            defer source_file_info.close();

            const dest_stat: std.fs.File.Stat = dest_file_info.stat() catch unreachable;
            const source_stat: std.fs.File.Stat = source_file_info.stat() catch unreachable;

            if (source_stat.mtime > dest_stat.mtime) {
                std.debug.print("Updating file:'{s}'", .{target.name});
                try source_folder.copyFile(target.name, dest_folder, target.name, .{});
            }
        }
        // Recurse into folders.
        if(target.kind == .Directory) {
            const recursed_folder: []const u8 = try path.join(alloc, &[_][]const u8{folder,target.name});
            try add_game_content(recursed_folder);
            alloc.free(recursed_folder);
            continue;
        }
    }
}