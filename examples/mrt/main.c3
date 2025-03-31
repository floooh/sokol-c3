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

alias Mat4 = sokol_math::Mat4;

const int OFFSCREEN_SAMPLE_COUNT = 1;

struct State
{
    struct offscreen
    {
        sg::PassAction pass_action;
        sg::AttachmentsDesc attachments_desc;
        sg::Attachments attachments;
        sg::Pipeline pip;
        sg::Bindings bind;
    }
    struct fsq
    {
        sg::Pipeline pip;
        sg::Bindings bind;
    }
    struct dbg
    {
        sg::Pipeline pip;
        sg::Bindings bind;
    }
    sg::PassAction pass_action;
    float rx, ry;
}

State state;

struct Vertex
{
    float x, y, z, b;
}

// called initially and when window size changes
fn void create_offscreen_attachments(int width, int height)
{
    // destroy previous resource (can be called for invalid id)
    sg::destroy_attachments(state.offscreen.attachments);
    for (int i = 0; i < 3; i++)
    {
        sg::destroy_image(state.offscreen.attachments_desc.colors[i].image);
    }
    sg::destroy_image(state.offscreen.attachments_desc.depth_stencil.image);

    // create offscreen rendertarget images and pass
    sg::ImageDesc color_img_desc = {
        .usage = { .render_attachment = true },
        .width = width,
        .height = height,
        .sample_count = OFFSCREEN_SAMPLE_COUNT,
    };
    sg::ImageDesc depth_img_desc = color_img_desc;
    depth_img_desc.pixel_format = pixel_format::DEPTH;
    state.offscreen.attachments_desc = {
        .colors = {
            [0] = { .image = sg::make_image(&color_img_desc) },
            [1] = { .image = sg::make_image(&color_img_desc) },
            [2] = { .image = sg::make_image(&color_img_desc) },
        },
        .depth_stencil = {
            .image = sg::make_image(&depth_img_desc),
        },
    };
    state.offscreen.attachments = sg::make_attachments(&state.offscreen.attachments_desc);

    // also need to update the fullscreen-quad texture bindings
    for (int i = 0; i < 3; i++)
    {
        state.fsq.bind.images[i] = state.offscreen.attachments_desc.colors[i].image;
    }
}

// listen for window-resize events and recreate offscreen rendertargets
fn void event(sapp::Event* ev)
{
    if (ev.type == event_type::RESIZED)
    {
        create_offscreen_attachments(ev.framebuffer_width, ev.framebuffer_height);
    }
}

fn void init()
{
    sg::setup(&&(sg::Desc) {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    // a pass action for the default render pass (don't clear the frame buffer
    // since it will be completely overwritten anyway)
    state.pass_action = {
        .colors[0].load_action = load_action::DONTCARE,
        .depth.load_action = load_action::DONTCARE,
        .stencil.load_action = load_action::DONTCARE,
    };

    // a render pass with 3 color attachment images, and a depth attachment image
    create_offscreen_attachments(sapp::width(), sapp::height());

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
    sg::Buffer cube_vbuf = sg::make_buffer(&&(BufferDesc) {
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
    sg::Buffer cube_ibuf = sg::make_buffer(&&(BufferDesc) {
        .usage = { .index_buffer = true },
        .data = { .ptr = &cube_indices, .size = $sizeof(cube_indices) },
    });

    // pass action for offscreen pass
    state.offscreen.pass_action.colors = {
        [0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.0, 0.0, 1.0 } },
        [1] = { .load_action = load_action::CLEAR, .clear_value = { 0.0, 0.25, 0.0, 1.0 } },
        [2] = { .load_action = load_action::CLEAR, .clear_value = { 0.0, 0.0, 0.25, 1.0 } },
    };

    // shader and pipeline object for offscreen-renderer cube
    state.offscreen.pip = sg::make_pipeline(&&(PipelineDesc) {
        .shader = sg::make_shader(&&offscreen_shader_desc(sg::query_backend())),
        .layout = {
            .buffers[0].stride = Vertex.sizeof,
            .attrs = {
                [ATTR_OFFSCREEN_POS]     = { .offset = Vertex.x.offsetof, .format = vertex_format::FLOAT3 },
                [ATTR_OFFSCREEN_BRIGHT0] = { .offset = Vertex.b.offsetof, .format = vertex_format::FLOAT },
            },
        },
        .index_type = index_type::UINT16,
        .cull_mode = cull_mode::BACK,
        .sample_count = OFFSCREEN_SAMPLE_COUNT,
        .depth = {
            .pixel_format = pixel_format::DEPTH,
            .compare = compare_func::LESS_EQUAL,
            .write_enabled = true,
        },
        .color_count = 3,
    });

    // resource bindings for offscreen rendering
    state.offscreen.bind = {
        .vertex_buffers[0] = cube_vbuf,
        .index_buffer = cube_ibuf,
    };

    // a vertex buffer to render a fullscreen rectangle
    float[*] quad_vertices = { 0.0, 0.0,  1.0, 0.0,  0.0, 1.0,  1.0, 1.0 };
    sg::Buffer quad_vbuf = sg::make_buffer(&&(BufferDesc) {
        .data = { .ptr = &quad_vertices, .size = $sizeof(quad_vertices) },
    });

    // shader and pipeline object to render the fullscreen quad
    state.fsq.pip = sg::make_pipeline(&&(PipelineDesc) {
        .shader = sg::make_shader(&&fsq_shader_desc(sg::query_backend())),
        .layout = {
            .attrs = {
                [ATTR_FSQ_POS] = { .format = vertex_format::FLOAT2 },
            },
        },
        .primitive_type = primitive_type::TRIANGLE_STRIP,
    });

    // a sampler object to sample the offscreen render target as texture
    sg::Sampler smp = sg::make_sampler(&&(SamplerDesc) {
        .min_filter = filter::LINEAR,
        .mag_filter = filter::LINEAR,
        .wrap_u = wrap::CLAMP_TO_EDGE,
        .wrap_v = wrap::CLAMP_TO_EDGE,
    });

    // resource bindings to render the fullscreen quad
    state.fsq.bind = {
        .vertex_buffers[0] = quad_vbuf,
        .images = {
            [IMG_TEX0] = state.offscreen.attachments_desc.colors[0].image,
            [IMG_TEX1] = state.offscreen.attachments_desc.colors[1].image,
            [IMG_TEX2] = state.offscreen.attachments_desc.colors[2].image,
        },
        .samplers[SMP_SMP] = smp,
    };

    // pipeline and resource bindings to render debug-visualization quads
    state.dbg.pip = sg::make_pipeline(&&(PipelineDesc) {
        .shader = sg::make_shader(&&dbg_shader_desc(sg::query_backend())),
        .layout = {
            .attrs = {
                [ATTR_DBG_POS] = { .format = vertex_format::FLOAT2 },
            },
        },
        .primitive_type = primitive_type::TRIANGLE_STRIP,
    });
    state.dbg.bind.vertex_buffers[0] = quad_vbuf;
    state.dbg.bind.samplers[SMP_SMP] = smp;
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
    sg::begin_pass(&&(Pass) { .action = state.offscreen.pass_action, .attachments = state.offscreen.attachments });
    sg::apply_pipeline(state.offscreen.pip);
    sg::apply_bindings(&state.offscreen.bind);
    sg::apply_uniforms(UB_OFFSCREEN_PARAMS, &&(sg::Range) { .ptr = &offscreen_params, .size = $sizeof(offscreen_params) });
    sg::draw(0, 36, 1);
    sg::end_pass();

    // render fullscreen quad with the 'composed image', plus 3 small debug-view quads
    sg::begin_pass(&&(Pass) { .action = state.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.fsq.pip);
    sg::apply_bindings(&state.fsq.bind);
    sg::apply_uniforms(UB_FSQ_PARAMS, &&(sg::Range) { .ptr = &fsq_params, .size = $sizeof(fsq_params) });
    sg::draw(0, 4, 1);
    sg::apply_pipeline(state.dbg.pip);
    for (int i = 0; i < 3; i++)
    {
        sg::apply_viewport(i * 100, 0, 100, 100, false);
        state.dbg.bind.images[IMG_TEX] = state.offscreen.attachments_desc.colors[i].image;
        sg::apply_bindings(&state.dbg.bind);
        sg::draw(0, 4, 1);
    }
    sg::apply_viewport(0, 0, sapp::width(), sapp::height(), false);
    sg::end_pass();
    sg::commit();
}

fn void cleanup()
{
    sg::shutdown();
}

fn void main()
{
    sapp::run(&&(sapp::Desc) {
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
