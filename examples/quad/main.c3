//------------------------------------------------------------------------------
//  quad/main.c3
//
//  Simple 2D rendering with vertex- and index-buffer.
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

fn void init()
{
    gfx::setup(&&gfx::Desc {
        .environment = glue::environment(),
        .logger = { .func = &log::func },
    });

    // a vertex buffer with 4 vertices
    float[*] vertices = {
        // positions         colors
        -0.5,  0.5, 0.5,     1.0, 0.0, 0.0, 1.0,
         0.5,  0.5, 0.5,     0.0, 1.0, 0.0, 1.0,
         0.5, -0.5, 0.5,     0.0, 0.0, 1.0, 1.0,
        -0.5, -0.5, 0.5,     1.0, 1.0, 0.0, 1.0,
    };
    state.bind.vertex_buffers[0] = gfx::make_buffer(&&BufferDesc {
        .data = { .ptr = &vertices, .size = $typeof(vertices).sizeof },
    });

    // an index buffer
    ushort[*] indices = { 0, 1, 2,  0, 2, 3 };
    state.bind.index_buffer = gfx::make_buffer(&&BufferDesc {
        .type = buffer_type::INDEXBUFFER,
        .data = { .ptr = &indices, .size = $typeof(indices).sizeof },
    });

    // a shader and pipeline object
    state.pip = gfx::make_pipeline(&&PipelineDesc {
        .shader = gfx::make_shader(&&quad_shader_desc(gfx::query_backend())),
        .index_type = index_type::UINT16,
        .layout = {
            .attrs = {
                [ATTR_QUAD_POSITION] = { .format = vertex_format::FLOAT3 },
                [ATTR_QUAD_COLOR0] = { .format = vertex_format::FLOAT4 },
            },
        },
    });

    // a pass action to clear framebuffer to black
    state.pass_action = {
        .colors = {
            [0] = { .load_action = load_action::CLEAR, .clear_value = { .r = 0, .g = 0, .b = 0, .a = 1 }},
        },
    };
}

fn void frame()
{
    gfx::begin_pass(&&Pass { .action = state.pass_action, .swapchain = glue::swapchain() });
    gfx::apply_pipeline(state.pip);
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
        .window_title = "quad",
        .icon = { .sokol_default = true },
        .logger = { .func = &log::func },
    });
}
