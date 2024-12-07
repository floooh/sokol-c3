// machine generated, do not edit

module sokol::sdtx;
import sokol;

extern fn void setup(Desc* desc) @extern("sdtx_setup");
extern fn void shutdown() @extern("sdtx_shutdown");
extern fn FontDesc font_kc853() @extern("sdtx_font_kc853");
extern fn FontDesc font_kc854() @extern("sdtx_font_kc854");
extern fn FontDesc font_z1013() @extern("sdtx_font_z1013");
extern fn FontDesc font_cpc() @extern("sdtx_font_cpc");
extern fn FontDesc font_c64() @extern("sdtx_font_c64");
extern fn FontDesc font_oric() @extern("sdtx_font_oric");
extern fn Context make_context(ContextDesc* desc) @extern("sdtx_make_context");
extern fn void destroy_context(Context ctx) @extern("sdtx_destroy_context");
extern fn void set_context(Context ctx) @extern("sdtx_set_context");
extern fn Context get_context() @extern("sdtx_get_context");
extern fn Context default_context() @extern("sdtx_default_context");
extern fn void draw() @extern("sdtx_draw");
extern fn void context_draw(Context ctx) @extern("sdtx_context_draw");
extern fn void draw_layer(CInt layer_id) @extern("sdtx_draw_layer");
extern fn void context_draw_layer(Context ctx, CInt layer_id) @extern("sdtx_context_draw_layer");
extern fn void layer(CInt layer_id) @extern("sdtx_layer");
extern fn void font(CInt font_index) @extern("sdtx_font");
extern fn void canvas(float w, float h) @extern("sdtx_canvas");
extern fn void origin(float x, float y) @extern("sdtx_origin");
extern fn void home() @extern("sdtx_home");
extern fn void pos(float x, float y) @extern("sdtx_pos");
extern fn void pos_x(float x) @extern("sdtx_pos_x");
extern fn void pos_y(float y) @extern("sdtx_pos_y");
extern fn void move(float dx, float dy) @extern("sdtx_move");
extern fn void move_x(float dx) @extern("sdtx_move_x");
extern fn void move_y(float dy) @extern("sdtx_move_y");
extern fn void crlf() @extern("sdtx_crlf");
extern fn void color3b(char r, char g, char b) @extern("sdtx_color3b");
extern fn void color3f(float r, float g, float b) @extern("sdtx_color3f");
extern fn void color4b(char r, char g, char b, char a) @extern("sdtx_color4b");
extern fn void color4f(float r, float g, float b, float a) @extern("sdtx_color4f");
extern fn void color1i(uint rgba) @extern("sdtx_color1i");
extern fn void putc(char c) @extern("sdtx_putc");
extern fn void puts(ZString str) @extern("sdtx_puts");
extern fn void putr(ZString str, CInt len) @extern("sdtx_putr");

distinct LogItem = int;
module sokol::sdtx::log_item;
const LogItem OK = 0;
const LogItem MALLOC_FAILED = 1;
const LogItem ADD_COMMIT_LISTENER_FAILED = 2;
const LogItem COMMAND_BUFFER_FULL = 3;
const LogItem CONTEXT_POOL_EXHAUSTED = 4;
const LogItem CANNOT_DESTROY_DEFAULT_CONTEXT = 5;
module sokol::sdtx;
import sokol;

struct Logger
{
    LogCb func;
    void* user_data;
}

struct Context
{
    uint id;
}

struct Range
{
    void* ptr;
    usz size;
}

struct FontDesc
{
    Range data;
    char first_char;
    char last_char;
}

struct ContextDesc
{
    CInt max_commands;
    CInt char_buf_size;
    float canvas_width;
    float canvas_height;
    CInt tab_width;
    sokol::sg::PixelFormat color_format;
    sokol::sg::PixelFormat depth_format;
    CInt sample_count;
}

struct Allocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct Desc
{
    CInt context_pool_size;
    CInt printf_buf_size;
    FontDesc[8] fonts;
    ContextDesc context;
    Allocator allocator;
    Logger logger;
}

def LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);
def AllocCb = fn void*(usz, void*);
def FreeCb = fn void*(usz, void*);

