const std = @import("std");
const xpro = @import("../xpro.zig");
usingnamespace xpro.imgui;

const bufSize = 1024;

// List of every log text.
pub var log: std.ArrayList([]const u8) = undefined;
pub var cmds: std.StringHashMap(fn([]const u8) void) = undefined;
// The input buffer for the console input text.
var input: [bufSize:0]u8 = undefined;
var allocator: *std.mem.Allocator = undefined;

pub fn init(alloc: *std.mem.Allocator) void {
    allocator = alloc;
    cmds = std.StringHashMap(fn([]const u8) void).init(alloc);
    log = std.ArrayList([]const u8).init(allocator);
}


const flags = ImGuiWindowFlags_NoResize |
 ImGuiWindowFlags_NoTitleBar |
 ImGuiWindowFlags_NoSavedSettings |
 ImGuiWindowFlags_NoMove;

pub fn run() void {
    var style = igGetStyle();

    var size = ImVec2{
        .x=@intToFloat(f32,xpro.raylib.GetScreenWidth()) - xpro.theme.EditorLeftPanelWidth - (xpro.theme.EditorPadding * 2),
        .y=xpro.theme.EditorBottomPanelHeight
    };
    var pos = ImVec2{
        .x=xpro.theme.EditorLeftPanelWidth + xpro.theme.EditorPadding * 2,
        .y=@intToFloat(f32,xpro.raylib.GetScreenHeight()) - xpro.theme.EditorPadding - size.y
    };
    igSetNextWindowPos(pos, ImGuiCond_Always, ImVec2.zero);
    igSetNextWindowSize(size, ImGuiCond_Always);
    if(igBegin("Console##XPRO_CONSOLE", null, flags)) {

        // Calculate remaining space for the child to fill.
        var avail = ImVec2{};
        igGetContentRegionAvail(&avail);
        avail.y -= style.*.ItemSpacing.y+igGetFontSize()+style.*.WindowPadding.y;

        if(igBeginChild_Str("ConsoleInner##XPRO_CONSOLE_INNER_LINES", .{.x=0,.y=avail.y}, true, ImGuiWindowFlags_None)) {
            for(log.items) |message| {
                igTextWrapped(message.ptr);
            }
            if(igGetScrollY() >= igGetScrollMaxY())  {igSetScrollHereY(1.0);}
        }
        igEndChild();

        // Input text bar.
        igPushItemWidth(igGetWindowContentRegionWidth());
        if(igInputTextWithHint("##XPRO_CONSOLE_INPUT", "Command", &input, bufSize, ImGuiInputTextFlags_EnterReturnsTrue, null, null)) {

            // var copiedMem = allocator.alloc(u8, )
            var delimited: []const u8 = allocator.dupe(u8, std.mem.spanZ(&input)) catch unreachable;
            xpro.tools.logFmt("> {s}", .{delimited});
            if(std.mem.count(u8, delimited, " ") == 0) { // Contains no spaces

                if(cmds.contains(delimited)) {
                    cmds.get(delimited).?(delimited);
                }

            } else { // Contains a space

                var tokenIter = std.mem.tokenize(&input, " ");
                var commandBytes = tokenIter.next();
                if(commandBytes != null) {
                    if(cmds.contains(commandBytes.?)) {
                        cmds.get(commandBytes.?).?(delimited);
                    }
                }

            }

            allocator.free(delimited);
            for(input) |*c| {
                if(c.* == 0) break;
                c.* = 0;
            }
            igSetKeyboardFocusHere(0);
        }
        igPopItemWidth();

        var winvec = ImVec2{};
        igGetWindowSize(&winvec);
        
    }
    igEnd();
}