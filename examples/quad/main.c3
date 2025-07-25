//------------------------------------------------------------------------------
//  quad/main.c3
//
//  Simple 2D rendering with vertex- and index-buffer.
//------------------------------------------------------------------------------

module main;
import sokol;

struct State
{
    sg::Pipeline pip;
    sg::Bindings bind;
    sg::PassAction pass_action;
}

State state;

fn void init()
{
    sg::setup(&&(sg::Desc) {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    // a vertex buffer with 4 vertices
    float[*] vertices = {
        // positions         colors
        -0.5,  0.5, 0.5,     1.0, 0.0, 0.0, 1.0,
         0.5,  0.5, 0.5,     0.0, 1.0, 0.0, 1.0,
         0.5, -0.5, 0.5,     0.0, 0.0, 1.0, 1.0,
        -0.5, -0.5, 0.5,     1.0, 1.0, 0.0, 1.0,
    };
    state.bind.vertex_buffers[0] = sg::make_buffer(&&(BufferDesc) {
        .data = { .ptr = &vertices, .size = $sizeof(vertices) },
    });

    // an index buffer
    ushort[*] indices = { 0, 1, 2,  0, 2, 3 };
    state.bind.index_buffer = sg::make_buffer(&&(BufferDesc) {
        .usage = { .index_buffer = true },
        .data = { .ptr = &indices, .size = $sizeof(indices) },
    });

    // a shader and pipeline object
    state.pip = sg::make_pipeline(&&(PipelineDesc) {
        .shader = sg::make_shader(&&quad_shader_desc(sg::query_backend())),
        .index_type = index_type::UINT16,
        .layout = {
            .attrs = {
                [ATTR_QUAD_POSITION] = { .format = vertex_format::FLOAT3 },
                [ATTR_QUAD_COLOR0] = { .format = vertex_format::FLOAT4 },
            },
        },
    });

    // a pass action to clear framebuffer to black
    state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { .r = 0, .g = 0, .b = 0, .a = 1 }};
}

fn void frame()
{
    sg::begin_pass(&&(Pass) { .action = state.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.pip);
    sg::apply_bindings(&state.bind);
    sg::draw(0, 6, 1);
    sg::end_pass();
    sg::commit();
}

fn void cleanup()
{
    sg::shutdown();
}

fn void main()
{
    sapp::run(&&(sapp::Desc) {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .window_title = "quad",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
