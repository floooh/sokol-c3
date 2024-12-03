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
        gfx::PassAction pass_action;
        gfx::Attachments attachments;
        gfx::Pipeline pip;
        gfx::Bindings bind;
    }
    // `default` is keyword, so we use `dflt`.
    struct dflt
    {
        gfx::PassAction pass_action;
        gfx::Pipeline pip;
        gfx::Bindings bind;
    }
    shape::ElementRange donut, sphere;
    float rx, ry;
    shape::Vertex[4000] vertices;
    ushort[24_000] indices;
}

State state;

fn void init()
{
    gfx::setup(&&gfx::Desc {
        .environment = glue::environment(),
        .logger = { .func = &log::func },
    });

    // default pass action: clear to blue-ish
    state.dflt.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.45, 0.65, 1.0 } };

    // offscreen pass action: clear to grey
    state.offscreen.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.25, 0.25, 1.0 } };

    // a render pass with one color- and one depth-attachment image
    gfx::ImageDesc img_desc = {
        .render_target = true,
        .width = 256,
        .height = 256,
        .pixel_format = pixel_format::RGBA8,
        .sample_count = OFFSCREEN_SAMPLE_COUNT,
    };
    gfx::Image color_img = gfx::make_image(&img_desc);
    img_desc.pixel_format = pixel_format::DEPTH;
    gfx::Image depth_img = gfx::make_image(&img_desc);
    state.offscreen.attachments = gfx::make_attachments(&&AttachmentsDesc {
        .colors = {
            [0] = { .image = color_img },
        },
        .depth_stencil = {
            .image = depth_img,
        },
    });

    // a donut shape which is rendered into the offscreen render target, and
    // a sphere shape which is rendered into the default framebuffer
    shape::Buffer buf = {
        .vertices = { .buffer = { .ptr = &state.vertices, .size = $typeof(state.vertices).sizeof } },
        .indices  = { .buffer = { .ptr = &state.indices, .size = $typeof(state.indices).sizeof } },
    };

    buf = shape::build_torus(&buf, &&Torus {
        .radius = 0.5,
        .ring_radius = 0.3,
        .sides = 20,
        .rings = 30,
    });
    state.donut = shape::element_range(&buf);

    buf = shape::build_sphere(&buf, &&Sphere {
        .radius = 0.5,
        .slices = 72,
        .stacks = 40,
    });
    state.sphere = shape::element_range(&buf);

    gfx::Buffer vbuf = gfx::make_buffer(&&shape::vertex_buffer_desc(&buf));
    gfx::Buffer ibuf = gfx::make_buffer(&&shape::index_buffer_desc(&buf));

    // pipeline-state-object for offscreen-rendered donut, don't need texture coord here
    state.offscreen.pip = gfx::make_pipeline(&&PipelineDesc {
        .shader = gfx::make_shader(&&offscreen_shader_desc(gfx::query_backend())),
        .layout = {
            .buffers = {
                [0] = shape::vertex_buffer_layout_state(),
            },
            .attrs = {
                [ATTR_OFFSCREEN_POSITION] = shape::position_vertex_attr_state(),
                [ATTR_OFFSCREEN_NORMAL] = shape::normal_vertex_attr_state(),
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
    state.dflt.pip = gfx::make_pipeline(&&PipelineDesc {
        .shader = gfx::make_shader(&&default_shader_desc(gfx::query_backend())),
        .layout = {
            .buffers = {
                [0] = shape::vertex_buffer_layout_state(),
            },
            .attrs = {
                [ATTR_DEFAULT_POSITION] = shape::position_vertex_attr_state(),
                [ATTR_DEFAULT_NORMAL] = shape::normal_vertex_attr_state(),
                [ATTR_DEFAULT_TEXCOORD0] = shape::texcoord_vertex_attr_state(),
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
    Sampler smp = gfx::make_sampler(&&SamplerDesc {
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
    float t = (float)app::frame_duration() * 60;
    state.rx += 1.0 * t;
    state.ry += 2.0 * t;

    // the offscreen pass, rendering an rotating, untextured donut into a render target image
    VsParams vs_params = {
        .mvp = compute_mvp(rx: state.rx, ry: state.ry, aspect: 1.0, eye_dist: 2.5),
    };
    gfx::begin_pass(&&Pass { .action = state.offscreen.pass_action, .attachments = state.offscreen.attachments });
    gfx::apply_pipeline(state.offscreen.pip);
    gfx::apply_bindings(&state.offscreen.bind);
    gfx::apply_uniforms(UB_VS_PARAMS, &&gfx::Range { .ptr = &vs_params, .size = $typeof(vs_params).sizeof });
    gfx::draw(state.donut.base_element, state.donut.num_elements, 1);
    gfx::end_pass();

    // and the default-pass, rendering a rotating textured sphere which uses the
    // previously rendered offscreen render-target as texture
    vs_params.mvp = compute_mvp(
        rx: -state.rx * (float)0.25,
        ry: state.ry * 0.25,
        aspect: app::widthf() / app::heightf(),
        eye_dist: 2.0,
    );
    gfx::begin_pass(&&Pass { .action = state.dflt.pass_action, .swapchain = glue::swapchain() });
    gfx::apply_pipeline(state.dflt.pip);
    gfx::apply_bindings(&state.dflt.bind);
    gfx::apply_uniforms(UB_VS_PARAMS, &&gfx::Range { .ptr = &vs_params, .size = $typeof(vs_params).sizeof });
    gfx::draw(state.sphere.base_element, state.sphere.num_elements, 1);
    gfx::end_pass();

    gfx::commit();
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
        .window_title = "offscreen",
        .icon = { .sokol_default = true },
        .logger = { .func = &log::func },
    });
}
