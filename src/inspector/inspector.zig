// pub const editor = @import("editors.zig");
// const std = @import("std");
// const gk = @import("gamekit");
// const ecs = @import("ecs");
// const xpro = @import("../xpro.zig");

// usingnamespace @import("imgui");
// usingnamespace @import("igExt.zig");

// const cmp = @import("../ecs/components.zig");

// var selectedEntity: ?ecs.Entity = null;

// fn _chatlog() void {
    
// }
// fn _inspector(world: *xpro.scene.Container, reg: *ecs.Registry) void {
//     var view = ecs.Registry.view(reg, .{cmp.Editable, cmp.Name}, .{});
//     var iter = view.iterator();

//     // The list of every entity in the scene.
//     // Note: ImGui selectables use the string as the unique ID of each element, todo: create unique id
//     // for each ent in the loop to avoid same name elements from sharing click logic.
//     igText("Entity List");
//     var height = @intToFloat(f32, gk.window.height()) * 0.33;
//     _ = igBeginChildStr("###EntityList", ImVec2{.x=0,.y=height}, true, ImGuiWindowFlags_None);
//     while(iter.next()) |ent| {
//         const name = view.getConst(cmp.Name, ent);
//         if(igSelectableAuto(name.value.ptr, ent == selectedEntity, ImGuiSelectableFlags_None)) {
//             selectedEntity = ent;
//         }
//     }
//     if(igSelectableAuto("None", false, ImGuiSelectableFlags_None)) {
//         selectedEntity = null;
//     }
//     igEndChild();

//     if(selectedEntity != null) {
//         var ent = selectedEntity.?;
//         const name = reg.getConst(cmp.Name, ent);
//         const ed: cmp.Editable = reg.getConst(cmp.Editable, ent);

//         var x: []const u8 = std.fmt.allocPrint(xpro.mem.ringBuffer, "Editing <{s}>", .{name.value}) catch "Couldnt load name";
//         igText(x.ptr);
//         igSeparator();
//         if(ed.editor != null)
//             ed.editor.?(world, reg, ent);
//     }
// }

// pub fn update(world: *xpro.scene.Container) void {
//     const flags = 
//         ImGuiWindowFlags_NoCollapse |
//         ImGuiWindowFlags_NoMove |
//         ImGuiWindowFlags_NoResize |
//         ImGuiWindowFlags_NoSavedSettings;
    
//     igSetNextWindowPos(ImVec2{.x=4,.y=5}, ImGuiCond_Always, ImVec2{.x=0,.y=0});
//     var height = @intToFloat(f32, gk.window.height() - 8);
//     igSetNextWindowSize(ImVec2{.x=360,.y=height-1},ImGuiCond_Always);

//     _ = igBegin("Inspector", null, flags);

//     _inspector(world, &world.register);

//     igEnd();

//     if(gk.input.mouseDown(.middle)) {
//         xpro.cam.pos = xpro.cam.pos.subv(xpro.mouseDelta);
//     }
// }