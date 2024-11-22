//------------------------------------------------------------------------------
//  cube/main.c3
//
//  Renders a rotating cube.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

def Mat4 = sokol_math::Mat4;

struct State
{
    float rx, ry;
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

    // cube vertex buffer
    float[*] vertices = {
        -1.0, -1.0, -1.0,   1.0, 0.0, 0.0, 1.0,
         1.0, -1.0, -1.0,   1.0, 0.0, 0.0, 1.0,
         1.0,  1.0, -1.0,   1.0, 0.0, 0.0, 1.0,
        -1.0,  1.0, -1.0,   1.0, 0.0, 0.0, 1.0,

        -1.0, -1.0,  1.0,   0.0, 1.0, 0.0, 1.0,
         1.0, -1.0,  1.0,   0.0, 1.0, 0.0, 1.0,
         1.0,  1.0,  1.0,   0.0, 1.0, 0.0, 1.0,
        -1.0,  1.0,  1.0,   0.0, 1.0, 0.0, 1.0,

        -1.0, -1.0, -1.0,   0.0, 0.0, 1.0, 1.0,
        -1.0,  1.0, -1.0,   0.0, 0.0, 1.0, 1.0,
        -1.0,  1.0,  1.0,   0.0, 0.0, 1.0, 1.0,
        -1.0, -1.0,  1.0,   0.0, 0.0, 1.0, 1.0,

        1.0, -1.0, -1.0,    1.0, 0.5, 0.0, 1.0,
        1.0,  1.0, -1.0,    1.0, 0.5, 0.0, 1.0,
        1.0,  1.0,  1.0,    1.0, 0.5, 0.0, 1.0,
        1.0, -1.0,  1.0,    1.0, 0.5, 0.0, 1.0,

        -1.0, -1.0, -1.0,   0.0, 0.5, 1.0, 1.0,
        -1.0, -1.0,  1.0,   0.0, 0.5, 1.0, 1.0,
         1.0, -1.0,  1.0,   0.0, 0.5, 1.0, 1.0,
         1.0, -1.0, -1.0,   0.0, 0.5, 1.0, 1.0,

        -1.0,  1.0, -1.0,   1.0, 0.0, 0.5, 1.0,
        -1.0,  1.0,  1.0,   1.0, 0.0, 0.5, 1.0,
         1.0,  1.0,  1.0,   1.0, 0.0, 0.5, 1.0,
         1.0,  1.0, -1.0,   1.0, 0.0, 0.5, 1.0,
    };
    state.bind.vertex_buffers[0] = gfx::make_buffer(&&BufferDesc {
        .data = { .ptr = &vertices, .size = $typeof(vertices).sizeof },
    });

    // create an index buffer for the cube
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

    // shader and pipeline object
    state.pip = gfx::make_pipeline(&&PipelineDesc {
        .shader = gfx::make_shader(&&cube_shader_desc(gfx::query_backend())),
        .index_type = index_type::UINT16,
        .layout = {
            // test to provide buffer stride, but no attr offsets
            .buffers = {
                [0] = { .stride = 28 },
            },
            .attrs = {
                [ATTR_CUBE_POSITION] = { .format = vertex_format::FLOAT3 },
                [ATTR_CUBE_COLOR0] = { .format = vertex_format::FLOAT4 },
            },
        },
        .cull_mode = cull_mode::BACK,
        .depth = {
            .write_enabled = true,
            .compare = compare_func::LESS_EQUAL,
        },
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
    gfx::PassAction pass_action = {
        .colors = {
            [0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.5, 0.75, 1.0 } },
        },
    };
    gfx::begin_pass(&&Pass { .action = pass_action, .swapchain = glue::swapchain() });
    gfx::apply_pipeline(state.pip);
    gfx::apply_bindings(&state.bind);
    gfx::apply_uniforms(UB_VS_PARAMS, &&gfx::Range { .ptr = &vs_params, .size = $typeof(vs_params).sizeof } );
    gfx::draw(0, 36, 1);
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
        .window_title = "cube",
        .icon = { .sokol_default = true },
        .logger = { .func = &log::func },
    });
}
