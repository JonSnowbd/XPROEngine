const std = @import("std");
const xpro = @import("xpro.zig");

usingnamespace @import("imgui");
usingnamespace @import("raylib");
usingnamespace rlgl;

var allocator: *std.mem.Allocator = std.heap.page_allocator;
var fontTex: Texture2D = undefined;

fn buildFont() void {
    var io: *ImGuiIO = igGetIO();

    // init window has to have been called by now.
    var w: c_int = -1;
    var h: c_int = -1;
    var pixels: [*c]u8 = undefined;
    ImFontAtlas_GetTexDataAsRGBA32(io.Fonts, &pixels, &w, &h, null);

    var fontAtlas: Image = Image{
        .data = pixels,
        .width = w,
        .height = h,
        .mipmaps = 1,
        .format = PixelFormat.UNCOMPRESSED_R8G8B8A8
    };
    fontTex = Texture2D.initFromImage(fontAtlas);
    io.Fonts.*.TexID = fontTex.forImgui();

    UnloadImage(fontAtlas);
}

pub fn init() void {
    igSetCurrentContext(igCreateContext(null));
    var io: *ImGuiIO = igGetIO();

    buildFont();

    rlEnableScissorTest();
    io.BackendPlatformName = "cimgui_impl_xpro_raylib";
    io.KeyMap[ImGuiKey_Tab] = @enumToInt(KeyboardKey.KEY_TAB);
    io.KeyMap[ImGuiKey_Home] = @enumToInt(KeyboardKey.KEY_HOME);
    io.KeyMap[ImGuiKey_Insert] = @enumToInt(KeyboardKey.KEY_INSERT);
    io.KeyMap[ImGuiKey_KeyPadEnter] = @enumToInt(KeyboardKey.KEY_KP_ENTER);
    io.KeyMap[ImGuiKey_Escape] = @enumToInt(KeyboardKey.KEY_ESCAPE);
    io.KeyMap[ImGuiKey_Backspace] = @enumToInt(KeyboardKey.KEY_BACKSPACE);
    io.KeyMap[ImGuiKey_End] = @enumToInt(KeyboardKey.KEY_END);

    io.KeyMap[ImGuiKey_LeftArrow] = @enumToInt(KeyboardKey.KEY_LEFT);
    io.KeyMap[ImGuiKey_RightArrow] = @enumToInt(KeyboardKey.KEY_RIGHT);
    io.KeyMap[ImGuiKey_UpArrow] = @enumToInt(KeyboardKey.KEY_UP);
    io.KeyMap[ImGuiKey_DownArrow] = @enumToInt(KeyboardKey.KEY_DOWN);

    io.KeyMap[ImGuiKey_PageUp] = @enumToInt(KeyboardKey.KEY_PAGE_UP);
    io.KeyMap[ImGuiKey_PageDown] = @enumToInt(KeyboardKey.KEY_PAGE_DOWN);
    io.KeyMap[ImGuiKey_Space] = @enumToInt(KeyboardKey.KEY_SPACE);
    io.KeyMap[ImGuiKey_V] = @enumToInt(KeyboardKey.KEY_V);
    io.KeyMap[ImGuiKey_X] = @enumToInt(KeyboardKey.KEY_X);
    io.KeyMap[ImGuiKey_Z] = @enumToInt(KeyboardKey.KEY_Z);
    io.KeyMap[ImGuiKey_A] = @enumToInt(KeyboardKey.KEY_A);
    io.KeyMap[ImGuiKey_C] = @enumToInt(KeyboardKey.KEY_C);
}

pub fn deinit() void {
    UnloadTexture(fontTex);
}

/// Sets up a new frame with the io, with updated input.
pub fn newFrame() void {
    var io: *ImGuiIO = igGetIO();

    io.DisplaySize = ImVec2{.x=@intToFloat(f32, GetScreenWidth()), .y=@intToFloat(f32, GetScreenHeight())};
    io.DeltaTime = GetFrameTime();

    io.KeyCtrl = IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL) or IsKeyDown(KeyboardKey.KEY_RIGHT_CONTROL);
    io.KeyShift = IsKeyDown(KeyboardKey.KEY_LEFT_SHIFT) or IsKeyDown(KeyboardKey.KEY_RIGHT_SHIFT);
    io.KeyAlt = IsKeyDown(KeyboardKey.KEY_LEFT_ALT) or IsKeyDown(KeyboardKey.KEY_RIGHT_ALT);
    io.KeySuper = IsKeyDown(KeyboardKey.KEY_LEFT_SUPER) or IsKeyDown(KeyboardKey.KEY_RIGHT_SUPER);

    var mwheel = GetMouseWheelMove();
    if(mwheel > 0.0) {
        io.MouseWheel += 1.0;
    }else if( mwheel < 0.0) {
        io.MouseWheel -= 1.0;
    }

    io.MousePos = ImVec2{.x=@intToFloat(f32, GetMouseX()),.y=@intToFloat(f32, GetMouseY())};
    io.MouseDown[ImGuiMouseButton_Left] = IsMouseButtonDown(MouseButton.MOUSE_LEFT_BUTTON);
    io.MouseDown[ImGuiMouseButton_Right] = IsMouseButtonDown(MouseButton.MOUSE_RIGHT_BUTTON);
    io.MouseDown[ImGuiMouseButton_Middle] = IsMouseButtonDown(MouseButton.MOUSE_MIDDLE_BUTTON);

    var cur = igGetMouseCursor();
    if(io.MouseDrawCursor and cur == ImGuiMouseCursor_None) {
        HideCursor();
    }
    if(!io.MouseDrawCursor and cur != ImGuiMouseCursor_None) {
        ShowCursor();
    }

    // todo feed character presses
    // var ch = GetCharPressed();
    // while()

    updateKeys();
    igNewFrame();
}


fn vert(vertex: ImDrawVert) void {
    var c = @bitCast([4]u8, vertex.col);
    rlColor4ub(c[0],c[1],c[2],c[3]);
    rlTexCoord2f(vertex.uv.x, vertex.uv.y);
    rlVertex2f(vertex.pos.x, vertex.pos.y);
}
fn tri(count: usize, indexBuf: [*c]ImDrawIdx, indexVert: [*c]ImDrawVert, textureId: c_uint) void {
    var i: usize = 0;
    while(i <= (count - 3)) : (i += 3) {
        rlPushMatrix();
        rlBegin(4);
        rlSetTexture(textureId);

        vert(indexVert[indexBuf[i]]);
        vert(indexVert[indexBuf[i+1]]);
        vert(indexVert[indexBuf[i+2]]);

        rlSetTexture(0);
        rlEnd();
        rlPopMatrix();
    }
}
pub fn flush() void {
    // DrawTexture(fontTex, 0, 0, WHITE);
    igRender();
    var dd: *ImDrawData = igGetDrawData();

    rlDisableBackfaceCulling();

    if(dd.CmdLists == null) {
        rlEnableBackfaceCulling();
        return;
    }
    var n: usize = 0;
    while(n < @intCast(usize, dd.CmdListsCount)) : (n += 1) {

        var draws: *ImDrawList = dd.CmdLists[n];
        var vertBuf: [*c]ImDrawVert = draws.VtxBuffer.Data;
        var indBuf: [*c]ImDrawIdx = draws.IdxBuffer.Data;

        var i: usize = 0;
        while (i < draws.CmdBuffer.Size) : (i += 1) {
            var cmd: ImDrawCmd = draws.CmdBuffer.Data[i];
            if(cmd.UserCallback != null) {
                cmd.UserCallback.?(draws, &cmd);
            } else {
                var pos = dd.DisplayPos;
                var rX = @floatToInt(c_int, cmd.ClipRect.x - pos.x);
                var rY = @floatToInt(c_int, cmd.ClipRect.y - pos.y);
                var rW = @floatToInt(c_int, cmd.ClipRect.z - @intToFloat(f32, rX));
                var rH = @floatToInt(c_int, cmd.ClipRect.w - @intToFloat(f32, rY));

                BeginScissorMode(rX,rY,rW,rH);

                var tex: *c_uint = @ptrCast(*c_uint, @alignCast(4,cmd.TextureId.?));
                tri(cmd.ElemCount, indBuf, vertBuf, tex.*);
            }
            indBuf += cmd.ElemCount;
        }
    }

    EndScissorMode();
    rlEnableBackfaceCulling();
}

fn updateKeys() void {
    var io: *ImGuiIO = igGetIO();

    inline for(@typeInfo(KeyboardKey).Enum.fields) |enumField| {
        io.KeysDown[@intCast(usize, enumField.value)] = IsKeyDown(@intToEnum(KeyboardKey, @intCast(c_int, enumField.value)));
    }
}