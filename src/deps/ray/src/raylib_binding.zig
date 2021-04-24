pub usingnamespace @import("std").c.builtins;
pub const __builtin_va_list = [*c]u8;
pub const va_list = __builtin_va_list;
pub const __gnuc_va_list = __builtin_va_list;
pub const struct_Vector2 = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    pub fn addv(self: Vector2, other: Vector2) Vector2 {
        return .{.x=self.x+other.x, .y=self.y+other.y};
    }
    pub fn subv(self: Vector2, other: Vector2) Vector2 {
        return .{.x=self.x-other.x, .y=self.y-other.y};
    }
    pub fn scaleDiv(self: Vector2, scale: f32) Vector2 {
        return .{.x=self.x/scale, .y= self.y/scale};
    }
};
pub const Vector2 = struct_Vector2;
pub const struct_Vector3 = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    z: f32 = 0,
};
pub const Vector3 = struct_Vector3;
pub const struct_Vector4 = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    z: f32 = 0,
    w: f32 = 0,
};
pub const Vector4 = struct_Vector4;
pub const Quaternion = Vector4;
pub const struct_Matrix = extern struct {
    m0: f32,
    m4: f32,
    m8: f32,
    m12: f32,
    m1: f32,
    m5: f32,
    m9: f32,
    m13: f32,
    m2: f32,
    m6: f32,
    m10: f32,
    m14: f32,
    m3: f32,
    m7: f32,
    m11: f32,
    m15: f32,
};
pub const Matrix = struct_Matrix;
pub const struct_Color = extern struct {
    r: u8 = 255,
    g: u8 = 255,
    b: u8 = 255,
    a: u8 = 255,
};
pub const Color = struct_Color;
pub const struct_Rectangle = extern struct {
    x: f32 = 0,
    y: f32 = 0,
    width: f32 = 0,
    height: f32 = 0,
};
pub const Rectangle = struct_Rectangle;
pub const struct_Image = extern struct {
    data: ?*c_void,
    width: c_int,
    height: c_int,
    mipmaps: c_int,
    format: c_int,
    pub fn init(fileName: [*c]const u8) Image {
        return LoadImage(fileName);
    }

    pub fn initEx(pixels: [*c]Color, width: c_int, height: c_int) Image {
        return LoadImageEx(pixels, width, height);
    }

    pub fn initMemory(fileType: [*c]const u8, data: [*c]const u8, dataSize: c_int) Image {
        return LoadImageFromMemory(fileType, data, dataSize);
    }

    pub fn initRaw(fileName: [*c]const u8, width: c_int, height: c_int, format: PixelFormat, headerSize: c_int) Image {
        return LoadImageRaw(fileName, width, height, format, headerSize);
    }

    pub fn initText(text: [*c]const u8, fontSize: c_int, color: Color) Image {
        return ImageText(text, fontSize, color);
    }

    pub fn initTextEx(font: Font, text: [*c]const u8, fontSize: f32, spacing: f32, tint: Color) Image {
        return ImageTextEx(font, text, fontSize, spacing, tint);
    }

    pub fn copy(image: Image) Image {
        return ImageCopy(image);
    }

    pub fn copyRec(image: Image, rec: Rectangle) Image {
        return ImageFromImage(image, rec);
    }

    pub fn GenColor(width: c_int, height: c_int, color: Color) Image {
        return GenImageColor(width, height, color);
    }

    pub fn GenGradientV(width: c_int, height: c_int, top: Color, bottom: Color) Image {
        return GenImageGradientV(width, height, top, bottom);
    }

    pub fn GenGradientH(width: c_int, height: c_int, left: Color, right: Color) Image {
        return GenImageGradientH(width, height, left, right);
    }

    pub fn GenGradientRadial(width: c_int, height: c_int, density: f32, inner: Color, outer: Color) Image {
        return GenImageGradientRadial(width, height, density, innter, outer);
    }

    pub fn GenChecked(width: c_int, height: c_int, checksX: c_int, checksY: c_int, col1: Color, col2: Color) Image {
        return GenImageChecked(width, height, checksX, checksY, col1, col2);
    }

    pub fn GenWhiteNoise(width: c_int, height: c_int, factor: f32) Image {
        return GenImageWhiteNoise(width, height, factor);
    }

    pub fn GenPerlinNoise(width: c_int, height: c_int, offsetX: c_int, offsetY: c_int, scale: f32) Image {
        return GenImagePerlinNoise(width, height, offsetX, offsetY, scale);
    }

    pub fn GenCellular(width: c_int, height: c_int, tileSize: c_int) Image {
        return GenImageCellular(width, height, tileSize);
    }

    pub fn GetData(self: Image) [*c]Color {
        return GetImageData(self);
    }

    pub fn GetDataNormalized(self: Image) [*c]Color {
        return GetImageDataNormalized(self);
    }

    pub fn UseAsWindowIcon(self: Image) void {
        SetWindowIcon(self);
    }
};
pub const Image = struct_Image;
pub const struct_Texture = extern struct {
    id: c_uint,
    width: c_int,
    height: c_int,
    mipmaps: c_int,
    format: c_int,
    pub fn init(file: [*c]const u8) Texture2D {
        return LoadTexture(file);
    }
    pub fn initFromImage(img: Image) Texture2D {
        return LoadTextureFromImage(img);
    }
    pub fn forImgui(self: *Texture2D) *c_void {
        return @intToPtr(*c_void, self.id);
    }
};
pub const Texture = struct_Texture;
pub const Texture2D = Texture;
pub const TextureCubemap = Texture;
pub const struct_RenderTexture = extern struct {
    id: c_uint,
    texture: Texture,
    depth: Texture,
    pub fn Begin(self: RenderTexture2D) void {
        BeginTextureMode(self);
    }

    pub fn End(self: RenderTexture2D) void {
        EndTextureMode();
    }

    pub fn forImgui(self: *RenderTexture2D) *c_void {
        return &self.id;
    }
};
pub const RenderTexture = struct_RenderTexture;
pub const RenderTexture2D = RenderTexture;
pub const struct_NPatchInfo = extern struct {
    source: Rectangle,
    left: c_int,
    top: c_int,
    right: c_int,
    bottom: c_int,
    layout: c_int,
};
pub const NPatchInfo = struct_NPatchInfo;
pub const struct_CharInfo = extern struct {
    value: c_int,
    offsetX: c_int,
    offsetY: c_int,
    advanceX: c_int,
    image: Image,
};
pub const CharInfo = struct_CharInfo;
pub const struct_Font = extern struct {
    baseSize: c_int,
    charsCount: c_int,
    charsPadding: c_int,
    texture: Texture2D,
    recs: [*c]Rectangle,
    chars: [*c]CharInfo,
};
pub const Font = struct_Font;
pub const struct_Camera3D = extern struct {
    position: Vector3 = .{},
    target: Vector3 = .{},
    up: Vector3,
    fovy: f32,
    projection: c_int,
};
pub const Camera3D = struct_Camera3D;
pub const Camera = Camera3D;
pub const struct_Camera2D = extern struct {
    offset: Vector2 = .{},
    target: Vector2 = .{},
    rotation: f32 = 0,
    zoom: f32 = 1.0,
};
pub const Camera2D = struct_Camera2D;
pub const struct_Mesh = extern struct {
    vertexCount: c_int,
    triangleCount: c_int,
    vertices: [*c]f32,
    texcoords: [*c]f32,
    texcoords2: [*c]f32,
    normals: [*c]f32,
    tangents: [*c]f32,
    colors: [*c]u8,
    indices: [*c]c_ushort,
    animVertices: [*c]f32,
    animNormals: [*c]f32,
    boneIds: [*c]c_int,
    boneWeights: [*c]f32,
    vaoId: c_uint,
    vboId: [*c]c_uint,
};
pub const Mesh = struct_Mesh;
pub const struct_Shader = extern struct {
    id: c_uint,
    locs: [*c]c_int,
};
pub const Shader = struct_Shader;
pub const struct_MaterialMap = extern struct {
    texture: Texture2D,
    color: Color,
    value: f32,
};
pub const MaterialMap = struct_MaterialMap;
pub const struct_Material = extern struct {
    shader: Shader,
    maps: [*c]MaterialMap,
    params: [4]f32,
};
pub const Material = struct_Material;
pub const struct_Transform = extern struct {
    translation: Vector3,
    rotation: Quaternion,
    scale: Vector3,
};
pub const Transform = struct_Transform;
pub const struct_BoneInfo = extern struct {
    name: [32]u8,
    parent: c_int,
};
pub const BoneInfo = struct_BoneInfo;
pub const struct_Model = extern struct {
    transform: Matrix,
    meshCount: c_int,
    materialCount: c_int,
    meshes: [*c]Mesh,
    materials: [*c]Material,
    meshMaterial: [*c]c_int,
    boneCount: c_int,
    bones: [*c]BoneInfo,
    bindPose: [*c]Transform,
};
pub const Model = struct_Model;
pub const struct_ModelAnimation = extern struct {
    boneCount: c_int,
    frameCount: c_int,
    bones: [*c]BoneInfo,
    framePoses: [*c][*c]Transform,
};
pub const ModelAnimation = struct_ModelAnimation;
pub const struct_Ray = extern struct {
    position: Vector3,
    direction: Vector3,
};
pub const Ray = struct_Ray;
pub const struct_RayHitInfo = extern struct {
    hit: bool,
    distance: f32,
    position: Vector3,
    normal: Vector3,
};
pub const RayHitInfo = struct_RayHitInfo;
pub const struct_BoundingBox = extern struct {
    min: Vector3,
    max: Vector3,
};
pub const BoundingBox = struct_BoundingBox;
pub const struct_Wave = extern struct {
    sampleCount: c_uint,
    sampleRate: c_uint,
    sampleSize: c_uint,
    channels: c_uint,
    data: ?*c_void,
};
pub const Wave = struct_Wave;
pub const struct_rAudioBuffer = opaque {};
pub const rAudioBuffer = struct_rAudioBuffer;
pub const struct_AudioStream = extern struct {
    buffer: ?*rAudioBuffer,
    sampleRate: c_uint,
    sampleSize: c_uint,
    channels: c_uint,
};
pub const AudioStream = struct_AudioStream;
pub const struct_Sound = extern struct {
    stream: AudioStream,
    sampleCount: c_uint,
};
pub const Sound = struct_Sound;
pub const struct_Music = extern struct {
    stream: AudioStream,
    sampleCount: c_uint,
    looping: bool,
    ctxType: c_int,
    ctxData: ?*c_void,
};
pub const Music = struct_Music;
pub const struct_VrDeviceInfo = extern struct {
    hResolution: c_int,
    vResolution: c_int,
    hScreenSize: f32,
    vScreenSize: f32,
    vScreenCenter: f32,
    eyeToScreenDistance: f32,
    lensSeparationDistance: f32,
    interpupillaryDistance: f32,
    lensDistortionValues: [4]f32,
    chromaAbCorrection: [4]f32,
};
pub const VrDeviceInfo = struct_VrDeviceInfo;
pub const struct_VrStereoConfig = extern struct {
    projection: [2]Matrix,
    viewOffset: [2]Matrix,
    leftLensCenter: [2]f32,
    rightLensCenter: [2]f32,
    leftScreenCenter: [2]f32,
    rightScreenCenter: [2]f32,
    scale: [2]f32,
    scaleIn: [2]f32,
};
pub const VrStereoConfig = struct_VrStereoConfig;
pub const ConfigFlags = extern enum(c_int) {
    FLAG_VSYNC_HINT = 64,
    FLAG_FULLSCREEN_MODE = 2,
    FLAG_WINDOW_RESIZABLE = 4,
    FLAG_WINDOW_UNDECORATED = 8,
    FLAG_WINDOW_HIDDEN = 128,
    FLAG_WINDOW_MINIMIZED = 512,
    FLAG_WINDOW_MAXIMIZED = 1024,
    FLAG_WINDOW_UNFOCUSED = 2048,
    FLAG_WINDOW_TOPMOST = 4096,
    FLAG_WINDOW_ALWAYS_RUN = 256,
    FLAG_WINDOW_TRANSPARENT = 16,
    FLAG_WINDOW_HIGHDPI = 8192,
    FLAG_MSAA_4X_HINT = 32,
    FLAG_INTERLACED_HINT = 65536,
    _,
};
pub const FLAG_VSYNC_HINT = @enumToInt(ConfigFlags.FLAG_VSYNC_HINT);
pub const FLAG_FULLSCREEN_MODE = @enumToInt(ConfigFlags.FLAG_FULLSCREEN_MODE);
pub const FLAG_WINDOW_RESIZABLE = @enumToInt(ConfigFlags.FLAG_WINDOW_RESIZABLE);
pub const FLAG_WINDOW_UNDECORATED = @enumToInt(ConfigFlags.FLAG_WINDOW_UNDECORATED);
pub const FLAG_WINDOW_HIDDEN = @enumToInt(ConfigFlags.FLAG_WINDOW_HIDDEN);
pub const FLAG_WINDOW_MINIMIZED = @enumToInt(ConfigFlags.FLAG_WINDOW_MINIMIZED);
pub const FLAG_WINDOW_MAXIMIZED = @enumToInt(ConfigFlags.FLAG_WINDOW_MAXIMIZED);
pub const FLAG_WINDOW_UNFOCUSED = @enumToInt(ConfigFlags.FLAG_WINDOW_UNFOCUSED);
pub const FLAG_WINDOW_TOPMOST = @enumToInt(ConfigFlags.FLAG_WINDOW_TOPMOST);
pub const FLAG_WINDOW_ALWAYS_RUN = @enumToInt(ConfigFlags.FLAG_WINDOW_ALWAYS_RUN);
pub const FLAG_WINDOW_TRANSPARENT = @enumToInt(ConfigFlags.FLAG_WINDOW_TRANSPARENT);
pub const FLAG_WINDOW_HIGHDPI = @enumToInt(ConfigFlags.FLAG_WINDOW_HIGHDPI);
pub const FLAG_MSAA_4X_HINT = @enumToInt(ConfigFlags.FLAG_MSAA_4X_HINT);
pub const FLAG_INTERLACED_HINT = @enumToInt(ConfigFlags.FLAG_INTERLACED_HINT);
pub const TraceLogLevel = extern enum(c_int) {
    LOG_ALL = 0,
    LOG_TRACE = 1,
    LOG_DEBUG = 2,
    LOG_INFO = 3,
    LOG_WARNING = 4,
    LOG_ERROR = 5,
    LOG_FATAL = 6,
    LOG_NONE = 7,
    _,
};
pub const LOG_ALL = @enumToInt(TraceLogLevel.LOG_ALL);
pub const LOG_TRACE = @enumToInt(TraceLogLevel.LOG_TRACE);
pub const LOG_DEBUG = @enumToInt(TraceLogLevel.LOG_DEBUG);
pub const LOG_INFO = @enumToInt(TraceLogLevel.LOG_INFO);
pub const LOG_WARNING = @enumToInt(TraceLogLevel.LOG_WARNING);
pub const LOG_ERROR = @enumToInt(TraceLogLevel.LOG_ERROR);
pub const LOG_FATAL = @enumToInt(TraceLogLevel.LOG_FATAL);
pub const LOG_NONE = @enumToInt(TraceLogLevel.LOG_NONE);
pub const KeyboardKey = extern enum(c_int) {
    KEY_NULL = 0,
    KEY_APOSTROPHE = 39,
    KEY_COMMA = 44,
    KEY_MINUS = 45,
    KEY_PERIOD = 46,
    KEY_SLASH = 47,
    KEY_ZERO = 48,
    KEY_ONE = 49,
    KEY_TWO = 50,
    KEY_THREE = 51,
    KEY_FOUR = 52,
    KEY_FIVE = 53,
    KEY_SIX = 54,
    KEY_SEVEN = 55,
    KEY_EIGHT = 56,
    KEY_NINE = 57,
    KEY_SEMICOLON = 59,
    KEY_EQUAL = 61,
    KEY_A = 65,
    KEY_B = 66,
    KEY_C = 67,
    KEY_D = 68,
    KEY_E = 69,
    KEY_F = 70,
    KEY_G = 71,
    KEY_H = 72,
    KEY_I = 73,
    KEY_J = 74,
    KEY_K = 75,
    KEY_L = 76,
    KEY_M = 77,
    KEY_N = 78,
    KEY_O = 79,
    KEY_P = 80,
    KEY_Q = 81,
    KEY_R = 82,
    KEY_S = 83,
    KEY_T = 84,
    KEY_U = 85,
    KEY_V = 86,
    KEY_W = 87,
    KEY_X = 88,
    KEY_Y = 89,
    KEY_Z = 90,
    KEY_SPACE = 32,
    KEY_ESCAPE = 256,
    KEY_ENTER = 257,
    KEY_TAB = 258,
    KEY_BACKSPACE = 259,
    KEY_INSERT = 260,
    KEY_DELETE = 261,
    KEY_RIGHT = 262,
    KEY_LEFT = 263,
    KEY_DOWN = 264,
    KEY_UP = 265,
    KEY_PAGE_UP = 266,
    KEY_PAGE_DOWN = 267,
    KEY_HOME = 268,
    KEY_END = 269,
    KEY_CAPS_LOCK = 280,
    KEY_SCROLL_LOCK = 281,
    KEY_NUM_LOCK = 282,
    KEY_PRINT_SCREEN = 283,
    KEY_PAUSE = 284,
    KEY_F1 = 290,
    KEY_F2 = 291,
    KEY_F3 = 292,
    KEY_F4 = 293,
    KEY_F5 = 294,
    KEY_F6 = 295,
    KEY_F7 = 296,
    KEY_F8 = 297,
    KEY_F9 = 298,
    KEY_F10 = 299,
    KEY_F11 = 300,
    KEY_F12 = 301,
    KEY_LEFT_SHIFT = 340,
    KEY_LEFT_CONTROL = 341,
    KEY_LEFT_ALT = 342,
    KEY_LEFT_SUPER = 343,
    KEY_RIGHT_SHIFT = 344,
    KEY_RIGHT_CONTROL = 345,
    KEY_RIGHT_ALT = 346,
    KEY_RIGHT_SUPER = 347,
    KEY_KB_MENU = 348,
    KEY_LEFT_BRACKET = 91,
    KEY_BACKSLASH = 92,
    KEY_RIGHT_BRACKET = 93,
    KEY_GRAVE = 96,
    KEY_KP_0 = 320,
    KEY_KP_1 = 321,
    KEY_KP_2 = 322,
    KEY_KP_3 = 323,
    KEY_KP_4 = 324,
    KEY_KP_5 = 325,
    KEY_KP_6 = 326,
    KEY_KP_7 = 327,
    KEY_KP_8 = 328,
    KEY_KP_9 = 329,
    KEY_KP_DECIMAL = 330,
    KEY_KP_DIVIDE = 331,
    KEY_KP_MULTIPLY = 332,
    KEY_KP_SUBTRACT = 333,
    KEY_KP_ADD = 334,
    KEY_KP_ENTER = 335,
    KEY_KP_EQUAL = 336,
    KEY_BACK = 4,
    KEY_MENU = 82,
    KEY_VOLUME_UP = 24,
    KEY_VOLUME_DOWN = 25,
    _,
};
pub const KEY_NULL = @enumToInt(KeyboardKey.KEY_NULL);
pub const KEY_APOSTROPHE = @enumToInt(KeyboardKey.KEY_APOSTROPHE);
pub const KEY_COMMA = @enumToInt(KeyboardKey.KEY_COMMA);
pub const KEY_MINUS = @enumToInt(KeyboardKey.KEY_MINUS);
pub const KEY_PERIOD = @enumToInt(KeyboardKey.KEY_PERIOD);
pub const KEY_SLASH = @enumToInt(KeyboardKey.KEY_SLASH);
pub const KEY_ZERO = @enumToInt(KeyboardKey.KEY_ZERO);
pub const KEY_ONE = @enumToInt(KeyboardKey.KEY_ONE);
pub const KEY_TWO = @enumToInt(KeyboardKey.KEY_TWO);
pub const KEY_THREE = @enumToInt(KeyboardKey.KEY_THREE);
pub const KEY_FOUR = @enumToInt(KeyboardKey.KEY_FOUR);
pub const KEY_FIVE = @enumToInt(KeyboardKey.KEY_FIVE);
pub const KEY_SIX = @enumToInt(KeyboardKey.KEY_SIX);
pub const KEY_SEVEN = @enumToInt(KeyboardKey.KEY_SEVEN);
pub const KEY_EIGHT = @enumToInt(KeyboardKey.KEY_EIGHT);
pub const KEY_NINE = @enumToInt(KeyboardKey.KEY_NINE);
pub const KEY_SEMICOLON = @enumToInt(KeyboardKey.KEY_SEMICOLON);
pub const KEY_EQUAL = @enumToInt(KeyboardKey.KEY_EQUAL);
pub const KEY_A = @enumToInt(KeyboardKey.KEY_A);
pub const KEY_B = @enumToInt(KeyboardKey.KEY_B);
pub const KEY_C = @enumToInt(KeyboardKey.KEY_C);
pub const KEY_D = @enumToInt(KeyboardKey.KEY_D);
pub const KEY_E = @enumToInt(KeyboardKey.KEY_E);
pub const KEY_F = @enumToInt(KeyboardKey.KEY_F);
pub const KEY_G = @enumToInt(KeyboardKey.KEY_G);
pub const KEY_H = @enumToInt(KeyboardKey.KEY_H);
pub const KEY_I = @enumToInt(KeyboardKey.KEY_I);
pub const KEY_J = @enumToInt(KeyboardKey.KEY_J);
pub const KEY_K = @enumToInt(KeyboardKey.KEY_K);
pub const KEY_L = @enumToInt(KeyboardKey.KEY_L);
pub const KEY_M = @enumToInt(KeyboardKey.KEY_M);
pub const KEY_N = @enumToInt(KeyboardKey.KEY_N);
pub const KEY_O = @enumToInt(KeyboardKey.KEY_O);
pub const KEY_P = @enumToInt(KeyboardKey.KEY_P);
pub const KEY_Q = @enumToInt(KeyboardKey.KEY_Q);
pub const KEY_R = @enumToInt(KeyboardKey.KEY_R);
pub const KEY_S = @enumToInt(KeyboardKey.KEY_S);
pub const KEY_T = @enumToInt(KeyboardKey.KEY_T);
pub const KEY_U = @enumToInt(KeyboardKey.KEY_U);
pub const KEY_V = @enumToInt(KeyboardKey.KEY_V);
pub const KEY_W = @enumToInt(KeyboardKey.KEY_W);
pub const KEY_X = @enumToInt(KeyboardKey.KEY_X);
pub const KEY_Y = @enumToInt(KeyboardKey.KEY_Y);
pub const KEY_Z = @enumToInt(KeyboardKey.KEY_Z);
pub const KEY_SPACE = @enumToInt(KeyboardKey.KEY_SPACE);
pub const KEY_ESCAPE = @enumToInt(KeyboardKey.KEY_ESCAPE);
pub const KEY_ENTER = @enumToInt(KeyboardKey.KEY_ENTER);
pub const KEY_TAB = @enumToInt(KeyboardKey.KEY_TAB);
pub const KEY_BACKSPACE = @enumToInt(KeyboardKey.KEY_BACKSPACE);
pub const KEY_INSERT = @enumToInt(KeyboardKey.KEY_INSERT);
pub const KEY_DELETE = @enumToInt(KeyboardKey.KEY_DELETE);
pub const KEY_RIGHT = @enumToInt(KeyboardKey.KEY_RIGHT);
pub const KEY_LEFT = @enumToInt(KeyboardKey.KEY_LEFT);
pub const KEY_DOWN = @enumToInt(KeyboardKey.KEY_DOWN);
pub const KEY_UP = @enumToInt(KeyboardKey.KEY_UP);
pub const KEY_PAGE_UP = @enumToInt(KeyboardKey.KEY_PAGE_UP);
pub const KEY_PAGE_DOWN = @enumToInt(KeyboardKey.KEY_PAGE_DOWN);
pub const KEY_HOME = @enumToInt(KeyboardKey.KEY_HOME);
pub const KEY_END = @enumToInt(KeyboardKey.KEY_END);
pub const KEY_CAPS_LOCK = @enumToInt(KeyboardKey.KEY_CAPS_LOCK);
pub const KEY_SCROLL_LOCK = @enumToInt(KeyboardKey.KEY_SCROLL_LOCK);
pub const KEY_NUM_LOCK = @enumToInt(KeyboardKey.KEY_NUM_LOCK);
pub const KEY_PRINT_SCREEN = @enumToInt(KeyboardKey.KEY_PRINT_SCREEN);
pub const KEY_PAUSE = @enumToInt(KeyboardKey.KEY_PAUSE);
pub const KEY_F1 = @enumToInt(KeyboardKey.KEY_F1);
pub const KEY_F2 = @enumToInt(KeyboardKey.KEY_F2);
pub const KEY_F3 = @enumToInt(KeyboardKey.KEY_F3);
pub const KEY_F4 = @enumToInt(KeyboardKey.KEY_F4);
pub const KEY_F5 = @enumToInt(KeyboardKey.KEY_F5);
pub const KEY_F6 = @enumToInt(KeyboardKey.KEY_F6);
pub const KEY_F7 = @enumToInt(KeyboardKey.KEY_F7);
pub const KEY_F8 = @enumToInt(KeyboardKey.KEY_F8);
pub const KEY_F9 = @enumToInt(KeyboardKey.KEY_F9);
pub const KEY_F10 = @enumToInt(KeyboardKey.KEY_F10);
pub const KEY_F11 = @enumToInt(KeyboardKey.KEY_F11);
pub const KEY_F12 = @enumToInt(KeyboardKey.KEY_F12);
pub const KEY_LEFT_SHIFT = @enumToInt(KeyboardKey.KEY_LEFT_SHIFT);
pub const KEY_LEFT_CONTROL = @enumToInt(KeyboardKey.KEY_LEFT_CONTROL);
pub const KEY_LEFT_ALT = @enumToInt(KeyboardKey.KEY_LEFT_ALT);
pub const KEY_LEFT_SUPER = @enumToInt(KeyboardKey.KEY_LEFT_SUPER);
pub const KEY_RIGHT_SHIFT = @enumToInt(KeyboardKey.KEY_RIGHT_SHIFT);
pub const KEY_RIGHT_CONTROL = @enumToInt(KeyboardKey.KEY_RIGHT_CONTROL);
pub const KEY_RIGHT_ALT = @enumToInt(KeyboardKey.KEY_RIGHT_ALT);
pub const KEY_RIGHT_SUPER = @enumToInt(KeyboardKey.KEY_RIGHT_SUPER);
pub const KEY_KB_MENU = @enumToInt(KeyboardKey.KEY_KB_MENU);
pub const KEY_LEFT_BRACKET = @enumToInt(KeyboardKey.KEY_LEFT_BRACKET);
pub const KEY_BACKSLASH = @enumToInt(KeyboardKey.KEY_BACKSLASH);
pub const KEY_RIGHT_BRACKET = @enumToInt(KeyboardKey.KEY_RIGHT_BRACKET);
pub const KEY_GRAVE = @enumToInt(KeyboardKey.KEY_GRAVE);
pub const KEY_KP_0 = @enumToInt(KeyboardKey.KEY_KP_0);
pub const KEY_KP_1 = @enumToInt(KeyboardKey.KEY_KP_1);
pub const KEY_KP_2 = @enumToInt(KeyboardKey.KEY_KP_2);
pub const KEY_KP_3 = @enumToInt(KeyboardKey.KEY_KP_3);
pub const KEY_KP_4 = @enumToInt(KeyboardKey.KEY_KP_4);
pub const KEY_KP_5 = @enumToInt(KeyboardKey.KEY_KP_5);
pub const KEY_KP_6 = @enumToInt(KeyboardKey.KEY_KP_6);
pub const KEY_KP_7 = @enumToInt(KeyboardKey.KEY_KP_7);
pub const KEY_KP_8 = @enumToInt(KeyboardKey.KEY_KP_8);
pub const KEY_KP_9 = @enumToInt(KeyboardKey.KEY_KP_9);
pub const KEY_KP_DECIMAL = @enumToInt(KeyboardKey.KEY_KP_DECIMAL);
pub const KEY_KP_DIVIDE = @enumToInt(KeyboardKey.KEY_KP_DIVIDE);
pub const KEY_KP_MULTIPLY = @enumToInt(KeyboardKey.KEY_KP_MULTIPLY);
pub const KEY_KP_SUBTRACT = @enumToInt(KeyboardKey.KEY_KP_SUBTRACT);
pub const KEY_KP_ADD = @enumToInt(KeyboardKey.KEY_KP_ADD);
pub const KEY_KP_ENTER = @enumToInt(KeyboardKey.KEY_KP_ENTER);
pub const KEY_KP_EQUAL = @enumToInt(KeyboardKey.KEY_KP_EQUAL);
pub const KEY_BACK = @enumToInt(KeyboardKey.KEY_BACK);
pub const KEY_MENU = @enumToInt(KeyboardKey.KEY_MENU);
pub const KEY_VOLUME_UP = @enumToInt(KeyboardKey.KEY_VOLUME_UP);
pub const KEY_VOLUME_DOWN = @enumToInt(KeyboardKey.KEY_VOLUME_DOWN);
pub const MouseButton = extern enum(c_int) {
    MOUSE_LEFT_BUTTON = 0,
    MOUSE_RIGHT_BUTTON = 1,
    MOUSE_MIDDLE_BUTTON = 2,
    _,
};
pub const MOUSE_LEFT_BUTTON = @enumToInt(MouseButton.MOUSE_LEFT_BUTTON);
pub const MOUSE_RIGHT_BUTTON = @enumToInt(MouseButton.MOUSE_RIGHT_BUTTON);
pub const MOUSE_MIDDLE_BUTTON = @enumToInt(MouseButton.MOUSE_MIDDLE_BUTTON);
pub const MouseCursor = extern enum(c_int) {
    MOUSE_CURSOR_DEFAULT = 0,
    MOUSE_CURSOR_ARROW = 1,
    MOUSE_CURSOR_IBEAM = 2,
    MOUSE_CURSOR_CROSSHAIR = 3,
    MOUSE_CURSOR_POINTING_HAND = 4,
    MOUSE_CURSOR_RESIZE_EW = 5,
    MOUSE_CURSOR_RESIZE_NS = 6,
    MOUSE_CURSOR_RESIZE_NWSE = 7,
    MOUSE_CURSOR_RESIZE_NESW = 8,
    MOUSE_CURSOR_RESIZE_ALL = 9,
    MOUSE_CURSOR_NOT_ALLOWED = 10,
    _,
};
pub const MOUSE_CURSOR_DEFAULT = @enumToInt(MouseCursor.MOUSE_CURSOR_DEFAULT);
pub const MOUSE_CURSOR_ARROW = @enumToInt(MouseCursor.MOUSE_CURSOR_ARROW);
pub const MOUSE_CURSOR_IBEAM = @enumToInt(MouseCursor.MOUSE_CURSOR_IBEAM);
pub const MOUSE_CURSOR_CROSSHAIR = @enumToInt(MouseCursor.MOUSE_CURSOR_CROSSHAIR);
pub const MOUSE_CURSOR_POINTING_HAND = @enumToInt(MouseCursor.MOUSE_CURSOR_POINTING_HAND);
pub const MOUSE_CURSOR_RESIZE_EW = @enumToInt(MouseCursor.MOUSE_CURSOR_RESIZE_EW);
pub const MOUSE_CURSOR_RESIZE_NS = @enumToInt(MouseCursor.MOUSE_CURSOR_RESIZE_NS);
pub const MOUSE_CURSOR_RESIZE_NWSE = @enumToInt(MouseCursor.MOUSE_CURSOR_RESIZE_NWSE);
pub const MOUSE_CURSOR_RESIZE_NESW = @enumToInt(MouseCursor.MOUSE_CURSOR_RESIZE_NESW);
pub const MOUSE_CURSOR_RESIZE_ALL = @enumToInt(MouseCursor.MOUSE_CURSOR_RESIZE_ALL);
pub const MOUSE_CURSOR_NOT_ALLOWED = @enumToInt(MouseCursor.MOUSE_CURSOR_NOT_ALLOWED);
pub const GamepadButton = extern enum(c_int) {
    GAMEPAD_BUTTON_UNKNOWN = 0,
    GAMEPAD_BUTTON_LEFT_FACE_UP = 1,
    GAMEPAD_BUTTON_LEFT_FACE_RIGHT = 2,
    GAMEPAD_BUTTON_LEFT_FACE_DOWN = 3,
    GAMEPAD_BUTTON_LEFT_FACE_LEFT = 4,
    GAMEPAD_BUTTON_RIGHT_FACE_UP = 5,
    GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = 6,
    GAMEPAD_BUTTON_RIGHT_FACE_DOWN = 7,
    GAMEPAD_BUTTON_RIGHT_FACE_LEFT = 8,
    GAMEPAD_BUTTON_LEFT_TRIGGER_1 = 9,
    GAMEPAD_BUTTON_LEFT_TRIGGER_2 = 10,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = 11,
    GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = 12,
    GAMEPAD_BUTTON_MIDDLE_LEFT = 13,
    GAMEPAD_BUTTON_MIDDLE = 14,
    GAMEPAD_BUTTON_MIDDLE_RIGHT = 15,
    GAMEPAD_BUTTON_LEFT_THUMB = 16,
    GAMEPAD_BUTTON_RIGHT_THUMB = 17,
    _,
};
pub const GAMEPAD_BUTTON_UNKNOWN = @enumToInt(GamepadButton.GAMEPAD_BUTTON_UNKNOWN);
pub const GAMEPAD_BUTTON_LEFT_FACE_UP = @enumToInt(GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_UP);
pub const GAMEPAD_BUTTON_LEFT_FACE_RIGHT = @enumToInt(GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_RIGHT);
pub const GAMEPAD_BUTTON_LEFT_FACE_DOWN = @enumToInt(GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_DOWN);
pub const GAMEPAD_BUTTON_LEFT_FACE_LEFT = @enumToInt(GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_LEFT);
pub const GAMEPAD_BUTTON_RIGHT_FACE_UP = @enumToInt(GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_UP);
pub const GAMEPAD_BUTTON_RIGHT_FACE_RIGHT = @enumToInt(GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_RIGHT);
pub const GAMEPAD_BUTTON_RIGHT_FACE_DOWN = @enumToInt(GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_DOWN);
pub const GAMEPAD_BUTTON_RIGHT_FACE_LEFT = @enumToInt(GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_LEFT);
pub const GAMEPAD_BUTTON_LEFT_TRIGGER_1 = @enumToInt(GamepadButton.GAMEPAD_BUTTON_LEFT_TRIGGER_1);
pub const GAMEPAD_BUTTON_LEFT_TRIGGER_2 = @enumToInt(GamepadButton.GAMEPAD_BUTTON_LEFT_TRIGGER_2);
pub const GAMEPAD_BUTTON_RIGHT_TRIGGER_1 = @enumToInt(GamepadButton.GAMEPAD_BUTTON_RIGHT_TRIGGER_1);
pub const GAMEPAD_BUTTON_RIGHT_TRIGGER_2 = @enumToInt(GamepadButton.GAMEPAD_BUTTON_RIGHT_TRIGGER_2);
pub const GAMEPAD_BUTTON_MIDDLE_LEFT = @enumToInt(GamepadButton.GAMEPAD_BUTTON_MIDDLE_LEFT);
pub const GAMEPAD_BUTTON_MIDDLE = @enumToInt(GamepadButton.GAMEPAD_BUTTON_MIDDLE);
pub const GAMEPAD_BUTTON_MIDDLE_RIGHT = @enumToInt(GamepadButton.GAMEPAD_BUTTON_MIDDLE_RIGHT);
pub const GAMEPAD_BUTTON_LEFT_THUMB = @enumToInt(GamepadButton.GAMEPAD_BUTTON_LEFT_THUMB);
pub const GAMEPAD_BUTTON_RIGHT_THUMB = @enumToInt(GamepadButton.GAMEPAD_BUTTON_RIGHT_THUMB);
pub const GamepadAxis = extern enum(c_int) {
    GAMEPAD_AXIS_LEFT_X = 0,
    GAMEPAD_AXIS_LEFT_Y = 1,
    GAMEPAD_AXIS_RIGHT_X = 2,
    GAMEPAD_AXIS_RIGHT_Y = 3,
    GAMEPAD_AXIS_LEFT_TRIGGER = 4,
    GAMEPAD_AXIS_RIGHT_TRIGGER = 5,
    _,
};
pub const GAMEPAD_AXIS_LEFT_X = @enumToInt(GamepadAxis.GAMEPAD_AXIS_LEFT_X);
pub const GAMEPAD_AXIS_LEFT_Y = @enumToInt(GamepadAxis.GAMEPAD_AXIS_LEFT_Y);
pub const GAMEPAD_AXIS_RIGHT_X = @enumToInt(GamepadAxis.GAMEPAD_AXIS_RIGHT_X);
pub const GAMEPAD_AXIS_RIGHT_Y = @enumToInt(GamepadAxis.GAMEPAD_AXIS_RIGHT_Y);
pub const GAMEPAD_AXIS_LEFT_TRIGGER = @enumToInt(GamepadAxis.GAMEPAD_AXIS_LEFT_TRIGGER);
pub const GAMEPAD_AXIS_RIGHT_TRIGGER = @enumToInt(GamepadAxis.GAMEPAD_AXIS_RIGHT_TRIGGER);
pub const MaterialMapIndex = extern enum(c_int) {
    MATERIAL_MAP_ALBEDO = 0,
    MATERIAL_MAP_METALNESS = 1,
    MATERIAL_MAP_NORMAL = 2,
    MATERIAL_MAP_ROUGHNESS = 3,
    MATERIAL_MAP_OCCLUSION = 4,
    MATERIAL_MAP_EMISSION = 5,
    MATERIAL_MAP_HEIGHT = 6,
    MATERIAL_MAP_BRDG = 7,
    MATERIAL_MAP_CUBEMAP = 8,
    MATERIAL_MAP_IRRADIANCE = 9,
    MATERIAL_MAP_PREFILTER = 10,
    _,
};
pub const MATERIAL_MAP_ALBEDO = @enumToInt(MaterialMapIndex.MATERIAL_MAP_ALBEDO);
pub const MATERIAL_MAP_METALNESS = @enumToInt(MaterialMapIndex.MATERIAL_MAP_METALNESS);
pub const MATERIAL_MAP_NORMAL = @enumToInt(MaterialMapIndex.MATERIAL_MAP_NORMAL);
pub const MATERIAL_MAP_ROUGHNESS = @enumToInt(MaterialMapIndex.MATERIAL_MAP_ROUGHNESS);
pub const MATERIAL_MAP_OCCLUSION = @enumToInt(MaterialMapIndex.MATERIAL_MAP_OCCLUSION);
pub const MATERIAL_MAP_EMISSION = @enumToInt(MaterialMapIndex.MATERIAL_MAP_EMISSION);
pub const MATERIAL_MAP_HEIGHT = @enumToInt(MaterialMapIndex.MATERIAL_MAP_HEIGHT);
pub const MATERIAL_MAP_BRDG = @enumToInt(MaterialMapIndex.MATERIAL_MAP_BRDG);
pub const MATERIAL_MAP_CUBEMAP = @enumToInt(MaterialMapIndex.MATERIAL_MAP_CUBEMAP);
pub const MATERIAL_MAP_IRRADIANCE = @enumToInt(MaterialMapIndex.MATERIAL_MAP_IRRADIANCE);
pub const MATERIAL_MAP_PREFILTER = @enumToInt(MaterialMapIndex.MATERIAL_MAP_PREFILTER);
pub const ShaderLocationIndex = extern enum(c_int) {
    SHADER_LOC_VERTEX_POSITION = 0,
    SHADER_LOC_VERTEX_TEXCOORD01 = 1,
    SHADER_LOC_VERTEX_TEXCOORD02 = 2,
    SHADER_LOC_VERTEX_NORMAL = 3,
    SHADER_LOC_VERTEX_TANGENT = 4,
    SHADER_LOC_VERTEX_COLOR = 5,
    SHADER_LOC_MATRIX_MVP = 6,
    SHADER_LOC_MATRIX_VIEW = 7,
    SHADER_LOC_MATRIX_PROJECTION = 8,
    SHADER_LOC_MATRIX_MODEL = 9,
    SHADER_LOC_MATRIX_NORMAL = 10,
    SHADER_LOC_VECTOR_VIEW = 11,
    SHADER_LOC_COLOR_DIFFUSE = 12,
    SHADER_LOC_COLOR_SPECULAR = 13,
    SHADER_LOC_COLOR_AMBIENT = 14,
    SHADER_LOC_MAP_ALBEDO = 15,
    SHADER_LOC_MAP_METALNESS = 16,
    SHADER_LOC_MAP_NORMAL = 17,
    SHADER_LOC_MAP_ROUGHNESS = 18,
    SHADER_LOC_MAP_OCCLUSION = 19,
    SHADER_LOC_MAP_EMISSION = 20,
    SHADER_LOC_MAP_HEIGHT = 21,
    SHADER_LOC_MAP_CUBEMAP = 22,
    SHADER_LOC_MAP_IRRADIANCE = 23,
    SHADER_LOC_MAP_PREFILTER = 24,
    SHADER_LOC_MAP_BRDF = 25,
    _,
};
pub const SHADER_LOC_VERTEX_POSITION = @enumToInt(ShaderLocationIndex.SHADER_LOC_VERTEX_POSITION);
pub const SHADER_LOC_VERTEX_TEXCOORD01 = @enumToInt(ShaderLocationIndex.SHADER_LOC_VERTEX_TEXCOORD01);
pub const SHADER_LOC_VERTEX_TEXCOORD02 = @enumToInt(ShaderLocationIndex.SHADER_LOC_VERTEX_TEXCOORD02);
pub const SHADER_LOC_VERTEX_NORMAL = @enumToInt(ShaderLocationIndex.SHADER_LOC_VERTEX_NORMAL);
pub const SHADER_LOC_VERTEX_TANGENT = @enumToInt(ShaderLocationIndex.SHADER_LOC_VERTEX_TANGENT);
pub const SHADER_LOC_VERTEX_COLOR = @enumToInt(ShaderLocationIndex.SHADER_LOC_VERTEX_COLOR);
pub const SHADER_LOC_MATRIX_MVP = @enumToInt(ShaderLocationIndex.SHADER_LOC_MATRIX_MVP);
pub const SHADER_LOC_MATRIX_VIEW = @enumToInt(ShaderLocationIndex.SHADER_LOC_MATRIX_VIEW);
pub const SHADER_LOC_MATRIX_PROJECTION = @enumToInt(ShaderLocationIndex.SHADER_LOC_MATRIX_PROJECTION);
pub const SHADER_LOC_MATRIX_MODEL = @enumToInt(ShaderLocationIndex.SHADER_LOC_MATRIX_MODEL);
pub const SHADER_LOC_MATRIX_NORMAL = @enumToInt(ShaderLocationIndex.SHADER_LOC_MATRIX_NORMAL);
pub const SHADER_LOC_VECTOR_VIEW = @enumToInt(ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW);
pub const SHADER_LOC_COLOR_DIFFUSE = @enumToInt(ShaderLocationIndex.SHADER_LOC_COLOR_DIFFUSE);
pub const SHADER_LOC_COLOR_SPECULAR = @enumToInt(ShaderLocationIndex.SHADER_LOC_COLOR_SPECULAR);
pub const SHADER_LOC_COLOR_AMBIENT = @enumToInt(ShaderLocationIndex.SHADER_LOC_COLOR_AMBIENT);
pub const SHADER_LOC_MAP_ALBEDO = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_ALBEDO);
pub const SHADER_LOC_MAP_METALNESS = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_METALNESS);
pub const SHADER_LOC_MAP_NORMAL = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_NORMAL);
pub const SHADER_LOC_MAP_ROUGHNESS = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_ROUGHNESS);
pub const SHADER_LOC_MAP_OCCLUSION = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_OCCLUSION);
pub const SHADER_LOC_MAP_EMISSION = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_EMISSION);
pub const SHADER_LOC_MAP_HEIGHT = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_HEIGHT);
pub const SHADER_LOC_MAP_CUBEMAP = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_CUBEMAP);
pub const SHADER_LOC_MAP_IRRADIANCE = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_IRRADIANCE);
pub const SHADER_LOC_MAP_PREFILTER = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_PREFILTER);
pub const SHADER_LOC_MAP_BRDF = @enumToInt(ShaderLocationIndex.SHADER_LOC_MAP_BRDF);
pub const ShaderUniformDataType = extern enum(c_int) {
    SHADER_UNIFORM_FLOAT = 0,
    SHADER_UNIFORM_VEC2 = 1,
    SHADER_UNIFORM_VEC3 = 2,
    SHADER_UNIFORM_VEC4 = 3,
    SHADER_UNIFORM_INT = 4,
    SHADER_UNIFORM_IVEC2 = 5,
    SHADER_UNIFORM_IVEC3 = 6,
    SHADER_UNIFORM_IVEC4 = 7,
    SHADER_UNIFORM_SAMPLER2D = 8,
    _,
};
pub const SHADER_UNIFORM_FLOAT = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_FLOAT);
pub const SHADER_UNIFORM_VEC2 = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_VEC2);
pub const SHADER_UNIFORM_VEC3 = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_VEC3);
pub const SHADER_UNIFORM_VEC4 = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_VEC4);
pub const SHADER_UNIFORM_INT = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_INT);
pub const SHADER_UNIFORM_IVEC2 = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_IVEC2);
pub const SHADER_UNIFORM_IVEC3 = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_IVEC3);
pub const SHADER_UNIFORM_IVEC4 = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_IVEC4);
pub const SHADER_UNIFORM_SAMPLER2D = @enumToInt(ShaderUniformDataType.SHADER_UNIFORM_SAMPLER2D);
pub const PixelFormat = extern enum(c_int) {
    PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = 1,
    PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = 2,
    PIXELFORMAT_UNCOMPRESSED_R5G6B5 = 3,
    PIXELFORMAT_UNCOMPRESSED_R8G8B8 = 4,
    PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = 5,
    PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = 6,
    PIXELFORMAT_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = 7,
    PIXELFORMAT_UNCOMPRESSED_R32 = 8,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32 = 9,
    PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = 10,
    PIXELFORMAT_COMPRESSED_DXT1_RGB = 11,
    PIXELFORMAT_COMPRESSED_DXT1_RGBA = 12,
    PIXELFORMAT_COMPRESSED_DXT3_RGBA = 13,
    PIXELFORMAT_COMPRESSED_DXT5_RGBA = 14,
    PIXELFORMAT_COMPRESSED_ETC1_RGB = 15,
    PIXELFORMAT_COMPRESSED_ETC2_RGB = 16,
    PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = 17,
    PIXELFORMAT_COMPRESSED_PVRT_RGB = 18,
    PIXELFORMAT_COMPRESSED_PVRT_RGBA = 19,
    PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = 20,
    PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = 21,
    _,
};
pub const PIXELFORMAT_UNCOMPRESSED_GRAYSCALE = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_GRAYSCALE);
pub const PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA);
pub const PIXELFORMAT_UNCOMPRESSED_R5G6B5 = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_R5G6B5);
pub const PIXELFORMAT_UNCOMPRESSED_R8G8B8 = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_R8G8B8);
pub const PIXELFORMAT_UNCOMPRESSED_R5G5B5A1 = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_R5G5B5A1);
pub const PIXELFORMAT_UNCOMPRESSED_R4G4B4A4 = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_R4G4B4A4);
pub const PIXELFORMAT_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = @enumToInt(PixelFormat.PIXELFORMAT_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8);
pub const PIXELFORMAT_UNCOMPRESSED_R32 = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32);
pub const PIXELFORMAT_UNCOMPRESSED_R32G32B32 = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32);
pub const PIXELFORMAT_UNCOMPRESSED_R32G32B32A32 = @enumToInt(PixelFormat.PIXELFORMAT_UNCOMPRESSED_R32G32B32A32);
pub const PIXELFORMAT_COMPRESSED_DXT1_RGB = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_DXT1_RGB);
pub const PIXELFORMAT_COMPRESSED_DXT1_RGBA = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_DXT1_RGBA);
pub const PIXELFORMAT_COMPRESSED_DXT3_RGBA = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_DXT3_RGBA);
pub const PIXELFORMAT_COMPRESSED_DXT5_RGBA = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_DXT5_RGBA);
pub const PIXELFORMAT_COMPRESSED_ETC1_RGB = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_ETC1_RGB);
pub const PIXELFORMAT_COMPRESSED_ETC2_RGB = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_ETC2_RGB);
pub const PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA);
pub const PIXELFORMAT_COMPRESSED_PVRT_RGB = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_PVRT_RGB);
pub const PIXELFORMAT_COMPRESSED_PVRT_RGBA = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_PVRT_RGBA);
pub const PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA);
pub const PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA = @enumToInt(PixelFormat.PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA);
pub const TextureFilter = extern enum(c_int) {
    TEXTURE_FILTER_POINT = 0,
    TEXTURE_FILTER_BILINEAR = 1,
    TEXTURE_FILTER_TRILINEAR = 2,
    TEXTURE_FILTER_ANISOTROPIC_4X = 3,
    TEXTURE_FILTER_ANISOTROPIC_8X = 4,
    TEXTURE_FILTER_ANISOTROPIC_16X = 5,
    _,
};
pub const TEXTURE_FILTER_POINT = @enumToInt(TextureFilter.TEXTURE_FILTER_POINT);
pub const TEXTURE_FILTER_BILINEAR = @enumToInt(TextureFilter.TEXTURE_FILTER_BILINEAR);
pub const TEXTURE_FILTER_TRILINEAR = @enumToInt(TextureFilter.TEXTURE_FILTER_TRILINEAR);
pub const TEXTURE_FILTER_ANISOTROPIC_4X = @enumToInt(TextureFilter.TEXTURE_FILTER_ANISOTROPIC_4X);
pub const TEXTURE_FILTER_ANISOTROPIC_8X = @enumToInt(TextureFilter.TEXTURE_FILTER_ANISOTROPIC_8X);
pub const TEXTURE_FILTER_ANISOTROPIC_16X = @enumToInt(TextureFilter.TEXTURE_FILTER_ANISOTROPIC_16X);
pub const TextureWrap = extern enum(c_int) {
    TEXTURE_WRAP_REPEAT = 0,
    TEXTURE_WRAP_CLAMP = 1,
    TEXTURE_WRAP_MIRROR_REPEAT = 2,
    TEXTURE_WRAP_MIRROR_CLAMP = 3,
    _,
};
pub const TEXTURE_WRAP_REPEAT = @enumToInt(TextureWrap.TEXTURE_WRAP_REPEAT);
pub const TEXTURE_WRAP_CLAMP = @enumToInt(TextureWrap.TEXTURE_WRAP_CLAMP);
pub const TEXTURE_WRAP_MIRROR_REPEAT = @enumToInt(TextureWrap.TEXTURE_WRAP_MIRROR_REPEAT);
pub const TEXTURE_WRAP_MIRROR_CLAMP = @enumToInt(TextureWrap.TEXTURE_WRAP_MIRROR_CLAMP);
pub const CubemapLayout = extern enum(c_int) {
    CUBEMAP_LAYOUT_AUTO_DETECT = 0,
    CUBEMAP_LAYOUT_LINE_VERTICAL = 1,
    CUBEMAP_LAYOUT_LINE_HORIZONTAL = 2,
    CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = 3,
    CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = 4,
    CUBEMAP_LAYOUT_PANORAMA = 5,
    _,
};
pub const CUBEMAP_LAYOUT_AUTO_DETECT = @enumToInt(CubemapLayout.CUBEMAP_LAYOUT_AUTO_DETECT);
pub const CUBEMAP_LAYOUT_LINE_VERTICAL = @enumToInt(CubemapLayout.CUBEMAP_LAYOUT_LINE_VERTICAL);
pub const CUBEMAP_LAYOUT_LINE_HORIZONTAL = @enumToInt(CubemapLayout.CUBEMAP_LAYOUT_LINE_HORIZONTAL);
pub const CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR = @enumToInt(CubemapLayout.CUBEMAP_LAYOUT_CROSS_THREE_BY_FOUR);
pub const CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE = @enumToInt(CubemapLayout.CUBEMAP_LAYOUT_CROSS_FOUR_BY_THREE);
pub const CUBEMAP_LAYOUT_PANORAMA = @enumToInt(CubemapLayout.CUBEMAP_LAYOUT_PANORAMA);
pub const FontType = extern enum(c_int) {
    FONT_DEFAULT = 0,
    FONT_BITMAP = 1,
    FONT_SDF = 2,
    _,
};
pub const FONT_DEFAULT = @enumToInt(FontType.FONT_DEFAULT);
pub const FONT_BITMAP = @enumToInt(FontType.FONT_BITMAP);
pub const FONT_SDF = @enumToInt(FontType.FONT_SDF);
pub const BlendMode = extern enum(c_int) {
    BLEND_ALPHA = 0,
    BLEND_ADDITIVE = 1,
    BLEND_MULTIPLIED = 2,
    BLEND_ADD_COLORS = 3,
    BLEND_SUBTRACT_COLORS = 4,
    BLEND_CUSTOM = 5,
    _,
};
pub const BLEND_ALPHA = @enumToInt(BlendMode.BLEND_ALPHA);
pub const BLEND_ADDITIVE = @enumToInt(BlendMode.BLEND_ADDITIVE);
pub const BLEND_MULTIPLIED = @enumToInt(BlendMode.BLEND_MULTIPLIED);
pub const BLEND_ADD_COLORS = @enumToInt(BlendMode.BLEND_ADD_COLORS);
pub const BLEND_SUBTRACT_COLORS = @enumToInt(BlendMode.BLEND_SUBTRACT_COLORS);
pub const BLEND_CUSTOM = @enumToInt(BlendMode.BLEND_CUSTOM);
pub const Gestures = extern enum(c_int) {
    GESTURE_NONE = 0,
    GESTURE_TAP = 1,
    GESTURE_DOUBLETAP = 2,
    GESTURE_HOLD = 4,
    GESTURE_DRAG = 8,
    GESTURE_SWIPE_RIGHT = 16,
    GESTURE_SWIPE_LEFT = 32,
    GESTURE_SWIPE_UP = 64,
    GESTURE_SWIPE_DOWN = 128,
    GESTURE_PINCH_IN = 256,
    GESTURE_PINCH_OUT = 512,
    _,
};
pub const GESTURE_NONE = @enumToInt(Gestures.GESTURE_NONE);
pub const GESTURE_TAP = @enumToInt(Gestures.GESTURE_TAP);
pub const GESTURE_DOUBLETAP = @enumToInt(Gestures.GESTURE_DOUBLETAP);
pub const GESTURE_HOLD = @enumToInt(Gestures.GESTURE_HOLD);
pub const GESTURE_DRAG = @enumToInt(Gestures.GESTURE_DRAG);
pub const GESTURE_SWIPE_RIGHT = @enumToInt(Gestures.GESTURE_SWIPE_RIGHT);
pub const GESTURE_SWIPE_LEFT = @enumToInt(Gestures.GESTURE_SWIPE_LEFT);
pub const GESTURE_SWIPE_UP = @enumToInt(Gestures.GESTURE_SWIPE_UP);
pub const GESTURE_SWIPE_DOWN = @enumToInt(Gestures.GESTURE_SWIPE_DOWN);
pub const GESTURE_PINCH_IN = @enumToInt(Gestures.GESTURE_PINCH_IN);
pub const GESTURE_PINCH_OUT = @enumToInt(Gestures.GESTURE_PINCH_OUT);
pub const CameraMode = extern enum(c_int) {
    CAMERA_CUSTOM = 0,
    CAMERA_FREE = 1,
    CAMERA_ORBITAL = 2,
    CAMERA_FIRST_PERSON = 3,
    CAMERA_THIRD_PERSON = 4,
    _,
};
pub const CAMERA_CUSTOM = @enumToInt(CameraMode.CAMERA_CUSTOM);
pub const CAMERA_FREE = @enumToInt(CameraMode.CAMERA_FREE);
pub const CAMERA_ORBITAL = @enumToInt(CameraMode.CAMERA_ORBITAL);
pub const CAMERA_FIRST_PERSON = @enumToInt(CameraMode.CAMERA_FIRST_PERSON);
pub const CAMERA_THIRD_PERSON = @enumToInt(CameraMode.CAMERA_THIRD_PERSON);
pub const CameraProjection = extern enum(c_int) {
    CAMERA_PERSPECTIVE = 0,
    CAMERA_ORTHOGRAPHIC = 1,
    _,
};
pub const CAMERA_PERSPECTIVE = @enumToInt(CameraProjection.CAMERA_PERSPECTIVE);
pub const CAMERA_ORTHOGRAPHIC = @enumToInt(CameraProjection.CAMERA_ORTHOGRAPHIC);
pub const NPatchLayout = extern enum(c_int) {
    NPATCH_NINE_PATCH = 0,
    NPATCH_THREE_PATCH_VERTICAL = 1,
    NPATCH_THREE_PATCH_HORIZONTAL = 2,
    _,
};
pub const NPATCH_NINE_PATCH = @enumToInt(NPatchLayout.NPATCH_NINE_PATCH);
pub const NPATCH_THREE_PATCH_VERTICAL = @enumToInt(NPatchLayout.NPATCH_THREE_PATCH_VERTICAL);
pub const NPATCH_THREE_PATCH_HORIZONTAL = @enumToInt(NPatchLayout.NPATCH_THREE_PATCH_HORIZONTAL);
pub const TraceLogCallback = ?fn (c_int, [*c]const u8, va_list) callconv(.C) void;
pub const LoadFileDataCallback = ?fn ([*c]const u8, [*c]c_uint) callconv(.C) [*c]u8;
pub const SaveFileDataCallback = ?fn ([*c]const u8, ?*c_void, c_uint) callconv(.C) bool;
pub const LoadFileTextCallback = ?fn ([*c]const u8) callconv(.C) [*c]u8;
pub const SaveFileTextCallback = ?fn ([*c]const u8, [*c]u8) callconv(.C) bool;
pub extern fn InitWindow(width: c_int, height: c_int, title: [*c]const u8) void;
pub extern fn WindowShouldClose() bool;
pub extern fn CloseWindow() void;
pub extern fn IsWindowReady() bool;
pub extern fn IsWindowFullscreen() bool;
pub extern fn IsWindowHidden() bool;
pub extern fn IsWindowMinimized() bool;
pub extern fn IsWindowMaximized() bool;
pub extern fn IsWindowFocused() bool;
pub extern fn IsWindowResized() bool;
pub extern fn IsWindowState(flag: c_uint) bool;
pub extern fn SetWindowState(flags: c_uint) void;
pub extern fn ClearWindowState(flags: c_uint) void;
pub extern fn ToggleFullscreen() void;
pub extern fn MaximizeWindow() void;
pub extern fn MinimizeWindow() void;
pub extern fn RestoreWindow() void;
pub extern fn SetWindowIcon(image: Image) void;
pub extern fn SetWindowTitle(title: [*c]const u8) void;
pub extern fn SetWindowPosition(x: c_int, y: c_int) void;
pub extern fn SetWindowMonitor(monitor: c_int) void;
pub extern fn SetWindowMinSize(width: c_int, height: c_int) void;
pub extern fn SetWindowSize(width: c_int, height: c_int) void;
pub extern fn GetWindowHandle() ?*c_void;
pub extern fn GetScreenWidth() c_int;
pub extern fn GetScreenHeight() c_int;
pub extern fn GetMonitorCount() c_int;
pub extern fn GetCurrentMonitor() c_int;
pub extern fn GetMonitorPosition(monitor: c_int) Vector2;
pub extern fn GetMonitorWidth(monitor: c_int) c_int;
pub extern fn GetMonitorHeight(monitor: c_int) c_int;
pub extern fn GetMonitorPhysicalWidth(monitor: c_int) c_int;
pub extern fn GetMonitorPhysicalHeight(monitor: c_int) c_int;
pub extern fn GetMonitorRefreshRate(monitor: c_int) c_int;
pub extern fn GetWindowPosition() Vector2;
pub extern fn GetWindowScaleDPI() Vector2;
pub extern fn GetMonitorName(monitor: c_int) [*c]const u8;
pub extern fn SetClipboardText(text: [*c]const u8) void;
pub extern fn GetClipboardText() [*c]const u8;
pub extern fn ShowCursor() void;
pub extern fn HideCursor() void;
pub extern fn IsCursorHidden() bool;
pub extern fn EnableCursor() void;
pub extern fn DisableCursor() void;
pub extern fn IsCursorOnScreen() bool;
pub extern fn ClearBackground(color: Color) void;
pub extern fn BeginDrawing() void;
pub extern fn EndDrawing() void;
pub extern fn BeginMode2D(camera: Camera2D) void;
pub extern fn EndMode2D() void;
pub extern fn BeginMode3D(camera: Camera3D) void;
pub extern fn EndMode3D() void;
pub extern fn BeginTextureMode(target: RenderTexture2D) void;
pub extern fn EndTextureMode() void;
pub extern fn BeginShaderMode(shader: Shader) void;
pub extern fn EndShaderMode() void;
pub extern fn BeginBlendMode(mode: c_int) void;
pub extern fn EndBlendMode() void;
pub extern fn BeginScissorMode(x: c_int, y: c_int, width: c_int, height: c_int) void;
pub extern fn EndScissorMode() void;
pub extern fn BeginVrStereoMode(config: VrStereoConfig) void;
pub extern fn EndVrStereoMode() void;
pub extern fn LoadVrStereoConfig(device: VrDeviceInfo) VrStereoConfig;
pub extern fn UnloadVrStereoConfig(config: VrStereoConfig) void;
pub extern fn LoadShader(vsFileName: [*c]const u8, fsFileName: [*c]const u8) Shader;
pub extern fn LoadShaderFromMemory(vsCode: [*c]const u8, fsCode: [*c]const u8) Shader;
pub extern fn GetShaderLocation(shader: Shader, uniformName: [*c]const u8) c_int;
pub extern fn GetShaderLocationAttrib(shader: Shader, attribName: [*c]const u8) c_int;
pub extern fn SetShaderValue(shader: Shader, locIndex: c_int, value: ?*const c_void, uniformType: c_int) void;
pub extern fn SetShaderValueV(shader: Shader, locIndex: c_int, value: ?*const c_void, uniformType: c_int, count: c_int) void;
pub extern fn SetShaderValueMatrix(shader: Shader, locIndex: c_int, mat: Matrix) void;
pub extern fn SetShaderValueTexture(shader: Shader, locIndex: c_int, texture: Texture2D) void;
pub extern fn UnloadShader(shader: Shader) void;
pub extern fn GetMouseRay(mousePosition: Vector2, camera: Camera) Ray;
pub extern fn GetCameraMatrix(camera: Camera) Matrix;
pub extern fn GetCameraMatrix2D(camera: Camera2D) Matrix;
pub extern fn GetWorldToScreen(position: Vector3, camera: Camera) Vector2;
pub extern fn GetWorldToScreenEx(position: Vector3, camera: Camera, width: c_int, height: c_int) Vector2;
pub extern fn GetWorldToScreen2D(position: Vector2, camera: Camera2D) Vector2;
pub extern fn GetScreenToWorld2D(position: Vector2, camera: Camera2D) Vector2;
pub extern fn SetTargetFPS(fps: c_int) void;
pub extern fn GetFPS() c_int;
pub extern fn GetFrameTime() f32;
pub extern fn GetTime() f64;
pub extern fn GetRandomValue(min: c_int, max: c_int) c_int;
pub extern fn TakeScreenshot(fileName: [*c]const u8) void;
pub extern fn SetConfigFlags(flags: c_uint) void;
pub extern fn TraceLog(logLevel: c_int, text: [*c]const u8, ...) void;
pub extern fn SetTraceLogLevel(logLevel: c_int) void;
pub extern fn MemAlloc(size: c_int) ?*c_void;
pub extern fn MemRealloc(ptr: ?*c_void, size: c_int) ?*c_void;
pub extern fn MemFree(ptr: ?*c_void) void;
pub extern fn SetTraceLogCallback(callback: TraceLogCallback) void;
pub extern fn SetLoadFileDataCallback(callback: LoadFileDataCallback) void;
pub extern fn SetSaveFileDataCallback(callback: SaveFileDataCallback) void;
pub extern fn SetLoadFileTextCallback(callback: LoadFileTextCallback) void;
pub extern fn SetSaveFileTextCallback(callback: SaveFileTextCallback) void;
pub extern fn LoadFileData(fileName: [*c]const u8, bytesRead: [*c]c_uint) [*c]u8;
pub extern fn UnloadFileData(data: [*c]u8) void;
pub extern fn SaveFileData(fileName: [*c]const u8, data: ?*c_void, bytesToWrite: c_uint) bool;
pub extern fn LoadFileText(fileName: [*c]const u8) [*c]u8;
pub extern fn UnloadFileText(text: [*c]u8) void;
pub extern fn SaveFileText(fileName: [*c]const u8, text: [*c]u8) bool;
pub extern fn FileExists(fileName: [*c]const u8) bool;
pub extern fn DirectoryExists(dirPath: [*c]const u8) bool;
pub extern fn IsFileExtension(fileName: [*c]const u8, ext: [*c]const u8) bool;
pub extern fn GetFileExtension(fileName: [*c]const u8) [*c]const u8;
pub extern fn GetFileName(filePath: [*c]const u8) [*c]const u8;
pub extern fn GetFileNameWithoutExt(filePath: [*c]const u8) [*c]const u8;
pub extern fn GetDirectoryPath(filePath: [*c]const u8) [*c]const u8;
pub extern fn GetPrevDirectoryPath(dirPath: [*c]const u8) [*c]const u8;
pub extern fn GetWorkingDirectory() [*c]const u8;
pub extern fn GetDirectoryFiles(dirPath: [*c]const u8, count: [*c]c_int) [*c][*c]u8;
pub extern fn ClearDirectoryFiles() void;
pub extern fn ChangeDirectory(dir: [*c]const u8) bool;
pub extern fn IsFileDropped() bool;
pub extern fn GetDroppedFiles(count: [*c]c_int) [*c][*c]u8;
pub extern fn ClearDroppedFiles() void;
pub extern fn GetFileModTime(fileName: [*c]const u8) c_long;
pub extern fn CompressData(data: [*c]u8, dataLength: c_int, compDataLength: [*c]c_int) [*c]u8;
pub extern fn DecompressData(compData: [*c]u8, compDataLength: c_int, dataLength: [*c]c_int) [*c]u8;
pub extern fn SaveStorageValue(position: c_uint, value: c_int) bool;
pub extern fn LoadStorageValue(position: c_uint) c_int;
pub extern fn OpenURL(url: [*c]const u8) void;
pub extern fn IsKeyPressed(key: c_int) bool;
pub extern fn IsKeyDown(key: c_int) bool;
pub extern fn IsKeyReleased(key: c_int) bool;
pub extern fn IsKeyUp(key: c_int) bool;
pub extern fn SetExitKey(key: c_int) void;
pub extern fn GetKeyPressed() c_int;
pub extern fn GetCharPressed() c_int;
pub extern fn IsGamepadAvailable(gamepad: c_int) bool;
pub extern fn IsGamepadName(gamepad: c_int, name: [*c]const u8) bool;
pub extern fn GetGamepadName(gamepad: c_int) [*c]const u8;
pub extern fn IsGamepadButtonPressed(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonDown(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonReleased(gamepad: c_int, button: c_int) bool;
pub extern fn IsGamepadButtonUp(gamepad: c_int, button: c_int) bool;
pub extern fn GetGamepadButtonPressed() c_int;
pub extern fn GetGamepadAxisCount(gamepad: c_int) c_int;
pub extern fn GetGamepadAxisMovement(gamepad: c_int, axis: c_int) f32;
pub extern fn SetGamepadMappings(mappings: [*c]const u8) c_int;
pub extern fn IsMouseButtonPressed(button: c_int) bool;
pub extern fn IsMouseButtonDown(button: c_int) bool;
pub extern fn IsMouseButtonReleased(button: c_int) bool;
pub extern fn IsMouseButtonUp(button: c_int) bool;
pub extern fn GetMouseX() c_int;
pub extern fn GetMouseY() c_int;
pub extern fn GetMousePosition() Vector2;
pub extern fn SetMousePosition(x: c_int, y: c_int) void;
pub extern fn SetMouseOffset(offsetX: c_int, offsetY: c_int) void;
pub extern fn SetMouseScale(scaleX: f32, scaleY: f32) void;
pub extern fn GetMouseWheelMove() f32;
pub extern fn SetMouseCursor(cursor: c_int) void;
pub extern fn GetTouchX() c_int;
pub extern fn GetTouchY() c_int;
pub extern fn GetTouchPosition(index: c_int) Vector2;
pub extern fn SetGesturesEnabled(flags: c_uint) void;
pub extern fn IsGestureDetected(gesture: c_int) bool;
pub extern fn GetGestureDetected() c_int;
pub extern fn GetTouchPointsCount() c_int;
pub extern fn GetGestureHoldDuration() f32;
pub extern fn GetGestureDragVector() Vector2;
pub extern fn GetGestureDragAngle() f32;
pub extern fn GetGesturePinchVector() Vector2;
pub extern fn GetGesturePinchAngle() f32;
pub extern fn SetCameraMode(camera: Camera, mode: c_int) void;
pub extern fn UpdateCamera(camera: [*c]Camera) void;
pub extern fn SetCameraPanControl(keyPan: c_int) void;
pub extern fn SetCameraAltControl(keyAlt: c_int) void;
pub extern fn SetCameraSmoothZoomControl(keySmoothZoom: c_int) void;
pub extern fn SetCameraMoveControls(keyFront: c_int, keyBack: c_int, keyRight: c_int, keyLeft: c_int, keyUp: c_int, keyDown: c_int) void;
pub extern fn SetShapesTexture(texture: Texture2D, source: Rectangle) void;
pub extern fn DrawPixel(posX: c_int, posY: c_int, color: Color) void;
pub extern fn DrawPixelV(position: Vector2, color: Color) void;
pub extern fn DrawLine(startPosX: c_int, startPosY: c_int, endPosX: c_int, endPosY: c_int, color: Color) void;
pub extern fn DrawLineV(startPos: Vector2, endPos: Vector2, color: Color) void;
pub extern fn DrawLineEx(startPos: Vector2, endPos: Vector2, thick: f32, color: Color) void;
pub extern fn DrawLineBezier(startPos: Vector2, endPos: Vector2, thick: f32, color: Color) void;
pub extern fn DrawLineBezierQuad(startPos: Vector2, endPos: Vector2, controlPos: Vector2, thick: f32, color: Color) void;
pub extern fn DrawLineStrip(points: [*c]Vector2, pointsCount: c_int, color: Color) void;
pub extern fn DrawCircle(centerX: c_int, centerY: c_int, radius: f32, color: Color) void;
pub extern fn DrawCircleSector(center: Vector2, radius: f32, startAngle: f32, endAngle: f32, segments: c_int, color: Color) void;
pub extern fn DrawCircleSectorLines(center: Vector2, radius: f32, startAngle: f32, endAngle: f32, segments: c_int, color: Color) void;
pub extern fn DrawCircleGradient(centerX: c_int, centerY: c_int, radius: f32, color1: Color, color2: Color) void;
pub extern fn DrawCircleV(center: Vector2, radius: f32, color: Color) void;
pub extern fn DrawCircleLines(centerX: c_int, centerY: c_int, radius: f32, color: Color) void;
pub extern fn DrawEllipse(centerX: c_int, centerY: c_int, radiusH: f32, radiusV: f32, color: Color) void;
pub extern fn DrawEllipseLines(centerX: c_int, centerY: c_int, radiusH: f32, radiusV: f32, color: Color) void;
pub extern fn DrawRing(center: Vector2, innerRadius: f32, outerRadius: f32, startAngle: f32, endAngle: f32, segments: c_int, color: Color) void;
pub extern fn DrawRingLines(center: Vector2, innerRadius: f32, outerRadius: f32, startAngle: f32, endAngle: f32, segments: c_int, color: Color) void;
pub extern fn DrawRectangle(posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn DrawRectangleV(position: Vector2, size: Vector2, color: Color) void;
pub extern fn DrawRectangleRec(rec: Rectangle, color: Color) void;
pub extern fn DrawRectanglePro(rec: Rectangle, origin: Vector2, rotation: f32, color: Color) void;
pub extern fn DrawRectangleGradientV(posX: c_int, posY: c_int, width: c_int, height: c_int, color1: Color, color2: Color) void;
pub extern fn DrawRectangleGradientH(posX: c_int, posY: c_int, width: c_int, height: c_int, color1: Color, color2: Color) void;
pub extern fn DrawRectangleGradientEx(rec: Rectangle, col1: Color, col2: Color, col3: Color, col4: Color) void;
pub extern fn DrawRectangleLines(posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn DrawRectangleLinesEx(rec: Rectangle, lineThick: c_int, color: Color) void;
pub extern fn DrawRectangleRounded(rec: Rectangle, roundness: f32, segments: c_int, color: Color) void;
pub extern fn DrawRectangleRoundedLines(rec: Rectangle, roundness: f32, segments: c_int, lineThick: c_int, color: Color) void;
pub extern fn DrawTriangle(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void;
pub extern fn DrawTriangleLines(v1: Vector2, v2: Vector2, v3: Vector2, color: Color) void;
pub extern fn DrawTriangleFan(points: [*c]Vector2, pointsCount: c_int, color: Color) void;
pub extern fn DrawTriangleStrip(points: [*c]Vector2, pointsCount: c_int, color: Color) void;
pub extern fn DrawPoly(center: Vector2, sides: c_int, radius: f32, rotation: f32, color: Color) void;
pub extern fn DrawPolyLines(center: Vector2, sides: c_int, radius: f32, rotation: f32, color: Color) void;
pub extern fn CheckCollisionRecs(rec1: Rectangle, rec2: Rectangle) bool;
pub extern fn CheckCollisionCircles(center1: Vector2, radius1: f32, center2: Vector2, radius2: f32) bool;
pub extern fn CheckCollisionCircleRec(center: Vector2, radius: f32, rec: Rectangle) bool;
pub extern fn CheckCollisionPointRec(point: Vector2, rec: Rectangle) bool;
pub extern fn CheckCollisionPointCircle(point: Vector2, center: Vector2, radius: f32) bool;
pub extern fn CheckCollisionPointTriangle(point: Vector2, p1: Vector2, p2: Vector2, p3: Vector2) bool;
pub extern fn CheckCollisionLines(startPos1: Vector2, endPos1: Vector2, startPos2: Vector2, endPos2: Vector2, collisionPoint: [*c]Vector2) bool;
pub extern fn GetCollisionRec(rec1: Rectangle, rec2: Rectangle) Rectangle;
pub extern fn LoadImage(fileName: [*c]const u8) Image;
pub extern fn LoadImageRaw(fileName: [*c]const u8, width: c_int, height: c_int, format: c_int, headerSize: c_int) Image;
pub extern fn LoadImageAnim(fileName: [*c]const u8, frames: [*c]c_int) Image;
pub extern fn LoadImageFromMemory(fileType: [*c]const u8, fileData: [*c]const u8, dataSize: c_int) Image;
pub extern fn UnloadImage(image: Image) void;
pub extern fn ExportImage(image: Image, fileName: [*c]const u8) bool;
pub extern fn ExportImageAsCode(image: Image, fileName: [*c]const u8) bool;
pub extern fn GenImageColor(width: c_int, height: c_int, color: Color) Image;
pub extern fn GenImageGradientV(width: c_int, height: c_int, top: Color, bottom: Color) Image;
pub extern fn GenImageGradientH(width: c_int, height: c_int, left: Color, right: Color) Image;
pub extern fn GenImageGradientRadial(width: c_int, height: c_int, density: f32, inner: Color, outer: Color) Image;
pub extern fn GenImageChecked(width: c_int, height: c_int, checksX: c_int, checksY: c_int, col1: Color, col2: Color) Image;
pub extern fn GenImageWhiteNoise(width: c_int, height: c_int, factor: f32) Image;
pub extern fn GenImagePerlinNoise(width: c_int, height: c_int, offsetX: c_int, offsetY: c_int, scale: f32) Image;
pub extern fn GenImageCellular(width: c_int, height: c_int, tileSize: c_int) Image;
pub extern fn ImageCopy(image: Image) Image;
pub extern fn ImageFromImage(image: Image, rec: Rectangle) Image;
pub extern fn ImageText(text: [*c]const u8, fontSize: c_int, color: Color) Image;
pub extern fn ImageTextEx(font: Font, text: [*c]const u8, fontSize: f32, spacing: f32, tint: Color) Image;
pub extern fn ImageFormat(image: [*c]Image, newFormat: c_int) void;
pub extern fn ImageToPOT(image: [*c]Image, fill: Color) void;
pub extern fn ImageCrop(image: [*c]Image, crop: Rectangle) void;
pub extern fn ImageAlphaCrop(image: [*c]Image, threshold: f32) void;
pub extern fn ImageAlphaClear(image: [*c]Image, color: Color, threshold: f32) void;
pub extern fn ImageAlphaMask(image: [*c]Image, alphaMask: Image) void;
pub extern fn ImageAlphaPremultiply(image: [*c]Image) void;
pub extern fn ImageResize(image: [*c]Image, newWidth: c_int, newHeight: c_int) void;
pub extern fn ImageResizeNN(image: [*c]Image, newWidth: c_int, newHeight: c_int) void;
pub extern fn ImageResizeCanvas(image: [*c]Image, newWidth: c_int, newHeight: c_int, offsetX: c_int, offsetY: c_int, fill: Color) void;
pub extern fn ImageMipmaps(image: [*c]Image) void;
pub extern fn ImageDither(image: [*c]Image, rBpp: c_int, gBpp: c_int, bBpp: c_int, aBpp: c_int) void;
pub extern fn ImageFlipVertical(image: [*c]Image) void;
pub extern fn ImageFlipHorizontal(image: [*c]Image) void;
pub extern fn ImageRotateCW(image: [*c]Image) void;
pub extern fn ImageRotateCCW(image: [*c]Image) void;
pub extern fn ImageColorTint(image: [*c]Image, color: Color) void;
pub extern fn ImageColorInvert(image: [*c]Image) void;
pub extern fn ImageColorGrayscale(image: [*c]Image) void;
pub extern fn ImageColorContrast(image: [*c]Image, contrast: f32) void;
pub extern fn ImageColorBrightness(image: [*c]Image, brightness: c_int) void;
pub extern fn ImageColorReplace(image: [*c]Image, color: Color, replace: Color) void;
pub extern fn LoadImageColors(image: Image) [*c]Color;
pub extern fn LoadImagePalette(image: Image, maxPaletteSize: c_int, colorsCount: [*c]c_int) [*c]Color;
pub extern fn UnloadImageColors(colors: [*c]Color) void;
pub extern fn UnloadImagePalette(colors: [*c]Color) void;
pub extern fn GetImageAlphaBorder(image: Image, threshold: f32) Rectangle;
pub extern fn ImageClearBackground(dst: [*c]Image, color: Color) void;
pub extern fn ImageDrawPixel(dst: [*c]Image, posX: c_int, posY: c_int, color: Color) void;
pub extern fn ImageDrawPixelV(dst: [*c]Image, position: Vector2, color: Color) void;
pub extern fn ImageDrawLine(dst: [*c]Image, startPosX: c_int, startPosY: c_int, endPosX: c_int, endPosY: c_int, color: Color) void;
pub extern fn ImageDrawLineV(dst: [*c]Image, start: Vector2, end: Vector2, color: Color) void;
pub extern fn ImageDrawCircle(dst: [*c]Image, centerX: c_int, centerY: c_int, radius: c_int, color: Color) void;
pub extern fn ImageDrawCircleV(dst: [*c]Image, center: Vector2, radius: c_int, color: Color) void;
pub extern fn ImageDrawRectangle(dst: [*c]Image, posX: c_int, posY: c_int, width: c_int, height: c_int, color: Color) void;
pub extern fn ImageDrawRectangleV(dst: [*c]Image, position: Vector2, size: Vector2, color: Color) void;
pub extern fn ImageDrawRectangleRec(dst: [*c]Image, rec: Rectangle, color: Color) void;
pub extern fn ImageDrawRectangleLines(dst: [*c]Image, rec: Rectangle, thick: c_int, color: Color) void;
pub extern fn ImageDraw(dst: [*c]Image, src: Image, srcRec: Rectangle, dstRec: Rectangle, tint: Color) void;
pub extern fn ImageDrawText(dst: [*c]Image, text: [*c]const u8, posX: c_int, posY: c_int, fontSize: c_int, color: Color) void;
pub extern fn ImageDrawTextEx(dst: [*c]Image, font: Font, text: [*c]const u8, position: Vector2, fontSize: f32, spacing: f32, tint: Color) void;
pub extern fn LoadTexture(fileName: [*c]const u8) Texture2D;
pub extern fn LoadTextureFromImage(image: Image) Texture2D;
pub extern fn LoadTextureCubemap(image: Image, layout: c_int) TextureCubemap;
pub extern fn LoadRenderTexture(width: c_int, height: c_int) RenderTexture2D;
pub extern fn UnloadTexture(texture: Texture2D) void;
pub extern fn UnloadRenderTexture(target: RenderTexture2D) void;
pub extern fn UpdateTexture(texture: Texture2D, pixels: ?*const c_void) void;
pub extern fn UpdateTextureRec(texture: Texture2D, rec: Rectangle, pixels: ?*const c_void) void;
pub extern fn GetTextureData(texture: Texture2D) Image;
pub extern fn GetScreenData() Image;
pub extern fn GenTextureMipmaps(texture: [*c]Texture2D) void;
pub extern fn SetTextureFilter(texture: Texture2D, filter: c_int) void;
pub extern fn SetTextureWrap(texture: Texture2D, wrap: c_int) void;
pub extern fn DrawTexture(texture: Texture2D, posX: c_int, posY: c_int, tint: Color) void;
pub extern fn DrawTextureV(texture: Texture2D, position: Vector2, tint: Color) void;
pub extern fn DrawTextureEx(texture: Texture2D, position: Vector2, rotation: f32, scale: f32, tint: Color) void;
pub extern fn DrawTextureRec(texture: Texture2D, source: Rectangle, position: Vector2, tint: Color) void;
pub extern fn DrawTextureQuad(texture: Texture2D, tiling: Vector2, offset: Vector2, quad: Rectangle, tint: Color) void;
pub extern fn DrawTextureTiled(texture: Texture2D, source: Rectangle, dest: Rectangle, origin: Vector2, rotation: f32, scale: f32, tint: Color) void;
pub extern fn DrawTexturePro(texture: Texture2D, source: Rectangle, dest: Rectangle, origin: Vector2, rotation: f32, tint: Color) void;
pub extern fn DrawTextureNPatch(texture: Texture2D, nPatchInfo: NPatchInfo, dest: Rectangle, origin: Vector2, rotation: f32, tint: Color) void;
pub extern fn DrawTexturePoly(texture: Texture2D, center: Vector2, points: [*c]Vector2, texcoords: [*c]Vector2, pointsCount: c_int, tint: Color) void;
pub extern fn Fade(color: Color, alpha: f32) Color;
pub extern fn ColorToInt(color: Color) c_int;
pub extern fn ColorNormalize(color: Color) Vector4;
pub extern fn ColorFromNormalized(normalized: Vector4) Color;
pub extern fn ColorToHSV(color: Color) Vector3;
pub extern fn ColorFromHSV(hue: f32, saturation: f32, value: f32) Color;
pub extern fn ColorAlpha(color: Color, alpha: f32) Color;
pub extern fn ColorAlphaBlend(dst: Color, src: Color, tint: Color) Color;
pub extern fn GetColor(hexValue: c_int) Color;
pub extern fn GetPixelColor(srcPtr: ?*c_void, format: c_int) Color;
pub extern fn SetPixelColor(dstPtr: ?*c_void, color: Color, format: c_int) void;
pub extern fn GetPixelDataSize(width: c_int, height: c_int, format: c_int) c_int;
pub extern fn GetFontDefault() Font;
pub extern fn LoadFont(fileName: [*c]const u8) Font;
pub extern fn LoadFontEx(fileName: [*c]const u8, fontSize: c_int, fontChars: [*c]c_int, charsCount: c_int) Font;
pub extern fn LoadFontFromImage(image: Image, key: Color, firstChar: c_int) Font;
pub extern fn LoadFontFromMemory(fileType: [*c]const u8, fileData: [*c]const u8, dataSize: c_int, fontSize: c_int, fontChars: [*c]c_int, charsCount: c_int) Font;
pub extern fn LoadFontData(fileData: [*c]const u8, dataSize: c_int, fontSize: c_int, fontChars: [*c]c_int, charsCount: c_int, type: c_int) [*c]CharInfo;
pub extern fn GenImageFontAtlas(chars: [*c]const CharInfo, recs: [*c][*c]Rectangle, charsCount: c_int, fontSize: c_int, padding: c_int, packMethod: c_int) Image;
pub extern fn UnloadFontData(chars: [*c]CharInfo, charsCount: c_int) void;
pub extern fn UnloadFont(font: Font) void;
pub extern fn DrawFPS(posX: c_int, posY: c_int) void;
pub extern fn DrawText(text: [*c]const u8, posX: c_int, posY: c_int, fontSize: c_int, color: Color) void;
pub extern fn DrawTextEx(font: Font, text: [*c]const u8, position: Vector2, fontSize: f32, spacing: f32, tint: Color) void;
pub extern fn DrawTextRec(font: Font, text: [*c]const u8, rec: Rectangle, fontSize: f32, spacing: f32, wordWrap: bool, tint: Color) void;
pub extern fn DrawTextRecEx(font: Font, text: [*c]const u8, rec: Rectangle, fontSize: f32, spacing: f32, wordWrap: bool, tint: Color, selectStart: c_int, selectLength: c_int, selectTint: Color, selectBackTint: Color) void;
pub extern fn DrawTextCodepoint(font: Font, codepoint: c_int, position: Vector2, fontSize: f32, tint: Color) void;
pub extern fn MeasureText(text: [*c]const u8, fontSize: c_int) c_int;
pub extern fn MeasureTextEx(font: Font, text: [*c]const u8, fontSize: f32, spacing: f32) Vector2;
pub extern fn GetGlyphIndex(font: Font, codepoint: c_int) c_int;
pub extern fn TextCopy(dst: [*c]u8, src: [*c]const u8) c_int;
pub extern fn TextIsEqual(text1: [*c]const u8, text2: [*c]const u8) bool;
pub extern fn TextLength(text: [*c]const u8) c_uint;
pub extern fn TextFormat(text: [*c]const u8, ...) [*c]const u8;
pub extern fn TextSubtext(text: [*c]const u8, position: c_int, length: c_int) [*c]const u8;
pub extern fn TextReplace(text: [*c]u8, replace: [*c]const u8, by: [*c]const u8) [*c]u8;
pub extern fn TextInsert(text: [*c]const u8, insert: [*c]const u8, position: c_int) [*c]u8;
pub extern fn TextJoin(textList: [*c][*c]const u8, count: c_int, delimiter: [*c]const u8) [*c]const u8;
pub extern fn TextSplit(text: [*c]const u8, delimiter: u8, count: [*c]c_int) [*c][*c]const u8;
pub extern fn TextAppend(text: [*c]u8, append: [*c]const u8, position: [*c]c_int) void;
pub extern fn TextFindIndex(text: [*c]const u8, find: [*c]const u8) c_int;
pub extern fn TextToUpper(text: [*c]const u8) [*c]const u8;
pub extern fn TextToLower(text: [*c]const u8) [*c]const u8;
pub extern fn TextToPascal(text: [*c]const u8) [*c]const u8;
pub extern fn TextToInteger(text: [*c]const u8) c_int;
pub extern fn TextToUtf8(codepoints: [*c]c_int, length: c_int) [*c]u8;
pub extern fn GetCodepoints(text: [*c]const u8, count: [*c]c_int) [*c]c_int;
pub extern fn GetCodepointsCount(text: [*c]const u8) c_int;
pub extern fn GetNextCodepoint(text: [*c]const u8, bytesProcessed: [*c]c_int) c_int;
pub extern fn CodepointToUtf8(codepoint: c_int, byteLength: [*c]c_int) [*c]const u8;
pub extern fn DrawLine3D(startPos: Vector3, endPos: Vector3, color: Color) void;
pub extern fn DrawPoint3D(position: Vector3, color: Color) void;
pub extern fn DrawCircle3D(center: Vector3, radius: f32, rotationAxis: Vector3, rotationAngle: f32, color: Color) void;
pub extern fn DrawTriangle3D(v1: Vector3, v2: Vector3, v3: Vector3, color: Color) void;
pub extern fn DrawTriangleStrip3D(points: [*c]Vector3, pointsCount: c_int, color: Color) void;
pub extern fn DrawCube(position: Vector3, width: f32, height: f32, length: f32, color: Color) void;
pub extern fn DrawCubeV(position: Vector3, size: Vector3, color: Color) void;
pub extern fn DrawCubeWires(position: Vector3, width: f32, height: f32, length: f32, color: Color) void;
pub extern fn DrawCubeWiresV(position: Vector3, size: Vector3, color: Color) void;
pub extern fn DrawCubeTexture(texture: Texture2D, position: Vector3, width: f32, height: f32, length: f32, color: Color) void;
pub extern fn DrawSphere(centerPos: Vector3, radius: f32, color: Color) void;
pub extern fn DrawSphereEx(centerPos: Vector3, radius: f32, rings: c_int, slices: c_int, color: Color) void;
pub extern fn DrawSphereWires(centerPos: Vector3, radius: f32, rings: c_int, slices: c_int, color: Color) void;
pub extern fn DrawCylinder(position: Vector3, radiusTop: f32, radiusBottom: f32, height: f32, slices: c_int, color: Color) void;
pub extern fn DrawCylinderWires(position: Vector3, radiusTop: f32, radiusBottom: f32, height: f32, slices: c_int, color: Color) void;
pub extern fn DrawPlane(centerPos: Vector3, size: Vector2, color: Color) void;
pub extern fn DrawRay(ray: Ray, color: Color) void;
pub extern fn DrawGrid(slices: c_int, spacing: f32) void;
pub extern fn LoadModel(fileName: [*c]const u8) Model;
pub extern fn LoadModelFromMesh(mesh: Mesh) Model;
pub extern fn UnloadModel(model: Model) void;
pub extern fn UnloadModelKeepMeshes(model: Model) void;
pub extern fn UploadMesh(mesh: [*c]Mesh, dynamic: bool) void;
pub extern fn DrawMesh(mesh: Mesh, material: Material, transform: Matrix) void;
pub extern fn DrawMeshInstanced(mesh: Mesh, material: Material, transforms: [*c]Matrix, instances: c_int) void;
pub extern fn UnloadMesh(mesh: Mesh) void;
pub extern fn ExportMesh(mesh: Mesh, fileName: [*c]const u8) bool;
pub extern fn LoadMaterials(fileName: [*c]const u8, materialCount: [*c]c_int) [*c]Material;
pub extern fn LoadMaterialDefault() Material;
pub extern fn UnloadMaterial(material: Material) void;
pub extern fn SetMaterialTexture(material: [*c]Material, mapType: c_int, texture: Texture2D) void;
pub extern fn SetModelMeshMaterial(model: [*c]Model, meshId: c_int, materialId: c_int) void;
pub extern fn LoadModelAnimations(fileName: [*c]const u8, animsCount: [*c]c_int) [*c]ModelAnimation;
pub extern fn UpdateModelAnimation(model: Model, anim: ModelAnimation, frame: c_int) void;
pub extern fn UnloadModelAnimation(anim: ModelAnimation) void;
pub extern fn UnloadModelAnimations(animations: [*c]ModelAnimation, count: c_uint) void;
pub extern fn IsModelAnimationValid(model: Model, anim: ModelAnimation) bool;
pub extern fn GenMeshDefault(vertexCount: c_int) Mesh;
pub extern fn GenMeshPoly(sides: c_int, radius: f32) Mesh;
pub extern fn GenMeshPlane(width: f32, length: f32, resX: c_int, resZ: c_int) Mesh;
pub extern fn GenMeshCube(width: f32, height: f32, length: f32) Mesh;
pub extern fn GenMeshSphere(radius: f32, rings: c_int, slices: c_int) Mesh;
pub extern fn GenMeshHemiSphere(radius: f32, rings: c_int, slices: c_int) Mesh;
pub extern fn GenMeshCylinder(radius: f32, height: f32, slices: c_int) Mesh;
pub extern fn GenMeshTorus(radius: f32, size: f32, radSeg: c_int, sides: c_int) Mesh;
pub extern fn GenMeshKnot(radius: f32, size: f32, radSeg: c_int, sides: c_int) Mesh;
pub extern fn GenMeshHeightmap(heightmap: Image, size: Vector3) Mesh;
pub extern fn GenMeshCubicmap(cubicmap: Image, cubeSize: Vector3) Mesh;
pub extern fn MeshBoundingBox(mesh: Mesh) BoundingBox;
pub extern fn MeshTangents(mesh: [*c]Mesh) void;
pub extern fn MeshBinormals(mesh: [*c]Mesh) void;
pub extern fn DrawModel(model: Model, position: Vector3, scale: f32, tint: Color) void;
pub extern fn DrawModelEx(model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: f32, scale: Vector3, tint: Color) void;
pub extern fn DrawModelWires(model: Model, position: Vector3, scale: f32, tint: Color) void;
pub extern fn DrawModelWiresEx(model: Model, position: Vector3, rotationAxis: Vector3, rotationAngle: f32, scale: Vector3, tint: Color) void;
pub extern fn DrawBoundingBox(box: BoundingBox, color: Color) void;
pub extern fn DrawBillboard(camera: Camera, texture: Texture2D, center: Vector3, size: f32, tint: Color) void;
pub extern fn DrawBillboardRec(camera: Camera, texture: Texture2D, source: Rectangle, center: Vector3, size: f32, tint: Color) void;
pub extern fn CheckCollisionSpheres(center1: Vector3, radius1: f32, center2: Vector3, radius2: f32) bool;
pub extern fn CheckCollisionBoxes(box1: BoundingBox, box2: BoundingBox) bool;
pub extern fn CheckCollisionBoxSphere(box: BoundingBox, center: Vector3, radius: f32) bool;
pub extern fn CheckCollisionRaySphere(ray: Ray, center: Vector3, radius: f32) bool;
pub extern fn CheckCollisionRaySphereEx(ray: Ray, center: Vector3, radius: f32, collisionPoint: [*c]Vector3) bool;
pub extern fn CheckCollisionRayBox(ray: Ray, box: BoundingBox) bool;
pub extern fn GetCollisionRayMesh(ray: Ray, mesh: Mesh, transform: Matrix) RayHitInfo;
pub extern fn GetCollisionRayModel(ray: Ray, model: Model) RayHitInfo;
pub extern fn GetCollisionRayTriangle(ray: Ray, p1: Vector3, p2: Vector3, p3: Vector3) RayHitInfo;
pub extern fn GetCollisionRayGround(ray: Ray, groundHeight: f32) RayHitInfo;
pub extern fn InitAudioDevice() void;
pub extern fn CloseAudioDevice() void;
pub extern fn IsAudioDeviceReady() bool;
pub extern fn SetMasterVolume(volume: f32) void;
pub extern fn LoadWave(fileName: [*c]const u8) Wave;
pub extern fn LoadWaveFromMemory(fileType: [*c]const u8, fileData: [*c]const u8, dataSize: c_int) Wave;
pub extern fn LoadSound(fileName: [*c]const u8) Sound;
pub extern fn LoadSoundFromWave(wave: Wave) Sound;
pub extern fn UpdateSound(sound: Sound, data: ?*const c_void, samplesCount: c_int) void;
pub extern fn UnloadWave(wave: Wave) void;
pub extern fn UnloadSound(sound: Sound) void;
pub extern fn ExportWave(wave: Wave, fileName: [*c]const u8) bool;
pub extern fn ExportWaveAsCode(wave: Wave, fileName: [*c]const u8) bool;
pub extern fn PlaySound(sound: Sound) void;
pub extern fn StopSound(sound: Sound) void;
pub extern fn PauseSound(sound: Sound) void;
pub extern fn ResumeSound(sound: Sound) void;
pub extern fn PlaySoundMulti(sound: Sound) void;
pub extern fn StopSoundMulti() void;
pub extern fn GetSoundsPlaying() c_int;
pub extern fn IsSoundPlaying(sound: Sound) bool;
pub extern fn SetSoundVolume(sound: Sound, volume: f32) void;
pub extern fn SetSoundPitch(sound: Sound, pitch: f32) void;
pub extern fn WaveFormat(wave: [*c]Wave, sampleRate: c_int, sampleSize: c_int, channels: c_int) void;
pub extern fn WaveCopy(wave: Wave) Wave;
pub extern fn WaveCrop(wave: [*c]Wave, initSample: c_int, finalSample: c_int) void;
pub extern fn LoadWaveSamples(wave: Wave) [*c]f32;
pub extern fn UnloadWaveSamples(samples: [*c]f32) void;
pub extern fn LoadMusicStream(fileName: [*c]const u8) Music;
pub extern fn LoadMusicStreamFromMemory(fileType: [*c]const u8, data: [*c]u8, dataSize: c_int) Music;
pub extern fn UnloadMusicStream(music: Music) void;
pub extern fn PlayMusicStream(music: Music) void;
pub extern fn IsMusicPlaying(music: Music) bool;
pub extern fn UpdateMusicStream(music: Music) void;
pub extern fn StopMusicStream(music: Music) void;
pub extern fn PauseMusicStream(music: Music) void;
pub extern fn ResumeMusicStream(music: Music) void;
pub extern fn SetMusicVolume(music: Music, volume: f32) void;
pub extern fn SetMusicPitch(music: Music, pitch: f32) void;
pub extern fn GetMusicTimeLength(music: Music) f32;
pub extern fn GetMusicTimePlayed(music: Music) f32;
pub extern fn InitAudioStream(sampleRate: c_uint, sampleSize: c_uint, channels: c_uint) AudioStream;
pub extern fn UpdateAudioStream(stream: AudioStream, data: ?*const c_void, samplesCount: c_int) void;
pub extern fn CloseAudioStream(stream: AudioStream) void;
pub extern fn IsAudioStreamProcessed(stream: AudioStream) bool;
pub extern fn PlayAudioStream(stream: AudioStream) void;
pub extern fn PauseAudioStream(stream: AudioStream) void;
pub extern fn ResumeAudioStream(stream: AudioStream) void;
pub extern fn IsAudioStreamPlaying(stream: AudioStream) bool;
pub extern fn StopAudioStream(stream: AudioStream) void;
pub extern fn SetAudioStreamVolume(stream: AudioStream, volume: f32) void;
pub extern fn SetAudioStreamPitch(stream: AudioStream, pitch: f32) void;
pub extern fn SetAudioStreamBufferSizeDefault(size: c_int) void;
pub const struct_float3 = extern struct {
    v: [3]f32,
};
pub const float3 = struct_float3;
pub const struct_float16 = extern struct {
    v: [16]f32,
};
pub const float16 = struct_float16; // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:583:3: warning: TODO implement translation of stmt class GCCAsmStmtClass
// C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:581:36: warning: unable to translate function, demoted to extern
pub extern fn __debugbreak() callconv(.C) void;
pub extern fn __mingw_get_crt_info() [*c]const u8;
pub const rsize_t = usize;
pub const ptrdiff_t = c_longlong;
pub const wchar_t = c_ushort;
pub const wint_t = c_ushort;
pub const wctype_t = c_ushort;
pub const errno_t = c_int;
pub const __time32_t = c_long;
pub const __time64_t = c_longlong;
pub const time_t = __time64_t;
pub const struct_tagLC_ID = extern struct {
    wLanguage: c_ushort,
    wCountry: c_ushort,
    wCodePage: c_ushort,
};
pub const LC_ID = struct_tagLC_ID;
const struct_unnamed_1 = extern struct {
    locale: [*c]u8,
    wlocale: [*c]wchar_t,
    refcount: [*c]c_int,
    wrefcount: [*c]c_int,
};
pub const struct_lconv = opaque {};
pub const struct___lc_time_data = opaque {};
pub const struct_threadlocaleinfostruct = extern struct {
    refcount: c_int,
    lc_codepage: c_uint,
    lc_collate_cp: c_uint,
    lc_handle: [6]c_ulong,
    lc_id: [6]LC_ID,
    lc_category: [6]struct_unnamed_1,
    lc_clike: c_int,
    mb_cur_max: c_int,
    lconv_intl_refcount: [*c]c_int,
    lconv_num_refcount: [*c]c_int,
    lconv_mon_refcount: [*c]c_int,
    lconv: ?*struct_lconv,
    ctype1_refcount: [*c]c_int,
    ctype1: [*c]c_ushort,
    pctype: [*c]const c_ushort,
    pclmap: [*c]const u8,
    pcumap: [*c]const u8,
    lc_time_curr: ?*struct___lc_time_data,
};
pub const struct_threadmbcinfostruct = opaque {};
pub const pthreadlocinfo = [*c]struct_threadlocaleinfostruct;
pub const pthreadmbcinfo = ?*struct_threadmbcinfostruct;
pub const struct_localeinfo_struct = extern struct {
    locinfo: pthreadlocinfo,
    mbcinfo: pthreadmbcinfo,
};
pub const _locale_tstruct = struct_localeinfo_struct;
pub const _locale_t = [*c]struct_localeinfo_struct;
pub const LPLC_ID = [*c]struct_tagLC_ID;
pub const threadlocinfo = struct_threadlocaleinfostruct;
pub const struct__exception = extern struct {
    type: c_int,
    name: [*c]const u8,
    arg1: f64,
    arg2: f64,
    retval: f64,
};
const struct_unnamed_2 = extern struct {
    low: c_uint,
    high: c_uint,
};
pub const union___mingw_dbl_type_t = extern union {
    x: f64,
    val: c_ulonglong,
    lh: struct_unnamed_2,
};
pub const __mingw_dbl_type_t = union___mingw_dbl_type_t;
pub const union___mingw_flt_type_t = extern union {
    x: f32,
    val: c_uint,
};
pub const __mingw_flt_type_t = union___mingw_flt_type_t; // C:\zig\lib\zig\libc\include\any-windows-any\math.h:137:11: warning: struct demoted to opaque type - has bitfield
const struct_unnamed_3 = opaque {};
pub const union___mingw_ldbl_type_t = extern union {
    x: c_longdouble,
    lh: struct_unnamed_3,
};
pub const __mingw_ldbl_type_t = union___mingw_ldbl_type_t;
pub extern var __imp__HUGE: [*c]f64;
pub extern fn __mingw_raise_matherr(typ: c_int, name: [*c]const u8, a1: f64, a2: f64, rslt: f64) void;
pub extern fn __mingw_setusermatherr(?fn ([*c]struct__exception) callconv(.C) c_int) void;
pub extern fn __setusermatherr(?fn ([*c]struct__exception) callconv(.C) c_int) void;
pub extern fn sin(_X: f64) f64;
pub extern fn cos(_X: f64) f64;
pub extern fn tan(_X: f64) f64;
pub extern fn sinh(_X: f64) f64;
pub extern fn cosh(_X: f64) f64;
pub extern fn tanh(_X: f64) f64;
pub extern fn asin(_X: f64) f64;
pub extern fn acos(_X: f64) f64;
pub extern fn atan(_X: f64) f64;
pub extern fn atan2(_Y: f64, _X: f64) f64;
pub extern fn exp(_X: f64) f64;
pub extern fn log(_X: f64) f64;
pub extern fn log10(_X: f64) f64;
pub extern fn pow(_X: f64, _Y: f64) f64;
pub extern fn sqrt(_X: f64) f64;
pub extern fn ceil(_X: f64) f64;
pub extern fn floor(_X: f64) f64;
pub fn fabsf(arg_x: f32) callconv(.C) f32 {
    var x = arg_x;
    return __builtin_fabsf(x);
} // C:\zig\lib\zig\libc\include\any-windows-any\math.h:215:5: warning: TODO implement translation of stmt class GCCAsmStmtClass
// C:\zig\lib\zig\libc\include\any-windows-any\math.h:209:36: warning: unable to translate function, demoted to extern
pub extern fn fabsl(arg_x: c_longdouble) callconv(.C) c_longdouble;
pub fn fabs(arg_x: f64) callconv(.C) f64 {
    var x = arg_x;
    return __builtin_fabs(x);
}
pub extern fn ldexp(_X: f64, _Y: c_int) f64;
pub extern fn frexp(_X: f64, _Y: [*c]c_int) f64;
pub extern fn modf(_X: f64, _Y: [*c]f64) f64;
pub extern fn fmod(_X: f64, _Y: f64) f64;
pub extern fn sincos(__x: f64, p_sin: [*c]f64, p_cos: [*c]f64) void;
pub extern fn sincosl(__x: c_longdouble, p_sin: [*c]c_longdouble, p_cos: [*c]c_longdouble) void;
pub extern fn sincosf(__x: f32, p_sin: [*c]f32, p_cos: [*c]f32) void;
pub extern fn abs(_X: c_int) c_int;
pub extern fn labs(_X: c_long) c_long;
pub extern fn atof(_String: [*c]const u8) f64;
pub extern fn _atof_l(_String: [*c]const u8, _Locale: _locale_t) f64;
pub const struct__complex = extern struct {
    x: f64,
    y: f64,
};
pub extern fn _cabs(_ComplexA: struct__complex) f64;
pub extern fn _hypot(_X: f64, _Y: f64) f64;
pub extern fn _j0(_X: f64) f64;
pub extern fn _j1(_X: f64) f64;
pub extern fn _jn(_X: c_int, _Y: f64) f64;
pub extern fn _y0(_X: f64) f64;
pub extern fn _y1(_X: f64) f64;
pub extern fn _yn(_X: c_int, _Y: f64) f64;
pub extern fn _matherr([*c]struct__exception) c_int;
pub extern fn _chgsign(_X: f64) f64;
pub extern fn _copysign(_Number: f64, _Sign: f64) f64;
pub extern fn _logb(f64) f64;
pub extern fn _nextafter(f64, f64) f64;
pub extern fn _scalb(f64, c_long) f64;
pub extern fn _finite(f64) c_int;
pub extern fn _fpclass(f64) c_int;
pub extern fn _isnan(f64) c_int;
pub extern fn j0(f64) f64;
pub extern fn j1(f64) f64;
pub extern fn jn(c_int, f64) f64;
pub extern fn y0(f64) f64;
pub extern fn y1(f64) f64;
pub extern fn yn(c_int, f64) f64;
pub extern fn chgsign(f64) f64;
pub extern fn finite(f64) c_int;
pub extern fn fpclass(f64) c_int;
pub const float_t = f32;
pub const double_t = f64;
pub fn __fpclassifyl(arg_x: c_longdouble) callconv(.C) c_int {
    var x = arg_x;
    var hlp: __mingw_ldbl_type_t = undefined;
    var e: c_uint = undefined;
    hlp.x = x;
    e = @bitCast(c_uint, hlp.lh.sign_exponent & @as(c_int, 32767));
    if (!(e != 0)) {
        var h: c_uint = hlp.lh.high;
        if (!((hlp.lh.low | h) != 0)) return 16384 else if (!((h & @as(c_uint, 2147483648)) != 0)) return @as(c_int, 1024) | @as(c_int, 16384);
    } else if (e == @bitCast(c_uint, @as(c_int, 32767))) return if (((hlp.lh.high & @bitCast(c_uint, @as(c_int, 2147483647))) | hlp.lh.low) == @bitCast(c_uint, @as(c_int, 0))) @as(c_int, 256) | @as(c_int, 1024) else @as(c_int, 256);
    return 1024;
}
pub fn __fpclassifyf(arg_x: f32) callconv(.C) c_int {
    var x = arg_x;
    var hlp: __mingw_flt_type_t = undefined;
    hlp.x = x;
    hlp.val &= @bitCast(c_uint, @as(c_int, 2147483647));
    if (hlp.val == @bitCast(c_uint, @as(c_int, 0))) return 16384;
    if (hlp.val < @bitCast(c_uint, @as(c_int, 8388608))) return @as(c_int, 1024) | @as(c_int, 16384);
    if (hlp.val >= @bitCast(c_uint, @as(c_int, 2139095040))) return if (hlp.val > @bitCast(c_uint, @as(c_int, 2139095040))) @as(c_int, 256) else @as(c_int, 256) | @as(c_int, 1024);
    return 1024;
}
pub fn __fpclassify(arg_x: f64) callconv(.C) c_int {
    var x = arg_x;
    var hlp: __mingw_dbl_type_t = undefined;
    var l: c_uint = undefined;
    var h: c_uint = undefined;
    hlp.x = x;
    h = hlp.lh.high;
    l = hlp.lh.low | (h & @bitCast(c_uint, @as(c_int, 1048575)));
    h &= @bitCast(c_uint, @as(c_int, 2146435072));
    if ((h | l) == @bitCast(c_uint, @as(c_int, 0))) return 16384;
    if (!(h != 0)) return @as(c_int, 1024) | @as(c_int, 16384);
    if (h == @bitCast(c_uint, @as(c_int, 2146435072))) return if (l != 0) @as(c_int, 256) else @as(c_int, 256) | @as(c_int, 1024);
    return 1024;
}
pub fn __isnan(arg__x: f64) callconv(.C) c_int {
    var _x = arg__x;
    var hlp: __mingw_dbl_type_t = undefined;
    var l: c_int = undefined;
    var h: c_int = undefined;
    hlp.x = _x;
    l = @bitCast(c_int, hlp.lh.low);
    h = @bitCast(c_int, hlp.lh.high & @bitCast(c_uint, @as(c_int, 2147483647)));
    h |= @bitCast(c_int, @bitCast(c_uint, l | -l) >> @intCast(@import("std").math.Log2Int(c_uint), 31));
    h = @as(c_int, 2146435072) - h;
    return @bitCast(c_int, @bitCast(c_uint, h)) >> @intCast(@import("std").math.Log2Int(c_int), 31);
}
pub fn __isnanf(arg__x: f32) callconv(.C) c_int {
    var _x = arg__x;
    var hlp: __mingw_flt_type_t = undefined;
    var i: c_int = undefined;
    hlp.x = _x;
    i = @bitCast(c_int, hlp.val & @bitCast(c_uint, @as(c_int, 2147483647)));
    i = @as(c_int, 2139095040) - i;
    return @bitCast(c_int, @bitCast(c_uint, i) >> @intCast(@import("std").math.Log2Int(c_uint), 31));
}
pub fn __isnanl(arg__x: c_longdouble) callconv(.C) c_int {
    var _x = arg__x;
    var ld: __mingw_ldbl_type_t = undefined;
    var xx: c_int = undefined;
    var signexp: c_int = undefined;
    ld.x = _x;
    signexp = (ld.lh.sign_exponent & @as(c_int, 32767)) << @intCast(@import("std").math.Log2Int(c_int), 1);
    xx = @bitCast(c_int, ld.lh.low | (ld.lh.high & @as(c_uint, 2147483647)));
    signexp |= @bitCast(c_int, @bitCast(c_uint, xx | -xx) >> @intCast(@import("std").math.Log2Int(c_uint), 31));
    signexp = @as(c_int, 65534) - signexp;
    return @bitCast(c_int, @bitCast(c_uint, signexp)) >> @intCast(@import("std").math.Log2Int(c_int), 16);
}
pub fn __signbit(arg_x: f64) callconv(.C) c_int {
    var x = arg_x;
    var hlp: __mingw_dbl_type_t = undefined;
    hlp.x = x;
    return @boolToInt((hlp.lh.high & @as(c_uint, 2147483648)) != @bitCast(c_uint, @as(c_int, 0)));
}
pub fn __signbitf(arg_x: f32) callconv(.C) c_int {
    var x = arg_x;
    var hlp: __mingw_flt_type_t = undefined;
    hlp.x = x;
    return @boolToInt((hlp.val & @as(c_uint, 2147483648)) != @bitCast(c_uint, @as(c_int, 0)));
}
pub fn __signbitl(arg_x: c_longdouble) callconv(.C) c_int {
    var x = arg_x;
    var ld: __mingw_ldbl_type_t = undefined;
    ld.x = x;
    return @boolToInt((ld.lh.sign_exponent & @as(c_int, 32768)) != @as(c_int, 0));
}
pub extern fn sinf(_X: f32) f32;
pub extern fn sinl(c_longdouble) c_longdouble;
pub extern fn cosf(_X: f32) f32;
pub extern fn cosl(c_longdouble) c_longdouble;
pub extern fn tanf(_X: f32) f32;
pub extern fn tanl(c_longdouble) c_longdouble;
pub extern fn asinf(_X: f32) f32;
pub extern fn asinl(c_longdouble) c_longdouble;
pub extern fn acosf(f32) f32;
pub extern fn acosl(c_longdouble) c_longdouble;
pub extern fn atanf(f32) f32;
pub extern fn atanl(c_longdouble) c_longdouble;
pub extern fn atan2f(f32, f32) f32;
pub extern fn atan2l(c_longdouble, c_longdouble) c_longdouble;
pub fn sinhf(arg__X: f32) callconv(.C) f32 {
    var _X = arg__X;
    return @floatCast(f32, sinh(@floatCast(f64, _X)));
}
pub extern fn sinhl(c_longdouble) c_longdouble;
pub fn coshf(arg__X: f32) callconv(.C) f32 {
    var _X = arg__X;
    return @floatCast(f32, cosh(@floatCast(f64, _X)));
}
pub extern fn coshl(c_longdouble) c_longdouble;
pub fn tanhf(arg__X: f32) callconv(.C) f32 {
    var _X = arg__X;
    return @floatCast(f32, tanh(@floatCast(f64, _X)));
}
pub extern fn tanhl(c_longdouble) c_longdouble;
pub extern fn acosh(f64) f64;
pub extern fn acoshf(f32) f32;
pub extern fn acoshl(c_longdouble) c_longdouble;
pub extern fn asinh(f64) f64;
pub extern fn asinhf(f32) f32;
pub extern fn asinhl(c_longdouble) c_longdouble;
pub extern fn atanh(f64) f64;
pub extern fn atanhf(f32) f32;
pub extern fn atanhl(c_longdouble) c_longdouble;
pub fn expf(arg__X: f32) callconv(.C) f32 {
    var _X = arg__X;
    return @floatCast(f32, exp(@floatCast(f64, _X)));
}
pub extern fn expl(c_longdouble) c_longdouble;
pub extern fn exp2(f64) f64;
pub extern fn exp2f(f32) f32;
pub extern fn exp2l(c_longdouble) c_longdouble;
pub extern fn expm1(f64) f64;
pub extern fn expm1f(f32) f32;
pub extern fn expm1l(c_longdouble) c_longdouble;
pub fn frexpf(arg__X: f32, arg__Y: [*c]c_int) callconv(.C) f32 {
    var _X = arg__X;
    var _Y = arg__Y;
    return @floatCast(f32, frexp(@floatCast(f64, _X), _Y));
}
pub extern fn frexpl(c_longdouble, [*c]c_int) c_longdouble;
pub extern fn ilogb(f64) c_int;
pub extern fn ilogbf(f32) c_int;
pub extern fn ilogbl(c_longdouble) c_int;
pub fn ldexpf(arg_x: f32, arg_expn: c_int) callconv(.C) f32 {
    var x = arg_x;
    var expn = arg_expn;
    return @floatCast(f32, ldexp(@floatCast(f64, x), expn));
}
pub extern fn ldexpl(c_longdouble, c_int) c_longdouble;
pub extern fn logf(f32) f32;
pub extern fn logl(c_longdouble) c_longdouble;
pub extern fn log10f(f32) f32;
pub extern fn log10l(c_longdouble) c_longdouble;
pub extern fn log1p(f64) f64;
pub extern fn log1pf(f32) f32;
pub extern fn log1pl(c_longdouble) c_longdouble;
pub extern fn log2(f64) f64;
pub extern fn log2f(f32) f32;
pub extern fn log2l(c_longdouble) c_longdouble;
pub extern fn logb(f64) f64;
pub extern fn logbf(f32) f32;
pub extern fn logbl(c_longdouble) c_longdouble;
pub extern fn modff(f32, [*c]f32) f32;
pub extern fn modfl(c_longdouble, [*c]c_longdouble) c_longdouble;
pub extern fn scalbn(f64, c_int) f64;
pub extern fn scalbnf(f32, c_int) f32;
pub extern fn scalbnl(c_longdouble, c_int) c_longdouble;
pub extern fn scalbln(f64, c_long) f64;
pub extern fn scalblnf(f32, c_long) f32;
pub extern fn scalblnl(c_longdouble, c_long) c_longdouble;
pub extern fn cbrt(f64) f64;
pub extern fn cbrtf(f32) f32;
pub extern fn cbrtl(c_longdouble) c_longdouble;
pub extern fn hypot(f64, f64) f64;
pub fn hypotf(arg_x: f32, arg_y: f32) callconv(.C) f32 {
    var x = arg_x;
    var y = arg_y;
    return @floatCast(f32, hypot(@floatCast(f64, x), @floatCast(f64, y)));
}
pub extern fn hypotl(c_longdouble, c_longdouble) c_longdouble;
pub fn powf(arg__X: f32, arg__Y: f32) callconv(.C) f32 {
    var _X = arg__X;
    var _Y = arg__Y;
    return @floatCast(f32, pow(@floatCast(f64, _X), @floatCast(f64, _Y)));
}
pub extern fn powl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn sqrtf(f32) f32;
pub extern fn sqrtl(c_longdouble) c_longdouble;
pub extern fn erf(f64) f64;
pub extern fn erff(f32) f32;
pub extern fn erfl(c_longdouble) c_longdouble;
pub extern fn erfc(f64) f64;
pub extern fn erfcf(f32) f32;
pub extern fn erfcl(c_longdouble) c_longdouble;
pub extern fn lgamma(f64) f64;
pub extern fn lgammaf(f32) f32;
pub extern fn lgammal(c_longdouble) c_longdouble;
pub extern var signgam: c_int;
pub extern fn tgamma(f64) f64;
pub extern fn tgammaf(f32) f32;
pub extern fn tgammal(c_longdouble) c_longdouble;
pub extern fn ceilf(f32) f32;
pub extern fn ceill(c_longdouble) c_longdouble;
pub extern fn floorf(f32) f32;
pub extern fn floorl(c_longdouble) c_longdouble;
pub extern fn nearbyint(f64) f64;
pub extern fn nearbyintf(f32) f32;
pub extern fn nearbyintl(c_longdouble) c_longdouble;
pub extern fn rint(f64) f64;
pub extern fn rintf(f32) f32;
pub extern fn rintl(c_longdouble) c_longdouble;
pub extern fn lrint(f64) c_long;
pub extern fn lrintf(f32) c_long;
pub extern fn lrintl(c_longdouble) c_long;
pub extern fn llrint(f64) c_longlong;
pub extern fn llrintf(f32) c_longlong;
pub extern fn llrintl(c_longdouble) c_longlong;
pub extern fn round(f64) f64;
pub extern fn roundf(f32) f32;
pub extern fn roundl(c_longdouble) c_longdouble;
pub extern fn lround(f64) c_long;
pub extern fn lroundf(f32) c_long;
pub extern fn lroundl(c_longdouble) c_long;
pub extern fn llround(f64) c_longlong;
pub extern fn llroundf(f32) c_longlong;
pub extern fn llroundl(c_longdouble) c_longlong;
pub extern fn trunc(f64) f64;
pub extern fn truncf(f32) f32;
pub extern fn truncl(c_longdouble) c_longdouble;
pub extern fn fmodf(f32, f32) f32;
pub extern fn fmodl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn remainder(f64, f64) f64;
pub extern fn remainderf(f32, f32) f32;
pub extern fn remainderl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn remquo(f64, f64, [*c]c_int) f64;
pub extern fn remquof(f32, f32, [*c]c_int) f32;
pub extern fn remquol(c_longdouble, c_longdouble, [*c]c_int) c_longdouble;
pub fn copysign(arg_x: f64, arg_y: f64) callconv(.C) f64 {
    var x = arg_x;
    var y = arg_y;
    var hx: __mingw_dbl_type_t = undefined;
    var hy: __mingw_dbl_type_t = undefined;
    hx.x = x;
    hy.x = y;
    hx.lh.high = (hx.lh.high & @bitCast(c_uint, @as(c_int, 2147483647))) | (hy.lh.high & @as(c_uint, 2147483648));
    return hx.x;
}
pub fn copysignf(arg_x: f32, arg_y: f32) callconv(.C) f32 {
    var x = arg_x;
    var y = arg_y;
    var hx: __mingw_flt_type_t = undefined;
    var hy: __mingw_flt_type_t = undefined;
    hx.x = x;
    hy.x = y;
    hx.val = (hx.val & @bitCast(c_uint, @as(c_int, 2147483647))) | (hy.val & @as(c_uint, 2147483648));
    return hx.x;
}
pub extern fn copysignl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn nan(tagp: [*c]const u8) f64;
pub extern fn nanf(tagp: [*c]const u8) f32;
pub extern fn nanl(tagp: [*c]const u8) c_longdouble;
pub extern fn nextafter(f64, f64) f64;
pub extern fn nextafterf(f32, f32) f32;
pub extern fn nextafterl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn nexttoward(f64, c_longdouble) f64;
pub extern fn nexttowardf(f32, c_longdouble) f32;
pub extern fn nexttowardl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fdim(x: f64, y: f64) f64;
pub extern fn fdimf(x: f32, y: f32) f32;
pub extern fn fdiml(x: c_longdouble, y: c_longdouble) c_longdouble;
pub extern fn fmax(f64, f64) f64;
pub extern fn fmaxf(f32, f32) f32;
pub extern fn fmaxl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fmin(f64, f64) f64;
pub extern fn fminf(f32, f32) f32;
pub extern fn fminl(c_longdouble, c_longdouble) c_longdouble;
pub extern fn fma(f64, f64, f64) f64;
pub extern fn fmaf(f32, f32, f32) f32;
pub extern fn fmal(c_longdouble, c_longdouble, c_longdouble) c_longdouble;
pub extern fn _copysignf(_Number: f32, _Sign: f32) f32;
pub extern fn _chgsignf(_X: f32) f32;
pub extern fn _logbf(_X: f32) f32;
pub extern fn _nextafterf(_X: f32, _Y: f32) f32;
pub extern fn _finitef(_X: f32) c_int;
pub extern fn _isnanf(_X: f32) c_int;
pub extern fn _fpclassf(_X: f32) c_int;
pub extern fn _chgsignl(c_longdouble) c_longdouble;
pub fn Clamp(arg_value: f32, arg_min: f32, arg_max: f32) callconv(.C) f32 {
    var value = arg_value;
    var min = arg_min;
    var max = arg_max;
    const res: f32 = if (value < min) min else value;
    return if (res > max) max else res;
}
pub fn Lerp(arg_start: f32, arg_end: f32, arg_amount: f32) callconv(.C) f32 {
    var start = arg_start;
    var end = arg_end;
    var amount = arg_amount;
    return start + (amount * (end - start));
}
pub fn Normalize(arg_value: f32, arg_start: f32, arg_end: f32) callconv(.C) f32 {
    var value = arg_value;
    var start = arg_start;
    var end = arg_end;
    return (value - start) / (end - start);
}
pub fn Remap(arg_value: f32, arg_inputStart: f32, arg_inputEnd: f32, arg_outputStart: f32, arg_outputEnd: f32) callconv(.C) f32 {
    var value = arg_value;
    var inputStart = arg_inputStart;
    var inputEnd = arg_inputEnd;
    var outputStart = arg_outputStart;
    var outputEnd = arg_outputEnd;
    return (((value - inputStart) / (inputEnd - inputStart)) * (outputEnd - outputStart)) + outputStart;
}
pub fn Vector2Zero() callconv(.C) Vector2 {
    var result: Vector2 = Vector2{
        .x = 0.0,
        .y = 0.0,
    };
    return result;
}
pub fn Vector2One() callconv(.C) Vector2 {
    var result: Vector2 = Vector2{
        .x = 1.0,
        .y = 1.0,
    };
    return result;
}
pub fn Vector2Add(arg_v1: Vector2, arg_v2: Vector2) callconv(.C) Vector2 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector2 = Vector2{
        .x = v1.x + v2.x,
        .y = v1.y + v2.y,
    };
    return result;
}
pub fn Vector2AddValue(arg_v: Vector2, arg_add: f32) callconv(.C) Vector2 {
    var v = arg_v;
    var add = arg_add;
    var result: Vector2 = Vector2{
        .x = v.x + add,
        .y = v.y + add,
    };
    return result;
}
pub fn Vector2Subtract(arg_v1: Vector2, arg_v2: Vector2) callconv(.C) Vector2 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector2 = Vector2{
        .x = v1.x - v2.x,
        .y = v1.y - v2.y,
    };
    return result;
}
pub fn Vector2SubtractValue(arg_v: Vector2, arg_sub: f32) callconv(.C) Vector2 {
    var v = arg_v;
    var sub = arg_sub;
    var result: Vector2 = Vector2{
        .x = v.x - sub,
        .y = v.y - sub,
    };
    return result;
}
pub fn Vector2Length(arg_v: Vector2) callconv(.C) f32 {
    var v = arg_v;
    var result: f32 = sqrtf((v.x * v.x) + (v.y * v.y));
    return result;
}
pub fn Vector2LengthSqr(arg_v: Vector2) callconv(.C) f32 {
    var v = arg_v;
    var result: f32 = (v.x * v.x) + (v.y * v.y);
    return result;
}
pub fn Vector2DotProduct(arg_v1: Vector2, arg_v2: Vector2) callconv(.C) f32 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: f32 = (v1.x * v2.x) + (v1.y * v2.y);
    return result;
}
pub fn Vector2Distance(arg_v1: Vector2, arg_v2: Vector2) callconv(.C) f32 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: f32 = sqrtf(((v1.x - v2.x) * (v1.x - v2.x)) + ((v1.y - v2.y) * (v1.y - v2.y)));
    return result;
}
pub fn Vector2Angle(arg_v1: Vector2, arg_v2: Vector2) callconv(.C) f32 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: f32 = atan2f(v2.y - v1.y, v2.x - v1.x) * (180.0 / 3.1415927410125732);
    if (result < @intToFloat(f32, @as(c_int, 0))) {
        result += 360.0;
    }
    return result;
}
pub fn Vector2Scale(arg_v: Vector2, arg_scale: f32) callconv(.C) Vector2 {
    var v = arg_v;
    var scale = arg_scale;
    var result: Vector2 = Vector2{
        .x = v.x * scale,
        .y = v.y * scale,
    };
    return result;
}
pub fn Vector2Multiply(arg_v1: Vector2, arg_v2: Vector2) callconv(.C) Vector2 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector2 = Vector2{
        .x = v1.x * v2.x,
        .y = v1.y * v2.y,
    };
    return result;
}
pub fn Vector2Negate(arg_v: Vector2) callconv(.C) Vector2 {
    var v = arg_v;
    var result: Vector2 = Vector2{
        .x = -v.x,
        .y = -v.y,
    };
    return result;
}
pub fn Vector2Divide(arg_v1: Vector2, arg_v2: Vector2) callconv(.C) Vector2 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector2 = Vector2{
        .x = v1.x / v2.x,
        .y = v1.y / v2.y,
    };
    return result;
}
pub fn Vector2Normalize(arg_v: Vector2) callconv(.C) Vector2 {
    var v = arg_v;
    var result: Vector2 = Vector2Scale(v, @intToFloat(f32, @as(c_int, 1)) / Vector2Length(v));
    return result;
}
pub fn Vector2Lerp(arg_v1: Vector2, arg_v2: Vector2, arg_amount: f32) callconv(.C) Vector2 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var amount = arg_amount;
    var result: Vector2 = Vector2{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
    };
    result.x = v1.x + (amount * (v2.x - v1.x));
    result.y = v1.y + (amount * (v2.y - v1.y));
    return result;
}
pub fn Vector2Reflect(arg_v: Vector2, arg_normal: Vector2) callconv(.C) Vector2 {
    var v = arg_v;
    var normal = arg_normal;
    var result: Vector2 = Vector2{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
    };
    var dotProduct: f32 = Vector2DotProduct(v, normal);
    result.x = v.x - ((2.0 * normal.x) * dotProduct);
    result.y = v.y - ((2.0 * normal.y) * dotProduct);
    return result;
}
pub fn Vector2Rotate(arg_v: Vector2, arg_degs: f32) callconv(.C) Vector2 {
    var v = arg_v;
    var degs = arg_degs;
    var rads: f32 = degs * (3.1415927410125732 / 180.0);
    var result: Vector2 = Vector2{
        .x = (v.x * cosf(rads)) - (v.y * sinf(rads)),
        .y = (v.x * sinf(rads)) + (v.y * cosf(rads)),
    };
    return result;
}
pub fn Vector2MoveTowards(arg_v: Vector2, arg_target: Vector2, arg_maxDistance: f32) callconv(.C) Vector2 {
    var v = arg_v;
    var target = arg_target;
    var maxDistance = arg_maxDistance;
    var result: Vector2 = Vector2{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
    };
    var dx: f32 = target.x - v.x;
    var dy: f32 = target.y - v.y;
    var value: f32 = (dx * dx) + (dy * dy);
    if ((value == @intToFloat(f32, @as(c_int, 0))) or ((maxDistance >= @intToFloat(f32, @as(c_int, 0))) and (value <= (maxDistance * maxDistance)))) {
        result = target;
    }
    var dist: f32 = sqrtf(value);
    result.x = v.x + ((dx / dist) * maxDistance);
    result.y = v.y + ((dy / dist) * maxDistance);
    return result;
}
pub fn Vector3Zero() callconv(.C) Vector3 {
    var result: Vector3 = Vector3{
        .x = 0.0,
        .y = 0.0,
        .z = 0.0,
    };
    return result;
}
pub fn Vector3One() callconv(.C) Vector3 {
    var result: Vector3 = Vector3{
        .x = 1.0,
        .y = 1.0,
        .z = 1.0,
    };
    return result;
}
pub fn Vector3Add(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) Vector3 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector3 = Vector3{
        .x = v1.x + v2.x,
        .y = v1.y + v2.y,
        .z = v1.z + v2.z,
    };
    return result;
}
pub fn Vector3AddValue(arg_v: Vector3, arg_add: f32) callconv(.C) Vector3 {
    var v = arg_v;
    var add = arg_add;
    var result: Vector3 = Vector3{
        .x = v.x + add,
        .y = v.y + add,
        .z = v.z + add,
    };
    return result;
}
pub fn Vector3Subtract(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) Vector3 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector3 = Vector3{
        .x = v1.x - v2.x,
        .y = v1.y - v2.y,
        .z = v1.z - v2.z,
    };
    return result;
}
pub fn Vector3SubtractValue(arg_v: Vector3, arg_sub: f32) callconv(.C) Vector3 {
    var v = arg_v;
    var sub = arg_sub;
    var result: Vector3 = Vector3{
        .x = v.x - sub,
        .y = v.y - sub,
        .z = v.z - sub,
    };
    return result;
}
pub fn Vector3Scale(arg_v: Vector3, arg_scalar: f32) callconv(.C) Vector3 {
    var v = arg_v;
    var scalar = arg_scalar;
    var result: Vector3 = Vector3{
        .x = v.x * scalar,
        .y = v.y * scalar,
        .z = v.z * scalar,
    };
    return result;
}
pub fn Vector3Multiply(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) Vector3 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector3 = Vector3{
        .x = v1.x * v2.x,
        .y = v1.y * v2.y,
        .z = v1.z * v2.z,
    };
    return result;
}
pub fn Vector3CrossProduct(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) Vector3 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector3 = Vector3{
        .x = (v1.y * v2.z) - (v1.z * v2.y),
        .y = (v1.z * v2.x) - (v1.x * v2.z),
        .z = (v1.x * v2.y) - (v1.y * v2.x),
    };
    return result;
}
pub fn Vector3Perpendicular(arg_v: Vector3) callconv(.C) Vector3 {
    var v = arg_v;
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    var min: f32 = @floatCast(f32, fabs(@floatCast(f64, v.x)));
    var cardinalAxis: Vector3 = Vector3{
        .x = 1.0,
        .y = 0.0,
        .z = 0.0,
    };
    if (fabs(@floatCast(f64, v.y)) < @floatCast(f64, min)) {
        min = @floatCast(f32, fabs(@floatCast(f64, v.y)));
        var tmp: Vector3 = Vector3{
            .x = 0.0,
            .y = 1.0,
            .z = 0.0,
        };
        cardinalAxis = tmp;
    }
    if (fabs(@floatCast(f64, v.z)) < @floatCast(f64, min)) {
        var tmp: Vector3 = Vector3{
            .x = 0.0,
            .y = 0.0,
            .z = 1.0,
        };
        cardinalAxis = tmp;
    }
    result = Vector3CrossProduct(v, cardinalAxis);
    return result;
}
pub fn Vector3Length(v: Vector3) callconv(.C) f32 {
    var result: f32 = sqrtf(((v.x * v.x) + (v.y * v.y)) + (v.z * v.z));
    return result;
}
pub fn Vector3LengthSqr(v: Vector3) callconv(.C) f32 {
    var result: f32 = ((v.x * v.x) + (v.y * v.y)) + (v.z * v.z);
    return result;
}
pub fn Vector3DotProduct(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) f32 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: f32 = ((v1.x * v2.x) + (v1.y * v2.y)) + (v1.z * v2.z);
    return result;
}
pub fn Vector3Distance(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) f32 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var dx: f32 = v2.x - v1.x;
    var dy: f32 = v2.y - v1.y;
    var dz: f32 = v2.z - v1.z;
    var result: f32 = sqrtf(((dx * dx) + (dy * dy)) + (dz * dz));
    return result;
}
pub fn Vector3Negate(arg_v: Vector3) callconv(.C) Vector3 {
    var v = arg_v;
    var result: Vector3 = Vector3{
        .x = -v.x,
        .y = -v.y,
        .z = -v.z,
    };
    return result;
}
pub fn Vector3Divide(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) Vector3 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector3 = Vector3{
        .x = v1.x / v2.x,
        .y = v1.y / v2.y,
        .z = v1.z / v2.z,
    };
    return result;
}
pub fn Vector3Normalize(arg_v: Vector3) callconv(.C) Vector3 {
    var v = arg_v;
    var result: Vector3 = v;
    var length: f32 = undefined;
    var ilength: f32 = undefined;
    length = Vector3Length(v);
    if (length == 0.0) {
        length = 1.0;
    }
    ilength = 1.0 / length;
    result.x *= ilength;
    result.y *= ilength;
    result.z *= ilength;
    return result;
}
pub fn Vector3OrthoNormalize(arg_v1: [*c]Vector3, arg_v2: [*c]Vector3) callconv(.C) void {
    var v1 = arg_v1;
    var v2 = arg_v2;
    v1.?.* = Vector3Normalize(v1.?.*);
    var vn: Vector3 = Vector3CrossProduct(v1.?.*, v2.?.*);
    vn = Vector3Normalize(vn);
    v2.?.* = Vector3CrossProduct(vn, v1.?.*);
}
pub fn Vector3Transform(arg_v: Vector3, arg_mat: Matrix) callconv(.C) Vector3 {
    var v = arg_v;
    var mat = arg_mat;
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    var x: f32 = v.x;
    var y: f32 = v.y;
    var z: f32 = v.z;
    result.x = (((mat.m0 * x) + (mat.m4 * y)) + (mat.m8 * z)) + mat.m12;
    result.y = (((mat.m1 * x) + (mat.m5 * y)) + (mat.m9 * z)) + mat.m13;
    result.z = (((mat.m2 * x) + (mat.m6 * y)) + (mat.m10 * z)) + mat.m14;
    return result;
}
pub fn Vector3RotateByQuaternion(arg_v: Vector3, arg_q: Quaternion) callconv(.C) Vector3 {
    var v = arg_v;
    var q = arg_q;
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    result.x = ((v.x * ((((q.x * q.x) + (q.w * q.w)) - (q.y * q.y)) - (q.z * q.z))) + (v.y * (((@intToFloat(f32, @as(c_int, 2)) * q.x) * q.y) - ((@intToFloat(f32, @as(c_int, 2)) * q.w) * q.z)))) + (v.z * (((@intToFloat(f32, @as(c_int, 2)) * q.x) * q.z) + ((@intToFloat(f32, @as(c_int, 2)) * q.w) * q.y)));
    result.y = ((v.x * (((@intToFloat(f32, @as(c_int, 2)) * q.w) * q.z) + ((@intToFloat(f32, @as(c_int, 2)) * q.x) * q.y))) + (v.y * ((((q.w * q.w) - (q.x * q.x)) + (q.y * q.y)) - (q.z * q.z)))) + (v.z * (((@intToFloat(f32, -@as(c_int, 2)) * q.w) * q.x) + ((@intToFloat(f32, @as(c_int, 2)) * q.y) * q.z)));
    result.z = ((v.x * (((@intToFloat(f32, -@as(c_int, 2)) * q.w) * q.y) + ((@intToFloat(f32, @as(c_int, 2)) * q.x) * q.z))) + (v.y * (((@intToFloat(f32, @as(c_int, 2)) * q.w) * q.x) + ((@intToFloat(f32, @as(c_int, 2)) * q.y) * q.z)))) + (v.z * ((((q.w * q.w) - (q.x * q.x)) - (q.y * q.y)) + (q.z * q.z)));
    return result;
}
pub fn Vector3Lerp(arg_v1: Vector3, arg_v2: Vector3, arg_amount: f32) callconv(.C) Vector3 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var amount = arg_amount;
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    result.x = v1.x + (amount * (v2.x - v1.x));
    result.y = v1.y + (amount * (v2.y - v1.y));
    result.z = v1.z + (amount * (v2.z - v1.z));
    return result;
}
pub fn Vector3Reflect(arg_v: Vector3, arg_normal: Vector3) callconv(.C) Vector3 {
    var v = arg_v;
    var normal = arg_normal;
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    var dotProduct: f32 = Vector3DotProduct(v, normal);
    result.x = v.x - ((2.0 * normal.x) * dotProduct);
    result.y = v.y - ((2.0 * normal.y) * dotProduct);
    result.z = v.z - ((2.0 * normal.z) * dotProduct);
    return result;
}
pub fn Vector3Min(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) Vector3 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    result.x = fminf(v1.x, v2.x);
    result.y = fminf(v1.y, v2.y);
    result.z = fminf(v1.z, v2.z);
    return result;
}
pub fn Vector3Max(arg_v1: Vector3, arg_v2: Vector3) callconv(.C) Vector3 {
    var v1 = arg_v1;
    var v2 = arg_v2;
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    result.x = fmaxf(v1.x, v2.x);
    result.y = fmaxf(v1.y, v2.y);
    result.z = fmaxf(v1.z, v2.z);
    return result;
}
pub fn Vector3Barycenter(arg_p: Vector3, arg_a: Vector3, arg_b: Vector3, arg_c: Vector3) callconv(.C) Vector3 {
    var p = arg_p;
    var a = arg_a;
    var b = arg_b;
    var c = arg_c;
    var v0: Vector3 = Vector3Subtract(b, a);
    var v1: Vector3 = Vector3Subtract(c, a);
    var v2: Vector3 = Vector3Subtract(p, a);
    var d00: f32 = Vector3DotProduct(v0, v0);
    var d01: f32 = Vector3DotProduct(v0, v1);
    var d11: f32 = Vector3DotProduct(v1, v1);
    var d20: f32 = Vector3DotProduct(v2, v0);
    var d21: f32 = Vector3DotProduct(v2, v1);
    var denom: f32 = (d00 * d11) - (d01 * d01);
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    result.y = ((d11 * d20) - (d01 * d21)) / denom;
    result.z = ((d00 * d21) - (d01 * d20)) / denom;
    result.x = 1.0 - (result.z + result.y);
    return result;
}
pub fn Vector3ToFloatV(arg_v: Vector3) callconv(.C) float3 {
    var v = arg_v;
    var buffer: float3 = float3{
        .v = [1]f32{
            0,
        } ++ [1]f32{0} ** 2,
    };
    buffer.v[@intCast(c_uint, @as(c_int, 0))] = v.x;
    buffer.v[@intCast(c_uint, @as(c_int, 1))] = v.y;
    buffer.v[@intCast(c_uint, @as(c_int, 2))] = v.z;
    return buffer;
}
pub fn MatrixDeterminant(arg_mat: Matrix) callconv(.C) f32 {
    var mat = arg_mat;
    var a00: f32 = mat.m0;
    var a01: f32 = mat.m1;
    var a02: f32 = mat.m2;
    var a03: f32 = mat.m3;
    var a10: f32 = mat.m4;
    var a11: f32 = mat.m5;
    var a12: f32 = mat.m6;
    var a13: f32 = mat.m7;
    var a20: f32 = mat.m8;
    var a21: f32 = mat.m9;
    var a22: f32 = mat.m10;
    var a23: f32 = mat.m11;
    var a30: f32 = mat.m12;
    var a31: f32 = mat.m13;
    var a32: f32 = mat.m14;
    var a33: f32 = mat.m15;
    var result: f32 = (((((((((((((((((((((((((a30 * a21) * a12) * a03) - (((a20 * a31) * a12) * a03)) - (((a30 * a11) * a22) * a03)) + (((a10 * a31) * a22) * a03)) + (((a20 * a11) * a32) * a03)) - (((a10 * a21) * a32) * a03)) - (((a30 * a21) * a02) * a13)) + (((a20 * a31) * a02) * a13)) + (((a30 * a01) * a22) * a13)) - (((a00 * a31) * a22) * a13)) - (((a20 * a01) * a32) * a13)) + (((a00 * a21) * a32) * a13)) + (((a30 * a11) * a02) * a23)) - (((a10 * a31) * a02) * a23)) - (((a30 * a01) * a12) * a23)) + (((a00 * a31) * a12) * a23)) + (((a10 * a01) * a32) * a23)) - (((a00 * a11) * a32) * a23)) - (((a20 * a11) * a02) * a33)) + (((a10 * a21) * a02) * a33)) + (((a20 * a01) * a12) * a33)) - (((a00 * a21) * a12) * a33)) - (((a10 * a01) * a22) * a33)) + (((a00 * a11) * a22) * a33);
    return result;
}
pub fn MatrixTrace(arg_mat: Matrix) callconv(.C) f32 {
    var mat = arg_mat;
    var result: f32 = ((mat.m0 + mat.m5) + mat.m10) + mat.m15;
    return result;
}
pub fn MatrixTranspose(arg_mat: Matrix) callconv(.C) Matrix {
    var mat = arg_mat;
    var result: Matrix = Matrix{
        .m0 = @intToFloat(f32, @as(c_int, 0)),
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    result.m0 = mat.m0;
    result.m1 = mat.m4;
    result.m2 = mat.m8;
    result.m3 = mat.m12;
    result.m4 = mat.m1;
    result.m5 = mat.m5;
    result.m6 = mat.m9;
    result.m7 = mat.m13;
    result.m8 = mat.m2;
    result.m9 = mat.m6;
    result.m10 = mat.m10;
    result.m11 = mat.m14;
    result.m12 = mat.m3;
    result.m13 = mat.m7;
    result.m14 = mat.m11;
    result.m15 = mat.m15;
    return result;
}
pub fn MatrixInvert(arg_mat: Matrix) callconv(.C) Matrix {
    var mat = arg_mat;
    var result: Matrix = Matrix{
        .m0 = 0,
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    var a00: f32 = mat.m0;
    var a01: f32 = mat.m1;
    var a02: f32 = mat.m2;
    var a03: f32 = mat.m3;
    var a10: f32 = mat.m4;
    var a11: f32 = mat.m5;
    var a12: f32 = mat.m6;
    var a13: f32 = mat.m7;
    var a20: f32 = mat.m8;
    var a21: f32 = mat.m9;
    var a22: f32 = mat.m10;
    var a23: f32 = mat.m11;
    var a30: f32 = mat.m12;
    var a31: f32 = mat.m13;
    var a32: f32 = mat.m14;
    var a33: f32 = mat.m15;
    var b00: f32 = (a00 * a11) - (a01 * a10);
    var b01: f32 = (a00 * a12) - (a02 * a10);
    var b02: f32 = (a00 * a13) - (a03 * a10);
    var b03: f32 = (a01 * a12) - (a02 * a11);
    var b04: f32 = (a01 * a13) - (a03 * a11);
    var b05: f32 = (a02 * a13) - (a03 * a12);
    var b06: f32 = (a20 * a31) - (a21 * a30);
    var b07: f32 = (a20 * a32) - (a22 * a30);
    var b08: f32 = (a20 * a33) - (a23 * a30);
    var b09: f32 = (a21 * a32) - (a22 * a31);
    var b10: f32 = (a21 * a33) - (a23 * a31);
    var b11: f32 = (a22 * a33) - (a23 * a32);
    var invDet: f32 = 1.0 / ((((((b00 * b11) - (b01 * b10)) + (b02 * b09)) + (b03 * b08)) - (b04 * b07)) + (b05 * b06));
    result.m0 = (((a11 * b11) - (a12 * b10)) + (a13 * b09)) * invDet;
    result.m1 = (((-a01 * b11) + (a02 * b10)) - (a03 * b09)) * invDet;
    result.m2 = (((a31 * b05) - (a32 * b04)) + (a33 * b03)) * invDet;
    result.m3 = (((-a21 * b05) + (a22 * b04)) - (a23 * b03)) * invDet;
    result.m4 = (((-a10 * b11) + (a12 * b08)) - (a13 * b07)) * invDet;
    result.m5 = (((a00 * b11) - (a02 * b08)) + (a03 * b07)) * invDet;
    result.m6 = (((-a30 * b05) + (a32 * b02)) - (a33 * b01)) * invDet;
    result.m7 = (((a20 * b05) - (a22 * b02)) + (a23 * b01)) * invDet;
    result.m8 = (((a10 * b10) - (a11 * b08)) + (a13 * b06)) * invDet;
    result.m9 = (((-a00 * b10) + (a01 * b08)) - (a03 * b06)) * invDet;
    result.m10 = (((a30 * b04) - (a31 * b02)) + (a33 * b00)) * invDet;
    result.m11 = (((-a20 * b04) + (a21 * b02)) - (a23 * b00)) * invDet;
    result.m12 = (((-a10 * b09) + (a11 * b07)) - (a12 * b06)) * invDet;
    result.m13 = (((a00 * b09) - (a01 * b07)) + (a02 * b06)) * invDet;
    result.m14 = (((-a30 * b03) + (a31 * b01)) - (a32 * b00)) * invDet;
    result.m15 = (((a20 * b03) - (a21 * b01)) + (a22 * b00)) * invDet;
    return result;
}
pub fn MatrixNormalize(arg_mat: Matrix) callconv(.C) Matrix {
    var mat = arg_mat;
    var result: Matrix = Matrix{
        .m0 = @intToFloat(f32, @as(c_int, 0)),
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    var det: f32 = MatrixDeterminant(mat);
    result.m0 = mat.m0 / det;
    result.m1 = mat.m1 / det;
    result.m2 = mat.m2 / det;
    result.m3 = mat.m3 / det;
    result.m4 = mat.m4 / det;
    result.m5 = mat.m5 / det;
    result.m6 = mat.m6 / det;
    result.m7 = mat.m7 / det;
    result.m8 = mat.m8 / det;
    result.m9 = mat.m9 / det;
    result.m10 = mat.m10 / det;
    result.m11 = mat.m11 / det;
    result.m12 = mat.m12 / det;
    result.m13 = mat.m13 / det;
    result.m14 = mat.m14 / det;
    result.m15 = mat.m15 / det;
    return result;
}
pub fn MatrixIdentity() callconv(.C) Matrix {
    var result: Matrix = Matrix{
        .m0 = 1.0,
        .m4 = 0.0,
        .m8 = 0.0,
        .m12 = 0.0,
        .m1 = 0.0,
        .m5 = 1.0,
        .m9 = 0.0,
        .m13 = 0.0,
        .m2 = 0.0,
        .m6 = 0.0,
        .m10 = 1.0,
        .m14 = 0.0,
        .m3 = 0.0,
        .m7 = 0.0,
        .m11 = 0.0,
        .m15 = 1.0,
    };
    return result;
}
pub fn MatrixAdd(arg_left: Matrix, arg_right: Matrix) callconv(.C) Matrix {
    var left = arg_left;
    var right = arg_right;
    var result: Matrix = MatrixIdentity();
    result.m0 = left.m0 + right.m0;
    result.m1 = left.m1 + right.m1;
    result.m2 = left.m2 + right.m2;
    result.m3 = left.m3 + right.m3;
    result.m4 = left.m4 + right.m4;
    result.m5 = left.m5 + right.m5;
    result.m6 = left.m6 + right.m6;
    result.m7 = left.m7 + right.m7;
    result.m8 = left.m8 + right.m8;
    result.m9 = left.m9 + right.m9;
    result.m10 = left.m10 + right.m10;
    result.m11 = left.m11 + right.m11;
    result.m12 = left.m12 + right.m12;
    result.m13 = left.m13 + right.m13;
    result.m14 = left.m14 + right.m14;
    result.m15 = left.m15 + right.m15;
    return result;
}
pub fn MatrixSubtract(arg_left: Matrix, arg_right: Matrix) callconv(.C) Matrix {
    var left = arg_left;
    var right = arg_right;
    var result: Matrix = MatrixIdentity();
    result.m0 = left.m0 - right.m0;
    result.m1 = left.m1 - right.m1;
    result.m2 = left.m2 - right.m2;
    result.m3 = left.m3 - right.m3;
    result.m4 = left.m4 - right.m4;
    result.m5 = left.m5 - right.m5;
    result.m6 = left.m6 - right.m6;
    result.m7 = left.m7 - right.m7;
    result.m8 = left.m8 - right.m8;
    result.m9 = left.m9 - right.m9;
    result.m10 = left.m10 - right.m10;
    result.m11 = left.m11 - right.m11;
    result.m12 = left.m12 - right.m12;
    result.m13 = left.m13 - right.m13;
    result.m14 = left.m14 - right.m14;
    result.m15 = left.m15 - right.m15;
    return result;
}
pub fn MatrixMultiply(arg_left: Matrix, arg_right: Matrix) callconv(.C) Matrix {
    var left = arg_left;
    var right = arg_right;
    var result: Matrix = Matrix{
        .m0 = @intToFloat(f32, @as(c_int, 0)),
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    result.m0 = (((left.m0 * right.m0) + (left.m1 * right.m4)) + (left.m2 * right.m8)) + (left.m3 * right.m12);
    result.m1 = (((left.m0 * right.m1) + (left.m1 * right.m5)) + (left.m2 * right.m9)) + (left.m3 * right.m13);
    result.m2 = (((left.m0 * right.m2) + (left.m1 * right.m6)) + (left.m2 * right.m10)) + (left.m3 * right.m14);
    result.m3 = (((left.m0 * right.m3) + (left.m1 * right.m7)) + (left.m2 * right.m11)) + (left.m3 * right.m15);
    result.m4 = (((left.m4 * right.m0) + (left.m5 * right.m4)) + (left.m6 * right.m8)) + (left.m7 * right.m12);
    result.m5 = (((left.m4 * right.m1) + (left.m5 * right.m5)) + (left.m6 * right.m9)) + (left.m7 * right.m13);
    result.m6 = (((left.m4 * right.m2) + (left.m5 * right.m6)) + (left.m6 * right.m10)) + (left.m7 * right.m14);
    result.m7 = (((left.m4 * right.m3) + (left.m5 * right.m7)) + (left.m6 * right.m11)) + (left.m7 * right.m15);
    result.m8 = (((left.m8 * right.m0) + (left.m9 * right.m4)) + (left.m10 * right.m8)) + (left.m11 * right.m12);
    result.m9 = (((left.m8 * right.m1) + (left.m9 * right.m5)) + (left.m10 * right.m9)) + (left.m11 * right.m13);
    result.m10 = (((left.m8 * right.m2) + (left.m9 * right.m6)) + (left.m10 * right.m10)) + (left.m11 * right.m14);
    result.m11 = (((left.m8 * right.m3) + (left.m9 * right.m7)) + (left.m10 * right.m11)) + (left.m11 * right.m15);
    result.m12 = (((left.m12 * right.m0) + (left.m13 * right.m4)) + (left.m14 * right.m8)) + (left.m15 * right.m12);
    result.m13 = (((left.m12 * right.m1) + (left.m13 * right.m5)) + (left.m14 * right.m9)) + (left.m15 * right.m13);
    result.m14 = (((left.m12 * right.m2) + (left.m13 * right.m6)) + (left.m14 * right.m10)) + (left.m15 * right.m14);
    result.m15 = (((left.m12 * right.m3) + (left.m13 * right.m7)) + (left.m14 * right.m11)) + (left.m15 * right.m15);
    return result;
}
pub fn MatrixTranslate(arg_x: f32, arg_y: f32, arg_z: f32) callconv(.C) Matrix {
    var x = arg_x;
    var y = arg_y;
    var z = arg_z;
    var result: Matrix = Matrix{
        .m0 = 1.0,
        .m4 = 0.0,
        .m8 = 0.0,
        .m12 = x,
        .m1 = 0.0,
        .m5 = 1.0,
        .m9 = 0.0,
        .m13 = y,
        .m2 = 0.0,
        .m6 = 0.0,
        .m10 = 1.0,
        .m14 = z,
        .m3 = 0.0,
        .m7 = 0.0,
        .m11 = 0.0,
        .m15 = 1.0,
    };
    return result;
}
pub fn MatrixRotate(arg_axis: Vector3, arg_angle: f32) callconv(.C) Matrix {
    var axis = arg_axis;
    var angle = arg_angle;
    var result: Matrix = Matrix{
        .m0 = @intToFloat(f32, @as(c_int, 0)),
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    var x: f32 = axis.x;
    var y: f32 = axis.y;
    var z: f32 = axis.z;
    var lengthSquared: f32 = ((x * x) + (y * y)) + (z * z);
    if ((lengthSquared != 1.0) and (lengthSquared != 0.0)) {
        var inverseLength: f32 = 1.0 / sqrtf(lengthSquared);
        x *= inverseLength;
        y *= inverseLength;
        z *= inverseLength;
    }
    var sinres: f32 = sinf(angle);
    var cosres: f32 = cosf(angle);
    var t: f32 = 1.0 - cosres;
    result.m0 = ((x * x) * t) + cosres;
    result.m1 = ((y * x) * t) + (z * sinres);
    result.m2 = ((z * x) * t) - (y * sinres);
    result.m3 = 0.0;
    result.m4 = ((x * y) * t) - (z * sinres);
    result.m5 = ((y * y) * t) + cosres;
    result.m6 = ((z * y) * t) + (x * sinres);
    result.m7 = 0.0;
    result.m8 = ((x * z) * t) + (y * sinres);
    result.m9 = ((y * z) * t) - (x * sinres);
    result.m10 = ((z * z) * t) + cosres;
    result.m11 = 0.0;
    result.m12 = 0.0;
    result.m13 = 0.0;
    result.m14 = 0.0;
    result.m15 = 1.0;
    return result;
}
pub fn MatrixRotateX(arg_angle: f32) callconv(.C) Matrix {
    var angle = arg_angle;
    var result: Matrix = MatrixIdentity();
    var cosres: f32 = cosf(angle);
    var sinres: f32 = sinf(angle);
    result.m5 = cosres;
    result.m6 = -sinres;
    result.m9 = sinres;
    result.m10 = cosres;
    return result;
}
pub fn MatrixRotateY(arg_angle: f32) callconv(.C) Matrix {
    var angle = arg_angle;
    var result: Matrix = MatrixIdentity();
    var cosres: f32 = cosf(angle);
    var sinres: f32 = sinf(angle);
    result.m0 = cosres;
    result.m2 = sinres;
    result.m8 = -sinres;
    result.m10 = cosres;
    return result;
}
pub fn MatrixRotateZ(arg_angle: f32) callconv(.C) Matrix {
    var angle = arg_angle;
    var result: Matrix = MatrixIdentity();
    var cosres: f32 = cosf(angle);
    var sinres: f32 = sinf(angle);
    result.m0 = cosres;
    result.m1 = -sinres;
    result.m4 = sinres;
    result.m5 = cosres;
    return result;
}
pub fn MatrixRotateXYZ(arg_ang: Vector3) callconv(.C) Matrix {
    var ang = arg_ang;
    var result: Matrix = MatrixIdentity();
    var cosz: f32 = cosf(-ang.z);
    var sinz: f32 = sinf(-ang.z);
    var cosy: f32 = cosf(-ang.y);
    var siny: f32 = sinf(-ang.y);
    var cosx: f32 = cosf(-ang.x);
    var sinx: f32 = sinf(-ang.x);
    result.m0 = cosz * cosy;
    result.m4 = ((cosz * siny) * sinx) - (sinz * cosx);
    result.m8 = ((cosz * siny) * cosx) + (sinz * sinx);
    result.m1 = sinz * cosy;
    result.m5 = ((sinz * siny) * sinx) + (cosz * cosx);
    result.m9 = ((sinz * siny) * cosx) - (cosz * sinx);
    result.m2 = -siny;
    result.m6 = cosy * sinx;
    result.m10 = cosy * cosx;
    return result;
}
pub fn MatrixRotateZYX(arg_ang: Vector3) callconv(.C) Matrix {
    var ang = arg_ang;
    var result: Matrix = Matrix{
        .m0 = @intToFloat(f32, @as(c_int, 0)),
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    var cz: f32 = cosf(ang.z);
    var sz: f32 = sinf(ang.z);
    var cy: f32 = cosf(ang.y);
    var sy: f32 = sinf(ang.y);
    var cx: f32 = cosf(ang.x);
    var sx: f32 = sinf(ang.x);
    result.m0 = cz * cy;
    result.m1 = ((cz * sy) * sx) - (cx * sz);
    result.m2 = (sz * sx) + ((cz * cx) * sy);
    result.m3 = 0;
    result.m4 = cy * sz;
    result.m5 = (cz * cx) + ((sz * sy) * sx);
    result.m6 = ((cx * sz) * sy) - (cz * sx);
    result.m7 = 0;
    result.m8 = -sy;
    result.m9 = cy * sx;
    result.m10 = cy * cx;
    result.m11 = 0;
    result.m12 = 0;
    result.m13 = 0;
    result.m14 = 0;
    result.m15 = 1;
    return result;
}
pub fn MatrixScale(arg_x: f32, arg_y: f32, arg_z: f32) callconv(.C) Matrix {
    var x = arg_x;
    var y = arg_y;
    var z = arg_z;
    var result: Matrix = Matrix{
        .m0 = x,
        .m4 = 0.0,
        .m8 = 0.0,
        .m12 = 0.0,
        .m1 = 0.0,
        .m5 = y,
        .m9 = 0.0,
        .m13 = 0.0,
        .m2 = 0.0,
        .m6 = 0.0,
        .m10 = z,
        .m14 = 0.0,
        .m3 = 0.0,
        .m7 = 0.0,
        .m11 = 0.0,
        .m15 = 1.0,
    };
    return result;
}
pub fn MatrixFrustum(arg_left: f64, arg_right: f64, arg_bottom: f64, arg_top: f64, arg_near: f64, arg_far: f64) callconv(.C) Matrix {
    var left = arg_left;
    var right = arg_right;
    var bottom = arg_bottom;
    var top = arg_top;
    var near = arg_near;
    var far = arg_far;
    var result: Matrix = Matrix{
        .m0 = @intToFloat(f32, @as(c_int, 0)),
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    var rl: f32 = @floatCast(f32, right - left);
    var tb: f32 = @floatCast(f32, top - bottom);
    var @"fn": f32 = @floatCast(f32, far - near);
    result.m0 = (@floatCast(f32, near) * 2.0) / rl;
    result.m1 = 0.0;
    result.m2 = 0.0;
    result.m3 = 0.0;
    result.m4 = 0.0;
    result.m5 = (@floatCast(f32, near) * 2.0) / tb;
    result.m6 = 0.0;
    result.m7 = 0.0;
    result.m8 = (@floatCast(f32, right) + @floatCast(f32, left)) / rl;
    result.m9 = (@floatCast(f32, top) + @floatCast(f32, bottom)) / tb;
    result.m10 = -(@floatCast(f32, far) + @floatCast(f32, near)) / @"fn";
    result.m11 = -1.0;
    result.m12 = 0.0;
    result.m13 = 0.0;
    result.m14 = -((@floatCast(f32, far) * @floatCast(f32, near)) * 2.0) / @"fn";
    result.m15 = 0.0;
    return result;
}
pub fn MatrixPerspective(arg_fovy: f64, arg_aspect: f64, arg_near: f64, arg_far: f64) callconv(.C) Matrix {
    var fovy = arg_fovy;
    var aspect = arg_aspect;
    var near = arg_near;
    var far = arg_far;
    var top: f64 = near * tan(fovy * 0.5);
    var right: f64 = top * aspect;
    var result: Matrix = MatrixFrustum(-right, right, -top, top, near, far);
    return result;
}
pub fn MatrixOrtho(arg_left: f64, arg_right: f64, arg_bottom: f64, arg_top: f64, arg_near: f64, arg_far: f64) callconv(.C) Matrix {
    var left = arg_left;
    var right = arg_right;
    var bottom = arg_bottom;
    var top = arg_top;
    var near = arg_near;
    var far = arg_far;
    var result: Matrix = Matrix{
        .m0 = @intToFloat(f32, @as(c_int, 0)),
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    var rl: f32 = @floatCast(f32, right - left);
    var tb: f32 = @floatCast(f32, top - bottom);
    var @"fn": f32 = @floatCast(f32, far - near);
    result.m0 = 2.0 / rl;
    result.m1 = 0.0;
    result.m2 = 0.0;
    result.m3 = 0.0;
    result.m4 = 0.0;
    result.m5 = 2.0 / tb;
    result.m6 = 0.0;
    result.m7 = 0.0;
    result.m8 = 0.0;
    result.m9 = 0.0;
    result.m10 = -2.0 / @"fn";
    result.m11 = 0.0;
    result.m12 = -(@floatCast(f32, left) + @floatCast(f32, right)) / rl;
    result.m13 = -(@floatCast(f32, top) + @floatCast(f32, bottom)) / tb;
    result.m14 = -(@floatCast(f32, far) + @floatCast(f32, near)) / @"fn";
    result.m15 = 1.0;
    return result;
}
pub fn MatrixLookAt(arg_eye: Vector3, arg_target: Vector3, arg_up: Vector3) callconv(.C) Matrix {
    var eye = arg_eye;
    var target = arg_target;
    var up = arg_up;
    var result: Matrix = Matrix{
        .m0 = @intToFloat(f32, @as(c_int, 0)),
        .m4 = 0,
        .m8 = 0,
        .m12 = 0,
        .m1 = 0,
        .m5 = 0,
        .m9 = 0,
        .m13 = 0,
        .m2 = 0,
        .m6 = 0,
        .m10 = 0,
        .m14 = 0,
        .m3 = 0,
        .m7 = 0,
        .m11 = 0,
        .m15 = 0,
    };
    var z: Vector3 = Vector3Subtract(eye, target);
    z = Vector3Normalize(z);
    var x: Vector3 = Vector3CrossProduct(up, z);
    x = Vector3Normalize(x);
    var y: Vector3 = Vector3CrossProduct(z, x);
    result.m0 = x.x;
    result.m1 = y.x;
    result.m2 = z.x;
    result.m3 = 0.0;
    result.m4 = x.y;
    result.m5 = y.y;
    result.m6 = z.y;
    result.m7 = 0.0;
    result.m8 = x.z;
    result.m9 = y.z;
    result.m10 = z.z;
    result.m11 = 0.0;
    result.m12 = -Vector3DotProduct(x, eye);
    result.m13 = -Vector3DotProduct(y, eye);
    result.m14 = -Vector3DotProduct(z, eye);
    result.m15 = 1.0;
    return result;
}
pub fn MatrixToFloatV(arg_mat: Matrix) callconv(.C) float16 {
    var mat = arg_mat;
    var buffer: float16 = float16{
        .v = [1]f32{
            0,
        } ++ [1]f32{0} ** 15,
    };
    buffer.v[@intCast(c_uint, @as(c_int, 0))] = mat.m0;
    buffer.v[@intCast(c_uint, @as(c_int, 1))] = mat.m1;
    buffer.v[@intCast(c_uint, @as(c_int, 2))] = mat.m2;
    buffer.v[@intCast(c_uint, @as(c_int, 3))] = mat.m3;
    buffer.v[@intCast(c_uint, @as(c_int, 4))] = mat.m4;
    buffer.v[@intCast(c_uint, @as(c_int, 5))] = mat.m5;
    buffer.v[@intCast(c_uint, @as(c_int, 6))] = mat.m6;
    buffer.v[@intCast(c_uint, @as(c_int, 7))] = mat.m7;
    buffer.v[@intCast(c_uint, @as(c_int, 8))] = mat.m8;
    buffer.v[@intCast(c_uint, @as(c_int, 9))] = mat.m9;
    buffer.v[@intCast(c_uint, @as(c_int, 10))] = mat.m10;
    buffer.v[@intCast(c_uint, @as(c_int, 11))] = mat.m11;
    buffer.v[@intCast(c_uint, @as(c_int, 12))] = mat.m12;
    buffer.v[@intCast(c_uint, @as(c_int, 13))] = mat.m13;
    buffer.v[@intCast(c_uint, @as(c_int, 14))] = mat.m14;
    buffer.v[@intCast(c_uint, @as(c_int, 15))] = mat.m15;
    return buffer;
}
pub fn QuaternionAdd(arg_q1: Quaternion, arg_q2: Quaternion) callconv(.C) Quaternion {
    var q1 = arg_q1;
    var q2 = arg_q2;
    var result: Quaternion = Quaternion{
        .x = q1.x + q2.x,
        .y = q1.y + q2.y,
        .z = q1.z + q2.z,
        .w = q1.w + q2.w,
    };
    return result;
}
pub fn QuaternionAddValue(arg_q: Quaternion, arg_add: f32) callconv(.C) Quaternion {
    var q = arg_q;
    var add = arg_add;
    var result: Quaternion = Quaternion{
        .x = q.x + add,
        .y = q.y + add,
        .z = q.z + add,
        .w = q.w + add,
    };
    return result;
}
pub fn QuaternionSubtract(arg_q1: Quaternion, arg_q2: Quaternion) callconv(.C) Quaternion {
    var q1 = arg_q1;
    var q2 = arg_q2;
    var result: Quaternion = Quaternion{
        .x = q1.x - q2.x,
        .y = q1.y - q2.y,
        .z = q1.z - q2.z,
        .w = q1.w - q2.w,
    };
    return result;
}
pub fn QuaternionSubtractValue(arg_q: Quaternion, arg_sub: f32) callconv(.C) Quaternion {
    var q = arg_q;
    var sub = arg_sub;
    var result: Quaternion = Quaternion{
        .x = q.x - sub,
        .y = q.y - sub,
        .z = q.z - sub,
        .w = q.w - sub,
    };
    return result;
}
pub fn QuaternionIdentity() callconv(.C) Quaternion {
    var result: Quaternion = Quaternion{
        .x = 0.0,
        .y = 0.0,
        .z = 0.0,
        .w = 1.0,
    };
    return result;
}
pub fn QuaternionLength(arg_q: Quaternion) callconv(.C) f32 {
    var q = arg_q;
    var result: f32 = sqrtf((((q.x * q.x) + (q.y * q.y)) + (q.z * q.z)) + (q.w * q.w));
    return result;
}
pub fn QuaternionNormalize(arg_q: Quaternion) callconv(.C) Quaternion {
    var q = arg_q;
    var result: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    var length: f32 = undefined;
    var ilength: f32 = undefined;
    length = QuaternionLength(q);
    if (length == 0.0) {
        length = 1.0;
    }
    ilength = 1.0 / length;
    result.x = q.x * ilength;
    result.y = q.y * ilength;
    result.z = q.z * ilength;
    result.w = q.w * ilength;
    return result;
}
pub fn QuaternionInvert(arg_q: Quaternion) callconv(.C) Quaternion {
    var q = arg_q;
    var result: Quaternion = q;
    var length: f32 = QuaternionLength(q);
    var lengthSq: f32 = length * length;
    if (@floatCast(f64, lengthSq) != 0.0) {
        var i: f32 = 1.0 / lengthSq;
        result.x *= -i;
        result.y *= -i;
        result.z *= -i;
        result.w *= i;
    }
    return result;
}
pub fn QuaternionMultiply(arg_q1: Quaternion, arg_q2: Quaternion) callconv(.C) Quaternion {
    var q1 = arg_q1;
    var q2 = arg_q2;
    var result: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    var qax: f32 = q1.x;
    var qay: f32 = q1.y;
    var qaz: f32 = q1.z;
    var qaw: f32 = q1.w;
    var qbx: f32 = q2.x;
    var qby: f32 = q2.y;
    var qbz: f32 = q2.z;
    var qbw: f32 = q2.w;
    result.x = (((qax * qbw) + (qaw * qbx)) + (qay * qbz)) - (qaz * qby);
    result.y = (((qay * qbw) + (qaw * qby)) + (qaz * qbx)) - (qax * qbz);
    result.z = (((qaz * qbw) + (qaw * qbz)) + (qax * qby)) - (qay * qbx);
    result.w = (((qaw * qbw) - (qax * qbx)) - (qay * qby)) - (qaz * qbz);
    return result;
}
pub fn QuaternionScale(arg_q: Quaternion, arg_mul: f32) callconv(.C) Quaternion {
    var q = arg_q;
    var mul = arg_mul;
    var result: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    var qax: f32 = q.x;
    var qay: f32 = q.y;
    var qaz: f32 = q.z;
    var qaw: f32 = q.w;
    result.x = (((qax * mul) + (qaw * mul)) + (qay * mul)) - (qaz * mul);
    result.y = (((qay * mul) + (qaw * mul)) + (qaz * mul)) - (qax * mul);
    result.z = (((qaz * mul) + (qaw * mul)) + (qax * mul)) - (qay * mul);
    result.w = (((qaw * mul) - (qax * mul)) - (qay * mul)) - (qaz * mul);
    return result;
}
pub fn QuaternionDivide(arg_q1: Quaternion, arg_q2: Quaternion) callconv(.C) Quaternion {
    var q1 = arg_q1;
    var q2 = arg_q2;
    var result: Quaternion = Quaternion{
        .x = q1.x / q2.x,
        .y = q1.y / q2.y,
        .z = q1.z / q2.z,
        .w = q1.w / q2.w,
    };
    return result;
}
pub fn QuaternionLerp(arg_q1: Quaternion, arg_q2: Quaternion, arg_amount: f32) callconv(.C) Quaternion {
    var q1 = arg_q1;
    var q2 = arg_q2;
    var amount = arg_amount;
    var result: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    result.x = q1.x + (amount * (q2.x - q1.x));
    result.y = q1.y + (amount * (q2.y - q1.y));
    result.z = q1.z + (amount * (q2.z - q1.z));
    result.w = q1.w + (amount * (q2.w - q1.w));
    return result;
}
pub fn QuaternionNlerp(arg_q1: Quaternion, arg_q2: Quaternion, arg_amount: f32) callconv(.C) Quaternion {
    var q1 = arg_q1;
    var q2 = arg_q2;
    var amount = arg_amount;
    var result: Quaternion = QuaternionLerp(q1, q2, amount);
    result = QuaternionNormalize(result);
    return result;
}
pub fn QuaternionSlerp(arg_q1: Quaternion, arg_q2: Quaternion, arg_amount: f32) callconv(.C) Quaternion {
    var q1 = arg_q1;
    var q2 = arg_q2;
    var amount = arg_amount;
    var result: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    var cosHalfTheta: f32 = (((q1.x * q2.x) + (q1.y * q2.y)) + (q1.z * q2.z)) + (q1.w * q2.w);
    if (cosHalfTheta < @intToFloat(f32, @as(c_int, 0))) {
        q2.x = -q2.x;
        q2.y = -q2.y;
        q2.z = -q2.z;
        q2.w = -q2.w;
        cosHalfTheta = -cosHalfTheta;
    }
    if (fabs(@floatCast(f64, cosHalfTheta)) >= @floatCast(f64, 1.0)) {
        result = q1;
    } else if (cosHalfTheta > 0.949999988079071) {
        result = QuaternionNlerp(q1, q2, amount);
    } else {
        var halfTheta: f32 = acosf(cosHalfTheta);
        var sinHalfTheta: f32 = sqrtf(1.0 - (cosHalfTheta * cosHalfTheta));
        if (fabs(@floatCast(f64, sinHalfTheta)) < @floatCast(f64, 0.0010000000474974513)) {
            result.x = (q1.x * 0.5) + (q2.x * 0.5);
            result.y = (q1.y * 0.5) + (q2.y * 0.5);
            result.z = (q1.z * 0.5) + (q2.z * 0.5);
            result.w = (q1.w * 0.5) + (q2.w * 0.5);
        } else {
            var ratioA: f32 = sinf((@intToFloat(f32, @as(c_int, 1)) - amount) * halfTheta) / sinHalfTheta;
            var ratioB: f32 = sinf(amount * halfTheta) / sinHalfTheta;
            result.x = (q1.x * ratioA) + (q2.x * ratioB);
            result.y = (q1.y * ratioA) + (q2.y * ratioB);
            result.z = (q1.z * ratioA) + (q2.z * ratioB);
            result.w = (q1.w * ratioA) + (q2.w * ratioB);
        }
    }
    return result;
}
pub fn QuaternionFromVector3ToVector3(arg_from: Vector3, arg_to: Vector3) callconv(.C) Quaternion {
    var from = arg_from;
    var to = arg_to;
    var result: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    var cos2Theta: f32 = Vector3DotProduct(from, to);
    var cross: Vector3 = Vector3CrossProduct(from, to);
    result.x = cross.x;
    result.y = cross.y;
    result.z = cross.z;
    result.w = 1.0 + cos2Theta;
    result = QuaternionNormalize(result);
    return result;
}
pub fn QuaternionFromMatrix(arg_mat: Matrix) callconv(.C) Quaternion {
    var mat = arg_mat;
    var result: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    if ((mat.m0 > mat.m5) and (mat.m0 > mat.m10)) {
        var s: f32 = sqrtf(((1.0 + mat.m0) - mat.m5) - mat.m10) * @intToFloat(f32, @as(c_int, 2));
        result.x = 0.25 * s;
        result.y = (mat.m4 + mat.m1) / s;
        result.z = (mat.m2 + mat.m8) / s;
        result.w = (mat.m9 - mat.m6) / s;
    } else if (mat.m5 > mat.m10) {
        var s: f32 = sqrtf(((1.0 + mat.m5) - mat.m0) - mat.m10) * @intToFloat(f32, @as(c_int, 2));
        result.x = (mat.m4 + mat.m1) / s;
        result.y = 0.25 * s;
        result.z = (mat.m9 + mat.m6) / s;
        result.w = (mat.m2 - mat.m8) / s;
    } else {
        var s: f32 = sqrtf(((1.0 + mat.m10) - mat.m0) - mat.m5) * @intToFloat(f32, @as(c_int, 2));
        result.x = (mat.m2 + mat.m8) / s;
        result.y = (mat.m9 + mat.m6) / s;
        result.z = 0.25 * s;
        result.w = (mat.m4 - mat.m1) / s;
    }
    return result;
}
pub fn QuaternionToMatrix(arg_q: Quaternion) callconv(.C) Matrix {
    var q = arg_q;
    var result: Matrix = MatrixIdentity();
    var a2: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.x * q.x);
    var b2: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.y * q.y);
    var c2: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.z * q.z);
    var ab: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.x * q.y);
    var ac: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.x * q.z);
    var bc: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.y * q.z);
    var ad: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.x * q.w);
    var bd: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.y * q.w);
    var cd: f32 = @intToFloat(f32, @as(c_int, 2)) * (q.z * q.w);
    result.m0 = (@intToFloat(f32, @as(c_int, 1)) - b2) - c2;
    result.m1 = ab - cd;
    result.m2 = ac + bd;
    result.m4 = ab + cd;
    result.m5 = (@intToFloat(f32, @as(c_int, 1)) - a2) - c2;
    result.m6 = bc - ad;
    result.m8 = ac - bd;
    result.m9 = bc + ad;
    result.m10 = (@intToFloat(f32, @as(c_int, 1)) - a2) - b2;
    return result;
}
pub fn QuaternionFromAxisAngle(arg_axis: Vector3, arg_angle: f32) callconv(.C) Quaternion {
    var axis = arg_axis;
    var angle = arg_angle;
    var result: Quaternion = Quaternion{
        .x = 0.0,
        .y = 0.0,
        .z = 0.0,
        .w = 1.0,
    };
    if (Vector3Length(axis) != 0.0) {
        angle *= 0.5;
    }
    axis = Vector3Normalize(axis);
    var sinres: f32 = sinf(angle);
    var cosres: f32 = cosf(angle);
    result.x = axis.x * sinres;
    result.y = axis.y * sinres;
    result.z = axis.z * sinres;
    result.w = cosres;
    result = QuaternionNormalize(result);
    return result;
}
pub fn QuaternionToAxisAngle(arg_q: Quaternion, arg_outAxis: [*c]Vector3, arg_outAngle: [*c]f32) callconv(.C) void {
    var q = arg_q;
    var outAxis = arg_outAxis;
    var outAngle = arg_outAngle;
    if (fabs(@floatCast(f64, q.w)) > @floatCast(f64, 1.0)) {
        q = QuaternionNormalize(q);
    }
    var resAxis: Vector3 = Vector3{
        .x = 0.0,
        .y = 0.0,
        .z = 0.0,
    };
    var resAngle: f32 = 2.0 * acosf(q.w);
    var den: f32 = sqrtf(1.0 - (q.w * q.w));
    if (den > 0.00009999999747378752) {
        resAxis.x = q.x / den;
        resAxis.y = q.y / den;
        resAxis.z = q.z / den;
    } else {
        resAxis.x = 1.0;
    }
    outAxis.?.* = resAxis;
    outAngle.?.* = resAngle;
}
pub fn QuaternionFromEuler(arg_pitch: f32, arg_yaw: f32, arg_roll: f32) callconv(.C) Quaternion {
    var pitch = arg_pitch;
    var yaw = arg_yaw;
    var roll = arg_roll;
    var q: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    var x0: f32 = cosf(pitch * 0.5);
    var x1: f32 = sinf(pitch * 0.5);
    var y0_1: f32 = cosf(yaw * 0.5);
    var y1_2: f32 = sinf(yaw * 0.5);
    var z0: f32 = cosf(roll * 0.5);
    var z1: f32 = sinf(roll * 0.5);
    q.x = ((x1 * y0_1) * z0) - ((x0 * y1_2) * z1);
    q.y = ((x0 * y1_2) * z0) + ((x1 * y0_1) * z1);
    q.z = ((x0 * y0_1) * z1) - ((x1 * y1_2) * z0);
    q.w = ((x0 * y0_1) * z0) + ((x1 * y1_2) * z1);
    return q;
}
pub fn QuaternionToEuler(arg_q: Quaternion) callconv(.C) Vector3 {
    var q = arg_q;
    var result: Vector3 = Vector3{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
    };
    var x0: f32 = 2.0 * ((q.w * q.x) + (q.y * q.z));
    var x1: f32 = 1.0 - (2.0 * ((q.x * q.x) + (q.y * q.y)));
    result.x = atan2f(x0, x1) * (180.0 / 3.1415927410125732);
    var y0_1: f32 = 2.0 * ((q.w * q.y) - (q.z * q.x));
    y0_1 = if (y0_1 > 1.0) 1.0 else y0_1;
    y0_1 = if (y0_1 < -1.0) -1.0 else y0_1;
    result.y = asinf(y0_1) * (180.0 / 3.1415927410125732);
    var z0: f32 = 2.0 * ((q.w * q.z) + (q.x * q.y));
    var z1: f32 = 1.0 - (2.0 * ((q.y * q.y) + (q.z * q.z)));
    result.z = atan2f(z0, z1) * (180.0 / 3.1415927410125732);
    return result;
}
pub fn QuaternionTransform(arg_q: Quaternion, arg_mat: Matrix) callconv(.C) Quaternion {
    var q = arg_q;
    var mat = arg_mat;
    var result: Quaternion = Quaternion{
        .x = @intToFloat(f32, @as(c_int, 0)),
        .y = 0,
        .z = 0,
        .w = 0,
    };
    result.x = (((mat.m0 * q.x) + (mat.m4 * q.y)) + (mat.m8 * q.z)) + (mat.m12 * q.w);
    result.y = (((mat.m1 * q.x) + (mat.m5 * q.y)) + (mat.m9 * q.z)) + (mat.m13 * q.w);
    result.z = (((mat.m2 * q.x) + (mat.m6 * q.y)) + (mat.m10 * q.z)) + (mat.m14 * q.w);
    result.w = (((mat.m3 * q.x) + (mat.m7 * q.y)) + (mat.m11 * q.z)) + (mat.m15 * q.w);
    return result;
}
pub fn Vector3Unproject(arg_source: Vector3, arg_projection: Matrix, arg_view: Matrix) callconv(.C) Vector3 {
    var source = arg_source;
    var projection = arg_projection;
    var view = arg_view;
    var result: Vector3 = Vector3{
        .x = 0.0,
        .y = 0.0,
        .z = 0.0,
    };
    var matViewProj: Matrix = MatrixMultiply(view, projection);
    matViewProj = MatrixInvert(matViewProj);
    var quat: Quaternion = Quaternion{
        .x = source.x,
        .y = source.y,
        .z = source.z,
        .w = 1.0,
    };
    quat = QuaternionTransform(quat, matViewProj);
    result.x = quat.x / quat.w;
    result.y = quat.y / quat.w;
    result.z = quat.z / quat.w;
    return result;
}
pub const GlVersion = extern enum(c_int) {
    OPENGL_11 = 1,
    OPENGL_21 = 2,
    OPENGL_33 = 3,
    OPENGL_ES_20 = 4,
    _,
};
pub const OPENGL_11 = @enumToInt(GlVersion.OPENGL_11);
pub const OPENGL_21 = @enumToInt(GlVersion.OPENGL_21);
pub const OPENGL_33 = @enumToInt(GlVersion.OPENGL_33);
pub const OPENGL_ES_20 = @enumToInt(GlVersion.OPENGL_ES_20);
pub const FramebufferAttachType = extern enum(c_int) {
    RL_ATTACHMENT_COLOR_CHANNEL0 = 0,
    RL_ATTACHMENT_COLOR_CHANNEL1 = 1,
    RL_ATTACHMENT_COLOR_CHANNEL2 = 2,
    RL_ATTACHMENT_COLOR_CHANNEL3 = 3,
    RL_ATTACHMENT_COLOR_CHANNEL4 = 4,
    RL_ATTACHMENT_COLOR_CHANNEL5 = 5,
    RL_ATTACHMENT_COLOR_CHANNEL6 = 6,
    RL_ATTACHMENT_COLOR_CHANNEL7 = 7,
    RL_ATTACHMENT_DEPTH = 100,
    RL_ATTACHMENT_STENCIL = 200,
    _,
};
pub const RL_ATTACHMENT_COLOR_CHANNEL0 = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL0);
pub const RL_ATTACHMENT_COLOR_CHANNEL1 = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL1);
pub const RL_ATTACHMENT_COLOR_CHANNEL2 = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL2);
pub const RL_ATTACHMENT_COLOR_CHANNEL3 = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL3);
pub const RL_ATTACHMENT_COLOR_CHANNEL4 = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL4);
pub const RL_ATTACHMENT_COLOR_CHANNEL5 = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL5);
pub const RL_ATTACHMENT_COLOR_CHANNEL6 = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL6);
pub const RL_ATTACHMENT_COLOR_CHANNEL7 = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_COLOR_CHANNEL7);
pub const RL_ATTACHMENT_DEPTH = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_DEPTH);
pub const RL_ATTACHMENT_STENCIL = @enumToInt(FramebufferAttachType.RL_ATTACHMENT_STENCIL);
pub const FramebufferAttachTextureType = extern enum(c_int) {
    RL_ATTACHMENT_CUBEMAP_POSITIVE_X = 0,
    RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = 1,
    RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = 2,
    RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = 3,
    RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = 4,
    RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = 5,
    RL_ATTACHMENT_TEXTURE2D = 100,
    RL_ATTACHMENT_RENDERBUFFER = 200,
    _,
};
pub const RL_ATTACHMENT_CUBEMAP_POSITIVE_X = @enumToInt(FramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_X);
pub const RL_ATTACHMENT_CUBEMAP_NEGATIVE_X = @enumToInt(FramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_NEGATIVE_X);
pub const RL_ATTACHMENT_CUBEMAP_POSITIVE_Y = @enumToInt(FramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_Y);
pub const RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y = @enumToInt(FramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y);
pub const RL_ATTACHMENT_CUBEMAP_POSITIVE_Z = @enumToInt(FramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_POSITIVE_Z);
pub const RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z = @enumToInt(FramebufferAttachTextureType.RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z);
pub const RL_ATTACHMENT_TEXTURE2D = @enumToInt(FramebufferAttachTextureType.RL_ATTACHMENT_TEXTURE2D);
pub const RL_ATTACHMENT_RENDERBUFFER = @enumToInt(FramebufferAttachTextureType.RL_ATTACHMENT_RENDERBUFFER);
pub const struct_VertexBuffer = extern struct {
    elementsCount: c_int,
    vCounter: c_int,
    tcCounter: c_int,
    cCounter: c_int,
    vertices: [*c]f32,
    texcoords: [*c]f32,
    colors: [*c]u8,
    indices: [*c]c_uint,
    vaoId: c_uint,
    vboId: [4]c_uint,
};
pub const VertexBuffer = struct_VertexBuffer;
pub const struct_DrawCall = extern struct {
    mode: c_int,
    vertexCount: c_int,
    vertexAlignment: c_int,
    textureId: c_uint,
};
pub const DrawCall = struct_DrawCall;
pub const struct_RenderBatch = extern struct {
    buffersCount: c_int,
    currentBuffer: c_int,
    vertexBuffer: [*c]VertexBuffer,
    draws: [*c]DrawCall,
    drawsCounter: c_int,
    currentDepth: f32,
};
pub const RenderBatch = struct_RenderBatch;
pub const ShaderAttributeDataType = extern enum(c_int) {
    SHADER_ATTRIB_FLOAT = 0,
    SHADER_ATTRIB_VEC2 = 1,
    SHADER_ATTRIB_VEC3 = 2,
    SHADER_ATTRIB_VEC4 = 3,
    _,
};
pub const SHADER_ATTRIB_FLOAT = @enumToInt(ShaderAttributeDataType.SHADER_ATTRIB_FLOAT);
pub const SHADER_ATTRIB_VEC2 = @enumToInt(ShaderAttributeDataType.SHADER_ATTRIB_VEC2);
pub const SHADER_ATTRIB_VEC3 = @enumToInt(ShaderAttributeDataType.SHADER_ATTRIB_VEC3);
pub const SHADER_ATTRIB_VEC4 = @enumToInt(ShaderAttributeDataType.SHADER_ATTRIB_VEC4);
pub extern fn rlMatrixMode(mode: c_int) void;
pub extern fn rlPushMatrix() void;
pub extern fn rlPopMatrix() void;
pub extern fn rlLoadIdentity() void;
pub extern fn rlTranslatef(x: f32, y: f32, z: f32) void;
pub extern fn rlRotatef(angleDeg: f32, x: f32, y: f32, z: f32) void;
pub extern fn rlScalef(x: f32, y: f32, z: f32) void;
pub extern fn rlMultMatrixf(matf: [*c]f32) void;
pub extern fn rlFrustum(left: f64, right: f64, bottom: f64, top: f64, znear: f64, zfar: f64) void;
pub extern fn rlOrtho(left: f64, right: f64, bottom: f64, top: f64, znear: f64, zfar: f64) void;
pub extern fn rlViewport(x: c_int, y: c_int, width: c_int, height: c_int) void;
pub extern fn rlBegin(mode: c_int) void;
pub extern fn rlEnd() void;
pub extern fn rlVertex2i(x: c_int, y: c_int) void;
pub extern fn rlVertex2f(x: f32, y: f32) void;
pub extern fn rlVertex3f(x: f32, y: f32, z: f32) void;
pub extern fn rlTexCoord2f(x: f32, y: f32) void;
pub extern fn rlNormal3f(x: f32, y: f32, z: f32) void;
pub extern fn rlColor4ub(r: u8, g: u8, b: u8, a: u8) void;
pub extern fn rlColor3f(x: f32, y: f32, z: f32) void;
pub extern fn rlColor4f(x: f32, y: f32, z: f32, w: f32) void;
pub extern fn rlEnableVertexArray(vaoId: c_uint) bool;
pub extern fn rlDisableVertexArray() void;
pub extern fn rlEnableVertexBuffer(id: c_uint) void;
pub extern fn rlDisableVertexBuffer() void;
pub extern fn rlEnableVertexBufferElement(id: c_uint) void;
pub extern fn rlDisableVertexBufferElement() void;
pub extern fn rlEnableVertexAttribute(index: c_uint) void;
pub extern fn rlDisableVertexAttribute(index: c_uint) void;
pub extern fn rlActiveTextureSlot(slot: c_int) void;
pub extern fn rlEnableTexture(id: c_uint) void;
pub extern fn rlDisableTexture() void;
pub extern fn rlEnableTextureCubemap(id: c_uint) void;
pub extern fn rlDisableTextureCubemap() void;
pub extern fn rlTextureParameters(id: c_uint, param: c_int, value: c_int) void;
pub extern fn rlEnableShader(id: c_uint) void;
pub extern fn rlDisableShader() void;
pub extern fn rlEnableFramebuffer(id: c_uint) void;
pub extern fn rlDisableFramebuffer() void;
pub extern fn rlEnableDepthTest() void;
pub extern fn rlDisableDepthTest() void;
pub extern fn rlEnableDepthMask() void;
pub extern fn rlDisableDepthMask() void;
pub extern fn rlEnableBackfaceCulling() void;
pub extern fn rlDisableBackfaceCulling() void;
pub extern fn rlEnableScissorTest() void;
pub extern fn rlDisableScissorTest() void;
pub extern fn rlScissor(x: c_int, y: c_int, width: c_int, height: c_int) void;
pub extern fn rlEnableWireMode() void;
pub extern fn rlDisableWireMode() void;
pub extern fn rlSetLineWidth(width: f32) void;
pub extern fn rlGetLineWidth() f32;
pub extern fn rlEnableSmoothLines() void;
pub extern fn rlDisableSmoothLines() void;
pub extern fn rlEnableStereoRender() void;
pub extern fn rlDisableStereoRender() void;
pub extern fn rlIsStereoRenderEnabled() bool;
pub extern fn rlClearColor(r: u8, g: u8, b: u8, a: u8) void;
pub extern fn rlClearScreenBuffers() void;
pub extern fn rlCheckErrors() void;
pub extern fn rlSetBlendMode(mode: c_int) void;
pub extern fn rlSetBlendFactors(glSrcFactor: c_int, glDstFactor: c_int, glEquation: c_int) void;
pub extern fn rlglInit(width: c_int, height: c_int) void;
pub extern fn rlglClose() void;
pub extern fn rlLoadExtensions(loader: ?*c_void) void;
pub extern fn rlGetVersion() c_int;
pub extern fn rlGetFramebufferWidth() c_int;
pub extern fn rlGetFramebufferHeight() c_int;
pub extern fn rlGetShaderDefault() Shader;
pub extern fn rlGetTextureDefault() Texture2D;
pub extern fn rlLoadRenderBatch(numBuffers: c_int, bufferElements: c_int) RenderBatch;
pub extern fn rlUnloadRenderBatch(batch: RenderBatch) void;
pub extern fn rlDrawRenderBatch(batch: [*c]RenderBatch) void;
pub extern fn rlSetRenderBatchActive(batch: [*c]RenderBatch) void;
pub extern fn rlDrawRenderBatchActive() void;
pub extern fn rlCheckRenderBatchLimit(vCount: c_int) bool;
pub extern fn rlSetTexture(id: c_uint) void;
pub extern fn rlLoadVertexArray() c_uint;
pub extern fn rlLoadVertexBuffer(buffer: ?*c_void, size: c_int, dynamic: bool) c_uint;
pub extern fn rlLoadVertexBufferElement(buffer: ?*c_void, size: c_int, dynamic: bool) c_uint;
pub extern fn rlUpdateVertexBuffer(bufferId: c_int, data: ?*c_void, dataSize: c_int, offset: c_int) void;
pub extern fn rlUnloadVertexArray(vaoId: c_uint) void;
pub extern fn rlUnloadVertexBuffer(vboId: c_uint) void;
pub extern fn rlSetVertexAttribute(index: c_uint, compSize: c_int, type: c_int, normalized: bool, stride: c_int, pointer: ?*c_void) void;
pub extern fn rlSetVertexAttributeDivisor(index: c_uint, divisor: c_int) void;
pub extern fn rlSetVertexAttributeDefault(locIndex: c_int, value: ?*const c_void, attribType: c_int, count: c_int) void;
pub extern fn rlDrawVertexArray(offset: c_int, count: c_int) void;
pub extern fn rlDrawVertexArrayElements(offset: c_int, count: c_int, buffer: ?*c_void) void;
pub extern fn rlDrawVertexArrayInstanced(offset: c_int, count: c_int, instances: c_int) void;
pub extern fn rlDrawVertexArrayElementsInstanced(offset: c_int, count: c_int, buffer: ?*c_void, instances: c_int) void;
pub extern fn rlLoadTexture(data: ?*c_void, width: c_int, height: c_int, format: c_int, mipmapCount: c_int) c_uint;
pub extern fn rlLoadTextureDepth(width: c_int, height: c_int, useRenderBuffer: bool) c_uint;
pub extern fn rlLoadTextureCubemap(data: ?*c_void, size: c_int, format: c_int) c_uint;
pub extern fn rlUpdateTexture(id: c_uint, offsetX: c_int, offsetY: c_int, width: c_int, height: c_int, format: c_int, data: ?*const c_void) void;
pub extern fn rlGetGlTextureFormats(format: c_int, glInternalFormat: [*c]c_uint, glFormat: [*c]c_uint, glType: [*c]c_uint) void;
pub extern fn rlUnloadTexture(id: c_uint) void;
pub extern fn rlGenerateMipmaps(texture: [*c]Texture2D) void;
pub extern fn rlReadTexturePixels(texture: Texture2D) ?*c_void;
pub extern fn rlReadScreenPixels(width: c_int, height: c_int) [*c]u8;
pub extern fn rlLoadFramebuffer(width: c_int, height: c_int) c_uint;
pub extern fn rlFramebufferAttach(fboId: c_uint, texId: c_uint, attachType: c_int, texType: c_int, mipLevel: c_int) void;
pub extern fn rlFramebufferComplete(id: c_uint) bool;
pub extern fn rlUnloadFramebuffer(id: c_uint) void;
pub extern fn rlLoadShaderCode(vsCode: [*c]const u8, fsCode: [*c]const u8) c_uint;
pub extern fn rlCompileShader(shaderCode: [*c]const u8, type: c_int) c_uint;
pub extern fn rlLoadShaderProgram(vShaderId: c_uint, fShaderId: c_uint) c_uint;
pub extern fn rlUnloadShaderProgram(id: c_uint) void;
pub extern fn rlGetLocationUniform(shaderId: c_uint, uniformName: [*c]const u8) c_int;
pub extern fn rlGetLocationAttrib(shaderId: c_uint, attribName: [*c]const u8) c_int;
pub extern fn rlSetUniform(locIndex: c_int, value: ?*const c_void, uniformType: c_int, count: c_int) void;
pub extern fn rlSetUniformMatrix(locIndex: c_int, mat: Matrix) void;
pub extern fn rlSetUniformSampler(locIndex: c_int, textureId: c_uint) void;
pub extern fn rlSetShader(shader: Shader) void;
pub extern fn rlGetMatrixModelview() Matrix;
pub extern fn rlGetMatrixProjection() Matrix;
pub extern fn rlGetMatrixTransform() Matrix;
pub extern fn rlGetMatrixProjectionStereo(eye: c_int) Matrix;
pub extern fn rlGetMatrixViewOffsetStereo(eye: c_int) Matrix;
pub extern fn rlSetMatrixProjection(proj: Matrix) void;
pub extern fn rlSetMatrixModelview(view: Matrix) void;
pub extern fn rlSetMatrixProjectionStereo(right: Matrix, left: Matrix) void;
pub extern fn rlSetMatrixViewOffsetStereo(right: Matrix, left: Matrix) void;
pub extern fn rlLoadDrawCube() void;
pub extern fn rlLoadDrawQuad() void;
pub fn EaseLinearNone(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return ((c * t) / d) + b;
}
pub fn EaseLinearIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return ((c * t) / d) + b;
}
pub fn EaseLinearOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return ((c * t) / d) + b;
}
pub fn EaseLinearInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return ((c * t) / d) + b;
}
pub fn EaseSineIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return ((-c * cosf((t / d) * (3.1415927410125732 / 2.0))) + c) + b;
}
pub fn EaseSineOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return (c * sinf((t / d) * (3.1415927410125732 / 2.0))) + b;
}
pub fn EaseSineInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return ((-c / 2.0) * (cosf((3.1415927410125732 * t) / d) - 1.0)) + b;
}
pub fn EaseCircIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    t /= d;
    return (-c * (sqrtf(1.0 - (t * t)) - 1.0)) + b;
}
pub fn EaseCircOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    t = (t / d) - 1.0;
    return (c * sqrtf(1.0 - (t * t))) + b;
}
pub fn EaseCircInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if ((blk: {
        const ref = &t;
        ref.* /= d / 2.0;
        break :blk ref.*;
    }) < 1.0) return ((-c / 2.0) * (sqrtf(1.0 - (t * t)) - 1.0)) + b;
    t -= 2.0;
    return ((c / 2.0) * (sqrtf(1.0 - (t * t)) + 1.0)) + b;
}
pub fn EaseCubicIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    t /= d;
    return (((c * t) * t) * t) + b;
}
pub fn EaseCubicOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    t = (t / d) - 1.0;
    return (c * (((t * t) * t) + 1.0)) + b;
}
pub fn EaseCubicInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if ((blk: {
        const ref = &t;
        ref.* /= d / 2.0;
        break :blk ref.*;
    }) < 1.0) return ((((c / 2.0) * t) * t) * t) + b;
    t -= 2.0;
    return ((c / 2.0) * (((t * t) * t) + 2.0)) + b;
}
pub fn EaseQuadIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    t /= d;
    return ((c * t) * t) + b;
}
pub fn EaseQuadOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    t /= d;
    return ((-c * t) * (t - 2.0)) + b;
}
pub fn EaseQuadInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if ((blk: {
        const ref = &t;
        ref.* /= d / @intToFloat(f32, @as(c_int, 2));
        break :blk ref.*;
    }) < @intToFloat(f32, @as(c_int, 1))) return ((c / @intToFloat(f32, @as(c_int, 2))) * (t * t)) + b;
    return ((-c / 2.0) * (((t - 1.0) * (t - 3.0)) - 1.0)) + b;
}
pub fn EaseExpoIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return if (t == 0.0) b else (c * powf(2.0, 10.0 * ((t / d) - 1.0))) + b;
}
pub fn EaseExpoOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return if (t == d) b + c else (c * (-powf(2.0, (-10.0 * t) / d) + 1.0)) + b;
}
pub fn EaseExpoInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if (t == 0.0) return b;
    if (t == d) return b + c;
    if ((blk: {
        const ref = &t;
        ref.* /= d / 2.0;
        break :blk ref.*;
    }) < 1.0) return ((c / 2.0) * powf(2.0, 10.0 * (t - 1.0))) + b;
    return ((c / 2.0) * (-powf(2.0, -10.0 * (t - 1.0)) + 2.0)) + b;
}
pub fn EaseBackIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    var s: f32 = 1.7015800476074219;
    var postFix: f32 = blk: {
        const ref = &t;
        ref.* /= d;
        break :blk ref.*;
    };
    return (((c * postFix) * t) * (((s + 1.0) * t) - s)) + b;
}
pub fn EaseBackOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    var s: f32 = 1.7015800476074219;
    t = (t / d) - 1.0;
    return (c * (((t * t) * (((s + 1.0) * t) + s)) + 1.0)) + b;
}
pub fn EaseBackInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    var s: f32 = 1.7015800476074219;
    if ((blk: {
        const ref = &t;
        ref.* /= d / 2.0;
        break :blk ref.*;
    }) < 1.0) {
        s *= 1.524999976158142;
        return ((c / 2.0) * ((t * t) * (((s + 1.0) * t) - s))) + b;
    }
    var postFix: f32 = blk: {
        const ref = &t;
        ref.* -= 2.0;
        break :blk ref.*;
    };
    s *= 1.524999976158142;
    return ((c / 2.0) * (((postFix * t) * (((s + 1.0) * t) + s)) + 2.0)) + b;
}
pub fn EaseBounceOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if ((blk: {
        const ref = &t;
        ref.* /= d;
        break :blk ref.*;
    }) < (1.0 / 2.75)) {
        return (c * ((7.5625 * t) * t)) + b;
    } else if (t < (2.0 / 2.75)) {
        var postFix: f32 = blk: {
            const ref = &t;
            ref.* -= 1.5 / 2.75;
            break :blk ref.*;
        };
        return (c * (((7.5625 * postFix) * t) + 0.75)) + b;
    } else if (@floatCast(f64, t) < (2.5 / 2.75)) {
        var postFix: f32 = blk: {
            const ref = &t;
            ref.* -= 2.25 / 2.75;
            break :blk ref.*;
        };
        return (c * (((7.5625 * postFix) * t) + 0.9375)) + b;
    } else {
        var postFix: f32 = blk: {
            const ref = &t;
            ref.* -= 2.625 / 2.75;
            break :blk ref.*;
        };
        return (c * (((7.5625 * postFix) * t) + 0.984375)) + b;
    }
    return 0;
}
pub fn EaseBounceIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    return (c - EaseBounceOut(d - t, 0.0, c, d)) + b;
}
pub fn EaseBounceInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if (t < (d / 2.0)) return (EaseBounceIn(t * 2.0, 0.0, c, d) * 0.5) + b else return ((EaseBounceOut((t * 2.0) - d, 0.0, c, d) * 0.5) + (c * 0.5)) + b;
    return 0;
}
pub fn EaseElasticIn(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if (t == 0.0) return b;
    if ((blk: {
        const ref = &t;
        ref.* /= d;
        break :blk ref.*;
    }) == 1.0) return b + c;
    var p: f32 = d * 0.30000001192092896;
    var a: f32 = c;
    var s: f32 = p / 4.0;
    var postFix: f32 = a * powf(2.0, 10.0 * (blk: {
        const ref = &t;
        ref.* -= 1.0;
        break :blk ref.*;
    }));
    return -(postFix * sinf((((t * d) - s) * (2.0 * 3.1415927410125732)) / p)) + b;
}
pub fn EaseElasticOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if (t == 0.0) return b;
    if ((blk: {
        const ref = &t;
        ref.* /= d;
        break :blk ref.*;
    }) == 1.0) return b + c;
    var p: f32 = d * 0.30000001192092896;
    var a: f32 = c;
    var s: f32 = p / 4.0;
    return (((a * powf(2.0, -10.0 * t)) * sinf((((t * d) - s) * (2.0 * 3.1415927410125732)) / p)) + c) + b;
}
pub fn EaseElasticInOut(arg_t: f32, arg_b: f32, arg_c: f32, arg_d: f32) callconv(.C) f32 {
    var t = arg_t;
    var b = arg_b;
    var c = arg_c;
    var d = arg_d;
    if (t == 0.0) return b;
    if ((blk: {
        const ref = &t;
        ref.* /= d / 2.0;
        break :blk ref.*;
    }) == 2.0) return b + c;
    var p: f32 = d * (0.30000001192092896 * 1.5);
    var a: f32 = c;
    var s: f32 = p / 4.0;
    if (t < 1.0) {
        var postFix: f32 = a * powf(2.0, 10.0 * (blk: {
            const ref = &t;
            ref.* -= 1.0;
            break :blk ref.*;
        }));
        return (-0.5 * (postFix * sinf((((t * d) - s) * (2.0 * 3.1415927410125732)) / p))) + b;
    }
    var postFix: f32 = a * powf(2.0, -10.0 * (blk: {
        const ref = &t;
        ref.* -= 1.0;
        break :blk ref.*;
    }));
    return (((postFix * sinf((((t * d) - s) * (2.0 * 3.1415927410125732)) / p)) * 0.5) + c) + b;
}
pub const __INTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):61:9
pub const __UINTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):65:9
pub const __PTRDIFF_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):72:9
pub const __INTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):76:9
pub const __SIZE_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):80:9
pub const __UINTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):95:9
pub const __INT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):159:9
pub const __UINT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):187:9
pub const __INT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):225:9
pub const __UINT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):229:9
pub const __INT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):265:9
pub const __UINT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):269:9
pub const va_start = @compileError("TODO implement function '__builtin_va_start' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:17:9
pub const va_end = @compileError("TODO implement function '__builtin_va_end' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:18:9
pub const va_arg = @compileError("TODO implement function '__builtin_va_arg' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:19:9
pub const __va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:24:9
pub const va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:27:9
pub const RMDEF = @compileError("unable to translate C expr: unexpected token .Keyword_inline"); // ./src/raylib/src/raymath.h:70:17
pub const __STRINGIFY = @compileError("unable to translate C expr: unexpected token .Hash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:10:9
pub const __MINGW64_VERSION_STR = @compileError("unable to translate C expr: unexpected token .StringLiteral"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:26:9
pub const __MINGW_IMP_SYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:119:11
pub const __MINGW_IMP_LSYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:120:11
pub const __MINGW_LSYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:122:11
pub const __MINGW_POISON_NAME = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:203:11
pub const __MSABI_LONG = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:209:13
pub const __MINGW_ATTRIB_DEPRECATED_STR = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:247:11
pub const __mingw_ovr = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:289:11
pub const __MINGW_CRT_NAME_CONCAT2 = @compileError("unable to translate C expr: unexpected token .Colon"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_secapi.h:41:9
pub const __CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY_0_3_ = @compileError("unable to translate C expr: unexpected token .Identifier"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_secapi.h:69:9
pub const __MINGW_IMPORT = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:51:12
pub const __CRT_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:90:11
pub const __MINGW_INTRIN_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:97:9
pub const __MINGW_PRAGMA_PARAM = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:215:9
pub const __MINGW_BROKEN_INTERFACE = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:218:9
pub const __int64 = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:242:9
pub const __forceinline = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:267:9
pub const _crt_va_start = @compileError("TODO implement function '__builtin_va_start' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:48:9
pub const _crt_va_arg = @compileError("TODO implement function '__builtin_va_arg' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:49:9
pub const _crt_va_end = @compileError("TODO implement function '__builtin_va_end' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:50:9
pub const _crt_va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:51:9
pub const __CRT_STRINGIZE = @compileError("unable to translate C expr: unexpected token .Hash"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:286:9
pub const __CRT_WIDE = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:291:9
pub const _CRT_INSECURE_DEPRECATE_MEMORY = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:353:9
pub const _CRT_INSECURE_DEPRECATE_GLOBALS = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:357:9
pub const _CRT_OBSOLETE = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:365:9
pub const _UNION_NAME = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:476:9
pub const _STRUCT_NAME = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:477:9
pub const __CRT_UUID_DECL = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:564:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:267:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:268:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:269:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:270:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:271:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:272:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:273:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:274:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_2_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:275:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1_ARGLIST = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:276:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2_ARGLIST = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:277:9
pub const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_SPLITPATH = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:278:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:282:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:284:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:286:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:288:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:290:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:427:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:428:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:429:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:430:9
pub const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:431:9
pub const __crt_typefix = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:491:9
pub const __mingw_types_compatible_p = @compileError("TODO implement function '__builtin_types_compatible_p' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:97:9
pub const __mingw_choose_expr = @compileError("TODO implement function '__builtin_choose_expr' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:105:9
pub const HUGE_VAL = @compileError("TODO implement function '__builtin_huge_val' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:151:9
pub const HUGE_VALF = @compileError("TODO implement function '__builtin_huge_valf' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:344:9
pub const HUGE_VALL = @compileError("TODO implement function '__builtin_huge_vall' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:345:9
pub const INFINITY = @compileError("TODO implement function '__builtin_inff' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:346:9
pub const NAN = @compileError("TODO implement function '__builtin_nanf' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:347:9
pub const fpclassify = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:487:9
pub const isnan = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:581:9
pub const signbit = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:641:9
pub const isgreater = @compileError("TODO implement function '__builtin_isgreater' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:1139:9
pub const isgreaterequal = @compileError("TODO implement function '__builtin_isgreaterequal' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:1140:9
pub const isless = @compileError("TODO implement function '__builtin_isless' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:1141:9
pub const islessequal = @compileError("TODO implement function '__builtin_islessequal' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:1142:9
pub const islessgreater = @compileError("TODO implement function '__builtin_islessgreater' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:1143:9
pub const isunordered = @compileError("TODO implement function '__builtin_isunordered' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\math.h:1144:9
pub const TRACELOG = @compileError("unable to translate C expr: expected ')'"); // ./src/raylib/src/utils.h:44:13
pub const TRACELOGD = @compileError("unable to translate C expr: expected ')'"); // ./src/raylib/src/utils.h:45:13
pub const EASEDEF = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // ./src/raylib/src/easings.h:88:13
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 12);
pub const __clang_minor__ = @as(c_int, 0);
pub const __clang_patchlevel__ = @as(c_int, 0);
pub const __clang_version__ = "12.0.0 (https://github.com/llvm/llvm-project fa0971b87fb2c9d14d1bba2551e61f02f18f329b)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 12.0.0 (https://github.com/llvm/llvm-project fa0971b87fb2c9d14d1bba2551e61f02f18f329b)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __SEH__ = @as(c_int, 1);
pub const __OPTIMIZE__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @as(c_long, 2147483647);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
pub const __WINT_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __SIZE_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __PTRDIFF_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INTPTR_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __UINTPTR_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 4);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 2);
pub const __SIZEOF_WINT_T__ = @as(c_int, 2);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_FMTd__ = "lld";
pub const __INTMAX_FMTi__ = "lli";
pub const __INTMAX_C_SUFFIX__ = LL;
pub const __UINTMAX_FMTo__ = "llo";
pub const __UINTMAX_FMTu__ = "llu";
pub const __UINTMAX_FMTx__ = "llx";
pub const __UINTMAX_FMTX__ = "llX";
pub const __UINTMAX_C_SUFFIX__ = ULL;
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_FMTd__ = "lld";
pub const __PTRDIFF_FMTi__ = "lli";
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_FMTd__ = "lld";
pub const __INTPTR_FMTi__ = "lli";
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZE_FMTo__ = "llo";
pub const __SIZE_FMTu__ = "llu";
pub const __SIZE_FMTx__ = "llx";
pub const __SIZE_FMTX__ = "llX";
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __WCHAR_TYPE__ = c_ushort;
pub const __WCHAR_WIDTH__ = @as(c_int, 16);
pub const __WINT_TYPE__ = c_ushort;
pub const __WINT_WIDTH__ = @as(c_int, 16);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __SIG_ATOMIC_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_FMTo__ = "llo";
pub const __UINTPTR_FMTu__ = "llu";
pub const __UINTPTR_FMTx__ = "llx";
pub const __UINTPTR_FMTX__ = "llX";
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = 2.2204460492503131e-16;
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = 1.7976931348623157e+308;
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = 2.2250738585072014e-308;
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WCHAR_UNSIGNED__ = @as(c_int, 1);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT64_FMTd__ = "lld";
pub const __INT64_FMTi__ = "lli";
pub const __INT64_C_SUFFIX__ = LL;
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = U;
pub const __UINT32_MAX__ = @import("std").meta.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_FMTo__ = "llo";
pub const __UINT64_FMTu__ = "llu";
pub const __UINT64_FMTx__ = "llx";
pub const __UINT64_FMTX__ = "llX";
pub const __UINT64_C_SUFFIX__ = ULL;
pub const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").meta.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_LEAST64_FMTd__ = "lld";
pub const __INT_LEAST64_FMTi__ = "lli";
pub const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_LEAST64_FMTo__ = "llo";
pub const __UINT_LEAST64_FMTu__ = "llu";
pub const __UINT_LEAST64_FMTx__ = "llx";
pub const __UINT_LEAST64_FMTX__ = "llX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").meta.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __INT_FAST64_FMTd__ = "lld";
pub const __INT_FAST64_FMTi__ = "lli";
pub const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
pub const __UINT_FAST64_FMTo__ = "llo";
pub const __UINT_FAST64_FMTu__ = "llu";
pub const __UINT_FAST64_FMTx__ = "llx";
pub const __UINT_FAST64_FMTX__ = "llX";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_EVAL_METHOD__ = @as(c_int, 0);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = __attribute__(address_space(@as(c_int, 256)));
pub const __seg_fs = __attribute__(address_space(@as(c_int, 257)));
pub const __corei7 = @as(c_int, 1);
pub const __corei7__ = @as(c_int, 1);
pub const __tune_corei7__ = @as(c_int, 1);
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __RTM__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const _WIN32 = @as(c_int, 1);
pub const _WIN64 = @as(c_int, 1);
pub const WIN32 = @as(c_int, 1);
pub const __WIN32 = @as(c_int, 1);
pub const __WIN32__ = @as(c_int, 1);
pub const WINNT = @as(c_int, 1);
pub const __WINNT = @as(c_int, 1);
pub const __WINNT__ = @as(c_int, 1);
pub const WIN64 = @as(c_int, 1);
pub const __WIN64 = @as(c_int, 1);
pub const __WIN64__ = @as(c_int, 1);
pub const __MINGW64__ = @as(c_int, 1);
pub const __MSVCRT__ = @as(c_int, 1);
pub const __MINGW32__ = @as(c_int, 1);
pub fn __declspec(a: anytype) callconv(.Inline) @TypeOf(__attribute__(a)) {
    return __attribute__(a);
}
pub const _cdecl = __attribute__(__cdecl__);
pub const __cdecl = __attribute__(__cdecl__);
pub const _stdcall = __attribute__(__stdcall__);
pub const __stdcall = __attribute__(__stdcall__);
pub const _fastcall = __attribute__(__fastcall__);
pub const __fastcall = __attribute__(__fastcall__);
pub const _thiscall = __attribute__(__thiscall__);
pub const __thiscall = __attribute__(__thiscall__);
pub const _pascal = __attribute__(__pascal__);
pub const __pascal = __attribute__(__pascal__);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const _DEBUG = @as(c_int, 1);
pub const __GNUC_VA_LIST = @as(c_int, 1);
pub const PI = @as(f32, 3.14159265358979323846);
pub const DEG2RAD = PI / @as(f32, 180.0);
pub const RAD2DEG = @as(f32, 180.0) / PI;
pub fn RL_MALLOC(sz: anytype) callconv(.Inline) @TypeOf(malloc(sz)) {
    return malloc(sz);
}
pub fn RL_CALLOC(n: anytype, sz: anytype) callconv(.Inline) @TypeOf(calloc(n, sz)) {
    return calloc(n, sz);
}
pub fn RL_REALLOC(ptr: anytype, sz: anytype) callconv(.Inline) @TypeOf(realloc(ptr, sz)) {
    return realloc(ptr, sz);
}
pub fn RL_FREE(ptr: anytype) callconv(.Inline) @TypeOf(free(ptr)) {
    return free(ptr);
}
pub fn CLITERAL(type_1: anytype) callconv(.Inline) @TypeOf(type_1) {
    return type_1;
}
pub const LIGHTGRAY = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 200), @as(c_int, 200), @as(c_int, 200), @as(c_int, 255) });
pub const GRAY = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 130), @as(c_int, 130), @as(c_int, 130), @as(c_int, 255) });
pub const DARKGRAY = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 80), @as(c_int, 80), @as(c_int, 80), @as(c_int, 255) });
pub const YELLOW = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 253), @as(c_int, 249), @as(c_int, 0), @as(c_int, 255) });
pub const GOLD = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 203), @as(c_int, 0), @as(c_int, 255) });
pub const ORANGE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 161), @as(c_int, 0), @as(c_int, 255) });
pub const PINK = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 109), @as(c_int, 194), @as(c_int, 255) });
pub const RED = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 230), @as(c_int, 41), @as(c_int, 55), @as(c_int, 255) });
pub const MAROON = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 190), @as(c_int, 33), @as(c_int, 55), @as(c_int, 255) });
pub const GREEN = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 228), @as(c_int, 48), @as(c_int, 255) });
pub const LIME = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 158), @as(c_int, 47), @as(c_int, 255) });
pub const DARKGREEN = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 117), @as(c_int, 44), @as(c_int, 255) });
pub const SKYBLUE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 102), @as(c_int, 191), @as(c_int, 255), @as(c_int, 255) });
pub const BLUE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 121), @as(c_int, 241), @as(c_int, 255) });
pub const DARKBLUE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 82), @as(c_int, 172), @as(c_int, 255) });
pub const PURPLE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 200), @as(c_int, 122), @as(c_int, 255), @as(c_int, 255) });
pub const VIOLET = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 135), @as(c_int, 60), @as(c_int, 190), @as(c_int, 255) });
pub const DARKPURPLE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 112), @as(c_int, 31), @as(c_int, 126), @as(c_int, 255) });
pub const BEIGE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 211), @as(c_int, 176), @as(c_int, 131), @as(c_int, 255) });
pub const BROWN = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 127), @as(c_int, 106), @as(c_int, 79), @as(c_int, 255) });
pub const DARKBROWN = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 76), @as(c_int, 63), @as(c_int, 47), @as(c_int, 255) });
pub const WHITE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 255), @as(c_int, 255), @as(c_int, 255) });
pub const BLACK = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 255) });
pub const BLANK = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 0), @as(c_int, 0), @as(c_int, 0), @as(c_int, 0) });
pub const MAGENTA = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 255), @as(c_int, 0), @as(c_int, 255), @as(c_int, 255) });
pub const RAYWHITE = @import("std").mem.zeroInit(CLITERAL(Color), .{ @as(c_int, 245), @as(c_int, 245), @as(c_int, 245), @as(c_int, 255) });
pub const FormatText = TextFormat;
pub const LoadText = LoadFileText;
pub const GetExtension = GetFileExtension;
pub const GetImageData = LoadImageColors;
pub const FILTER_POINT = TEXTURE_FILTER_POINT;
pub const FILTER_BILINEAR = TEXTURE_FILTER_BILINEAR;
pub const MAP_DIFFUSE = MATERIAL_MAP_DIFFUSE;
pub const PIXELFORMAT_UNCOMPRESSED_R8G8B8A8 = PIXELFORMAT_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8;
pub const bool_4 = bool;
pub const true_5 = @as(c_int, 1);
pub const false_6 = @as(c_int, 0);
pub const __bool_true_false_are_defined = @as(c_int, 1);
pub const SpriteFont = Font;
pub const MATERIAL_MAP_DIFFUSE = MATERIAL_MAP_ALBEDO;
pub const MATERIAL_MAP_SPECULAR = MATERIAL_MAP_METALNESS;
pub const SHADER_LOC_MAP_DIFFUSE = SHADER_LOC_MAP_ALBEDO;
pub const SHADER_LOC_MAP_SPECULAR = SHADER_LOC_MAP_METALNESS;
pub fn MatrixToFloat(mat: anytype) callconv(.Inline) @TypeOf(MatrixToFloatV(mat).v) {
    return MatrixToFloatV(mat).v;
}
pub fn Vector3ToFloat(vec: anytype) callconv(.Inline) @TypeOf(Vector3ToFloatV(vec).v) {
    return Vector3ToFloatV(vec).v;
}
pub fn __MINGW64_STRINGIFY(x: anytype) callconv(.Inline) @TypeOf(__STRINGIFY(x)) {
    return __STRINGIFY(x);
}
pub const __MINGW64_VERSION_MAJOR = @as(c_int, 8);
pub const __MINGW64_VERSION_MINOR = @as(c_int, 0);
pub const __MINGW64_VERSION_BUGFIX = @as(c_int, 0);
pub const __MINGW64_VERSION_RC = @as(c_int, 0);
pub const __MINGW64_VERSION_STATE = "alpha";
pub const __MINGW32_MAJOR_VERSION = @as(c_int, 3);
pub const __MINGW32_MINOR_VERSION = @as(c_int, 11);
pub const _M_AMD64 = @as(c_int, 100);
pub const _M_X64 = @as(c_int, 100);
pub const _ = @as(c_int, 1);
pub const __MINGW_USE_UNDERSCORE_PREFIX = @as(c_int, 0);
pub fn __MINGW_USYMBOL(sym: anytype) callconv(.Inline) @TypeOf(sym) {
    return sym;
}
pub fn __MINGW_ASM_CALL(func: anytype) callconv(.Inline) @TypeOf(__asm__(__MINGW64_STRINGIFY(__MINGW_USYMBOL(func)))) {
    return __asm__(__MINGW64_STRINGIFY(__MINGW_USYMBOL(func)));
}
pub fn __MINGW_ASM_CRT_CALL(func: anytype) callconv(.Inline) @TypeOf(__asm__(__STRINGIFY(func))) {
    return __asm__(__STRINGIFY(func));
}
pub const __MINGW_EXTENSION = __extension__;
pub const __C89_NAMELESS = __MINGW_EXTENSION;
pub const __GNU_EXTENSION = __MINGW_EXTENSION;
pub const __MINGW_HAVE_ANSI_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_PRINTF = @as(c_int, 1);
pub const __MINGW_HAVE_ANSI_C99_SCANF = @as(c_int, 1);
pub const __MINGW_HAVE_WIDE_C99_SCANF = @as(c_int, 1);
pub const __MINGW_GCC_VERSION = ((__GNUC__ * @as(c_int, 10000)) + (__GNUC_MINOR__ * @as(c_int, 100))) + __GNUC_PATCHLEVEL__;
pub fn __MINGW_GNUC_PREREQ(major: anytype, minor: anytype) callconv(.Inline) @TypeOf((__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor))) {
    return (__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor));
}
pub fn __MINGW_MSC_PREREQ(major: anytype, minor: anytype) callconv(.Inline) @TypeOf(@as(c_int, 0)) {
    return @as(c_int, 0);
}
pub const __MINGW_SEC_WARN_STR = "This function or variable may be unsafe, use _CRT_SECURE_NO_WARNINGS to disable deprecation";
pub const __MINGW_MSVC2005_DEPREC_STR = "This POSIX function is deprecated beginning in Visual C++ 2005, use _CRT_NONSTDC_NO_DEPRECATE to disable deprecation";
pub const __MINGW_ATTRIB_DEPRECATED_MSVC2005 = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_MSVC2005_DEPREC_STR);
pub const __MINGW_ATTRIB_DEPRECATED_SEC_WARN = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_SEC_WARN_STR);
pub fn __MINGW_MS_PRINTF(__format: anytype, __args: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(ms_printf, __format, __args))) {
    return __attribute__(__format__(ms_printf, __format, __args));
}
pub fn __MINGW_MS_SCANF(__format: anytype, __args: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(ms_scanf, __format, __args))) {
    return __attribute__(__format__(ms_scanf, __format, __args));
}
pub fn __MINGW_GNU_PRINTF(__format: anytype, __args: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(gnu_printf, __format, __args))) {
    return __attribute__(__format__(gnu_printf, __format, __args));
}
pub fn __MINGW_GNU_SCANF(__format: anytype, __args: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(gnu_scanf, __format, __args))) {
    return __attribute__(__format__(gnu_scanf, __format, __args));
}
pub const __mingw_static_ovr = __mingw_ovr;
pub const __MINGW_FORTIFY_LEVEL = @as(c_int, 0);
pub const __mingw_bos_ovr = __mingw_ovr;
pub const __MINGW_FORTIFY_VA_ARG = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = @as(c_int, 0);
pub const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = @as(c_int, 0);
pub const __LONG32 = c_long;
pub const __USE_CRTIMP = @as(c_int, 1);
pub const _CRTIMP = __attribute__(__dllimport__);
pub const USE___UUIDOF = @as(c_int, 0);
pub const _inline = __inline;
pub fn __UNUSED_PARAM(x: anytype) callconv(.Inline) @TypeOf(x ++ __attribute__(__unused__)) {
    return x ++ __attribute__(__unused__);
}
pub const __restrict_arr = __restrict;
pub const __MINGW_ATTRIB_NORETURN = __attribute__(__noreturn__);
pub const __MINGW_ATTRIB_CONST = __attribute__(__const__);
pub const __MINGW_ATTRIB_MALLOC = __attribute__(__malloc__);
pub const __MINGW_ATTRIB_PURE = __attribute__(__pure__);
pub fn __MINGW_ATTRIB_NONNULL(arg: anytype) callconv(.Inline) @TypeOf(__attribute__(__nonnull__(arg))) {
    return __attribute__(__nonnull__(arg));
}
pub const __MINGW_ATTRIB_UNUSED = __attribute__(__unused__);
pub const __MINGW_ATTRIB_USED = __attribute__(__used__);
pub const __MINGW_ATTRIB_DEPRECATED = __attribute__(__deprecated__);
pub fn __MINGW_ATTRIB_DEPRECATED_MSG(x: anytype) callconv(.Inline) @TypeOf(__attribute__(__deprecated__(x))) {
    return __attribute__(__deprecated__(x));
}
pub const __MINGW_NOTHROW = __attribute__(__nothrow__);
pub const __MSVCRT_VERSION__ = @as(c_int, 0x700);
pub const _WIN32_WINNT = @as(c_int, 0x0603);
pub const __int8 = u8;
pub const __int16 = c_short;
pub const __int32 = c_int;
pub const MINGW_HAS_SECURE_API = @as(c_int, 1);
pub const __STDC_SECURE_LIB__ = @as(c_long, 200411);
pub const __GOT_SECURE_LIB__ = __STDC_SECURE_LIB__;
pub const _CRT_PACKING = @as(c_int, 8);
pub fn _ADDRESSOF(v: anytype) callconv(.Inline) @TypeOf(&v) {
    return &v;
}
pub fn _CRT_STRINGIZE(_Value: anytype) callconv(.Inline) @TypeOf(__CRT_STRINGIZE(_Value)) {
    return __CRT_STRINGIZE(_Value);
}
pub fn _CRT_WIDE(_String: anytype) callconv(.Inline) @TypeOf(__CRT_WIDE(_String)) {
    return __CRT_WIDE(_String);
}
pub const _CRTIMP_NOIA64 = _CRTIMP;
pub const _CRTIMP2 = _CRTIMP;
pub const _CRTIMP_ALTERNATIVE = _CRTIMP;
pub const _MRTIMP2 = _CRTIMP;
pub const _MCRTIMP = _CRTIMP;
pub const _CRTIMP_PURE = _CRTIMP;
pub const _SECURECRT_FILL_BUFFER_PATTERN = @as(c_int, 0xFD);
pub fn _CRT_DEPRECATE_TEXT(_Text: anytype) callconv(.Inline) @TypeOf(__declspec(deprecated)) {
    return __declspec(deprecated);
}
pub const UNALIGNED = __unaligned;
pub fn _CRT_ALIGN(x: anytype) callconv(.Inline) @TypeOf(__attribute__(__aligned__(x))) {
    return __attribute__(__aligned__(x));
}
pub const __CRTDECL = __cdecl;
pub const _ARGMAX = @as(c_int, 100);
pub const _TRUNCATE = usize - @as(c_int, 1);
pub fn _CRT_UNUSED(x: anytype) callconv(.Inline) c_void {
    return @import("std").meta.cast(c_void, x);
}
pub const __USE_MINGW_ANSI_STDIO = @as(c_int, 1);
pub const _CRT_glob = _dowildcard;
pub const _ANONYMOUS_UNION = __MINGW_EXTENSION;
pub const _ANONYMOUS_STRUCT = __MINGW_EXTENSION;
pub const __MINGW_DEBUGBREAK_IMPL = !(__has_builtin(__debugbreak) != 0);
pub const _CRT_SECURE_CPP_NOTHROW = throw();
pub const _DOMAIN = @as(c_int, 1);
pub const _SING = @as(c_int, 2);
pub const _OVERFLOW = @as(c_int, 3);
pub const _UNDERFLOW = @as(c_int, 4);
pub const _TLOSS = @as(c_int, 5);
pub const _PLOSS = @as(c_int, 6);
pub const DOMAIN = _DOMAIN;
pub const SING = _SING;
pub const OVERFLOW = _OVERFLOW;
pub const UNDERFLOW = _UNDERFLOW;
pub const TLOSS = _TLOSS;
pub const PLOSS = _PLOSS;
pub const M_E = 2.7182818284590452354;
pub const M_LOG2E = 1.4426950408889634074;
pub const M_LOG10E = 0.43429448190325182765;
pub const M_LN2 = 0.69314718055994530942;
pub const M_LN10 = 2.30258509299404568402;
pub const M_PI = 3.14159265358979323846;
pub const M_PI_2 = 1.57079632679489661923;
pub const M_PI_4 = 0.78539816339744830962;
pub const M_1_PI = 0.31830988618379067154;
pub const M_2_PI = 0.63661977236758134308;
pub const M_2_SQRTPI = 1.12837916709551257390;
pub const M_SQRT2 = 1.41421356237309504880;
pub const M_SQRT1_2 = 0.70710678118654752440;
pub const __MINGW_FPCLASS_DEFINED = @as(c_int, 1);
pub const _FPCLASS_SNAN = @as(c_int, 0x0001);
pub const _FPCLASS_QNAN = @as(c_int, 0x0002);
pub const _FPCLASS_NINF = @as(c_int, 0x0004);
pub const _FPCLASS_NN = @as(c_int, 0x0008);
pub const _FPCLASS_ND = @as(c_int, 0x0010);
pub const _FPCLASS_NZ = @as(c_int, 0x0020);
pub const _FPCLASS_PZ = @as(c_int, 0x0040);
pub const _FPCLASS_PD = @as(c_int, 0x0080);
pub const _FPCLASS_PN = @as(c_int, 0x0100);
pub const _FPCLASS_PINF = @as(c_int, 0x0200);
pub const _HUGE = __MINGW_IMP_SYMBOL(_HUGE).*;
pub const EDOM = @as(c_int, 33);
pub const ERANGE = @as(c_int, 34);
pub const FP_SNAN = _FPCLASS_SNAN;
pub const FP_QNAN = _FPCLASS_QNAN;
pub const FP_NINF = _FPCLASS_NINF;
pub const FP_PINF = _FPCLASS_PINF;
pub const FP_NDENORM = _FPCLASS_ND;
pub const FP_PDENORM = _FPCLASS_PD;
pub const FP_NZERO = _FPCLASS_NZ;
pub const FP_PZERO = _FPCLASS_PZ;
pub const FP_NNORM = _FPCLASS_NN;
pub const FP_PNORM = _FPCLASS_PN;
pub const FP_NAN = @as(c_int, 0x0100);
pub const FP_NORMAL = @as(c_int, 0x0400);
pub const FP_INFINITE = FP_NAN | FP_NORMAL;
pub const FP_ZERO = @as(c_int, 0x4000);
pub const FP_SUBNORMAL = FP_NORMAL | FP_ZERO;
pub fn __dfp_expansion(__call: anytype, __fin: anytype, x: anytype) callconv(.Inline) @TypeOf(__fin) {
    return __fin;
}
pub fn isfinite(x: anytype) callconv(.Inline) @TypeOf((fpclassify(x) & FP_NAN) == @as(c_int, 0)) {
    return (fpclassify(x) & FP_NAN) == @as(c_int, 0);
}
pub fn isinf(x: anytype) callconv(.Inline) @TypeOf(fpclassify(x) == FP_INFINITE) {
    return fpclassify(x) == FP_INFINITE;
}
pub fn isnormal(x: anytype) callconv(.Inline) @TypeOf(fpclassify(x) == FP_NORMAL) {
    return fpclassify(x) == FP_NORMAL;
}
pub const FP_ILOGB0 = @import("std").meta.cast(c_int, @import("std").meta.promoteIntLiteral(c_int, 0x80000000, .hexadecimal));
pub const FP_ILOGBNAN = @import("std").meta.cast(c_int, @import("std").meta.promoteIntLiteral(c_int, 0x7fffffff, .hexadecimal));
pub fn _nan() callconv(.Inline) @TypeOf(nan("")) {
    return nan("");
}
pub fn _nanf() callconv(.Inline) @TypeOf(nanf("")) {
    return nanf("");
}
pub fn _nanl() callconv(.Inline) @TypeOf(nanl("")) {
    return nanl("");
}
pub const _copysignl = copysignl;
pub const _hypotl = hypotl;
pub const matherr = _matherr;
pub const HUGE = _HUGE;
pub const DEFAULT_BATCH_BUFFER_ELEMENTS = @as(c_int, 8192);
pub const DEFAULT_BATCH_BUFFERS = @as(c_int, 1);
pub const DEFAULT_BATCH_DRAWCALLS = @as(c_int, 256);
pub const MAX_BATCH_ACTIVE_TEXTURES = @as(c_int, 4);
pub const MAX_MATRIX_STACK_SIZE = @as(c_int, 32);
pub const MAX_MESH_VERTEX_BUFFERS = @as(c_int, 7);
pub const MAX_SHADER_LOCATIONS = @as(c_int, 32);
pub const MAX_MATERIAL_MAPS = @as(c_int, 12);
pub const RL_CULL_DISTANCE_NEAR = 0.01;
pub const RL_CULL_DISTANCE_FAR = 1000.0;
pub const RL_TEXTURE_WRAP_S = @as(c_int, 0x2802);
pub const RL_TEXTURE_WRAP_T = @as(c_int, 0x2803);
pub const RL_TEXTURE_MAG_FILTER = @as(c_int, 0x2800);
pub const RL_TEXTURE_MIN_FILTER = @as(c_int, 0x2801);
pub const RL_TEXTURE_FILTER_NEAREST = @as(c_int, 0x2600);
pub const RL_TEXTURE_FILTER_LINEAR = @as(c_int, 0x2601);
pub const RL_TEXTURE_FILTER_MIP_NEAREST = @as(c_int, 0x2700);
pub const RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR = @as(c_int, 0x2702);
pub const RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST = @as(c_int, 0x2701);
pub const RL_TEXTURE_FILTER_MIP_LINEAR = @as(c_int, 0x2703);
pub const RL_TEXTURE_FILTER_ANISOTROPIC = @as(c_int, 0x3000);
pub const RL_TEXTURE_WRAP_REPEAT = @as(c_int, 0x2901);
pub const RL_TEXTURE_WRAP_CLAMP = @import("std").meta.promoteIntLiteral(c_int, 0x812F, .hexadecimal);
pub const RL_TEXTURE_WRAP_MIRROR_REPEAT = @import("std").meta.promoteIntLiteral(c_int, 0x8370, .hexadecimal);
pub const RL_TEXTURE_WRAP_MIRROR_CLAMP = @import("std").meta.promoteIntLiteral(c_int, 0x8742, .hexadecimal);
pub const RL_MODELVIEW = @as(c_int, 0x1700);
pub const RL_PROJECTION = @as(c_int, 0x1701);
pub const RL_TEXTURE = @as(c_int, 0x1702);
pub const RL_LINES = @as(c_int, 0x0001);
pub const RL_TRIANGLES = @as(c_int, 0x0004);
pub const RL_QUADS = @as(c_int, 0x0007);
pub const RL_UNSIGNED_BYTE = @as(c_int, 0x1401);
pub const RL_FLOAT = @as(c_int, 0x1406);
pub const tagLC_ID = struct_tagLC_ID;
pub const lconv = struct_lconv;
pub const __lc_time_data = struct___lc_time_data;
pub const threadlocaleinfostruct = struct_threadlocaleinfostruct;
pub const threadmbcinfostruct = struct_threadmbcinfostruct;
pub const localeinfo_struct = struct_localeinfo_struct;
pub const _exception = struct__exception;
pub const _complex = struct__complex;
