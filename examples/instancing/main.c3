//------------------------------------------------------------------------------
//  instancing/main.c3
//
//  Demonstrate simple hardware-instancing using a static geometry buffer
//  and a dynamic instance-data buffer.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

def Mat4 = sokol_math::Mat4;

const int MAX_PARTICLES = 512 * 1024;
const int NUM_PARTICLES_EMITTED_PER_FRAME = 10;

struct State
{
    sg::PassAction pass_action;
    sg::Pipeline pip;
    sg::Bindings bind;
    float ry;
    int cur_num_particles;
    Vec3[MAX_PARTICLES] pos;
    Vec3[MAX_PARTICLES] vel;
}

State state;

fn void init()
{
    sg::setup(&&sg::Desc {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    // a pass action for the default render pass
    state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0, 0, 0, 1 } };

    // vertex buffer for static geometry, goes into vertex-buffer-slot 0
    float r = 0.05;
    float[*] vertices = {
        // positions        colors
        0.0,   -r, 0.0,     1.0, 0.0, 0.0, 1.0,
           r, 0.0, r,       0.0, 1.0, 0.0, 1.0,
           r, 0.0, -r,      0.0, 0.0, 1.0, 1.0,
          -r, 0.0, -r,      1.0, 1.0, 0.0, 1.0,
          -r, 0.0, r,       0.0, 1.0, 1.0, 1.0,
        0.0,    r, 0.0,     1.0, 0.0, 1.0, 1.0,
    };
    state.bind.vertex_buffers[0] = sg::make_buffer(&&BufferDesc {
        .data = { .ptr = &vertices, .size = $sizeof(vertices) },
    });

    // index buffer for static geometry
    ushort[*] indices = {
        0, 1, 2,    0, 2, 3,    0, 3, 4,    0, 4, 1,
        5, 1, 2,    5, 2, 3,    5, 3, 4,    5, 4, 1,
    };
    state.bind.index_buffer = sg::make_buffer(&&BufferDesc {
        .type = buffer_type::INDEXBUFFER,
        .data = { .ptr = &indices, .size = $sizeof(indices) },
    });

    // empty, dynamic instance-data vertex buffer, goes into vertex-buffer-slot 1
    state.bind.vertex_buffers[1] = sg::make_buffer(&&BufferDesc {
        .size = MAX_PARTICLES * Vec3.sizeof,
        .usage = usage::STREAM,
    });

    // a shader and pipeline object
    state.pip = sg::make_pipeline(&&PipelineDesc {
        .shader = sg::make_shader(&&instancing_shader_desc(sg::query_backend())),
        .layout = {
            .buffers = {
                // vertex buffer at slot 1 must step per instance
                // NOTE: We have to use `stride` because `Vec3` is C3 vector
                //       which usually has size 16 bytes instead of 12 bytes.
                [1] = { .stride = Vec3.sizeof, .step_func = vertex_step::PER_INSTANCE },
            },
            .attrs = {
                [ATTR_INSTANCING_POS]      = { .format = vertex_format::FLOAT3, .buffer_index = 0 },
                [ATTR_INSTANCING_COLOR0]   = { .format = vertex_format::FLOAT4, .buffer_index = 0 },
                [ATTR_INSTANCING_INST_POS] = { .format = vertex_format::FLOAT3, .buffer_index = 1 },
            },
        },
        .index_type = index_type::UINT16,
        .cull_mode = cull_mode::BACK,
        .depth = {
            .compare = compare_func::LESS_EQUAL,
            .write_enabled = true,
        },
    });
}

fn void frame()
{
    float frame_time = (float)sapp::frame_duration();

    // emit new particles
    for (int i = 0; i < NUM_PARTICLES_EMITTED_PER_FRAME; i++)
    {
        if (state.cur_num_particles >= MAX_PARTICLES) break; 
        state.pos[state.cur_num_particles] = {};
        state.vel[state.cur_num_particles] = { rand(-0.5, 0.5), rand(2.0, 2.5), rand(-0.5, 0.5) };
        state.cur_num_particles++;
    }

    // update particle positions
    for (int i = 0; i < state.cur_num_particles; i++)
    {
        state.vel[i].y -= 1.0 * frame_time;
        // TODO: Can we get rid of casts to `float[<3>]` and then back to `Vec3`?
        state.pos[i] += (Vec3)((float[<3>])state.vel[i] * frame_time);
        // bounce back from ground
        if (state.pos[i].y < -2.0)
        {
            state.pos[i].y = -1.8;
            state.vel[i].y = -state.vel[i].y;
            state.vel[i] *= 0.8;
        }
    }

    // update instance data
    sg::update_buffer(state.bind.vertex_buffers[1], &&sg::Range {
        .ptr = &state.pos,
        .size = Vec3.sizeof * state.cur_num_particles,
    });

    // vertex shader uniform data with model-view-projection matrix
    Mat4 proj = sokol_math::persp(fov: 60.0, aspect: sapp::widthf() / sapp::heightf(), near: 0.01, far: 50.0);
    Mat4 view = sokol_math::lookat(eye: {0.0, 1.5, 12.0}, center: {}, up: sokol_math::up());
    Mat4 view_proj = sokol_math::mul(proj, view);
    state.ry += 60.0 * frame_time;
    VsParams vs_params = {
        .mvp = sokol_math::mul(view_proj, sokol_math::rotate(state.ry, { 0.0, 1.0, 0.0 })),
    };

    // ...and draw
    sg::begin_pass(&&Pass { .action = state.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.pip);
    sg::apply_bindings(&state.bind);
    sg::apply_uniforms(UB_VS_PARAMS, &&sg::Range { .ptr = &vs_params, .size = $sizeof(vs_params) });
    sg::draw(0, 24, state.cur_num_particles);
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
        .sample_count = 4,
        .window_title = "instancing",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}

fn uint xorshift32()
{
    static uint x = 0x12345678;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    return x;
}

fn float rand(float min_val, float max_val)
{
    uint r = xorshift32();
    return ((float)(r & 0xFFFF) / 0x10000) * (max_val - min_val) + min_val;
}
