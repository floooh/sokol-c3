//------------------------------------------------------------------------------
//  vertexpull/main.c3
//
//  Pull vertices from a storage buffer instead of using fixed-function
//  vertex input.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

def Mat4 = sokol_math::Mat4;

struct State
{
    float rx, ry;
    gfx::PassAction pass_action;
    gfx::Pipeline pip;
    gfx::Bindings bind;
}

State state;

fn void init()
{
    gfx::setup(&&gfx::Desc {
        .environment = glue::environment(),
        .logger = { .func = &log::func },
    });

    // if storage buffers are not supported on the current backend, just
    // render a red screen
    if (!gfx::query_features().storage_buffer)
    {
        state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 1, 0, 0, 1 } };
        return;
    }
    // otherwise use a regular clear color...
    state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.75, 0.5, 0.25, 1 } };

    // a storage buffer with cube vertices, this is using the code-generated
    // per-vertex struct from the shader
    SbVertex[*] vertices = {
        { .pos = { -1.0, -1.0, -1.0 }, .color = { 1.0, 0.0, 0.0, 1.0} },
        { .pos = {  1.0, -1.0, -1.0 }, .color = { 1.0, 0.0, 0.0, 1.0} },
        { .pos = {  1.0,  1.0, -1.0 }, .color = { 1.0, 0.0, 0.0, 1.0} },
        { .pos = { -1.0,  1.0, -1.0 }, .color = { 1.0, 0.0, 0.0, 1.0} },
        { .pos = { -1.0, -1.0,  1.0 }, .color = { 0.0, 1.0, 0.0, 1.0} },
        { .pos = {  1.0, -1.0,  1.0 }, .color = { 0.0, 1.0, 0.0, 1.0} },
        { .pos = {  1.0,  1.0,  1.0 }, .color = { 0.0, 1.0, 0.0, 1.0} },
        { .pos = { -1.0,  1.0,  1.0 }, .color = { 0.0, 1.0, 0.0, 1.0} },
        { .pos = { -1.0, -1.0, -1.0 }, .color = { 0.0, 0.0, 1.0, 1.0} },
        { .pos = { -1.0,  1.0, -1.0 }, .color = { 0.0, 0.0, 1.0, 1.0} },
        { .pos = { -1.0,  1.0,  1.0 }, .color = { 0.0, 0.0, 1.0, 1.0} },
        { .pos = { -1.0, -1.0,  1.0 }, .color = { 0.0, 0.0, 1.0, 1.0} },
        { .pos = {  1.0, -1.0, -1.0 }, .color = { 1.0, 0.5, 0.0, 1.0} },
        { .pos = {  1.0,  1.0, -1.0 }, .color = { 1.0, 0.5, 0.0, 1.0} },
        { .pos = {  1.0,  1.0,  1.0 }, .color = { 1.0, 0.5, 0.0, 1.0} },
        { .pos = {  1.0, -1.0,  1.0 }, .color = { 1.0, 0.5, 0.0, 1.0} },
        { .pos = { -1.0, -1.0, -1.0 }, .color = { 0.0, 0.5, 1.0, 1.0} },
        { .pos = { -1.0, -1.0,  1.0 }, .color = { 0.0, 0.5, 1.0, 1.0} },
        { .pos = {  1.0, -1.0,  1.0 }, .color = { 0.0, 0.5, 1.0, 1.0} },
        { .pos = {  1.0, -1.0, -1.0 }, .color = { 0.0, 0.5, 1.0, 1.0} },
        { .pos = { -1.0,  1.0, -1.0 }, .color = { 1.0, 0.0, 0.5, 1.0} },
        { .pos = { -1.0,  1.0,  1.0 }, .color = { 1.0, 0.0, 0.5, 1.0} },
        { .pos = {  1.0,  1.0,  1.0 }, .color = { 1.0, 0.0, 0.5, 1.0} },
        { .pos = {  1.0,  1.0, -1.0 }, .color = { 1.0, 0.0, 0.5, 1.0} },
    };
    state.bind.storage_buffers[SBUF_SSBO] = gfx::make_buffer(&&BufferDesc {
        .type = buffer_type::STORAGEBUFFER,
        .data = { .ptr = &vertices, .size = $typeof(vertices).sizeof },
    });

    // a regular index buffer
    ushort[*] indices = {
        0, 1, 2,  0, 2, 3,
        6, 5, 4,  7, 6, 4,
        8, 9, 10,  8, 10, 11,
        14, 13, 12,  15, 14, 12,
        16, 17, 18,  16, 18, 19,
        22, 21, 20,  23, 22, 20,
    };
    state.bind.index_buffer = gfx::make_buffer(&&BufferDesc {
        .type = buffer_type::INDEXBUFFER,
        .data = { .ptr = &indices, .size = $typeof(indices).sizeof },
    });

    // a shader and pipeline object, not that there is no vertex layout definition
    state.pip = gfx::make_pipeline(&&PipelineDesc {
        .shader = gfx::make_shader(&&vertexpull_shader_desc(gfx::query_backend())),
        .index_type = index_type::UINT16,
        .cull_mode = cull_mode::BACK,
        .depth = {
            .write_enabled = true,
            .compare = compare_func::LESS_EQUAL,
        }
    });
}

fn void frame()
{
    float t = (float)app::frame_duration() * 60;
    state.rx += 1.0 * t;
    state.ry += 2.0 * t;

    // vertex shader uniform with model-view-projection matrix
    VsParams vs_params = {
        .mvp = compute_mvp(state.rx, state.ry),
    };

    gfx::begin_pass(&&Pass { .action = state.pass_action, .swapchain = glue::swapchain() });
    if (gfx::query_features().storage_buffer)
    {
        gfx::apply_pipeline(state.pip);
        gfx::apply_bindings(&state.bind);
        gfx::apply_uniforms(UB_VS_PARAMS, &&gfx::Range { .ptr = &vs_params, .size = $typeof(vs_params).sizeof } );
        gfx::draw(0, 36, 1);
    }
    gfx::end_pass();
    gfx::commit();
}

fn Mat4 compute_mvp(float rx, float ry)
{
    Mat4 proj = sokol_math::persp(fov: 60, aspect: app::widthf() / app::heightf(), near: 0.01, far: 10.0);
    Mat4 view = sokol_math::lookat(eye: {0.0, 1.5, 6.0}, center: {}, up: {0.0, 1.0, 0.0});
    Mat4 view_proj = sokol_math::mul(proj, view);
    Mat4 rxm = sokol_math::rotate(rx, {1.0, 0.0, 0.0});
    Mat4 rym = sokol_math::rotate(ry, {0.0, 1.0, 0.0});
    Mat4 model = sokol_math::mul(rxm, rym);
    return sokol_math::mul(view_proj, model);
}

fn void cleanup()
{
    gfx::shutdown();
}

fn void main()
{
    app::run(&&app::Desc {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "vertexpull",
        .icon = { .sokol_default = true },
        .logger = { .func = &log::func },
    });
}
