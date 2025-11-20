//------------------------------------------------------------------------------
//  mrt/main.c3
//
//  Rendering with multi-rendertargets, and recreating render targets
//  when window size changes.
//------------------------------------------------------------------------------

module main;
import std;
import sokol;
import sokol_math;

const int NUM_MRTS = 3;
const int OFFSCREEN_SAMPLE_COUNT = 4;

struct State
{
    struct images {
        SgImage[NUM_MRTS] color;
        SgImage[NUM_MRTS] resolve;
        SgImage depth;
    }
    struct offscreen
    {
        SgPipeline pip;
        SgBindings bind;
        SgPass pass;
    }
    struct display
    {
        SgPipeline pip;
        SgBindings bind;
        SgPassAction pass_action;
    }
    struct dbg
    {
        SgPipeline pip;
        SgBindings bind;
    }
    float rx, ry;
}

State state;

struct Vertex
{
    float x, y, z, b;
}

fn void init()
{
    sg::setup(&&{
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    // setup the offscreen render pass resources, this will also be called when the window resizes
    recreate_offscreen_attachments(sapp::width(), sapp::height());

    // a pass action for the default render pass (don't clear the frame buffer
    // since it will be completely overwritten anyway)
    state.display.pass_action = {
        .colors[0].load_action = DONTCARE,
        .depth.load_action = DONTCARE,
        .stencil.load_action = DONTCARE,
    };

    // pass action for offscreen pass
    state.offscreen.pass.action.colors = {
        [0] = { .load_action = CLEAR, .clear_value = { 0.25, 0.0, 0.0, 1.0 } },
        [1] = { .load_action = CLEAR, .clear_value = { 0.0, 0.25, 0.0, 1.0 } },
        [2] = { .load_action = CLEAR, .clear_value = { 0.0, 0.0, 0.25, 1.0 } },
    };

    // cube vertex buffer
    Vertex[*] cube_vertices = {
        // pos + brightness
        { -1.0, -1.0, -1.0,   1.0 },
        {  1.0, -1.0, -1.0,   1.0 },
        {  1.0,  1.0, -1.0,   1.0 },
        { -1.0,  1.0, -1.0,   1.0 },

        { -1.0, -1.0,  1.0,   0.8 },
        {  1.0, -1.0,  1.0,   0.8 },
        {  1.0,  1.0,  1.0,   0.8 },
        { -1.0,  1.0,  1.0,   0.8 },

        { -1.0, -1.0, -1.0,   0.6 },
        { -1.0,  1.0, -1.0,   0.6 },
        { -1.0,  1.0,  1.0,   0.6 },
        { -1.0, -1.0,  1.0,   0.6 },

        {  1.0, -1.0, -1.0,    0.4 },
        {  1.0,  1.0, -1.0,    0.4 },
        {  1.0,  1.0,  1.0,    0.4 },
        {  1.0, -1.0,  1.0,    0.4 },

        { -1.0, -1.0, -1.0,   0.5 },
        { -1.0, -1.0,  1.0,   0.5 },
        {  1.0, -1.0,  1.0,   0.5 },
        {  1.0, -1.0, -1.0,   0.5 },

        { -1.0,  1.0, -1.0,   0.7 },
        { -1.0,  1.0,  1.0,   0.7 },
        {  1.0,  1.0,  1.0,   0.7 },
        {  1.0,  1.0, -1.0,   0.7 },
    };
    state.offscreen.bind.vertex_buffers[0] = sg::make_buffer(&&{
        .data = { .ptr = &cube_vertices, .size = $sizeof(cube_vertices) },
    });

    // index buffer for the cube
    ushort[*] cube_indices = {
        0, 1, 2,  0, 2, 3,
        6, 5, 4,  7, 6, 4,
        8, 9, 10,  8, 10, 11,
        14, 13, 12,  15, 14, 12,
        16, 17, 18,  16, 18, 19,
        22, 21, 20,  23, 22, 20,
    };
    state.offscreen.bind.index_buffer = sg::make_buffer(&&{
        .usage = { .index_buffer = true },
        .data = { .ptr = &cube_indices, .size = $sizeof(cube_indices) },
    });

    // shader and pipeline object for offscreen-renderer cube
    state.offscreen.pip = sg::make_pipeline(&&{
        .shader = sg::make_shader(&&offscreen_shader_desc(sg::query_backend())),
        .layout = {
            .buffers[0].stride = Vertex.sizeof,
            .attrs = {
                [ATTR_OFFSCREEN_POS]     = { .offset = Vertex.x.offsetof, .format = FLOAT3 },
                [ATTR_OFFSCREEN_BRIGHT0] = { .offset = Vertex.b.offsetof, .format = FLOAT },
            },
        },
        .index_type = UINT16,
        .cull_mode = BACK,
        .sample_count = OFFSCREEN_SAMPLE_COUNT,
        .depth = {
            .pixel_format = DEPTH,
            .compare = LESS_EQUAL,
            .write_enabled = true,
        },
        .color_count = 3,
    });

    // a vertex buffer to render a fullscreen rectangle
    float[*] quad_vertices = { 0.0, 0.0,  1.0, 0.0,  0.0, 1.0,  1.0, 1.0 };
    SgBuffer quad_vbuf = sg::make_buffer(&&{
        .data = { .ptr = &quad_vertices, .size = $sizeof(quad_vertices) },
    });
    state.display.bind.vertex_buffers[0] = quad_vbuf;
    state.dbg.bind.vertex_buffers[0] = quad_vbuf;

    // shader and pipeline object to render the fullscreen quad
    state.display.pip = sg::make_pipeline(&&{
        .shader = sg::make_shader(&&fsq_shader_desc(sg::query_backend())),
        .layout = {
            .attrs = {
                [ATTR_FSQ_POS] = { .format = FLOAT2 },
            },
        },
        .primitive_type = TRIANGLE_STRIP,
    });

    // a sampler object to sample the offscreen render target as texture
    SgSampler smp = sg::make_sampler(&&{
        .min_filter = LINEAR,
        .mag_filter = LINEAR,
        .wrap_u = CLAMP_TO_EDGE,
        .wrap_v = CLAMP_TO_EDGE,
    });
    state.display.bind.samplers[SMP_SMP] = smp;
    state.dbg.bind.samplers[SMP_SMP] = smp;

    // pipeline and resource bindings to render debug-visualization quads
    state.dbg.pip = sg::make_pipeline(&&{
        .shader = sg::make_shader(&&dbg_shader_desc(sg::query_backend())),
        .layout = {
            .attrs = {
                [ATTR_DBG_POS] = { .format = FLOAT2 },
            },
        },
        .primitive_type = TRIANGLE_STRIP,
    });
}

fn void frame()
{
    // view-projection matrix
    Mat4 proj = sokol_math::persp(fov: 60.0, aspect: sapp::widthf() / sapp::heightf(), near: 0.01, far: 10.0);
    Mat4 view = sokol_math::lookat(eye: {0.0, 1.5, 6.0}, center: {}, up: sokol_math::up());
    Mat4 view_proj = sokol_math::mul(proj, view);

    // shader parameters
    float t = (float)sapp::frame_duration() * 60.0;
    state.rx += 1.0 * t;
    state.ry += 2.0 * t;
    FsqParams fsq_params = {
        .offset = { (float)math::sin(state.rx * 0.01) * 0.1, (float)math::sin(state.ry * 0.01) * 0.1 },
    };
    Mat4 rxm = sokol_math::rotate(state.rx, { 1.0, 0.0, 0.0 });
    Mat4 rym = sokol_math::rotate(state.ry, { 0.0, 1.0, 0.0 });
    Mat4 model = sokol_math::mul(rxm, rym);
    OffscreenParams offscreen_params = {
        .mvp = sokol_math::mul(view_proj, model),
    };

    // render cube into MRT offscreen render targets
    sg::begin_pass(&state.offscreen.pass);
    sg::apply_pipeline(state.offscreen.pip);
    sg::apply_bindings(&state.offscreen.bind);
    sg::apply_uniforms(UB_OFFSCREEN_PARAMS, &&{ .ptr = &offscreen_params, .size = $sizeof(offscreen_params) });
    sg::draw(0, 36, 1);
    sg::end_pass();

    // render fullscreen quad with the 'composed image', plus 3 small debug-view quads
    sg::begin_pass(&&{ .action = state.display.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.display.pip);
    sg::apply_bindings(&state.display.bind);
    sg::apply_uniforms(UB_FSQ_PARAMS, &&{ .ptr = &fsq_params, .size = $sizeof(fsq_params) });
    sg::draw(0, 4, 1);
    sg::apply_pipeline(state.dbg.pip);
    for (int i = 0; i < 3; i++)
    {
        sg::apply_viewport(i * 100, 0, 100, 100, false);
        state.dbg.bind.views[VIEW_TEX] = state.display.bind.views[i];
        sg::apply_bindings(&state.dbg.bind);
        sg::draw(0, 4, 1);
    }
    sg::apply_viewport(0, 0, sapp::width(), sapp::height(), false);
    sg::end_pass();
    sg::commit();
}

// listen for window-resize events and recreate offscreen rendertargets
fn void event(SappEvent* ev)
{
    if (ev.type == RESIZED)
    {
        recreate_offscreen_attachments(ev.framebuffer_width, ev.framebuffer_height);
    }
}
fn void cleanup()
{
    sg::shutdown();
}

// called initially and when window size changes
fn void recreate_offscreen_attachments(int width, int height)
{
    // destroy and re-create color, resolve and depth-stencil attachment images and views
    for (int i = 0; i < NUM_MRTS; i++) {
        // color-attachment images and views
        sg::destroy_image(state.images.color[i]);
        state.images.color[i] = sg::make_image(&&{
            .usage = { .color_attachment = true },
            .width = width,
            .height = height,
            .sample_count = OFFSCREEN_SAMPLE_COUNT,
        });
        sg::destroy_view(state.offscreen.pass.attachments.colors[i]);
        state.offscreen.pass.attachments.colors[i] = sg::make_view(&&{
            .color_attachment = { .image = state.images.color[i] },
        });
        // resolve-attachments and views
        sg::destroy_image(state.images.resolve[i]);
        state.images.resolve[i] = sg::make_image(&&{
            .usage = { .resolve_attachment = true },
            .width = width,
            .height = height,
            .sample_count = 1,
        });
        sg::destroy_view(state.offscreen.pass.attachments.resolves[i]);
        state.offscreen.pass.attachments.resolves[i] = sg::make_view(&&{
            .resolve_attachment = { .image = state.images.resolve[i] },
        });

        // the resolve images are also sampled as texture, so need a texture view
        sg::destroy_view(state.display.bind.views[i]);
        state.display.bind.views[i] = sg::make_view(&&{
            .texture = { .image = state.images.resolve[i] },
        });
    }

    // depth-stencil-attachment image and view
    sg::destroy_image(state.images.depth);
    state.images.depth = sg::make_image(&&{
        .usage = { .depth_stencil_attachment = true },
        .width = width,
        .height = height,
        .sample_count = OFFSCREEN_SAMPLE_COUNT,
        .pixel_format = DEPTH,
    });
    sg::destroy_view(state.offscreen.pass.attachments.depth_stencil);
    state.offscreen.pass.attachments.depth_stencil = sg::make_view(&&{
        .depth_stencil_attachment = { .image = state.images.depth },
    });
}

fn void main()
{
    sapp::run(&&{
        .init_cb = &init,
        .frame_cb = &frame,
        .event_cb = &event,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "mrt",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
