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
extern fn void set_mouse_cursor(MouseCursor cursor) @extern("sapp_set_mouse_cursor");
extern fn MouseCursor get_mouse_cursor() @extern("sapp_get_mouse_cursor");
extern fn void* userdata() @extern("sapp_userdata");
extern fn Desc query_desc() @extern("sapp_query_desc");
extern fn void request_quit() @extern("sapp_request_quit");
extern fn void cancel_quit() @extern("sapp_cancel_quit");
extern fn void quit() @extern("sapp_quit");
extern fn void consume_event() @extern("sapp_consume_event");
extern fn ulong frame_count() @extern("sapp_frame_count");
extern fn double frame_duration() @extern("sapp_frame_duration");
extern fn void set_clipboard_string(ZString str) @extern("sapp_set_clipboard_string");
extern fn ZString get_clipboard_string() @extern("sapp_get_clipboard_string");
extern fn void set_window_title(ZString str) @extern("sapp_set_window_title");
extern fn void set_icon(IconDesc* icon_desc) @extern("sapp_set_icon");
extern fn CInt get_num_dropped_files() @extern("sapp_get_num_dropped_files");
extern fn ZString get_dropped_file_path(CInt index) @extern("sapp_get_dropped_file_path");
extern fn void run(Desc* desc) @extern("sapp_run");
extern fn void* egl_get_display() @extern("sapp_egl_get_display");
extern fn void* egl_get_context() @extern("sapp_egl_get_context");
extern fn void html5_ask_leave_site(bool ask) @extern("sapp_html5_ask_leave_site");
extern fn uint html5_get_dropped_file_size(CInt index) @extern("sapp_html5_get_dropped_file_size");
extern fn void html5_fetch_dropped_file(Html5FetchRequest* request) @extern("sapp_html5_fetch_dropped_file");
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
extern fn void* android_get_native_activity() @extern("sapp_android_get_native_activity");

const usz MAX_TOUCHPOINTS = 8;
const usz MAX_MOUSEBUTTONS = 3;
const usz MAX_KEYCODES = 512;
const usz MAX_ICONIMAGES = 8;

distinct EventType = uint;
module sokol::sapp::event_type;
const EventType INVALID = 0;
const EventType KEY_DOWN = 1;
const EventType KEY_UP = 2;
const EventType CHAR = 3;
const EventType MOUSE_DOWN = 4;
const EventType MOUSE_UP = 5;
const EventType MOUSE_SCROLL = 6;
const EventType MOUSE_MOVE = 7;
const EventType MOUSE_ENTER = 8;
const EventType MOUSE_LEAVE = 9;
const EventType TOUCHES_BEGAN = 10;
const EventType TOUCHES_MOVED = 11;
const EventType TOUCHES_ENDED = 12;
const EventType TOUCHES_CANCELLED = 13;
const EventType RESIZED = 14;
const EventType ICONIFIED = 15;
const EventType RESTORED = 16;
const EventType FOCUSED = 17;
const EventType UNFOCUSED = 18;
const EventType SUSPENDED = 19;
const EventType RESUMED = 20;
const EventType QUIT_REQUESTED = 21;
const EventType CLIPBOARD_PASTED = 22;
const EventType FILES_DROPPED = 23;
const EventType NUM = 24;
module sokol::sapp;
import sokol;

distinct Keycode = int;
module sokol::sapp::keycode;
const Keycode INVALID = 0;
const Keycode SPACE = 32;
const Keycode APOSTROPHE = 39;
const Keycode COMMA = 44;
const Keycode MINUS = 45;
const Keycode PERIOD = 46;
const Keycode SLASH = 47;
const Keycode NUM_0 = 48;
const Keycode NUM_1 = 49;
const Keycode NUM_2 = 50;
const Keycode NUM_3 = 51;
const Keycode NUM_4 = 52;
const Keycode NUM_5 = 53;
const Keycode NUM_6 = 54;
const Keycode NUM_7 = 55;
const Keycode NUM_8 = 56;
const Keycode NUM_9 = 57;
const Keycode SEMICOLON = 59;
const Keycode EQUAL = 61;
const Keycode A = 65;
const Keycode B = 66;
const Keycode C = 67;
const Keycode D = 68;
const Keycode E = 69;
const Keycode F = 70;
const Keycode G = 71;
const Keycode H = 72;
const Keycode I = 73;
const Keycode J = 74;
const Keycode K = 75;
const Keycode L = 76;
const Keycode M = 77;
const Keycode N = 78;
const Keycode O = 79;
const Keycode P = 80;
const Keycode Q = 81;
const Keycode R = 82;
const Keycode S = 83;
const Keycode T = 84;
const Keycode U = 85;
const Keycode V = 86;
const Keycode W = 87;
const Keycode X = 88;
const Keycode Y = 89;
const Keycode Z = 90;
const Keycode LEFT_BRACKET = 91;
const Keycode BACKSLASH = 92;
const Keycode RIGHT_BRACKET = 93;
const Keycode GRAVE_ACCENT = 96;
const Keycode WORLD_1 = 161;
const Keycode WORLD_2 = 162;
const Keycode ESCAPE = 256;
const Keycode ENTER = 257;
const Keycode TAB = 258;
const Keycode BACKSPACE = 259;
const Keycode INSERT = 260;
const Keycode DELETE = 261;
const Keycode RIGHT = 262;
const Keycode LEFT = 263;
const Keycode DOWN = 264;
const Keycode UP = 265;
const Keycode PAGE_UP = 266;
const Keycode PAGE_DOWN = 267;
const Keycode HOME = 268;
const Keycode END = 269;
const Keycode CAPS_LOCK = 280;
const Keycode SCROLL_LOCK = 281;
const Keycode NUM_LOCK = 282;
const Keycode PRINT_SCREEN = 283;
const Keycode PAUSE = 284;
const Keycode F1 = 290;
const Keycode F2 = 291;
const Keycode F3 = 292;
const Keycode F4 = 293;
const Keycode F5 = 294;
const Keycode F6 = 295;
const Keycode F7 = 296;
const Keycode F8 = 297;
const Keycode F9 = 298;
const Keycode F10 = 299;
const Keycode F11 = 300;
const Keycode F12 = 301;
const Keycode F13 = 302;
const Keycode F14 = 303;
const Keycode F15 = 304;
const Keycode F16 = 305;
const Keycode F17 = 306;
const Keycode F18 = 307;
const Keycode F19 = 308;
const Keycode F20 = 309;
const Keycode F21 = 310;
const Keycode F22 = 311;
const Keycode F23 = 312;
const Keycode F24 = 313;
const Keycode F25 = 314;
const Keycode KP_0 = 320;
const Keycode KP_1 = 321;
const Keycode KP_2 = 322;
const Keycode KP_3 = 323;
const Keycode KP_4 = 324;
const Keycode KP_5 = 325;
const Keycode KP_6 = 326;
const Keycode KP_7 = 327;
const Keycode KP_8 = 328;
const Keycode KP_9 = 329;
const Keycode KP_DECIMAL = 330;
const Keycode KP_DIVIDE = 331;
const Keycode KP_MULTIPLY = 332;
const Keycode KP_SUBTRACT = 333;
const Keycode KP_ADD = 334;
const Keycode KP_ENTER = 335;
const Keycode KP_EQUAL = 336;
const Keycode LEFT_SHIFT = 340;
const Keycode LEFT_CONTROL = 341;
const Keycode LEFT_ALT = 342;
const Keycode LEFT_SUPER = 343;
const Keycode RIGHT_SHIFT = 344;
const Keycode RIGHT_CONTROL = 345;
const Keycode RIGHT_ALT = 346;
const Keycode RIGHT_SUPER = 347;
const Keycode MENU = 348;
module sokol::sapp;
import sokol;

distinct AndroidTooltype = int;
module sokol::sapp::android_tooltype;
const AndroidTooltype UNKNOWN = 0;
const AndroidTooltype FINGER = 1;
const AndroidTooltype STYLUS = 2;
const AndroidTooltype MOUSE = 3;
module sokol::sapp;
import sokol;

struct Touchpoint
{
    uptr identifier;
    float pos_x;
    float pos_y;
    AndroidTooltype android_tooltype;
    bool changed;
}

distinct Mousebutton = int;
module sokol::sapp::mousebutton;
const Mousebutton LEFT = 0;
const Mousebutton RIGHT = 1;
const Mousebutton MIDDLE = 2;
const Mousebutton INVALID = 256;
module sokol::sapp;
import sokol;

const uint MODIFIER_SHIFT = 1;
const uint MODIFIER_CTRL = 2;
const uint MODIFIER_ALT = 4;
const uint MODIFIER_SUPER = 8;
const uint MODIFIER_LMB = 256;
const uint MODIFIER_RMB = 512;
const uint MODIFIER_MMB = 1024;

struct Event
{
    ulong frame_count;
    EventType type;
    Keycode key_code;
    uint char_code;
    bool key_repeat;
    uint modifiers;
    Mousebutton mouse_button;
    float mouse_x;
    float mouse_y;
    float mouse_dx;
    float mouse_dy;
    float scroll_x;
    float scroll_y;
    CInt num_touches;
    Touchpoint[8] touches;
    CInt window_width;
    CInt window_height;
    CInt framebuffer_width;
    CInt framebuffer_height;
}

struct Range
{
    void* ptr;
    usz size;
}

struct ImageDesc
{
    CInt width;
    CInt height;
    Range pixels;
}

struct IconDesc
{
    bool sokol_default;
    ImageDesc[8] images;
}

struct Allocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

distinct LogItem = int;
module sokol::sapp::log_item;
const LogItem OK = 0;
const LogItem MALLOC_FAILED = 1;
const LogItem MACOS_INVALID_NSOPENGL_PROFILE = 2;
const LogItem WIN32_LOAD_OPENGL32_DLL_FAILED = 3;
const LogItem WIN32_CREATE_HELPER_WINDOW_FAILED = 4;
const LogItem WIN32_HELPER_WINDOW_GETDC_FAILED = 5;
const LogItem WIN32_DUMMY_CONTEXT_SET_PIXELFORMAT_FAILED = 6;
const LogItem WIN32_CREATE_DUMMY_CONTEXT_FAILED = 7;
const LogItem WIN32_DUMMY_CONTEXT_MAKE_CURRENT_FAILED = 8;
const LogItem WIN32_GET_PIXELFORMAT_ATTRIB_FAILED = 9;
const LogItem WIN32_WGL_FIND_PIXELFORMAT_FAILED = 10;
const LogItem WIN32_WGL_DESCRIBE_PIXELFORMAT_FAILED = 11;
const LogItem WIN32_WGL_SET_PIXELFORMAT_FAILED = 12;
const LogItem WIN32_WGL_ARB_CREATE_CONTEXT_REQUIRED = 13;
const LogItem WIN32_WGL_ARB_CREATE_CONTEXT_PROFILE_REQUIRED = 14;
const LogItem WIN32_WGL_OPENGL_VERSION_NOT_SUPPORTED = 15;
const LogItem WIN32_WGL_OPENGL_PROFILE_NOT_SUPPORTED = 16;
const LogItem WIN32_WGL_INCOMPATIBLE_DEVICE_CONTEXT = 17;
const LogItem WIN32_WGL_CREATE_CONTEXT_ATTRIBS_FAILED_OTHER = 18;
const LogItem WIN32_D3D11_CREATE_DEVICE_AND_SWAPCHAIN_WITH_DEBUG_FAILED = 19;
const LogItem WIN32_D3D11_GET_IDXGIFACTORY_FAILED = 20;
const LogItem WIN32_D3D11_GET_IDXGIADAPTER_FAILED = 21;
const LogItem WIN32_D3D11_QUERY_INTERFACE_IDXGIDEVICE1_FAILED = 22;
const LogItem WIN32_REGISTER_RAW_INPUT_DEVICES_FAILED_MOUSE_LOCK = 23;
const LogItem WIN32_REGISTER_RAW_INPUT_DEVICES_FAILED_MOUSE_UNLOCK = 24;
const LogItem WIN32_GET_RAW_INPUT_DATA_FAILED = 25;
const LogItem LINUX_GLX_LOAD_LIBGL_FAILED = 26;
const LogItem LINUX_GLX_LOAD_ENTRY_POINTS_FAILED = 27;
const LogItem LINUX_GLX_EXTENSION_NOT_FOUND = 28;
const LogItem LINUX_GLX_QUERY_VERSION_FAILED = 29;
const LogItem LINUX_GLX_VERSION_TOO_LOW = 30;
const LogItem LINUX_GLX_NO_GLXFBCONFIGS = 31;
const LogItem LINUX_GLX_NO_SUITABLE_GLXFBCONFIG = 32;
const LogItem LINUX_GLX_GET_VISUAL_FROM_FBCONFIG_FAILED = 33;
const LogItem LINUX_GLX_REQUIRED_EXTENSIONS_MISSING = 34;
const LogItem LINUX_GLX_CREATE_CONTEXT_FAILED = 35;
const LogItem LINUX_GLX_CREATE_WINDOW_FAILED = 36;
const LogItem LINUX_X11_CREATE_WINDOW_FAILED = 37;
const LogItem LINUX_EGL_BIND_OPENGL_API_FAILED = 38;
const LogItem LINUX_EGL_BIND_OPENGL_ES_API_FAILED = 39;
const LogItem LINUX_EGL_GET_DISPLAY_FAILED = 40;
const LogItem LINUX_EGL_INITIALIZE_FAILED = 41;
const LogItem LINUX_EGL_NO_CONFIGS = 42;
const LogItem LINUX_EGL_NO_NATIVE_VISUAL = 43;
const LogItem LINUX_EGL_GET_VISUAL_INFO_FAILED = 44;
const LogItem LINUX_EGL_CREATE_WINDOW_SURFACE_FAILED = 45;
const LogItem LINUX_EGL_CREATE_CONTEXT_FAILED = 46;
const LogItem LINUX_EGL_MAKE_CURRENT_FAILED = 47;
const LogItem LINUX_X11_OPEN_DISPLAY_FAILED = 48;
const LogItem LINUX_X11_QUERY_SYSTEM_DPI_FAILED = 49;
const LogItem LINUX_X11_DROPPED_FILE_URI_WRONG_SCHEME = 50;
const LogItem LINUX_X11_FAILED_TO_BECOME_OWNER_OF_CLIPBOARD = 51;
const LogItem ANDROID_UNSUPPORTED_INPUT_EVENT_INPUT_CB = 52;
const LogItem ANDROID_UNSUPPORTED_INPUT_EVENT_MAIN_CB = 53;
const LogItem ANDROID_READ_MSG_FAILED = 54;
const LogItem ANDROID_WRITE_MSG_FAILED = 55;
const LogItem ANDROID_MSG_CREATE = 56;
const LogItem ANDROID_MSG_RESUME = 57;
const LogItem ANDROID_MSG_PAUSE = 58;
const LogItem ANDROID_MSG_FOCUS = 59;
const LogItem ANDROID_MSG_NO_FOCUS = 60;
const LogItem ANDROID_MSG_SET_NATIVE_WINDOW = 61;
const LogItem ANDROID_MSG_SET_INPUT_QUEUE = 62;
const LogItem ANDROID_MSG_DESTROY = 63;
const LogItem ANDROID_UNKNOWN_MSG = 64;
const LogItem ANDROID_LOOP_THREAD_STARTED = 65;
const LogItem ANDROID_LOOP_THREAD_DONE = 66;
const LogItem ANDROID_NATIVE_ACTIVITY_ONSTART = 67;
const LogItem ANDROID_NATIVE_ACTIVITY_ONRESUME = 68;
const LogItem ANDROID_NATIVE_ACTIVITY_ONSAVEINSTANCESTATE = 69;
const LogItem ANDROID_NATIVE_ACTIVITY_ONWINDOWFOCUSCHANGED = 70;
const LogItem ANDROID_NATIVE_ACTIVITY_ONPAUSE = 71;
const LogItem ANDROID_NATIVE_ACTIVITY_ONSTOP = 72;
const LogItem ANDROID_NATIVE_ACTIVITY_ONNATIVEWINDOWCREATED = 73;
const LogItem ANDROID_NATIVE_ACTIVITY_ONNATIVEWINDOWDESTROYED = 74;
const LogItem ANDROID_NATIVE_ACTIVITY_ONINPUTQUEUECREATED = 75;
const LogItem ANDROID_NATIVE_ACTIVITY_ONINPUTQUEUEDESTROYED = 76;
const LogItem ANDROID_NATIVE_ACTIVITY_ONCONFIGURATIONCHANGED = 77;
const LogItem ANDROID_NATIVE_ACTIVITY_ONLOWMEMORY = 78;
const LogItem ANDROID_NATIVE_ACTIVITY_ONDESTROY = 79;
const LogItem ANDROID_NATIVE_ACTIVITY_DONE = 80;
const LogItem ANDROID_NATIVE_ACTIVITY_ONCREATE = 81;
const LogItem ANDROID_CREATE_THREAD_PIPE_FAILED = 82;
const LogItem ANDROID_NATIVE_ACTIVITY_CREATE_SUCCESS = 83;
const LogItem WGPU_SWAPCHAIN_CREATE_SURFACE_FAILED = 84;
const LogItem WGPU_SWAPCHAIN_CREATE_SWAPCHAIN_FAILED = 85;
const LogItem WGPU_SWAPCHAIN_CREATE_DEPTH_STENCIL_TEXTURE_FAILED = 86;
const LogItem WGPU_SWAPCHAIN_CREATE_DEPTH_STENCIL_VIEW_FAILED = 87;
const LogItem WGPU_SWAPCHAIN_CREATE_MSAA_TEXTURE_FAILED = 88;
const LogItem WGPU_SWAPCHAIN_CREATE_MSAA_VIEW_FAILED = 89;
const LogItem WGPU_REQUEST_DEVICE_STATUS_ERROR = 90;
const LogItem WGPU_REQUEST_DEVICE_STATUS_UNKNOWN = 91;
const LogItem WGPU_REQUEST_ADAPTER_STATUS_UNAVAILABLE = 92;
const LogItem WGPU_REQUEST_ADAPTER_STATUS_ERROR = 93;
const LogItem WGPU_REQUEST_ADAPTER_STATUS_UNKNOWN = 94;
const LogItem WGPU_CREATE_INSTANCE_FAILED = 95;
const LogItem IMAGE_DATA_SIZE_MISMATCH = 96;
const LogItem DROPPED_FILE_PATH_TOO_LONG = 97;
const LogItem CLIPBOARD_STRING_TOO_BIG = 98;
module sokol::sapp;
import sokol;

struct Logger
{
    LogCb func;
    void* user_data;
}

struct Desc
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
    IconDesc icon;
    Allocator allocator;
    Logger logger;
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
    bool html5_bubble_mouse_events;
    bool html5_bubble_touch_events;
    bool html5_bubble_wheel_events;
    bool html5_bubble_key_events;
    bool html5_bubble_char_events;
    bool html5_use_emsc_set_main_loop;
    bool html5_emsc_set_main_loop_simulate_infinite_loop;
    bool ios_keyboard_resizes_canvas;
}

distinct Html5FetchError = int;
module sokol::sapp::html5_fetch_error;
const Html5FetchError FETCH_ERROR_NO_ERROR = 0;
const Html5FetchError FETCH_ERROR_BUFFER_TOO_SMALL = 1;
const Html5FetchError FETCH_ERROR_OTHER = 2;
module sokol::sapp;
import sokol;

struct Html5FetchResponse
{
    bool succeeded;
    Html5FetchError error_code;
    CInt file_index;
    Range data;
    Range buffer;
    void* user_data;
}

struct Html5FetchRequest
{
    CInt dropped_file_index;
    ResponseCb callback;
    Range buffer;
    void* user_data;
}

distinct MouseCursor = int;
module sokol::sapp::mouse_cursor;
const MouseCursor DEFAULT = 0;
const MouseCursor ARROW = 1;
const MouseCursor IBEAM = 2;
const MouseCursor CROSSHAIR = 3;
const MouseCursor POINTING_HAND = 4;
const MouseCursor RESIZE_EW = 5;
const MouseCursor RESIZE_NS = 6;
const MouseCursor RESIZE_NWSE = 7;
const MouseCursor RESIZE_NESW = 8;
const MouseCursor RESIZE_ALL = 9;
const MouseCursor NOT_ALLOWED = 10;
const MouseCursor NUM = 11;
module sokol::sapp;
import sokol;

def AllocCb = fn void*(usz, void*);
def FreeCb = fn void*(usz, void*);
def LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);
def Cb = fn void();
def EventCb = fn void(Event*);
def DataCb = fn void(void*);
def EventDataCb = fn void(Event*, void*);
def ResponseCb = fn void(Html5FetchResponse*);

