// machine generated, do not edit

module sokol::sappimgui;
import sokol;

extern fn void setup() @cname("sappimgui_setup");
extern fn void shutdown() @cname("sappimgui_shutdown");
extern fn void track_frame() @cname("sappimgui_track_frame");
extern fn void track_event(SappEvent* ev) @cname("sappimgui_track_event");
extern fn void draw() @cname("sappimgui_draw");
extern fn void draw_menu(ZString title) @cname("sappimgui_draw_menu");
extern fn void draw_hud_window_content() @cname("sappimgui_draw_hud_window_content");
extern fn void draw_publicstate_window_content() @cname("sappimgui_draw_publicstate_window_content");
extern fn void draw_event_window_content() @cname("sappimgui_draw_event_window_content");
extern fn void draw_hud_window(ZString title) @cname("sappimgui_draw_hud_window");
extern fn void draw_publicstate_window(ZString title) @cname("sappimgui_draw_publicstate_window");
extern fn void draw_event_window(ZString title) @cname("sappimgui_draw_event_window");
extern fn void draw_hud_menu_item(ZString label) @cname("sappimgui_draw_hud_menu_item");
extern fn void draw_publicstate_menu_item(ZString label) @cname("sappimgui_draw_publicstate_menu_item");
extern fn void draw_event_menu_item(ZString label) @cname("sappimgui_draw_event_menu_item");


