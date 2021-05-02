const std = @import("std");
const path = std.fs.path;
const ecs_build = @import("src/deps/ecs/build.zig");
const ray_build = @import("src/deps/ray/build.zig");
const img_build = @import("src/deps/imgui/build.zig");

pub const addGameContent = ray_build.addGameContent; // Re-export addGameContent

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{
        .default_target = .{ .abi = std.Target.Abi.gnu },
    });
    const mode = b.standardReleaseOptions();
    
    // Example content
    const exe = b.addExecutable("XProSample", "example/main.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    link(b, exe, target, "") catch unreachable;
    exe.install();
    addGameContent("example/assets") catch unreachable;

    // Tests
    const testing = b.addTest("src/tests.zig");
    testing.setTarget(target);
    testing.setBuildMode(mode);
    link(b, testing, target, "") catch unreachable;
    const test_step = b.step("test", "Runs all of xpro's test cases.");
    test_step.dependOn(&testing.step);

    // run
    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
pub fn link(b: *std.build.Builder, exe: *std.build.LibExeObjStep, target: std.build.Target, comptime prefixPath: []const u8) !void {
    // ECS
    ecs_build.linkArtifact(b, exe, target, .static, prefixPath++"src/deps/ecs/");
    // Raylib
    ray_build.link(exe, prefixPath++"src/deps/ray/");
    // Imgui
    img_build.link(b, exe, target, prefixPath++"src/deps/imgui/");

    var rayPkg = ray_build.pkg(prefixPath++"src/deps/ray/");
    var imPkg = img_build.pkg(prefixPath++"src/deps/imgui/");
    var ecsPkg = ecs_build.getPackage(prefixPath++"src/deps/ecs/");

    exe.addPackage(.{
        .name="xpro",
        .path=prefixPath++"src/xpro.zig",
        .dependencies = &.{
            rayPkg,
            imPkg,
            ecsPkg,
        }
    });
}