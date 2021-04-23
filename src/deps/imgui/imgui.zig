usingnamespace @import("std").c.builtins;
const __builtin_va_list = [*c]u8;
const __gnuc_va_list = __builtin_va_list;
const va_list = __gnuc_va_list; 
extern fn __debugbreak() callconv(.C) void;
extern fn __mingw_get_crt_info() [*c]const u8;
const rsize_t = usize;
const ptrdiff_t = c_longlong;
const wchar_t = c_ushort;
const wint_t = c_ushort;
const wctype_t = c_ushort;
const errno_t = c_int;
const __time32_t = c_long;
const __time64_t = c_longlong;
const time_t = __time64_t;
const struct_tagLC_ID = extern struct {
    wLanguage: c_ushort,
    wCountry: c_ushort,
    wCodePage: c_ushort,
};
const LC_ID = struct_tagLC_ID;
const struct_unnamed_1 = extern struct {
    locale: [*c]u8,
    wlocale: [*c]wchar_t,
    refcount: [*c]c_int,
    wrefcount: [*c]c_int,
};
const struct_lconv = opaque {};
const struct___lc_time_data = opaque {};
const struct_threadlocaleinfostruct = extern struct {
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
const struct_threadmbcinfostruct = opaque {};
const pthreadlocinfo = [*c]struct_threadlocaleinfostruct;
const pthreadmbcinfo = ?*struct_threadmbcinfostruct;
const struct_localeinfo_struct = extern struct {
    locinfo: pthreadlocinfo,
    mbcinfo: pthreadmbcinfo,
};
const _locale_tstruct = struct_localeinfo_struct;
const _locale_t = [*c]struct_localeinfo_struct;
const LPLC_ID = [*c]struct_tagLC_ID;
const threadlocinfo = struct_threadlocaleinfostruct;
const struct__iobuf = extern struct {
    _ptr: [*c]u8,
    _cnt: c_int,
    _base: [*c]u8,
    _flag: c_int,
    _file: c_int,
    _charbuf: c_int,
    _bufsiz: c_int,
    _tmpfname: [*c]u8,
};
const FILE = struct__iobuf;
const _off_t = c_long;
const off32_t = c_long;
const _off64_t = c_longlong;
const off64_t = c_longlong;
const off_t = off32_t;
extern fn __acrt_iob_func(index: c_uint) [*c]FILE;
extern fn __iob_func() [*c]FILE;
const fpos_t = c_longlong;
extern fn __mingw_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
extern fn __mingw_vsscanf(noalias _Str: [*c]const u8, noalias Format: [*c]const u8, argp: va_list) c_int;
extern fn __mingw_scanf(noalias _Format: [*c]const u8, ...) c_int;
extern fn __mingw_vscanf(noalias Format: [*c]const u8, argp: va_list) c_int;
extern fn __mingw_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
extern fn __mingw_vfscanf(noalias fp: [*c]FILE, noalias Format: [*c]const u8, argp: va_list) c_int;
extern fn __mingw_vsnprintf(noalias _DstBuf: [*c]u8, _MaxCount: usize, noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn __mingw_snprintf(noalias s: [*c]u8, n: usize, noalias format: [*c]const u8, ...) c_int;
const __mingw_printf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:170:15
const __mingw_vprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:173:15
const __mingw_fprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:176:15
const __mingw_vfprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:179:15
const __mingw_sprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:182:15
const __mingw_vsprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:185:15
const __mingw_asprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:188:15
const __mingw_vasprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:191:15
extern fn __ms_sscanf(noalias _Src: [*c]const u8, noalias _Format: [*c]const u8, ...) c_int;
extern fn __ms_scanf(noalias _Format: [*c]const u8, ...) c_int;
extern fn __ms_fscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const u8, ...) c_int;
const __ms_printf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:205:15
const __ms_vprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:208:15
const __ms_fprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:211:15
const __ms_vfprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:214:15
const __ms_sprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:217:15
const __ms_vsprintf = @compileError("unable to resolve function type TypeClass.MacroQualified"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:220:15
// C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:276:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn sscanf(__source: [*c]const u8, __format: [*c]const u8, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:287:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn scanf(__format: [*c]const u8, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:298:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn fscanf(__stream: [*c]FILE, __format: [*c]const u8, ...) c_int;
fn vsscanf(arg___source: [*c]const u8, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __source = arg___source;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vsscanf(__source, __format, __local_argv);
}
fn vscanf(arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfscanf(__acrt_iob_func(@bitCast(c_uint, @as(c_int, 0))), __format, __local_argv);
}
fn vfscanf(arg___stream: [*c]FILE, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfscanf(__stream, __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:343:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn fprintf(__stream: [*c]FILE, __format: [*c]const u8, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:354:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn printf(__format: [*c]const u8, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:382:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn sprintf(__stream: [*c]u8, __format: [*c]const u8, ...) c_int;
fn vfprintf(arg___stream: [*c]FILE, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfprintf(__stream, __format, __local_argv);
}
fn vprintf(arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfprintf(__acrt_iob_func(@bitCast(c_uint, @as(c_int, 1))), __format, __local_argv);
}
fn vsprintf(arg___stream: [*c]u8, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vsprintf(__stream, __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:437:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn snprintf(__stream: [*c]u8, __n: usize, __format: [*c]const u8, ...) c_int;
fn vsnprintf(arg___stream: [*c]u8, arg___n: usize, arg___format: [*c]const u8, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __n = arg___n;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vsnprintf(__stream, __n, __format, __local_argv);
}
extern fn _filbuf(_File: [*c]FILE) c_int;
extern fn _flsbuf(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn _fsopen(_Filename: [*c]const u8, _Mode: [*c]const u8, _ShFlag: c_int) [*c]FILE;
extern fn clearerr(_File: [*c]FILE) void;
extern fn fclose(_File: [*c]FILE) c_int;
extern fn _fcloseall() c_int;
extern fn _fdopen(_FileHandle: c_int, _Mode: [*c]const u8) [*c]FILE;
extern fn feof(_File: [*c]FILE) c_int;
extern fn ferror(_File: [*c]FILE) c_int;
extern fn fflush(_File: [*c]FILE) c_int;
extern fn fgetc(_File: [*c]FILE) c_int;
extern fn _fgetchar() c_int;
extern fn fgetpos(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
extern fn fgetpos64(noalias _File: [*c]FILE, noalias _Pos: [*c]fpos_t) c_int;
extern fn fgets(noalias _Buf: [*c]u8, _MaxCount: c_int, noalias _File: [*c]FILE) [*c]u8;
extern fn _fileno(_File: [*c]FILE) c_int;
extern fn _tempnam(_DirName: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
extern fn _flushall() c_int;
extern fn fopen(_Filename: [*c]const u8, _Mode: [*c]const u8) [*c]FILE;
extern fn fopen64(noalias filename: [*c]const u8, noalias mode: [*c]const u8) [*c]FILE;
extern fn fputc(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn _fputchar(_Ch: c_int) c_int;
extern fn fputs(noalias _Str: [*c]const u8, noalias _File: [*c]FILE) c_int;
extern fn fread(_DstBuf: ?*c_void, _ElementSize: c_ulonglong, _Count: c_ulonglong, _File: [*c]FILE) c_ulonglong;
extern fn freopen(noalias _Filename: [*c]const u8, noalias _Mode: [*c]const u8, noalias _File: [*c]FILE) [*c]FILE;
extern fn fsetpos(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
extern fn fsetpos64(_File: [*c]FILE, _Pos: [*c]const fpos_t) c_int;
extern fn fseek(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
extern fn ftell(_File: [*c]FILE) c_long;
extern fn _fseeki64(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
extern fn _ftelli64(_File: [*c]FILE) c_longlong;
extern fn fseeko64(stream: [*c]FILE, offset: _off64_t, whence: c_int) c_int;
extern fn fseeko(stream: [*c]FILE, offset: _off_t, whence: c_int) c_int;
extern fn ftello(stream: [*c]FILE) _off_t;
extern fn ftello64(stream: [*c]FILE) _off64_t;
extern fn fwrite(_Str: ?*const c_void, _Size: c_ulonglong, _Count: c_ulonglong, _File: [*c]FILE) c_ulonglong;
extern fn getc(_File: [*c]FILE) c_int;
extern fn getchar() c_int;
extern fn _getmaxstdio() c_int;
extern fn gets(_Buffer: [*c]u8) [*c]u8;
extern fn _getw(_File: [*c]FILE) c_int;
extern fn perror(_ErrMsg: [*c]const u8) void;
extern fn _pclose(_File: [*c]FILE) c_int;
extern fn _popen(_Command: [*c]const u8, _Mode: [*c]const u8) [*c]FILE;
extern fn putc(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn putchar(_Ch: c_int) c_int;
extern fn puts(_Str: [*c]const u8) c_int;
extern fn _putw(_Word: c_int, _File: [*c]FILE) c_int;
extern fn remove(_Filename: [*c]const u8) c_int;
extern fn rename(_OldFilename: [*c]const u8, _NewFilename: [*c]const u8) c_int;
extern fn _unlink(_Filename: [*c]const u8) c_int;
extern fn unlink(_Filename: [*c]const u8) c_int;
extern fn rewind(_File: [*c]FILE) void;
extern fn _rmtmp() c_int;
extern fn setbuf(noalias _File: [*c]FILE, noalias _Buffer: [*c]u8) void;
extern fn _setmaxstdio(_Max: c_int) c_int;
extern fn _set_output_format(_Format: c_uint) c_uint;
extern fn _get_output_format() c_uint;
extern fn setvbuf(noalias _File: [*c]FILE, noalias _Buf: [*c]u8, _Mode: c_int, _Size: usize) c_int;
extern fn _scprintf(noalias _Format: [*c]const u8, ...) c_int;
extern fn _snscanf(noalias _Src: [*c]const u8, _MaxCount: usize, noalias _Format: [*c]const u8, ...) c_int;
extern fn tmpfile() [*c]FILE;
extern fn tmpnam(_Buffer: [*c]u8) [*c]u8;
extern fn ungetc(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn _snprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, ...) c_int;
extern fn _vsnprintf(noalias _Dest: [*c]u8, _Count: usize, noalias _Format: [*c]const u8, _Args: va_list) c_int;
extern fn _vscprintf(noalias _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _set_printf_count_output(_Value: c_int) c_int;
extern fn _get_printf_count_output() c_int;
extern fn __mingw_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vswscanf(noalias _Str: [*c]const wchar_t, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
extern fn __mingw_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vwscanf(noalias Format: [*c]const wchar_t, argp: va_list) c_int;
extern fn __mingw_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vfwscanf(noalias fp: [*c]FILE, noalias Format: [*c]const wchar_t, argp: va_list) c_int;
extern fn __mingw_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn __mingw_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn __mingw_snwprintf(noalias s: [*c]wchar_t, n: usize, noalias format: [*c]const wchar_t, ...) c_int;
extern fn __mingw_vsnwprintf(noalias [*c]wchar_t, usize, noalias [*c]const wchar_t, va_list) c_int;
extern fn __mingw_swprintf(noalias [*c]wchar_t, noalias [*c]const wchar_t, ...) c_int;
extern fn __mingw_vswprintf(noalias [*c]wchar_t, noalias [*c]const wchar_t, va_list) c_int;
extern fn __ms_swscanf(noalias _Src: [*c]const wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_wscanf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_fwscanf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_fwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_wprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn __ms_vfwprintf(noalias _File: [*c]FILE, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn __ms_vwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn __ms_swprintf(noalias [*c]wchar_t, noalias [*c]const wchar_t, ...) c_int;
extern fn __ms_vswprintf(noalias [*c]wchar_t, noalias [*c]const wchar_t, va_list) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1024:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn swscanf(__source: [*c]const wchar_t, __format: [*c]const wchar_t, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1035:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn wscanf(__format: [*c]const wchar_t, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1046:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn fwscanf(__stream: [*c]FILE, __format: [*c]const wchar_t, ...) c_int;
fn vswscanf(noalias arg___source: [*c]const wchar_t, noalias arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __source = arg___source;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vswscanf(__source, __format, __local_argv);
}
fn vwscanf(arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfwscanf(__acrt_iob_func(@bitCast(c_uint, @as(c_int, 0))), __format, __local_argv);
}
fn vfwscanf(arg___stream: [*c]FILE, arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfwscanf(__stream, __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1082:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn fwprintf(__stream: [*c]FILE, __format: [*c]const wchar_t, ...) c_int; // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1093:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn wprintf(__format: [*c]const wchar_t, ...) c_int;
fn vfwprintf(arg___stream: [*c]FILE, arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfwprintf(__stream, __format, __local_argv);
}
fn vwprintf(arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vfwprintf(__acrt_iob_func(@bitCast(c_uint, @as(c_int, 1))), __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1132:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn snwprintf(__stream: [*c]wchar_t, __n: usize, __format: [*c]const wchar_t, ...) c_int;
fn vsnwprintf(arg___stream: [*c]wchar_t, arg___n: usize, arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __n = arg___n;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return __mingw_vsnwprintf(__stream, __n, __format, __local_argv);
}
extern fn _wfsopen(_Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _ShFlag: c_int) [*c]FILE;
extern fn fgetwc(_File: [*c]FILE) wint_t;
extern fn _fgetwchar() wint_t;
extern fn fputwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
extern fn _fputwchar(_Ch: wchar_t) wint_t;
extern fn getwc(_File: [*c]FILE) wint_t;
extern fn getwchar() wint_t;
extern fn putwc(_Ch: wchar_t, _File: [*c]FILE) wint_t;
extern fn putwchar(_Ch: wchar_t) wint_t;
extern fn ungetwc(_Ch: wint_t, _File: [*c]FILE) wint_t;
extern fn fgetws(noalias _Dst: [*c]wchar_t, _SizeInWords: c_int, noalias _File: [*c]FILE) [*c]wchar_t;
extern fn fputws(noalias _Str: [*c]const wchar_t, noalias _File: [*c]FILE) c_int;
extern fn _getws(_String: [*c]wchar_t) [*c]wchar_t;
extern fn _putws(_Str: [*c]const wchar_t) c_int;
extern fn _scwprintf(noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _swprintf_c(noalias _DstBuf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _vswprintf_c(noalias _DstBuf: [*c]wchar_t, _SizeInWords: usize, noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _snwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _vsnwprintf(noalias _Dest: [*c]wchar_t, _Count: usize, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
extern fn _vscwprintf(noalias _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _swprintf(noalias _Dest: [*c]wchar_t, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _vswprintf(noalias _Dest: [*c]wchar_t, noalias _Format: [*c]const wchar_t, _Args: va_list) c_int;
fn vswprintf(arg___stream: [*c]wchar_t, arg___count: usize, arg___format: [*c]const wchar_t, arg___local_argv: __builtin_va_list) callconv(.C) c_int {
    var __stream = arg___stream;
    var __count = arg___count;
    var __format = arg___format;
    var __local_argv = arg___local_argv;
    return vsnwprintf(__stream, __count, __format, __local_argv);
} // C:\zig\lib\zig\libc\include\any-windows-any\swprintf.inl:34:5: warning: TODO unable to translate variadic function, demoted to extern
extern fn swprintf(__stream: [*c]wchar_t, __count: usize, __format: [*c]const wchar_t, ...) c_int;
extern fn _wtempnam(_Directory: [*c]const wchar_t, _FilePrefix: [*c]const wchar_t) [*c]wchar_t;
extern fn _snwscanf(noalias _Src: [*c]const wchar_t, _MaxCount: usize, noalias _Format: [*c]const wchar_t, ...) c_int;
extern fn _wfdopen(_FileHandle: c_int, _Mode: [*c]const wchar_t) [*c]FILE;
extern fn _wfopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t) [*c]FILE;
extern fn _wfreopen(noalias _Filename: [*c]const wchar_t, noalias _Mode: [*c]const wchar_t, noalias _OldFile: [*c]FILE) [*c]FILE;
extern fn _wperror(_ErrMsg: [*c]const wchar_t) void;
extern fn _wpopen(_Command: [*c]const wchar_t, _Mode: [*c]const wchar_t) [*c]FILE;
extern fn _wremove(_Filename: [*c]const wchar_t) c_int;
extern fn _wtmpnam(_Buffer: [*c]wchar_t) [*c]wchar_t;
extern fn _fgetwc_nolock(_File: [*c]FILE) wint_t;
extern fn _fputwc_nolock(_Ch: wchar_t, _File: [*c]FILE) wint_t;
extern fn _ungetwc_nolock(_Ch: wint_t, _File: [*c]FILE) wint_t;
extern fn _lock_file(_File: [*c]FILE) void;
extern fn _unlock_file(_File: [*c]FILE) void;
extern fn _fclose_nolock(_File: [*c]FILE) c_int;
extern fn _fflush_nolock(_File: [*c]FILE) c_int;
extern fn _fread_nolock(noalias _DstBuf: ?*c_void, _ElementSize: usize, _Count: usize, noalias _File: [*c]FILE) usize;
extern fn _fseek_nolock(_File: [*c]FILE, _Offset: c_long, _Origin: c_int) c_int;
extern fn _ftell_nolock(_File: [*c]FILE) c_long;
extern fn _fseeki64_nolock(_File: [*c]FILE, _Offset: c_longlong, _Origin: c_int) c_int;
extern fn _ftelli64_nolock(_File: [*c]FILE) c_longlong;
extern fn _fwrite_nolock(noalias _DstBuf: ?*const c_void, _Size: usize, _Count: usize, noalias _File: [*c]FILE) usize;
extern fn _ungetc_nolock(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn tempnam(_Directory: [*c]const u8, _FilePrefix: [*c]const u8) [*c]u8;
extern fn fcloseall() c_int;
extern fn fdopen(_FileHandle: c_int, _Format: [*c]const u8) [*c]FILE;
extern fn fgetchar() c_int;
extern fn fileno(_File: [*c]FILE) c_int;
extern fn flushall() c_int;
extern fn fputchar(_Ch: c_int) c_int;
extern fn getw(_File: [*c]FILE) c_int;
extern fn putw(_Ch: c_int, _File: [*c]FILE) c_int;
extern fn rmtmp() c_int;
extern fn __mingw_str_wide_utf8(wptr: [*c]const wchar_t, mbptr: [*c][*c]u8, buflen: [*c]usize) c_int;
extern fn __mingw_str_utf8_wide(mbptr: [*c]const u8, wptr: [*c][*c]wchar_t, buflen: [*c]usize) c_int;
extern fn __mingw_str_free(ptr: ?*c_void) void;
extern fn _wspawnl(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
extern fn _wspawnle(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
extern fn _wspawnlp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
extern fn _wspawnlpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const wchar_t, ...) isize;
extern fn _wspawnv(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
extern fn _wspawnve(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
extern fn _wspawnvp(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t) isize;
extern fn _wspawnvpe(_Mode: c_int, _Filename: [*c]const wchar_t, _ArgList: [*c]const [*c]const wchar_t, _Env: [*c]const [*c]const wchar_t) isize;
extern fn _spawnv(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
extern fn _spawnve(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
extern fn _spawnvp(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8) isize;
extern fn _spawnvpe(_Mode: c_int, _Filename: [*c]const u8, _ArgList: [*c]const [*c]const u8, _Env: [*c]const [*c]const u8) isize;
extern fn clearerr_s(_File: [*c]FILE) errno_t;
extern fn fread_s(_DstBuf: ?*c_void, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
extern fn fprintf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
extern fn _fscanf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn fscanf_s(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
extern fn printf_s(_Format: [*c]const u8, ...) c_int;
extern fn _scanf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _scanf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn scanf_s(_Format: [*c]const u8, ...) c_int;
extern fn _snprintf_c(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
extern fn _vsnprintf_c(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _fscanf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _sscanf_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _sscanf_s_l(_Src: [*c]const u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn sscanf_s(_Src: [*c]const u8, _Format: [*c]const u8, ...) c_int;
extern fn _snscanf_s(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
extern fn _snscanf_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _snscanf_s_l(_Src: [*c]const u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn vfprintf_s(_File: [*c]FILE, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn vprintf_s(_Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn vsnprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _vsnprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn vsprintf_s(_DstBuf: [*c]u8, _Size: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn sprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, ...) c_int;
extern fn _snprintf_s(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
extern fn _fprintf_p(_File: [*c]FILE, _Format: [*c]const u8, ...) c_int;
extern fn _printf_p(_Format: [*c]const u8, ...) c_int;
extern fn _sprintf_p(_Dst: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, ...) c_int;
extern fn _vfprintf_p(_File: [*c]FILE, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _vprintf_p(_Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _vsprintf_p(_Dst: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _scprintf_p(_Format: [*c]const u8, ...) c_int;
extern fn _vscprintf_p(_Format: [*c]const u8, _ArgList: va_list) c_int;
extern fn _printf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _printf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vprintf_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fprintf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _fprintf_p_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vfprintf_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vfprintf_p_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _sprintf_l(_DstBuf: [*c]u8, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _sprintf_p_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vsprintf_l(_DstBuf: [*c]u8, _Format: [*c]const u8, _locale_t, _ArgList: va_list) c_int;
extern fn _vsprintf_p_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _scprintf_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _scprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vscprintf_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vscprintf_p_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _printf_s_l(_Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vprintf_s_l(_Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fprintf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vfprintf_s_l(_File: [*c]FILE, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _sprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vsprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _snprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vsnprintf_s_l(_DstBuf: [*c]u8, _DstSize: usize, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _snprintf_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _snprintf_c_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, ...) c_int;
extern fn _vsnprintf_l(_DstBuf: [*c]u8, _MaxCount: usize, _Format: [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vsnprintf_c_l(_DstBuf: [*c]u8, _MaxCount: usize, [*c]const u8, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn fopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8) errno_t;
extern fn freopen_s(_File: [*c][*c]FILE, _Filename: [*c]const u8, _Mode: [*c]const u8, _Stream: [*c]FILE) errno_t;
extern fn gets_s([*c]u8, rsize_t) [*c]u8;
extern fn tmpnam_s([*c]u8, rsize_t) errno_t;
extern fn _getws_s(_Str: [*c]wchar_t, _SizeInWords: usize) [*c]wchar_t;
extern fn fwprintf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
extern fn wprintf_s(_Format: [*c]const wchar_t, ...) c_int;
extern fn vfwprintf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn vwprintf_s(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn vswprintf_s(_Dst: [*c]wchar_t, _SizeInWords: usize, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn swprintf_s(_Dst: [*c]wchar_t, _SizeInWords: usize, _Format: [*c]const wchar_t, ...) c_int;
extern fn _vsnwprintf_s(_DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _snwprintf_s(_DstBuf: [*c]wchar_t, _DstSizeInWords: usize, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
extern fn _wprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vwprintf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fwprintf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vfwprintf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _swprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vswprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _snwprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vsnwprintf_s_l(_DstBuf: [*c]wchar_t, _DstSize: usize, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fwscanf_s_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn fwscanf_s(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
extern fn _swscanf_s_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn swscanf_s(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, ...) c_int;
extern fn _snwscanf_s(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
extern fn _snwscanf_s_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _wscanf_s_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn wscanf_s(_Format: [*c]const wchar_t, ...) c_int;
extern fn _wfopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t) errno_t;
extern fn _wfreopen_s(_File: [*c][*c]FILE, _Filename: [*c]const wchar_t, _Mode: [*c]const wchar_t, _OldFile: [*c]FILE) errno_t;
extern fn _wtmpnam_s(_DstBuf: [*c]wchar_t, _SizeInWords: usize) errno_t;
extern fn _fwprintf_p(_File: [*c]FILE, _Format: [*c]const wchar_t, ...) c_int;
extern fn _wprintf_p(_Format: [*c]const wchar_t, ...) c_int;
extern fn _vfwprintf_p(_File: [*c]FILE, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _vwprintf_p(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _swprintf_p(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, ...) c_int;
extern fn _vswprintf_p(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _scwprintf_p(_Format: [*c]const wchar_t, ...) c_int;
extern fn _vscwprintf_p(_Format: [*c]const wchar_t, _ArgList: va_list) c_int;
extern fn _wprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _wprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vwprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vwprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fwprintf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _fwprintf_p_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vfwprintf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vfwprintf_p_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _swprintf_c_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _swprintf_p_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vswprintf_c_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _vswprintf_p_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _scwprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _scwprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vscwprintf_p_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _snwprintf_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _vsnwprintf_l(_DstBuf: [*c]wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn __swprintf_l(_Dest: [*c]wchar_t, _Format: [*c]const wchar_t, _Plocinfo: _locale_t, ...) c_int;
extern fn __vswprintf_l(_Dest: [*c]wchar_t, _Format: [*c]const wchar_t, _Plocinfo: _locale_t, _Args: va_list) c_int;
extern fn _vscwprintf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, _ArgList: va_list) c_int;
extern fn _fwscanf_l(_File: [*c]FILE, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _swscanf_l(_Src: [*c]const wchar_t, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _snwscanf_l(_Src: [*c]const wchar_t, _MaxCount: usize, _Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _wscanf_l(_Format: [*c]const wchar_t, _Locale: _locale_t, ...) c_int;
extern fn _fread_nolock_s(_DstBuf: ?*c_void, _DstSize: usize, _ElementSize: usize, _Count: usize, _File: [*c]FILE) usize;
const int_least8_t = i8;
const uint_least8_t = u8;
const int_least16_t = c_short;
const uint_least16_t = c_ushort;
const int_least32_t = c_int;
const uint_least32_t = c_uint;
const int_least64_t = c_longlong;
const uint_least64_t = c_ulonglong;
const int_fast8_t = i8;
const uint_fast8_t = u8;
const int_fast16_t = c_short;
const uint_fast16_t = c_ushort;
const int_fast32_t = c_int;
const uint_fast32_t = c_uint;
const int_fast64_t = c_longlong;
const uint_fast64_t = c_ulonglong;
const intmax_t = c_longlong;
const uintmax_t = c_ulonglong;

pub const ImGuiID = c_uint;
pub const ImS8 = i8;
pub const ImGuiTableColumnIdx = ImS8; // cimgui.h:2220:10: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiTableColumnSettings = opaque {};
pub const ImGuiTableColumnSettings = struct_ImGuiTableColumnSettings;
pub const ImU32 = c_uint;
pub const struct_ImGuiTableCellData = extern struct {
    BgColor: ImU32,
    Column: ImGuiTableColumnIdx,
};
pub const ImGuiTableCellData = struct_ImGuiTableCellData;
pub const ImGuiViewportFlags = c_int;
pub const struct_ImVec2 = extern struct {
    pub const zero = struct_ImVec2{.x=0,.y=0};
    pub const one = struct_ImVec2{.x=1,.y=1};
    x: f32,
    y: f32,
};
pub const ImVec2 = struct_ImVec2;
pub const struct_ImGuiViewport = extern struct {
    Flags: ImGuiViewportFlags,
    Pos: ImVec2,
    Size: ImVec2,
    WorkPos: ImVec2,
    WorkSize: ImVec2,
};
pub const ImGuiViewport = struct_ImGuiViewport;
pub const struct_ImVec4 = extern struct {
    pub const white = struct_ImVec4{.x=1,.y=1,.z=1,.w=1};
    pub const black = struct_ImVec4{.x=0,.y=0,.z=0,.w=1};
    x: f32,
    y: f32,
    z: f32,
    w: f32,
};
pub const ImVec4 = struct_ImVec4;
pub const ImTextureID = ?*c_void;
pub const ImDrawCallback = ?fn ([*c]const ImDrawList, [*c]const ImDrawCmd) callconv(.C) void;
pub const struct_ImDrawCmd = extern struct {
    ClipRect: ImVec4,
    TextureId: ImTextureID,
    VtxOffset: c_uint,
    IdxOffset: c_uint,
    ElemCount: c_uint,
    UserCallback: ImDrawCallback,
    UserCallbackData: ?*c_void,
};
pub const ImDrawCmd = struct_ImDrawCmd;
pub const struct_ImVector_ImDrawCmd = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImDrawCmd,
};
pub const ImVector_ImDrawCmd = struct_ImVector_ImDrawCmd;
pub const ImDrawIdx = c_ushort;
pub const struct_ImVector_ImDrawIdx = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImDrawIdx,
};
pub const ImVector_ImDrawIdx = struct_ImVector_ImDrawIdx;
pub const struct_ImDrawVert = extern struct {
    pos: ImVec2,
    uv: ImVec2,
    col: ImU32,
};
pub const ImDrawVert = struct_ImDrawVert;
pub const struct_ImVector_ImDrawVert = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImDrawVert,
};
pub const ImVector_ImDrawVert = struct_ImVector_ImDrawVert;
pub const ImDrawListFlags = c_int;
pub const struct_ImVector_float = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]f32,
};
pub const ImVector_float = struct_ImVector_float;
pub const ImWchar16 = c_ushort;
pub const ImWchar = ImWchar16;
pub const struct_ImVector_ImWchar = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImWchar,
};
pub const ImVector_ImWchar = struct_ImVector_ImWchar; // cimgui.h:1124:18: warning: struct demoted to opaque type - has bitfield
pub const struct_ImFontGlyph = opaque {};
pub const ImFontGlyph = struct_ImFontGlyph;
pub const struct_ImVector_ImFontGlyph = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: ?*ImFontGlyph,
};
pub const ImVector_ImFontGlyph = struct_ImVector_ImFontGlyph;
pub const ImFontAtlasFlags = c_int;
pub const struct_ImVector_ImFontPtr = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c][*c]ImFont,
};
pub const ImVector_ImFontPtr = struct_ImVector_ImFontPtr;
pub const struct_ImFontAtlasCustomRect = extern struct {
    Width: c_ushort,
    Height: c_ushort,
    X: c_ushort,
    Y: c_ushort,
    GlyphID: c_uint,
    GlyphAdvanceX: f32,
    GlyphOffset: ImVec2,
    Font: [*c]ImFont,
};
pub const ImFontAtlasCustomRect = struct_ImFontAtlasCustomRect;
pub const struct_ImVector_ImFontAtlasCustomRect = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImFontAtlasCustomRect,
};
pub const ImVector_ImFontAtlasCustomRect = struct_ImVector_ImFontAtlasCustomRect;
pub const struct_ImFontConfig = extern struct {
    FontData: ?*c_void,
    FontDataSize: c_int,
    FontDataOwnedByAtlas: bool,
    FontNo: c_int,
    SizePixels: f32,
    OversampleH: c_int,
    OversampleV: c_int,
    PixelSnapH: bool,
    GlyphExtraSpacing: ImVec2,
    GlyphOffset: ImVec2,
    GlyphRanges: [*c]const ImWchar,
    GlyphMinAdvanceX: f32,
    GlyphMaxAdvanceX: f32,
    MergeMode: bool,
    FontBuilderFlags: c_uint,
    RasterizerMultiply: f32,
    EllipsisChar: ImWchar,
    Name: [40]u8,
    DstFont: [*c]ImFont,
};
pub const ImFontConfig = struct_ImFontConfig;
pub const struct_ImVector_ImFontConfig = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImFontConfig,
};
pub const ImVector_ImFontConfig = struct_ImVector_ImFontConfig;
pub const struct_ImFontBuilderIO = extern struct {
    FontBuilder_Build: ?fn ([*c]ImFontAtlas) callconv(.C) bool,
};
pub const ImFontBuilderIO = struct_ImFontBuilderIO;
pub const struct_ImFontAtlas = extern struct {
    Flags: ImFontAtlasFlags,
    TexID: ImTextureID,
    TexDesiredWidth: c_int,
    TexGlyphPadding: c_int,
    Locked: bool,
    TexPixelsUseColors: bool,
    TexPixelsAlpha8: [*c]u8,
    TexPixelsRGBA32: [*c]c_uint,
    TexWidth: c_int,
    TexHeight: c_int,
    TexUvScale: ImVec2,
    TexUvWhitePixel: ImVec2,
    Fonts: ImVector_ImFontPtr,
    CustomRects: ImVector_ImFontAtlasCustomRect,
    ConfigData: ImVector_ImFontConfig,
    TexUvLines: [64]ImVec4,
    FontBuilderIO: [*c]const ImFontBuilderIO,
    FontBuilderFlags: c_uint,
    PackIdMouseCursors: c_int,
    PackIdLines: c_int,
};
pub const ImFontAtlas = struct_ImFontAtlas;
pub const ImU8 = u8;
pub const struct_ImFont = extern struct {
    IndexAdvanceX: ImVector_float,
    FallbackAdvanceX: f32,
    FontSize: f32,
    IndexLookup: ImVector_ImWchar,
    Glyphs: ImVector_ImFontGlyph,
    FallbackGlyph: ?*const ImFontGlyph,
    ContainerAtlas: [*c]ImFontAtlas,
    ConfigData: [*c]const ImFontConfig,
    ConfigDataCount: c_short,
    FallbackChar: ImWchar,
    EllipsisChar: ImWchar,
    DirtyLookupTables: bool,
    Scale: f32,
    Ascent: f32,
    Descent: f32,
    MetricsTotalSurface: c_int,
    Used4kPagesMap: [2]ImU8,
};
pub const ImFont = struct_ImFont;
pub const struct_ImDrawListSharedData = extern struct {
    TexUvWhitePixel: ImVec2,
    Font: [*c]ImFont,
    FontSize: f32,
    CurveTessellationTol: f32,
    CircleSegmentMaxError: f32,
    ClipRectFullscreen: ImVec4,
    InitialFlags: ImDrawListFlags,
    ArcFastVtx: [48]ImVec2,
    ArcFastRadiusCutoff: f32,
    CircleSegmentCounts: [64]ImU8,
    TexUvLines: [*c]const ImVec4,
};
pub const ImDrawListSharedData = struct_ImDrawListSharedData;
pub const struct_ImVector_ImVec4 = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImVec4,
};
pub const ImVector_ImVec4 = struct_ImVector_ImVec4;
pub const struct_ImVector_ImTextureID = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImTextureID,
};
pub const ImVector_ImTextureID = struct_ImVector_ImTextureID;
pub const struct_ImVector_ImVec2 = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImVec2,
};
pub const ImVector_ImVec2 = struct_ImVector_ImVec2;
pub const struct_ImDrawCmdHeader = extern struct {
    ClipRect: ImVec4,
    TextureId: ImTextureID,
    VtxOffset: c_uint,
};
pub const ImDrawCmdHeader = struct_ImDrawCmdHeader;
pub const struct_ImDrawChannel = extern struct {
    _CmdBuffer: ImVector_ImDrawCmd,
    _IdxBuffer: ImVector_ImDrawIdx,
};
pub const ImDrawChannel = struct_ImDrawChannel;
pub const struct_ImVector_ImDrawChannel = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImDrawChannel,
};
pub const ImVector_ImDrawChannel = struct_ImVector_ImDrawChannel;
pub const struct_ImDrawListSplitter = extern struct {
    _Current: c_int,
    _Count: c_int,
    _Channels: ImVector_ImDrawChannel,
};
pub const ImDrawListSplitter = struct_ImDrawListSplitter;
pub const struct_ImDrawList = extern struct {
    CmdBuffer: ImVector_ImDrawCmd,
    IdxBuffer: ImVector_ImDrawIdx,
    VtxBuffer: ImVector_ImDrawVert,
    Flags: ImDrawListFlags,
    _VtxCurrentIdx: c_uint,
    _Data: [*c]const ImDrawListSharedData,
    _OwnerName: [*c]const u8,
    _VtxWritePtr: [*c]ImDrawVert,
    _IdxWritePtr: [*c]ImDrawIdx,
    _ClipRectStack: ImVector_ImVec4,
    _TextureIdStack: ImVector_ImTextureID,
    _Path: ImVector_ImVec2,
    _CmdHeader: ImDrawCmdHeader,
    _Splitter: ImDrawListSplitter,
    _FringeScale: f32,
};
pub const ImDrawList = struct_ImDrawList;
pub const struct_ImDrawData = extern struct {
    Valid: bool,
    CmdListsCount: c_int,
    TotalIdxCount: c_int,
    TotalVtxCount: c_int,
    CmdLists: [*c][*c]ImDrawList,
    DisplayPos: ImVec2,
    DisplaySize: ImVec2,
    FramebufferScale: ImVec2,
};
pub const ImDrawData = struct_ImDrawData;
pub const struct_ImVector_ImDrawListPtr = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c][*c]ImDrawList,
};
pub const ImVector_ImDrawListPtr = struct_ImVector_ImDrawListPtr;
pub const struct_ImDrawDataBuilder = extern struct {
    Layers: [2]ImVector_ImDrawListPtr,
};
pub const ImDrawDataBuilder = struct_ImDrawDataBuilder;
pub const struct_ImGuiViewportP = extern struct {
    _ImGuiViewport: ImGuiViewport,
    DrawListsLastFrame: [2]c_int,
    DrawLists: [2][*c]ImDrawList,
    DrawDataP: ImDrawData,
    DrawDataBuilder: ImDrawDataBuilder,
    WorkOffsetMin: ImVec2,
    WorkOffsetMax: ImVec2,
    CurrWorkOffsetMin: ImVec2,
    CurrWorkOffsetMax: ImVec2,
};
pub const ImGuiViewportP = struct_ImGuiViewportP;
pub const struct_ImGuiPtrOrIndex = extern struct {
    Ptr: ?*c_void,
    Index: c_int,
};
pub const ImGuiPtrOrIndex = struct_ImGuiPtrOrIndex;
pub const struct_ImGuiShrinkWidthItem = extern struct {
    Index: c_int,
    Width: f32,
};
pub const ImGuiShrinkWidthItem = struct_ImGuiShrinkWidthItem;
pub const struct_ImGuiDataTypeTempStorage = extern struct {
    Data: [8]ImU8,
};
pub const ImGuiDataTypeTempStorage = struct_ImGuiDataTypeTempStorage;
pub const struct_ImVec2ih = extern struct {
    x: c_short,
    y: c_short,
};
pub const ImVec2ih = struct_ImVec2ih;
pub const struct_ImVec1 = extern struct {
    x: f32,
};
pub const ImVec1 = struct_ImVec1;
pub const struct_StbTexteditRow = extern struct {
    x0: f32,
    x1: f32,
    baseline_y_delta: f32,
    ymin: f32,
    ymax: f32,
    num_chars: c_int,
};
pub const StbTexteditRow = struct_StbTexteditRow;
pub const struct_StbUndoRecord = extern struct {
    where: c_int,
    insert_length: c_int,
    delete_length: c_int,
    char_storage: c_int,
};
pub const StbUndoRecord = struct_StbUndoRecord;
pub const struct_StbUndoState = extern struct {
    undo_rec: [99]StbUndoRecord,
    undo_char: [999]ImWchar,
    undo_point: c_short,
    redo_point: c_short,
    undo_char_point: c_int,
    redo_char_point: c_int,
};
pub const StbUndoState = struct_StbUndoState;
pub const struct_STB_TexteditState = extern struct {
    cursor: c_int,
    select_start: c_int,
    select_end: c_int,
    insert_mode: u8,
    row_count_per_page: c_int,
    cursor_at_end_of_line: u8,
    initialized: u8,
    has_preferred_x: u8,
    single_line: u8,
    padding1: u8,
    padding2: u8,
    padding3: u8,
    preferred_x: f32,
    undostate: StbUndoState,
};
pub const STB_TexteditState = struct_STB_TexteditState;
pub const struct_ImGuiWindowSettings = extern struct {
    ID: ImGuiID,
    Pos: ImVec2ih,
    Size: ImVec2ih,
    Collapsed: bool,
    WantApply: bool,
};
pub const ImGuiWindowSettings = struct_ImGuiWindowSettings;
pub const ImGuiItemStatusFlags = c_int;
pub const struct_ImRect = extern struct {
    Min: ImVec2,
    Max: ImVec2,
};
pub const ImRect = struct_ImRect;
pub const struct_ImGuiMenuColumns = extern struct {
    Spacing: f32,
    Width: f32,
    NextWidth: f32,
    Pos: [3]f32,
    NextWidths: [3]f32,
};
pub const ImGuiMenuColumns = struct_ImGuiMenuColumns;
pub const ImGuiWindowFlags = c_int;
pub const ImGuiDir = c_int; // cimgui.h:1951:15: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiWindow = opaque {};
pub const ImGuiWindow = struct_ImGuiWindow;
pub const struct_ImVector_ImGuiWindowPtr = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]?*ImGuiWindow,
};
pub const ImVector_ImGuiWindowPtr = struct_ImVector_ImGuiWindowPtr;
const union_unnamed_2 = extern union {
    val_i: c_int,
    val_f: f32,
    val_p: ?*c_void,
};
pub const struct_ImGuiStoragePair = extern struct {
    key: ImGuiID,
    unnamed_0: union_unnamed_2,
};
pub const ImGuiStoragePair = struct_ImGuiStoragePair;
pub const struct_ImVector_ImGuiStoragePair = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiStoragePair,
};
pub const ImVector_ImGuiStoragePair = struct_ImVector_ImGuiStoragePair;
pub const struct_ImGuiStorage = extern struct {
    Data: ImVector_ImGuiStoragePair,
};
pub const ImGuiStorage = struct_ImGuiStorage;
pub const ImGuiOldColumnFlags = c_int;
pub const struct_ImGuiOldColumnData = extern struct {
    OffsetNorm: f32,
    OffsetNormBeforeResize: f32,
    Flags: ImGuiOldColumnFlags,
    ClipRect: ImRect,
};
pub const ImGuiOldColumnData = struct_ImGuiOldColumnData;
pub const struct_ImVector_ImGuiOldColumnData = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiOldColumnData,
};
pub const ImVector_ImGuiOldColumnData = struct_ImVector_ImGuiOldColumnData;
pub const struct_ImGuiOldColumns = extern struct {
    ID: ImGuiID,
    Flags: ImGuiOldColumnFlags,
    IsFirstFrame: bool,
    IsBeingResized: bool,
    Current: c_int,
    Count: c_int,
    OffMinX: f32,
    OffMaxX: f32,
    LineMinY: f32,
    LineMaxY: f32,
    HostCursorPosY: f32,
    HostCursorMaxPosX: f32,
    HostInitialClipRect: ImRect,
    HostBackupClipRect: ImRect,
    HostBackupParentWorkRect: ImRect,
    Columns: ImVector_ImGuiOldColumnData,
    Splitter: ImDrawListSplitter,
};
pub const ImGuiOldColumns = struct_ImGuiOldColumns;
pub const ImGuiLayoutType = c_int;
pub const ImGuiItemFlags = c_int;
pub const struct_ImGuiStackSizes = extern struct {
    SizeOfIDStack: c_short,
    SizeOfColorStack: c_short,
    SizeOfStyleVarStack: c_short,
    SizeOfFontStack: c_short,
    SizeOfFocusScopeStack: c_short,
    SizeOfGroupStack: c_short,
    SizeOfBeginPopupStack: c_short,
};
pub const ImGuiStackSizes = struct_ImGuiStackSizes;
pub const struct_ImGuiWindowTempData = extern struct {
    CursorPos: ImVec2,
    CursorPosPrevLine: ImVec2,
    CursorStartPos: ImVec2,
    CursorMaxPos: ImVec2,
    IdealMaxPos: ImVec2,
    CurrLineSize: ImVec2,
    PrevLineSize: ImVec2,
    CurrLineTextBaseOffset: f32,
    PrevLineTextBaseOffset: f32,
    Indent: ImVec1,
    ColumnsOffset: ImVec1,
    GroupOffset: ImVec1,
    LastItemId: ImGuiID,
    LastItemStatusFlags: ImGuiItemStatusFlags,
    LastItemRect: ImRect,
    LastItemDisplayRect: ImRect,
    NavLayerCurrent: ImGuiNavLayer,
    NavLayerActiveMask: c_int,
    NavLayerActiveMaskNext: c_int,
    NavFocusScopeIdCurrent: ImGuiID,
    NavHideHighlightOneFrame: bool,
    NavHasScroll: bool,
    MenuBarAppending: bool,
    MenuBarOffset: ImVec2,
    MenuColumns: ImGuiMenuColumns,
    TreeDepth: c_int,
    TreeJumpToParentOnPopMask: ImU32,
    ChildWindows: ImVector_ImGuiWindowPtr,
    StateStorage: [*c]ImGuiStorage,
    CurrentColumns: [*c]ImGuiOldColumns,
    CurrentTableIdx: c_int,
    LayoutType: ImGuiLayoutType,
    ParentLayoutType: ImGuiLayoutType,
    FocusCounterRegular: c_int,
    FocusCounterTabStop: c_int,
    ItemFlags: ImGuiItemFlags,
    ItemWidth: f32,
    TextWrapPos: f32,
    ItemWidthStack: ImVector_float,
    TextWrapPosStack: ImVector_float,
    StackSizesOnBegin: ImGuiStackSizes,
};
pub const ImGuiWindowTempData = struct_ImGuiWindowTempData;
pub const struct_ImGuiTableColumnsSettings = opaque {};
pub const ImGuiTableColumnsSettings = struct_ImGuiTableColumnsSettings;
pub const ImGuiTableFlags = c_int;
pub const struct_ImGuiTableSettings = extern struct {
    ID: ImGuiID,
    SaveFlags: ImGuiTableFlags,
    RefScale: f32,
    ColumnsCount: ImGuiTableColumnIdx,
    ColumnsCountMax: ImGuiTableColumnIdx,
    WantApply: bool,
};
pub const ImGuiTableSettings = struct_ImGuiTableSettings;
pub const ImGuiTableColumnFlags = c_int;
pub const ImS16 = c_short;
pub const ImGuiTableDrawChannelIdx = ImU8; // cimgui.h:2089:10: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiTableColumn = opaque {};
pub const ImGuiTableColumn = struct_ImGuiTableColumn;
pub const struct_ImSpan_ImGuiTableColumn = extern struct {
    Data: ?*ImGuiTableColumn,
    DataEnd: ?*ImGuiTableColumn,
};
pub const ImSpan_ImGuiTableColumn = struct_ImSpan_ImGuiTableColumn;
pub const struct_ImSpan_ImGuiTableColumnIdx = extern struct {
    Data: [*c]ImGuiTableColumnIdx,
    DataEnd: [*c]ImGuiTableColumnIdx,
};
pub const ImSpan_ImGuiTableColumnIdx = struct_ImSpan_ImGuiTableColumnIdx;
pub const struct_ImSpan_ImGuiTableCellData = extern struct {
    Data: [*c]ImGuiTableCellData,
    DataEnd: [*c]ImGuiTableCellData,
};
pub const ImSpan_ImGuiTableCellData = struct_ImSpan_ImGuiTableCellData;
pub const ImU64 = u64; // cimgui.h:2124:24: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiTable = opaque {};
pub const ImGuiTable = struct_ImGuiTable;
pub const ImGuiTabItemFlags = c_int;
pub const struct_ImGuiTabItem = extern struct {
    ID: ImGuiID,
    Flags: ImGuiTabItemFlags,
    LastFrameVisible: c_int,
    LastFrameSelected: c_int,
    Offset: f32,
    Width: f32,
    ContentWidth: f32,
    NameOffset: ImS16,
    BeginOrder: ImS16,
    IndexDuringLayout: ImS16,
    WantClose: bool,
};
pub const ImGuiTabItem = struct_ImGuiTabItem;
pub const struct_ImVector_ImGuiTabItem = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiTabItem,
};
pub const ImVector_ImGuiTabItem = struct_ImVector_ImGuiTabItem;
pub const ImGuiTabBarFlags = c_int;
pub const struct_ImVector_char = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]u8,
};
pub const ImVector_char = struct_ImVector_char;
pub const struct_ImGuiTextBuffer = extern struct {
    Buf: ImVector_char,
};
pub const ImGuiTextBuffer = struct_ImGuiTextBuffer;
pub const struct_ImGuiTabBar = extern struct {
    Tabs: ImVector_ImGuiTabItem,
    Flags: ImGuiTabBarFlags,
    ID: ImGuiID,
    SelectedTabId: ImGuiID,
    NextSelectedTabId: ImGuiID,
    VisibleTabId: ImGuiID,
    CurrFrameVisible: c_int,
    PrevFrameVisible: c_int,
    BarRect: ImRect,
    CurrTabsContentsHeight: f32,
    PrevTabsContentsHeight: f32,
    WidthAllTabs: f32,
    WidthAllTabsIdeal: f32,
    ScrollingAnim: f32,
    ScrollingTarget: f32,
    ScrollingTargetDistToVisibility: f32,
    ScrollingSpeed: f32,
    ScrollingRectMinX: f32,
    ScrollingRectMaxX: f32,
    ReorderRequestTabId: ImGuiID,
    ReorderRequestDir: ImS8,
    BeginCount: ImS8,
    WantLayout: bool,
    VisibleTabWasSubmitted: bool,
    TabsAddedNew: bool,
    TabsActiveCount: ImS16,
    LastTabItemIdx: ImS16,
    ItemSpacingY: f32,
    FramePadding: ImVec2,
    BackupCursorPos: ImVec2,
    TabsNames: ImGuiTextBuffer,
};
pub const ImGuiTabBar = struct_ImGuiTabBar;
pub const ImGuiStyleVar = c_int;
const union_unnamed_3 = extern union {
    BackupInt: [2]c_int,
    BackupFloat: [2]f32,
};
pub const struct_ImGuiStyleMod = extern struct {
    VarIdx: ImGuiStyleVar,
    unnamed_0: union_unnamed_3,
};
pub const ImGuiStyleMod = struct_ImGuiStyleMod;
pub const ImGuiConfigFlags = c_int;
pub const ImGuiBackendFlags = c_int;
pub const ImGuiKeyModFlags = c_int;
pub const struct_ImGuiIO = extern struct {
    ConfigFlags: ImGuiConfigFlags,
    BackendFlags: ImGuiBackendFlags,
    DisplaySize: ImVec2,
    DeltaTime: f32,
    IniSavingRate: f32,
    IniFilename: [*c]const u8,
    LogFilename: [*c]const u8,
    MouseDoubleClickTime: f32,
    MouseDoubleClickMaxDist: f32,
    MouseDragThreshold: f32,
    KeyMap: [22]c_int,
    KeyRepeatDelay: f32,
    KeyRepeatRate: f32,
    UserData: ?*c_void,
    Fonts: [*c]ImFontAtlas,
    FontGlobalScale: f32,
    FontAllowUserScaling: bool,
    FontDefault: [*c]ImFont,
    DisplayFramebufferScale: ImVec2,
    MouseDrawCursor: bool,
    ConfigMacOSXBehaviors: bool,
    ConfigInputTextCursorBlink: bool,
    ConfigDragClickToInputText: bool,
    ConfigWindowsResizeFromEdges: bool,
    ConfigWindowsMoveFromTitleBarOnly: bool,
    ConfigMemoryCompactTimer: f32,
    BackendPlatformName: [*c]const u8,
    BackendRendererName: [*c]const u8,
    BackendPlatformUserData: ?*c_void,
    BackendRendererUserData: ?*c_void,
    BackendLanguageUserData: ?*c_void,
    GetClipboardTextFn: ?fn (?*c_void) callconv(.C) [*c]const u8,
    SetClipboardTextFn: ?fn (?*c_void, [*c]const u8) callconv(.C) void,
    ClipboardUserData: ?*c_void,
    ImeSetInputScreenPosFn: ?fn (c_int, c_int) callconv(.C) void,
    ImeWindowHandle: ?*c_void,
    MousePos: ImVec2,
    MouseDown: [5]bool,
    MouseWheel: f32,
    MouseWheelH: f32,
    KeyCtrl: bool,
    KeyShift: bool,
    KeyAlt: bool,
    KeySuper: bool,
    KeysDown: [512]bool,
    NavInputs: [21]f32,
    WantCaptureMouse: bool,
    WantCaptureKeyboard: bool,
    WantTextInput: bool,
    WantSetMousePos: bool,
    WantSaveIniSettings: bool,
    NavActive: bool,
    NavVisible: bool,
    Framerate: f32,
    MetricsRenderVertices: c_int,
    MetricsRenderIndices: c_int,
    MetricsRenderWindows: c_int,
    MetricsActiveWindows: c_int,
    MetricsActiveAllocations: c_int,
    MouseDelta: ImVec2,
    KeyMods: ImGuiKeyModFlags,
    MousePosPrev: ImVec2,
    MouseClickedPos: [5]ImVec2,
    MouseClickedTime: [5]f64,
    MouseClicked: [5]bool,
    MouseDoubleClicked: [5]bool,
    MouseReleased: [5]bool,
    MouseDownOwned: [5]bool,
    MouseDownWasDoubleClick: [5]bool,
    MouseDownDuration: [5]f32,
    MouseDownDurationPrev: [5]f32,
    MouseDragMaxDistanceAbs: [5]ImVec2,
    MouseDragMaxDistanceSqr: [5]f32,
    KeysDownDuration: [512]f32,
    KeysDownDurationPrev: [512]f32,
    NavInputsDownDuration: [21]f32,
    NavInputsDownDurationPrev: [21]f32,
    PenPressure: f32,
    InputQueueSurrogate: ImWchar16,
    InputQueueCharacters: ImVector_ImWchar,
};
pub const ImGuiIO = struct_ImGuiIO;
pub const struct_ImGuiStyle = extern struct {
    Alpha: f32,
    WindowPadding: ImVec2,
    WindowRounding: f32,
    WindowBorderSize: f32,
    WindowMinSize: ImVec2,
    WindowTitleAlign: ImVec2,
    WindowMenuButtonPosition: ImGuiDir,
    ChildRounding: f32,
    ChildBorderSize: f32,
    PopupRounding: f32,
    PopupBorderSize: f32,
    FramePadding: ImVec2,
    FrameRounding: f32,
    FrameBorderSize: f32,
    ItemSpacing: ImVec2,
    ItemInnerSpacing: ImVec2,
    CellPadding: ImVec2,
    TouchExtraPadding: ImVec2,
    IndentSpacing: f32,
    ColumnsMinSpacing: f32,
    ScrollbarSize: f32,
    ScrollbarRounding: f32,
    GrabMinSize: f32,
    GrabRounding: f32,
    LogSliderDeadzone: f32,
    TabRounding: f32,
    TabBorderSize: f32,
    TabMinWidthForCloseButton: f32,
    ColorButtonPosition: ImGuiDir,
    ButtonTextAlign: ImVec2,
    SelectableTextAlign: ImVec2,
    DisplayWindowPadding: ImVec2,
    DisplaySafeAreaPadding: ImVec2,
    MouseCursorScale: f32,
    AntiAliasedLines: bool,
    AntiAliasedLinesUseTex: bool,
    AntiAliasedFill: bool,
    CurveTessellationTol: f32,
    CircleTessellationMaxError: f32,
    Colors: [53]ImVec4,
};
pub const ImGuiStyle = struct_ImGuiStyle;
pub const ImGuiNextWindowDataFlags = c_int;
pub const ImGuiCond = c_int;
pub const struct_ImGuiSizeCallbackData = extern struct {
    UserData: ?*c_void,
    Pos: ImVec2,
    CurrentSize: ImVec2,
    DesiredSize: ImVec2,
};
pub const ImGuiSizeCallbackData = struct_ImGuiSizeCallbackData;
pub const ImGuiSizeCallback = ?fn ([*c]ImGuiSizeCallbackData) callconv(.C) void;
pub const struct_ImGuiNextWindowData = extern struct {
    Flags: ImGuiNextWindowDataFlags,
    PosCond: ImGuiCond,
    SizeCond: ImGuiCond,
    CollapsedCond: ImGuiCond,
    PosVal: ImVec2,
    PosPivotVal: ImVec2,
    SizeVal: ImVec2,
    ContentSizeVal: ImVec2,
    ScrollVal: ImVec2,
    CollapsedVal: bool,
    SizeConstraintRect: ImRect,
    SizeCallback: ImGuiSizeCallback,
    SizeCallbackUserData: ?*c_void,
    BgAlphaVal: f32,
    MenuBarOffsetMinVal: ImVec2,
};
pub const ImGuiNextWindowData = struct_ImGuiNextWindowData;
pub const ImGuiNextItemDataFlags = c_int;
pub const struct_ImGuiNextItemData = extern struct {
    Flags: ImGuiNextItemDataFlags,
    Width: f32,
    FocusScopeId: ImGuiID,
    OpenCond: ImGuiCond,
    OpenVal: bool,
};
pub const ImGuiNextItemData = struct_ImGuiNextItemData;
pub const ImGuiCol = c_int;
pub const struct_ImGuiColorMod = extern struct {
    Col: ImGuiCol,
    BackupValue: ImVec4,
};
pub const ImGuiColorMod = struct_ImGuiColorMod;
pub const struct_ImVector_ImGuiColorMod = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiColorMod,
};
pub const ImVector_ImGuiColorMod = struct_ImVector_ImGuiColorMod;
pub const struct_ImVector_ImGuiStyleMod = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiStyleMod,
};
pub const ImVector_ImGuiStyleMod = struct_ImVector_ImGuiStyleMod;
pub const struct_ImVector_ImGuiID = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiID,
};
pub const ImVector_ImGuiID = struct_ImVector_ImGuiID;
pub const struct_ImVector_ImGuiItemFlags = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiItemFlags,
};
pub const ImVector_ImGuiItemFlags = struct_ImVector_ImGuiItemFlags;
pub const struct_ImGuiGroupData = extern struct {
    WindowID: ImGuiID,
    BackupCursorPos: ImVec2,
    BackupCursorMaxPos: ImVec2,
    BackupIndent: ImVec1,
    BackupGroupOffset: ImVec1,
    BackupCurrLineSize: ImVec2,
    BackupCurrLineTextBaseOffset: f32,
    BackupActiveIdIsAlive: ImGuiID,
    BackupActiveIdPreviousFrameIsAlive: bool,
    BackupHoveredIdIsAlive: bool,
    EmitItem: bool,
};
pub const ImGuiGroupData = struct_ImGuiGroupData;
pub const struct_ImVector_ImGuiGroupData = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiGroupData,
};
pub const ImVector_ImGuiGroupData = struct_ImVector_ImGuiGroupData;
pub const struct_ImGuiPopupData = extern struct {
    PopupId: ImGuiID,
    Window: ?*ImGuiWindow,
    SourceWindow: ?*ImGuiWindow,
    OpenFrameCount: c_int,
    OpenParentId: ImGuiID,
    OpenPopupPos: ImVec2,
    OpenMousePos: ImVec2,
};
pub const ImGuiPopupData = struct_ImGuiPopupData;
pub const struct_ImVector_ImGuiPopupData = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiPopupData,
};
pub const ImVector_ImGuiPopupData = struct_ImVector_ImGuiPopupData;
pub const struct_ImVector_ImGuiViewportPPtr = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c][*c]ImGuiViewportP,
};
pub const ImVector_ImGuiViewportPPtr = struct_ImVector_ImGuiViewportPPtr;
pub const ImGuiNavMoveFlags = c_int;
pub const struct_ImGuiNavMoveResult = extern struct {
    Window: ?*ImGuiWindow,
    ID: ImGuiID,
    FocusScopeId: ImGuiID,
    DistBox: f32,
    DistCenter: f32,
    DistAxial: f32,
    RectRel: ImRect,
};
pub const ImGuiNavMoveResult = struct_ImGuiNavMoveResult;
pub const ImGuiMouseCursor = c_int;
pub const ImGuiDragDropFlags = c_int;
pub const struct_ImGuiPayload = extern struct {
    Data: ?*c_void,
    DataSize: c_int,
    SourceId: ImGuiID,
    SourceParentId: ImGuiID,
    DataFrameCount: c_int,
    DataType: [33]u8,
    Preview: bool,
    Delivery: bool,
};
pub const ImGuiPayload = struct_ImGuiPayload;
pub const struct_ImVector_unsigned_char = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]u8,
};
pub const ImVector_unsigned_char = struct_ImVector_unsigned_char;
pub const struct_ImVector_ImGuiTable = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: ?*ImGuiTable,
};
pub const ImVector_ImGuiTable = struct_ImVector_ImGuiTable;
pub const ImPoolIdx = c_int;
pub const struct_ImPool_ImGuiTable = extern struct {
    Buf: ImVector_ImGuiTable,
    Map: ImGuiStorage,
    FreeIdx: ImPoolIdx,
};
pub const ImPool_ImGuiTable = struct_ImPool_ImGuiTable;
pub const struct_ImVector_ImGuiPtrOrIndex = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiPtrOrIndex,
};
pub const ImVector_ImGuiPtrOrIndex = struct_ImVector_ImGuiPtrOrIndex;
pub const struct_ImVector_ImGuiTabBar = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiTabBar,
};
pub const ImVector_ImGuiTabBar = struct_ImVector_ImGuiTabBar;
pub const struct_ImPool_ImGuiTabBar = extern struct {
    Buf: ImVector_ImGuiTabBar,
    Map: ImGuiStorage,
    FreeIdx: ImPoolIdx,
};
pub const ImPool_ImGuiTabBar = struct_ImPool_ImGuiTabBar;
pub const struct_ImVector_ImGuiShrinkWidthItem = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiShrinkWidthItem,
};
pub const ImVector_ImGuiShrinkWidthItem = struct_ImVector_ImGuiShrinkWidthItem;
pub const ImGuiInputTextFlags = c_int;
pub const ImGuiKey = c_int;
pub const struct_ImGuiInputTextCallbackData = extern struct {
    EventFlag: ImGuiInputTextFlags,
    Flags: ImGuiInputTextFlags,
    UserData: ?*c_void,
    EventChar: ImWchar,
    EventKey: ImGuiKey,
    Buf: [*c]u8,
    BufTextLen: c_int,
    BufSize: c_int,
    BufDirty: bool,
    CursorPos: c_int,
    SelectionStart: c_int,
    SelectionEnd: c_int,
};
pub const ImGuiInputTextCallbackData = struct_ImGuiInputTextCallbackData;
pub const ImGuiInputTextCallback = ?fn ([*c]ImGuiInputTextCallbackData) callconv(.C) c_int;
pub const struct_ImGuiInputTextState = extern struct {
    ID: ImGuiID,
    CurLenW: c_int,
    CurLenA: c_int,
    TextW: ImVector_ImWchar,
    TextA: ImVector_char,
    InitialTextA: ImVector_char,
    TextAIsValid: bool,
    BufCapacityA: c_int,
    ScrollX: f32,
    Stb: STB_TexteditState,
    CursorAnim: f32,
    CursorFollow: bool,
    SelectedAllMouseLock: bool,
    Edited: bool,
    UserFlags: ImGuiInputTextFlags,
    UserCallback: ImGuiInputTextCallback,
    UserCallbackData: ?*c_void,
};
pub const ImGuiInputTextState = struct_ImGuiInputTextState;
pub const ImGuiColorEditFlags = c_int;
pub const ImGuiSettingsHandler = struct_ImGuiSettingsHandler;
pub const struct_ImVector_ImGuiSettingsHandler = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiSettingsHandler,
};
pub const ImVector_ImGuiSettingsHandler = struct_ImVector_ImGuiSettingsHandler;
pub const struct_ImVector_ImGuiWindowSettings = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiWindowSettings,
};
pub const ImVector_ImGuiWindowSettings = struct_ImVector_ImGuiWindowSettings;
pub const struct_ImChunkStream_ImGuiWindowSettings = extern struct {
    Buf: ImVector_ImGuiWindowSettings,
};
pub const ImChunkStream_ImGuiWindowSettings = struct_ImChunkStream_ImGuiWindowSettings;
pub const struct_ImVector_ImGuiTableSettings = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiTableSettings,
};
pub const ImVector_ImGuiTableSettings = struct_ImVector_ImGuiTableSettings;
pub const struct_ImChunkStream_ImGuiTableSettings = extern struct {
    Buf: ImVector_ImGuiTableSettings,
};
pub const ImChunkStream_ImGuiTableSettings = struct_ImChunkStream_ImGuiTableSettings;
pub const ImGuiContextHookCallback = ?fn ([*c]ImGuiContext, [*c]ImGuiContextHook) callconv(.C) void;
pub const struct_ImGuiContextHook = extern struct {
    HookId: ImGuiID,
    Type: ImGuiContextHookType,
    Owner: ImGuiID,
    Callback: ImGuiContextHookCallback,
    UserData: ?*c_void,
};
pub const ImGuiContextHook = struct_ImGuiContextHook;
pub const struct_ImVector_ImGuiContextHook = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiContextHook,
};
pub const ImVector_ImGuiContextHook = struct_ImVector_ImGuiContextHook;
pub const ImFileHandle = [*c]FILE;
pub const struct_ImGuiMetricsConfig = extern struct {
    ShowWindowsRects: bool,
    ShowWindowsBeginOrder: bool,
    ShowTablesRects: bool,
    ShowDrawCmdMesh: bool,
    ShowDrawCmdBoundingBoxes: bool,
    ShowWindowsRectsType: c_int,
    ShowTablesRectsType: c_int,
};
pub const ImGuiMetricsConfig = struct_ImGuiMetricsConfig;
pub const struct_ImGuiContext = extern struct {
    Initialized: bool,
    FontAtlasOwnedByContext: bool,
    IO: ImGuiIO,
    Style: ImGuiStyle,
    Font: [*c]ImFont,
    FontSize: f32,
    FontBaseSize: f32,
    DrawListSharedData: ImDrawListSharedData,
    Time: f64,
    FrameCount: c_int,
    FrameCountEnded: c_int,
    FrameCountRendered: c_int,
    WithinFrameScope: bool,
    WithinFrameScopeWithImplicitWindow: bool,
    WithinEndChild: bool,
    GcCompactAll: bool,
    TestEngineHookItems: bool,
    TestEngineHookIdInfo: ImGuiID,
    TestEngine: ?*c_void,
    Windows: ImVector_ImGuiWindowPtr,
    WindowsFocusOrder: ImVector_ImGuiWindowPtr,
    WindowsTempSortBuffer: ImVector_ImGuiWindowPtr,
    CurrentWindowStack: ImVector_ImGuiWindowPtr,
    WindowsById: ImGuiStorage,
    WindowsActiveCount: c_int,
    CurrentWindow: ?*ImGuiWindow,
    HoveredWindow: ?*ImGuiWindow,
    HoveredWindowUnderMovingWindow: ?*ImGuiWindow,
    MovingWindow: ?*ImGuiWindow,
    WheelingWindow: ?*ImGuiWindow,
    WheelingWindowRefMousePos: ImVec2,
    WheelingWindowTimer: f32,
    HoveredId: ImGuiID,
    HoveredIdPreviousFrame: ImGuiID,
    HoveredIdAllowOverlap: bool,
    HoveredIdUsingMouseWheel: bool,
    HoveredIdPreviousFrameUsingMouseWheel: bool,
    HoveredIdDisabled: bool,
    HoveredIdTimer: f32,
    HoveredIdNotActiveTimer: f32,
    ActiveId: ImGuiID,
    ActiveIdIsAlive: ImGuiID,
    ActiveIdTimer: f32,
    ActiveIdIsJustActivated: bool,
    ActiveIdAllowOverlap: bool,
    ActiveIdNoClearOnFocusLoss: bool,
    ActiveIdHasBeenPressedBefore: bool,
    ActiveIdHasBeenEditedBefore: bool,
    ActiveIdHasBeenEditedThisFrame: bool,
    ActiveIdUsingMouseWheel: bool,
    ActiveIdUsingNavDirMask: ImU32,
    ActiveIdUsingNavInputMask: ImU32,
    ActiveIdUsingKeyInputMask: ImU64,
    ActiveIdClickOffset: ImVec2,
    ActiveIdWindow: ?*ImGuiWindow,
    ActiveIdSource: ImGuiInputSource,
    ActiveIdMouseButton: c_int,
    ActiveIdPreviousFrame: ImGuiID,
    ActiveIdPreviousFrameIsAlive: bool,
    ActiveIdPreviousFrameHasBeenEditedBefore: bool,
    ActiveIdPreviousFrameWindow: ?*ImGuiWindow,
    LastActiveId: ImGuiID,
    LastActiveIdTimer: f32,
    NextWindowData: ImGuiNextWindowData,
    NextItemData: ImGuiNextItemData,
    ColorStack: ImVector_ImGuiColorMod,
    StyleVarStack: ImVector_ImGuiStyleMod,
    FontStack: ImVector_ImFontPtr,
    FocusScopeStack: ImVector_ImGuiID,
    ItemFlagsStack: ImVector_ImGuiItemFlags,
    GroupStack: ImVector_ImGuiGroupData,
    OpenPopupStack: ImVector_ImGuiPopupData,
    BeginPopupStack: ImVector_ImGuiPopupData,
    Viewports: ImVector_ImGuiViewportPPtr,
    NavWindow: ?*ImGuiWindow,
    NavId: ImGuiID,
    NavFocusScopeId: ImGuiID,
    NavActivateId: ImGuiID,
    NavActivateDownId: ImGuiID,
    NavActivatePressedId: ImGuiID,
    NavInputId: ImGuiID,
    NavJustTabbedId: ImGuiID,
    NavJustMovedToId: ImGuiID,
    NavJustMovedToFocusScopeId: ImGuiID,
    NavJustMovedToKeyMods: ImGuiKeyModFlags,
    NavNextActivateId: ImGuiID,
    NavInputSource: ImGuiInputSource,
    NavScoringRect: ImRect,
    NavScoringCount: c_int,
    NavLayer: ImGuiNavLayer,
    NavIdTabCounter: c_int,
    NavIdIsAlive: bool,
    NavMousePosDirty: bool,
    NavDisableHighlight: bool,
    NavDisableMouseHover: bool,
    NavAnyRequest: bool,
    NavInitRequest: bool,
    NavInitRequestFromMove: bool,
    NavInitResultId: ImGuiID,
    NavInitResultRectRel: ImRect,
    NavMoveRequest: bool,
    NavMoveRequestFlags: ImGuiNavMoveFlags,
    NavMoveRequestForward: ImGuiNavForward,
    NavMoveRequestKeyMods: ImGuiKeyModFlags,
    NavMoveDir: ImGuiDir,
    NavMoveDirLast: ImGuiDir,
    NavMoveClipDir: ImGuiDir,
    NavMoveResultLocal: ImGuiNavMoveResult,
    NavMoveResultLocalVisibleSet: ImGuiNavMoveResult,
    NavMoveResultOther: ImGuiNavMoveResult,
    NavWrapRequestWindow: ?*ImGuiWindow,
    NavWrapRequestFlags: ImGuiNavMoveFlags,
    NavWindowingTarget: ?*ImGuiWindow,
    NavWindowingTargetAnim: ?*ImGuiWindow,
    NavWindowingListWindow: ?*ImGuiWindow,
    NavWindowingTimer: f32,
    NavWindowingHighlightAlpha: f32,
    NavWindowingToggleLayer: bool,
    TabFocusRequestCurrWindow: ?*ImGuiWindow,
    TabFocusRequestNextWindow: ?*ImGuiWindow,
    TabFocusRequestCurrCounterRegular: c_int,
    TabFocusRequestCurrCounterTabStop: c_int,
    TabFocusRequestNextCounterRegular: c_int,
    TabFocusRequestNextCounterTabStop: c_int,
    TabFocusPressed: bool,
    DimBgRatio: f32,
    MouseCursor: ImGuiMouseCursor,
    DragDropActive: bool,
    DragDropWithinSource: bool,
    DragDropWithinTarget: bool,
    DragDropSourceFlags: ImGuiDragDropFlags,
    DragDropSourceFrameCount: c_int,
    DragDropMouseButton: c_int,
    DragDropPayload: ImGuiPayload,
    DragDropTargetRect: ImRect,
    DragDropTargetId: ImGuiID,
    DragDropAcceptFlags: ImGuiDragDropFlags,
    DragDropAcceptIdCurrRectSurface: f32,
    DragDropAcceptIdCurr: ImGuiID,
    DragDropAcceptIdPrev: ImGuiID,
    DragDropAcceptFrameCount: c_int,
    DragDropHoldJustPressedId: ImGuiID,
    DragDropPayloadBufHeap: ImVector_unsigned_char,
    DragDropPayloadBufLocal: [16]u8,
    CurrentTable: ?*ImGuiTable,
    Tables: ImPool_ImGuiTable,
    CurrentTableStack: ImVector_ImGuiPtrOrIndex,
    TablesLastTimeActive: ImVector_float,
    DrawChannelsTempMergeBuffer: ImVector_ImDrawChannel,
    CurrentTabBar: [*c]ImGuiTabBar,
    TabBars: ImPool_ImGuiTabBar,
    CurrentTabBarStack: ImVector_ImGuiPtrOrIndex,
    ShrinkWidthBuffer: ImVector_ImGuiShrinkWidthItem,
    LastValidMousePos: ImVec2,
    InputTextState: ImGuiInputTextState,
    InputTextPasswordFont: ImFont,
    TempInputId: ImGuiID,
    ColorEditOptions: ImGuiColorEditFlags,
    ColorEditLastHue: f32,
    ColorEditLastSat: f32,
    ColorEditLastColor: [3]f32,
    ColorPickerRef: ImVec4,
    SliderCurrentAccum: f32,
    SliderCurrentAccumDirty: bool,
    DragCurrentAccumDirty: bool,
    DragCurrentAccum: f32,
    DragSpeedDefaultRatio: f32,
    ScrollbarClickDeltaToGrabCenter: f32,
    TooltipOverrideCount: c_int,
    TooltipSlowDelay: f32,
    ClipboardHandlerData: ImVector_char,
    MenusIdSubmittedThisFrame: ImVector_ImGuiID,
    PlatformImePos: ImVec2,
    PlatformImeLastPos: ImVec2,
    PlatformLocaleDecimalPoint: u8,
    SettingsLoaded: bool,
    SettingsDirtyTimer: f32,
    SettingsIniData: ImGuiTextBuffer,
    SettingsHandlers: ImVector_ImGuiSettingsHandler,
    SettingsWindows: ImChunkStream_ImGuiWindowSettings,
    SettingsTables: ImChunkStream_ImGuiTableSettings,
    Hooks: ImVector_ImGuiContextHook,
    HookIdNext: ImGuiID,
    LogEnabled: bool,
    LogType: ImGuiLogType,
    LogFile: ImFileHandle,
    LogBuffer: ImGuiTextBuffer,
    LogNextPrefix: [*c]const u8,
    LogNextSuffix: [*c]const u8,
    LogLinePosY: f32,
    LogLineFirstItem: bool,
    LogDepthRef: c_int,
    LogDepthToExpand: c_int,
    LogDepthToExpandDefault: c_int,
    DebugItemPickerActive: bool,
    DebugItemPickerBreakId: ImGuiID,
    DebugMetricsConfig: ImGuiMetricsConfig,
    FramerateSecPerFrame: [120]f32,
    FramerateSecPerFrameIdx: c_int,
    FramerateSecPerFrameAccum: f32,
    WantCaptureMouseNextFrame: c_int,
    WantCaptureKeyboardNextFrame: c_int,
    WantTextInputNextFrame: c_int,
    TempBuffer: [3073]u8,
};
pub const ImGuiContext = struct_ImGuiContext;
pub const struct_ImGuiSettingsHandler = extern struct {
    TypeName: [*c]const u8,
    TypeHash: ImGuiID,
    ClearAllFn: ?fn ([*c]ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void,
    ReadInitFn: ?fn ([*c]ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void,
    ReadOpenFn: ?fn ([*c]ImGuiContext, [*c]ImGuiSettingsHandler, [*c]const u8) callconv(.C) ?*c_void,
    ReadLineFn: ?fn ([*c]ImGuiContext, [*c]ImGuiSettingsHandler, ?*c_void, [*c]const u8) callconv(.C) void,
    ApplyAllFn: ?fn ([*c]ImGuiContext, [*c]ImGuiSettingsHandler) callconv(.C) void,
    WriteAllFn: ?fn ([*c]ImGuiContext, [*c]ImGuiSettingsHandler, [*c]ImGuiTextBuffer) callconv(.C) void,
    UserData: ?*c_void,
};
pub const struct_ImGuiLastItemDataBackup = extern struct {
    LastItemId: ImGuiID,
    LastItemStatusFlags: ImGuiItemStatusFlags,
    LastItemRect: ImRect,
    LastItemDisplayRect: ImRect,
};
pub const ImGuiLastItemDataBackup = struct_ImGuiLastItemDataBackup;
pub const struct_ImGuiDataTypeInfo = extern struct {
    Size: usize,
    Name: [*c]const u8,
    PrintFmt: [*c]const u8,
    ScanFmt: [*c]const u8,
};
pub const ImGuiDataTypeInfo = struct_ImGuiDataTypeInfo;
pub const struct_ImVector_ImU32 = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImU32,
};
pub const ImVector_ImU32 = struct_ImVector_ImU32;
pub const struct_ImBitVector = extern struct {
    Storage: ImVector_ImU32,
};
pub const ImBitVector = struct_ImBitVector;
pub const struct_ImGuiTextRange = extern struct {
    b: [*c]const u8,
    e: [*c]const u8,
};
pub const ImGuiTextRange = struct_ImGuiTextRange;
pub const struct_ImVector_ImGuiTextRange = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiTextRange,
};
pub const ImVector_ImGuiTextRange = struct_ImVector_ImGuiTextRange;
pub const struct_ImGuiTextFilter = extern struct {
    InputBuf: [256]u8,
    Filters: ImVector_ImGuiTextRange,
    CountGrep: c_int,
};
pub const ImGuiTextFilter = struct_ImGuiTextFilter; // cimgui.h:961:24: warning: struct demoted to opaque type - has bitfield
pub const struct_ImGuiTableColumnSortSpecs = opaque {};
pub const ImGuiTableColumnSortSpecs = struct_ImGuiTableColumnSortSpecs;
pub const struct_ImGuiTableSortSpecs = extern struct {
    Specs: ?*const ImGuiTableColumnSortSpecs,
    SpecsCount: c_int,
    SpecsDirty: bool,
};
pub const ImGuiTableSortSpecs = struct_ImGuiTableSortSpecs;
pub const struct_ImGuiOnceUponAFrame = extern struct {
    RefFrame: c_int,
};
pub const ImGuiOnceUponAFrame = struct_ImGuiOnceUponAFrame;
pub const struct_ImGuiListClipper = extern struct {
    DisplayStart: c_int,
    DisplayEnd: c_int,
    ItemsCount: c_int,
    StepNo: c_int,
    ItemsFrozen: c_int,
    ItemsHeight: f32,
    StartPosY: f32,
};
pub const ImGuiListClipper = struct_ImGuiListClipper;
pub const struct_ImColor = extern struct {
    Value: ImVec4,
};
pub const ImColor = struct_ImColor;
pub const struct_ImFontGlyphRangesBuilder = extern struct {
    UsedChars: ImVector_ImU32,
};
pub const ImFontGlyphRangesBuilder = struct_ImFontGlyphRangesBuilder;
pub const ImGuiDataType = c_int;
pub const ImGuiNavInput = c_int;
pub const ImGuiMouseButton = c_int;
pub const ImGuiSortDirection = c_int;
pub const ImGuiTableBgTarget = c_int;
pub const ImDrawFlags = c_int;
pub const ImGuiButtonFlags = c_int;
pub const ImGuiComboFlags = c_int;
pub const ImGuiFocusedFlags = c_int;
pub const ImGuiHoveredFlags = c_int;
pub const ImGuiPopupFlags = c_int;
pub const ImGuiSelectableFlags = c_int;
pub const ImGuiSliderFlags = c_int;
pub const ImGuiTableRowFlags = c_int;
pub const ImGuiTreeNodeFlags = c_int;
pub const ImGuiMemAllocFunc = ?fn (usize, ?*c_void) callconv(.C) ?*c_void;
pub const ImGuiMemFreeFunc = ?fn (?*c_void, ?*c_void) callconv(.C) void;
pub const ImWchar32 = c_uint;
pub const ImU16 = c_ushort;
pub const ImS32 = c_int;
pub const ImS64 = i64;
pub const ImGuiNavHighlightFlags = c_int;
pub const ImGuiNavDirSourceFlags = c_int;
pub const ImGuiSeparatorFlags = c_int;
pub const ImGuiTextFlags = c_int;
pub const ImGuiTooltipFlags = c_int;
pub const ImGuiErrorLogCallback = ?fn (?*c_void, [*c]const u8, ...) callconv(.C) void;
pub extern var GImGui: [*c]ImGuiContext;
pub const struct_ImVector = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: ?*c_void,
};
pub const ImVector = struct_ImVector;
pub const struct_ImVector_ImGuiOldColumns = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: [*c]ImGuiOldColumns,
};
pub const ImVector_ImGuiOldColumns = struct_ImVector_ImGuiOldColumns;
pub const struct_ImVector_ImGuiTableColumnSortSpecs = extern struct {
    Size: c_int,
    Capacity: c_int,
    Data: ?*ImGuiTableColumnSortSpecs,
};
pub const ImVector_ImGuiTableColumnSortSpecs = struct_ImVector_ImGuiTableColumnSortSpecs;
pub const ImGuiWindowFlags_ = extern enum(c_int) {
    None = 0,
    NoTitleBar = 1,
    NoResize = 2,
    NoMove = 4,
    NoScrollbar = 8,
    NoScrollWithMouse = 16,
    NoCollapse = 32,
    AlwaysAutoResize = 64,
    NoBackground = 128,
    NoSavedSettings = 256,
    NoMouseInputs = 512,
    MenuBar = 1024,
    HorizontalScrollbar = 2048,
    NoFocusOnAppearing = 4096,
    NoBringToFrontOnFocus = 8192,
    AlwaysVerticalScrollbar = 16384,
    AlwaysHorizontalScrollbar = 32768,
    AlwaysUseWindowPadding = 65536,
    NoNavInputs = 262144,
    NoNavFocus = 524288,
    UnsavedDocument = 1048576,
    NoNav = 786432,
    NoDecoration = 43,
    NoInputs = 786944,
    NavFlattened = 8388608,
    ChildWindow = 16777216,
    Tooltip = 33554432,
    Popup = 67108864,
    Modal = 134217728,
    ChildMenu = 268435456,
    _,
};
pub const ImGuiWindowFlags_None = @enumToInt(ImGuiWindowFlags_.None);
pub const ImGuiWindowFlags_NoTitleBar = @enumToInt(ImGuiWindowFlags_.NoTitleBar);
pub const ImGuiWindowFlags_NoResize = @enumToInt(ImGuiWindowFlags_.NoResize);
pub const ImGuiWindowFlags_NoMove = @enumToInt(ImGuiWindowFlags_.NoMove);
pub const ImGuiWindowFlags_NoScrollbar = @enumToInt(ImGuiWindowFlags_.NoScrollbar);
pub const ImGuiWindowFlags_NoScrollWithMouse = @enumToInt(ImGuiWindowFlags_.NoScrollWithMouse);
pub const ImGuiWindowFlags_NoCollapse = @enumToInt(ImGuiWindowFlags_.NoCollapse);
pub const ImGuiWindowFlags_AlwaysAutoResize = @enumToInt(ImGuiWindowFlags_.AlwaysAutoResize);
pub const ImGuiWindowFlags_NoBackground = @enumToInt(ImGuiWindowFlags_.NoBackground);
pub const ImGuiWindowFlags_NoSavedSettings = @enumToInt(ImGuiWindowFlags_.NoSavedSettings);
pub const ImGuiWindowFlags_NoMouseInputs = @enumToInt(ImGuiWindowFlags_.NoMouseInputs);
pub const ImGuiWindowFlags_MenuBar = @enumToInt(ImGuiWindowFlags_.MenuBar);
pub const ImGuiWindowFlags_HorizontalScrollbar = @enumToInt(ImGuiWindowFlags_.HorizontalScrollbar);
pub const ImGuiWindowFlags_NoFocusOnAppearing = @enumToInt(ImGuiWindowFlags_.NoFocusOnAppearing);
pub const ImGuiWindowFlags_NoBringToFrontOnFocus = @enumToInt(ImGuiWindowFlags_.NoBringToFrontOnFocus);
pub const ImGuiWindowFlags_AlwaysVerticalScrollbar = @enumToInt(ImGuiWindowFlags_.AlwaysVerticalScrollbar);
pub const ImGuiWindowFlags_AlwaysHorizontalScrollbar = @enumToInt(ImGuiWindowFlags_.AlwaysHorizontalScrollbar);
pub const ImGuiWindowFlags_AlwaysUseWindowPadding = @enumToInt(ImGuiWindowFlags_.AlwaysUseWindowPadding);
pub const ImGuiWindowFlags_NoNavInputs = @enumToInt(ImGuiWindowFlags_.NoNavInputs);
pub const ImGuiWindowFlags_NoNavFocus = @enumToInt(ImGuiWindowFlags_.NoNavFocus);
pub const ImGuiWindowFlags_UnsavedDocument = @enumToInt(ImGuiWindowFlags_.UnsavedDocument);
pub const ImGuiWindowFlags_NoNav = @enumToInt(ImGuiWindowFlags_.NoNav);
pub const ImGuiWindowFlags_NoDecoration = @enumToInt(ImGuiWindowFlags_.NoDecoration);
pub const ImGuiWindowFlags_NoInputs = @enumToInt(ImGuiWindowFlags_.NoInputs);
pub const ImGuiWindowFlags_NavFlattened = @enumToInt(ImGuiWindowFlags_.NavFlattened);
pub const ImGuiWindowFlags_ChildWindow = @enumToInt(ImGuiWindowFlags_.ChildWindow);
pub const ImGuiWindowFlags_Tooltip = @enumToInt(ImGuiWindowFlags_.Tooltip);
pub const ImGuiWindowFlags_Popup = @enumToInt(ImGuiWindowFlags_.Popup);
pub const ImGuiWindowFlags_Modal = @enumToInt(ImGuiWindowFlags_.Modal);
pub const ImGuiWindowFlags_ChildMenu = @enumToInt(ImGuiWindowFlags_.ChildMenu);
pub const ImGuiInputTextFlags_ = extern enum(c_int) {
    None = 0,
    CharsDecimal = 1,
    CharsHexadecimal = 2,
    CharsUppercase = 4,
    CharsNoBlank = 8,
    AutoSelectAll = 16,
    EnterReturnsTrue = 32,
    CallbackCompletion = 64,
    CallbackHistory = 128,
    CallbackAlways = 256,
    CallbackCharFilter = 512,
    AllowTabInput = 1024,
    CtrlEnterForNewLine = 2048,
    NoHorizontalScroll = 4096,
    AlwaysOverwrite = 8192,
    ReadOnly = 16384,
    Password = 32768,
    NoUndoRedo = 65536,
    CharsScientific = 131072,
    CallbackResize = 262144,
    CallbackEdit = 524288,
    Multiline = 1048576,
    NoMarkEdited = 2097152,
    _,
};
pub const ImGuiInputTextFlags_None = @enumToInt(ImGuiInputTextFlags_.None);
pub const ImGuiInputTextFlags_CharsDecimal = @enumToInt(ImGuiInputTextFlags_.CharsDecimal);
pub const ImGuiInputTextFlags_CharsHexadecimal = @enumToInt(ImGuiInputTextFlags_.CharsHexadecimal);
pub const ImGuiInputTextFlags_CharsUppercase = @enumToInt(ImGuiInputTextFlags_.CharsUppercase);
pub const ImGuiInputTextFlags_CharsNoBlank = @enumToInt(ImGuiInputTextFlags_.CharsNoBlank);
pub const ImGuiInputTextFlags_AutoSelectAll = @enumToInt(ImGuiInputTextFlags_.AutoSelectAll);
pub const ImGuiInputTextFlags_EnterReturnsTrue = @enumToInt(ImGuiInputTextFlags_.EnterReturnsTrue);
pub const ImGuiInputTextFlags_CallbackCompletion = @enumToInt(ImGuiInputTextFlags_.CallbackCompletion);
pub const ImGuiInputTextFlags_CallbackHistory = @enumToInt(ImGuiInputTextFlags_.CallbackHistory);
pub const ImGuiInputTextFlags_CallbackAlways = @enumToInt(ImGuiInputTextFlags_.CallbackAlways);
pub const ImGuiInputTextFlags_CallbackCharFilter = @enumToInt(ImGuiInputTextFlags_.CallbackCharFilter);
pub const ImGuiInputTextFlags_AllowTabInput = @enumToInt(ImGuiInputTextFlags_.AllowTabInput);
pub const ImGuiInputTextFlags_CtrlEnterForNewLine = @enumToInt(ImGuiInputTextFlags_.CtrlEnterForNewLine);
pub const ImGuiInputTextFlags_NoHorizontalScroll = @enumToInt(ImGuiInputTextFlags_.NoHorizontalScroll);
pub const ImGuiInputTextFlags_AlwaysOverwrite = @enumToInt(ImGuiInputTextFlags_.AlwaysOverwrite);
pub const ImGuiInputTextFlags_ReadOnly = @enumToInt(ImGuiInputTextFlags_.ReadOnly);
pub const ImGuiInputTextFlags_Password = @enumToInt(ImGuiInputTextFlags_.Password);
pub const ImGuiInputTextFlags_NoUndoRedo = @enumToInt(ImGuiInputTextFlags_.NoUndoRedo);
pub const ImGuiInputTextFlags_CharsScientific = @enumToInt(ImGuiInputTextFlags_.CharsScientific);
pub const ImGuiInputTextFlags_CallbackResize = @enumToInt(ImGuiInputTextFlags_.CallbackResize);
pub const ImGuiInputTextFlags_CallbackEdit = @enumToInt(ImGuiInputTextFlags_.CallbackEdit);
pub const ImGuiInputTextFlags_Multiline = @enumToInt(ImGuiInputTextFlags_.Multiline);
pub const ImGuiInputTextFlags_NoMarkEdited = @enumToInt(ImGuiInputTextFlags_.NoMarkEdited);
pub const ImGuiTreeNodeFlags_ = extern enum(c_int) {
    None = 0,
    Selected = 1,
    Framed = 2,
    AllowItemOverlap = 4,
    NoTreePushOnOpen = 8,
    NoAutoOpenOnLog = 16,
    DefaultOpen = 32,
    OpenOnDoubleClick = 64,
    OpenOnArrow = 128,
    Leaf = 256,
    Bullet = 512,
    FramePadding = 1024,
    SpanAvailWidth = 2048,
    SpanFullWidth = 4096,
    NavLeftJumpsBackHere = 8192,
    CollapsingHeader = 26,
    _,
};
pub const ImGuiTreeNodeFlags_None = @enumToInt(ImGuiTreeNodeFlags_.None);
pub const ImGuiTreeNodeFlags_Selected = @enumToInt(ImGuiTreeNodeFlags_.Selected);
pub const ImGuiTreeNodeFlags_Framed = @enumToInt(ImGuiTreeNodeFlags_.Framed);
pub const ImGuiTreeNodeFlags_AllowItemOverlap = @enumToInt(ImGuiTreeNodeFlags_.AllowItemOverlap);
pub const ImGuiTreeNodeFlags_NoTreePushOnOpen = @enumToInt(ImGuiTreeNodeFlags_.NoTreePushOnOpen);
pub const ImGuiTreeNodeFlags_NoAutoOpenOnLog = @enumToInt(ImGuiTreeNodeFlags_.NoAutoOpenOnLog);
pub const ImGuiTreeNodeFlags_DefaultOpen = @enumToInt(ImGuiTreeNodeFlags_.DefaultOpen);
pub const ImGuiTreeNodeFlags_OpenOnDoubleClick = @enumToInt(ImGuiTreeNodeFlags_.OpenOnDoubleClick);
pub const ImGuiTreeNodeFlags_OpenOnArrow = @enumToInt(ImGuiTreeNodeFlags_.OpenOnArrow);
pub const ImGuiTreeNodeFlags_Leaf = @enumToInt(ImGuiTreeNodeFlags_.Leaf);
pub const ImGuiTreeNodeFlags_Bullet = @enumToInt(ImGuiTreeNodeFlags_.Bullet);
pub const ImGuiTreeNodeFlags_FramePadding = @enumToInt(ImGuiTreeNodeFlags_.FramePadding);
pub const ImGuiTreeNodeFlags_SpanAvailWidth = @enumToInt(ImGuiTreeNodeFlags_.SpanAvailWidth);
pub const ImGuiTreeNodeFlags_SpanFullWidth = @enumToInt(ImGuiTreeNodeFlags_.SpanFullWidth);
pub const ImGuiTreeNodeFlags_NavLeftJumpsBackHere = @enumToInt(ImGuiTreeNodeFlags_.NavLeftJumpsBackHere);
pub const ImGuiTreeNodeFlags_CollapsingHeader = @enumToInt(ImGuiTreeNodeFlags_.CollapsingHeader);
pub const ImGuiPopupFlags_ = extern enum(c_int) {
    None = 0,
    MouseButtonLeft = 0,
    MouseButtonRight = 1,
    MouseButtonMiddle = 2,
    MouseButtonMask_ = 31,
    MouseButtonDefault_ = 1,
    NoOpenOverExistingPopup = 32,
    NoOpenOverItems = 64,
    AnyPopupId = 128,
    AnyPopupLevel = 256,
    AnyPopup = 384,
    _,
};
pub const ImGuiPopupFlags_None = @enumToInt(ImGuiPopupFlags_.None);
pub const ImGuiPopupFlags_MouseButtonLeft = @enumToInt(ImGuiPopupFlags_.MouseButtonLeft);
pub const ImGuiPopupFlags_MouseButtonRight = @enumToInt(ImGuiPopupFlags_.MouseButtonRight);
pub const ImGuiPopupFlags_MouseButtonMiddle = @enumToInt(ImGuiPopupFlags_.MouseButtonMiddle);
pub const ImGuiPopupFlags_MouseButtonMask_ = @enumToInt(ImGuiPopupFlags_.MouseButtonMask_);
pub const ImGuiPopupFlags_MouseButtonDefault_ = @enumToInt(ImGuiPopupFlags_.MouseButtonDefault_);
pub const ImGuiPopupFlags_NoOpenOverExistingPopup = @enumToInt(ImGuiPopupFlags_.NoOpenOverExistingPopup);
pub const ImGuiPopupFlags_NoOpenOverItems = @enumToInt(ImGuiPopupFlags_.NoOpenOverItems);
pub const ImGuiPopupFlags_AnyPopupId = @enumToInt(ImGuiPopupFlags_.AnyPopupId);
pub const ImGuiPopupFlags_AnyPopupLevel = @enumToInt(ImGuiPopupFlags_.AnyPopupLevel);
pub const ImGuiPopupFlags_AnyPopup = @enumToInt(ImGuiPopupFlags_.AnyPopup);
pub const ImGuiSelectableFlags_ = extern enum(c_int) {
    None = 0,
    DontClosePopups = 1,
    SpanAllColumns = 2,
    AllowDoubleClick = 4,
    Disabled = 8,
    AllowItemOverlap = 16,
    _,
};
pub const ImGuiSelectableFlags_None = @enumToInt(ImGuiSelectableFlags_.None);
pub const ImGuiSelectableFlags_DontClosePopups = @enumToInt(ImGuiSelectableFlags_.DontClosePopups);
pub const ImGuiSelectableFlags_SpanAllColumns = @enumToInt(ImGuiSelectableFlags_.SpanAllColumns);
pub const ImGuiSelectableFlags_AllowDoubleClick = @enumToInt(ImGuiSelectableFlags_.AllowDoubleClick);
pub const ImGuiSelectableFlags_Disabled = @enumToInt(ImGuiSelectableFlags_.Disabled);
pub const ImGuiSelectableFlags_AllowItemOverlap = @enumToInt(ImGuiSelectableFlags_.AllowItemOverlap);
pub const ImGuiComboFlags_ = extern enum(c_int) {
    None = 0,
    PopupAlignLeft = 1,
    HeightSmall = 2,
    HeightRegular = 4,
    HeightLarge = 8,
    HeightLargest = 16,
    NoArrowButton = 32,
    NoPreview = 64,
    HeightMask_ = 30,
    _,
};
pub const ImGuiComboFlags_None = @enumToInt(ImGuiComboFlags_.None);
pub const ImGuiComboFlags_PopupAlignLeft = @enumToInt(ImGuiComboFlags_.PopupAlignLeft);
pub const ImGuiComboFlags_HeightSmall = @enumToInt(ImGuiComboFlags_.HeightSmall);
pub const ImGuiComboFlags_HeightRegular = @enumToInt(ImGuiComboFlags_.HeightRegular);
pub const ImGuiComboFlags_HeightLarge = @enumToInt(ImGuiComboFlags_.HeightLarge);
pub const ImGuiComboFlags_HeightLargest = @enumToInt(ImGuiComboFlags_.HeightLargest);
pub const ImGuiComboFlags_NoArrowButton = @enumToInt(ImGuiComboFlags_.NoArrowButton);
pub const ImGuiComboFlags_NoPreview = @enumToInt(ImGuiComboFlags_.NoPreview);
pub const ImGuiComboFlags_HeightMask_ = @enumToInt(ImGuiComboFlags_.HeightMask_);
pub const ImGuiTabBarFlags_ = extern enum(c_int) {
    None = 0,
    Reorderable = 1,
    AutoSelectNewTabs = 2,
    TabListPopupButton = 4,
    NoCloseWithMiddleMouseButton = 8,
    NoTabListScrollingButtons = 16,
    NoTooltip = 32,
    FittingPolicyResizeDown = 64,
    FittingPolicyScroll = 128,
    FittingPolicyMask_ = 192,
    FittingPolicyDefault_ = 64,
    _,
};
pub const ImGuiTabBarFlags_None = @enumToInt(ImGuiTabBarFlags_.None);
pub const ImGuiTabBarFlags_Reorderable = @enumToInt(ImGuiTabBarFlags_.Reorderable);
pub const ImGuiTabBarFlags_AutoSelectNewTabs = @enumToInt(ImGuiTabBarFlags_.AutoSelectNewTabs);
pub const ImGuiTabBarFlags_TabListPopupButton = @enumToInt(ImGuiTabBarFlags_.TabListPopupButton);
pub const ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = @enumToInt(ImGuiTabBarFlags_.NoCloseWithMiddleMouseButton);
pub const ImGuiTabBarFlags_NoTabListScrollingButtons = @enumToInt(ImGuiTabBarFlags_.NoTabListScrollingButtons);
pub const ImGuiTabBarFlags_NoTooltip = @enumToInt(ImGuiTabBarFlags_.NoTooltip);
pub const ImGuiTabBarFlags_FittingPolicyResizeDown = @enumToInt(ImGuiTabBarFlags_.FittingPolicyResizeDown);
pub const ImGuiTabBarFlags_FittingPolicyScroll = @enumToInt(ImGuiTabBarFlags_.FittingPolicyScroll);
pub const ImGuiTabBarFlags_FittingPolicyMask_ = @enumToInt(ImGuiTabBarFlags_.FittingPolicyMask_);
pub const ImGuiTabBarFlags_FittingPolicyDefault_ = @enumToInt(ImGuiTabBarFlags_.FittingPolicyDefault_);
pub const ImGuiTabItemFlags_ = extern enum(c_int) {
    None = 0,
    UnsavedDocument = 1,
    SetSelected = 2,
    NoCloseWithMiddleMouseButton = 4,
    NoPushId = 8,
    NoTooltip = 16,
    NoReorder = 32,
    Leading = 64,
    Trailing = 128,
    _,
};
pub const ImGuiTabItemFlags_None = @enumToInt(ImGuiTabItemFlags_.None);
pub const ImGuiTabItemFlags_UnsavedDocument = @enumToInt(ImGuiTabItemFlags_.UnsavedDocument);
pub const ImGuiTabItemFlags_SetSelected = @enumToInt(ImGuiTabItemFlags_.SetSelected);
pub const ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = @enumToInt(ImGuiTabItemFlags_.NoCloseWithMiddleMouseButton);
pub const ImGuiTabItemFlags_NoPushId = @enumToInt(ImGuiTabItemFlags_.NoPushId);
pub const ImGuiTabItemFlags_NoTooltip = @enumToInt(ImGuiTabItemFlags_.NoTooltip);
pub const ImGuiTabItemFlags_NoReorder = @enumToInt(ImGuiTabItemFlags_.NoReorder);
pub const ImGuiTabItemFlags_Leading = @enumToInt(ImGuiTabItemFlags_.Leading);
pub const ImGuiTabItemFlags_Trailing = @enumToInt(ImGuiTabItemFlags_.Trailing);
pub const ImGuiTableFlags_ = extern enum(c_int) {
    None = 0,
    Resizable = 1,
    Reorderable = 2,
    Hideable = 4,
    Sortable = 8,
    NoSavedSettings = 16,
    ContextMenuInBody = 32,
    RowBg = 64,
    BordersInnerH = 128,
    BordersOuterH = 256,
    BordersInnerV = 512,
    BordersOuterV = 1024,
    BordersH = 384,
    BordersV = 1536,
    BordersInner = 640,
    BordersOuter = 1280,
    Borders = 1920,
    NoBordersInBody = 2048,
    NoBordersInBodyUntilResize = 4096,
    SizingFixedFit = 8192,
    SizingFixedSame = 16384,
    SizingStretchProp = 24576,
    SizingStretchSame = 32768,
    NoHostExtendX = 65536,
    NoHostExtendY = 131072,
    NoKeepColumnsVisible = 262144,
    PreciseWidths = 524288,
    NoClip = 1048576,
    PadOuterX = 2097152,
    NoPadOuterX = 4194304,
    NoPadInnerX = 8388608,
    ScrollX = 16777216,
    ScrollY = 33554432,
    SortMulti = 67108864,
    SortTristate = 134217728,
    SizingMask_ = 57344,
    _,
};
pub const ImGuiTableFlags_None = @enumToInt(ImGuiTableFlags_.None);
pub const ImGuiTableFlags_Resizable = @enumToInt(ImGuiTableFlags_.Resizable);
pub const ImGuiTableFlags_Reorderable = @enumToInt(ImGuiTableFlags_.Reorderable);
pub const ImGuiTableFlags_Hideable = @enumToInt(ImGuiTableFlags_.Hideable);
pub const ImGuiTableFlags_Sortable = @enumToInt(ImGuiTableFlags_.Sortable);
pub const ImGuiTableFlags_NoSavedSettings = @enumToInt(ImGuiTableFlags_.NoSavedSettings);
pub const ImGuiTableFlags_ContextMenuInBody = @enumToInt(ImGuiTableFlags_.ContextMenuInBody);
pub const ImGuiTableFlags_RowBg = @enumToInt(ImGuiTableFlags_.RowBg);
pub const ImGuiTableFlags_BordersInnerH = @enumToInt(ImGuiTableFlags_.BordersInnerH);
pub const ImGuiTableFlags_BordersOuterH = @enumToInt(ImGuiTableFlags_.BordersOuterH);
pub const ImGuiTableFlags_BordersInnerV = @enumToInt(ImGuiTableFlags_.BordersInnerV);
pub const ImGuiTableFlags_BordersOuterV = @enumToInt(ImGuiTableFlags_.BordersOuterV);
pub const ImGuiTableFlags_BordersH = @enumToInt(ImGuiTableFlags_.BordersH);
pub const ImGuiTableFlags_BordersV = @enumToInt(ImGuiTableFlags_.BordersV);
pub const ImGuiTableFlags_BordersInner = @enumToInt(ImGuiTableFlags_.BordersInner);
pub const ImGuiTableFlags_BordersOuter = @enumToInt(ImGuiTableFlags_.BordersOuter);
pub const ImGuiTableFlags_Borders = @enumToInt(ImGuiTableFlags_.Borders);
pub const ImGuiTableFlags_NoBordersInBody = @enumToInt(ImGuiTableFlags_.NoBordersInBody);
pub const ImGuiTableFlags_NoBordersInBodyUntilResize = @enumToInt(ImGuiTableFlags_.NoBordersInBodyUntilResize);
pub const ImGuiTableFlags_SizingFixedFit = @enumToInt(ImGuiTableFlags_.SizingFixedFit);
pub const ImGuiTableFlags_SizingFixedSame = @enumToInt(ImGuiTableFlags_.SizingFixedSame);
pub const ImGuiTableFlags_SizingStretchProp = @enumToInt(ImGuiTableFlags_.SizingStretchProp);
pub const ImGuiTableFlags_SizingStretchSame = @enumToInt(ImGuiTableFlags_.SizingStretchSame);
pub const ImGuiTableFlags_NoHostExtendX = @enumToInt(ImGuiTableFlags_.NoHostExtendX);
pub const ImGuiTableFlags_NoHostExtendY = @enumToInt(ImGuiTableFlags_.NoHostExtendY);
pub const ImGuiTableFlags_NoKeepColumnsVisible = @enumToInt(ImGuiTableFlags_.NoKeepColumnsVisible);
pub const ImGuiTableFlags_PreciseWidths = @enumToInt(ImGuiTableFlags_.PreciseWidths);
pub const ImGuiTableFlags_NoClip = @enumToInt(ImGuiTableFlags_.NoClip);
pub const ImGuiTableFlags_PadOuterX = @enumToInt(ImGuiTableFlags_.PadOuterX);
pub const ImGuiTableFlags_NoPadOuterX = @enumToInt(ImGuiTableFlags_.NoPadOuterX);
pub const ImGuiTableFlags_NoPadInnerX = @enumToInt(ImGuiTableFlags_.NoPadInnerX);
pub const ImGuiTableFlags_ScrollX = @enumToInt(ImGuiTableFlags_.ScrollX);
pub const ImGuiTableFlags_ScrollY = @enumToInt(ImGuiTableFlags_.ScrollY);
pub const ImGuiTableFlags_SortMulti = @enumToInt(ImGuiTableFlags_.SortMulti);
pub const ImGuiTableFlags_SortTristate = @enumToInt(ImGuiTableFlags_.SortTristate);
pub const ImGuiTableFlags_SizingMask_ = @enumToInt(ImGuiTableFlags_.SizingMask_);
pub const ImGuiTableColumnFlags_ = extern enum(c_int) {
    None = 0,
    DefaultHide = 1,
    DefaultSort = 2,
    WidthStretch = 4,
    WidthFixed = 8,
    NoResize = 16,
    NoReorder = 32,
    NoHide = 64,
    NoClip = 128,
    NoSort = 256,
    NoSortAscending = 512,
    NoSortDescending = 1024,
    NoHeaderWidth = 2048,
    PreferSortAscending = 4096,
    PreferSortDescending = 8192,
    IndentEnable = 16384,
    IndentDisable = 32768,
    IsEnabled = 1048576,
    IsVisible = 2097152,
    IsSorted = 4194304,
    IsHovered = 8388608,
    WidthMask_ = 12,
    IndentMask_ = 49152,
    StatusMask_ = 15728640,
    NoDirectResize_ = 1073741824,
    _,
};
pub const ImGuiTableColumnFlags_None = @enumToInt(ImGuiTableColumnFlags_.None);
pub const ImGuiTableColumnFlags_DefaultHide = @enumToInt(ImGuiTableColumnFlags_.DefaultHide);
pub const ImGuiTableColumnFlags_DefaultSort = @enumToInt(ImGuiTableColumnFlags_.DefaultSort);
pub const ImGuiTableColumnFlags_WidthStretch = @enumToInt(ImGuiTableColumnFlags_.WidthStretch);
pub const ImGuiTableColumnFlags_WidthFixed = @enumToInt(ImGuiTableColumnFlags_.WidthFixed);
pub const ImGuiTableColumnFlags_NoResize = @enumToInt(ImGuiTableColumnFlags_.NoResize);
pub const ImGuiTableColumnFlags_NoReorder = @enumToInt(ImGuiTableColumnFlags_.NoReorder);
pub const ImGuiTableColumnFlags_NoHide = @enumToInt(ImGuiTableColumnFlags_.NoHide);
pub const ImGuiTableColumnFlags_NoClip = @enumToInt(ImGuiTableColumnFlags_.NoClip);
pub const ImGuiTableColumnFlags_NoSort = @enumToInt(ImGuiTableColumnFlags_.NoSort);
pub const ImGuiTableColumnFlags_NoSortAscending = @enumToInt(ImGuiTableColumnFlags_.NoSortAscending);
pub const ImGuiTableColumnFlags_NoSortDescending = @enumToInt(ImGuiTableColumnFlags_.NoSortDescending);
pub const ImGuiTableColumnFlags_NoHeaderWidth = @enumToInt(ImGuiTableColumnFlags_.NoHeaderWidth);
pub const ImGuiTableColumnFlags_PreferSortAscending = @enumToInt(ImGuiTableColumnFlags_.PreferSortAscending);
pub const ImGuiTableColumnFlags_PreferSortDescending = @enumToInt(ImGuiTableColumnFlags_.PreferSortDescending);
pub const ImGuiTableColumnFlags_IndentEnable = @enumToInt(ImGuiTableColumnFlags_.IndentEnable);
pub const ImGuiTableColumnFlags_IndentDisable = @enumToInt(ImGuiTableColumnFlags_.IndentDisable);
pub const ImGuiTableColumnFlags_IsEnabled = @enumToInt(ImGuiTableColumnFlags_.IsEnabled);
pub const ImGuiTableColumnFlags_IsVisible = @enumToInt(ImGuiTableColumnFlags_.IsVisible);
pub const ImGuiTableColumnFlags_IsSorted = @enumToInt(ImGuiTableColumnFlags_.IsSorted);
pub const ImGuiTableColumnFlags_IsHovered = @enumToInt(ImGuiTableColumnFlags_.IsHovered);
pub const ImGuiTableColumnFlags_WidthMask_ = @enumToInt(ImGuiTableColumnFlags_.WidthMask_);
pub const ImGuiTableColumnFlags_IndentMask_ = @enumToInt(ImGuiTableColumnFlags_.IndentMask_);
pub const ImGuiTableColumnFlags_StatusMask_ = @enumToInt(ImGuiTableColumnFlags_.StatusMask_);
pub const ImGuiTableColumnFlags_NoDirectResize_ = @enumToInt(ImGuiTableColumnFlags_.NoDirectResize_);
pub const ImGuiTableRowFlags_ = extern enum(c_int) {
    None = 0,
    Headers = 1,
    _,
};
pub const ImGuiTableRowFlags_None = @enumToInt(ImGuiTableRowFlags_.None);
pub const ImGuiTableRowFlags_Headers = @enumToInt(ImGuiTableRowFlags_.Headers);
pub const ImGuiTableBgTarget_ = extern enum(c_int) {
    None = 0,
    RowBg0 = 1,
    RowBg1 = 2,
    CellBg = 3,
    _,
};
pub const ImGuiTableBgTarget_None = @enumToInt(ImGuiTableBgTarget_.None);
pub const ImGuiTableBgTarget_RowBg0 = @enumToInt(ImGuiTableBgTarget_.RowBg0);
pub const ImGuiTableBgTarget_RowBg1 = @enumToInt(ImGuiTableBgTarget_.RowBg1);
pub const ImGuiTableBgTarget_CellBg = @enumToInt(ImGuiTableBgTarget_.CellBg);
pub const ImGuiFocusedFlags_ = extern enum(c_int) {
    None = 0,
    ChildWindows = 1,
    RootWindow = 2,
    AnyWindow = 4,
    RootAndChildWindows = 3,
    _,
};
pub const ImGuiFocusedFlags_None = @enumToInt(ImGuiFocusedFlags_.None);
pub const ImGuiFocusedFlags_ChildWindows = @enumToInt(ImGuiFocusedFlags_.ChildWindows);
pub const ImGuiFocusedFlags_RootWindow = @enumToInt(ImGuiFocusedFlags_.RootWindow);
pub const ImGuiFocusedFlags_AnyWindow = @enumToInt(ImGuiFocusedFlags_.AnyWindow);
pub const ImGuiFocusedFlags_RootAndChildWindows = @enumToInt(ImGuiFocusedFlags_.RootAndChildWindows);
pub const ImGuiHoveredFlags_ = extern enum(c_int) {
    None = 0,
    ChildWindows = 1,
    RootWindow = 2,
    AnyWindow = 4,
    AllowWhenBlockedByPopup = 8,
    AllowWhenBlockedByActiveItem = 32,
    AllowWhenOverlapped = 64,
    AllowWhenDisabled = 128,
    RectOnly = 104,
    RootAndChildWindows = 3,
    _,
};
pub const ImGuiHoveredFlags_None = @enumToInt(ImGuiHoveredFlags_.None);
pub const ImGuiHoveredFlags_ChildWindows = @enumToInt(ImGuiHoveredFlags_.ChildWindows);
pub const ImGuiHoveredFlags_RootWindow = @enumToInt(ImGuiHoveredFlags_.RootWindow);
pub const ImGuiHoveredFlags_AnyWindow = @enumToInt(ImGuiHoveredFlags_.AnyWindow);
pub const ImGuiHoveredFlags_AllowWhenBlockedByPopup = @enumToInt(ImGuiHoveredFlags_.AllowWhenBlockedByPopup);
pub const ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = @enumToInt(ImGuiHoveredFlags_.AllowWhenBlockedByActiveItem);
pub const ImGuiHoveredFlags_AllowWhenOverlapped = @enumToInt(ImGuiHoveredFlags_.AllowWhenOverlapped);
pub const ImGuiHoveredFlags_AllowWhenDisabled = @enumToInt(ImGuiHoveredFlags_.AllowWhenDisabled);
pub const ImGuiHoveredFlags_RectOnly = @enumToInt(ImGuiHoveredFlags_.RectOnly);
pub const ImGuiHoveredFlags_RootAndChildWindows = @enumToInt(ImGuiHoveredFlags_.RootAndChildWindows);
pub const ImGuiDragDropFlags_ = extern enum(c_int) {
    None = 0,
    SourceNoPreviewTooltip = 1,
    SourceNoDisableHover = 2,
    SourceNoHoldToOpenOthers = 4,
    SourceAllowNullID = 8,
    SourceExtern = 16,
    SourceAutoExpirePayload = 32,
    AcceptBeforeDelivery = 1024,
    AcceptNoDrawDefaultRect = 2048,
    AcceptNoPreviewTooltip = 4096,
    AcceptPeekOnly = 3072,
    _,
};
pub const ImGuiDragDropFlags_None = @enumToInt(ImGuiDragDropFlags_.None);
pub const ImGuiDragDropFlags_SourceNoPreviewTooltip = @enumToInt(ImGuiDragDropFlags_.SourceNoPreviewTooltip);
pub const ImGuiDragDropFlags_SourceNoDisableHover = @enumToInt(ImGuiDragDropFlags_.SourceNoDisableHover);
pub const ImGuiDragDropFlags_SourceNoHoldToOpenOthers = @enumToInt(ImGuiDragDropFlags_.SourceNoHoldToOpenOthers);
pub const ImGuiDragDropFlags_SourceAllowNullID = @enumToInt(ImGuiDragDropFlags_.SourceAllowNullID);
pub const ImGuiDragDropFlags_SourceExtern = @enumToInt(ImGuiDragDropFlags_.SourceExtern);
pub const ImGuiDragDropFlags_SourceAutoExpirePayload = @enumToInt(ImGuiDragDropFlags_.SourceAutoExpirePayload);
pub const ImGuiDragDropFlags_AcceptBeforeDelivery = @enumToInt(ImGuiDragDropFlags_.AcceptBeforeDelivery);
pub const ImGuiDragDropFlags_AcceptNoDrawDefaultRect = @enumToInt(ImGuiDragDropFlags_.AcceptNoDrawDefaultRect);
pub const ImGuiDragDropFlags_AcceptNoPreviewTooltip = @enumToInt(ImGuiDragDropFlags_.AcceptNoPreviewTooltip);
pub const ImGuiDragDropFlags_AcceptPeekOnly = @enumToInt(ImGuiDragDropFlags_.AcceptPeekOnly);
pub const ImGuiDataType_ = extern enum(c_int) {
    S8,
    U8,
    S16,
    U16,
    S32,
    U32,
    S64,
    U64,
    Float,
    Double,
    COUNT,
    _,
};
pub const ImGuiDataType_S8 = @enumToInt(ImGuiDataType_.S8);
pub const ImGuiDataType_U8 = @enumToInt(ImGuiDataType_.U8);
pub const ImGuiDataType_S16 = @enumToInt(ImGuiDataType_.S16);
pub const ImGuiDataType_U16 = @enumToInt(ImGuiDataType_.U16);
pub const ImGuiDataType_S32 = @enumToInt(ImGuiDataType_.S32);
pub const ImGuiDataType_U32 = @enumToInt(ImGuiDataType_.U32);
pub const ImGuiDataType_S64 = @enumToInt(ImGuiDataType_.S64);
pub const ImGuiDataType_U64 = @enumToInt(ImGuiDataType_.U64);
pub const ImGuiDataType_Float = @enumToInt(ImGuiDataType_.Float);
pub const ImGuiDataType_Double = @enumToInt(ImGuiDataType_.Double);
pub const ImGuiDataType_COUNT = @enumToInt(ImGuiDataType_.COUNT);
pub const ImGuiDir_ = extern enum(c_int) {
    None = -1,
    Left = 0,
    Right = 1,
    Up = 2,
    Down = 3,
    COUNT = 4,
    _,
};
pub const ImGuiDir_None = @enumToInt(ImGuiDir_.None);
pub const ImGuiDir_Left = @enumToInt(ImGuiDir_.Left);
pub const ImGuiDir_Right = @enumToInt(ImGuiDir_.Right);
pub const ImGuiDir_Up = @enumToInt(ImGuiDir_.Up);
pub const ImGuiDir_Down = @enumToInt(ImGuiDir_.Down);
pub const ImGuiDir_COUNT = @enumToInt(ImGuiDir_.COUNT);
pub const ImGuiSortDirection_ = extern enum(c_int) {
    None = 0,
    Ascending = 1,
    Descending = 2,
    _,
};
pub const ImGuiSortDirection_None = @enumToInt(ImGuiSortDirection_.None);
pub const ImGuiSortDirection_Ascending = @enumToInt(ImGuiSortDirection_.Ascending);
pub const ImGuiSortDirection_Descending = @enumToInt(ImGuiSortDirection_.Descending);
pub const ImGuiKey_ = extern enum(c_int) {
    Tab,
    LeftArrow,
    RightArrow,
    UpArrow,
    DownArrow,
    PageUp,
    PageDown,
    Home,
    End,
    Insert,
    Delete,
    Backspace,
    Space,
    Enter,
    Escape,
    KeyPadEnter,
    A,
    C,
    V,
    X,
    Y,
    Z,
    COUNT,
    _,
};
pub const ImGuiKey_Tab = @enumToInt(ImGuiKey_.Tab);
pub const ImGuiKey_LeftArrow = @enumToInt(ImGuiKey_.LeftArrow);
pub const ImGuiKey_RightArrow = @enumToInt(ImGuiKey_.RightArrow);
pub const ImGuiKey_UpArrow = @enumToInt(ImGuiKey_.UpArrow);
pub const ImGuiKey_DownArrow = @enumToInt(ImGuiKey_.DownArrow);
pub const ImGuiKey_PageUp = @enumToInt(ImGuiKey_.PageUp);
pub const ImGuiKey_PageDown = @enumToInt(ImGuiKey_.PageDown);
pub const ImGuiKey_Home = @enumToInt(ImGuiKey_.Home);
pub const ImGuiKey_End = @enumToInt(ImGuiKey_.End);
pub const ImGuiKey_Insert = @enumToInt(ImGuiKey_.Insert);
pub const ImGuiKey_Delete = @enumToInt(ImGuiKey_.Delete);
pub const ImGuiKey_Backspace = @enumToInt(ImGuiKey_.Backspace);
pub const ImGuiKey_Space = @enumToInt(ImGuiKey_.Space);
pub const ImGuiKey_Enter = @enumToInt(ImGuiKey_.Enter);
pub const ImGuiKey_Escape = @enumToInt(ImGuiKey_.Escape);
pub const ImGuiKey_KeyPadEnter = @enumToInt(ImGuiKey_.KeyPadEnter);
pub const ImGuiKey_A = @enumToInt(ImGuiKey_.A);
pub const ImGuiKey_C = @enumToInt(ImGuiKey_.C);
pub const ImGuiKey_V = @enumToInt(ImGuiKey_.V);
pub const ImGuiKey_X = @enumToInt(ImGuiKey_.X);
pub const ImGuiKey_Y = @enumToInt(ImGuiKey_.Y);
pub const ImGuiKey_Z = @enumToInt(ImGuiKey_.Z);
pub const ImGuiKey_COUNT = @enumToInt(ImGuiKey_.COUNT);
pub const ImGuiKeyModFlags_ = extern enum(c_int) {
    None = 0,
    Ctrl = 1,
    Shift = 2,
    Alt = 4,
    Super = 8,
    _,
};
pub const ImGuiKeyModFlags_None = @enumToInt(ImGuiKeyModFlags_.None);
pub const ImGuiKeyModFlags_Ctrl = @enumToInt(ImGuiKeyModFlags_.Ctrl);
pub const ImGuiKeyModFlags_Shift = @enumToInt(ImGuiKeyModFlags_.Shift);
pub const ImGuiKeyModFlags_Alt = @enumToInt(ImGuiKeyModFlags_.Alt);
pub const ImGuiKeyModFlags_Super = @enumToInt(ImGuiKeyModFlags_.Super);
pub const ImGuiNavInput_ = extern enum(c_int) {
    Activate = 0,
    Cancel = 1,
    Input = 2,
    Menu = 3,
    DpadLeft = 4,
    DpadRight = 5,
    DpadUp = 6,
    DpadDown = 7,
    LStickLeft = 8,
    LStickRight = 9,
    LStickUp = 10,
    LStickDown = 11,
    FocusPrev = 12,
    FocusNext = 13,
    TweakSlow = 14,
    TweakFast = 15,
    KeyMenu_ = 16,
    KeyLeft_ = 17,
    KeyRight_ = 18,
    KeyUp_ = 19,
    KeyDown_ = 20,
    COUNT = 21,
    InternalStart_ = 16,
    _,
};
pub const ImGuiNavInput_Activate = @enumToInt(ImGuiNavInput_.Activate);
pub const ImGuiNavInput_Cancel = @enumToInt(ImGuiNavInput_.Cancel);
pub const ImGuiNavInput_Input = @enumToInt(ImGuiNavInput_.Input);
pub const ImGuiNavInput_Menu = @enumToInt(ImGuiNavInput_.Menu);
pub const ImGuiNavInput_DpadLeft = @enumToInt(ImGuiNavInput_.DpadLeft);
pub const ImGuiNavInput_DpadRight = @enumToInt(ImGuiNavInput_.DpadRight);
pub const ImGuiNavInput_DpadUp = @enumToInt(ImGuiNavInput_.DpadUp);
pub const ImGuiNavInput_DpadDown = @enumToInt(ImGuiNavInput_.DpadDown);
pub const ImGuiNavInput_LStickLeft = @enumToInt(ImGuiNavInput_.LStickLeft);
pub const ImGuiNavInput_LStickRight = @enumToInt(ImGuiNavInput_.LStickRight);
pub const ImGuiNavInput_LStickUp = @enumToInt(ImGuiNavInput_.LStickUp);
pub const ImGuiNavInput_LStickDown = @enumToInt(ImGuiNavInput_.LStickDown);
pub const ImGuiNavInput_FocusPrev = @enumToInt(ImGuiNavInput_.FocusPrev);
pub const ImGuiNavInput_FocusNext = @enumToInt(ImGuiNavInput_.FocusNext);
pub const ImGuiNavInput_TweakSlow = @enumToInt(ImGuiNavInput_.TweakSlow);
pub const ImGuiNavInput_TweakFast = @enumToInt(ImGuiNavInput_.TweakFast);
pub const ImGuiNavInput_KeyMenu_ = @enumToInt(ImGuiNavInput_.KeyMenu_);
pub const ImGuiNavInput_KeyLeft_ = @enumToInt(ImGuiNavInput_.KeyLeft_);
pub const ImGuiNavInput_KeyRight_ = @enumToInt(ImGuiNavInput_.KeyRight_);
pub const ImGuiNavInput_KeyUp_ = @enumToInt(ImGuiNavInput_.KeyUp_);
pub const ImGuiNavInput_KeyDown_ = @enumToInt(ImGuiNavInput_.KeyDown_);
pub const ImGuiNavInput_COUNT = @enumToInt(ImGuiNavInput_.COUNT);
pub const ImGuiNavInput_InternalStart_ = @enumToInt(ImGuiNavInput_.InternalStart_);
pub const ImGuiConfigFlags_ = extern enum(c_int) {
    None = 0,
    NavEnableKeyboard = 1,
    NavEnableGamepad = 2,
    NavEnableSetMousePos = 4,
    NavNoCaptureKeyboard = 8,
    NoMouse = 16,
    NoMouseCursorChange = 32,
    IsSRGB = 1048576,
    IsTouchScreen = 2097152,
    _,
};
pub const ImGuiConfigFlags_None = @enumToInt(ImGuiConfigFlags_.None);
pub const ImGuiConfigFlags_NavEnableKeyboard = @enumToInt(ImGuiConfigFlags_.NavEnableKeyboard);
pub const ImGuiConfigFlags_NavEnableGamepad = @enumToInt(ImGuiConfigFlags_.NavEnableGamepad);
pub const ImGuiConfigFlags_NavEnableSetMousePos = @enumToInt(ImGuiConfigFlags_.NavEnableSetMousePos);
pub const ImGuiConfigFlags_NavNoCaptureKeyboard = @enumToInt(ImGuiConfigFlags_.NavNoCaptureKeyboard);
pub const ImGuiConfigFlags_NoMouse = @enumToInt(ImGuiConfigFlags_.NoMouse);
pub const ImGuiConfigFlags_NoMouseCursorChange = @enumToInt(ImGuiConfigFlags_.NoMouseCursorChange);
pub const ImGuiConfigFlags_IsSRGB = @enumToInt(ImGuiConfigFlags_.IsSRGB);
pub const ImGuiConfigFlags_IsTouchScreen = @enumToInt(ImGuiConfigFlags_.IsTouchScreen);
pub const ImGuiBackendFlags_ = extern enum(c_int) {
    None = 0,
    HasGamepad = 1,
    HasMouseCursors = 2,
    HasSetMousePos = 4,
    RendererHasVtxOffset = 8,
    _,
};
pub const ImGuiBackendFlags_None = @enumToInt(ImGuiBackendFlags_.None);
pub const ImGuiBackendFlags_HasGamepad = @enumToInt(ImGuiBackendFlags_.HasGamepad);
pub const ImGuiBackendFlags_HasMouseCursors = @enumToInt(ImGuiBackendFlags_.HasMouseCursors);
pub const ImGuiBackendFlags_HasSetMousePos = @enumToInt(ImGuiBackendFlags_.HasSetMousePos);
pub const ImGuiBackendFlags_RendererHasVtxOffset = @enumToInt(ImGuiBackendFlags_.RendererHasVtxOffset);
pub const ImGuiCol_ = extern enum(c_int) {
    Text,
    TextDisabled,
    WindowBg,
    ChildBg,
    PopupBg,
    Border,
    BorderShadow,
    FrameBg,
    FrameBgHovered,
    FrameBgActive,
    TitleBg,
    TitleBgActive,
    TitleBgCollapsed,
    MenuBarBg,
    ScrollbarBg,
    ScrollbarGrab,
    ScrollbarGrabHovered,
    ScrollbarGrabActive,
    CheckMark,
    SliderGrab,
    SliderGrabActive,
    Button,
    ButtonHovered,
    ButtonActive,
    Header,
    HeaderHovered,
    HeaderActive,
    Separator,
    SeparatorHovered,
    SeparatorActive,
    ResizeGrip,
    ResizeGripHovered,
    ResizeGripActive,
    Tab,
    TabHovered,
    TabActive,
    TabUnfocused,
    TabUnfocusedActive,
    PlotLines,
    PlotLinesHovered,
    PlotHistogram,
    PlotHistogramHovered,
    TableHeaderBg,
    TableBorderStrong,
    TableBorderLight,
    TableRowBg,
    TableRowBgAlt,
    TextSelectedBg,
    DragDropTarget,
    NavHighlight,
    NavWindowingHighlight,
    NavWindowingDimBg,
    ModalWindowDimBg,
    COUNT,
    _,
};
pub const ImGuiCol_Text = @enumToInt(ImGuiCol_.Text);
pub const ImGuiCol_TextDisabled = @enumToInt(ImGuiCol_.TextDisabled);
pub const ImGuiCol_WindowBg = @enumToInt(ImGuiCol_.WindowBg);
pub const ImGuiCol_ChildBg = @enumToInt(ImGuiCol_.ChildBg);
pub const ImGuiCol_PopupBg = @enumToInt(ImGuiCol_.PopupBg);
pub const ImGuiCol_Border = @enumToInt(ImGuiCol_.Border);
pub const ImGuiCol_BorderShadow = @enumToInt(ImGuiCol_.BorderShadow);
pub const ImGuiCol_FrameBg = @enumToInt(ImGuiCol_.FrameBg);
pub const ImGuiCol_FrameBgHovered = @enumToInt(ImGuiCol_.FrameBgHovered);
pub const ImGuiCol_FrameBgActive = @enumToInt(ImGuiCol_.FrameBgActive);
pub const ImGuiCol_TitleBg = @enumToInt(ImGuiCol_.TitleBg);
pub const ImGuiCol_TitleBgActive = @enumToInt(ImGuiCol_.TitleBgActive);
pub const ImGuiCol_TitleBgCollapsed = @enumToInt(ImGuiCol_.TitleBgCollapsed);
pub const ImGuiCol_MenuBarBg = @enumToInt(ImGuiCol_.MenuBarBg);
pub const ImGuiCol_ScrollbarBg = @enumToInt(ImGuiCol_.ScrollbarBg);
pub const ImGuiCol_ScrollbarGrab = @enumToInt(ImGuiCol_.ScrollbarGrab);
pub const ImGuiCol_ScrollbarGrabHovered = @enumToInt(ImGuiCol_.ScrollbarGrabHovered);
pub const ImGuiCol_ScrollbarGrabActive = @enumToInt(ImGuiCol_.ScrollbarGrabActive);
pub const ImGuiCol_CheckMark = @enumToInt(ImGuiCol_.CheckMark);
pub const ImGuiCol_SliderGrab = @enumToInt(ImGuiCol_.SliderGrab);
pub const ImGuiCol_SliderGrabActive = @enumToInt(ImGuiCol_.SliderGrabActive);
pub const ImGuiCol_Button = @enumToInt(ImGuiCol_.Button);
pub const ImGuiCol_ButtonHovered = @enumToInt(ImGuiCol_.ButtonHovered);
pub const ImGuiCol_ButtonActive = @enumToInt(ImGuiCol_.ButtonActive);
pub const ImGuiCol_Header = @enumToInt(ImGuiCol_.Header);
pub const ImGuiCol_HeaderHovered = @enumToInt(ImGuiCol_.HeaderHovered);
pub const ImGuiCol_HeaderActive = @enumToInt(ImGuiCol_.HeaderActive);
pub const ImGuiCol_Separator = @enumToInt(ImGuiCol_.Separator);
pub const ImGuiCol_SeparatorHovered = @enumToInt(ImGuiCol_.SeparatorHovered);
pub const ImGuiCol_SeparatorActive = @enumToInt(ImGuiCol_.SeparatorActive);
pub const ImGuiCol_ResizeGrip = @enumToInt(ImGuiCol_.ResizeGrip);
pub const ImGuiCol_ResizeGripHovered = @enumToInt(ImGuiCol_.ResizeGripHovered);
pub const ImGuiCol_ResizeGripActive = @enumToInt(ImGuiCol_.ResizeGripActive);
pub const ImGuiCol_Tab = @enumToInt(ImGuiCol_.Tab);
pub const ImGuiCol_TabHovered = @enumToInt(ImGuiCol_.TabHovered);
pub const ImGuiCol_TabActive = @enumToInt(ImGuiCol_.TabActive);
pub const ImGuiCol_TabUnfocused = @enumToInt(ImGuiCol_.TabUnfocused);
pub const ImGuiCol_TabUnfocusedActive = @enumToInt(ImGuiCol_.TabUnfocusedActive);
pub const ImGuiCol_PlotLines = @enumToInt(ImGuiCol_.PlotLines);
pub const ImGuiCol_PlotLinesHovered = @enumToInt(ImGuiCol_.PlotLinesHovered);
pub const ImGuiCol_PlotHistogram = @enumToInt(ImGuiCol_.PlotHistogram);
pub const ImGuiCol_PlotHistogramHovered = @enumToInt(ImGuiCol_.PlotHistogramHovered);
pub const ImGuiCol_TableHeaderBg = @enumToInt(ImGuiCol_.TableHeaderBg);
pub const ImGuiCol_TableBorderStrong = @enumToInt(ImGuiCol_.TableBorderStrong);
pub const ImGuiCol_TableBorderLight = @enumToInt(ImGuiCol_.TableBorderLight);
pub const ImGuiCol_TableRowBg = @enumToInt(ImGuiCol_.TableRowBg);
pub const ImGuiCol_TableRowBgAlt = @enumToInt(ImGuiCol_.TableRowBgAlt);
pub const ImGuiCol_TextSelectedBg = @enumToInt(ImGuiCol_.TextSelectedBg);
pub const ImGuiCol_DragDropTarget = @enumToInt(ImGuiCol_.DragDropTarget);
pub const ImGuiCol_NavHighlight = @enumToInt(ImGuiCol_.NavHighlight);
pub const ImGuiCol_NavWindowingHighlight = @enumToInt(ImGuiCol_.NavWindowingHighlight);
pub const ImGuiCol_NavWindowingDimBg = @enumToInt(ImGuiCol_.NavWindowingDimBg);
pub const ImGuiCol_ModalWindowDimBg = @enumToInt(ImGuiCol_.ModalWindowDimBg);
pub const ImGuiCol_COUNT = @enumToInt(ImGuiCol_.COUNT);
pub const ImGuiStyleVar_ = extern enum(c_int) {
    Alpha,
    WindowPadding,
    WindowRounding,
    WindowBorderSize,
    WindowMinSize,
    WindowTitleAlign,
    ChildRounding,
    ChildBorderSize,
    PopupRounding,
    PopupBorderSize,
    FramePadding,
    FrameRounding,
    FrameBorderSize,
    ItemSpacing,
    ItemInnerSpacing,
    IndentSpacing,
    CellPadding,
    ScrollbarSize,
    ScrollbarRounding,
    GrabMinSize,
    GrabRounding,
    TabRounding,
    ButtonTextAlign,
    SelectableTextAlign,
    COUNT,
    _,
};
pub const ImGuiStyleVar_Alpha = @enumToInt(ImGuiStyleVar_.Alpha);
pub const ImGuiStyleVar_WindowPadding = @enumToInt(ImGuiStyleVar_.WindowPadding);
pub const ImGuiStyleVar_WindowRounding = @enumToInt(ImGuiStyleVar_.WindowRounding);
pub const ImGuiStyleVar_WindowBorderSize = @enumToInt(ImGuiStyleVar_.WindowBorderSize);
pub const ImGuiStyleVar_WindowMinSize = @enumToInt(ImGuiStyleVar_.WindowMinSize);
pub const ImGuiStyleVar_WindowTitleAlign = @enumToInt(ImGuiStyleVar_.WindowTitleAlign);
pub const ImGuiStyleVar_ChildRounding = @enumToInt(ImGuiStyleVar_.ChildRounding);
pub const ImGuiStyleVar_ChildBorderSize = @enumToInt(ImGuiStyleVar_.ChildBorderSize);
pub const ImGuiStyleVar_PopupRounding = @enumToInt(ImGuiStyleVar_.PopupRounding);
pub const ImGuiStyleVar_PopupBorderSize = @enumToInt(ImGuiStyleVar_.PopupBorderSize);
pub const ImGuiStyleVar_FramePadding = @enumToInt(ImGuiStyleVar_.FramePadding);
pub const ImGuiStyleVar_FrameRounding = @enumToInt(ImGuiStyleVar_.FrameRounding);
pub const ImGuiStyleVar_FrameBorderSize = @enumToInt(ImGuiStyleVar_.FrameBorderSize);
pub const ImGuiStyleVar_ItemSpacing = @enumToInt(ImGuiStyleVar_.ItemSpacing);
pub const ImGuiStyleVar_ItemInnerSpacing = @enumToInt(ImGuiStyleVar_.ItemInnerSpacing);
pub const ImGuiStyleVar_IndentSpacing = @enumToInt(ImGuiStyleVar_.IndentSpacing);
pub const ImGuiStyleVar_CellPadding = @enumToInt(ImGuiStyleVar_.CellPadding);
pub const ImGuiStyleVar_ScrollbarSize = @enumToInt(ImGuiStyleVar_.ScrollbarSize);
pub const ImGuiStyleVar_ScrollbarRounding = @enumToInt(ImGuiStyleVar_.ScrollbarRounding);
pub const ImGuiStyleVar_GrabMinSize = @enumToInt(ImGuiStyleVar_.GrabMinSize);
pub const ImGuiStyleVar_GrabRounding = @enumToInt(ImGuiStyleVar_.GrabRounding);
pub const ImGuiStyleVar_TabRounding = @enumToInt(ImGuiStyleVar_.TabRounding);
pub const ImGuiStyleVar_ButtonTextAlign = @enumToInt(ImGuiStyleVar_.ButtonTextAlign);
pub const ImGuiStyleVar_SelectableTextAlign = @enumToInt(ImGuiStyleVar_.SelectableTextAlign);
pub const ImGuiStyleVar_COUNT = @enumToInt(ImGuiStyleVar_.COUNT);
pub const ImGuiButtonFlags_ = extern enum(c_int) {
    None = 0,
    MouseButtonLeft = 1,
    MouseButtonRight = 2,
    MouseButtonMiddle = 4,
    MouseButtonMask_ = 7,
    MouseButtonDefault_ = 1,
    _,
};
pub const ImGuiButtonFlags_None = @enumToInt(ImGuiButtonFlags_.None);
pub const ImGuiButtonFlags_MouseButtonLeft = @enumToInt(ImGuiButtonFlags_.MouseButtonLeft);
pub const ImGuiButtonFlags_MouseButtonRight = @enumToInt(ImGuiButtonFlags_.MouseButtonRight);
pub const ImGuiButtonFlags_MouseButtonMiddle = @enumToInt(ImGuiButtonFlags_.MouseButtonMiddle);
pub const ImGuiButtonFlags_MouseButtonMask_ = @enumToInt(ImGuiButtonFlags_.MouseButtonMask_);
pub const ImGuiButtonFlags_MouseButtonDefault_ = @enumToInt(ImGuiButtonFlags_.MouseButtonDefault_);
pub const ImGuiColorEditFlags_ = extern enum(c_int) {
    None = 0,
    NoAlpha = 2,
    NoPicker = 4,
    NoOptions = 8,
    NoSmallPreview = 16,
    NoInputs = 32,
    NoTooltip = 64,
    NoLabel = 128,
    NoSidePreview = 256,
    NoDragDrop = 512,
    NoBorder = 1024,
    AlphaBar = 65536,
    AlphaPreview = 131072,
    AlphaPreviewHalf = 262144,
    HDR = 524288,
    DisplayRGB = 1048576,
    DisplayHSV = 2097152,
    DisplayHex = 4194304,
    Uint8 = 8388608,
    Float = 16777216,
    PickerHueBar = 33554432,
    PickerHueWheel = 67108864,
    InputRGB = 134217728,
    InputHSV = 268435456,
    _OptionsDefault = 177209344,
    _DisplayMask = 7340032,
    _DataTypeMask = 25165824,
    _PickerMask = 100663296,
    _InputMask = 402653184,
    _,
};
pub const ImGuiColorEditFlags_None = @enumToInt(ImGuiColorEditFlags_.None);
pub const ImGuiColorEditFlags_NoAlpha = @enumToInt(ImGuiColorEditFlags_.NoAlpha);
pub const ImGuiColorEditFlags_NoPicker = @enumToInt(ImGuiColorEditFlags_.NoPicker);
pub const ImGuiColorEditFlags_NoOptions = @enumToInt(ImGuiColorEditFlags_.NoOptions);
pub const ImGuiColorEditFlags_NoSmallPreview = @enumToInt(ImGuiColorEditFlags_.NoSmallPreview);
pub const ImGuiColorEditFlags_NoInputs = @enumToInt(ImGuiColorEditFlags_.NoInputs);
pub const ImGuiColorEditFlags_NoTooltip = @enumToInt(ImGuiColorEditFlags_.NoTooltip);
pub const ImGuiColorEditFlags_NoLabel = @enumToInt(ImGuiColorEditFlags_.NoLabel);
pub const ImGuiColorEditFlags_NoSidePreview = @enumToInt(ImGuiColorEditFlags_.NoSidePreview);
pub const ImGuiColorEditFlags_NoDragDrop = @enumToInt(ImGuiColorEditFlags_.NoDragDrop);
pub const ImGuiColorEditFlags_NoBorder = @enumToInt(ImGuiColorEditFlags_.NoBorder);
pub const ImGuiColorEditFlags_AlphaBar = @enumToInt(ImGuiColorEditFlags_.AlphaBar);
pub const ImGuiColorEditFlags_AlphaPreview = @enumToInt(ImGuiColorEditFlags_.AlphaPreview);
pub const ImGuiColorEditFlags_AlphaPreviewHalf = @enumToInt(ImGuiColorEditFlags_.AlphaPreviewHalf);
pub const ImGuiColorEditFlags_HDR = @enumToInt(ImGuiColorEditFlags_.HDR);
pub const ImGuiColorEditFlags_DisplayRGB = @enumToInt(ImGuiColorEditFlags_.DisplayRGB);
pub const ImGuiColorEditFlags_DisplayHSV = @enumToInt(ImGuiColorEditFlags_.DisplayHSV);
pub const ImGuiColorEditFlags_DisplayHex = @enumToInt(ImGuiColorEditFlags_.DisplayHex);
pub const ImGuiColorEditFlags_Uint8 = @enumToInt(ImGuiColorEditFlags_.Uint8);
pub const ImGuiColorEditFlags_Float = @enumToInt(ImGuiColorEditFlags_.Float);
pub const ImGuiColorEditFlags_PickerHueBar = @enumToInt(ImGuiColorEditFlags_.PickerHueBar);
pub const ImGuiColorEditFlags_PickerHueWheel = @enumToInt(ImGuiColorEditFlags_.PickerHueWheel);
pub const ImGuiColorEditFlags_InputRGB = @enumToInt(ImGuiColorEditFlags_.InputRGB);
pub const ImGuiColorEditFlags_InputHSV = @enumToInt(ImGuiColorEditFlags_.InputHSV);
pub const ImGuiColorEditFlags__OptionsDefault = @enumToInt(ImGuiColorEditFlags_._OptionsDefault);
pub const ImGuiColorEditFlags__DisplayMask = @enumToInt(ImGuiColorEditFlags_._DisplayMask);
pub const ImGuiColorEditFlags__DataTypeMask = @enumToInt(ImGuiColorEditFlags_._DataTypeMask);
pub const ImGuiColorEditFlags__PickerMask = @enumToInt(ImGuiColorEditFlags_._PickerMask);
pub const ImGuiColorEditFlags__InputMask = @enumToInt(ImGuiColorEditFlags_._InputMask);
pub const ImGuiSliderFlags_ = extern enum(c_int) {
    None = 0,
    AlwaysClamp = 16,
    Logarithmic = 32,
    NoRoundToFormat = 64,
    NoInput = 128,
    InvalidMask_ = 1879048207,
    _,
};
pub const ImGuiSliderFlags_None = @enumToInt(ImGuiSliderFlags_.None);
pub const ImGuiSliderFlags_AlwaysClamp = @enumToInt(ImGuiSliderFlags_.AlwaysClamp);
pub const ImGuiSliderFlags_Logarithmic = @enumToInt(ImGuiSliderFlags_.Logarithmic);
pub const ImGuiSliderFlags_NoRoundToFormat = @enumToInt(ImGuiSliderFlags_.NoRoundToFormat);
pub const ImGuiSliderFlags_NoInput = @enumToInt(ImGuiSliderFlags_.NoInput);
pub const ImGuiSliderFlags_InvalidMask_ = @enumToInt(ImGuiSliderFlags_.InvalidMask_);
pub const ImGuiMouseButton_ = extern enum(c_int) {
    Left = 0,
    Right = 1,
    Middle = 2,
    COUNT = 5,
    _,
};
pub const ImGuiMouseButton_Left = @enumToInt(ImGuiMouseButton_.Left);
pub const ImGuiMouseButton_Right = @enumToInt(ImGuiMouseButton_.Right);
pub const ImGuiMouseButton_Middle = @enumToInt(ImGuiMouseButton_.Middle);
pub const ImGuiMouseButton_COUNT = @enumToInt(ImGuiMouseButton_.COUNT);
pub const ImGuiMouseCursor_ = extern enum(c_int) {
    None = -1,
    Arrow = 0,
    TextInput = 1,
    ResizeAll = 2,
    ResizeNS = 3,
    ResizeEW = 4,
    ResizeNESW = 5,
    ResizeNWSE = 6,
    Hand = 7,
    NotAllowed = 8,
    COUNT = 9,
    _,
};
pub const ImGuiMouseCursor_None = @enumToInt(ImGuiMouseCursor_.None);
pub const ImGuiMouseCursor_Arrow = @enumToInt(ImGuiMouseCursor_.Arrow);
pub const ImGuiMouseCursor_TextInput = @enumToInt(ImGuiMouseCursor_.TextInput);
pub const ImGuiMouseCursor_ResizeAll = @enumToInt(ImGuiMouseCursor_.ResizeAll);
pub const ImGuiMouseCursor_ResizeNS = @enumToInt(ImGuiMouseCursor_.ResizeNS);
pub const ImGuiMouseCursor_ResizeEW = @enumToInt(ImGuiMouseCursor_.ResizeEW);
pub const ImGuiMouseCursor_ResizeNESW = @enumToInt(ImGuiMouseCursor_.ResizeNESW);
pub const ImGuiMouseCursor_ResizeNWSE = @enumToInt(ImGuiMouseCursor_.ResizeNWSE);
pub const ImGuiMouseCursor_Hand = @enumToInt(ImGuiMouseCursor_.Hand);
pub const ImGuiMouseCursor_NotAllowed = @enumToInt(ImGuiMouseCursor_.NotAllowed);
pub const ImGuiMouseCursor_COUNT = @enumToInt(ImGuiMouseCursor_.COUNT);
pub const ImGuiCond_ = extern enum(c_int) {
    None = 0,
    Always = 1,
    Once = 2,
    FirstUseEver = 4,
    Appearing = 8,
    _,
};
pub const ImGuiCond_None = @enumToInt(ImGuiCond_.None);
pub const ImGuiCond_Always = @enumToInt(ImGuiCond_.Always);
pub const ImGuiCond_Once = @enumToInt(ImGuiCond_.Once);
pub const ImGuiCond_FirstUseEver = @enumToInt(ImGuiCond_.FirstUseEver);
pub const ImGuiCond_Appearing = @enumToInt(ImGuiCond_.Appearing);
pub const ImDrawFlags_ = extern enum(c_int) {
    None = 0,
    Closed = 1,
    RoundCornersTopLeft = 16,
    RoundCornersTopRight = 32,
    RoundCornersBottomLeft = 64,
    RoundCornersBottomRight = 128,
    RoundCornersNone = 256,
    RoundCornersTop = 48,
    RoundCornersBottom = 192,
    RoundCornersLeft = 80,
    RoundCornersRight = 160,
    RoundCornersAll = 240,
    RoundCornersDefault_ = 240,
    RoundCornersMask_ = 496,
    _,
};
pub const ImDrawFlags_None = @enumToInt(ImDrawFlags_.None);
pub const ImDrawFlags_Closed = @enumToInt(ImDrawFlags_.Closed);
pub const ImDrawFlags_RoundCornersTopLeft = @enumToInt(ImDrawFlags_.RoundCornersTopLeft);
pub const ImDrawFlags_RoundCornersTopRight = @enumToInt(ImDrawFlags_.RoundCornersTopRight);
pub const ImDrawFlags_RoundCornersBottomLeft = @enumToInt(ImDrawFlags_.RoundCornersBottomLeft);
pub const ImDrawFlags_RoundCornersBottomRight = @enumToInt(ImDrawFlags_.RoundCornersBottomRight);
pub const ImDrawFlags_RoundCornersNone = @enumToInt(ImDrawFlags_.RoundCornersNone);
pub const ImDrawFlags_RoundCornersTop = @enumToInt(ImDrawFlags_.RoundCornersTop);
pub const ImDrawFlags_RoundCornersBottom = @enumToInt(ImDrawFlags_.RoundCornersBottom);
pub const ImDrawFlags_RoundCornersLeft = @enumToInt(ImDrawFlags_.RoundCornersLeft);
pub const ImDrawFlags_RoundCornersRight = @enumToInt(ImDrawFlags_.RoundCornersRight);
pub const ImDrawFlags_RoundCornersAll = @enumToInt(ImDrawFlags_.RoundCornersAll);
pub const ImDrawFlags_RoundCornersDefault_ = @enumToInt(ImDrawFlags_.RoundCornersDefault_);
pub const ImDrawFlags_RoundCornersMask_ = @enumToInt(ImDrawFlags_.RoundCornersMask_);
pub const ImDrawListFlags_ = extern enum(c_int) {
    None = 0,
    AntiAliasedLines = 1,
    AntiAliasedLinesUseTex = 2,
    AntiAliasedFill = 4,
    AllowVtxOffset = 8,
    _,
};
pub const ImDrawListFlags_None = @enumToInt(ImDrawListFlags_.None);
pub const ImDrawListFlags_AntiAliasedLines = @enumToInt(ImDrawListFlags_.AntiAliasedLines);
pub const ImDrawListFlags_AntiAliasedLinesUseTex = @enumToInt(ImDrawListFlags_.AntiAliasedLinesUseTex);
pub const ImDrawListFlags_AntiAliasedFill = @enumToInt(ImDrawListFlags_.AntiAliasedFill);
pub const ImDrawListFlags_AllowVtxOffset = @enumToInt(ImDrawListFlags_.AllowVtxOffset);
pub const ImFontAtlasFlags_ = extern enum(c_int) {
    None = 0,
    NoPowerOfTwoHeight = 1,
    NoMouseCursors = 2,
    NoBakedLines = 4,
    _,
};
pub const ImFontAtlasFlags_None = @enumToInt(ImFontAtlasFlags_.None);
pub const ImFontAtlasFlags_NoPowerOfTwoHeight = @enumToInt(ImFontAtlasFlags_.NoPowerOfTwoHeight);
pub const ImFontAtlasFlags_NoMouseCursors = @enumToInt(ImFontAtlasFlags_.NoMouseCursors);
pub const ImFontAtlasFlags_NoBakedLines = @enumToInt(ImFontAtlasFlags_.NoBakedLines);
pub const ImGuiViewportFlags_ = extern enum(c_int) {
    None = 0,
    IsPlatformWindow = 1,
    IsPlatformMonitor = 2,
    OwnedByApp = 4,
    _,
};
pub const ImGuiViewportFlags_None = @enumToInt(ImGuiViewportFlags_.None);
pub const ImGuiViewportFlags_IsPlatformWindow = @enumToInt(ImGuiViewportFlags_.IsPlatformWindow);
pub const ImGuiViewportFlags_IsPlatformMonitor = @enumToInt(ImGuiViewportFlags_.IsPlatformMonitor);
pub const ImGuiViewportFlags_OwnedByApp = @enumToInt(ImGuiViewportFlags_.OwnedByApp);
pub const ImGuiItemFlags_ = extern enum(c_int) {
    None = 0,
    NoTabStop = 1,
    ButtonRepeat = 2,
    Disabled = 4,
    NoNav = 8,
    NoNavDefaultFocus = 16,
    SelectableDontClosePopup = 32,
    MixedValue = 64,
    ReadOnly = 128,
    Default_ = 0,
    _,
};
pub const ImGuiItemFlags_None = @enumToInt(ImGuiItemFlags_.None);
pub const ImGuiItemFlags_NoTabStop = @enumToInt(ImGuiItemFlags_.NoTabStop);
pub const ImGuiItemFlags_ButtonRepeat = @enumToInt(ImGuiItemFlags_.ButtonRepeat);
pub const ImGuiItemFlags_Disabled = @enumToInt(ImGuiItemFlags_.Disabled);
pub const ImGuiItemFlags_NoNav = @enumToInt(ImGuiItemFlags_.NoNav);
pub const ImGuiItemFlags_NoNavDefaultFocus = @enumToInt(ImGuiItemFlags_.NoNavDefaultFocus);
pub const ImGuiItemFlags_SelectableDontClosePopup = @enumToInt(ImGuiItemFlags_.SelectableDontClosePopup);
pub const ImGuiItemFlags_MixedValue = @enumToInt(ImGuiItemFlags_.MixedValue);
pub const ImGuiItemFlags_ReadOnly = @enumToInt(ImGuiItemFlags_.ReadOnly);
pub const ImGuiItemFlags_Default_ = @enumToInt(ImGuiItemFlags_.Default_);
pub const ImGuiItemStatusFlags_ = extern enum(c_int) {
    None = 0,
    HoveredRect = 1,
    HasDisplayRect = 2,
    Edited = 4,
    ToggledSelection = 8,
    ToggledOpen = 16,
    HasDeactivated = 32,
    Deactivated = 64,
    HoveredWindow = 128,
    _,
};
pub const ImGuiItemStatusFlags_None = @enumToInt(ImGuiItemStatusFlags_.None);
pub const ImGuiItemStatusFlags_HoveredRect = @enumToInt(ImGuiItemStatusFlags_.HoveredRect);
pub const ImGuiItemStatusFlags_HasDisplayRect = @enumToInt(ImGuiItemStatusFlags_.HasDisplayRect);
pub const ImGuiItemStatusFlags_Edited = @enumToInt(ImGuiItemStatusFlags_.Edited);
pub const ImGuiItemStatusFlags_ToggledSelection = @enumToInt(ImGuiItemStatusFlags_.ToggledSelection);
pub const ImGuiItemStatusFlags_ToggledOpen = @enumToInt(ImGuiItemStatusFlags_.ToggledOpen);
pub const ImGuiItemStatusFlags_HasDeactivated = @enumToInt(ImGuiItemStatusFlags_.HasDeactivated);
pub const ImGuiItemStatusFlags_Deactivated = @enumToInt(ImGuiItemStatusFlags_.Deactivated);
pub const ImGuiItemStatusFlags_HoveredWindow = @enumToInt(ImGuiItemStatusFlags_.HoveredWindow);
pub const ImGuiButtonFlagsPrivate_ = extern enum(c_int) {
    ImGuiButtonFlags_PressedOnClick = 16,
    ImGuiButtonFlags_PressedOnClickRelease = 32,
    ImGuiButtonFlags_PressedOnClickReleaseAnywhere = 64,
    ImGuiButtonFlags_PressedOnRelease = 128,
    ImGuiButtonFlags_PressedOnDoubleClick = 256,
    ImGuiButtonFlags_PressedOnDragDropHold = 512,
    ImGuiButtonFlags_Repeat = 1024,
    ImGuiButtonFlags_FlattenChildren = 2048,
    ImGuiButtonFlags_AllowItemOverlap = 4096,
    ImGuiButtonFlags_DontClosePopups = 8192,
    ImGuiButtonFlags_Disabled = 16384,
    ImGuiButtonFlags_AlignTextBaseLine = 32768,
    ImGuiButtonFlags_NoKeyModifiers = 65536,
    ImGuiButtonFlags_NoHoldingActiveId = 131072,
    ImGuiButtonFlags_NoNavFocus = 262144,
    ImGuiButtonFlags_NoHoveredOnFocus = 524288,
    ImGuiButtonFlags_PressedOnMask_ = 1008,
    ImGuiButtonFlags_PressedOnDefault_ = 32,
    _,
};
pub const ImGuiButtonFlags_PressedOnClick = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_PressedOnClick);
pub const ImGuiButtonFlags_PressedOnClickRelease = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_PressedOnClickRelease);
pub const ImGuiButtonFlags_PressedOnClickReleaseAnywhere = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_PressedOnClickReleaseAnywhere);
pub const ImGuiButtonFlags_PressedOnRelease = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_PressedOnRelease);
pub const ImGuiButtonFlags_PressedOnDoubleClick = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_PressedOnDoubleClick);
pub const ImGuiButtonFlags_PressedOnDragDropHold = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_PressedOnDragDropHold);
pub const ImGuiButtonFlags_Repeat = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_Repeat);
pub const ImGuiButtonFlags_FlattenChildren = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_FlattenChildren);
pub const ImGuiButtonFlags_AllowItemOverlap = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_AllowItemOverlap);
pub const ImGuiButtonFlags_DontClosePopups = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_DontClosePopups);
pub const ImGuiButtonFlags_Disabled = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_Disabled);
pub const ImGuiButtonFlags_AlignTextBaseLine = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_AlignTextBaseLine);
pub const ImGuiButtonFlags_NoKeyModifiers = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_NoKeyModifiers);
pub const ImGuiButtonFlags_NoHoldingActiveId = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_NoHoldingActiveId);
pub const ImGuiButtonFlags_NoNavFocus = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_NoNavFocus);
pub const ImGuiButtonFlags_NoHoveredOnFocus = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_NoHoveredOnFocus);
pub const ImGuiButtonFlags_PressedOnMask_ = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_PressedOnMask_);
pub const ImGuiButtonFlags_PressedOnDefault_ = @enumToInt(ImGuiButtonFlagsPrivate_.ImGuiButtonFlags_PressedOnDefault_);
pub const ImGuiSliderFlagsPrivate_ = extern enum(c_int) {
    ImGuiSliderFlags_Vertical = 1048576,
    ImGuiSliderFlags_ReadOnly = 2097152,
    _,
};
pub const ImGuiSliderFlags_Vertical = @enumToInt(ImGuiSliderFlagsPrivate_.ImGuiSliderFlags_Vertical);
pub const ImGuiSliderFlags_ReadOnly = @enumToInt(ImGuiSliderFlagsPrivate_.ImGuiSliderFlags_ReadOnly);
pub const ImGuiSelectableFlagsPrivate_ = extern enum(c_int) {
    ImGuiSelectableFlags_NoHoldingActiveID = 1048576,
    ImGuiSelectableFlags_SelectOnClick = 2097152,
    ImGuiSelectableFlags_SelectOnRelease = 4194304,
    ImGuiSelectableFlags_SpanAvailWidth = 8388608,
    ImGuiSelectableFlags_DrawHoveredWhenHeld = 16777216,
    ImGuiSelectableFlags_SetNavIdOnHover = 33554432,
    ImGuiSelectableFlags_NoPadWithHalfSpacing = 67108864,
    _,
};
pub const ImGuiSelectableFlags_NoHoldingActiveID = @enumToInt(ImGuiSelectableFlagsPrivate_.ImGuiSelectableFlags_NoHoldingActiveID);
pub const ImGuiSelectableFlags_SelectOnClick = @enumToInt(ImGuiSelectableFlagsPrivate_.ImGuiSelectableFlags_SelectOnClick);
pub const ImGuiSelectableFlags_SelectOnRelease = @enumToInt(ImGuiSelectableFlagsPrivate_.ImGuiSelectableFlags_SelectOnRelease);
pub const ImGuiSelectableFlags_SpanAvailWidth = @enumToInt(ImGuiSelectableFlagsPrivate_.ImGuiSelectableFlags_SpanAvailWidth);
pub const ImGuiSelectableFlags_DrawHoveredWhenHeld = @enumToInt(ImGuiSelectableFlagsPrivate_.ImGuiSelectableFlags_DrawHoveredWhenHeld);
pub const ImGuiSelectableFlags_SetNavIdOnHover = @enumToInt(ImGuiSelectableFlagsPrivate_.ImGuiSelectableFlags_SetNavIdOnHover);
pub const ImGuiSelectableFlags_NoPadWithHalfSpacing = @enumToInt(ImGuiSelectableFlagsPrivate_.ImGuiSelectableFlags_NoPadWithHalfSpacing);
pub const ImGuiTreeNodeFlagsPrivate_ = extern enum(c_int) {
    ImGuiTreeNodeFlags_ClipLabelForTrailingButton = 1048576,
    _,
};
pub const ImGuiTreeNodeFlags_ClipLabelForTrailingButton = @enumToInt(ImGuiTreeNodeFlagsPrivate_.ImGuiTreeNodeFlags_ClipLabelForTrailingButton);
pub const ImGuiSeparatorFlags_ = extern enum(c_int) {
    None = 0,
    Horizontal = 1,
    Vertical = 2,
    SpanAllColumns = 4,
    _,
};
pub const ImGuiSeparatorFlags_None = @enumToInt(ImGuiSeparatorFlags_.None);
pub const ImGuiSeparatorFlags_Horizontal = @enumToInt(ImGuiSeparatorFlags_.Horizontal);
pub const ImGuiSeparatorFlags_Vertical = @enumToInt(ImGuiSeparatorFlags_.Vertical);
pub const ImGuiSeparatorFlags_SpanAllColumns = @enumToInt(ImGuiSeparatorFlags_.SpanAllColumns);
pub const ImGuiTextFlags_ = extern enum(c_int) {
    None = 0,
    NoWidthForLargeClippedText = 1,
    _,
};
pub const ImGuiTextFlags_None = @enumToInt(ImGuiTextFlags_.None);
pub const ImGuiTextFlags_NoWidthForLargeClippedText = @enumToInt(ImGuiTextFlags_.NoWidthForLargeClippedText);
pub const ImGuiTooltipFlags_ = extern enum(c_int) {
    None = 0,
    OverridePreviousTooltip = 1,
    _,
};
pub const ImGuiTooltipFlags_None = @enumToInt(ImGuiTooltipFlags_.None);
pub const ImGuiTooltipFlags_OverridePreviousTooltip = @enumToInt(ImGuiTooltipFlags_.OverridePreviousTooltip);
pub const ImGuiLayoutType_ = extern enum(c_int) {
    Horizontal = 0,
    Vertical = 1,
    _,
};
pub const ImGuiLayoutType_Horizontal = @enumToInt(ImGuiLayoutType_.Horizontal);
pub const ImGuiLayoutType_Vertical = @enumToInt(ImGuiLayoutType_.Vertical);
pub const ImGuiLogType = extern enum(c_int) {
    _None = 0,
    _TTY = 1,
    _File = 2,
    _Buffer = 3,
    _Clipboard = 4,
    _,
};
pub const ImGuiLogType_None = @enumToInt(ImGuiLogType._None);
pub const ImGuiLogType_TTY = @enumToInt(ImGuiLogType._TTY);
pub const ImGuiLogType_File = @enumToInt(ImGuiLogType._File);
pub const ImGuiLogType_Buffer = @enumToInt(ImGuiLogType._Buffer);
pub const ImGuiLogType_Clipboard = @enumToInt(ImGuiLogType._Clipboard);
pub const ImGuiAxis = extern enum(c_int) {
    _None = -1,
    _X = 0,
    _Y = 1,
    _,
};
pub const ImGuiAxis_None = @enumToInt(ImGuiAxis._None);
pub const ImGuiAxis_X = @enumToInt(ImGuiAxis._X);
pub const ImGuiAxis_Y = @enumToInt(ImGuiAxis._Y);
pub const ImGuiPlotType = extern enum(c_int) {
    _Lines,
    _Histogram,
    _,
};
pub const ImGuiPlotType_Lines = @enumToInt(ImGuiPlotType._Lines);
pub const ImGuiPlotType_Histogram = @enumToInt(ImGuiPlotType._Histogram);
pub const ImGuiInputSource = extern enum(c_int) {
    _None = 0,
    _Mouse = 1,
    _Keyboard = 2,
    _Gamepad = 3,
    _Nav = 4,
    _COUNT = 5,
    _,
};
pub const ImGuiInputSource_None = @enumToInt(ImGuiInputSource._None);
pub const ImGuiInputSource_Mouse = @enumToInt(ImGuiInputSource._Mouse);
pub const ImGuiInputSource_Keyboard = @enumToInt(ImGuiInputSource._Keyboard);
pub const ImGuiInputSource_Gamepad = @enumToInt(ImGuiInputSource._Gamepad);
pub const ImGuiInputSource_Nav = @enumToInt(ImGuiInputSource._Nav);
pub const ImGuiInputSource_COUNT = @enumToInt(ImGuiInputSource._COUNT);
pub const ImGuiInputReadMode = extern enum(c_int) {
    _Down,
    _Pressed,
    _Released,
    _Repeat,
    _RepeatSlow,
    _RepeatFast,
    _,
};
pub const ImGuiInputReadMode_Down = @enumToInt(ImGuiInputReadMode._Down);
pub const ImGuiInputReadMode_Pressed = @enumToInt(ImGuiInputReadMode._Pressed);
pub const ImGuiInputReadMode_Released = @enumToInt(ImGuiInputReadMode._Released);
pub const ImGuiInputReadMode_Repeat = @enumToInt(ImGuiInputReadMode._Repeat);
pub const ImGuiInputReadMode_RepeatSlow = @enumToInt(ImGuiInputReadMode._RepeatSlow);
pub const ImGuiInputReadMode_RepeatFast = @enumToInt(ImGuiInputReadMode._RepeatFast);
pub const ImGuiNavHighlightFlags_ = extern enum(c_int) {
    None = 0,
    TypeDefault = 1,
    TypeThin = 2,
    AlwaysDraw = 4,
    NoRounding = 8,
    _,
};
pub const ImGuiNavHighlightFlags_None = @enumToInt(ImGuiNavHighlightFlags_.None);
pub const ImGuiNavHighlightFlags_TypeDefault = @enumToInt(ImGuiNavHighlightFlags_.TypeDefault);
pub const ImGuiNavHighlightFlags_TypeThin = @enumToInt(ImGuiNavHighlightFlags_.TypeThin);
pub const ImGuiNavHighlightFlags_AlwaysDraw = @enumToInt(ImGuiNavHighlightFlags_.AlwaysDraw);
pub const ImGuiNavHighlightFlags_NoRounding = @enumToInt(ImGuiNavHighlightFlags_.NoRounding);
pub const ImGuiNavDirSourceFlags_ = extern enum(c_int) {
    None = 0,
    Keyboard = 1,
    PadDPad = 2,
    PadLStick = 4,
    _,
};
pub const ImGuiNavDirSourceFlags_None = @enumToInt(ImGuiNavDirSourceFlags_.None);
pub const ImGuiNavDirSourceFlags_Keyboard = @enumToInt(ImGuiNavDirSourceFlags_.Keyboard);
pub const ImGuiNavDirSourceFlags_PadDPad = @enumToInt(ImGuiNavDirSourceFlags_.PadDPad);
pub const ImGuiNavDirSourceFlags_PadLStick = @enumToInt(ImGuiNavDirSourceFlags_.PadLStick);
pub const ImGuiNavMoveFlags_ = extern enum(c_int) {
    None = 0,
    LoopX = 1,
    LoopY = 2,
    WrapX = 4,
    WrapY = 8,
    AllowCurrentNavId = 16,
    AlsoScoreVisibleSet = 32,
    ScrollToEdge = 64,
    _,
};
pub const ImGuiNavMoveFlags_None = @enumToInt(ImGuiNavMoveFlags_.None);
pub const ImGuiNavMoveFlags_LoopX = @enumToInt(ImGuiNavMoveFlags_.LoopX);
pub const ImGuiNavMoveFlags_LoopY = @enumToInt(ImGuiNavMoveFlags_.LoopY);
pub const ImGuiNavMoveFlags_WrapX = @enumToInt(ImGuiNavMoveFlags_.WrapX);
pub const ImGuiNavMoveFlags_WrapY = @enumToInt(ImGuiNavMoveFlags_.WrapY);
pub const ImGuiNavMoveFlags_AllowCurrentNavId = @enumToInt(ImGuiNavMoveFlags_.AllowCurrentNavId);
pub const ImGuiNavMoveFlags_AlsoScoreVisibleSet = @enumToInt(ImGuiNavMoveFlags_.AlsoScoreVisibleSet);
pub const ImGuiNavMoveFlags_ScrollToEdge = @enumToInt(ImGuiNavMoveFlags_.ScrollToEdge);
pub const ImGuiNavForward = extern enum(c_int) {
    _None,
    _ForwardQueued,
    _ForwardActive,
    _,
};
pub const ImGuiNavForward_None = @enumToInt(ImGuiNavForward._None);
pub const ImGuiNavForward_ForwardQueued = @enumToInt(ImGuiNavForward._ForwardQueued);
pub const ImGuiNavForward_ForwardActive = @enumToInt(ImGuiNavForward._ForwardActive);
pub const ImGuiNavLayer = extern enum(c_int) {
    _Main = 0,
    _Menu = 1,
    _COUNT = 2,
    _,
};
pub const ImGuiNavLayer_Main = @enumToInt(ImGuiNavLayer._Main);
pub const ImGuiNavLayer_Menu = @enumToInt(ImGuiNavLayer._Menu);
pub const ImGuiNavLayer_COUNT = @enumToInt(ImGuiNavLayer._COUNT);
pub const ImGuiPopupPositionPolicy = extern enum(c_int) {
    _Default,
    _ComboBox,
    _Tooltip,
    _,
};
pub const ImGuiPopupPositionPolicy_Default = @enumToInt(ImGuiPopupPositionPolicy._Default);
pub const ImGuiPopupPositionPolicy_ComboBox = @enumToInt(ImGuiPopupPositionPolicy._ComboBox);
pub const ImGuiPopupPositionPolicy_Tooltip = @enumToInt(ImGuiPopupPositionPolicy._Tooltip);
pub const ImGuiDataTypePrivate_ = extern enum(c_int) {
    ImGuiDataType_String = 11,
    ImGuiDataType_Pointer = 12,
    ImGuiDataType_ID = 13,
    _,
};
pub const ImGuiDataType_String = @enumToInt(ImGuiDataTypePrivate_.ImGuiDataType_String);
pub const ImGuiDataType_Pointer = @enumToInt(ImGuiDataTypePrivate_.ImGuiDataType_Pointer);
pub const ImGuiDataType_ID = @enumToInt(ImGuiDataTypePrivate_.ImGuiDataType_ID);
pub const ImGuiNextWindowDataFlags_ = extern enum(c_int) {
    None = 0,
    HasPos = 1,
    HasSize = 2,
    HasContentSize = 4,
    HasCollapsed = 8,
    HasSizeConstraint = 16,
    HasFocus = 32,
    HasBgAlpha = 64,
    HasScroll = 128,
    _,
};
pub const ImGuiNextWindowDataFlags_None = @enumToInt(ImGuiNextWindowDataFlags_.None);
pub const ImGuiNextWindowDataFlags_HasPos = @enumToInt(ImGuiNextWindowDataFlags_.HasPos);
pub const ImGuiNextWindowDataFlags_HasSize = @enumToInt(ImGuiNextWindowDataFlags_.HasSize);
pub const ImGuiNextWindowDataFlags_HasContentSize = @enumToInt(ImGuiNextWindowDataFlags_.HasContentSize);
pub const ImGuiNextWindowDataFlags_HasCollapsed = @enumToInt(ImGuiNextWindowDataFlags_.HasCollapsed);
pub const ImGuiNextWindowDataFlags_HasSizeConstraint = @enumToInt(ImGuiNextWindowDataFlags_.HasSizeConstraint);
pub const ImGuiNextWindowDataFlags_HasFocus = @enumToInt(ImGuiNextWindowDataFlags_.HasFocus);
pub const ImGuiNextWindowDataFlags_HasBgAlpha = @enumToInt(ImGuiNextWindowDataFlags_.HasBgAlpha);
pub const ImGuiNextWindowDataFlags_HasScroll = @enumToInt(ImGuiNextWindowDataFlags_.HasScroll);
pub const ImGuiNextItemDataFlags_ = extern enum(c_int) {
    None = 0,
    HasWidth = 1,
    HasOpen = 2,
    _,
};
pub const ImGuiNextItemDataFlags_None = @enumToInt(ImGuiNextItemDataFlags_.None);
pub const ImGuiNextItemDataFlags_HasWidth = @enumToInt(ImGuiNextItemDataFlags_.HasWidth);
pub const ImGuiNextItemDataFlags_HasOpen = @enumToInt(ImGuiNextItemDataFlags_.HasOpen);
pub const ImGuiOldColumnFlags_ = extern enum(c_int) {
    None = 0,
    NoBorder = 1,
    NoResize = 2,
    NoPreserveWidths = 4,
    NoForceWithinWindow = 8,
    GrowParentContentsSize = 16,
    _,
};
pub const ImGuiOldColumnFlags_None = @enumToInt(ImGuiOldColumnFlags_.None);
pub const ImGuiOldColumnFlags_NoBorder = @enumToInt(ImGuiOldColumnFlags_.NoBorder);
pub const ImGuiOldColumnFlags_NoResize = @enumToInt(ImGuiOldColumnFlags_.NoResize);
pub const ImGuiOldColumnFlags_NoPreserveWidths = @enumToInt(ImGuiOldColumnFlags_.NoPreserveWidths);
pub const ImGuiOldColumnFlags_NoForceWithinWindow = @enumToInt(ImGuiOldColumnFlags_.NoForceWithinWindow);
pub const ImGuiOldColumnFlags_GrowParentContentsSize = @enumToInt(ImGuiOldColumnFlags_.GrowParentContentsSize);
pub const ImGuiContextHookType = extern enum(c_int) {
    _NewFramePre,
    _NewFramePost,
    _EndFramePre,
    _EndFramePost,
    _RenderPre,
    _RenderPost,
    _Shutdown,
    _PendingRemoval_,
    _,
};
pub const ImGuiContextHookType_NewFramePre = @enumToInt(ImGuiContextHookType._NewFramePre);
pub const ImGuiContextHookType_NewFramePost = @enumToInt(ImGuiContextHookType._NewFramePost);
pub const ImGuiContextHookType_EndFramePre = @enumToInt(ImGuiContextHookType._EndFramePre);
pub const ImGuiContextHookType_EndFramePost = @enumToInt(ImGuiContextHookType._EndFramePost);
pub const ImGuiContextHookType_RenderPre = @enumToInt(ImGuiContextHookType._RenderPre);
pub const ImGuiContextHookType_RenderPost = @enumToInt(ImGuiContextHookType._RenderPost);
pub const ImGuiContextHookType_Shutdown = @enumToInt(ImGuiContextHookType._Shutdown);
pub const ImGuiContextHookType_PendingRemoval_ = @enumToInt(ImGuiContextHookType._PendingRemoval_);
pub const ImGuiTabBarFlagsPrivate_ = extern enum(c_int) {
    ImGuiTabBarFlags_DockNode = 1048576,
    ImGuiTabBarFlags_IsFocused = 2097152,
    ImGuiTabBarFlags_SaveSettings = 4194304,
    _,
};
pub const ImGuiTabBarFlags_DockNode = @enumToInt(ImGuiTabBarFlagsPrivate_.ImGuiTabBarFlags_DockNode);
pub const ImGuiTabBarFlags_IsFocused = @enumToInt(ImGuiTabBarFlagsPrivate_.ImGuiTabBarFlags_IsFocused);
pub const ImGuiTabBarFlags_SaveSettings = @enumToInt(ImGuiTabBarFlagsPrivate_.ImGuiTabBarFlags_SaveSettings);
pub const ImGuiTabItemFlagsPrivate_ = extern enum(c_int) {
    ImGuiTabItemFlags_NoCloseButton = 1048576,
    ImGuiTabItemFlags_Button = 2097152,
    _,
};
pub const ImGuiTabItemFlags_NoCloseButton = @enumToInt(ImGuiTabItemFlagsPrivate_.ImGuiTabItemFlags_NoCloseButton);
pub const ImGuiTabItemFlags_Button = @enumToInt(ImGuiTabItemFlagsPrivate_.ImGuiTabItemFlags_Button);
pub extern fn ImVec2_ImVec2_Nil() [*c]ImVec2;
pub extern fn ImVec2_destroy(self: [*c]ImVec2) void;
pub extern fn ImVec2_ImVec2_Float(_x: f32, _y: f32) [*c]ImVec2;
pub extern fn ImVec4_ImVec4_Nil() [*c]ImVec4;
pub extern fn ImVec4_destroy(self: [*c]ImVec4) void;
pub extern fn ImVec4_ImVec4_Float(_x: f32, _y: f32, _z: f32, _w: f32) [*c]ImVec4;
pub extern fn igCreateContext(shared_font_atlas: [*c]ImFontAtlas) [*c]ImGuiContext;
pub extern fn igDestroyContext(ctx: [*c]ImGuiContext) void;
pub extern fn igGetCurrentContext() [*c]ImGuiContext;
pub extern fn igSetCurrentContext(ctx: [*c]ImGuiContext) void;
pub extern fn igGetIO() [*c]ImGuiIO;
pub extern fn igGetStyle() [*c]ImGuiStyle;
pub extern fn igNewFrame() void;
pub extern fn igEndFrame() void;
pub extern fn igRender() void;
pub extern fn igGetDrawData() [*c]ImDrawData;
pub extern fn igShowDemoWindow(p_open: [*c]bool) void;
pub extern fn igShowMetricsWindow(p_open: [*c]bool) void;
pub extern fn igShowAboutWindow(p_open: [*c]bool) void;
pub extern fn igShowStyleEditor(ref: [*c]ImGuiStyle) void;
pub extern fn igShowStyleSelector(label: [*c]const u8) bool;
pub extern fn igShowFontSelector(label: [*c]const u8) void;
pub extern fn igShowUserGuide() void;
pub extern fn igGetVersion() [*c]const u8;
pub extern fn igStyleColorsDark(dst: [*c]ImGuiStyle) void;
pub extern fn igStyleColorsLight(dst: [*c]ImGuiStyle) void;
pub extern fn igStyleColorsClassic(dst: [*c]ImGuiStyle) void;
pub extern fn igBegin(name: [*c]const u8, p_open: [*c]bool, flags: ImGuiWindowFlags) bool;
pub extern fn igEnd() void;
pub extern fn igBeginChild_Str(str_id: [*c]const u8, size: ImVec2, border: bool, flags: ImGuiWindowFlags) bool;
pub extern fn igBeginChild_ID(id: ImGuiID, size: ImVec2, border: bool, flags: ImGuiWindowFlags) bool;
pub extern fn igEndChild() void;
pub extern fn igIsWindowAppearing() bool;
pub extern fn igIsWindowCollapsed() bool;
pub extern fn igIsWindowFocused(flags: ImGuiFocusedFlags) bool;
pub extern fn igIsWindowHovered(flags: ImGuiHoveredFlags) bool;
pub extern fn igGetWindowDrawList() [*c]ImDrawList;
pub extern fn igGetWindowPos(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowSize(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowWidth() f32;
pub extern fn igGetWindowHeight() f32;
pub extern fn igSetNextWindowPos(pos: ImVec2, cond: ImGuiCond, pivot: ImVec2) void;
pub extern fn igSetNextWindowSize(size: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetNextWindowSizeConstraints(size_min: ImVec2, size_max: ImVec2, custom_callback: ImGuiSizeCallback, custom_callback_data: ?*c_void) void;
pub extern fn igSetNextWindowContentSize(size: ImVec2) void;
pub extern fn igSetNextWindowCollapsed(collapsed: bool, cond: ImGuiCond) void;
pub extern fn igSetNextWindowFocus() void;
pub extern fn igSetNextWindowBgAlpha(alpha: f32) void;
pub extern fn igSetWindowPos_Vec2(pos: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowSize_Vec2(size: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowCollapsed_Bool(collapsed: bool, cond: ImGuiCond) void;
pub extern fn igSetWindowFocus_Nil() void;
pub extern fn igSetWindowFontScale(scale: f32) void;
pub extern fn igSetWindowPos_Str(name: [*c]const u8, pos: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowSize_Str(name: [*c]const u8, size: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowCollapsed_Str(name: [*c]const u8, collapsed: bool, cond: ImGuiCond) void;
pub extern fn igSetWindowFocus_Str(name: [*c]const u8) void;
pub extern fn igGetContentRegionAvail(pOut: [*c]ImVec2) void;
pub extern fn igGetContentRegionMax(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowContentRegionMin(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowContentRegionMax(pOut: [*c]ImVec2) void;
pub extern fn igGetWindowContentRegionWidth() f32;
pub extern fn igGetScrollX() f32;
pub extern fn igGetScrollY() f32;
pub extern fn igSetScrollX_Float(scroll_x: f32) void;
pub extern fn igSetScrollY_Float(scroll_y: f32) void;
pub extern fn igGetScrollMaxX() f32;
pub extern fn igGetScrollMaxY() f32;
pub extern fn igSetScrollHereX(center_x_ratio: f32) void;
pub extern fn igSetScrollHereY(center_y_ratio: f32) void;
pub extern fn igSetScrollFromPosX_Float(local_x: f32, center_x_ratio: f32) void;
pub extern fn igSetScrollFromPosY_Float(local_y: f32, center_y_ratio: f32) void;
pub extern fn igPushFont(font: [*c]ImFont) void;
pub extern fn igPopFont() void;
pub extern fn igPushStyleColor_U32(idx: ImGuiCol, col: ImU32) void;
pub extern fn igPushStyleColor_Vec4(idx: ImGuiCol, col: ImVec4) void;
pub extern fn igPopStyleColor(count: c_int) void;
pub extern fn igPushStyleVar_Float(idx: ImGuiStyleVar, val: f32) void;
pub extern fn igPushStyleVar_Vec2(idx: ImGuiStyleVar, val: ImVec2) void;
pub extern fn igPopStyleVar(count: c_int) void;
pub extern fn igPushAllowKeyboardFocus(allow_keyboard_focus: bool) void;
pub extern fn igPopAllowKeyboardFocus() void;
pub extern fn igPushButtonRepeat(repeat: bool) void;
pub extern fn igPopButtonRepeat() void;
pub extern fn igPushItemWidth(item_width: f32) void;
pub extern fn igPopItemWidth() void;
pub extern fn igSetNextItemWidth(item_width: f32) void;
pub extern fn igCalcItemWidth() f32;
pub extern fn igPushTextWrapPos(wrap_local_pos_x: f32) void;
pub extern fn igPopTextWrapPos() void;
pub extern fn igGetFont() [*c]ImFont;
pub extern fn igGetFontSize() f32;
pub extern fn igGetFontTexUvWhitePixel(pOut: [*c]ImVec2) void;
pub extern fn igGetColorU32_Col(idx: ImGuiCol, alpha_mul: f32) ImU32;
pub extern fn igGetColorU32_Vec4(col: ImVec4) ImU32;
pub extern fn igGetColorU32_U32(col: ImU32) ImU32;
pub extern fn igGetStyleColorVec4(idx: ImGuiCol) [*c]const ImVec4;
pub extern fn igSeparator() void;
pub extern fn igSameLine(offset_from_start_x: f32, spacing: f32) void;
pub extern fn igNewLine() void;
pub extern fn igSpacing() void;
pub extern fn igDummy(size: ImVec2) void;
pub extern fn igIndent(indent_w: f32) void;
pub extern fn igUnindent(indent_w: f32) void;
pub extern fn igBeginGroup() void;
pub extern fn igEndGroup() void;
pub extern fn igGetCursorPos(pOut: [*c]ImVec2) void;
pub extern fn igGetCursorPosX() f32;
pub extern fn igGetCursorPosY() f32;
pub extern fn igSetCursorPos(local_pos: ImVec2) void;
pub extern fn igSetCursorPosX(local_x: f32) void;
pub extern fn igSetCursorPosY(local_y: f32) void;
pub extern fn igGetCursorStartPos(pOut: [*c]ImVec2) void;
pub extern fn igGetCursorScreenPos(pOut: [*c]ImVec2) void;
pub extern fn igSetCursorScreenPos(pos: ImVec2) void;
pub extern fn igAlignTextToFramePadding() void;
pub extern fn igGetTextLineHeight() f32;
pub extern fn igGetTextLineHeightWithSpacing() f32;
pub extern fn igGetFrameHeight() f32;
pub extern fn igGetFrameHeightWithSpacing() f32;
pub extern fn igPushID_Str(str_id: [*c]const u8) void;
pub extern fn igPushID_StrStr(str_id_begin: [*c]const u8, str_id_end: [*c]const u8) void;
pub extern fn igPushID_Ptr(ptr_id: ?*const c_void) void;
pub extern fn igPushID_Int(int_id: c_int) void;
pub extern fn igPopID() void;
pub extern fn igGetID_Str(str_id: [*c]const u8) ImGuiID;
pub extern fn igGetID_StrStr(str_id_begin: [*c]const u8, str_id_end: [*c]const u8) ImGuiID;
pub extern fn igGetID_Ptr(ptr_id: ?*const c_void) ImGuiID;
pub extern fn igTextUnformatted(text: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn igText(fmt: [*c]const u8, ...) void;
pub extern fn igTextV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igTextColored(col: ImVec4, fmt: [*c]const u8, ...) void;
pub extern fn igTextColoredV(col: ImVec4, fmt: [*c]const u8, args: va_list) void;
pub extern fn igTextDisabled(fmt: [*c]const u8, ...) void;
pub extern fn igTextDisabledV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igTextWrapped(fmt: [*c]const u8, ...) void;
pub extern fn igTextWrappedV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igLabelText(label: [*c]const u8, fmt: [*c]const u8, ...) void;
pub extern fn igLabelTextV(label: [*c]const u8, fmt: [*c]const u8, args: va_list) void;
pub extern fn igBulletText(fmt: [*c]const u8, ...) void;
pub extern fn igBulletTextV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igButton(label: [*c]const u8, size: ImVec2) bool;
pub extern fn igSmallButton(label: [*c]const u8) bool;
pub extern fn igInvisibleButton(str_id: [*c]const u8, size: ImVec2, flags: ImGuiButtonFlags) bool;
pub extern fn igArrowButton(str_id: [*c]const u8, dir: ImGuiDir) bool;
pub extern fn igImage(user_texture_id: ImTextureID, size: ImVec2, uv0: ImVec2, uv1: ImVec2, tint_col: ImVec4, border_col: ImVec4) void;
pub extern fn igImageButton(user_texture_id: ImTextureID, size: ImVec2, uv0: ImVec2, uv1: ImVec2, frame_padding: c_int, bg_col: ImVec4, tint_col: ImVec4) bool;
pub extern fn igCheckbox(label: [*c]const u8, v: [*c]bool) bool;
pub extern fn igCheckboxFlags_IntPtr(label: [*c]const u8, flags: [*c]c_int, flags_value: c_int) bool;
pub extern fn igCheckboxFlags_UintPtr(label: [*c]const u8, flags: [*c]c_uint, flags_value: c_uint) bool;
pub extern fn igRadioButton_Bool(label: [*c]const u8, active: bool) bool;
pub extern fn igRadioButton_IntPtr(label: [*c]const u8, v: [*c]c_int, v_button: c_int) bool;
pub extern fn igProgressBar(fraction: f32, size_arg: ImVec2, overlay: [*c]const u8) void;
pub extern fn igBullet() void;
pub extern fn igBeginCombo(label: [*c]const u8, preview_value: [*c]const u8, flags: ImGuiComboFlags) bool;
pub extern fn igEndCombo() void;
pub extern fn igCombo_Str_arr(label: [*c]const u8, current_item: [*c]c_int, items: [*c]const [*c]const u8, items_count: c_int, popup_max_height_in_items: c_int) bool;
pub extern fn igCombo_Str(label: [*c]const u8, current_item: [*c]c_int, items_separated_by_zeros: [*c]const u8, popup_max_height_in_items: c_int) bool;
pub extern fn igCombo_FnBoolPtr(label: [*c]const u8, current_item: [*c]c_int, items_getter: ?fn (?*c_void, c_int, [*c][*c]const u8) callconv(.C) bool, data: ?*c_void, items_count: c_int, popup_max_height_in_items: c_int) bool;
pub extern fn igDragFloat(label: [*c]const u8, v: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragFloat2(label: [*c]const u8, v: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragFloat3(label: [*c]const u8, v: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragFloat4(label: [*c]const u8, v: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragFloatRange2(label: [*c]const u8, v_current_min: [*c]f32, v_current_max: [*c]f32, v_speed: f32, v_min: f32, v_max: f32, format: [*c]const u8, format_max: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragInt(label: [*c]const u8, v: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragInt2(label: [*c]const u8, v: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragInt3(label: [*c]const u8, v: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragInt4(label: [*c]const u8, v: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragIntRange2(label: [*c]const u8, v_current_min: [*c]c_int, v_current_max: [*c]c_int, v_speed: f32, v_min: c_int, v_max: c_int, format: [*c]const u8, format_max: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragScalar(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*c_void, v_speed: f32, p_min: ?*const c_void, p_max: ?*const c_void, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igDragScalarN(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*c_void, components: c_int, v_speed: f32, p_min: ?*const c_void, p_max: ?*const c_void, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderFloat(label: [*c]const u8, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderFloat2(label: [*c]const u8, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderFloat3(label: [*c]const u8, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderFloat4(label: [*c]const u8, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderAngle(label: [*c]const u8, v_rad: [*c]f32, v_degrees_min: f32, v_degrees_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderInt(label: [*c]const u8, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderInt2(label: [*c]const u8, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderInt3(label: [*c]const u8, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderInt4(label: [*c]const u8, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderScalar(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*c_void, p_min: ?*const c_void, p_max: ?*const c_void, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderScalarN(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*c_void, components: c_int, p_min: ?*const c_void, p_max: ?*const c_void, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igVSliderFloat(label: [*c]const u8, size: ImVec2, v: [*c]f32, v_min: f32, v_max: f32, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igVSliderInt(label: [*c]const u8, size: ImVec2, v: [*c]c_int, v_min: c_int, v_max: c_int, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igVSliderScalar(label: [*c]const u8, size: ImVec2, data_type: ImGuiDataType, p_data: ?*c_void, p_min: ?*const c_void, p_max: ?*const c_void, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igInputText(label: [*c]const u8, buf: [*c]u8, buf_size: usize, flags: ImGuiInputTextFlags, callback: ImGuiInputTextCallback, user_data: ?*c_void) bool;
pub extern fn igInputTextMultiline(label: [*c]const u8, buf: [*c]u8, buf_size: usize, size: ImVec2, flags: ImGuiInputTextFlags, callback: ImGuiInputTextCallback, user_data: ?*c_void) bool;
pub extern fn igInputTextWithHint(label: [*c]const u8, hint: [*c]const u8, buf: [*c]u8, buf_size: usize, flags: ImGuiInputTextFlags, callback: ImGuiInputTextCallback, user_data: ?*c_void) bool;
pub extern fn igInputFloat(label: [*c]const u8, v: [*c]f32, step: f32, step_fast: f32, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputFloat2(label: [*c]const u8, v: [*c]f32, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputFloat3(label: [*c]const u8, v: [*c]f32, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputFloat4(label: [*c]const u8, v: [*c]f32, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputInt(label: [*c]const u8, v: [*c]c_int, step: c_int, step_fast: c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputInt2(label: [*c]const u8, v: [*c]c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputInt3(label: [*c]const u8, v: [*c]c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputInt4(label: [*c]const u8, v: [*c]c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputDouble(label: [*c]const u8, v: [*c]f64, step: f64, step_fast: f64, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputScalar(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*c_void, p_step: ?*const c_void, p_step_fast: ?*const c_void, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igInputScalarN(label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*c_void, components: c_int, p_step: ?*const c_void, p_step_fast: ?*const c_void, format: [*c]const u8, flags: ImGuiInputTextFlags) bool;
pub extern fn igColorEdit3(label: [*c]const u8, col: [*c]f32, flags: ImGuiColorEditFlags) bool;
pub extern fn igColorEdit4(label: [*c]const u8, col: [*c]f32, flags: ImGuiColorEditFlags) bool;
pub extern fn igColorPicker3(label: [*c]const u8, col: [*c]f32, flags: ImGuiColorEditFlags) bool;
pub extern fn igColorPicker4(label: [*c]const u8, col: [*c]f32, flags: ImGuiColorEditFlags, ref_col: [*c]const f32) bool;
pub extern fn igColorButton(desc_id: [*c]const u8, col: ImVec4, flags: ImGuiColorEditFlags, size: ImVec2) bool;
pub extern fn igSetColorEditOptions(flags: ImGuiColorEditFlags) void;
pub extern fn igTreeNode_Str(label: [*c]const u8) bool;
pub extern fn igTreeNode_StrStr(str_id: [*c]const u8, fmt: [*c]const u8, ...) bool;
pub extern fn igTreeNode_Ptr(ptr_id: ?*const c_void, fmt: [*c]const u8, ...) bool;
pub extern fn igTreeNodeV_Str(str_id: [*c]const u8, fmt: [*c]const u8, args: va_list) bool;
pub extern fn igTreeNodeV_Ptr(ptr_id: ?*const c_void, fmt: [*c]const u8, args: va_list) bool;
pub extern fn igTreeNodeEx_Str(label: [*c]const u8, flags: ImGuiTreeNodeFlags) bool;
pub extern fn igTreeNodeEx_StrStr(str_id: [*c]const u8, flags: ImGuiTreeNodeFlags, fmt: [*c]const u8, ...) bool;
pub extern fn igTreeNodeEx_Ptr(ptr_id: ?*const c_void, flags: ImGuiTreeNodeFlags, fmt: [*c]const u8, ...) bool;
pub extern fn igTreeNodeExV_Str(str_id: [*c]const u8, flags: ImGuiTreeNodeFlags, fmt: [*c]const u8, args: va_list) bool;
pub extern fn igTreeNodeExV_Ptr(ptr_id: ?*const c_void, flags: ImGuiTreeNodeFlags, fmt: [*c]const u8, args: va_list) bool;
pub extern fn igTreePush_Str(str_id: [*c]const u8) void;
pub extern fn igTreePush_Ptr(ptr_id: ?*const c_void) void;
pub extern fn igTreePop() void;
pub extern fn igGetTreeNodeToLabelSpacing() f32;
pub extern fn igCollapsingHeader_TreeNodeFlags(label: [*c]const u8, flags: ImGuiTreeNodeFlags) bool;
pub extern fn igCollapsingHeader_BoolPtr(label: [*c]const u8, p_visible: [*c]bool, flags: ImGuiTreeNodeFlags) bool;
pub extern fn igSetNextItemOpen(is_open: bool, cond: ImGuiCond) void;
pub extern fn igSelectable_Bool(label: [*c]const u8, selected: bool, flags: ImGuiSelectableFlags, size: ImVec2) bool;
pub extern fn igSelectable_BoolPtr(label: [*c]const u8, p_selected: [*c]bool, flags: ImGuiSelectableFlags, size: ImVec2) bool;
pub extern fn igBeginListBox(label: [*c]const u8, size: ImVec2) bool;
pub extern fn igEndListBox() void;
pub extern fn igListBox_Str_arr(label: [*c]const u8, current_item: [*c]c_int, items: [*c]const [*c]const u8, items_count: c_int, height_in_items: c_int) bool;
pub extern fn igListBox_FnBoolPtr(label: [*c]const u8, current_item: [*c]c_int, items_getter: ?fn (?*c_void, c_int, [*c][*c]const u8) callconv(.C) bool, data: ?*c_void, items_count: c_int, height_in_items: c_int) bool;
pub extern fn igPlotLines_FloatPtr(label: [*c]const u8, values: [*c]const f32, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, graph_size: ImVec2, stride: c_int) void;
pub extern fn igPlotLines_FnFloatPtr(label: [*c]const u8, values_getter: ?fn (?*c_void, c_int) callconv(.C) f32, data: ?*c_void, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, graph_size: ImVec2) void;
pub extern fn igPlotHistogram_FloatPtr(label: [*c]const u8, values: [*c]const f32, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, graph_size: ImVec2, stride: c_int) void;
pub extern fn igPlotHistogram_FnFloatPtr(label: [*c]const u8, values_getter: ?fn (?*c_void, c_int) callconv(.C) f32, data: ?*c_void, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, graph_size: ImVec2) void;
pub extern fn igValue_Bool(prefix: [*c]const u8, b: bool) void;
pub extern fn igValue_Int(prefix: [*c]const u8, v: c_int) void;
pub extern fn igValue_Uint(prefix: [*c]const u8, v: c_uint) void;
pub extern fn igValue_Float(prefix: [*c]const u8, v: f32, float_format: [*c]const u8) void;
pub extern fn igBeginMenuBar() bool;
pub extern fn igEndMenuBar() void;
pub extern fn igBeginMainMenuBar() bool;
pub extern fn igEndMainMenuBar() void;
pub extern fn igBeginMenu(label: [*c]const u8, enabled: bool) bool;
pub extern fn igEndMenu() void;
pub extern fn igMenuItem_Bool(label: [*c]const u8, shortcut: [*c]const u8, selected: bool, enabled: bool) bool;
pub extern fn igMenuItem_BoolPtr(label: [*c]const u8, shortcut: [*c]const u8, p_selected: [*c]bool, enabled: bool) bool;
pub extern fn igBeginTooltip() void;
pub extern fn igEndTooltip() void;
pub extern fn igSetTooltip(fmt: [*c]const u8, ...) void;
pub extern fn igSetTooltipV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igBeginPopup(str_id: [*c]const u8, flags: ImGuiWindowFlags) bool;
pub extern fn igBeginPopupModal(name: [*c]const u8, p_open: [*c]bool, flags: ImGuiWindowFlags) bool;
pub extern fn igEndPopup() void;
pub extern fn igOpenPopup(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) void;
pub extern fn igOpenPopupOnItemClick(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) void;
pub extern fn igCloseCurrentPopup() void;
pub extern fn igBeginPopupContextItem(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) bool;
pub extern fn igBeginPopupContextWindow(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) bool;
pub extern fn igBeginPopupContextVoid(str_id: [*c]const u8, popup_flags: ImGuiPopupFlags) bool;
pub extern fn igIsPopupOpen_Str(str_id: [*c]const u8, flags: ImGuiPopupFlags) bool;
pub extern fn igBeginTable(str_id: [*c]const u8, column: c_int, flags: ImGuiTableFlags, outer_size: ImVec2, inner_width: f32) bool;
pub extern fn igEndTable() void;
pub extern fn igTableNextRow(row_flags: ImGuiTableRowFlags, min_row_height: f32) void;
pub extern fn igTableNextColumn() bool;
pub extern fn igTableSetColumnIndex(column_n: c_int) bool;
pub extern fn igTableSetupColumn(label: [*c]const u8, flags: ImGuiTableColumnFlags, init_width_or_weight: f32, user_id: ImGuiID) void;
pub extern fn igTableSetupScrollFreeze(cols: c_int, rows: c_int) void;
pub extern fn igTableHeadersRow() void;
pub extern fn igTableHeader(label: [*c]const u8) void;
pub extern fn igTableGetSortSpecs() [*c]ImGuiTableSortSpecs;
pub extern fn igTableGetColumnCount() c_int;
pub extern fn igTableGetColumnIndex() c_int;
pub extern fn igTableGetRowIndex() c_int;
pub extern fn igTableGetColumnName_Int(column_n: c_int) [*c]const u8;
pub extern fn igTableGetColumnFlags(column_n: c_int) ImGuiTableColumnFlags;
pub extern fn igTableSetBgColor(target: ImGuiTableBgTarget, color: ImU32, column_n: c_int) void;
pub extern fn igColumns(count: c_int, id: [*c]const u8, border: bool) void;
pub extern fn igNextColumn() void;
pub extern fn igGetColumnIndex() c_int;
pub extern fn igGetColumnWidth(column_index: c_int) f32;
pub extern fn igSetColumnWidth(column_index: c_int, width: f32) void;
pub extern fn igGetColumnOffset(column_index: c_int) f32;
pub extern fn igSetColumnOffset(column_index: c_int, offset_x: f32) void;
pub extern fn igGetColumnsCount() c_int;
pub extern fn igBeginTabBar(str_id: [*c]const u8, flags: ImGuiTabBarFlags) bool;
pub extern fn igEndTabBar() void;
pub extern fn igBeginTabItem(label: [*c]const u8, p_open: [*c]bool, flags: ImGuiTabItemFlags) bool;
pub extern fn igEndTabItem() void;
pub extern fn igTabItemButton(label: [*c]const u8, flags: ImGuiTabItemFlags) bool;
pub extern fn igSetTabItemClosed(tab_or_docked_window_label: [*c]const u8) void;
pub extern fn igLogToTTY(auto_open_depth: c_int) void;
pub extern fn igLogToFile(auto_open_depth: c_int, filename: [*c]const u8) void;
pub extern fn igLogToClipboard(auto_open_depth: c_int) void;
pub extern fn igLogFinish() void;
pub extern fn igLogButtons() void;
pub extern fn igLogTextV(fmt: [*c]const u8, args: va_list) void;
pub extern fn igBeginDragDropSource(flags: ImGuiDragDropFlags) bool;
pub extern fn igSetDragDropPayload(type: [*c]const u8, data: ?*const c_void, sz: usize, cond: ImGuiCond) bool;
pub extern fn igEndDragDropSource() void;
pub extern fn igBeginDragDropTarget() bool;
pub extern fn igAcceptDragDropPayload(type: [*c]const u8, flags: ImGuiDragDropFlags) [*c]const ImGuiPayload;
pub extern fn igEndDragDropTarget() void;
pub extern fn igGetDragDropPayload() [*c]const ImGuiPayload;
pub extern fn igPushClipRect(clip_rect_min: ImVec2, clip_rect_max: ImVec2, intersect_with_current_clip_rect: bool) void;
pub extern fn igPopClipRect() void;
pub extern fn igSetItemDefaultFocus() void;
pub extern fn igSetKeyboardFocusHere(offset: c_int) void;
pub extern fn igIsItemHovered(flags: ImGuiHoveredFlags) bool;
pub extern fn igIsItemActive() bool;
pub extern fn igIsItemFocused() bool;
pub extern fn igIsItemClicked(mouse_button: ImGuiMouseButton) bool;
pub extern fn igIsItemVisible() bool;
pub extern fn igIsItemEdited() bool;
pub extern fn igIsItemActivated() bool;
pub extern fn igIsItemDeactivated() bool;
pub extern fn igIsItemDeactivatedAfterEdit() bool;
pub extern fn igIsItemToggledOpen() bool;
pub extern fn igIsAnyItemHovered() bool;
pub extern fn igIsAnyItemActive() bool;
pub extern fn igIsAnyItemFocused() bool;
pub extern fn igGetItemRectMin(pOut: [*c]ImVec2) void;
pub extern fn igGetItemRectMax(pOut: [*c]ImVec2) void;
pub extern fn igGetItemRectSize(pOut: [*c]ImVec2) void;
pub extern fn igSetItemAllowOverlap() void;
pub extern fn igGetMainViewport() [*c]ImGuiViewport;
pub extern fn igIsRectVisible_Nil(size: ImVec2) bool;
pub extern fn igIsRectVisible_Vec2(rect_min: ImVec2, rect_max: ImVec2) bool;
pub extern fn igGetTime() f64;
pub extern fn igGetFrameCount() c_int;
pub extern fn igGetBackgroundDrawList_Nil() [*c]ImDrawList;
pub extern fn igGetForegroundDrawList_Nil() [*c]ImDrawList;
pub extern fn igGetDrawListSharedData() [*c]ImDrawListSharedData;
pub extern fn igGetStyleColorName(idx: ImGuiCol) [*c]const u8;
pub extern fn igSetStateStorage(storage: [*c]ImGuiStorage) void;
pub extern fn igGetStateStorage() [*c]ImGuiStorage;
pub extern fn igCalcListClipping(items_count: c_int, items_height: f32, out_items_display_start: [*c]c_int, out_items_display_end: [*c]c_int) void;
pub extern fn igBeginChildFrame(id: ImGuiID, size: ImVec2, flags: ImGuiWindowFlags) bool;
pub extern fn igEndChildFrame() void;
pub extern fn igCalcTextSize(pOut: [*c]ImVec2, text: [*c]const u8, text_end: [*c]const u8, hide_text_after_double_hash: bool, wrap_width: f32) void;
pub extern fn igColorConvertU32ToFloat4(pOut: [*c]ImVec4, in: ImU32) void;
pub extern fn igColorConvertFloat4ToU32(in: ImVec4) ImU32;
pub extern fn igColorConvertRGBtoHSV(r: f32, g: f32, b: f32, out_h: [*c]f32, out_s: [*c]f32, out_v: [*c]f32) void;
pub extern fn igColorConvertHSVtoRGB(h: f32, s: f32, v: f32, out_r: [*c]f32, out_g: [*c]f32, out_b: [*c]f32) void;
pub extern fn igGetKeyIndex(imgui_key: ImGuiKey) c_int;
pub extern fn igIsKeyDown(user_key_index: c_int) bool;
pub extern fn igIsKeyPressed(user_key_index: c_int, repeat: bool) bool;
pub extern fn igIsKeyReleased(user_key_index: c_int) bool;
pub extern fn igGetKeyPressedAmount(key_index: c_int, repeat_delay: f32, rate: f32) c_int;
pub extern fn igCaptureKeyboardFromApp(want_capture_keyboard_value: bool) void;
pub extern fn igIsMouseDown(button: ImGuiMouseButton) bool;
pub extern fn igIsMouseClicked(button: ImGuiMouseButton, repeat: bool) bool;
pub extern fn igIsMouseReleased(button: ImGuiMouseButton) bool;
pub extern fn igIsMouseDoubleClicked(button: ImGuiMouseButton) bool;
pub extern fn igIsMouseHoveringRect(r_min: ImVec2, r_max: ImVec2, clip: bool) bool;
pub extern fn igIsMousePosValid(mouse_pos: [*c]const ImVec2) bool;
pub extern fn igIsAnyMouseDown() bool;
pub extern fn igGetMousePos(pOut: [*c]ImVec2) void;
pub extern fn igGetMousePosOnOpeningCurrentPopup(pOut: [*c]ImVec2) void;
pub extern fn igIsMouseDragging(button: ImGuiMouseButton, lock_threshold: f32) bool;
pub extern fn igGetMouseDragDelta(pOut: [*c]ImVec2, button: ImGuiMouseButton, lock_threshold: f32) void;
pub extern fn igResetMouseDragDelta(button: ImGuiMouseButton) void;
pub extern fn igGetMouseCursor() ImGuiMouseCursor;
pub extern fn igSetMouseCursor(cursor_type: ImGuiMouseCursor) void;
pub extern fn igCaptureMouseFromApp(want_capture_mouse_value: bool) void;
pub extern fn igGetClipboardText() [*c]const u8;
pub extern fn igSetClipboardText(text: [*c]const u8) void;
pub extern fn igLoadIniSettingsFromDisk(ini_filename: [*c]const u8) void;
pub extern fn igLoadIniSettingsFromMemory(ini_data: [*c]const u8, ini_size: usize) void;
pub extern fn igSaveIniSettingsToDisk(ini_filename: [*c]const u8) void;
pub extern fn igSaveIniSettingsToMemory(out_ini_size: [*c]usize) [*c]const u8;
pub extern fn igDebugCheckVersionAndDataLayout(version_str: [*c]const u8, sz_io: usize, sz_style: usize, sz_vec2: usize, sz_vec4: usize, sz_drawvert: usize, sz_drawidx: usize) bool;
pub extern fn igSetAllocatorFunctions(alloc_func: ImGuiMemAllocFunc, free_func: ImGuiMemFreeFunc, user_data: ?*c_void) void;
pub extern fn igGetAllocatorFunctions(p_alloc_func: [*c]ImGuiMemAllocFunc, p_free_func: [*c]ImGuiMemFreeFunc, p_user_data: [*c]?*c_void) void;
pub extern fn igMemAlloc(size: usize) ?*c_void;
pub extern fn igMemFree(ptr: ?*c_void) void;
pub extern fn ImGuiStyle_ImGuiStyle() [*c]ImGuiStyle;
pub extern fn ImGuiStyle_destroy(self: [*c]ImGuiStyle) void;
pub extern fn ImGuiStyle_ScaleAllSizes(self: [*c]ImGuiStyle, scale_factor: f32) void;
pub extern fn ImGuiIO_AddInputCharacter(self: [*c]ImGuiIO, c: c_uint) void;
pub extern fn ImGuiIO_AddInputCharacterUTF16(self: [*c]ImGuiIO, c: ImWchar16) void;
pub extern fn ImGuiIO_AddInputCharactersUTF8(self: [*c]ImGuiIO, str: [*c]const u8) void;
pub extern fn ImGuiIO_ClearInputCharacters(self: [*c]ImGuiIO) void;
pub extern fn ImGuiIO_ImGuiIO() [*c]ImGuiIO;
pub extern fn ImGuiIO_destroy(self: [*c]ImGuiIO) void;
pub extern fn ImGuiInputTextCallbackData_ImGuiInputTextCallbackData() [*c]ImGuiInputTextCallbackData;
pub extern fn ImGuiInputTextCallbackData_destroy(self: [*c]ImGuiInputTextCallbackData) void;
pub extern fn ImGuiInputTextCallbackData_DeleteChars(self: [*c]ImGuiInputTextCallbackData, pos: c_int, bytes_count: c_int) void;
pub extern fn ImGuiInputTextCallbackData_InsertChars(self: [*c]ImGuiInputTextCallbackData, pos: c_int, text: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn ImGuiInputTextCallbackData_SelectAll(self: [*c]ImGuiInputTextCallbackData) void;
pub extern fn ImGuiInputTextCallbackData_ClearSelection(self: [*c]ImGuiInputTextCallbackData) void;
pub extern fn ImGuiInputTextCallbackData_HasSelection(self: [*c]ImGuiInputTextCallbackData) bool;
pub extern fn ImGuiPayload_ImGuiPayload() [*c]ImGuiPayload;
pub extern fn ImGuiPayload_destroy(self: [*c]ImGuiPayload) void;
pub extern fn ImGuiPayload_Clear(self: [*c]ImGuiPayload) void;
pub extern fn ImGuiPayload_IsDataType(self: [*c]ImGuiPayload, type: [*c]const u8) bool;
pub extern fn ImGuiPayload_IsPreview(self: [*c]ImGuiPayload) bool;
pub extern fn ImGuiPayload_IsDelivery(self: [*c]ImGuiPayload) bool;
pub extern fn ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs() ?*ImGuiTableColumnSortSpecs;
pub extern fn ImGuiTableColumnSortSpecs_destroy(self: ?*ImGuiTableColumnSortSpecs) void;
pub extern fn ImGuiTableSortSpecs_ImGuiTableSortSpecs() [*c]ImGuiTableSortSpecs;
pub extern fn ImGuiTableSortSpecs_destroy(self: [*c]ImGuiTableSortSpecs) void;
pub extern fn ImGuiOnceUponAFrame_ImGuiOnceUponAFrame() [*c]ImGuiOnceUponAFrame;
pub extern fn ImGuiOnceUponAFrame_destroy(self: [*c]ImGuiOnceUponAFrame) void;
pub extern fn ImGuiTextFilter_ImGuiTextFilter(default_filter: [*c]const u8) [*c]ImGuiTextFilter;
pub extern fn ImGuiTextFilter_destroy(self: [*c]ImGuiTextFilter) void;
pub extern fn ImGuiTextFilter_Draw(self: [*c]ImGuiTextFilter, label: [*c]const u8, width: f32) bool;
pub extern fn ImGuiTextFilter_PassFilter(self: [*c]ImGuiTextFilter, text: [*c]const u8, text_end: [*c]const u8) bool;
pub extern fn ImGuiTextFilter_Build(self: [*c]ImGuiTextFilter) void;
pub extern fn ImGuiTextFilter_Clear(self: [*c]ImGuiTextFilter) void;
pub extern fn ImGuiTextFilter_IsActive(self: [*c]ImGuiTextFilter) bool;
pub extern fn ImGuiTextRange_ImGuiTextRange_Nil() [*c]ImGuiTextRange;
pub extern fn ImGuiTextRange_destroy(self: [*c]ImGuiTextRange) void;
pub extern fn ImGuiTextRange_ImGuiTextRange_Str(_b: [*c]const u8, _e: [*c]const u8) [*c]ImGuiTextRange;
pub extern fn ImGuiTextRange_empty(self: [*c]ImGuiTextRange) bool;
pub extern fn ImGuiTextRange_split(self: [*c]ImGuiTextRange, separator: u8, out: [*c]ImVector_ImGuiTextRange) void;
pub extern fn ImGuiTextBuffer_ImGuiTextBuffer() [*c]ImGuiTextBuffer;
pub extern fn ImGuiTextBuffer_destroy(self: [*c]ImGuiTextBuffer) void;
pub extern fn ImGuiTextBuffer_begin(self: [*c]ImGuiTextBuffer) [*c]const u8;
pub extern fn ImGuiTextBuffer_end(self: [*c]ImGuiTextBuffer) [*c]const u8;
pub extern fn ImGuiTextBuffer_size(self: [*c]ImGuiTextBuffer) c_int;
pub extern fn ImGuiTextBuffer_empty(self: [*c]ImGuiTextBuffer) bool;
pub extern fn ImGuiTextBuffer_clear(self: [*c]ImGuiTextBuffer) void;
pub extern fn ImGuiTextBuffer_reserve(self: [*c]ImGuiTextBuffer, capacity: c_int) void;
pub extern fn ImGuiTextBuffer_c_str(self: [*c]ImGuiTextBuffer) [*c]const u8;
pub extern fn ImGuiTextBuffer_append(self: [*c]ImGuiTextBuffer, str: [*c]const u8, str_end: [*c]const u8) void;
pub extern fn ImGuiTextBuffer_appendfv(self: [*c]ImGuiTextBuffer, fmt: [*c]const u8, args: va_list) void;
pub extern fn ImGuiStoragePair_ImGuiStoragePair_Int(_key: ImGuiID, _val_i: c_int) [*c]ImGuiStoragePair;
pub extern fn ImGuiStoragePair_destroy(self: [*c]ImGuiStoragePair) void;
pub extern fn ImGuiStoragePair_ImGuiStoragePair_Float(_key: ImGuiID, _val_f: f32) [*c]ImGuiStoragePair;
pub extern fn ImGuiStoragePair_ImGuiStoragePair_Ptr(_key: ImGuiID, _val_p: ?*c_void) [*c]ImGuiStoragePair;
pub extern fn ImGuiStorage_Clear(self: [*c]ImGuiStorage) void;
pub extern fn ImGuiStorage_GetInt(self: [*c]ImGuiStorage, key: ImGuiID, default_val: c_int) c_int;
pub extern fn ImGuiStorage_SetInt(self: [*c]ImGuiStorage, key: ImGuiID, val: c_int) void;
pub extern fn ImGuiStorage_GetBool(self: [*c]ImGuiStorage, key: ImGuiID, default_val: bool) bool;
pub extern fn ImGuiStorage_SetBool(self: [*c]ImGuiStorage, key: ImGuiID, val: bool) void;
pub extern fn ImGuiStorage_GetFloat(self: [*c]ImGuiStorage, key: ImGuiID, default_val: f32) f32;
pub extern fn ImGuiStorage_SetFloat(self: [*c]ImGuiStorage, key: ImGuiID, val: f32) void;
pub extern fn ImGuiStorage_GetVoidPtr(self: [*c]ImGuiStorage, key: ImGuiID) ?*c_void;
pub extern fn ImGuiStorage_SetVoidPtr(self: [*c]ImGuiStorage, key: ImGuiID, val: ?*c_void) void;
pub extern fn ImGuiStorage_GetIntRef(self: [*c]ImGuiStorage, key: ImGuiID, default_val: c_int) [*c]c_int;
pub extern fn ImGuiStorage_GetBoolRef(self: [*c]ImGuiStorage, key: ImGuiID, default_val: bool) [*c]bool;
pub extern fn ImGuiStorage_GetFloatRef(self: [*c]ImGuiStorage, key: ImGuiID, default_val: f32) [*c]f32;
pub extern fn ImGuiStorage_GetVoidPtrRef(self: [*c]ImGuiStorage, key: ImGuiID, default_val: ?*c_void) [*c]?*c_void;
pub extern fn ImGuiStorage_SetAllInt(self: [*c]ImGuiStorage, val: c_int) void;
pub extern fn ImGuiStorage_BuildSortByKey(self: [*c]ImGuiStorage) void;
pub extern fn ImGuiListClipper_ImGuiListClipper() [*c]ImGuiListClipper;
pub extern fn ImGuiListClipper_destroy(self: [*c]ImGuiListClipper) void;
pub extern fn ImGuiListClipper_Begin(self: [*c]ImGuiListClipper, items_count: c_int, items_height: f32) void;
pub extern fn ImGuiListClipper_End(self: [*c]ImGuiListClipper) void;
pub extern fn ImGuiListClipper_Step(self: [*c]ImGuiListClipper) bool;
pub extern fn ImColor_ImColor_Nil() [*c]ImColor;
pub extern fn ImColor_destroy(self: [*c]ImColor) void;
pub extern fn ImColor_ImColor_Int(r: c_int, g: c_int, b: c_int, a: c_int) [*c]ImColor;
pub extern fn ImColor_ImColor_U32(rgba: ImU32) [*c]ImColor;
pub extern fn ImColor_ImColor_Float(r: f32, g: f32, b: f32, a: f32) [*c]ImColor;
pub extern fn ImColor_ImColor_Vec4(col: ImVec4) [*c]ImColor;
pub extern fn ImColor_SetHSV(self: [*c]ImColor, h: f32, s: f32, v: f32, a: f32) void;
pub extern fn ImColor_HSV(pOut: [*c]ImColor, h: f32, s: f32, v: f32, a: f32) void;
pub extern fn ImDrawCmd_ImDrawCmd() [*c]ImDrawCmd;
pub extern fn ImDrawCmd_destroy(self: [*c]ImDrawCmd) void;
pub extern fn ImDrawListSplitter_ImDrawListSplitter() [*c]ImDrawListSplitter;
pub extern fn ImDrawListSplitter_destroy(self: [*c]ImDrawListSplitter) void;
pub extern fn ImDrawListSplitter_Clear(self: [*c]ImDrawListSplitter) void;
pub extern fn ImDrawListSplitter_ClearFreeMemory(self: [*c]ImDrawListSplitter) void;
pub extern fn ImDrawListSplitter_Split(self: [*c]ImDrawListSplitter, draw_list: [*c]ImDrawList, count: c_int) void;
pub extern fn ImDrawListSplitter_Merge(self: [*c]ImDrawListSplitter, draw_list: [*c]ImDrawList) void;
pub extern fn ImDrawListSplitter_SetCurrentChannel(self: [*c]ImDrawListSplitter, draw_list: [*c]ImDrawList, channel_idx: c_int) void;
pub extern fn ImDrawList_ImDrawList(shared_data: [*c]const ImDrawListSharedData) [*c]ImDrawList;
pub extern fn ImDrawList_destroy(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_PushClipRect(self: [*c]ImDrawList, clip_rect_min: ImVec2, clip_rect_max: ImVec2, intersect_with_current_clip_rect: bool) void;
pub extern fn ImDrawList_PushClipRectFullScreen(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_PopClipRect(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_PushTextureID(self: [*c]ImDrawList, texture_id: ImTextureID) void;
pub extern fn ImDrawList_PopTextureID(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_GetClipRectMin(pOut: [*c]ImVec2, self: [*c]ImDrawList) void;
pub extern fn ImDrawList_GetClipRectMax(pOut: [*c]ImVec2, self: [*c]ImDrawList) void;
pub extern fn ImDrawList_AddLine(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, col: ImU32, thickness: f32) void;
pub extern fn ImDrawList_AddRect(self: [*c]ImDrawList, p_min: ImVec2, p_max: ImVec2, col: ImU32, rounding: f32, flags: ImDrawFlags, thickness: f32) void;
pub extern fn ImDrawList_AddRectFilled(self: [*c]ImDrawList, p_min: ImVec2, p_max: ImVec2, col: ImU32, rounding: f32, flags: ImDrawFlags) void;
pub extern fn ImDrawList_AddRectFilledMultiColor(self: [*c]ImDrawList, p_min: ImVec2, p_max: ImVec2, col_upr_left: ImU32, col_upr_right: ImU32, col_bot_right: ImU32, col_bot_left: ImU32) void;
pub extern fn ImDrawList_AddQuad(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, col: ImU32, thickness: f32) void;
pub extern fn ImDrawList_AddQuadFilled(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_AddTriangle(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, col: ImU32, thickness: f32) void;
pub extern fn ImDrawList_AddTriangleFilled(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_AddCircle(self: [*c]ImDrawList, center: ImVec2, radius: f32, col: ImU32, num_segments: c_int, thickness: f32) void;
pub extern fn ImDrawList_AddCircleFilled(self: [*c]ImDrawList, center: ImVec2, radius: f32, col: ImU32, num_segments: c_int) void;
pub extern fn ImDrawList_AddNgon(self: [*c]ImDrawList, center: ImVec2, radius: f32, col: ImU32, num_segments: c_int, thickness: f32) void;
pub extern fn ImDrawList_AddNgonFilled(self: [*c]ImDrawList, center: ImVec2, radius: f32, col: ImU32, num_segments: c_int) void;
pub extern fn ImDrawList_AddText_Vec2(self: [*c]ImDrawList, pos: ImVec2, col: ImU32, text_begin: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn ImDrawList_AddText_FontPtr(self: [*c]ImDrawList, font: [*c]const ImFont, font_size: f32, pos: ImVec2, col: ImU32, text_begin: [*c]const u8, text_end: [*c]const u8, wrap_width: f32, cpu_fine_clip_rect: [*c]const ImVec4) void;
pub extern fn ImDrawList_AddPolyline(self: [*c]ImDrawList, points: [*c]const ImVec2, num_points: c_int, col: ImU32, flags: ImDrawFlags, thickness: f32) void;
pub extern fn ImDrawList_AddConvexPolyFilled(self: [*c]ImDrawList, points: [*c]const ImVec2, num_points: c_int, col: ImU32) void;
pub extern fn ImDrawList_AddBezierCubic(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, col: ImU32, thickness: f32, num_segments: c_int) void;
pub extern fn ImDrawList_AddBezierQuadratic(self: [*c]ImDrawList, p1: ImVec2, p2: ImVec2, p3: ImVec2, col: ImU32, thickness: f32, num_segments: c_int) void;
pub extern fn ImDrawList_AddImage(self: [*c]ImDrawList, user_texture_id: ImTextureID, p_min: ImVec2, p_max: ImVec2, uv_min: ImVec2, uv_max: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_AddImageQuad(self: [*c]ImDrawList, user_texture_id: ImTextureID, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, uv1: ImVec2, uv2: ImVec2, uv3: ImVec2, uv4: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_AddImageRounded(self: [*c]ImDrawList, user_texture_id: ImTextureID, p_min: ImVec2, p_max: ImVec2, uv_min: ImVec2, uv_max: ImVec2, col: ImU32, rounding: f32, flags: ImDrawFlags) void;
pub extern fn ImDrawList_PathClear(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_PathLineTo(self: [*c]ImDrawList, pos: ImVec2) void;
pub extern fn ImDrawList_PathLineToMergeDuplicate(self: [*c]ImDrawList, pos: ImVec2) void;
pub extern fn ImDrawList_PathFillConvex(self: [*c]ImDrawList, col: ImU32) void;
pub extern fn ImDrawList_PathStroke(self: [*c]ImDrawList, col: ImU32, flags: ImDrawFlags, thickness: f32) void;
pub extern fn ImDrawList_PathArcTo(self: [*c]ImDrawList, center: ImVec2, radius: f32, a_min: f32, a_max: f32, num_segments: c_int) void;
pub extern fn ImDrawList_PathArcToFast(self: [*c]ImDrawList, center: ImVec2, radius: f32, a_min_of_12: c_int, a_max_of_12: c_int) void;
pub extern fn ImDrawList_PathBezierCubicCurveTo(self: [*c]ImDrawList, p2: ImVec2, p3: ImVec2, p4: ImVec2, num_segments: c_int) void;
pub extern fn ImDrawList_PathBezierQuadraticCurveTo(self: [*c]ImDrawList, p2: ImVec2, p3: ImVec2, num_segments: c_int) void;
pub extern fn ImDrawList_PathRect(self: [*c]ImDrawList, rect_min: ImVec2, rect_max: ImVec2, rounding: f32, flags: ImDrawFlags) void;
pub extern fn ImDrawList_AddCallback(self: [*c]ImDrawList, callback: ImDrawCallback, callback_data: ?*c_void) void;
pub extern fn ImDrawList_AddDrawCmd(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_CloneOutput(self: [*c]ImDrawList) [*c]ImDrawList;
pub extern fn ImDrawList_ChannelsSplit(self: [*c]ImDrawList, count: c_int) void;
pub extern fn ImDrawList_ChannelsMerge(self: [*c]ImDrawList) void;
pub extern fn ImDrawList_ChannelsSetCurrent(self: [*c]ImDrawList, n: c_int) void;
pub extern fn ImDrawList_PrimReserve(self: [*c]ImDrawList, idx_count: c_int, vtx_count: c_int) void;
pub extern fn ImDrawList_PrimUnreserve(self: [*c]ImDrawList, idx_count: c_int, vtx_count: c_int) void;
pub extern fn ImDrawList_PrimRect(self: [*c]ImDrawList, a: ImVec2, b: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_PrimRectUV(self: [*c]ImDrawList, a: ImVec2, b: ImVec2, uv_a: ImVec2, uv_b: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_PrimQuadUV(self: [*c]ImDrawList, a: ImVec2, b: ImVec2, c: ImVec2, d: ImVec2, uv_a: ImVec2, uv_b: ImVec2, uv_c: ImVec2, uv_d: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_PrimWriteVtx(self: [*c]ImDrawList, pos: ImVec2, uv: ImVec2, col: ImU32) void;
pub extern fn ImDrawList_PrimWriteIdx(self: [*c]ImDrawList, idx: ImDrawIdx) void;
pub extern fn ImDrawList_PrimVtx(self: [*c]ImDrawList, pos: ImVec2, uv: ImVec2, col: ImU32) void;
pub extern fn ImDrawList__ResetForNewFrame(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__ClearFreeMemory(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__PopUnusedDrawCmd(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__OnChangedClipRect(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__OnChangedTextureID(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__OnChangedVtxOffset(self: [*c]ImDrawList) void;
pub extern fn ImDrawList__CalcCircleAutoSegmentCount(self: [*c]ImDrawList, radius: f32) c_int;
pub extern fn ImDrawList__PathArcToFastEx(self: [*c]ImDrawList, center: ImVec2, radius: f32, a_min_sample: c_int, a_max_sample: c_int, a_step: c_int) void;
pub extern fn ImDrawList__PathArcToN(self: [*c]ImDrawList, center: ImVec2, radius: f32, a_min: f32, a_max: f32, num_segments: c_int) void;
pub extern fn ImDrawData_ImDrawData() [*c]ImDrawData;
pub extern fn ImDrawData_destroy(self: [*c]ImDrawData) void;
pub extern fn ImDrawData_Clear(self: [*c]ImDrawData) void;
pub extern fn ImDrawData_DeIndexAllBuffers(self: [*c]ImDrawData) void;
pub extern fn ImDrawData_ScaleClipRects(self: [*c]ImDrawData, fb_scale: ImVec2) void;
pub extern fn ImFontConfig_ImFontConfig() [*c]ImFontConfig;
pub extern fn ImFontConfig_destroy(self: [*c]ImFontConfig) void;
pub extern fn ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder() [*c]ImFontGlyphRangesBuilder;
pub extern fn ImFontGlyphRangesBuilder_destroy(self: [*c]ImFontGlyphRangesBuilder) void;
pub extern fn ImFontGlyphRangesBuilder_Clear(self: [*c]ImFontGlyphRangesBuilder) void;
pub extern fn ImFontGlyphRangesBuilder_GetBit(self: [*c]ImFontGlyphRangesBuilder, n: usize) bool;
pub extern fn ImFontGlyphRangesBuilder_SetBit(self: [*c]ImFontGlyphRangesBuilder, n: usize) void;
pub extern fn ImFontGlyphRangesBuilder_AddChar(self: [*c]ImFontGlyphRangesBuilder, c: ImWchar) void;
pub extern fn ImFontGlyphRangesBuilder_AddText(self: [*c]ImFontGlyphRangesBuilder, text: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn ImFontGlyphRangesBuilder_AddRanges(self: [*c]ImFontGlyphRangesBuilder, ranges: [*c]const ImWchar) void;
pub extern fn ImFontGlyphRangesBuilder_BuildRanges(self: [*c]ImFontGlyphRangesBuilder, out_ranges: [*c]ImVector_ImWchar) void;
pub extern fn ImFontAtlasCustomRect_ImFontAtlasCustomRect() [*c]ImFontAtlasCustomRect;
pub extern fn ImFontAtlasCustomRect_destroy(self: [*c]ImFontAtlasCustomRect) void;
pub extern fn ImFontAtlasCustomRect_IsPacked(self: [*c]ImFontAtlasCustomRect) bool;
pub extern fn ImFontAtlas_ImFontAtlas() [*c]ImFontAtlas;
pub extern fn ImFontAtlas_destroy(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_AddFont(self: [*c]ImFontAtlas, font_cfg: [*c]const ImFontConfig) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontDefault(self: [*c]ImFontAtlas, font_cfg: [*c]const ImFontConfig) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontFromFileTTF(self: [*c]ImFontAtlas, filename: [*c]const u8, size_pixels: f32, font_cfg: [*c]const ImFontConfig, glyph_ranges: [*c]const ImWchar) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontFromMemoryTTF(self: [*c]ImFontAtlas, font_data: ?*c_void, font_size: c_int, size_pixels: f32, font_cfg: [*c]const ImFontConfig, glyph_ranges: [*c]const ImWchar) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontFromMemoryCompressedTTF(self: [*c]ImFontAtlas, compressed_font_data: ?*const c_void, compressed_font_size: c_int, size_pixels: f32, font_cfg: [*c]const ImFontConfig, glyph_ranges: [*c]const ImWchar) [*c]ImFont;
pub extern fn ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self: [*c]ImFontAtlas, compressed_font_data_base85: [*c]const u8, size_pixels: f32, font_cfg: [*c]const ImFontConfig, glyph_ranges: [*c]const ImWchar) [*c]ImFont;
pub extern fn ImFontAtlas_ClearInputData(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_ClearTexData(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_ClearFonts(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_Clear(self: [*c]ImFontAtlas) void;
pub extern fn ImFontAtlas_Build(self: [*c]ImFontAtlas) bool;
pub extern fn ImFontAtlas_GetTexDataAsAlpha8(self: [*c]ImFontAtlas, out_pixels: [*c][*c]u8, out_width: [*c]c_int, out_height: [*c]c_int, out_bytes_per_pixel: [*c]c_int) void;
pub extern fn ImFontAtlas_GetTexDataAsRGBA32(self: [*c]ImFontAtlas, out_pixels: [*c][*c]u8, out_width: [*c]c_int, out_height: [*c]c_int, out_bytes_per_pixel: [*c]c_int) void;
pub extern fn ImFontAtlas_IsBuilt(self: [*c]ImFontAtlas) bool;
pub extern fn ImFontAtlas_SetTexID(self: [*c]ImFontAtlas, id: ImTextureID) void;
pub extern fn ImFontAtlas_GetGlyphRangesDefault(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesKorean(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesJapanese(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesChineseFull(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesCyrillic(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesThai(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_GetGlyphRangesVietnamese(self: [*c]ImFontAtlas) [*c]const ImWchar;
pub extern fn ImFontAtlas_AddCustomRectRegular(self: [*c]ImFontAtlas, width: c_int, height: c_int) c_int;
pub extern fn ImFontAtlas_AddCustomRectFontGlyph(self: [*c]ImFontAtlas, font: [*c]ImFont, id: ImWchar, width: c_int, height: c_int, advance_x: f32, offset: ImVec2) c_int;
pub extern fn ImFontAtlas_GetCustomRectByIndex(self: [*c]ImFontAtlas, index: c_int) [*c]ImFontAtlasCustomRect;
pub extern fn ImFontAtlas_CalcCustomRectUV(self: [*c]ImFontAtlas, rect: [*c]const ImFontAtlasCustomRect, out_uv_min: [*c]ImVec2, out_uv_max: [*c]ImVec2) void;
pub extern fn ImFontAtlas_GetMouseCursorTexData(self: [*c]ImFontAtlas, cursor: ImGuiMouseCursor, out_offset: [*c]ImVec2, out_size: [*c]ImVec2, out_uv_border: [*c]ImVec2, out_uv_fill: [*c]ImVec2) bool;
pub extern fn ImFont_ImFont() [*c]ImFont;
pub extern fn ImFont_destroy(self: [*c]ImFont) void;
pub extern fn ImFont_FindGlyph(self: [*c]ImFont, c: ImWchar) ?*const ImFontGlyph;
pub extern fn ImFont_FindGlyphNoFallback(self: [*c]ImFont, c: ImWchar) ?*const ImFontGlyph;
pub extern fn ImFont_GetCharAdvance(self: [*c]ImFont, c: ImWchar) f32;
pub extern fn ImFont_IsLoaded(self: [*c]ImFont) bool;
pub extern fn ImFont_GetDebugName(self: [*c]ImFont) [*c]const u8;
pub extern fn ImFont_CalcTextSizeA(pOut: [*c]ImVec2, self: [*c]ImFont, size: f32, max_width: f32, wrap_width: f32, text_begin: [*c]const u8, text_end: [*c]const u8, remaining: [*c][*c]const u8) void;
pub extern fn ImFont_CalcWordWrapPositionA(self: [*c]ImFont, scale: f32, text: [*c]const u8, text_end: [*c]const u8, wrap_width: f32) [*c]const u8;
pub extern fn ImFont_RenderChar(self: [*c]ImFont, draw_list: [*c]ImDrawList, size: f32, pos: ImVec2, col: ImU32, c: ImWchar) void;
pub extern fn ImFont_RenderText(self: [*c]ImFont, draw_list: [*c]ImDrawList, size: f32, pos: ImVec2, col: ImU32, clip_rect: ImVec4, text_begin: [*c]const u8, text_end: [*c]const u8, wrap_width: f32, cpu_fine_clip: bool) void;
pub extern fn ImFont_BuildLookupTable(self: [*c]ImFont) void;
pub extern fn ImFont_ClearOutputData(self: [*c]ImFont) void;
pub extern fn ImFont_GrowIndex(self: [*c]ImFont, new_size: c_int) void;
pub extern fn ImFont_AddGlyph(self: [*c]ImFont, src_cfg: [*c]const ImFontConfig, c: ImWchar, x0: f32, y0: f32, x1: f32, y1: f32, u0: f32, v0: f32, u1: f32, v1: f32, advance_x: f32) void;
pub extern fn ImFont_AddRemapChar(self: [*c]ImFont, dst: ImWchar, src: ImWchar, overwrite_dst: bool) void;
pub extern fn ImFont_SetGlyphVisible(self: [*c]ImFont, c: ImWchar, visible: bool) void;
pub extern fn ImFont_SetFallbackChar(self: [*c]ImFont, c: ImWchar) void;
pub extern fn ImFont_IsGlyphRangeUnused(self: [*c]ImFont, c_begin: c_uint, c_last: c_uint) bool;
pub extern fn ImGuiViewport_ImGuiViewport() [*c]ImGuiViewport;
pub extern fn ImGuiViewport_destroy(self: [*c]ImGuiViewport) void;
pub extern fn ImGuiViewport_GetCenter(pOut: [*c]ImVec2, self: [*c]ImGuiViewport) void;
pub extern fn ImGuiViewport_GetWorkCenter(pOut: [*c]ImVec2, self: [*c]ImGuiViewport) void;
pub extern fn igImHashData(data: ?*const c_void, data_size: usize, seed: ImU32) ImGuiID;
pub extern fn igImHashStr(data: [*c]const u8, data_size: usize, seed: ImU32) ImGuiID;
pub extern fn igImAlphaBlendColors(col_a: ImU32, col_b: ImU32) ImU32;
pub extern fn igImIsPowerOfTwo_Int(v: c_int) bool;
pub extern fn igImIsPowerOfTwo_U64(v: ImU64) bool;
pub extern fn igImUpperPowerOfTwo(v: c_int) c_int;
pub extern fn igImStricmp(str1: [*c]const u8, str2: [*c]const u8) c_int;
pub extern fn igImStrnicmp(str1: [*c]const u8, str2: [*c]const u8, count: usize) c_int;
pub extern fn igImStrncpy(dst: [*c]u8, src: [*c]const u8, count: usize) void;
pub extern fn igImStrdup(str: [*c]const u8) [*c]u8;
pub extern fn igImStrdupcpy(dst: [*c]u8, p_dst_size: [*c]usize, str: [*c]const u8) [*c]u8;
pub extern fn igImStrchrRange(str_begin: [*c]const u8, str_end: [*c]const u8, c: u8) [*c]const u8;
pub extern fn igImStrlenW(str: [*c]const ImWchar) c_int;
pub extern fn igImStreolRange(str: [*c]const u8, str_end: [*c]const u8) [*c]const u8;
pub extern fn igImStrbolW(buf_mid_line: [*c]const ImWchar, buf_begin: [*c]const ImWchar) [*c]const ImWchar;
pub extern fn igImStristr(haystack: [*c]const u8, haystack_end: [*c]const u8, needle: [*c]const u8, needle_end: [*c]const u8) [*c]const u8;
pub extern fn igImStrTrimBlanks(str: [*c]u8) void;
pub extern fn igImStrSkipBlank(str: [*c]const u8) [*c]const u8;
pub extern fn igImFormatString(buf: [*c]u8, buf_size: usize, fmt: [*c]const u8, ...) c_int;
pub extern fn igImFormatStringV(buf: [*c]u8, buf_size: usize, fmt: [*c]const u8, args: va_list) c_int;
pub extern fn igImParseFormatFindStart(format: [*c]const u8) [*c]const u8;
pub extern fn igImParseFormatFindEnd(format: [*c]const u8) [*c]const u8;
pub extern fn igImParseFormatTrimDecorations(format: [*c]const u8, buf: [*c]u8, buf_size: usize) [*c]const u8;
pub extern fn igImParseFormatPrecision(format: [*c]const u8, default_value: c_int) c_int;
pub extern fn igImCharIsBlankA(c: u8) bool;
pub extern fn igImCharIsBlankW(c: c_uint) bool;
pub extern fn igImTextStrToUtf8(buf: [*c]u8, buf_size: c_int, in_text: [*c]const ImWchar, in_text_end: [*c]const ImWchar) c_int;
pub extern fn igImTextCharFromUtf8(out_char: [*c]c_uint, in_text: [*c]const u8, in_text_end: [*c]const u8) c_int;
pub extern fn igImTextStrFromUtf8(buf: [*c]ImWchar, buf_size: c_int, in_text: [*c]const u8, in_text_end: [*c]const u8, in_remaining: [*c][*c]const u8) c_int;
pub extern fn igImTextCountCharsFromUtf8(in_text: [*c]const u8, in_text_end: [*c]const u8) c_int;
pub extern fn igImTextCountUtf8BytesFromChar(in_text: [*c]const u8, in_text_end: [*c]const u8) c_int;
pub extern fn igImTextCountUtf8BytesFromStr(in_text: [*c]const ImWchar, in_text_end: [*c]const ImWchar) c_int;
pub extern fn igImFileOpen(filename: [*c]const u8, mode: [*c]const u8) ImFileHandle;
pub extern fn igImFileClose(file: ImFileHandle) bool;
pub extern fn igImFileGetSize(file: ImFileHandle) ImU64;
pub extern fn igImFileRead(data: ?*c_void, size: ImU64, count: ImU64, file: ImFileHandle) ImU64;
pub extern fn igImFileWrite(data: ?*const c_void, size: ImU64, count: ImU64, file: ImFileHandle) ImU64;
pub extern fn igImFileLoadToMemory(filename: [*c]const u8, mode: [*c]const u8, out_file_size: [*c]usize, padding_bytes: c_int) ?*c_void;
pub extern fn igImPow_Float(x: f32, y: f32) f32;
pub extern fn igImPow_double(x: f64, y: f64) f64;
pub extern fn igImLog_Float(x: f32) f32;
pub extern fn igImLog_double(x: f64) f64;
pub extern fn igImAbs_Float(x: f32) f32;
pub extern fn igImAbs_double(x: f64) f64;
pub extern fn igImSign_Float(x: f32) f32;
pub extern fn igImSign_double(x: f64) f64;
pub extern fn igImMin(pOut: [*c]ImVec2, lhs: ImVec2, rhs: ImVec2) void;
pub extern fn igImMax(pOut: [*c]ImVec2, lhs: ImVec2, rhs: ImVec2) void;
pub extern fn igImClamp(pOut: [*c]ImVec2, v: ImVec2, mn: ImVec2, mx: ImVec2) void;
pub extern fn igImLerp_Vec2Float(pOut: [*c]ImVec2, a: ImVec2, b: ImVec2, t: f32) void;
pub extern fn igImLerp_Vec2Vec2(pOut: [*c]ImVec2, a: ImVec2, b: ImVec2, t: ImVec2) void;
pub extern fn igImLerp_Vec4(pOut: [*c]ImVec4, a: ImVec4, b: ImVec4, t: f32) void;
pub extern fn igImSaturate(f: f32) f32;
pub extern fn igImLengthSqr_Vec2(lhs: ImVec2) f32;
pub extern fn igImLengthSqr_Vec4(lhs: ImVec4) f32;
pub extern fn igImInvLength(lhs: ImVec2, fail_value: f32) f32;
pub extern fn igImFloor_Float(f: f32) f32;
pub extern fn igImFloor_Vec2(pOut: [*c]ImVec2, v: ImVec2) void;
pub extern fn igImModPositive(a: c_int, b: c_int) c_int;
pub extern fn igImDot(a: ImVec2, b: ImVec2) f32;
pub extern fn igImRotate(pOut: [*c]ImVec2, v: ImVec2, cos_a: f32, sin_a: f32) void;
pub extern fn igImLinearSweep(current: f32, target: f32, speed: f32) f32;
pub extern fn igImMul(pOut: [*c]ImVec2, lhs: ImVec2, rhs: ImVec2) void;
pub extern fn igImBezierCubicCalc(pOut: [*c]ImVec2, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, t: f32) void;
pub extern fn igImBezierCubicClosestPoint(pOut: [*c]ImVec2, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, p: ImVec2, num_segments: c_int) void;
pub extern fn igImBezierCubicClosestPointCasteljau(pOut: [*c]ImVec2, p1: ImVec2, p2: ImVec2, p3: ImVec2, p4: ImVec2, p: ImVec2, tess_tol: f32) void;
pub extern fn igImBezierQuadraticCalc(pOut: [*c]ImVec2, p1: ImVec2, p2: ImVec2, p3: ImVec2, t: f32) void;
pub extern fn igImLineClosestPoint(pOut: [*c]ImVec2, a: ImVec2, b: ImVec2, p: ImVec2) void;
pub extern fn igImTriangleContainsPoint(a: ImVec2, b: ImVec2, c: ImVec2, p: ImVec2) bool;
pub extern fn igImTriangleClosestPoint(pOut: [*c]ImVec2, a: ImVec2, b: ImVec2, c: ImVec2, p: ImVec2) void;
pub extern fn igImTriangleBarycentricCoords(a: ImVec2, b: ImVec2, c: ImVec2, p: ImVec2, out_u: [*c]f32, out_v: [*c]f32, out_w: [*c]f32) void;
pub extern fn igImTriangleArea(a: ImVec2, b: ImVec2, c: ImVec2) f32;
pub extern fn igImGetDirQuadrantFromDelta(dx: f32, dy: f32) ImGuiDir;
pub extern fn ImVec1_ImVec1_Nil() [*c]ImVec1;
pub extern fn ImVec1_destroy(self: [*c]ImVec1) void;
pub extern fn ImVec1_ImVec1_Float(_x: f32) [*c]ImVec1;
pub extern fn ImVec2ih_ImVec2ih_Nil() [*c]ImVec2ih;
pub extern fn ImVec2ih_destroy(self: [*c]ImVec2ih) void;
pub extern fn ImVec2ih_ImVec2ih_short(_x: c_short, _y: c_short) [*c]ImVec2ih;
pub extern fn ImVec2ih_ImVec2ih_Vec2(rhs: ImVec2) [*c]ImVec2ih;
pub extern fn ImRect_ImRect_Nil() [*c]ImRect;
pub extern fn ImRect_destroy(self: [*c]ImRect) void;
pub extern fn ImRect_ImRect_Vec2(min: ImVec2, max: ImVec2) [*c]ImRect;
pub extern fn ImRect_ImRect_Vec4(v: ImVec4) [*c]ImRect;
pub extern fn ImRect_ImRect_Float(x1: f32, y1: f32, x2: f32, y2: f32) [*c]ImRect;
pub extern fn ImRect_GetCenter(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetSize(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetWidth(self: [*c]ImRect) f32;
pub extern fn ImRect_GetHeight(self: [*c]ImRect) f32;
pub extern fn ImRect_GetArea(self: [*c]ImRect) f32;
pub extern fn ImRect_GetTL(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetTR(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetBL(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_GetBR(pOut: [*c]ImVec2, self: [*c]ImRect) void;
pub extern fn ImRect_Contains_Vec2(self: [*c]ImRect, p: ImVec2) bool;
pub extern fn ImRect_Contains_Rect(self: [*c]ImRect, r: ImRect) bool;
pub extern fn ImRect_Overlaps(self: [*c]ImRect, r: ImRect) bool;
pub extern fn ImRect_Add_Vec2(self: [*c]ImRect, p: ImVec2) void;
pub extern fn ImRect_Add_Rect(self: [*c]ImRect, r: ImRect) void;
pub extern fn ImRect_Expand_Float(self: [*c]ImRect, amount: f32) void;
pub extern fn ImRect_Expand_Vec2(self: [*c]ImRect, amount: ImVec2) void;
pub extern fn ImRect_Translate(self: [*c]ImRect, d: ImVec2) void;
pub extern fn ImRect_TranslateX(self: [*c]ImRect, dx: f32) void;
pub extern fn ImRect_TranslateY(self: [*c]ImRect, dy: f32) void;
pub extern fn ImRect_ClipWith(self: [*c]ImRect, r: ImRect) void;
pub extern fn ImRect_ClipWithFull(self: [*c]ImRect, r: ImRect) void;
pub extern fn ImRect_Floor(self: [*c]ImRect) void;
pub extern fn ImRect_IsInverted(self: [*c]ImRect) bool;
pub extern fn ImRect_ToVec4(pOut: [*c]ImVec4, self: [*c]ImRect) void;
pub extern fn igImBitArrayTestBit(arr: [*c]const ImU32, n: c_int) bool;
pub extern fn igImBitArrayClearBit(arr: [*c]ImU32, n: c_int) void;
pub extern fn igImBitArraySetBit(arr: [*c]ImU32, n: c_int) void;
pub extern fn igImBitArraySetBitRange(arr: [*c]ImU32, n: c_int, n2: c_int) void;
pub extern fn ImBitVector_Create(self: [*c]ImBitVector, sz: c_int) void;
pub extern fn ImBitVector_Clear(self: [*c]ImBitVector) void;
pub extern fn ImBitVector_TestBit(self: [*c]ImBitVector, n: c_int) bool;
pub extern fn ImBitVector_SetBit(self: [*c]ImBitVector, n: c_int) void;
pub extern fn ImBitVector_ClearBit(self: [*c]ImBitVector, n: c_int) void;
pub extern fn ImDrawListSharedData_ImDrawListSharedData() [*c]ImDrawListSharedData;
pub extern fn ImDrawListSharedData_destroy(self: [*c]ImDrawListSharedData) void;
pub extern fn ImDrawListSharedData_SetCircleTessellationMaxError(self: [*c]ImDrawListSharedData, max_error: f32) void;
pub extern fn ImDrawDataBuilder_Clear(self: [*c]ImDrawDataBuilder) void;
pub extern fn ImDrawDataBuilder_ClearFreeMemory(self: [*c]ImDrawDataBuilder) void;
pub extern fn ImDrawDataBuilder_GetDrawListCount(self: [*c]ImDrawDataBuilder) c_int;
pub extern fn ImDrawDataBuilder_FlattenIntoSingleLayer(self: [*c]ImDrawDataBuilder) void;
pub extern fn ImGuiStyleMod_ImGuiStyleMod_Int(idx: ImGuiStyleVar, v: c_int) [*c]ImGuiStyleMod;
pub extern fn ImGuiStyleMod_destroy(self: [*c]ImGuiStyleMod) void;
pub extern fn ImGuiStyleMod_ImGuiStyleMod_Float(idx: ImGuiStyleVar, v: f32) [*c]ImGuiStyleMod;
pub extern fn ImGuiStyleMod_ImGuiStyleMod_Vec2(idx: ImGuiStyleVar, v: ImVec2) [*c]ImGuiStyleMod;
pub extern fn ImGuiMenuColumns_ImGuiMenuColumns() [*c]ImGuiMenuColumns;
pub extern fn ImGuiMenuColumns_destroy(self: [*c]ImGuiMenuColumns) void;
pub extern fn ImGuiMenuColumns_Update(self: [*c]ImGuiMenuColumns, count: c_int, spacing: f32, clear: bool) void;
pub extern fn ImGuiMenuColumns_DeclColumns(self: [*c]ImGuiMenuColumns, w0: f32, w1: f32, w2: f32) f32;
pub extern fn ImGuiMenuColumns_CalcExtraSpace(self: [*c]ImGuiMenuColumns, avail_w: f32) f32;
pub extern fn ImGuiInputTextState_ImGuiInputTextState() [*c]ImGuiInputTextState;
pub extern fn ImGuiInputTextState_destroy(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_ClearText(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_ClearFreeMemory(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_GetUndoAvailCount(self: [*c]ImGuiInputTextState) c_int;
pub extern fn ImGuiInputTextState_GetRedoAvailCount(self: [*c]ImGuiInputTextState) c_int;
pub extern fn ImGuiInputTextState_OnKeyPressed(self: [*c]ImGuiInputTextState, key: c_int) void;
pub extern fn ImGuiInputTextState_CursorAnimReset(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_CursorClamp(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_HasSelection(self: [*c]ImGuiInputTextState) bool;
pub extern fn ImGuiInputTextState_ClearSelection(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiInputTextState_SelectAll(self: [*c]ImGuiInputTextState) void;
pub extern fn ImGuiPopupData_ImGuiPopupData() [*c]ImGuiPopupData;
pub extern fn ImGuiPopupData_destroy(self: [*c]ImGuiPopupData) void;
pub extern fn ImGuiNavMoveResult_ImGuiNavMoveResult() [*c]ImGuiNavMoveResult;
pub extern fn ImGuiNavMoveResult_destroy(self: [*c]ImGuiNavMoveResult) void;
pub extern fn ImGuiNavMoveResult_Clear(self: [*c]ImGuiNavMoveResult) void;
pub extern fn ImGuiNextWindowData_ImGuiNextWindowData() [*c]ImGuiNextWindowData;
pub extern fn ImGuiNextWindowData_destroy(self: [*c]ImGuiNextWindowData) void;
pub extern fn ImGuiNextWindowData_ClearFlags(self: [*c]ImGuiNextWindowData) void;
pub extern fn ImGuiNextItemData_ImGuiNextItemData() [*c]ImGuiNextItemData;
pub extern fn ImGuiNextItemData_destroy(self: [*c]ImGuiNextItemData) void;
pub extern fn ImGuiNextItemData_ClearFlags(self: [*c]ImGuiNextItemData) void;
pub extern fn ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(ptr: ?*c_void) [*c]ImGuiPtrOrIndex;
pub extern fn ImGuiPtrOrIndex_destroy(self: [*c]ImGuiPtrOrIndex) void;
pub extern fn ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(index: c_int) [*c]ImGuiPtrOrIndex;
pub extern fn ImGuiOldColumnData_ImGuiOldColumnData() [*c]ImGuiOldColumnData;
pub extern fn ImGuiOldColumnData_destroy(self: [*c]ImGuiOldColumnData) void;
pub extern fn ImGuiOldColumns_ImGuiOldColumns() [*c]ImGuiOldColumns;
pub extern fn ImGuiOldColumns_destroy(self: [*c]ImGuiOldColumns) void;
pub extern fn ImGuiViewportP_ImGuiViewportP() [*c]ImGuiViewportP;
pub extern fn ImGuiViewportP_destroy(self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiViewportP_GetMainRect(pOut: [*c]ImRect, self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiViewportP_GetWorkRect(pOut: [*c]ImRect, self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiViewportP_UpdateWorkRect(self: [*c]ImGuiViewportP) void;
pub extern fn ImGuiWindowSettings_ImGuiWindowSettings() [*c]ImGuiWindowSettings;
pub extern fn ImGuiWindowSettings_destroy(self: [*c]ImGuiWindowSettings) void;
pub extern fn ImGuiWindowSettings_GetName(self: [*c]ImGuiWindowSettings) [*c]u8;
pub extern fn ImGuiSettingsHandler_ImGuiSettingsHandler() [*c]ImGuiSettingsHandler;
pub extern fn ImGuiSettingsHandler_destroy(self: [*c]ImGuiSettingsHandler) void;
pub extern fn ImGuiMetricsConfig_ImGuiMetricsConfig() [*c]ImGuiMetricsConfig;
pub extern fn ImGuiMetricsConfig_destroy(self: [*c]ImGuiMetricsConfig) void;
pub extern fn ImGuiStackSizes_ImGuiStackSizes() [*c]ImGuiStackSizes;
pub extern fn ImGuiStackSizes_destroy(self: [*c]ImGuiStackSizes) void;
pub extern fn ImGuiStackSizes_SetToCurrentState(self: [*c]ImGuiStackSizes) void;
pub extern fn ImGuiStackSizes_CompareWithCurrentState(self: [*c]ImGuiStackSizes) void;
pub extern fn ImGuiContextHook_ImGuiContextHook() [*c]ImGuiContextHook;
pub extern fn ImGuiContextHook_destroy(self: [*c]ImGuiContextHook) void;
pub extern fn ImGuiContext_ImGuiContext(shared_font_atlas: [*c]ImFontAtlas) [*c]ImGuiContext;
pub extern fn ImGuiContext_destroy(self: [*c]ImGuiContext) void;
pub extern fn ImGuiWindow_ImGuiWindow(context: [*c]ImGuiContext, name: [*c]const u8) ?*ImGuiWindow;
pub extern fn ImGuiWindow_destroy(self: ?*ImGuiWindow) void;
pub extern fn ImGuiWindow_GetID_Str(self: ?*ImGuiWindow, str: [*c]const u8, str_end: [*c]const u8) ImGuiID;
pub extern fn ImGuiWindow_GetID_Ptr(self: ?*ImGuiWindow, ptr: ?*const c_void) ImGuiID;
pub extern fn ImGuiWindow_GetID_Int(self: ?*ImGuiWindow, n: c_int) ImGuiID;
pub extern fn ImGuiWindow_GetIDNoKeepAlive_Str(self: ?*ImGuiWindow, str: [*c]const u8, str_end: [*c]const u8) ImGuiID;
pub extern fn ImGuiWindow_GetIDNoKeepAlive_Ptr(self: ?*ImGuiWindow, ptr: ?*const c_void) ImGuiID;
pub extern fn ImGuiWindow_GetIDNoKeepAlive_Int(self: ?*ImGuiWindow, n: c_int) ImGuiID;
pub extern fn ImGuiWindow_GetIDFromRectangle(self: ?*ImGuiWindow, r_abs: ImRect) ImGuiID;
pub extern fn ImGuiWindow_Rect(pOut: [*c]ImRect, self: ?*ImGuiWindow) void;
pub extern fn ImGuiWindow_CalcFontSize(self: ?*ImGuiWindow) f32;
pub extern fn ImGuiWindow_TitleBarHeight(self: ?*ImGuiWindow) f32;
pub extern fn ImGuiWindow_TitleBarRect(pOut: [*c]ImRect, self: ?*ImGuiWindow) void;
pub extern fn ImGuiWindow_MenuBarHeight(self: ?*ImGuiWindow) f32;
pub extern fn ImGuiWindow_MenuBarRect(pOut: [*c]ImRect, self: ?*ImGuiWindow) void;
pub extern fn ImGuiLastItemDataBackup_ImGuiLastItemDataBackup() [*c]ImGuiLastItemDataBackup;
pub extern fn ImGuiLastItemDataBackup_destroy(self: [*c]ImGuiLastItemDataBackup) void;
pub extern fn ImGuiLastItemDataBackup_Backup(self: [*c]ImGuiLastItemDataBackup) void;
pub extern fn ImGuiLastItemDataBackup_Restore(self: [*c]ImGuiLastItemDataBackup) void;
pub extern fn ImGuiTabItem_ImGuiTabItem() [*c]ImGuiTabItem;
pub extern fn ImGuiTabItem_destroy(self: [*c]ImGuiTabItem) void;
pub extern fn ImGuiTabBar_ImGuiTabBar() [*c]ImGuiTabBar;
pub extern fn ImGuiTabBar_destroy(self: [*c]ImGuiTabBar) void;
pub extern fn ImGuiTabBar_GetTabOrder(self: [*c]ImGuiTabBar, tab: [*c]const ImGuiTabItem) c_int;
pub extern fn ImGuiTabBar_GetTabName(self: [*c]ImGuiTabBar, tab: [*c]const ImGuiTabItem) [*c]const u8;
pub extern fn ImGuiTableColumn_ImGuiTableColumn() ?*ImGuiTableColumn;
pub extern fn ImGuiTableColumn_destroy(self: ?*ImGuiTableColumn) void;
pub extern fn ImGuiTable_ImGuiTable() ?*ImGuiTable;
pub extern fn ImGuiTable_destroy(self: ?*ImGuiTable) void;
pub extern fn ImGuiTableColumnSettings_ImGuiTableColumnSettings() ?*ImGuiTableColumnSettings;
pub extern fn ImGuiTableColumnSettings_destroy(self: ?*ImGuiTableColumnSettings) void;
pub extern fn ImGuiTableSettings_ImGuiTableSettings() [*c]ImGuiTableSettings;
pub extern fn ImGuiTableSettings_destroy(self: [*c]ImGuiTableSettings) void;
pub extern fn ImGuiTableSettings_GetColumnSettings(self: [*c]ImGuiTableSettings) ?*ImGuiTableColumnSettings;
pub extern fn igGetCurrentWindowRead() ?*ImGuiWindow;
pub extern fn igGetCurrentWindow() ?*ImGuiWindow;
pub extern fn igFindWindowByID(id: ImGuiID) ?*ImGuiWindow;
pub extern fn igFindWindowByName(name: [*c]const u8) ?*ImGuiWindow;
pub extern fn igUpdateWindowParentAndRootLinks(window: ?*ImGuiWindow, flags: ImGuiWindowFlags, parent_window: ?*ImGuiWindow) void;
pub extern fn igCalcWindowNextAutoFitSize(pOut: [*c]ImVec2, window: ?*ImGuiWindow) void;
pub extern fn igIsWindowChildOf(window: ?*ImGuiWindow, potential_parent: ?*ImGuiWindow) bool;
pub extern fn igIsWindowAbove(potential_above: ?*ImGuiWindow, potential_below: ?*ImGuiWindow) bool;
pub extern fn igIsWindowNavFocusable(window: ?*ImGuiWindow) bool;
pub extern fn igGetWindowAllowedExtentRect(pOut: [*c]ImRect, window: ?*ImGuiWindow) void;
pub extern fn igSetWindowPos_WindowPtr(window: ?*ImGuiWindow, pos: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowSize_WindowPtr(window: ?*ImGuiWindow, size: ImVec2, cond: ImGuiCond) void;
pub extern fn igSetWindowCollapsed_WindowPtr(window: ?*ImGuiWindow, collapsed: bool, cond: ImGuiCond) void;
pub extern fn igSetWindowHitTestHole(window: ?*ImGuiWindow, pos: ImVec2, size: ImVec2) void;
pub extern fn igFocusWindow(window: ?*ImGuiWindow) void;
pub extern fn igFocusTopMostWindowUnderOne(under_this_window: ?*ImGuiWindow, ignore_window: ?*ImGuiWindow) void;
pub extern fn igBringWindowToFocusFront(window: ?*ImGuiWindow) void;
pub extern fn igBringWindowToDisplayFront(window: ?*ImGuiWindow) void;
pub extern fn igBringWindowToDisplayBack(window: ?*ImGuiWindow) void;
pub extern fn igSetCurrentFont(font: [*c]ImFont) void;
pub extern fn igGetDefaultFont() [*c]ImFont;
pub extern fn igGetForegroundDrawList_WindowPtr(window: ?*ImGuiWindow) [*c]ImDrawList;
pub extern fn igGetBackgroundDrawList_ViewportPtr(viewport: [*c]ImGuiViewport) [*c]ImDrawList;
pub extern fn igGetForegroundDrawList_ViewportPtr(viewport: [*c]ImGuiViewport) [*c]ImDrawList;
pub extern fn igInitialize(context: [*c]ImGuiContext) void;
pub extern fn igShutdown(context: [*c]ImGuiContext) void;
pub extern fn igUpdateHoveredWindowAndCaptureFlags() void;
pub extern fn igStartMouseMovingWindow(window: ?*ImGuiWindow) void;
pub extern fn igUpdateMouseMovingWindowNewFrame() void;
pub extern fn igUpdateMouseMovingWindowEndFrame() void;
pub extern fn igAddContextHook(context: [*c]ImGuiContext, hook: [*c]const ImGuiContextHook) ImGuiID;
pub extern fn igRemoveContextHook(context: [*c]ImGuiContext, hook_to_remove: ImGuiID) void;
pub extern fn igCallContextHooks(context: [*c]ImGuiContext, type: ImGuiContextHookType) void;
pub extern fn igMarkIniSettingsDirty_Nil() void;
pub extern fn igMarkIniSettingsDirty_WindowPtr(window: ?*ImGuiWindow) void;
pub extern fn igClearIniSettings() void;
pub extern fn igCreateNewWindowSettings(name: [*c]const u8) [*c]ImGuiWindowSettings;
pub extern fn igFindWindowSettings(id: ImGuiID) [*c]ImGuiWindowSettings;
pub extern fn igFindOrCreateWindowSettings(name: [*c]const u8) [*c]ImGuiWindowSettings;
pub extern fn igFindSettingsHandler(type_name: [*c]const u8) [*c]ImGuiSettingsHandler;
pub extern fn igSetNextWindowScroll(scroll: ImVec2) void;
pub extern fn igSetScrollX_WindowPtr(window: ?*ImGuiWindow, scroll_x: f32) void;
pub extern fn igSetScrollY_WindowPtr(window: ?*ImGuiWindow, scroll_y: f32) void;
pub extern fn igSetScrollFromPosX_WindowPtr(window: ?*ImGuiWindow, local_x: f32, center_x_ratio: f32) void;
pub extern fn igSetScrollFromPosY_WindowPtr(window: ?*ImGuiWindow, local_y: f32, center_y_ratio: f32) void;
pub extern fn igScrollToBringRectIntoView(pOut: [*c]ImVec2, window: ?*ImGuiWindow, item_rect: ImRect) void;
pub extern fn igGetItemID() ImGuiID;
pub extern fn igGetItemStatusFlags() ImGuiItemStatusFlags;
pub extern fn igGetActiveID() ImGuiID;
pub extern fn igGetFocusID() ImGuiID;
pub extern fn igGetItemsFlags() ImGuiItemFlags;
pub extern fn igSetActiveID(id: ImGuiID, window: ?*ImGuiWindow) void;
pub extern fn igSetFocusID(id: ImGuiID, window: ?*ImGuiWindow) void;
pub extern fn igClearActiveID() void;
pub extern fn igGetHoveredID() ImGuiID;
pub extern fn igSetHoveredID(id: ImGuiID) void;
pub extern fn igKeepAliveID(id: ImGuiID) void;
pub extern fn igMarkItemEdited(id: ImGuiID) void;
pub extern fn igPushOverrideID(id: ImGuiID) void;
pub extern fn igGetIDWithSeed(str_id_begin: [*c]const u8, str_id_end: [*c]const u8, seed: ImGuiID) ImGuiID;
pub extern fn igItemSize_Vec2(size: ImVec2, text_baseline_y: f32) void;
pub extern fn igItemSize_Rect(bb: ImRect, text_baseline_y: f32) void;
pub extern fn igItemAdd(bb: ImRect, id: ImGuiID, nav_bb: [*c]const ImRect) bool;
pub extern fn igItemHoverable(bb: ImRect, id: ImGuiID) bool;
pub extern fn igIsClippedEx(bb: ImRect, id: ImGuiID, clip_even_when_logged: bool) bool;
pub extern fn igSetLastItemData(window: ?*ImGuiWindow, item_id: ImGuiID, status_flags: ImGuiItemStatusFlags, item_rect: ImRect) void;
pub extern fn igFocusableItemRegister(window: ?*ImGuiWindow, id: ImGuiID) bool;
pub extern fn igFocusableItemUnregister(window: ?*ImGuiWindow) void;
pub extern fn igCalcItemSize(pOut: [*c]ImVec2, size: ImVec2, default_w: f32, default_h: f32) void;
pub extern fn igCalcWrapWidthForPos(pos: ImVec2, wrap_pos_x: f32) f32;
pub extern fn igPushMultiItemsWidths(components: c_int, width_full: f32) void;
pub extern fn igPushItemFlag(option: ImGuiItemFlags, enabled: bool) void;
pub extern fn igPopItemFlag() void;
pub extern fn igIsItemToggledSelection() bool;
pub extern fn igGetContentRegionMaxAbs(pOut: [*c]ImVec2) void;
pub extern fn igShrinkWidths(items: [*c]ImGuiShrinkWidthItem, count: c_int, width_excess: f32) void;
pub extern fn igLogBegin(type: ImGuiLogType, auto_open_depth: c_int) void;
pub extern fn igLogToBuffer(auto_open_depth: c_int) void;
pub extern fn igLogRenderedText(ref_pos: [*c]const ImVec2, text: [*c]const u8, text_end: [*c]const u8) void;
pub extern fn igLogSetNextTextDecoration(prefix: [*c]const u8, suffix: [*c]const u8) void;
pub extern fn igBeginChildEx(name: [*c]const u8, id: ImGuiID, size_arg: ImVec2, border: bool, flags: ImGuiWindowFlags) bool;
pub extern fn igOpenPopupEx(id: ImGuiID, popup_flags: ImGuiPopupFlags) void;
pub extern fn igClosePopupToLevel(remaining: c_int, restore_focus_to_window_under_popup: bool) void;
pub extern fn igClosePopupsOverWindow(ref_window: ?*ImGuiWindow, restore_focus_to_window_under_popup: bool) void;
pub extern fn igIsPopupOpen_ID(id: ImGuiID, popup_flags: ImGuiPopupFlags) bool;
pub extern fn igBeginPopupEx(id: ImGuiID, extra_flags: ImGuiWindowFlags) bool;
pub extern fn igBeginTooltipEx(extra_flags: ImGuiWindowFlags, tooltip_flags: ImGuiTooltipFlags) void;
pub extern fn igGetTopMostPopupModal() ?*ImGuiWindow;
pub extern fn igFindBestWindowPosForPopup(pOut: [*c]ImVec2, window: ?*ImGuiWindow) void;
pub extern fn igFindBestWindowPosForPopupEx(pOut: [*c]ImVec2, ref_pos: ImVec2, size: ImVec2, last_dir: [*c]ImGuiDir, r_outer: ImRect, r_avoid: ImRect, policy: ImGuiPopupPositionPolicy) void;
pub extern fn igNavInitWindow(window: ?*ImGuiWindow, force_reinit: bool) void;
pub extern fn igNavMoveRequestButNoResultYet() bool;
pub extern fn igNavMoveRequestCancel() void;
pub extern fn igNavMoveRequestForward(move_dir: ImGuiDir, clip_dir: ImGuiDir, bb_rel: ImRect, move_flags: ImGuiNavMoveFlags) void;
pub extern fn igNavMoveRequestTryWrapping(window: ?*ImGuiWindow, move_flags: ImGuiNavMoveFlags) void;
pub extern fn igGetNavInputAmount(n: ImGuiNavInput, mode: ImGuiInputReadMode) f32;
pub extern fn igGetNavInputAmount2d(pOut: [*c]ImVec2, dir_sources: ImGuiNavDirSourceFlags, mode: ImGuiInputReadMode, slow_factor: f32, fast_factor: f32) void;
pub extern fn igCalcTypematicRepeatAmount(t0: f32, t1: f32, repeat_delay: f32, repeat_rate: f32) c_int;
pub extern fn igActivateItem(id: ImGuiID) void;
pub extern fn igSetNavID(id: ImGuiID, nav_layer: c_int, focus_scope_id: ImGuiID, rect_rel: ImRect) void;
pub extern fn igPushFocusScope(id: ImGuiID) void;
pub extern fn igPopFocusScope() void;
pub extern fn igGetFocusedFocusScope() ImGuiID;
pub extern fn igGetFocusScope() ImGuiID;
pub extern fn igSetItemUsingMouseWheel() void;
pub extern fn igIsActiveIdUsingNavDir(dir: ImGuiDir) bool;
pub extern fn igIsActiveIdUsingNavInput(input: ImGuiNavInput) bool;
pub extern fn igIsActiveIdUsingKey(key: ImGuiKey) bool;
pub extern fn igIsMouseDragPastThreshold(button: ImGuiMouseButton, lock_threshold: f32) bool;
pub extern fn igIsKeyPressedMap(key: ImGuiKey, repeat: bool) bool;
pub extern fn igIsNavInputDown(n: ImGuiNavInput) bool;
pub extern fn igIsNavInputTest(n: ImGuiNavInput, rm: ImGuiInputReadMode) bool;
pub extern fn igGetMergedKeyModFlags() ImGuiKeyModFlags;
pub extern fn igBeginDragDropTargetCustom(bb: ImRect, id: ImGuiID) bool;
pub extern fn igClearDragDrop() void;
pub extern fn igIsDragDropPayloadBeingAccepted() bool;
pub extern fn igSetWindowClipRectBeforeSetChannel(window: ?*ImGuiWindow, clip_rect: ImRect) void;
pub extern fn igBeginColumns(str_id: [*c]const u8, count: c_int, flags: ImGuiOldColumnFlags) void;
pub extern fn igEndColumns() void;
pub extern fn igPushColumnClipRect(column_index: c_int) void;
pub extern fn igPushColumnsBackground() void;
pub extern fn igPopColumnsBackground() void;
pub extern fn igGetColumnsID(str_id: [*c]const u8, count: c_int) ImGuiID;
pub extern fn igFindOrCreateColumns(window: ?*ImGuiWindow, id: ImGuiID) [*c]ImGuiOldColumns;
pub extern fn igGetColumnOffsetFromNorm(columns: [*c]const ImGuiOldColumns, offset_norm: f32) f32;
pub extern fn igGetColumnNormFromOffset(columns: [*c]const ImGuiOldColumns, offset: f32) f32;
pub extern fn igTableOpenContextMenu(column_n: c_int) void;
pub extern fn igTableSetColumnEnabled(column_n: c_int, enabled: bool) void;
pub extern fn igTableSetColumnWidth(column_n: c_int, width: f32) void;
pub extern fn igTableSetColumnSortDirection(column_n: c_int, sort_direction: ImGuiSortDirection, append_to_sort_specs: bool) void;
pub extern fn igTableGetHoveredColumn() c_int;
pub extern fn igTableGetHeaderRowHeight() f32;
pub extern fn igTablePushBackgroundChannel() void;
pub extern fn igTablePopBackgroundChannel() void;
pub extern fn igGetCurrentTable() ?*ImGuiTable;
pub extern fn igTableFindByID(id: ImGuiID) ?*ImGuiTable;
pub extern fn igBeginTableEx(name: [*c]const u8, id: ImGuiID, columns_count: c_int, flags: ImGuiTableFlags, outer_size: ImVec2, inner_width: f32) bool;
pub extern fn igTableBeginInitMemory(table: ?*ImGuiTable, columns_count: c_int) void;
pub extern fn igTableBeginApplyRequests(table: ?*ImGuiTable) void;
pub extern fn igTableSetupDrawChannels(table: ?*ImGuiTable) void;
pub extern fn igTableUpdateLayout(table: ?*ImGuiTable) void;
pub extern fn igTableUpdateBorders(table: ?*ImGuiTable) void;
pub extern fn igTableUpdateColumnsWeightFromWidth(table: ?*ImGuiTable) void;
pub extern fn igTableDrawBorders(table: ?*ImGuiTable) void;
pub extern fn igTableDrawContextMenu(table: ?*ImGuiTable) void;
pub extern fn igTableMergeDrawChannels(table: ?*ImGuiTable) void;
pub extern fn igTableSortSpecsSanitize(table: ?*ImGuiTable) void;
pub extern fn igTableSortSpecsBuild(table: ?*ImGuiTable) void;
pub extern fn igTableGetColumnNextSortDirection(column: ?*ImGuiTableColumn) ImGuiSortDirection;
pub extern fn igTableFixColumnSortDirection(table: ?*ImGuiTable, column: ?*ImGuiTableColumn) void;
pub extern fn igTableGetColumnWidthAuto(table: ?*ImGuiTable, column: ?*ImGuiTableColumn) f32;
pub extern fn igTableBeginRow(table: ?*ImGuiTable) void;
pub extern fn igTableEndRow(table: ?*ImGuiTable) void;
pub extern fn igTableBeginCell(table: ?*ImGuiTable, column_n: c_int) void;
pub extern fn igTableEndCell(table: ?*ImGuiTable) void;
pub extern fn igTableGetCellBgRect(pOut: [*c]ImRect, table: ?*const ImGuiTable, column_n: c_int) void;
pub extern fn igTableGetColumnName_TablePtr(table: ?*const ImGuiTable, column_n: c_int) [*c]const u8;
pub extern fn igTableGetColumnResizeID(table: ?*const ImGuiTable, column_n: c_int, instance_no: c_int) ImGuiID;
pub extern fn igTableGetMaxColumnWidth(table: ?*const ImGuiTable, column_n: c_int) f32;
pub extern fn igTableSetColumnWidthAutoSingle(table: ?*ImGuiTable, column_n: c_int) void;
pub extern fn igTableSetColumnWidthAutoAll(table: ?*ImGuiTable) void;
pub extern fn igTableRemove(table: ?*ImGuiTable) void;
pub extern fn igTableGcCompactTransientBuffers(table: ?*ImGuiTable) void;
pub extern fn igTableGcCompactSettings() void;
pub extern fn igTableLoadSettings(table: ?*ImGuiTable) void;
pub extern fn igTableSaveSettings(table: ?*ImGuiTable) void;
pub extern fn igTableResetSettings(table: ?*ImGuiTable) void;
pub extern fn igTableGetBoundSettings(table: ?*ImGuiTable) [*c]ImGuiTableSettings;
pub extern fn igTableSettingsInstallHandler(context: [*c]ImGuiContext) void;
pub extern fn igTableSettingsCreate(id: ImGuiID, columns_count: c_int) [*c]ImGuiTableSettings;
pub extern fn igTableSettingsFindByID(id: ImGuiID) [*c]ImGuiTableSettings;
pub extern fn igBeginTabBarEx(tab_bar: [*c]ImGuiTabBar, bb: ImRect, flags: ImGuiTabBarFlags) bool;
pub extern fn igTabBarFindTabByID(tab_bar: [*c]ImGuiTabBar, tab_id: ImGuiID) [*c]ImGuiTabItem;
pub extern fn igTabBarRemoveTab(tab_bar: [*c]ImGuiTabBar, tab_id: ImGuiID) void;
pub extern fn igTabBarCloseTab(tab_bar: [*c]ImGuiTabBar, tab: [*c]ImGuiTabItem) void;
pub extern fn igTabBarQueueReorder(tab_bar: [*c]ImGuiTabBar, tab: [*c]const ImGuiTabItem, dir: c_int) void;
pub extern fn igTabBarProcessReorder(tab_bar: [*c]ImGuiTabBar) bool;
pub extern fn igTabItemEx(tab_bar: [*c]ImGuiTabBar, label: [*c]const u8, p_open: [*c]bool, flags: ImGuiTabItemFlags) bool;
pub extern fn igTabItemCalcSize(pOut: [*c]ImVec2, label: [*c]const u8, has_close_button: bool) void;
pub extern fn igTabItemBackground(draw_list: [*c]ImDrawList, bb: ImRect, flags: ImGuiTabItemFlags, col: ImU32) void;
pub extern fn igTabItemLabelAndCloseButton(draw_list: [*c]ImDrawList, bb: ImRect, flags: ImGuiTabItemFlags, frame_padding: ImVec2, label: [*c]const u8, tab_id: ImGuiID, close_button_id: ImGuiID, is_contents_visible: bool, out_just_closed: [*c]bool, out_text_clipped: [*c]bool) void;
pub extern fn igRenderText(pos: ImVec2, text: [*c]const u8, text_end: [*c]const u8, hide_text_after_hash: bool) void;
pub extern fn igRenderTextWrapped(pos: ImVec2, text: [*c]const u8, text_end: [*c]const u8, wrap_width: f32) void;
pub extern fn igRenderTextClipped(pos_min: ImVec2, pos_max: ImVec2, text: [*c]const u8, text_end: [*c]const u8, text_size_if_known: [*c]const ImVec2, @"align": ImVec2, clip_rect: [*c]const ImRect) void;
pub extern fn igRenderTextClippedEx(draw_list: [*c]ImDrawList, pos_min: ImVec2, pos_max: ImVec2, text: [*c]const u8, text_end: [*c]const u8, text_size_if_known: [*c]const ImVec2, @"align": ImVec2, clip_rect: [*c]const ImRect) void;
pub extern fn igRenderTextEllipsis(draw_list: [*c]ImDrawList, pos_min: ImVec2, pos_max: ImVec2, clip_max_x: f32, ellipsis_max_x: f32, text: [*c]const u8, text_end: [*c]const u8, text_size_if_known: [*c]const ImVec2) void;
pub extern fn igRenderFrame(p_min: ImVec2, p_max: ImVec2, fill_col: ImU32, border: bool, rounding: f32) void;
pub extern fn igRenderFrameBorder(p_min: ImVec2, p_max: ImVec2, rounding: f32) void;
pub extern fn igRenderColorRectWithAlphaCheckerboard(draw_list: [*c]ImDrawList, p_min: ImVec2, p_max: ImVec2, fill_col: ImU32, grid_step: f32, grid_off: ImVec2, rounding: f32, flags: ImDrawFlags) void;
pub extern fn igRenderNavHighlight(bb: ImRect, id: ImGuiID, flags: ImGuiNavHighlightFlags) void;
pub extern fn igFindRenderedTextEnd(text: [*c]const u8, text_end: [*c]const u8) [*c]const u8;
pub extern fn igRenderArrow(draw_list: [*c]ImDrawList, pos: ImVec2, col: ImU32, dir: ImGuiDir, scale: f32) void;
pub extern fn igRenderBullet(draw_list: [*c]ImDrawList, pos: ImVec2, col: ImU32) void;
pub extern fn igRenderCheckMark(draw_list: [*c]ImDrawList, pos: ImVec2, col: ImU32, sz: f32) void;
pub extern fn igRenderMouseCursor(draw_list: [*c]ImDrawList, pos: ImVec2, scale: f32, mouse_cursor: ImGuiMouseCursor, col_fill: ImU32, col_border: ImU32, col_shadow: ImU32) void;
pub extern fn igRenderArrowPointingAt(draw_list: [*c]ImDrawList, pos: ImVec2, half_sz: ImVec2, direction: ImGuiDir, col: ImU32) void;
pub extern fn igRenderRectFilledRangeH(draw_list: [*c]ImDrawList, rect: ImRect, col: ImU32, x_start_norm: f32, x_end_norm: f32, rounding: f32) void;
pub extern fn igRenderRectFilledWithHole(draw_list: [*c]ImDrawList, outer: ImRect, inner: ImRect, col: ImU32, rounding: f32) void;
pub extern fn igTextEx(text: [*c]const u8, text_end: [*c]const u8, flags: ImGuiTextFlags) void;
pub extern fn igButtonEx(label: [*c]const u8, size_arg: ImVec2, flags: ImGuiButtonFlags) bool;
pub extern fn igCloseButton(id: ImGuiID, pos: ImVec2) bool;
pub extern fn igCollapseButton(id: ImGuiID, pos: ImVec2) bool;
pub extern fn igArrowButtonEx(str_id: [*c]const u8, dir: ImGuiDir, size_arg: ImVec2, flags: ImGuiButtonFlags) bool;
pub extern fn igScrollbar(axis: ImGuiAxis) void;
pub extern fn igScrollbarEx(bb: ImRect, id: ImGuiID, axis: ImGuiAxis, p_scroll_v: [*c]f32, avail_v: f32, contents_v: f32, flags: ImDrawFlags) bool;
pub extern fn igImageButtonEx(id: ImGuiID, texture_id: ImTextureID, size: ImVec2, uv0: ImVec2, uv1: ImVec2, padding: ImVec2, bg_col: ImVec4, tint_col: ImVec4) bool;
pub extern fn igGetWindowScrollbarRect(pOut: [*c]ImRect, window: ?*ImGuiWindow, axis: ImGuiAxis) void;
pub extern fn igGetWindowScrollbarID(window: ?*ImGuiWindow, axis: ImGuiAxis) ImGuiID;
pub extern fn igSeparatorEx(flags: ImGuiSeparatorFlags) void;
pub extern fn igCheckboxFlags_S64Ptr(label: [*c]const u8, flags: [*c]ImS64, flags_value: ImS64) bool;
pub extern fn igCheckboxFlags_U64Ptr(label: [*c]const u8, flags: [*c]ImU64, flags_value: ImU64) bool;
pub extern fn igButtonBehavior(bb: ImRect, id: ImGuiID, out_hovered: [*c]bool, out_held: [*c]bool, flags: ImGuiButtonFlags) bool;
pub extern fn igDragBehavior(id: ImGuiID, data_type: ImGuiDataType, p_v: ?*c_void, v_speed: f32, p_min: ?*const c_void, p_max: ?*const c_void, format: [*c]const u8, flags: ImGuiSliderFlags) bool;
pub extern fn igSliderBehavior(bb: ImRect, id: ImGuiID, data_type: ImGuiDataType, p_v: ?*c_void, p_min: ?*const c_void, p_max: ?*const c_void, format: [*c]const u8, flags: ImGuiSliderFlags, out_grab_bb: [*c]ImRect) bool;
pub extern fn igSplitterBehavior(bb: ImRect, id: ImGuiID, axis: ImGuiAxis, size1: [*c]f32, size2: [*c]f32, min_size1: f32, min_size2: f32, hover_extend: f32, hover_visibility_delay: f32) bool;
pub extern fn igTreeNodeBehavior(id: ImGuiID, flags: ImGuiTreeNodeFlags, label: [*c]const u8, label_end: [*c]const u8) bool;
pub extern fn igTreeNodeBehaviorIsOpen(id: ImGuiID, flags: ImGuiTreeNodeFlags) bool;
pub extern fn igTreePushOverrideID(id: ImGuiID) void;
pub extern fn igDataTypeGetInfo(data_type: ImGuiDataType) [*c]const ImGuiDataTypeInfo;
pub extern fn igDataTypeFormatString(buf: [*c]u8, buf_size: c_int, data_type: ImGuiDataType, p_data: ?*const c_void, format: [*c]const u8) c_int;
pub extern fn igDataTypeApplyOp(data_type: ImGuiDataType, op: c_int, output: ?*c_void, arg_1: ?*const c_void, arg_2: ?*const c_void) void;
pub extern fn igDataTypeApplyOpFromText(buf: [*c]const u8, initial_value_buf: [*c]const u8, data_type: ImGuiDataType, p_data: ?*c_void, format: [*c]const u8) bool;
pub extern fn igDataTypeCompare(data_type: ImGuiDataType, arg_1: ?*const c_void, arg_2: ?*const c_void) c_int;
pub extern fn igDataTypeClamp(data_type: ImGuiDataType, p_data: ?*c_void, p_min: ?*const c_void, p_max: ?*const c_void) bool;
pub extern fn igInputTextEx(label: [*c]const u8, hint: [*c]const u8, buf: [*c]u8, buf_size: c_int, size_arg: ImVec2, flags: ImGuiInputTextFlags, callback: ImGuiInputTextCallback, user_data: ?*c_void) bool;
pub extern fn igTempInputText(bb: ImRect, id: ImGuiID, label: [*c]const u8, buf: [*c]u8, buf_size: c_int, flags: ImGuiInputTextFlags) bool;
pub extern fn igTempInputScalar(bb: ImRect, id: ImGuiID, label: [*c]const u8, data_type: ImGuiDataType, p_data: ?*c_void, format: [*c]const u8, p_clamp_min: ?*const c_void, p_clamp_max: ?*const c_void) bool;
pub extern fn igTempInputIsActive(id: ImGuiID) bool;
pub extern fn igGetInputTextState(id: ImGuiID) [*c]ImGuiInputTextState;
pub extern fn igColorTooltip(text: [*c]const u8, col: [*c]const f32, flags: ImGuiColorEditFlags) void;
pub extern fn igColorEditOptionsPopup(col: [*c]const f32, flags: ImGuiColorEditFlags) void;
pub extern fn igColorPickerOptionsPopup(ref_col: [*c]const f32, flags: ImGuiColorEditFlags) void;
pub extern fn igPlotEx(plot_type: ImGuiPlotType, label: [*c]const u8, values_getter: ?fn (?*c_void, c_int) callconv(.C) f32, data: ?*c_void, values_count: c_int, values_offset: c_int, overlay_text: [*c]const u8, scale_min: f32, scale_max: f32, frame_size: ImVec2) c_int;
pub extern fn igShadeVertsLinearColorGradientKeepAlpha(draw_list: [*c]ImDrawList, vert_start_idx: c_int, vert_end_idx: c_int, gradient_p0: ImVec2, gradient_p1: ImVec2, col0: ImU32, col1: ImU32) void;
pub extern fn igShadeVertsLinearUV(draw_list: [*c]ImDrawList, vert_start_idx: c_int, vert_end_idx: c_int, a: ImVec2, b: ImVec2, uv_a: ImVec2, uv_b: ImVec2, clamp: bool) void;
pub extern fn igGcCompactTransientMiscBuffers() void;
pub extern fn igGcCompactTransientWindowBuffers(window: ?*ImGuiWindow) void;
pub extern fn igGcAwakeTransientWindowBuffers(window: ?*ImGuiWindow) void;
pub extern fn igErrorCheckEndFrameRecover(log_callback: ImGuiErrorLogCallback, user_data: ?*c_void) void;
pub extern fn igDebugDrawItemRect(col: ImU32) void;
pub extern fn igDebugStartItemPicker() void;
pub extern fn igDebugNodeColumns(columns: [*c]ImGuiOldColumns) void;
pub extern fn igDebugNodeDrawList(window: ?*ImGuiWindow, draw_list: [*c]const ImDrawList, label: [*c]const u8) void;
pub extern fn igDebugNodeDrawCmdShowMeshAndBoundingBox(out_draw_list: [*c]ImDrawList, draw_list: [*c]const ImDrawList, draw_cmd: [*c]const ImDrawCmd, show_mesh: bool, show_aabb: bool) void;
pub extern fn igDebugNodeStorage(storage: [*c]ImGuiStorage, label: [*c]const u8) void;
pub extern fn igDebugNodeTabBar(tab_bar: [*c]ImGuiTabBar, label: [*c]const u8) void;
pub extern fn igDebugNodeTable(table: ?*ImGuiTable) void;
pub extern fn igDebugNodeTableSettings(settings: [*c]ImGuiTableSettings) void;
pub extern fn igDebugNodeWindow(window: ?*ImGuiWindow, label: [*c]const u8) void;
pub extern fn igDebugNodeWindowSettings(settings: [*c]ImGuiWindowSettings) void;
pub extern fn igDebugNodeWindowsList(windows: [*c]ImVector_ImGuiWindowPtr, label: [*c]const u8) void;
pub extern fn igDebugNodeViewport(viewport: [*c]ImGuiViewportP) void;
pub extern fn igDebugRenderViewportThumbnail(draw_list: [*c]ImDrawList, viewport: [*c]ImGuiViewportP, bb: ImRect) void;
pub extern fn igImFontAtlasGetBuilderForStbTruetype() [*c]const ImFontBuilderIO;
pub extern fn igImFontAtlasBuildInit(atlas: [*c]ImFontAtlas) void;
pub extern fn igImFontAtlasBuildSetupFont(atlas: [*c]ImFontAtlas, font: [*c]ImFont, font_config: [*c]ImFontConfig, ascent: f32, descent: f32) void;
pub extern fn igImFontAtlasBuildPackCustomRects(atlas: [*c]ImFontAtlas, stbrp_context_opaque: ?*c_void) void;
pub extern fn igImFontAtlasBuildFinish(atlas: [*c]ImFontAtlas) void;
pub extern fn igImFontAtlasBuildRender8bppRectFromString(atlas: [*c]ImFontAtlas, x: c_int, y: c_int, w: c_int, h: c_int, in_str: [*c]const u8, in_marker_char: u8, in_marker_pixel_value: u8) void;
pub extern fn igImFontAtlasBuildRender32bppRectFromString(atlas: [*c]ImFontAtlas, x: c_int, y: c_int, w: c_int, h: c_int, in_str: [*c]const u8, in_marker_char: u8, in_marker_pixel_value: c_uint) void;
pub extern fn igImFontAtlasBuildMultiplyCalcLookupTable(out_table: [*c]u8, in_multiply_factor: f32) void;
pub extern fn igImFontAtlasBuildMultiplyRectAlpha8(table: [*c]const u8, pixels: [*c]u8, x: c_int, y: c_int, w: c_int, h: c_int, stride: c_int) void;
pub extern fn igLogText(fmt: [*c]const u8, ...) void;
pub extern fn ImGuiTextBuffer_appendf(buffer: [*c]struct_ImGuiTextBuffer, fmt: [*c]const u8, ...) void;
const __INTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):61:9
const __UINTMAX_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):65:9
const __PTRDIFF_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):72:9
const __INTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):76:9
const __SIZE_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):80:9
const __UINTPTR_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):95:9
const __INT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):159:9
const __UINT64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):187:9
const __INT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):225:9
const __UINT_LEAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):229:9
const __INT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):265:9
const __UINT_FAST64_TYPE__ = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // (no file):269:9
const __STRINGIFY = @compileError("unable to translate C expr: unexpected token .Hash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:10:9
const __MINGW64_VERSION_STR = @compileError("unable to translate C expr: unexpected token .StringLiteral"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:26:9
const __MINGW_IMP_SYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:119:11
const __MINGW_IMP_LSYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:120:11
const __MINGW_LSYMBOL = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:122:11
const __MINGW_POISON_NAME = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:203:11
const __MSABI_LONG = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:209:13
const __MINGW_ATTRIB_DEPRECATED_STR = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:247:11
const __mingw_ovr = @compileError("unable to translate C expr: unexpected token .Keyword_static"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_mac.h:289:11
const __MINGW_CRT_NAME_CONCAT2 = @compileError("unable to translate C expr: unexpected token .Colon"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_secapi.h:41:9
const __CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY_0_3_ = @compileError("unable to translate C expr: unexpected token .Identifier"); // C:\zig\lib\zig\libc\include\any-windows-any/_mingw_secapi.h:69:9
const __MINGW_IMPORT = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:51:12
const __CRT_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:90:11
const __MINGW_INTRIN_INLINE = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:97:9
const __MINGW_PRAGMA_PARAM = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:215:9
const __MINGW_BROKEN_INTERFACE = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:218:9
const __int64 = @compileError("unable to translate C expr: unexpected token .Keyword_long"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:242:9
const __forceinline = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:267:9
const _crt_va_start = @compileError("TODO implement function '__builtin_va_start' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:48:9
const _crt_va_arg = @compileError("TODO implement function '__builtin_va_arg' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:49:9
const _crt_va_end = @compileError("TODO implement function '__builtin_va_end' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:50:9
const _crt_va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // C:\zig\lib\zig\libc\include\any-windows-any\vadefs.h:51:9
const __CRT_STRINGIZE = @compileError("unable to translate C expr: unexpected token .Hash"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:286:9
const __CRT_WIDE = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:291:9
const _CRT_INSECURE_DEPRECATE_MEMORY = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:353:9
const _CRT_INSECURE_DEPRECATE_GLOBALS = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:357:9
const _CRT_OBSOLETE = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:365:9
const _UNION_NAME = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:476:9
const _STRUCT_NAME = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:477:9
const __CRT_UUID_DECL = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\_mingw.h:564:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:267:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:268:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:269:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:270:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_4 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:271:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_1 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:272:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_2 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:273:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_1_3 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:274:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_2_0 = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:275:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_1_ARGLIST = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:276:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_0_2_ARGLIST = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:277:9
const __DEFINE_CPP_OVERLOAD_SECURE_FUNC_SPLITPATH = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:278:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:282:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:284:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:286:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:288:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4 = @compileError("unable to translate C expr: expected ',' or ')'"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:290:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_0_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:427:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_1_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:428:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_2_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:429:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_3_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:430:9
const __DEFINE_CPP_OVERLOAD_STANDARD_FUNC_0_4_EX = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:431:9
const __crt_typefix = @compileError("unable to translate C expr: unexpected token .Nl"); // C:\zig\lib\zig\libc\include\any-windows-any\corecrt.h:491:9
const _fgetc_nolock = @compileError("TODO unary inc/dec expr"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1462:9
const _fputc_nolock = @compileError("TODO unary inc/dec expr"); // C:\zig\lib\zig\libc\include\any-windows-any\stdio.h:1463:9
const INT64_C = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any\stdint.h:198:9
const UINT32_C = @compileError("unable to translate C expr: expected ')' instead got: HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any\stdint.h:202:9
const UINT64_C = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any\stdint.h:203:9
const INTMAX_C = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any\stdint.h:206:9
const UINTMAX_C = @compileError("unable to translate C expr: unexpected token .HashHash"); // C:\zig\lib\zig\libc\include\any-windows-any\stdint.h:207:9
const va_start = @compileError("TODO implement function '__builtin_va_start' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:17:9
const va_end = @compileError("TODO implement function '__builtin_va_end' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:18:9
const va_arg = @compileError("TODO implement function '__builtin_va_arg' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:19:9
const __va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:24:9
const va_copy = @compileError("TODO implement function '__builtin_va_copy' in std.c.builtins"); // C:\zig\lib\zig\include\stdarg.h:27:9
const EXTERN = @compileError("unable to translate C expr: unexpected token .Keyword_extern"); // cimgui.h:27:13
const CONST = @compileError("unable to translate C expr: unexpected token .Keyword_const"); // cimgui.h:31:9
const __llvm__ = @as(c_int, 1);
const __clang__ = @as(c_int, 1);
const __clang_major__ = @as(c_int, 12);
const __clang_minor__ = @as(c_int, 0);
const __clang_patchlevel__ = @as(c_int, 0);
const __clang_version__ = "12.0.0 (https://github.com/llvm/llvm-project fa0971b87fb2c9d14d1bba2551e61f02f18f329b)";
const __GNUC__ = @as(c_int, 4);
const __GNUC_MINOR__ = @as(c_int, 2);
const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
const __GXX_ABI_VERSION = @as(c_int, 1002);
const __ATOMIC_RELAXED = @as(c_int, 0);
const __ATOMIC_CONSUME = @as(c_int, 1);
const __ATOMIC_ACQUIRE = @as(c_int, 2);
const __ATOMIC_RELEASE = @as(c_int, 3);
const __ATOMIC_ACQ_REL = @as(c_int, 4);
const __ATOMIC_SEQ_CST = @as(c_int, 5);
const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
const __VERSION__ = "Clang 12.0.0 (https://github.com/llvm/llvm-project fa0971b87fb2c9d14d1bba2551e61f02f18f329b)";
const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
const __SEH__ = @as(c_int, 1);
const __OPTIMIZE__ = @as(c_int, 1);
const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
const __LITTLE_ENDIAN__ = @as(c_int, 1);
const __CHAR_BIT__ = @as(c_int, 8);
const __SCHAR_MAX__ = @as(c_int, 127);
const __SHRT_MAX__ = @as(c_int, 32767);
const __INT_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
const __LONG_MAX__ = @as(c_long, 2147483647);
const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
const __WCHAR_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
const __WINT_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
const __INTMAX_MAX__ = @as(c_longlong, 9223372036854775807);
const __SIZE_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __UINTMAX_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __PTRDIFF_MAX__ = @as(c_longlong, 9223372036854775807);
const __INTPTR_MAX__ = @as(c_longlong, 9223372036854775807);
const __UINTPTR_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __SIZEOF_DOUBLE__ = @as(c_int, 8);
const __SIZEOF_FLOAT__ = @as(c_int, 4);
const __SIZEOF_INT__ = @as(c_int, 4);
const __SIZEOF_LONG__ = @as(c_int, 4);
const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
const __SIZEOF_POINTER__ = @as(c_int, 8);
const __SIZEOF_SHORT__ = @as(c_int, 2);
const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
const __SIZEOF_SIZE_T__ = @as(c_int, 8);
const __SIZEOF_WCHAR_T__ = @as(c_int, 2);
const __SIZEOF_WINT_T__ = @as(c_int, 2);
const __SIZEOF_INT128__ = @as(c_int, 16);
const __INTMAX_FMTd__ = "lld";
const __INTMAX_FMTi__ = "lli";
const __INTMAX_C_SUFFIX__ = LL;
const __UINTMAX_FMTo__ = "llo";
const __UINTMAX_FMTu__ = "llu";
const __UINTMAX_FMTx__ = "llx";
const __UINTMAX_FMTX__ = "llX";
const __UINTMAX_C_SUFFIX__ = ULL;
const __INTMAX_WIDTH__ = @as(c_int, 64);
const __PTRDIFF_FMTd__ = "lld";
const __PTRDIFF_FMTi__ = "lli";
const __PTRDIFF_WIDTH__ = @as(c_int, 64);
const __INTPTR_FMTd__ = "lld";
const __INTPTR_FMTi__ = "lli";
const __INTPTR_WIDTH__ = @as(c_int, 64);
const __SIZE_FMTo__ = "llo";
const __SIZE_FMTu__ = "llu";
const __SIZE_FMTx__ = "llx";
const __SIZE_FMTX__ = "llX";
const __SIZE_WIDTH__ = @as(c_int, 64);
const __WCHAR_TYPE__ = c_ushort;
const __WCHAR_WIDTH__ = @as(c_int, 16);
const __WINT_TYPE__ = c_ushort;
const __WINT_WIDTH__ = @as(c_int, 16);
const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
const __SIG_ATOMIC_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
const __CHAR16_TYPE__ = c_ushort;
const __CHAR32_TYPE__ = c_uint;
const __UINTMAX_WIDTH__ = @as(c_int, 64);
const __UINTPTR_FMTo__ = "llo";
const __UINTPTR_FMTu__ = "llu";
const __UINTPTR_FMTx__ = "llx";
const __UINTPTR_FMTX__ = "llX";
const __UINTPTR_WIDTH__ = @as(c_int, 64);
const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
const __FLT_HAS_DENORM__ = @as(c_int, 1);
const __FLT_DIG__ = @as(c_int, 6);
const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
const __FLT_HAS_INFINITY__ = @as(c_int, 1);
const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
const __FLT_MANT_DIG__ = @as(c_int, 24);
const __FLT_MAX_10_EXP__ = @as(c_int, 38);
const __FLT_MAX_EXP__ = @as(c_int, 128);
const __FLT_MAX__ = @as(f32, 3.40282347e+38);
const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
const __FLT_MIN_EXP__ = -@as(c_int, 125);
const __FLT_MIN__ = @as(f32, 1.17549435e-38);
const __DBL_DENORM_MIN__ = 4.9406564584124654e-324;
const __DBL_HAS_DENORM__ = @as(c_int, 1);
const __DBL_DIG__ = @as(c_int, 15);
const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
const __DBL_EPSILON__ = 2.2204460492503131e-16;
const __DBL_HAS_INFINITY__ = @as(c_int, 1);
const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
const __DBL_MANT_DIG__ = @as(c_int, 53);
const __DBL_MAX_10_EXP__ = @as(c_int, 308);
const __DBL_MAX_EXP__ = @as(c_int, 1024);
const __DBL_MAX__ = 1.7976931348623157e+308;
const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
const __DBL_MIN_EXP__ = -@as(c_int, 1021);
const __DBL_MIN__ = 2.2250738585072014e-308;
const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
const __LDBL_HAS_DENORM__ = @as(c_int, 1);
const __LDBL_DIG__ = @as(c_int, 18);
const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
const __LDBL_MANT_DIG__ = @as(c_int, 64);
const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
const __LDBL_MAX_EXP__ = @as(c_int, 16384);
const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
const __POINTER_WIDTH__ = @as(c_int, 64);
const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
const __WCHAR_UNSIGNED__ = @as(c_int, 1);
const __WINT_UNSIGNED__ = @as(c_int, 1);
const __INT8_TYPE__ = i8;
const __INT8_FMTd__ = "hhd";
const __INT8_FMTi__ = "hhi";
const __INT16_TYPE__ = c_short;
const __INT16_FMTd__ = "hd";
const __INT16_FMTi__ = "hi";
const __INT32_TYPE__ = c_int;
const __INT32_FMTd__ = "d";
const __INT32_FMTi__ = "i";
const __INT64_FMTd__ = "lld";
const __INT64_FMTi__ = "lli";
const __INT64_C_SUFFIX__ = LL;
const __UINT8_TYPE__ = u8;
const __UINT8_FMTo__ = "hho";
const __UINT8_FMTu__ = "hhu";
const __UINT8_FMTx__ = "hhx";
const __UINT8_FMTX__ = "hhX";
const __UINT8_MAX__ = @as(c_int, 255);
const __INT8_MAX__ = @as(c_int, 127);
const __UINT16_TYPE__ = c_ushort;
const __UINT16_FMTo__ = "ho";
const __UINT16_FMTu__ = "hu";
const __UINT16_FMTx__ = "hx";
const __UINT16_FMTX__ = "hX";
const __UINT16_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
const __INT16_MAX__ = @as(c_int, 32767);
const __UINT32_TYPE__ = c_uint;
const __UINT32_FMTo__ = "o";
const __UINT32_FMTu__ = "u";
const __UINT32_FMTx__ = "x";
const __UINT32_FMTX__ = "X";
const __UINT32_C_SUFFIX__ = U;
const __UINT32_MAX__ = @import("std").meta.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __INT32_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
const __UINT64_FMTo__ = "llo";
const __UINT64_FMTu__ = "llu";
const __UINT64_FMTx__ = "llx";
const __UINT64_FMTX__ = "llX";
const __UINT64_C_SUFFIX__ = ULL;
const __UINT64_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __INT64_MAX__ = @as(c_longlong, 9223372036854775807);
const __INT_LEAST8_TYPE__ = i8;
const __INT_LEAST8_MAX__ = @as(c_int, 127);
const __INT_LEAST8_FMTd__ = "hhd";
const __INT_LEAST8_FMTi__ = "hhi";
const __UINT_LEAST8_TYPE__ = u8;
const __UINT_LEAST8_MAX__ = @as(c_int, 255);
const __UINT_LEAST8_FMTo__ = "hho";
const __UINT_LEAST8_FMTu__ = "hhu";
const __UINT_LEAST8_FMTx__ = "hhx";
const __UINT_LEAST8_FMTX__ = "hhX";
const __INT_LEAST16_TYPE__ = c_short;
const __INT_LEAST16_MAX__ = @as(c_int, 32767);
const __INT_LEAST16_FMTd__ = "hd";
const __INT_LEAST16_FMTi__ = "hi";
const __UINT_LEAST16_TYPE__ = c_ushort;
const __UINT_LEAST16_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
const __UINT_LEAST16_FMTo__ = "ho";
const __UINT_LEAST16_FMTu__ = "hu";
const __UINT_LEAST16_FMTx__ = "hx";
const __UINT_LEAST16_FMTX__ = "hX";
const __INT_LEAST32_TYPE__ = c_int;
const __INT_LEAST32_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
const __INT_LEAST32_FMTd__ = "d";
const __INT_LEAST32_FMTi__ = "i";
const __UINT_LEAST32_TYPE__ = c_uint;
const __UINT_LEAST32_MAX__ = @import("std").meta.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __UINT_LEAST32_FMTo__ = "o";
const __UINT_LEAST32_FMTu__ = "u";
const __UINT_LEAST32_FMTx__ = "x";
const __UINT_LEAST32_FMTX__ = "X";
const __INT_LEAST64_MAX__ = @as(c_longlong, 9223372036854775807);
const __INT_LEAST64_FMTd__ = "lld";
const __INT_LEAST64_FMTi__ = "lli";
const __UINT_LEAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __UINT_LEAST64_FMTo__ = "llo";
const __UINT_LEAST64_FMTu__ = "llu";
const __UINT_LEAST64_FMTx__ = "llx";
const __UINT_LEAST64_FMTX__ = "llX";
const __INT_FAST8_TYPE__ = i8;
const __INT_FAST8_MAX__ = @as(c_int, 127);
const __INT_FAST8_FMTd__ = "hhd";
const __INT_FAST8_FMTi__ = "hhi";
const __UINT_FAST8_TYPE__ = u8;
const __UINT_FAST8_MAX__ = @as(c_int, 255);
const __UINT_FAST8_FMTo__ = "hho";
const __UINT_FAST8_FMTu__ = "hhu";
const __UINT_FAST8_FMTx__ = "hhx";
const __UINT_FAST8_FMTX__ = "hhX";
const __INT_FAST16_TYPE__ = c_short;
const __INT_FAST16_MAX__ = @as(c_int, 32767);
const __INT_FAST16_FMTd__ = "hd";
const __INT_FAST16_FMTi__ = "hi";
const __UINT_FAST16_TYPE__ = c_ushort;
const __UINT_FAST16_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
const __UINT_FAST16_FMTo__ = "ho";
const __UINT_FAST16_FMTu__ = "hu";
const __UINT_FAST16_FMTx__ = "hx";
const __UINT_FAST16_FMTX__ = "hX";
const __INT_FAST32_TYPE__ = c_int;
const __INT_FAST32_MAX__ = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
const __INT_FAST32_FMTd__ = "d";
const __INT_FAST32_FMTi__ = "i";
const __UINT_FAST32_TYPE__ = c_uint;
const __UINT_FAST32_MAX__ = @import("std").meta.promoteIntLiteral(c_uint, 4294967295, .decimal);
const __UINT_FAST32_FMTo__ = "o";
const __UINT_FAST32_FMTu__ = "u";
const __UINT_FAST32_FMTx__ = "x";
const __UINT_FAST32_FMTX__ = "X";
const __INT_FAST64_MAX__ = @as(c_longlong, 9223372036854775807);
const __INT_FAST64_FMTd__ = "lld";
const __INT_FAST64_FMTi__ = "lli";
const __UINT_FAST64_MAX__ = @as(c_ulonglong, 18446744073709551615);
const __UINT_FAST64_FMTo__ = "llo";
const __UINT_FAST64_FMTu__ = "llu";
const __UINT_FAST64_FMTx__ = "llx";
const __UINT_FAST64_FMTX__ = "llX";
const __FINITE_MATH_ONLY__ = @as(c_int, 0);
const __GNUC_STDC_INLINE__ = @as(c_int, 1);
const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
const __PIC__ = @as(c_int, 2);
const __pic__ = @as(c_int, 2);
const __FLT_EVAL_METHOD__ = @as(c_int, 0);
const __FLT_RADIX__ = @as(c_int, 2);
const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
const __SSP_STRONG__ = @as(c_int, 2);
const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
const __code_model_small__ = @as(c_int, 1);
const __amd64__ = @as(c_int, 1);
const __amd64 = @as(c_int, 1);
const __x86_64 = @as(c_int, 1);
const __x86_64__ = @as(c_int, 1);
const __SEG_GS = @as(c_int, 1);
const __SEG_FS = @as(c_int, 1);
const __seg_gs = __attribute__(address_space(@as(c_int, 256)));
const __seg_fs = __attribute__(address_space(@as(c_int, 257)));
const __corei7 = @as(c_int, 1);
const __corei7__ = @as(c_int, 1);
const __tune_corei7__ = @as(c_int, 1);
const __NO_MATH_INLINES = @as(c_int, 1);
const __AES__ = @as(c_int, 1);
const __PCLMUL__ = @as(c_int, 1);
const __LAHF_SAHF__ = @as(c_int, 1);
const __LZCNT__ = @as(c_int, 1);
const __RDRND__ = @as(c_int, 1);
const __FSGSBASE__ = @as(c_int, 1);
const __BMI__ = @as(c_int, 1);
const __BMI2__ = @as(c_int, 1);
const __POPCNT__ = @as(c_int, 1);
const __RTM__ = @as(c_int, 1);
const __PRFCHW__ = @as(c_int, 1);
const __RDSEED__ = @as(c_int, 1);
const __ADX__ = @as(c_int, 1);
const __MOVBE__ = @as(c_int, 1);
const __FMA__ = @as(c_int, 1);
const __F16C__ = @as(c_int, 1);
const __FXSR__ = @as(c_int, 1);
const __XSAVE__ = @as(c_int, 1);
const __XSAVEOPT__ = @as(c_int, 1);
const __XSAVEC__ = @as(c_int, 1);
const __XSAVES__ = @as(c_int, 1);
const __CLFLUSHOPT__ = @as(c_int, 1);
const __INVPCID__ = @as(c_int, 1);
const __AVX2__ = @as(c_int, 1);
const __AVX__ = @as(c_int, 1);
const __SSE4_2__ = @as(c_int, 1);
const __SSE4_1__ = @as(c_int, 1);
const __SSSE3__ = @as(c_int, 1);
const __SSE3__ = @as(c_int, 1);
const __SSE2__ = @as(c_int, 1);
const __SSE2_MATH__ = @as(c_int, 1);
const __SSE__ = @as(c_int, 1);
const __SSE_MATH__ = @as(c_int, 1);
const __MMX__ = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
const __SIZEOF_FLOAT128__ = @as(c_int, 16);
const _WIN32 = @as(c_int, 1);
const _WIN64 = @as(c_int, 1);
const WIN32 = @as(c_int, 1);
const __WIN32 = @as(c_int, 1);
const __WIN32__ = @as(c_int, 1);
const WINNT = @as(c_int, 1);
const __WINNT = @as(c_int, 1);
const __WINNT__ = @as(c_int, 1);
const WIN64 = @as(c_int, 1);
const __WIN64 = @as(c_int, 1);
const __WIN64__ = @as(c_int, 1);
const __MINGW64__ = @as(c_int, 1);
const __MSVCRT__ = @as(c_int, 1);
const __MINGW32__ = @as(c_int, 1);
fn __declspec(a: anytype) callconv(.Inline) @TypeOf(__attribute__(a)) {
    return __attribute__(a);
}
const _cdecl = __attribute__(__cdecl__);
const __cdecl = __attribute__(__cdecl__);
const _stdcall = __attribute__(__stdcall__);
const __stdcall = __attribute__(__stdcall__);
const _fastcall = __attribute__(__fastcall__);
const __fastcall = __attribute__(__fastcall__);
const _thiscall = __attribute__(__thiscall__);
const __thiscall = __attribute__(__thiscall__);
const _pascal = __attribute__(__pascal__);
const __pascal = __attribute__(__pascal__);
const __STDC__ = @as(c_int, 1);
const __STDC_HOSTED__ = @as(c_int, 1);
const __STDC_VERSION__ = @as(c_long, 201710);
const __STDC_UTF_16__ = @as(c_int, 1);
const __STDC_UTF_32__ = @as(c_int, 1);
const _LIBCPP_DISABLE_VISIBILITY_ANNOTATIONS = @as(c_int, 1);
const _LIBCXXABI_DISABLE_VISIBILITY_ANNOTATIONS = @as(c_int, 1);
const _LIBCPP_HAS_NO_VENDOR_AVAILABILITY_ANNOTATIONS = @as(c_int, 1);
const _DEBUG = @as(c_int, 1);
const CIMGUI_DEFINE_ENUMS_AND_STRUCTS = @as(c_int, 1);
fn __MINGW64_STRINGIFY(x: anytype) callconv(.Inline) @TypeOf(__STRINGIFY(x)) {
    return __STRINGIFY(x);
}
const __MINGW64_VERSION_MAJOR = @as(c_int, 8);
const __MINGW64_VERSION_MINOR = @as(c_int, 0);
const __MINGW64_VERSION_BUGFIX = @as(c_int, 0);
const __MINGW64_VERSION_RC = @as(c_int, 0);
const __MINGW64_VERSION_STATE = "alpha";
const __MINGW32_MAJOR_VERSION = @as(c_int, 3);
const __MINGW32_MINOR_VERSION = @as(c_int, 11);
const _M_AMD64 = @as(c_int, 100);
const _M_X64 = @as(c_int, 100);
const _ = @as(c_int, 1);
const __MINGW_USE_UNDERSCORE_PREFIX = @as(c_int, 0);
fn __MINGW_USYMBOL(sym: anytype) callconv(.Inline) @TypeOf(sym) {
    return sym;
}
fn __MINGW_ASM_CALL(func: anytype) callconv(.Inline) @TypeOf(__asm__(__MINGW64_STRINGIFY(__MINGW_USYMBOL(func)))) {
    return __asm__(__MINGW64_STRINGIFY(__MINGW_USYMBOL(func)));
}
fn __MINGW_ASM_CRT_CALL(func: anytype) callconv(.Inline) @TypeOf(__asm__(__STRINGIFY(func))) {
    return __asm__(__STRINGIFY(func));
}
const __MINGW_EXTENSION = __extension__;
const __C89_NAMELESS = __MINGW_EXTENSION;
const __GNU_EXTENSION = __MINGW_EXTENSION;
const __MINGW_HAVE_ANSI_C99_PRINTF = @as(c_int, 1);
const __MINGW_HAVE_WIDE_C99_PRINTF = @as(c_int, 1);
const __MINGW_HAVE_ANSI_C99_SCANF = @as(c_int, 1);
const __MINGW_HAVE_WIDE_C99_SCANF = @as(c_int, 1);
const __MINGW_GCC_VERSION = ((__GNUC__ * @as(c_int, 10000)) + (__GNUC_MINOR__ * @as(c_int, 100))) + __GNUC_PATCHLEVEL__;
fn __MINGW_GNUC_PREREQ(major: anytype, minor: anytype) callconv(.Inline) @TypeOf((__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor))) {
    return (__GNUC__ > major) or ((__GNUC__ == major) and (__GNUC_MINOR__ >= minor));
}
fn __MINGW_MSC_PREREQ(major: anytype, minor: anytype) callconv(.Inline) @TypeOf(@as(c_int, 0)) {
    return @as(c_int, 0);
}
const __MINGW_SEC_WARN_STR = "This function or variable may be unsafe, use _CRT_SECURE_NO_WARNINGS to disable deprecation";
const __MINGW_MSVC2005_DEPREC_STR = "This POSIX function is deprecated beginning in Visual C++ 2005, use _CRT_NONSTDC_NO_DEPRECATE to disable deprecation";
const __MINGW_ATTRIB_DEPRECATED_MSVC2005 = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_MSVC2005_DEPREC_STR);
const __MINGW_ATTRIB_DEPRECATED_SEC_WARN = __MINGW_ATTRIB_DEPRECATED_STR(__MINGW_SEC_WARN_STR);
fn __MINGW_MS_PRINTF(__format: anytype, __args: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(ms_printf, __format, __args))) {
    return __attribute__(__format__(ms_printf, __format, __args));
}
fn __MINGW_MS_SCANF(__format: anytype, __args: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(ms_scanf, __format, __args))) {
    return __attribute__(__format__(ms_scanf, __format, __args));
}
fn __MINGW_GNU_PRINTF(__format: anytype, __args: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(gnu_printf, __format, __args))) {
    return __attribute__(__format__(gnu_printf, __format, __args));
}
fn __MINGW_GNU_SCANF(__format: anytype, __args: anytype) callconv(.Inline) @TypeOf(__attribute__(__format__(gnu_scanf, __format, __args))) {
    return __attribute__(__format__(gnu_scanf, __format, __args));
}
const __mingw_static_ovr = __mingw_ovr;
const __MINGW_FORTIFY_LEVEL = @as(c_int, 0);
const __mingw_bos_ovr = __mingw_ovr;
const __MINGW_FORTIFY_VA_ARG = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_SECURE_NAMES_MEMORY = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_COUNT = @as(c_int, 0);
const _CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES_MEMORY = @as(c_int, 0);
const __LONG32 = c_long;
const __USE_CRTIMP = @as(c_int, 1);
const _CRTIMP = __attribute__(__dllimport__);
const USE___UUIDOF = @as(c_int, 0);
const _inline = __inline;
fn __UNUSED_PARAM(x: anytype) callconv(.Inline) @TypeOf(x ++ __attribute__(__unused__)) {
    return x ++ __attribute__(__unused__);
}
const __restrict_arr = __restrict;
const __MINGW_ATTRIB_NORETURN = __attribute__(__noreturn__);
const __MINGW_ATTRIB_CONST = __attribute__(__const__);
const __MINGW_ATTRIB_MALLOC = __attribute__(__malloc__);
const __MINGW_ATTRIB_PURE = __attribute__(__pure__);
fn __MINGW_ATTRIB_NONNULL(arg: anytype) callconv(.Inline) @TypeOf(__attribute__(__nonnull__(arg))) {
    return __attribute__(__nonnull__(arg));
}
const __MINGW_ATTRIB_UNUSED = __attribute__(__unused__);
const __MINGW_ATTRIB_USED = __attribute__(__used__);
const __MINGW_ATTRIB_DEPRECATED = __attribute__(__deprecated__);
fn __MINGW_ATTRIB_DEPRECATED_MSG(x: anytype) callconv(.Inline) @TypeOf(__attribute__(__deprecated__(x))) {
    return __attribute__(__deprecated__(x));
}
const __MINGW_NOTHROW = __attribute__(__nothrow__);
const __MSVCRT_VERSION__ = @as(c_int, 0x700);
const _WIN32_WINNT = @as(c_int, 0x0603);
const __int8 = u8;
const __int16 = c_short;
const __int32 = c_int;
const MINGW_HAS_SECURE_API = @as(c_int, 1);
const __STDC_SECURE_LIB__ = @as(c_long, 200411);
const __GOT_SECURE_LIB__ = __STDC_SECURE_LIB__;
const _CRT_PACKING = @as(c_int, 8);
fn _ADDRESSOF(v: anytype) callconv(.Inline) @TypeOf(&v) {
    return &v;
}
fn _CRT_STRINGIZE(_Value: anytype) callconv(.Inline) @TypeOf(__CRT_STRINGIZE(_Value)) {
    return __CRT_STRINGIZE(_Value);
}
fn _CRT_WIDE(_String: anytype) callconv(.Inline) @TypeOf(__CRT_WIDE(_String)) {
    return __CRT_WIDE(_String);
}
const _CRTIMP_NOIA64 = _CRTIMP;
const _CRTIMP2 = _CRTIMP;
const _CRTIMP_ALTERNATIVE = _CRTIMP;
const _MRTIMP2 = _CRTIMP;
const _MCRTIMP = _CRTIMP;
const _CRTIMP_PURE = _CRTIMP;
const _SECURECRT_FILL_BUFFER_PATTERN = @as(c_int, 0xFD);
fn _CRT_DEPRECATE_TEXT(_Text: anytype) callconv(.Inline) @TypeOf(__declspec(deprecated)) {
    return __declspec(deprecated);
}
const UNALIGNED = __unaligned;
fn _CRT_ALIGN(x: anytype) callconv(.Inline) @TypeOf(__attribute__(__aligned__(x))) {
    return __attribute__(__aligned__(x));
}
const __CRTDECL = __cdecl;
const _ARGMAX = @as(c_int, 100);
const _TRUNCATE = usize - @as(c_int, 1);
fn _CRT_UNUSED(x: anytype) callconv(.Inline) c_void {
    return @import("std").meta.cast(c_void, x);
}
const __USE_MINGW_ANSI_STDIO = @as(c_int, 1);
const _CRT_glob = _dowildcard;
const _ANONYMOUS_UNION = __MINGW_EXTENSION;
const _ANONYMOUS_STRUCT = __MINGW_EXTENSION;
const __MINGW_DEBUGBREAK_IMPL = !(__has_builtin(__debugbreak) != 0);
const _CRT_SECURE_CPP_NOTHROW = throw();
const _CRT_INTERNAL_PRINTF_LEGACY_VSPRINTF_NULL_TERMINATION = @as(c_ulonglong, 0x0001);
const _CRT_INTERNAL_PRINTF_STANDARD_SNPRINTF_BEHAVIOR = @as(c_ulonglong, 0x0002);
const _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0004);
const _CRT_INTERNAL_PRINTF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0008);
const _CRT_INTERNAL_PRINTF_LEGACY_THREE_DIGIT_EXPONENTS = @as(c_ulonglong, 0x0010);
const _CRT_INTERNAL_SCANF_SECURECRT = @as(c_ulonglong, 0x0001);
const _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS = @as(c_ulonglong, 0x0002);
const _CRT_INTERNAL_SCANF_LEGACY_MSVCRT_COMPATIBILITY = @as(c_ulonglong, 0x0004);
const _CRT_INTERNAL_LOCAL_PRINTF_OPTIONS = _CRT_INTERNAL_PRINTF_LEGACY_WIDE_SPECIFIERS;
const _CRT_INTERNAL_LOCAL_SCANF_OPTIONS = _CRT_INTERNAL_SCANF_LEGACY_WIDE_SPECIFIERS;
const BUFSIZ = @as(c_int, 512);
const _NFILE = _NSTREAM_;
const _NSTREAM_ = @as(c_int, 512);
const _IOB_ENTRIES = @as(c_int, 20);
const EOF = -@as(c_int, 1);
const _P_tmpdir = "\\";
const _wP_tmpdir = "\\";
const L_tmpnam = @import("std").meta.sizeof(_P_tmpdir) + @as(c_int, 12);
const SEEK_CUR = @as(c_int, 1);
const SEEK_END = @as(c_int, 2);
const SEEK_SET = @as(c_int, 0);
const STDIN_FILENO = @as(c_int, 0);
const STDOUT_FILENO = @as(c_int, 1);
const STDERR_FILENO = @as(c_int, 2);
const FILENAME_MAX = @as(c_int, 260);
const FOPEN_MAX = @as(c_int, 20);
const _SYS_OPEN = @as(c_int, 20);
const TMP_MAX = @as(c_int, 32767);
const NULL = @import("std").meta.cast(?*c_void, @as(c_int, 0));
const _iob = __iob_func();
fn _FPOSOFF(fp: anytype) callconv(.Inline) c_long {
    return @import("std").meta.cast(c_long, fp);
}
const stdin = __acrt_iob_func(@as(c_int, 0));
const stdout = __acrt_iob_func(@as(c_int, 1));
const stderr = __acrt_iob_func(@as(c_int, 2));
const _IOREAD = @as(c_int, 0x0001);
const _IOWRT = @as(c_int, 0x0002);
const _IOFBF = @as(c_int, 0x0000);
const _IOLBF = @as(c_int, 0x0040);
const _IONBF = @as(c_int, 0x0004);
const _IOMYBUF = @as(c_int, 0x0008);
const _IOEOF = @as(c_int, 0x0010);
const _IOERR = @as(c_int, 0x0020);
const _IOSTRG = @as(c_int, 0x0040);
const _IORW = @as(c_int, 0x0080);
const _TWO_DIGIT_EXPONENT = @as(c_int, 0x1);
const __MINGW_PRINTF_FORMAT = printf;
const __MINGW_SCANF_FORMAT = scanf;
const __builtin_vsnprintf = __mingw_vsnprintf;
const __builtin_vsprintf = __mingw_vsprintf;
const popen = _popen;
const pclose = _pclose;
const WEOF = @import("std").meta.cast(wint_t, @import("std").meta.promoteIntLiteral(c_int, 0xFFFF, .hexadecimal));
const wpopen = _wpopen;
fn _putwc_nolock(_c: anytype, _stm: anytype) callconv(.Inline) @TypeOf(_fputwc_nolock(_c, _stm)) {
    return _fputwc_nolock(_c, _stm);
}
fn _getwc_nolock(_c: anytype) callconv(.Inline) @TypeOf(_fgetwc_nolock(_c)) {
    return _fgetwc_nolock(_c);
}
fn _getc_nolock(_stream: anytype) callconv(.Inline) @TypeOf(_fgetc_nolock(_stream)) {
    return _fgetc_nolock(_stream);
}
fn _putc_nolock(_c: anytype, _stream: anytype) callconv(.Inline) @TypeOf(_fputc_nolock(_c, _stream)) {
    return _fputc_nolock(_c, _stream);
}
fn _getchar_nolock() callconv(.Inline) @TypeOf(_getc_nolock(stdin)) {
    return _getc_nolock(stdin);
}
fn _putchar_nolock(_c: anytype) callconv(.Inline) @TypeOf(_putc_nolock(_c, stdout)) {
    return _putc_nolock(_c, stdout);
}
fn _getwchar_nolock() callconv(.Inline) @TypeOf(_getwc_nolock(stdin)) {
    return _getwc_nolock(stdin);
}
fn _putwchar_nolock(_c: anytype) callconv(.Inline) @TypeOf(_putwc_nolock(_c, stdout)) {
    return _putwc_nolock(_c, stdout);
}
const P_tmpdir = _P_tmpdir;
const SYS_OPEN = _SYS_OPEN;
const _P_WAIT = @as(c_int, 0);
const _P_NOWAIT = @as(c_int, 1);
const _OLD_P_OVERLAY = @as(c_int, 2);
const _P_NOWAITO = @as(c_int, 3);
const _P_DETACH = @as(c_int, 4);
const _P_OVERLAY = @as(c_int, 2);
const _WAIT_CHILD = @as(c_int, 0);
const _WAIT_GRANDCHILD = @as(c_int, 1);
const _SECIMP = __declspec(dllimport);
const L_tmpnam_s = L_tmpnam;
const TMP_MAX_S = TMP_MAX;
const INT8_MIN = -@as(c_int, 128);
const INT16_MIN = -@import("std").meta.promoteIntLiteral(c_int, 32768, .decimal);
const INT32_MIN = -@import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal) - @as(c_int, 1);
const INT64_MIN = -@as(c_longlong, 9223372036854775807) - @as(c_int, 1);
const INT8_MAX = @as(c_int, 127);
const INT16_MAX = @as(c_int, 32767);
const INT32_MAX = @import("std").meta.promoteIntLiteral(c_int, 2147483647, .decimal);
const INT64_MAX = @as(c_longlong, 9223372036854775807);
const UINT8_MAX = @as(c_int, 255);
const UINT16_MAX = @import("std").meta.promoteIntLiteral(c_int, 65535, .decimal);
const UINT32_MAX = @import("std").meta.promoteIntLiteral(c_uint, 0xffffffff, .hexadecimal);
const UINT64_MAX = @as(c_ulonglong, 0xffffffffffffffff);
const INT_LEAST8_MIN = INT8_MIN;
const INT_LEAST16_MIN = INT16_MIN;
const INT_LEAST32_MIN = INT32_MIN;
const INT_LEAST64_MIN = INT64_MIN;
const INT_LEAST8_MAX = INT8_MAX;
const INT_LEAST16_MAX = INT16_MAX;
const INT_LEAST32_MAX = INT32_MAX;
const INT_LEAST64_MAX = INT64_MAX;
const UINT_LEAST8_MAX = UINT8_MAX;
const UINT_LEAST16_MAX = UINT16_MAX;
const UINT_LEAST32_MAX = UINT32_MAX;
const UINT_LEAST64_MAX = UINT64_MAX;
const INT_FAST8_MIN = INT8_MIN;
const INT_FAST16_MIN = INT16_MIN;
const INT_FAST32_MIN = INT32_MIN;
const INT_FAST64_MIN = INT64_MIN;
const INT_FAST8_MAX = INT8_MAX;
const INT_FAST16_MAX = INT16_MAX;
const INT_FAST32_MAX = INT32_MAX;
const INT_FAST64_MAX = INT64_MAX;
const UINT_FAST8_MAX = UINT8_MAX;
const UINT_FAST16_MAX = UINT16_MAX;
const UINT_FAST32_MAX = UINT32_MAX;
const UINT_FAST64_MAX = UINT64_MAX;
const INTPTR_MIN = INT64_MIN;
const INTPTR_MAX = INT64_MAX;
const UINTPTR_MAX = UINT64_MAX;
const INTMAX_MIN = INT64_MIN;
const INTMAX_MAX = INT64_MAX;
const UINTMAX_MAX = UINT64_MAX;
const PTRDIFF_MIN = INT64_MIN;
const PTRDIFF_MAX = INT64_MAX;
const SIG_ATOMIC_MIN = INT32_MIN;
const SIG_ATOMIC_MAX = INT32_MAX;
const SIZE_MAX = UINT64_MAX;
const WCHAR_MIN = @as(c_uint, 0);
const WCHAR_MAX = @as(c_uint, 0xffff);
const WINT_MIN = @as(c_uint, 0);
const WINT_MAX = @as(c_uint, 0xffff);
fn INT8_C(val: anytype) callconv(.Inline) @TypeOf((INT_LEAST8_MAX - INT_LEAST8_MAX) + val) {
    return (INT_LEAST8_MAX - INT_LEAST8_MAX) + val;
}
fn INT16_C(val: anytype) callconv(.Inline) @TypeOf((INT_LEAST16_MAX - INT_LEAST16_MAX) + val) {
    return (INT_LEAST16_MAX - INT_LEAST16_MAX) + val;
}
fn INT32_C(val: anytype) callconv(.Inline) @TypeOf((INT_LEAST32_MAX - INT_LEAST32_MAX) + val) {
    return (INT_LEAST32_MAX - INT_LEAST32_MAX) + val;
}
fn UINT8_C(val: anytype) callconv(.Inline) @TypeOf(val) {
    return val;
}
fn UINT16_C(val: anytype) callconv(.Inline) @TypeOf(val) {
    return val;
}
const API = __declspec(dllexport);
const bool_4 = bool;
const true_5 = @as(c_int, 1);
const false_6 = @as(c_int, 0);
const __bool_true_false_are_defined = @as(c_int, 1);
const CIMGUI_API = EXTERN ++ API;
const tagLC_ID = struct_tagLC_ID;
const lconv = struct_lconv;
const __lc_time_data = struct___lc_time_data;
const threadlocaleinfostruct = struct_threadlocaleinfostruct;
const threadmbcinfostruct = struct_threadmbcinfostruct;
const localeinfo_struct = struct_localeinfo_struct;
const _iobuf = struct__iobuf;