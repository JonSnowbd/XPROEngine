const std = @import("std");
const xpro = @import("xpro.zig");

pub var Error     = xpro.Color{.r=220,.g=100,.b=100,.a=240};
pub var Debug     = xpro.Color{.r=220,.g=100,.b=220,.a=240};
pub var Info      = xpro.Color{.r=190,.g=190,.b=230,.a=240};
pub var Inspector = xpro.Color{.r=220,.g=100,.b=100,.a=240};

pub var Main  = xpro.Color{.r=240,.g=240,.b=240,.a=255};
pub var Clear = xpro.Color{.r=9,.g=11,.b=20,.a=255};

pub var EditorLeftPanelWidth:f32 = 300;
pub var EditorBottomPanelHeight:f32 = 130;
pub var EditorPadding:f32 = 4;
