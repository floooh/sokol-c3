//------------------------------------------------------------------------------
//  bufferoffsets/main.c3
//
//  Render separate geometries in vertex- and index-buffers with
//  buffer offsets.
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

struct Vertex
{
    float x, y, r, g, b;
}

fn void init()
{
    sg::setup(&&sg::Desc {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    // a 2D triangle and quad in 1 vertex buffer and 1 index buffer
    Vertex[7] vertices = {
        // triangle
        {  0.0,   0.55,  1.0, 0.0, 0.0 },
        {  0.25,  0.05,  0.0, 1.0, 0.0 },
        { -0.25,  0.05,  0.0, 0.0, 1.0 },

        // quad
        { -0.25, -0.05,  0.0, 0.0, 1.0 },
        {  0.25, -0.05,  0.0, 1.0, 0.0 },
        {  0.25, -0.55,  1.0, 0.0, 0.0 },
        { -0.25, -0.55,  1.0, 1.0, 0.0 },
    };
    ushort[9] indices = {
        0, 1, 2,
        0, 1, 2, 0, 2, 3,
    };

    state.bind.vertex_buffers[0] = sg::make_buffer(&&BufferDesc {
        .data = { .ptr = &vertices, .size = $sizeof(vertices) },
    });
    state.bind.index_buffer = sg::make_buffer(&&BufferDesc {
        .usage = { .index_buffer = true },
        .data = { .ptr = &indices, .size = $sizeof(indices) },
    });

    // a shader and pipeline to render 2D shapes
    state.pip = sg::make_pipeline(&&PipelineDesc {
        .shader = sg::make_shader(&&bufferoffsets_shader_desc(sg::query_backend())),
        .index_type = index_type::UINT16,
        .layout = {
            .attrs = {
                [ATTR_BUFFEROFFSETS_POSITION] = { .format = vertex_format::FLOAT2 },
                [ATTR_BUFFEROFFSETS_COLOR0] = { .format = vertex_format::FLOAT3 },
            },
        },
    });

    // pass action for clearing to blue-ish
    state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { .r = 0.5, .g = 0.5, .b = 1, .a = 1 }};
}

fn void frame()
{
    sg::begin_pass(&&Pass { .action = state.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.pip);

    // render the triangle
    state.bind.vertex_buffer_offsets[0] = 0;
    state.bind.index_buffer_offset = 0;
    sg::apply_bindings(&state.bind);
    sg::draw(0, 3, 1);

    // render the quad
    state.bind.vertex_buffer_offsets[0] = 3 * Vertex.sizeof;
    state.bind.index_buffer_offset = 3 * ushort.sizeof;
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
    sapp::run(&&sapp::Desc {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .window_title = "bufferoffsets",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
