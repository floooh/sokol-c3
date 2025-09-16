// machine generated, do not edit

module sokol::sapp;
import sokol;

extern fn bool isvalid() @extern("sapp_isvalid");
extern fn CInt width() @extern("sapp_width");
extern fn float widthf() @extern("sapp_widthf");
extern fn CInt height() @extern("sapp_height");
extern fn float heightf() @extern("sapp_heightf");
extern fn CInt color_format() @extern("sapp_color_format");
extern fn CInt depth_format() @extern("sapp_depth_format");
extern fn CInt sample_count() @extern("sapp_sample_count");
extern fn bool high_dpi() @extern("sapp_high_dpi");
extern fn float dpi_scale() @extern("sapp_dpi_scale");
extern fn void show_keyboard(bool show) @extern("sapp_show_keyboard");
extern fn bool keyboard_shown() @extern("sapp_keyboard_shown");
extern fn bool is_fullscreen() @extern("sapp_is_fullscreen");
extern fn void toggle_fullscreen() @extern("sapp_toggle_fullscreen");
extern fn void show_mouse(bool show) @extern("sapp_show_mouse");
extern fn bool mouse_shown() @extern("sapp_mouse_shown");
extern fn void lock_mouse(bool lock) @extern("sapp_lock_mouse");
extern fn bool mouse_locked() @extern("sapp_mouse_locked");
extern fn void set_mouse_cursor(SappMouseCursor cursor) @extern("sapp_set_mouse_cursor");
extern fn SappMouseCursor get_mouse_cursor() @extern("sapp_get_mouse_cursor");
extern fn SappMouseCursor bind_mouse_cursor_image(SappMouseCursor cursor, SappImageDesc* desc) @extern("sapp_bind_mouse_cursor_image");
extern fn void unbind_mouse_cursor_image(SappMouseCursor cursor) @extern("sapp_unbind_mouse_cursor_image");
extern fn void* userdata() @extern("sapp_userdata");
extern fn SappDesc query_desc() @extern("sapp_query_desc");
extern fn void request_quit() @extern("sapp_request_quit");
extern fn void cancel_quit() @extern("sapp_cancel_quit");
extern fn void quit() @extern("sapp_quit");
extern fn void consume_event() @extern("sapp_consume_event");
extern fn ulong frame_count() @extern("sapp_frame_count");
extern fn double frame_duration() @extern("sapp_frame_duration");
extern fn void set_clipboard_string(ZString str) @extern("sapp_set_clipboard_string");
extern fn ZString get_clipboard_string() @extern("sapp_get_clipboard_string");
extern fn void set_window_title(ZString str) @extern("sapp_set_window_title");
extern fn void set_icon(SappIconDesc* icon_desc) @extern("sapp_set_icon");
extern fn CInt get_num_dropped_files() @extern("sapp_get_num_dropped_files");
extern fn ZString get_dropped_file_path(CInt index) @extern("sapp_get_dropped_file_path");
extern fn void run(SappDesc* desc) @extern("sapp_run");
extern fn void* egl_get_display() @extern("sapp_egl_get_display");
extern fn void* egl_get_context() @extern("sapp_egl_get_context");
extern fn void html5_ask_leave_site(bool ask) @extern("sapp_html5_ask_leave_site");
extern fn uint html5_get_dropped_file_size(CInt index) @extern("sapp_html5_get_dropped_file_size");
extern fn void html5_fetch_dropped_file(SappHtml5FetchRequest* request) @extern("sapp_html5_fetch_dropped_file");
extern fn void* metal_get_device() @extern("sapp_metal_get_device");
extern fn void* metal_get_current_drawable() @extern("sapp_metal_get_current_drawable");
extern fn void* metal_get_depth_stencil_texture() @extern("sapp_metal_get_depth_stencil_texture");
extern fn void* metal_get_msaa_color_texture() @extern("sapp_metal_get_msaa_color_texture");
extern fn void* macos_get_window() @extern("sapp_macos_get_window");
extern fn void* ios_get_window() @extern("sapp_ios_get_window");
extern fn void* d3d11_get_device() @extern("sapp_d3d11_get_device");
extern fn void* d3d11_get_device_context() @extern("sapp_d3d11_get_device_context");
extern fn void* d3d11_get_swap_chain() @extern("sapp_d3d11_get_swap_chain");
extern fn void* d3d11_get_render_view() @extern("sapp_d3d11_get_render_view");
extern fn void* d3d11_get_resolve_view() @extern("sapp_d3d11_get_resolve_view");
extern fn void* d3d11_get_depth_stencil_view() @extern("sapp_d3d11_get_depth_stencil_view");
extern fn void* win32_get_hwnd() @extern("sapp_win32_get_hwnd");
extern fn void* wgpu_get_device() @extern("sapp_wgpu_get_device");
extern fn void* wgpu_get_render_view() @extern("sapp_wgpu_get_render_view");
extern fn void* wgpu_get_resolve_view() @extern("sapp_wgpu_get_resolve_view");
extern fn void* wgpu_get_depth_stencil_view() @extern("sapp_wgpu_get_depth_stencil_view");
extern fn uint gl_get_framebuffer() @extern("sapp_gl_get_framebuffer");
extern fn CInt gl_get_major_version() @extern("sapp_gl_get_major_version");
extern fn CInt gl_get_minor_version() @extern("sapp_gl_get_minor_version");
extern fn bool gl_is_gles() @extern("sapp_gl_is_gles");
extern fn void* x11_get_window() @extern("sapp_x11_get_window");
extern fn void* x11_get_display() @extern("sapp_x11_get_display");
extern fn void* android_get_native_activity() @extern("sapp_android_get_native_activity");

const usz MAX_TOUCHPOINTS = 8;
const usz MAX_MOUSEBUTTONS = 3;
const usz MAX_KEYCODES = 512;
const usz MAX_ICONIMAGES = 8;

enum SappEventType : const uint
{
    INVALID = 0,
    KEY_DOWN = 1,
    KEY_UP = 2,
    CHAR = 3,
    MOUSE_DOWN = 4,
    MOUSE_UP = 5,
    MOUSE_SCROLL = 6,
    MOUSE_MOVE = 7,
    MOUSE_ENTER = 8,
    MOUSE_LEAVE = 9,
    TOUCHES_BEGAN = 10,
    TOUCHES_MOVED = 11,
    TOUCHES_ENDED = 12,
    TOUCHES_CANCELLED = 13,
    RESIZED = 14,
    ICONIFIED = 15,
    RESTORED = 16,
    FOCUSED = 17,
    UNFOCUSED = 18,
    SUSPENDED = 19,
    RESUMED = 20,
    QUIT_REQUESTED = 21,
    CLIPBOARD_PASTED = 22,
    FILES_DROPPED = 23,
    NUM = 24,
}

enum SappKeycode : const int
{
    INVALID = 0,
    SPACE = 32,
    APOSTROPHE = 39,
    COMMA = 44,
    MINUS = 45,
    PERIOD = 46,
    SLASH = 47,
    NUM_0 = 48,
    NUM_1 = 49,
    NUM_2 = 50,
    NUM_3 = 51,
    NUM_4 = 52,
    NUM_5 = 53,
    NUM_6 = 54,
    NUM_7 = 55,
    NUM_8 = 56,
    NUM_9 = 57,
    SEMICOLON = 59,
    EQUAL = 61,
    A = 65,
    B = 66,
    C = 67,
    D = 68,
    E = 69,
    F = 70,
    G = 71,
    H = 72,
    I = 73,
    J = 74,
    K = 75,
    L = 76,
    M = 77,
    N = 78,
    O = 79,
    P = 80,
    Q = 81,
    R = 82,
    S = 83,
    T = 84,
    U = 85,
    V = 86,
    W = 87,
    X = 88,
    Y = 89,
    Z = 90,
    LEFT_BRACKET = 91,
    BACKSLASH = 92,
    RIGHT_BRACKET = 93,
    GRAVE_ACCENT = 96,
    WORLD_1 = 161,
    WORLD_2 = 162,
    ESCAPE = 256,
    ENTER = 257,
    TAB = 258,
    BACKSPACE = 259,
    INSERT = 260,
    DELETE = 261,
    RIGHT = 262,
    LEFT = 263,
    DOWN = 264,
    UP = 265,
    PAGE_UP = 266,
    PAGE_DOWN = 267,
    HOME = 268,
    END = 269,
    CAPS_LOCK = 280,
    SCROLL_LOCK = 281,
    NUM_LOCK = 282,
    PRINT_SCREEN = 283,
    PAUSE = 284,
    F1 = 290,
    F2 = 291,
    F3 = 292,
    F4 = 293,
    F5 = 294,
    F6 = 295,
    F7 = 296,
    F8 = 297,
    F9 = 298,
    F10 = 299,
    F11 = 300,
    F12 = 301,
    F13 = 302,
    F14 = 303,
    F15 = 304,
    F16 = 305,
    F17 = 306,
    F18 = 307,
    F19 = 308,
    F20 = 309,
    F21 = 310,
    F22 = 311,
    F23 = 312,
    F24 = 313,
    F25 = 314,
    KP_0 = 320,
    KP_1 = 321,
    KP_2 = 322,
    KP_3 = 323,
    KP_4 = 324,
    KP_5 = 325,
    KP_6 = 326,
    KP_7 = 327,
    KP_8 = 328,
    KP_9 = 329,
    KP_DECIMAL = 330,
    KP_DIVIDE = 331,
    KP_MULTIPLY = 332,
    KP_SUBTRACT = 333,
    KP_ADD = 334,
    KP_ENTER = 335,
    KP_EQUAL = 336,
    LEFT_SHIFT = 340,
    LEFT_CONTROL = 341,
    LEFT_ALT = 342,
    LEFT_SUPER = 343,
    RIGHT_SHIFT = 344,
    RIGHT_CONTROL = 345,
    RIGHT_ALT = 346,
    RIGHT_SUPER = 347,
    MENU = 348,
}

enum SappAndroidTooltype : const int
{
    UNKNOWN = 0,
    FINGER = 1,
    STYLUS = 2,
    MOUSE = 3,
}

struct SappTouchpoint
{
    uptr identifier;
    float pos_x;
    float pos_y;
    SappAndroidTooltype android_tooltype;
    bool changed;
}

enum SappMousebutton : const int
{
    LEFT = 0,
    RIGHT = 1,
    MIDDLE = 2,
    INVALID = 256,
}

const uint MODIFIER_SHIFT = 1;
const uint MODIFIER_CTRL = 2;
const uint MODIFIER_ALT = 4;
const uint MODIFIER_SUPER = 8;
const uint MODIFIER_LMB = 256;
const uint MODIFIER_RMB = 512;
const uint MODIFIER_MMB = 1024;

struct SappEvent
{
    ulong frame_count;
    SappEventType type;
    SappKeycode key_code;
    uint char_code;
    bool key_repeat;
    uint modifiers;
    SappMousebutton mouse_button;
    float mouse_x;
    float mouse_y;
    float mouse_dx;
    float mouse_dy;
    float scroll_x;
    float scroll_y;
    CInt num_touches;
    SappTouchpoint[8] touches;
    CInt window_width;
    CInt window_height;
    CInt framebuffer_width;
    CInt framebuffer_height;
}

struct SappRange
{
    void* ptr;
    usz size;
}

struct SappImageDesc
{
    CInt width;
    CInt height;
    CInt cursor_hotspot_x;
    CInt cursor_hotspot_y;
    SappRange pixels;
}

struct SappIconDesc
{
    bool sokol_default;
    SappImageDesc[8] images;
}

struct SappAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

enum SappLogItem : const int
{
    OK = 0,
    MALLOC_FAILED = 1,
    MACOS_INVALID_NSOPENGL_PROFILE = 2,
    WIN32_LOAD_OPENGL32_DLL_FAILED = 3,
    WIN32_CREATE_HELPER_WINDOW_FAILED = 4,
    WIN32_HELPER_WINDOW_GETDC_FAILED = 5,
    WIN32_DUMMY_CONTEXT_SET_PIXELFORMAT_FAILED = 6,
    WIN32_CREATE_DUMMY_CONTEXT_FAILED = 7,
    WIN32_DUMMY_CONTEXT_MAKE_CURRENT_FAILED = 8,
    WIN32_GET_PIXELFORMAT_ATTRIB_FAILED = 9,
    WIN32_WGL_FIND_PIXELFORMAT_FAILED = 10,
    WIN32_WGL_DESCRIBE_PIXELFORMAT_FAILED = 11,
    WIN32_WGL_SET_PIXELFORMAT_FAILED = 12,
    WIN32_WGL_ARB_CREATE_CONTEXT_REQUIRED = 13,
    WIN32_WGL_ARB_CREATE_CONTEXT_PROFILE_REQUIRED = 14,
    WIN32_WGL_OPENGL_VERSION_NOT_SUPPORTED = 15,
    WIN32_WGL_OPENGL_PROFILE_NOT_SUPPORTED = 16,
    WIN32_WGL_INCOMPATIBLE_DEVICE_CONTEXT = 17,
    WIN32_WGL_CREATE_CONTEXT_ATTRIBS_FAILED_OTHER = 18,
    WIN32_D3D11_CREATE_DEVICE_AND_SWAPCHAIN_WITH_DEBUG_FAILED = 19,
    WIN32_D3D11_GET_IDXGIFACTORY_FAILED = 20,
    WIN32_D3D11_GET_IDXGIADAPTER_FAILED = 21,
    WIN32_D3D11_QUERY_INTERFACE_IDXGIDEVICE1_FAILED = 22,
    WIN32_REGISTER_RAW_INPUT_DEVICES_FAILED_MOUSE_LOCK = 23,
    WIN32_REGISTER_RAW_INPUT_DEVICES_FAILED_MOUSE_UNLOCK = 24,
    WIN32_GET_RAW_INPUT_DATA_FAILED = 25,
    WIN32_DESTROYICON_FOR_CURSOR_FAILED = 26,
    LINUX_GLX_LOAD_LIBGL_FAILED = 27,
    LINUX_GLX_LOAD_ENTRY_POINTS_FAILED = 28,
    LINUX_GLX_EXTENSION_NOT_FOUND = 29,
    LINUX_GLX_QUERY_VERSION_FAILED = 30,
    LINUX_GLX_VERSION_TOO_LOW = 31,
    LINUX_GLX_NO_GLXFBCONFIGS = 32,
    LINUX_GLX_NO_SUITABLE_GLXFBCONFIG = 33,
    LINUX_GLX_GET_VISUAL_FROM_FBCONFIG_FAILED = 34,
    LINUX_GLX_REQUIRED_EXTENSIONS_MISSING = 35,
    LINUX_GLX_CREATE_CONTEXT_FAILED = 36,
    LINUX_GLX_CREATE_WINDOW_FAILED = 37,
    LINUX_X11_CREATE_WINDOW_FAILED = 38,
    LINUX_EGL_BIND_OPENGL_API_FAILED = 39,
    LINUX_EGL_BIND_OPENGL_ES_API_FAILED = 40,
    LINUX_EGL_GET_DISPLAY_FAILED = 41,
    LINUX_EGL_INITIALIZE_FAILED = 42,
    LINUX_EGL_NO_CONFIGS = 43,
    LINUX_EGL_NO_NATIVE_VISUAL = 44,
    LINUX_EGL_GET_VISUAL_INFO_FAILED = 45,
    LINUX_EGL_CREATE_WINDOW_SURFACE_FAILED = 46,
    LINUX_EGL_CREATE_CONTEXT_FAILED = 47,
    LINUX_EGL_MAKE_CURRENT_FAILED = 48,
    LINUX_X11_OPEN_DISPLAY_FAILED = 49,
    LINUX_X11_QUERY_SYSTEM_DPI_FAILED = 50,
    LINUX_X11_DROPPED_FILE_URI_WRONG_SCHEME = 51,
    LINUX_X11_FAILED_TO_BECOME_OWNER_OF_CLIPBOARD = 52,
    ANDROID_UNSUPPORTED_INPUT_EVENT_INPUT_CB = 53,
    ANDROID_UNSUPPORTED_INPUT_EVENT_MAIN_CB = 54,
    ANDROID_READ_MSG_FAILED = 55,
    ANDROID_WRITE_MSG_FAILED = 56,
    ANDROID_MSG_CREATE = 57,
    ANDROID_MSG_RESUME = 58,
    ANDROID_MSG_PAUSE = 59,
    ANDROID_MSG_FOCUS = 60,
    ANDROID_MSG_NO_FOCUS = 61,
    ANDROID_MSG_SET_NATIVE_WINDOW = 62,
    ANDROID_MSG_SET_INPUT_QUEUE = 63,
    ANDROID_MSG_DESTROY = 64,
    ANDROID_UNKNOWN_MSG = 65,
    ANDROID_LOOP_THREAD_STARTED = 66,
    ANDROID_LOOP_THREAD_DONE = 67,
    ANDROID_NATIVE_ACTIVITY_ONSTART = 68,
    ANDROID_NATIVE_ACTIVITY_ONRESUME = 69,
    ANDROID_NATIVE_ACTIVITY_ONSAVEINSTANCESTATE = 70,
    ANDROID_NATIVE_ACTIVITY_ONWINDOWFOCUSCHANGED = 71,
    ANDROID_NATIVE_ACTIVITY_ONPAUSE = 72,
    ANDROID_NATIVE_ACTIVITY_ONSTOP = 73,
    ANDROID_NATIVE_ACTIVITY_ONNATIVEWINDOWCREATED = 74,
    ANDROID_NATIVE_ACTIVITY_ONNATIVEWINDOWDESTROYED = 75,
    ANDROID_NATIVE_ACTIVITY_ONINPUTQUEUECREATED = 76,
    ANDROID_NATIVE_ACTIVITY_ONINPUTQUEUEDESTROYED = 77,
    ANDROID_NATIVE_ACTIVITY_ONCONFIGURATIONCHANGED = 78,
    ANDROID_NATIVE_ACTIVITY_ONLOWMEMORY = 79,
    ANDROID_NATIVE_ACTIVITY_ONDESTROY = 80,
    ANDROID_NATIVE_ACTIVITY_DONE = 81,
    ANDROID_NATIVE_ACTIVITY_ONCREATE = 82,
    ANDROID_CREATE_THREAD_PIPE_FAILED = 83,
    ANDROID_NATIVE_ACTIVITY_CREATE_SUCCESS = 84,
    WGPU_DEVICE_LOST = 85,
    WGPU_DEVICE_LOG = 86,
    WGPU_DEVICE_UNCAPTURED_ERROR = 87,
    WGPU_SWAPCHAIN_CREATE_SURFACE_FAILED = 88,
    WGPU_SWAPCHAIN_SURFACE_GET_CAPABILITIES_FAILED = 89,
    WGPU_SWAPCHAIN_CREATE_DEPTH_STENCIL_TEXTURE_FAILED = 90,
    WGPU_SWAPCHAIN_CREATE_DEPTH_STENCIL_VIEW_FAILED = 91,
    WGPU_SWAPCHAIN_CREATE_MSAA_TEXTURE_FAILED = 92,
    WGPU_SWAPCHAIN_CREATE_MSAA_VIEW_FAILED = 93,
    WGPU_SWAPCHAIN_GETCURRENTTEXTURE_FAILED = 94,
    WGPU_REQUEST_DEVICE_STATUS_ERROR = 95,
    WGPU_REQUEST_DEVICE_STATUS_UNKNOWN = 96,
    WGPU_REQUEST_ADAPTER_STATUS_UNAVAILABLE = 97,
    WGPU_REQUEST_ADAPTER_STATUS_ERROR = 98,
    WGPU_REQUEST_ADAPTER_STATUS_UNKNOWN = 99,
    WGPU_CREATE_INSTANCE_FAILED = 100,
    IMAGE_DATA_SIZE_MISMATCH = 101,
    DROPPED_FILE_PATH_TOO_LONG = 102,
    CLIPBOARD_STRING_TOO_BIG = 103,
}

struct SappLogger
{
    LogCb func;
    void* user_data;
}

struct SappDesc
{
    Cb init_cb;
    Cb frame_cb;
    Cb cleanup_cb;
    EventCb event_cb;
    void* user_data;
    DataCb init_userdata_cb;
    DataCb frame_userdata_cb;
    DataCb cleanup_userdata_cb;
    EventDataCb event_userdata_cb;
    CInt width;
    CInt height;
    CInt sample_count;
    CInt swap_interval;
    bool high_dpi;
    bool fullscreen;
    bool alpha;
    ZString window_title;
    bool enable_clipboard;
    CInt clipboard_size;
    bool enable_dragndrop;
    CInt max_dropped_files;
    CInt max_dropped_file_path_length;
    SappIconDesc icon;
    SappAllocator allocator;
    SappLogger logger;
    CInt gl_major_version;
    CInt gl_minor_version;
    bool win32_console_utf8;
    bool win32_console_create;
    bool win32_console_attach;
    ZString html5_canvas_selector;
    bool html5_canvas_resize;
    bool html5_preserve_drawing_buffer;
    bool html5_premultiplied_alpha;
    bool html5_ask_leave_site;
    bool html5_update_document_title;
    bool html5_bubble_mouse_events;
    bool html5_bubble_touch_events;
    bool html5_bubble_wheel_events;
    bool html5_bubble_key_events;
    bool html5_bubble_char_events;
    bool html5_use_emsc_set_main_loop;
    bool html5_emsc_set_main_loop_simulate_infinite_loop;
    bool ios_keyboard_resizes_canvas;
}

enum SappHtml5FetchError : const int
{
    FETCH_ERROR_NO_ERROR = 0,
    FETCH_ERROR_BUFFER_TOO_SMALL = 1,
    FETCH_ERROR_OTHER = 2,
}

struct SappHtml5FetchResponse
{
    bool succeeded;
    SappHtml5FetchError error_code;
    CInt file_index;
    SappRange data;
    SappRange buffer;
    void* user_data;
}

struct SappHtml5FetchRequest
{
    CInt dropped_file_index;
    ResponseCb callback;
    SappRange buffer;
    void* user_data;
}

enum SappMouseCursor : const int
{
    DEFAULT = 0,
    ARROW = 1,
    IBEAM = 2,
    CROSSHAIR = 3,
    POINTING_HAND = 4,
    RESIZE_EW = 5,
    RESIZE_NS = 6,
    RESIZE_NWSE = 7,
    RESIZE_NESW = 8,
    RESIZE_ALL = 9,
    NOT_ALLOWED = 10,
    CUSTOM_0 = 11,
    CUSTOM_1 = 12,
    CUSTOM_2 = 13,
    CUSTOM_3 = 14,
    CUSTOM_4 = 15,
    CUSTOM_5 = 16,
    CUSTOM_6 = 17,
    CUSTOM_7 = 18,
    CUSTOM_8 = 19,
    CUSTOM_9 = 20,
    CUSTOM_10 = 21,
    CUSTOM_11 = 22,
    CUSTOM_12 = 23,
    CUSTOM_13 = 24,
    CUSTOM_14 = 25,
    CUSTOM_15 = 26,
    NUM = 27,
}

alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);
alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);
alias Cb = fn void();
alias EventCb = fn void(SappEvent*);
alias DataCb = fn void(void*);
alias EventDataCb = fn void(SappEvent*, void*);
alias ResponseCb = fn void(SappHtml5FetchResponse*);

