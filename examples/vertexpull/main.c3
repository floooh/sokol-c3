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
    sg::PassAction pass_action;
    sg::Pipeline pip;
    sg::Bindings bind;
}

State state;

fn void init()
{
    sg::setup(&&sg::Desc {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    // if storage buffers are not supported on the current backend, just
    // render a red screen
    if (!sg::query_features().compute)
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
    state.bind.storage_buffers[SBUF_SSBO] = sg::make_buffer(&&BufferDesc {
        .type = buffer_type::STORAGEBUFFER,
        .data = { .ptr = &vertices, .size = $sizeof(vertices) },
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
    state.bind.index_buffer = sg::make_buffer(&&BufferDesc {
        .type = buffer_type::INDEXBUFFER,
        .data = { .ptr = &indices, .size = $sizeof(indices) },
    });

    // a shader and pipeline object, not that there is no vertex layout definition
    state.pip = sg::make_pipeline(&&PipelineDesc {
        .shader = sg::make_shader(&&vertexpull_shader_desc(sg::query_backend())),
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
    float t = (float)sapp::frame_duration() * 60;
    state.rx += 1.0 * t;
    state.ry += 2.0 * t;

    // vertex shader uniform with model-view-projection matrix
    VsParams vs_params = {
        .mvp = compute_mvp(state.rx, state.ry),
    };

    sg::begin_pass(&&Pass { .action = state.pass_action, .swapchain = sglue::swapchain() });
    if (sg::query_features().compute)
    {
        sg::apply_pipeline(state.pip);
        sg::apply_bindings(&state.bind);
        sg::apply_uniforms(UB_VS_PARAMS, &&sg::Range { .ptr = &vs_params, .size = $sizeof(vs_params) } );
        sg::draw(0, 36, 1);
    }
    sg::end_pass();
    sg::commit();
}

fn Mat4 compute_mvp(float rx, float ry)
{
    Mat4 proj = sokol_math::persp(fov: 60, aspect: sapp::widthf() / sapp::heightf(), near: 0.01, far: 10.0);
    Mat4 view = sokol_math::lookat(eye: {0.0, 1.5, 6.0}, center: {}, up: {0.0, 1.0, 0.0});
    Mat4 view_proj = sokol_math::mul(proj, view);
    Mat4 rxm = sokol_math::rotate(rx, {1.0, 0.0, 0.0});
    Mat4 rym = sokol_math::rotate(ry, {0.0, 1.0, 0.0});
    Mat4 model = sokol_math::mul(rxm, rym);
    return sokol_math::mul(view_proj, model);
}

fn void cleanup()
{
    sg::shutdown();
}

fn void main()
{
    sapp::run(&&sapp::Desc {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "vertexpull",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
