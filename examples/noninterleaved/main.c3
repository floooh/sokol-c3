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

struct State
{
    SgPipeline pip;
    SgBindings bind;
    float rx, ry;
}

State state;

fn void init()
{
    sg::setup(&&(SgDesc) {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
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
    SgBuffer vbuf = sg::make_buffer(&&(SgBufferDesc) {
        .data = { .ptr = &vertices, .size = $sizeof(vertices) },
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
    SgBuffer ibuf = sg::make_buffer(&&(SgBufferDesc) {
        .usage = { .index_buffer = true },
        .data = { .ptr = &indices, .size = $sizeof(indices) },
    });

    // shader and pipeline object
    state.pip = sg::make_pipeline(&&(SgPipelineDesc) {
        .shader = sg::make_shader(&&noninterleaved_shader_desc(sg::query_backend())),
        .layout = {
            // note how the vertex components are pulled from different buffer bind slots
            .attrs = {
                // positions come from vertex buffer slot 0
                [ATTR_NONINTERLEAVED_POSITION] = { .format = FLOAT3, .buffer_index = 0 },
                // colors come from vertex buffer slot 1
                [ATTR_NONINTERLEAVED_COLOR0] = { .format = FLOAT4, .buffer_index = 1 },
            },
        },
        .index_type = UINT16,
        .cull_mode = BACK,
        .depth = {
            .compare = LESS_EQUAL,
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
    float t = (float)sapp::frame_duration() * 60;
    state.rx += 1.0 * t;
    state.ry += 2.0 * t;

    // vertex shader uniform with model-view-projection matrix
    VsParams vs_params = {
        .mvp = compute_mvp(state.rx, state.ry),
    };

    // default pass-action clears to grey
    sg::begin_pass(&&(SgPass) { .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.pip);
    sg::apply_bindings(&state.bind);
    sg::apply_uniforms(UB_VS_PARAMS, &&(SgRange) { .ptr = &vs_params, .size = $sizeof(vs_params) });
    sg::draw(0, 36, 1);
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
    sapp::run(&&(SappDesc) {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "noninterleaved",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
