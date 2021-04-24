const std = @import("std");
const xpro = @import("../xpro.zig");

usingnamespace xpro.imgui;
const editFlags = 
    ImGuiWindowFlags_NoSavedSettings |
    ImGuiWindowFlags_NoTitleBar |
    ImGuiWindowFlags_NoMove |
    ImGuiWindowFlags_NoResize |
    ImGuiWindowFlags_MenuBar;

pub fn runEditor(scene: *xpro.scene.Container) void {
    var view = xpro.World.view(&scene.register, .{xpro.components.Editable, xpro.components.Name}, .{});
    var iter = view.iterator();

    igSetNextWindowPos(ImVec2{.x=4,.y=4}, ImGuiCond_Always, ImVec2.zero);
    igSetNextWindowSize(ImVec2{.x=300, .y=@intToFloat(f32, xpro.raylib.GetScreenHeight()) - 8}, ImGuiCond_Always);
    if(igBegin("Editor", null, editFlags)) {

        if(igBeginMenuBar()) {
            _ = igMenuItem_Bool("Scene", null, false, true);
            igEndMenuBar();
        }

        _ = igBeginChild_Str("EditorEntityList###EEL_XPRO", ImVec2{.x=0, .y=200}, true, ImGuiWindowFlags_None);
        while(iter.next()) |ent| {
            const name = view.getConst(xpro.components.Name, ent);
            _ = igSelectable_Bool(name.value.ptr, false, ImGuiSelectableFlags_SpanAvailWidth, ImVec2{.x=0,.y=20});
        }
        igEndChild();
    }
    igEnd();
}