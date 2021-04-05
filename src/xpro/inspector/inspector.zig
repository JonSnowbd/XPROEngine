const std = @import("std");
const gk = @import("gamekit");
const ecs = @import("ecs");
const xpro = @import("../xpro.zig");

usingnamespace @import("imgui");
usingnamespace @import("igExt.zig");

const cmp = @import("../ecs/components.zig");

var selectedEntity: ecs.Entity;

fn _inspector(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Editable, cmp.Name}, .{});
    var iter = view.iterator();

    while(iter.next()) |ent| {
        const name = view.getConst(cmp.Name, ent);
        if(igFilledSelectable(name.value.ptr, ImGuiSelectableFlags_None)) {
            
        }
    }
}

pub fn update(world: *xpro.scene.BasicScene) void {
    const flags = 
        ImGuiWindowFlags_NoCollapse |
        ImGuiWindowFlags_NoMove |
        ImGuiWindowFlags_NoResize |
        ImGuiWindowFlags_NoSavedSettings;
    
    igSetNextWindowPos(ImVec2{.x=4,.y=5}, ImGuiCond_Always, ImVec2{.x=0,.y=0});
    var height = @intToFloat(f32, gk.window.height() - 8);
    igSetNextWindowSize(ImVec2{.x=300,.y=height-1},ImGuiCond_Always);

    _ = igBegin("Inspector", null, flags);

    _inspector(&world.register);

    igEnd();
}