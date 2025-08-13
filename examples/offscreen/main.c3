//------------------------------------------------------------------------------
//  offscreen/main.c3
//
//  Render to an offscreen rendertarget texture, and use this texture
//  for rendering to the display.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

alias Mat4 = sokol_math::Mat4;

struct State
{
    struct offscreen
    {
        sg::Pass pass;
        sg::Pipeline pip;
        sg::Bindings bind;
    }
    // `default` is keyword, so we use `dflt`.
    struct display
    {
        sg::PassAction pass_action;
        sg::Pipeline pip;
        sg::Bindings bind;
    }
    sshape::ElementRange donut, sphere;
    float rx, ry;
    sshape::Vertex[4000] vertices;
    ushort[24_000] indices;
}

State state;

fn void init()
{
    sg::setup(&&(sg::Desc) {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    // default pass action: clear to blue-ish
    state.display.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.45, 0.65, 1.0 } };

    // offscreen pass action: clear to grey
    state.offscreen.pass.action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.25, 0.25, 1.0 } };

    // setup color- and depth-stencil-attachment images and views
    const int OFFSCREEN_WIDTH = 256;
    const int OFFSCREEN_HEIGHT = 256;
    const int OFFSCREEN_SAMPLE_COUNT = 1;
    sg::Image color_img = sg::make_image(&&(sg::ImageDesc){
        .usage = { .color_attachment = true },
        .width = OFFSCREEN_WIDTH,
        .height = OFFSCREEN_HEIGHT,
        .sample_count = OFFSCREEN_SAMPLE_COUNT,
        .pixel_format = pixel_format::RGBA8,
    });
    sg::Image depth_img = sg::make_image(&&(sg::ImageDesc){
        .usage = { .depth_stencil_attachment = true },
        .width = OFFSCREEN_WIDTH,
        .height = OFFSCREEN_HEIGHT,
        .sample_count = OFFSCREEN_SAMPLE_COUNT,
        .pixel_format = pixel_format::DEPTH,
    });

    // the offscreen render pass needs a color- and depth-stencil-attachment view
    state.offscreen.pass.attachments.colors[0] = sg::make_view(&&(sg::ViewDesc){
        .color_attachment = { .image = color_img },
    });
    state.offscreen.pass.attachments.depth_stencil = sg::make_view(&&(sg::ViewDesc){
        .depth_stencil_attachment = { .image = depth_img },
    });

    // the display render pass needs a texture view on the color image
    state.display.bind.views[VIEW_TEX] = sg::make_view(&&(sg::ViewDesc){
        .texture = { .image = color_img },
    });

    // a donut shape which is rendered into the offscreen render target, and
    // a sphere shape which is rendered into the default framebuffer
    sshape::Buffer buf = {
        .vertices = { .buffer = { .ptr = &state.vertices, .size = $sizeof(state.vertices) } },
        .indices  = { .buffer = { .ptr = &state.indices, .size = $sizeof(state.indices) } },
    };

    buf = sshape::build_torus(&buf, &&(Torus) {
        .radius = 0.5,
        .ring_radius = 0.3,
        .sides = 20,
        .rings = 30,
    });
    state.donut = sshape::element_range(&buf);

    buf = sshape::build_sphere(&buf, &&(Sphere) {
        .radius = 0.5,
        .slices = 72,
        .stacks = 40,
    });
    state.sphere = sshape::element_range(&buf);

    sg::Buffer vbuf = sg::make_buffer(&&sshape::vertex_buffer_desc(&buf));
    state.offscreen.bind.vertex_buffers[0] = vbuf;
    state.display.bind.vertex_buffers[0] = vbuf;
    sg::Buffer ibuf = sg::make_buffer(&&sshape::index_buffer_desc(&buf));
    state.offscreen.bind.index_buffer = ibuf;
    state.display.bind.index_buffer = ibuf;

    // pipeline-state-object for offscreen-rendered donut, don't need texture coord here
    state.offscreen.pip = sg::make_pipeline(&&(sg::PipelineDesc) {
        .shader = sg::make_shader(&&offscreen_shader_desc(sg::query_backend())),
        .layout = {
            .buffers[0] = sshape::vertex_buffer_layout_state(),
            .attrs = {
                [ATTR_OFFSCREEN_POSITION] = sshape::position_vertex_attr_state(),
                [ATTR_OFFSCREEN_NORMAL] = sshape::normal_vertex_attr_state(),
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
        .colors[0] = { .pixel_format = pixel_format::RGBA8 },
    });

    // and another pipeline-state-object for the default pass
    state.display.pip = sg::make_pipeline(&&(sg::PipelineDesc) {
        .shader = sg::make_shader(&&default_shader_desc(sg::query_backend())),
        .layout = {
            .buffers[0] = sshape::vertex_buffer_layout_state(),
            .attrs = {
                [ATTR_DEFAULT_POSITION] = sshape::position_vertex_attr_state(),
                [ATTR_DEFAULT_NORMAL] = sshape::normal_vertex_attr_state(),
                [ATTR_DEFAULT_TEXCOORD0] = sshape::texcoord_vertex_attr_state(),
            },
        },
        .index_type = index_type::UINT16,
        .cull_mode = cull_mode::BACK,
        .depth = {
            .compare = compare_func::LESS_EQUAL,
            .write_enabled = true,
        },
    });

    // a sampler object for sampling the render target as texture
    state.display.bind.samplers[SMP_SMP] = sg::make_sampler(&&(sg::SamplerDesc) {
        .min_filter = filter::LINEAR,
        .mag_filter = filter::LINEAR,
        .wrap_u = wrap::REPEAT,
        .wrap_v = wrap::REPEAT,
    });

    // the resource bindings for rendering a non-textured cube into offscreen render target
    state.offscreen.bind = {
        .vertex_buffers[0] = vbuf,
        .index_buffer = ibuf,
    };
}

fn void frame()
{
    float t = (float)sapp::frame_duration() * 60;
    state.rx += 1.0 * t;
    state.ry += 2.0 * t;

    // the offscreen pass, rendering an rotating, untextured donut into a render target image
    VsParams vs_params = {
        .mvp = compute_mvp(rx: state.rx, ry: state.ry, aspect: 1.0, eye_dist: 2.5),
    };
    sg::begin_pass(&state.offscreen.pass);
    sg::apply_pipeline(state.offscreen.pip);
    sg::apply_bindings(&state.offscreen.bind);
    sg::apply_uniforms(UB_VS_PARAMS, &&(sg::Range) { .ptr = &vs_params, .size = $sizeof(vs_params) });
    sg::draw(state.donut.base_element, state.donut.num_elements, 1);
    sg::end_pass();

    // and the default-pass, rendering a rotating textured sphere which uses the
    // previously rendered offscreen render-target as texture
    vs_params.mvp = compute_mvp(
        rx: -state.rx * (float)0.25,
        ry: state.ry * 0.25,
        aspect: sapp::widthf() / sapp::heightf(),
        eye_dist: 2.0,
    );
    sg::begin_pass(&&(Pass) { .action = state.display.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.display.pip);
    sg::apply_bindings(&state.display.bind);
    sg::apply_uniforms(UB_VS_PARAMS, &&(sg::Range) { .ptr = &vs_params, .size = $sizeof(vs_params) });
    sg::draw(state.sphere.base_element, state.sphere.num_elements, 1);
    sg::end_pass();

    sg::commit();
}

fn Mat4 compute_mvp(float rx, float ry, float aspect, float eye_dist)
{
    Mat4 proj = sokol_math::persp(fov: 45, aspect: aspect, near: 0.01, far: 10.0);
    Mat4 view = sokol_math::lookat(eye: {0.0, 0.0, eye_dist}, center: {}, up: sokol_math::up());
    Mat4 view_proj = sokol_math::mul(proj, view);
    Mat4 rxm = sokol_math::rotate(rx, {1.0, 0.0, 0.0});
    Mat4 rym = sokol_math::rotate(ry, {0.0, 1.0, 0.0});
    Mat4 model = sokol_math::mul(rym, rxm);
    return sokol_math::mul(view_proj, model);
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
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "offscreen",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
