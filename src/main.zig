const std = @import("std");
const gk = @import("gamekit");
const xpro = @import("xpro");
const col = gk.math.Color;

// Imgui stuff
usingnamespace @import("imgui");
pub const enable_imgui = true;

pub fn main() !void {
    try gk.run(.{
        .init = init,
        .update = update,
        .render = render,
        .shutdown=shutdown,
        .update_rate=8
    });
}

fn init() !void {
    try xpro.init(std.heap.page_allocator);
}

fn update() !void {
    try xpro.update();
    if (gk.input.mouseDown(.left)) {
        xpro.cam.pos = xpro.cam.pos.subv(xpro.mouse_delta);
    }
}

fn render() !void {
    xpro.render.rectHollow(20, 20, 20, 250, 250, 3, col.lime, null);
    xpro.render.rect(10, 20, 20, 300, 300, col.red, null);
    xpro.render.rect(9, 45, 40, 300, 300, col.green, null);

    const fps_text: []const u8 = try std.fmt.allocPrint(xpro.mem.ringBuffer, "{any}fps, {d:.15}dt", .{gk.time.fps(),xpro.dt});
    xpro.render.text(1000, fps_text, xpro.world_mouse_pos.x,xpro.world_mouse_pos.y, null, null);
    xpro.render.flush();

}

fn shutdown() !void {
    try xpro.deinit();
}