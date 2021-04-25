const std = @import("std");
const xpro = @import("../xpro.zig");

usingnamespace xpro.imgui;
const editFlags = 
    ImGuiWindowFlags_NoSavedSettings |
    ImGuiWindowFlags_NoTitleBar |
    ImGuiWindowFlags_NoMove |
    ImGuiWindowFlags_NoResize |
    ImGuiWindowFlags_MenuBar;

pub var editorOpen = false;
var statWindowOpen = false;
var demoWindowOpen = false;

pub fn run() void {
    if(!editorOpen) return;
    var scene = &xpro.currentScene;
    igSetNextWindowPos(ImVec2{.x=4,.y=4}, ImGuiCond_Always, ImVec2.zero);
    igSetNextWindowSize(ImVec2{.x=300, .y=@intToFloat(f32, xpro.raylib.GetScreenHeight()) - 8}, ImGuiCond_Always);
    if(igBegin("Editor", null, editFlags)) {

        if(igBeginMenuBar()) {
            if(igBeginMenu("File", true)) {
                _ = igMenuItem_Bool("Save (WIP)", null, false, true);
                _ = igMenuItem_Bool("Load (WIP)", null, false, true);
                if(igMenuItem_Bool("Close", null, false, true)) {
                    xpro.debug = false;
                }
                if(igMenuItem_Bool("Exit Game", null, false, true)) {
                    xpro.raylib.CloseWindow();
                }
                igEndMenu();
            }
            
            if(igBeginMenu("View", true)) {
                if(igMenuItem_Bool("Stats", null, statWindowOpen, true)) {
                    statWindowOpen = !statWindowOpen;
                }
                if(igMenuItem_Bool("Demo", null, demoWindowOpen, true)) {
                    demoWindowOpen = !demoWindowOpen;
                }
                igEndMenu();
            }

            igEndMenuBar();
        }

        if(igBeginTabBar("EditorTabBar", ImGuiTabBarFlags_None)) {
            if(igBeginTabItem("Entity", null, ImGuiTabItemFlags_None)) {
                entityPanel();
            }
            igEndTabItem();
        }
        igEndTabBar();

    }
    igEnd();

    statWindow();
    demoWindow();
}

fn entityPanel() void {
    var scene = &xpro.currentScene;
    var view = xpro.World.view(&scene.register, .{xpro.components.Editable, xpro.components.Name}, .{});
    var iter = view.iterator();
    if(igBeginChild_Str("EditorEntityList##EEL_XPRO", ImVec2{.x=0, .y=200}, true, ImGuiWindowFlags_None)) {
        while(iter.next()) |ent| {
            const name = view.getConst(xpro.components.Name, ent);
            _ = igSelectable_Bool(name.value.ptr, false, ImGuiSelectableFlags_SpanAvailWidth, ImVec2{.x=0,.y=20});
        }
        igEndChild();
    }

}
fn statWindow() void {
    if(!statWindowOpen) return;
    if(igBegin("Stats##XPROStatsWindow", &statWindowOpen, ImGuiWindowFlags_AlwaysAutoResize)) {
        igXproSpanImage("content/xpro.png");

        igFmtText("FPS: {d:.1}", .{1.0 / xpro.dt});
        igFmtText("Cam ({d:.1},{d:.1}) x {d:.1}", .{xpro.cam.target.x, xpro.cam.target.y, xpro.cam.zoom});
        igText("Timescale 1.0");

        // var xx = std.fmt.allocPrint(xpro.mem.ringBuffer, "{d:.1}fps", .{1.0/xpro.dt}) catch unreachable;
    }
    igEnd();
}
fn demoWindow() void {
    if(!demoWindowOpen) return;
    igShowDemoWindow(&demoWindowOpen);
}