const std = @import("std");
const gk = @import("gamekit");
const ecs = @import("ecs");
const xpro = @import("../xpro.zig");

usingnamespace @import("imgui");
usingnamespace @import("igExt.zig");

const cmp = @import("../ecs/components.zig");

var selectedEntity: ?ecs.Entity = null;

fn _inspector(reg: *ecs.Registry) void {
    var view = ecs.Registry.view(reg, .{cmp.Editable, cmp.Name}, .{});
    var iter = view.iterator();

    igText("Entity List");
    var height = @intToFloat(f32, gk.window.height()) * 0.33;
    _ = igBeginChildStr("###EntityList", ImVec2{.x=0,.y=height}, true, ImGuiWindowFlags_None);
    while(iter.next()) |ent| {
        const name = view.getConst(cmp.Name, ent);
        if(igSelectableAuto(name.value.ptr, ent == selectedEntity, ImGuiSelectableFlags_None)) {
            selectedEntity = ent;
        }
    }
    igEndChild();

    if(selectedEntity != null) {
        _ent(reg);
    }
}
fn _ent(reg: *ecs.Registry) void {
    var ent = selectedEntity.?;
    const name = reg.getConst(cmp.Name, ent);

    var x: []const u8 = std.fmt.allocPrint(xpro.mem.ringBuffer, "Editing <{s}>", .{name.value}) catch "Couldnt load name";
    igText(x.ptr);
    
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