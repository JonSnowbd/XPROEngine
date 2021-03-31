const std = @import("std");
const gk = @import("gamekit");
const xpro = @import("xpro");
const col = gk.math.Color;

const GameScene = @import("game/GameScene.zig").GameScene;

// Imgui stuff
usingnamespace @import("imgui");
pub const enable_imgui = true;

pub fn main() !void {
    try gk.run(.{
        .init = init,
        .update = update,
        .render = render,
        .shutdown = shutdown,
        .update_rate = 144,
        .window = .{
            .title = "XPro"
        }
    });
}

fn init() !void {
    try xpro.init(std.heap.page_allocator);
    xpro.currentScene = GameScene.init().scene;
}

fn update() !void {
    if (gk.input.mouseDown(.left)) {
        xpro.cam.pos = xpro.cam.pos.subv(xpro.mouse_delta);
    }
    try xpro.update();
}

fn render() !void {
    xpro.render.flush();
}

fn shutdown() !void {
    try xpro.deinit();
}