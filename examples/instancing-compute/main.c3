//------------------------------------------------------------------------------
//  instancing-compute/main.c3
//
//  Like instancing/main.c3, but using a compute shader to update
//  particle positions.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

alias Mat4 = sokol_math::Mat4;

const int MAX_PARTICLES = 512 * 1024;
const int NUM_PARTICLES_EMITTED_PER_FRAME = 10;

struct State {
    int num_particles;
    float ry;
    struct compute {
        sg::Pipeline pip;
        sg::Bindings bind;
    }
    struct display {
        sg::Pipeline pip;
        sg::Bindings bind;
        sg::PassAction pass_action;
    }
}

State state;

fn void init() {
    sg::setup(&&(sg::Desc){
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    // if compute shaders not supported, clear to red and early out
    if (!sg::query_features().compute) {
        state.display.pass_action = {
            .colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 1, 0, 0, 1 }, }
        };
        return;
    }

    // regular clear color
    state.display.pass_action = {
        .colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0, 0.1, 0.2, 1 } },
    };

    // a zero-initialized storage buffer for the particle state
    sg::Buffer sbuf = sg::make_buffer(&&(sg::BufferDesc){
        .usage = { .storage_buffer = true },
        .size = Particle.sizeof * MAX_PARTICLES,
        .label = "particle-buffer",
    });
    state.compute.bind.storage_buffers[SBUF_CS_SSBO] = sbuf;
    state.display.bind.storage_buffers[SBUF_VS_SSBO] = sbuf;

    // a compute shader and pipeline object for updating the particle state
    state.compute.pip = sg::make_pipeline(&&(sg::PipelineDesc){
        .compute = true,
        .shader = sg::make_shader(&&update_shader_desc(sg::query_backend())),
        .label = "update-pipeline",
    });

    // vertex and index-buffer for particle geometry
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
    state.display.bind.vertex_buffers[0] = sg::make_buffer(&&(sg::BufferDesc){
        .data = { .ptr = &vertices, .size = $sizeof(vertices) },
    });
    ushort[*] indices = {
        0, 1, 2,    0, 2, 3,    0, 3, 4,    0, 4, 1,
        5, 1, 2,    5, 2, 3,    5, 3, 4,    5, 4, 1,
    };
    state.display.bind.index_buffer = sg::make_buffer(&&(sg::BufferDesc){
        .usage = { .index_buffer = true },
        .data = { .ptr = &indices, .size = $sizeof(indices) },
    });

    // shader and pipeline for rendering the particles, this uses
    // the compute-updated storage buffer to provide the particle positions
    state.display.pip = sg::make_pipeline(&&(sg::PipelineDesc){
        .shader = sg::make_shader(&&display_shader_desc(sg::query_backend())),
        .layout = {
            .attrs = {
                [ATTR_DISPLAY_POS].format = vertex_format::FLOAT3,
                [ATTR_DISPLAY_COLOR0].format = vertex_format::FLOAT4,
            },
        },
        .index_type = index_type::UINT16,
        .cull_mode = cull_mode::BACK,
        .depth = {
            .compare = compare_func::LESS_EQUAL,
            .write_enabled = true,
        },
        .label = "render-pipeline"
    });

    // one-time init of particle velocities via a compute shader
    sg::Pipeline pip = sg::make_pipeline(&&(sg::PipelineDesc){
        .compute = true,
        .shader = sg::make_shader(&&init_shader_desc(sg::query_backend())),
    });
    sg::begin_pass(&&(sg::Pass){ .compute = true });
    sg::apply_pipeline(pip);
    sg::apply_bindings(&state.compute.bind);
    sg::dispatch(MAX_PARTICLES / 64, 1, 1);
    sg::end_pass();
}

fn void frame() {
    if (!sg::query_features().compute) {
        draw_fallback();
        return;
    }

    state.num_particles += NUM_PARTICLES_EMITTED_PER_FRAME;
    if (state.num_particles > MAX_PARTICLES) {
        state.num_particles = MAX_PARTICLES;
    }
    float dt = (float)sapp::frame_duration();
    state.ry += 60.0 * dt;

    // compute pass to update particle positions
    CsParams cs_params = {
        .dt = dt,
        .num_particles = state.num_particles,
    };
    sg::begin_pass(&&(sg::Pass){ .compute = true, .label = "compute-pass" });
    sg::apply_pipeline(state.compute.pip);
    sg::apply_bindings(&state.compute.bind);
    sg::apply_uniforms(UB_CS_PARAMS, &&(sg::Range){ .ptr = &cs_params, .size = $sizeof(cs_params)});
    sg::dispatch((state.num_particles + 63) / 64, 1, 1);
    sg::end_pass();

    // render pass to render the particles via instancing, with the
    // instance positions coming from the storage buffer
    VsParams vs_params = compute_vs_params();
    sg::begin_pass(&&(sg::Pass){
        .action = state.display.pass_action,
        .swapchain = sglue::swapchain(),
        .label = "render-pass",
    });
    sg::apply_pipeline(state.display.pip);
    sg::apply_bindings(&state.display.bind);
    sg::apply_uniforms(UB_VS_PARAMS, &&(sg::Range){ .ptr = &vs_params, .size = $sizeof(vs_params)});
    sg::draw(0, 24, state.num_particles);
    sg::end_pass();
    sg::commit();
}

fn void cleanup() {
    sg::shutdown();
}

fn VsParams compute_vs_params() {
    Mat4 proj = sokol_math::persp(fov: 60.0, aspect: sapp::widthf() / sapp::heightf(), near: 0.01, far: 50.0);
    Mat4 view = sokol_math::lookat(eye: {0.0, 1.5, 12.0}, center: {}, up: sokol_math::up());
    Mat4 view_proj = sokol_math::mul(proj, view);
    return (VsParams){
        .mvp = sokol_math::mul(view_proj, sokol_math::rotate(state.ry, { 0.0, 1.0, 0.0 })),
    };
}

fn void draw_fallback() {
    sg::begin_pass(&&(sg::Pass){
        .action = state.display.pass_action,
        .swapchain = sglue::swapchain(),
        .label = "render-pass",
    });
    sg::end_pass();
    sg::commit();
}

fn void main() {
    sapp::run(&&(sapp::Desc){
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "instancing-compute",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
