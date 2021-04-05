const std = @import("std");
const xpro = @import("../xpro.zig");

usingnamespace @import("imgui");

pub fn igFilledSelectable(text: [*c]const u8, flags: ImGuiSelectableFlags) bool {
    var a: ImVec2 = undefined;
    igGetContentRegionAvail(&a);
    a.y = igGetFontSize();
    return igSelectableBool(text, false, flags, a);
}