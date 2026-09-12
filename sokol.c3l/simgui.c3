// machine generated, do not edit

module sokol::simgui;
import sokol;

extern fn void setup(SimguiDesc* desc) @cname("simgui_setup");
extern fn void new_frame(SimguiFrameDesc* desc) @cname("simgui_new_frame");
extern fn void render() @cname("simgui_render");
extern fn ulong imtextureid(SgView tex_view) @cname("simgui_imtextureid");
extern fn ulong imtextureid_with_sampler(SgView tex_view, SgSampler smp) @cname("simgui_imtextureid_with_sampler");
extern fn SgView texture_view_from_imtextureid(ulong imtex_id) @cname("simgui_texture_view_from_imtextureid");
extern fn SgSampler sampler_from_imtextureid(ulong imtex_id) @cname("simgui_sampler_from_imtextureid");
extern fn void add_focus_event(bool focus) @cname("simgui_add_focus_event");
extern fn void add_mouse_pos_event(float x, float y) @cname("simgui_add_mouse_pos_event");
extern fn void add_touch_pos_event(float x, float y) @cname("simgui_add_touch_pos_event");
extern fn void add_mouse_button_event(CInt mouse_button, bool down) @cname("simgui_add_mouse_button_event");
extern fn void add_mouse_wheel_event(float wheel_x, float wheel_y) @cname("simgui_add_mouse_wheel_event");
extern fn void add_key_event(CInt imgui_key, bool down) @cname("simgui_add_key_event");
extern fn void add_input_character(uint c) @cname("simgui_add_input_character");
extern fn void add_input_characters_utf8(ZString c) @cname("simgui_add_input_characters_utf8");
extern fn void add_touch_button_event(CInt mouse_button, bool down) @cname("simgui_add_touch_button_event");
extern fn bool handle_event(SappEvent* ev) @cname("simgui_handle_event");
extern fn CInt map_keycode(SappKeycode keycode) @cname("simgui_map_keycode");
extern fn void shutdown() @cname("simgui_shutdown");

constdef SimguiLogItem : int
{
    OK = 0,
    BUFFER_OVERFLOW = 1,
}

struct SimguiLogger
{
    LogCb func;
    void* user_data;
}

struct SimguiDesc
{
    CInt max_vertices;
    SgPixelFormat color_format;
    SgPixelFormat depth_format;
    CInt sample_count;
    ZString ini_filename;
    bool no_default_font;
    bool disable_paste_override;
    bool disable_set_mouse_cursor;
    bool disable_windows_resize_from_edges;
    bool write_alpha_channel;
    SimguiLogger logger;
}

struct SimguiFrameDesc
{
    CInt width;
    CInt height;
    double delta_time;
    float dpi_scale;
}

struct SimguiFontTexDesc
{
    SgFilter min_filter;
    SgFilter mag_filter;
}

alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);

