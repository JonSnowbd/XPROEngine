const std = @import("std");
const ecs = @import("ecs");
const xpro = @import("../xpro.zig");
const gk = @import("gamekit");

const cmp = xpro.component;
const render = xpro.render;

usingnamespace @import("imgui");

var selectedTile: i32 = 0;

pub fn tilemapEditor(scene: *xpro.scene.Container, reg: *ecs.Registry, target: ecs.Entity) void {
    var io = igGetIO();

    const pos = reg.getConst(cmp.Position, target);
    var tile = reg.get(cmp.Tilemap, target);
    
    if(!io.WantCaptureMouse) {
        // This means cursor is in world.
        var curPosX: f32 = std.math.clamp(@floor((xpro.worldMousePos.x - pos.value.x) / tile.tileSize),0, @intToFloat(f32, tile.xSize-1));
        var curPosXU: usize = @floatToInt(usize, curPosX);
        var curPosY: f32 = std.math.clamp(@floor((xpro.worldMousePos.y - pos.value.y) / tile.tileSize),0,@intToFloat(f32, tile.ySize-1));
        var curPosYU: usize = @floatToInt(usize, curPosY);
        render.rectHollow(1000, curPosX * tile.tileSize, curPosY * tile.tileSize, tile.tileSize, tile.tileSize, 1, gk.math.Color.white, null);
        if(gk.input.mouseDown(.left)) {
            tile.data[curPosYU][curPosXU] = selectedTile;
        }

    }
    
    var wht = ImVec4{.x=1.0,.y=1.0,.z=1.0,.w=1.0};
    var blk = ImVec4{.x=0.0,.y=0.0,.z=0.0,.w=1.0};
    var siz = ImVec2.init(30,30);
    var img = tile.texture;
    var total = tile.sourceLookup.len;

    var j: usize = 0;
    var rowBreak: usize = @floatToInt(usize, img.width / tile.tileSize);
    while(j < total) {
        var sourceRect = tile.sourceLookup[j];
        var tl = ImVec2.init(@intToFloat(f32, sourceRect.x) / img.width, @intToFloat(f32, sourceRect.y) / img.height);
        var br = ImVec2.init(@intToFloat(f32, sourceRect.x+sourceRect.w) / img.width, @intToFloat(f32, sourceRect.y+sourceRect.h) / img.height);

        if(@intCast(i32, j) == selectedTile) {
            igImage(img.imTextureID(),siz,tl,br,wht,wht);
        } else {
            igImage(img.imTextureID(),siz,tl,br,wht,blk);
        }
        if(igIsItemClicked(ImGuiMouseButton_Left)) {
            selectedTile = @intCast(i32, j);
        }

        if(@mod(j+1, rowBreak) != 0) {
            igSameLine(0,3);
        }
        j+=1;
    }
}