const std = @import("std");
const xpro = @import("../xpro.zig");

pub var consoleOpen: bool = false;
pub var lines: i32 = 6;
usingnamespace xpro.imgui;

pub var log: std.ArrayList([]const u8) = undefined;
var input: [1024]u8 = undefined;

var allocator: *std.mem.Allocator = undefined;

pub fn init(alloc: *std.mem.Allocator) void {
    allocator = alloc;
    log = std.ArrayList([]const u8).init(allocator);
    input = std.mem.zeroes([1024]u8);
}

pub fn run() void {
    if(!consoleOpen) return;
    var style = xpro.imgui.igGetStyle();
    var linesF = @intToFloat(f32, lines);
    const totalHeight: f32 = (igGetFontSize()*linesF)+(style.*.ItemSpacing.y*((linesF*2)-2));
    if(igBegin("Console##XPRO_CONSOLE", &consoleOpen, ImGuiWindowFlags_None)) {

        var avail = ImVec2{};
        xpro.imgui.igGetContentRegionAvail(&avail);

        avail.y -= style.*.ItemSpacing.y+igGetFontSize()+style.*.WindowPadding.y;

        // Calculate the height to fill the request line count.
        
        if(igBeginChild_Str("ConsoleInner##XPRO_CONSOLE_INNER_LINES", .{.x=0,.y=avail.y}, true, ImGuiWindowFlags_None)) {
            for(log.items) |message| {
                igText(message.ptr);
            }
            if(igGetScrollY() >= igGetScrollMaxY())  {igSetScrollHereY(1.0);}
        }
        igEndChild();

        // Input text bar.
        igPushItemWidth(igGetWindowContentRegionWidth());
        if(igInputTextWithHint("##XPRO_CONSOLE_INPUT", "Command", &input, 1024, ImGuiInputTextFlags_EnterReturnsTrue, null, null)) {
            var message: []const u8 = allocator.dupeZ(u8, &input) catch unreachable;
            xpro.log(message);
            input = std.mem.zeroes([1024]u8);
            igSetKeyboardFocusHere(0);
        }
        igPopItemWidth();

        var winvec = ImVec2{};
        xpro.imgui.igGetWindowSize(&winvec);
        
    }
    igEnd();
}

pub fn add(message: []const u8) void {

}