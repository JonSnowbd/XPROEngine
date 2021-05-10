const std = @import("std");
const xpro = @import("../xpro.zig");

usingnamespace xpro.imgui;
const editFlags = 
    ImGuiWindowFlags_NoMove |
    ImGuiWindowFlags_NoResize |
    ImGuiWindowFlags_NoCollapse |
    ImGuiWindowFlags_NoTitleBar |
    ImGuiWindowFlags_MenuBar;

var statWindowOpen = false;
var demoWindowOpen = false;

pub const prefabPair = struct {
    name: []const u8,
    spawnFn: ?fn() xpro.Entity,
};
pub var prefabs: std.ArrayList(prefabPair) = undefined;
var selectedEntity: ?xpro.Entity = null;

pub fn run(filePath: []const u8, scene: *xpro.scene.Container) void {
    igSetNextWindowPos(ImVec2{.x=xpro.theme.EditorPadding,.y=xpro.theme.EditorPadding}, ImGuiCond_Always, ImVec2.zero);
    igSetNextWindowSize(ImVec2{.x=xpro.theme.EditorLeftPanelWidth, .y=@intToFloat(f32, xpro.raylib.GetScreenHeight()) - xpro.theme.EditorPadding * 2}, ImGuiCond_Always);
    if(igBegin("Editor", null, editFlags)) {

        // Menu top bar
        if(igBeginMenuBar()) {
            if(igBeginMenu("File", true)) {
                if(igMenuItem_Bool("Save", null, false, true)) {
                    var stream = xpro.serialization.serialize(std.heap.page_allocator, &scene.world);
                    xpro.tools.logFmt("Serializing {any} bytes into '{s}'", .{stream.backing.items.len, filePath});
                    var p = std.fs.path.join(xpro.mem.ringBuffer, &[_][]const u8{xpro.basePath,filePath}) catch unreachable;
                    std.fs.cwd().writeFile(p,stream.backing.items) catch unreachable;
                }
                if(igMenuItem_Bool("Load", null, false, true)) {
                    var baseFolder = std.fs.openDirAbsolute(xpro.basePath, .{}) catch unreachable;
                    defer baseFolder.close();
                    var bytes: []const u8 = baseFolder.readFileAlloc(std.heap.page_allocator, filePath, 33554432) catch unreachable; // 32mb

                    var stream = xpro.binarySerializer.BinaryStream.init(std.heap.page_allocator);
                    defer stream.deinit();
                    for(bytes) |b| { stream.backing.append(b) catch unreachable; }
                    xpro.serialization.deserialize(std.heap.page_allocator, &stream, &scene.world);
                }
                if(igMenuItem_Bool("Close Editor", null, false, true)) {
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

        // Tabs
        if(igBeginTabBar("EditorTabBar", ImGuiTabBarFlags_None)) {
            if(igBeginTabItem("Entity", null, ImGuiTabItemFlags_None)) {
                entityPanel();
                igEndTabItem();
            }
            if(igBeginTabItem("Library", null, ImGuiTabItemFlags_None)) {
                libraryPanel();
                igEndTabItem();
            }
        }
        igEndTabBar();
    }
    igEnd();

    statWindow();
    demoWindow();
}

fn entityPanel() void {
    var scene = xpro.currentScene;
    var view = xpro.World.view(&scene.world, .{xpro.components.Editable, xpro.components.Name}, .{});
    var iter = view.iterator();
    if(igBeginChild_Str("EditorEntityList##EEL_XPRO", ImVec2{.x=0, .y=200}, true, ImGuiWindowFlags_None)) {
        while(iter.next()) |ent| {
            const name = view.getConst(xpro.components.Name, ent);
            var sel = if(selectedEntity == null) false else selectedEntity.? == ent;
            if(igSelectable_Bool(name.value.ptr, sel, ImGuiSelectableFlags_SpanAvailWidth, ImVec2{.x=0,.y=igGetFontSize()})) {
                selectedEntity = ent;
            }
        }
        igEndChild();
    }

    if(selectedEntity != null) {
        scene.world.get(xpro.components.Editable, selectedEntity.?).editor(&scene.world, selectedEntity.?);
    }
}
fn libraryPanel() void {
    var scene = xpro.currentScene;
    var enabled = false;
    for(prefabs.items) |*p| {
        if(p.spawnFn == null) {
            enabled = xpro.imgui.igCollapsingHeader_BoolPtr(p.name.ptr, null, ImGuiTreeNodeFlags_None);
        } else if(enabled) {
            if(igSelectable_Bool(p.name.ptr, false, ImGuiSelectableFlags_SpanAvailWidth, ImVec2{.x=0,.y=igGetFontSize()})) {
                _ = p.spawnFn.?();
            }
        }
    }
}
fn statWindow() void {
    if(!statWindowOpen) return;
    if(igBegin("Stats##XPROStatsWindow", &statWindowOpen, ImGuiWindowFlags_AlwaysAutoResize)) {
        igXproSpanImage("content/xpro.png");

        igFmtText("FPS: {d:.1}", .{1.0 / xpro.dt});
        igFmtText("Cam ({d:.1},{d:.1}) x {d:.1}", .{xpro.cam.target.x, xpro.cam.target.y, xpro.cam.zoom});
        igFmtText("Timescale {d:.1}", .{xpro.timeScale});
    }
    igEnd();
}
fn demoWindow() void {
    if(!demoWindowOpen) return;
    igShowDemoWindow(&demoWindowOpen);
}