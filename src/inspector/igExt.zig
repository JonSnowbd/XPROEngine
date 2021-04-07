const std = @import("std");
const xpro = @import("../xpro.zig");

usingnamespace @import("imgui");

pub fn igSelectableAuto(text: [*c]const u8, selected: bool, flags: ImGuiSelectableFlags) bool {
    var a: ImVec2 = undefined;
    igGetContentRegionAvail(&a);
    a.y = igGetFontSize()+2.0;
    return igSelectableBool(text, selected, flags, a);
}