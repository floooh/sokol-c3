//------------------------------------------------------------------------------
//  noninterleaved/main.c3
//
//  How to use non-interleaved vertex data (vertex components in
//  separate non-interleaved chunks in the same vertex buffers). Note
//  that only 8 separate chunks are currently possible because there
//  are 8 vertex buffer bind slots in sg_bindings, but you can keep
//  several related vertex components interleaved in the same chunk.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

def Mat4 = sokol_math::Mat4;

struct State
{
    gfx::Pipeline pip;
    gfx::Bindings bind;
    float rx, ry;
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
        // positions
        -1.0, -1.0, -1.0,   1.0, -1.0, -1.0,   1.0,  1.0, -1.0,  -1.0,  1.0, -1.0,
        -1.0, -1.0,  1.0,   1.0, -1.0,  1.0,   1.0,  1.0,  1.0,  -1.0,  1.0,  1.0,
        -1.0, -1.0, -1.0,  -1.0,  1.0, -1.0,  -1.0,  1.0,  1.0,  -1.0, -1.0,  1.0,
         1.0, -1.0, -1.0,   1.0,  1.0, -1.0,   1.0,  1.0,  1.0,   1.0, -1.0,  1.0,
        -1.0, -1.0, -1.0,  -1.0, -1.0,  1.0,   1.0, -1.0,  1.0,   1.0, -1.0, -1.0,
        -1.0,  1.0, -1.0,  -1.0,  1.0,  1.0,   1.0,  1.0,  1.0,   1.0,  1.0, -1.0,

        // colors
         1.0, 0.5, 0.0, 1.0,  1.0, 0.5, 0.0, 1.0,  1.0, 0.5, 0.0, 1.0,  1.0, 0.5, 0.0, 1.0,
         0.5, 1.0, 0.0, 1.0,  0.5, 1.0, 0.0, 1.0,  0.5, 1.0, 0.0, 1.0,  0.5, 1.0, 0.0, 1.0,
         0.5, 0.0, 1.0, 1.0,  0.5, 0.0, 1.0, 1.0,  0.5, 0.0, 1.0, 1.0,  0.5, 0.0, 1.0, 1.0,
         1.0, 0.5, 1.0, 1.0,  1.0, 0.5, 1.0, 1.0,  1.0, 0.5, 1.0, 1.0,  1.0, 0.5, 1.0, 1.0,
         0.5, 1.0, 1.0, 1.0,  0.5, 1.0, 1.0, 1.0,  0.5, 1.0, 1.0, 1.0,  0.5, 1.0, 1.0, 1.0,
         1.0, 1.0, 0.5, 1.0,  1.0, 1.0, 0.5, 1.0,  1.0, 1.0, 0.5, 1.0,  1.0, 1.0, 0.5, 1.0,
    };
    gfx::Buffer vbuf = gfx::make_buffer(&&BufferDesc {
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
    gfx::Buffer ibuf = gfx::make_buffer(&&BufferDesc {
        .type = buffer_type::INDEXBUFFER,
        .data = { .ptr = &indices, .size = $typeof(indices).sizeof },
    });

    // shader and pipeline object
    state.pip = gfx::make_pipeline(&&PipelineDesc {
        .shader = gfx::make_shader(&&noninterleaved_shader_desc(gfx::query_backend())),
        .layout = {
            // note how the vertex components are pulled from different buffer bind slots
            .attrs = {
                // positions come from vertex buffer slot 0
                [ATTR_NONINTERLEAVED_POSITION] = { .format = vertex_format::FLOAT3, .buffer_index = 0 },
                // colors come from vertex buffer slot 1
                [ATTR_NONINTERLEAVED_COLOR0] = { .format = vertex_format::FLOAT4, .buffer_index = 1 },
            },
        },
        .index_type = index_type::UINT16,
        .cull_mode = cull_mode::BACK,
        .depth = {
            .compare = compare_func::LESS_EQUAL,
            .write_enabled = true,
        },
    });

    // fill the resource bindings, note how the same vertex
    // buffer is bound to the first two slots, and the vertex-buffer-offsets
    // are used to point to the position- and color-components.
    state.bind = {
        .vertex_buffers = {
            [0] = vbuf,
            [1] = vbuf,
        },
        .vertex_buffer_offsets = {
            // position components are at start of buffer
            [0] = 0,
            // byte offset of color components in buffer
            [1] = 24 * 3 * float.sizeof,
        },
        .index_buffer = ibuf,
    };
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

    // default pass-action clears to grey
    gfx::begin_pass(&&Pass { .swapchain = glue::swapchain() });
    gfx::apply_pipeline(state.pip);
    gfx::apply_bindings(&state.bind);
    gfx::apply_uniforms(UB_VS_PARAMS, &&gfx::Range { .ptr = &vs_params, .size = $typeof(vs_params).sizeof });
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
        .window_title = "noninterleaved",
        .icon = { .sokol_default = true },
        .logger = { .func = &log::func },
    });
}
