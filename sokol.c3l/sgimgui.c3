// machine generated, do not edit

module sokol::sgimgui;
import sokol;

extern fn void setup(SgimguiDesc* desc) @cname("sgimgui_setup");
extern fn void shutdown() @cname("sgimgui_shutdown");
extern fn void draw() @cname("sgimgui_draw");
extern fn void draw_menu(ZString title) @cname("sgimgui_draw_menu");
extern fn void draw_buffer_window_content() @cname("sgimgui_draw_buffer_window_content");
extern fn void draw_image_window_content() @cname("sgimgui_draw_image_window_content");
extern fn void draw_sampler_window_content() @cname("sgimgui_draw_sampler_window_content");
extern fn void draw_shader_window_content() @cname("sgimgui_draw_shader_window_content");
extern fn void draw_pipeline_window_content() @cname("sgimgui_draw_pipeline_window_content");
extern fn void draw_view_window_content() @cname("sgimgui_draw_view_window_content");
extern fn void draw_capture_window_content() @cname("sgimgui_draw_capture_window_content");
extern fn void draw_capabilities_window_content() @cname("sgimgui_draw_capabilities_window_content");
extern fn void draw_frame_stats_window_content() @cname("sgimgui_draw_frame_stats_window_content");
extern fn void draw_buffer_window(ZString title) @cname("sgimgui_draw_buffer_window");
extern fn void draw_image_window(ZString title) @cname("sgimgui_draw_image_window");
extern fn void draw_sampler_window(ZString title) @cname("sgimgui_draw_sampler_window");
extern fn void draw_shader_window(ZString title) @cname("sgimgui_draw_shader_window");
extern fn void draw_pipeline_window(ZString title) @cname("sgimgui_draw_pipeline_window");
extern fn void draw_view_window(ZString title) @cname("sgimgui_draw_view_window");
extern fn void draw_capture_window(ZString title) @cname("sgimgui_draw_capture_window");
extern fn void draw_capabilities_window(ZString title) @cname("sgimgui_draw_capabilities_window");
extern fn void draw_frame_stats_window(ZString title) @cname("sgimgui_draw_frame_stats_window");
extern fn void draw_buffer_menu_item(ZString label) @cname("sgimgui_draw_buffer_menu_item");
extern fn void draw_image_menu_item(ZString label) @cname("sgimgui_draw_image_menu_item");
extern fn void draw_sampler_menu_item(ZString label) @cname("sgimgui_draw_sampler_menu_item");
extern fn void draw_shader_menu_item(ZString label) @cname("sgimgui_draw_shader_menu_item");
extern fn void draw_pipeline_menu_item(ZString label) @cname("sgimgui_draw_pipeline_menu_item");
extern fn void draw_view_menu_item(ZString label) @cname("sgimgui_draw_view_menu_item");
extern fn void draw_capture_menu_item(ZString label) @cname("sgimgui_draw_capture_menu_item");
extern fn void draw_capabilities_menu_item(ZString label) @cname("sgimgui_draw_capabilities_menu_item");
extern fn void draw_frame_stats_menu_item(ZString label) @cname("sgimgui_draw_frame_stats_menu_item");

struct SgimguiAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct SgimguiDesc
{
    SgimguiAllocator allocator;
}

alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);

