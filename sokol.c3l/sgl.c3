// machine generated, do not edit

module sokol::sgl;
import sokol;

extern fn void setup(SglDesc* desc) @cname("sgl_setup");
extern fn void shutdown() @cname("sgl_shutdown");
extern fn float rad(float deg) @cname("sgl_rad");
extern fn float deg(float rad) @cname("sgl_deg");
extern fn SglError error() @cname("sgl_error");
extern fn SglError context_error(SglContext ctx) @cname("sgl_context_error");
extern fn SglContext make_context(SglContextDesc* desc) @cname("sgl_make_context");
extern fn void destroy_context(SglContext ctx) @cname("sgl_destroy_context");
extern fn void set_context(SglContext ctx) @cname("sgl_set_context");
extern fn SglContext get_context() @cname("sgl_get_context");
extern fn SglContext default_context() @cname("sgl_default_context");
extern fn CInt num_vertices() @cname("sgl_num_vertices");
extern fn CInt num_commands() @cname("sgl_num_commands");
extern fn void draw() @cname("sgl_draw");
extern fn void context_draw(SglContext ctx) @cname("sgl_context_draw");
extern fn void draw_layer(CInt layer_id) @cname("sgl_draw_layer");
extern fn void context_draw_layer(SglContext ctx, CInt layer_id) @cname("sgl_context_draw_layer");
extern fn SglPipeline make_pipeline(SgPipelineDesc* desc) @cname("sgl_make_pipeline");
extern fn SglPipeline context_make_pipeline(SglContext ctx, SgPipelineDesc* desc) @cname("sgl_context_make_pipeline");
extern fn void destroy_pipeline(SglPipeline pip) @cname("sgl_destroy_pipeline");
extern fn void defaults() @cname("sgl_defaults");
extern fn void viewport(CInt x, CInt y, CInt w, CInt h, bool origin_top_left) @cname("sgl_viewport");
extern fn void viewportf(float x, float y, float w, float h, bool origin_top_left) @cname("sgl_viewportf");
extern fn void scissor_rect(CInt x, CInt y, CInt w, CInt h, bool origin_top_left) @cname("sgl_scissor_rect");
extern fn void scissor_rectf(float x, float y, float w, float h, bool origin_top_left) @cname("sgl_scissor_rectf");
extern fn void enable_texture() @cname("sgl_enable_texture");
extern fn void disable_texture() @cname("sgl_disable_texture");
extern fn void texture(SgView tex_view, SgSampler smp) @cname("sgl_texture");
extern fn void layer(CInt layer_id) @cname("sgl_layer");
extern fn void load_default_pipeline() @cname("sgl_load_default_pipeline");
extern fn void load_pipeline(SglPipeline pip) @cname("sgl_load_pipeline");
extern fn void push_pipeline() @cname("sgl_push_pipeline");
extern fn void pop_pipeline() @cname("sgl_pop_pipeline");
extern fn void matrix_mode_modelview() @cname("sgl_matrix_mode_modelview");
extern fn void matrix_mode_projection() @cname("sgl_matrix_mode_projection");
extern fn void matrix_mode_texture() @cname("sgl_matrix_mode_texture");
extern fn void load_identity() @cname("sgl_load_identity");
extern fn void load_matrix(float* m) @cname("sgl_load_matrix");
extern fn void load_transpose_matrix(float* m) @cname("sgl_load_transpose_matrix");
extern fn void mult_matrix(float* m) @cname("sgl_mult_matrix");
extern fn void mult_transpose_matrix(float* m) @cname("sgl_mult_transpose_matrix");
extern fn void rotate(float angle_rad, float x, float y, float z) @cname("sgl_rotate");
extern fn void scale(float x, float y, float z) @cname("sgl_scale");
extern fn void translate(float x, float y, float z) @cname("sgl_translate");
extern fn void frustum(float l, float r, float b, float t, float n, float f) @cname("sgl_frustum");
extern fn void ortho(float l, float r, float b, float t, float n, float f) @cname("sgl_ortho");
extern fn void perspective(float fov_y, float aspect, float z_near, float z_far) @cname("sgl_perspective");
extern fn void lookat(float eye_x, float eye_y, float eye_z, float center_x, float center_y, float center_z, float up_x, float up_y, float up_z) @cname("sgl_lookat");
extern fn void push_matrix() @cname("sgl_push_matrix");
extern fn void pop_matrix() @cname("sgl_pop_matrix");
extern fn void t2f(float u, float v) @cname("sgl_t2f");
extern fn void c3f(float r, float g, float b) @cname("sgl_c3f");
extern fn void c4f(float r, float g, float b, float a) @cname("sgl_c4f");
extern fn void c3b(char r, char g, char b) @cname("sgl_c3b");
extern fn void c4b(char r, char g, char b, char a) @cname("sgl_c4b");
extern fn void c1i(uint rgba) @cname("sgl_c1i");
extern fn void point_size(float s) @cname("sgl_point_size");
extern fn void begin_points() @cname("sgl_begin_points");
extern fn void begin_lines() @cname("sgl_begin_lines");
extern fn void begin_line_strip() @cname("sgl_begin_line_strip");
extern fn void begin_triangles() @cname("sgl_begin_triangles");
extern fn void begin_triangle_strip() @cname("sgl_begin_triangle_strip");
extern fn void begin_quads() @cname("sgl_begin_quads");
extern fn void v2f(float x, float y) @cname("sgl_v2f");
extern fn void v3f(float x, float y, float z) @cname("sgl_v3f");
extern fn void v2f_t2f(float x, float y, float u, float v) @cname("sgl_v2f_t2f");
extern fn void v3f_t2f(float x, float y, float z, float u, float v) @cname("sgl_v3f_t2f");
extern fn void v2f_c3f(float x, float y, float r, float g, float b) @cname("sgl_v2f_c3f");
extern fn void v2f_c3b(float x, float y, char r, char g, char b) @cname("sgl_v2f_c3b");
extern fn void v2f_c4f(float x, float y, float r, float g, float b, float a) @cname("sgl_v2f_c4f");
extern fn void v2f_c4b(float x, float y, char r, char g, char b, char a) @cname("sgl_v2f_c4b");
extern fn void v2f_c1i(float x, float y, uint rgba) @cname("sgl_v2f_c1i");
extern fn void v3f_c3f(float x, float y, float z, float r, float g, float b) @cname("sgl_v3f_c3f");
extern fn void v3f_c3b(float x, float y, float z, char r, char g, char b) @cname("sgl_v3f_c3b");
extern fn void v3f_c4f(float x, float y, float z, float r, float g, float b, float a) @cname("sgl_v3f_c4f");
extern fn void v3f_c4b(float x, float y, float z, char r, char g, char b, char a) @cname("sgl_v3f_c4b");
extern fn void v3f_c1i(float x, float y, float z, uint rgba) @cname("sgl_v3f_c1i");
extern fn void v2f_t2f_c3f(float x, float y, float u, float v, float r, float g, float b) @cname("sgl_v2f_t2f_c3f");
extern fn void v2f_t2f_c3b(float x, float y, float u, float v, char r, char g, char b) @cname("sgl_v2f_t2f_c3b");
extern fn void v2f_t2f_c4f(float x, float y, float u, float v, float r, float g, float b, float a) @cname("sgl_v2f_t2f_c4f");
extern fn void v2f_t2f_c4b(float x, float y, float u, float v, char r, char g, char b, char a) @cname("sgl_v2f_t2f_c4b");
extern fn void v2f_t2f_c1i(float x, float y, float u, float v, uint rgba) @cname("sgl_v2f_t2f_c1i");
extern fn void v3f_t2f_c3f(float x, float y, float z, float u, float v, float r, float g, float b) @cname("sgl_v3f_t2f_c3f");
extern fn void v3f_t2f_c3b(float x, float y, float z, float u, float v, char r, char g, char b) @cname("sgl_v3f_t2f_c3b");
extern fn void v3f_t2f_c4f(float x, float y, float z, float u, float v, float r, float g, float b, float a) @cname("sgl_v3f_t2f_c4f");
extern fn void v3f_t2f_c4b(float x, float y, float z, float u, float v, char r, char g, char b, char a) @cname("sgl_v3f_t2f_c4b");
extern fn void v3f_t2f_c1i(float x, float y, float z, float u, float v, uint rgba) @cname("sgl_v3f_t2f_c1i");
extern fn void end() @cname("sgl_end");

enum SglLogItem : const int
{
    OK = 0,
    MALLOC_FAILED = 1,
    MAKE_PIPELINE_FAILED = 2,
    PIPELINE_POOL_EXHAUSTED = 3,
    ADD_COMMIT_LISTENER_FAILED = 4,
    CONTEXT_POOL_EXHAUSTED = 5,
    CANNOT_DESTROY_DEFAULT_CONTEXT = 6,
}

struct SglLogger
{
    LogCb func;
    void* user_data;
}

struct SglPipeline
{
    uint id;
}

struct SglContext
{
    uint id;
}

struct SglError
{
    bool _any;
    bool vertices_full;
    bool uniforms_full;
    bool commands_full;
    bool stack_overflow;
    bool stack_underflow;
    bool no_context;
}

struct SglContextDesc
{
    CInt max_vertices;
    CInt max_commands;
    SgPixelFormat color_format;
    SgPixelFormat depth_format;
    CInt sample_count;
}

struct SglAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct SglDesc
{
    CInt max_vertices;
    CInt max_commands;
    CInt context_pool_size;
    CInt pipeline_pool_size;
    SgPixelFormat color_format;
    SgPixelFormat depth_format;
    CInt sample_count;
    SgFaceWinding face_winding;
    SglAllocator allocator;
    SglLogger logger;
}

alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);
alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);

