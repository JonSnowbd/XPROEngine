const std = @import("std");
const ray = @import("raylib");

pub fn main() anyerror!void {
    ray.SetConfigFlags(@enumToInt(ray.ConfigFlag.FLAG_WINDOW_RESIZABLE));
    ray.InitWindow(640,360,"Testing");
    ray.SetTargetFPS(60);

    var tex = ray.Texture2D.init("content/zig.png");

    while(!ray.WindowShouldClose()) {
        ray.BeginDrawing();
        ray.ClearBackground(ray.WHITE);
        var w = @divFloor(ray.GetScreenWidth(), 2);
        var h = @divFloor(ray.GetScreenHeight(), 2);

        ray.DrawTexture(tex, w-@divFloor(tex.width,2), h-@divFloor(tex.height,2), ray.WHITE);
        ray.EndDrawing();
    }

    ray.CloseWindow();
}
