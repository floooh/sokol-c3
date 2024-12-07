//------------------------------------------------------------------------------
//  offscreen/main.c3
//
//  Render to an offscreen rendertarget texture, and use this texture
//  for rendering to the display.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

def Mat4 = sokol_math::Mat4;

const int OFFSCREEN_SAMPLE_COUNT = 1;

struct State
{
    struct offscreen
    {
        sg::PassAction pass_action;
        sg::Attachments attachments;
        sg::Pipeline pip;
        sg::Bindings bind;
    }
    // `default` is keyword, so we use `dflt`.
    struct dflt
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
    sg::setup(&&sg::Desc {
        .environment = sglue::environment(),
        .logger = { .func = &slog::func },
    });

    // default pass action: clear to blue-ish
    state.dflt.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.45, 0.65, 1.0 } };

    // offscreen pass action: clear to grey
    state.offscreen.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.25, 0.25, 1.0 } };

    // a render pass with one color- and one depth-attachment image
    sg::ImageDesc img_desc = {
        .render_target = true,
        .width = 256,
        .height = 256,
        .pixel_format = pixel_format::RGBA8,
        .sample_count = OFFSCREEN_SAMPLE_COUNT,
    };
    sg::Image color_img = sg::make_image(&img_desc);
    img_desc.pixel_format = pixel_format::DEPTH;
    sg::Image depth_img = sg::make_image(&img_desc);
    state.offscreen.attachments = sg::make_attachments(&&AttachmentsDesc {
        .colors = {
            [0] = { .image = color_img },
        },
        .depth_stencil = {
            .image = depth_img,
        },
    });

    // a donut shape which is rendered into the offscreen render target, and
    // a sphere shape which is rendered into the default framebuffer
    sshape::Buffer buf = {
        .vertices = { .buffer = { .ptr = &state.vertices, .size = $typeof(state.vertices).sizeof } },
        .indices  = { .buffer = { .ptr = &state.indices, .size = $typeof(state.indices).sizeof } },
    };

    buf = sshape::build_torus(&buf, &&Torus {
        .radius = 0.5,
        .ring_radius = 0.3,
        .sides = 20,
        .rings = 30,
    });
    state.donut = sshape::element_range(&buf);

    buf = sshape::build_sphere(&buf, &&Sphere {
        .radius = 0.5,
        .slices = 72,
        .stacks = 40,
    });
    state.sphere = sshape::element_range(&buf);

    sg::Buffer vbuf = sg::make_buffer(&&sshape::vertex_buffer_desc(&buf));
    sg::Buffer ibuf = sg::make_buffer(&&sshape::index_buffer_desc(&buf));

    // pipeline-state-object for offscreen-rendered donut, don't need texture coord here
    state.offscreen.pip = sg::make_pipeline(&&PipelineDesc {
        .shader = sg::make_shader(&&offscreen_shader_desc(sg::query_backend())),
        .layout = {
            .buffers = {
                [0] = sshape::vertex_buffer_layout_state(),
            },
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
        .colors = {
            [0] = { .pixel_format = pixel_format::RGBA8 },
        },
    });

    // and another pipeline-state-object for the default pass
    state.dflt.pip = sg::make_pipeline(&&PipelineDesc {
        .shader = sg::make_shader(&&default_shader_desc(sg::query_backend())),
        .layout = {
            .buffers = {
                [0] = sshape::vertex_buffer_layout_state(),
            },
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
    Sampler smp = sg::make_sampler(&&SamplerDesc {
        .min_filter = filter::LINEAR,
        .mag_filter = filter::LINEAR,
        .wrap_u = wrap::REPEAT,
        .wrap_v = wrap::REPEAT,
    });

    // the resource bindings for rendering a non-textured cube into offscreen render target
    state.offscreen.bind = {
        .vertex_buffers = {
            [0] = vbuf,
        },
        .index_buffer = ibuf,
    };

    // resource bindings to render a textured shape, using the offscreen render target as texture
    state.dflt.bind = {
        .vertex_buffers = {
            [0] = vbuf,
        },
        .index_buffer = ibuf,
        .images = { [IMG_TEX] = color_img },
        .samplers = { [SMP_SMP] = smp },
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
    sg::begin_pass(&&Pass { .action = state.offscreen.pass_action, .attachments = state.offscreen.attachments });
    sg::apply_pipeline(state.offscreen.pip);
    sg::apply_bindings(&state.offscreen.bind);
    sg::apply_uniforms(UB_VS_PARAMS, &&sg::Range { .ptr = &vs_params, .size = $typeof(vs_params).sizeof });
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
    sg::begin_pass(&&Pass { .action = state.dflt.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.dflt.pip);
    sg::apply_bindings(&state.dflt.bind);
    sg::apply_uniforms(UB_VS_PARAMS, &&sg::Range { .ptr = &vs_params, .size = $typeof(vs_params).sizeof });
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
    sapp::run(&&sapp::Desc {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "offscreen",
        .icon = { .sokol_default = true },
        .logger = { .func = &slog::func },
    });
}
