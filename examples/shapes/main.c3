//------------------------------------------------------------------------------
//  shapes/main.c3
//  Simple sokol/shape demo.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

alias Mat4 = sokol_math::Mat4;

struct Shape
{
    Vec3 pos;
    ElementRange draw;
}

const int BOX = 0;
const int PLANE = 1;
const int SPHERE = 2;
const int CYLINDER = 3;
const int TORUS = 4;
const int NUM_SHAPES = 5;

struct State
{
    sg::PassAction pass_action;
    sg::Pipeline pip;
    sg::Buffer vbuf, ibuf;
    Shape[NUM_SHAPES] shapes;
    VsParams vs_params;
    float rx, ry;
}

State state;

fn void init()
{
    sg::setup(&&(sg::Desc) {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });
    sdtx::setup(&&(sdtx::Desc) {
        .fonts = { [0] = sdtx::font_oric() },
        .logger = { .func = &slog::func },
    });

    // clear to black
    state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0, 0, 0, 1 } };

    // shader and pipeline object
    state.pip = sg::make_pipeline(&&(PipelineDesc) {
        .shader = sg::make_shader(&&shapes_shader_desc(sg::query_backend())),
        .layout = {
            .buffers[0] = sshape::vertex_buffer_layout_state(),
            .attrs = {
                [ATTR_SHAPES_POSITION] = sshape::position_vertex_attr_state(),
                [ATTR_SHAPES_NORMAL]   = sshape::normal_vertex_attr_state(),
                [ATTR_SHAPES_TEXCOORD] = sshape::texcoord_vertex_attr_state(),
                [ATTR_SHAPES_COLOR0]   = sshape::color_vertex_attr_state(),
            },
        },
        .index_type = index_type::UINT16,
        .cull_mode = cull_mode::NONE,
        .depth = {
            .compare = compare_func::LESS_EQUAL,
            .write_enabled = true,
        },
    });

    // shape positions
    state.shapes[BOX].pos = { -1.0, 1.0, 0.0 };
    state.shapes[PLANE].pos = { 1.0, 1.0, 0.0 };
    state.shapes[SPHERE].pos = { -2.0, -1.0, 0.0 };
    state.shapes[CYLINDER].pos = { 2.0, -1.0, 0.0 };
    state.shapes[TORUS].pos = { 0.0, -1.0, 0.0 };

    // generate shape geometries
    Vertex[6 * 1024] vertices;
    ushort[16 * 1024] indices;
    sshape::Buffer buf = {
        .vertices = { .buffer = { .ptr = &vertices, .size = $sizeof(vertices) } },
        .indices  = { .buffer = { .ptr = &indices, .size = $sizeof(indices) } },
    };

    buf = sshape::build_box(&buf, &&(Box) {
        .width = 1.0,
        .height = 1.0,
        .depth = 1.0,
        .tiles = 10,
        .random_colors = true,
    });
    state.shapes[BOX].draw = sshape::element_range(&buf);

    buf = sshape::build_plane(&buf, &&(Plane) {
        .width = 1.0,
        .depth = 1.0,
        .tiles = 10,
        .random_colors = true,
    });
    state.shapes[PLANE].draw = sshape::element_range(&buf);

    buf = sshape::build_sphere(&buf, &&(Sphere) {
        .radius = 0.75,
        .slices = 36,
        .stacks = 20,
        .random_colors = true,
    });
    state.shapes[SPHERE].draw = sshape::element_range(&buf);

    buf = sshape::build_cylinder(&buf, &&(Cylinder) {
        .radius = 0.5,
        .height = 1.5,
        .slices = 36,
        .stacks = 10,
        .random_colors = true,
    });
    state.shapes[CYLINDER].draw = sshape::element_range(&buf);

    buf = sshape::build_torus(&buf, &&(Torus) {
        .radius = 0.5,
        .ring_radius = 0.3,
        .rings = 36,
        .sides = 18,
        .random_colors = true,
    });
    state.shapes[TORUS].draw = sshape::element_range(&buf);

    // one vertex-/index-buffer pair for all shapes
    state.vbuf = sg::make_buffer(&&sshape::vertex_buffer_desc(&buf));
    state.ibuf = sg::make_buffer(&&sshape::index_buffer_desc(&buf));
}

fn void frame()
{
    // help text
    sdtx::canvas(sapp::widthf() * 0.5, sapp::heightf() * 0.5);
    sdtx::pos(0.5, 0.5);
    sdtx::puts("press key to switch draw mode:\n\n");
    sdtx::puts("  1: vertex normals\n");
    sdtx::puts("  2: texture coords\n");
    sdtx::puts("  3: vertex colors\n");

    // view-projection matrix
    Mat4 proj = sokol_math::persp(fov: 60, aspect: sapp::widthf() / sapp::heightf(), near: 0.01, far: 10.0);
    Mat4 view = sokol_math::lookat(eye: {0.0, 1.5, 6.0}, center: {}, up: sokol_math::up());
    Mat4 view_proj = sokol_math::mul(proj, view);

    // model rotation matrix
    float t = (float)sapp::frame_duration() * 60;
    state.rx += 1.0 * t;
    state.ry += 2.0 * t;
    Mat4 rxm = sokol_math::rotate(state.rx, {1.0, 0.0, 0.0});
    Mat4 rym = sokol_math::rotate(state.ry, {0.0, 1.0, 0.0});
    Mat4 rm = sokol_math::mul(rxm, rym);

    // render shapes
    sg::begin_pass(&&(Pass) { .action = state.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.pip);
    sg::apply_bindings(&&(Bindings) {
        .vertex_buffers = { [0] = state.vbuf },
        .index_buffer = state.ibuf,
    });
    for (int i = 0; i < NUM_SHAPES; i++)
    {
        // per shape model-view-projection matrix
        Mat4 model = sokol_math::mul(sokol_math::translate(state.shapes[i].pos), rm);
        state.vs_params.mvp = sokol_math::mul(view_proj, model);
        sg::apply_uniforms(UB_VS_PARAMS, &&(sg::Range) { .ptr = &state.vs_params, .size = $sizeof(state.vs_params) });
        sg::draw(state.shapes[i].draw.base_element, state.shapes[i].draw.num_elements, 1);
    }
    sdtx::draw();
    sg::end_pass();
    sg::commit();
}

fn void input(sapp::Event* ev)
{
    if (ev.type == event_type::KEY_DOWN)
    {
        switch (ev.key_code)
        {
            case keycode::NUM_1:
                state.vs_params.draw_mode = 0.0;
            case keycode::NUM_2:
                state.vs_params.draw_mode = 1.0;
            case keycode::NUM_3:
                state.vs_params.draw_mode = 2.0;
        }
    }
}

fn void cleanup()
{
    sdtx::shutdown();
    sg::shutdown();
}

fn void main()
{
    sapp::run(&&(sapp::Desc) {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .event_cb = &input,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "shapes",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
