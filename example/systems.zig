const std = @import("std");
const xpro = @import("xpro");

pub const Ghost = struct {
    up: xpro.Keys,
    down: xpro.Keys,
    left: xpro.Keys,
    right: xpro.Keys,
    speed: f32
};

pub fn ghostController(world: *xpro.World) void {
    var view = world.view(.{Ghost},.{});
    var iter = view.iterator();

    while(iter.next()) |ent| {
    }
}
pub fn debugControls() void {
    if(xpro.raylib.IsKeyPressed(@enumToInt(xpro.Keys.KEY_F1))) {
        xpro.tools.editor.editorOpen = !xpro.tools.editor.editorOpen;
    }
}