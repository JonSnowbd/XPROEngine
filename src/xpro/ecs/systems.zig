const std = @import("std");
const ecs = @import("ecs");
const gk = @import("gamekit");
const cmp = @import("components.zig");
const render = @import("../rendering.zig");

pub fn drawSprites(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Position, cmp.Sprite}, .{cmp.Invisible});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        const pos = view.getConst(cmp.Position, ent);
        const spr = view.getConst(cmp.Sprite, ent);

        var matrix = gk.math.Mat32.identity;
        matrix.translate(pos.value.x, pos.value.y);
        render.tex(0, matrix, spr.texture, spr.source, null);
    }
}