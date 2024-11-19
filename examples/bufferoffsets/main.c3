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
    gfx::Pipeline pip;
    gfx::Bindings bind;
    gfx::PassAction pass_action;
}

State state;

struct Vertex
{
    float x, y, r, g, b;
}

fn void init()
{
    gfx::setup(&&gfx::Desc {
        .environment = glue::environment(),
        .logger = { .func = &log::func },
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

    state.bind.vertex_buffers[0] = gfx::make_buffer(&&BufferDesc {
        .data = { .ptr = &vertices, .size = $typeof(vertices).sizeof },
    });
    state.bind.index_buffer = gfx::make_buffer(&&BufferDesc {
        .type = buffer_type::INDEXBUFFER,
        .data = { .ptr = &indices, .size = $typeof(indices).sizeof },
    });

    // a shader and pipeline to render 2D shapes
    state.pip = gfx::make_pipeline(&&PipelineDesc {
        .shader = gfx::make_shader(&&bufferoffsets_shader_desc(gfx::query_backend())),
        .index_type = index_type::UINT16,
        .layout = {
            .attrs = {
                [ATTR_BUFFEROFFSETS_POSITION] = { .format = vertex_format::FLOAT2 },
                [ATTR_BUFFEROFFSETS_COLOR0] = { .format = vertex_format::FLOAT3 },
            },
        },
    });

    // pass action for clearing to blue-ish
    state.pass_action = {
        .colors = {
            [0] = { .load_action = load_action::CLEAR, .clear_value = { .r = 0.5, .g = 0.5, .b = 1, .a = 1 }},
        },
    };
}

fn void frame()
{
    gfx::begin_pass(&&Pass { .action = state.pass_action, .swapchain = glue::swapchain() });
    gfx::apply_pipeline(state.pip);

    // render the triangle
    state.bind.vertex_buffer_offsets[0] = 0;
    state.bind.index_buffer_offset = 0;
    gfx::apply_bindings(&state.bind);
    gfx::draw(0, 3, 1);

    // render the quad
    state.bind.vertex_buffer_offsets[0] = 3 * Vertex.sizeof;
    state.bind.index_buffer_offset = 3 * ushort.sizeof;
    gfx::apply_bindings(&state.bind);
    gfx::draw(0, 6, 1);

    gfx::end_pass();
    gfx::commit();
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
        .window_title = "bufferoffsets",
        .icon = { .sokol_default = true },
        .logger = { .func = &log::func },
    });
}
