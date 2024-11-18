//------------------------------------------------------------------------------
//  triangle/main.c3
//
//  Hello Triangle sample.
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

    // a vertex buffer with 3 vertices
    float[*] vertices = {
        // positions         // colors
         0.0,  0.5, 0.5,     1.0, 0.0, 0.0, 1.0,
         0.5, -0.5, 0.5,     0.0, 1.0, 0.0, 1.0,
        -0.5, -0.5, 0.5,     0.0, 0.0, 1.0, 1.0,
    };
    state.bind.vertex_buffers[0] = gfx::make_buffer(&&BufferDesc {
        .data = { .ptr = &vertices, .size = $typeof(vertices).sizeof },
    });

    // create a shader and pipeline object (default render states are fine for triangle)
    state.pip = gfx::make_pipeline(&&PipelineDesc {
        .shader = gfx::make_shader(&&triangle_shader_desc(gfx::query_backend())),
        .layout = {
            .attrs = {
                [ATTR_TRIANGLE_POSITION] = { .format = vertex_format::FLOAT3 },
                [ATTR_TRIANGLE_COLOR0] = { .format = vertex_format::FLOAT4 },
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
    gfx::draw(0, 3, 1);
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
        .width = 640,
        .height = 480,
        .window_title = "triangle",
        .icon = { .sokol_default = true },
        .logger = { .func = &log::func },
    });
}
