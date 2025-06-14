//------------------------------------------------------------------------------
//  texcube/main.c3
//  Texture creation, rendering with texture, packed vertex components.
//------------------------------------------------------------------------------

module main;
import sokol;
import sokol_math;

alias Mat4 = sokol_math::Mat4;

struct State
{
    float rx, ry;
    sg::PassAction pass_action;
    sg::Pipeline pip;
    sg::Bindings bind;
}

State state;

struct Vertex
{
    float x, y, z;
    uint color;
    ushort u, v;
}


fn void init()
{
    sg::setup(&&(sg::Desc) {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });

    /*
        Cube vertex buffer with packed vertex formats for color and texture coords.
        Note that a vertex format which must be portable across all
        backends must only use the normalized integer formats
        (BYTE4N, UBYTE4N, SHORT2N, SHORT4N), which can be converted
        to floating point formats in the vertex shader inputs.
    */
    Vertex[*] vertices = {
        // pos               color       uvs
        { -1.0, -1.0, -1.0,  0xFF0000FF,     0,     0 },
        {  1.0, -1.0, -1.0,  0xFF0000FF, 32767,     0 },
        {  1.0,  1.0, -1.0,  0xFF0000FF, 32767, 32767 },
        { -1.0,  1.0, -1.0,  0xFF0000FF,     0, 32767 },

        { -1.0, -1.0,  1.0,  0xFF00FF00,     0,     0 },
        {  1.0, -1.0,  1.0,  0xFF00FF00, 32767,     0 },
        {  1.0,  1.0,  1.0,  0xFF00FF00, 32767, 32767 },
        { -1.0,  1.0,  1.0,  0xFF00FF00,     0, 32767 },

        { -1.0, -1.0, -1.0,  0xFFFF0000,     0,     0 },
        { -1.0,  1.0, -1.0,  0xFFFF0000, 32767,     0 },
        { -1.0,  1.0,  1.0,  0xFFFF0000, 32767, 32767 },
        { -1.0, -1.0,  1.0,  0xFFFF0000,     0, 32767 },

        {  1.0, -1.0, -1.0,  0xFFFF007F,     0,     0 },
        {  1.0,  1.0, -1.0,  0xFFFF007F, 32767,     0 },
        {  1.0,  1.0,  1.0,  0xFFFF007F, 32767, 32767 },
        {  1.0, -1.0,  1.0,  0xFFFF007F,     0, 32767 },

        { -1.0, -1.0, -1.0,  0xFFFF7F00,     0,     0 },
        { -1.0, -1.0,  1.0,  0xFFFF7F00, 32767,     0 },
        {  1.0, -1.0,  1.0,  0xFFFF7F00, 32767, 32767 },
        {  1.0, -1.0, -1.0,  0xFFFF7F00,     0, 32767 },

        { -1.0,  1.0, -1.0,  0xFF007FFF,     0,     0 },
        { -1.0,  1.0,  1.0,  0xFF007FFF, 32767,     0 },
        {  1.0,  1.0,  1.0,  0xFF007FFF, 32767, 32767 },
        {  1.0,  1.0, -1.0,  0xFF007FFF,     0, 32767 },
    };
    state.bind.vertex_buffers[0] = sg::make_buffer(&&(BufferDesc) {
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
    state.bind.index_buffer = sg::make_buffer(&&(BufferDesc) {
        .usage = { .index_buffer = true },
        .data = { .ptr = &indices, .size = $sizeof(indices) },
    });

    // create a checkerboard texture
    uint[4*4] pixels = {
        0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF, 0xFF000000,
        0xFF000000, 0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF,
        0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF, 0xFF000000,
        0xFF000000, 0xFFFFFFFF, 0xFF000000, 0xFFFFFFFF,
    };
    /* NOTE: SLOT_tex is provided by shader code generation */
    state.bind.images[IMG_TEX] = sg::make_image(&&(sg::ImageDesc) {
        .width = 4,
        .height = 4,
        .data.subimage[0][0] = { .ptr = &pixels, .size = $sizeof(pixels) },
    });

    // a sampler with default options to sample the above image as texture
    state.bind.samplers[SMP_SMP] = sg::make_sampler(&&(sg::SamplerDesc) {});

    // shader and pipeline object
    state.pip = sg::make_pipeline(&&(PipelineDesc) {
        .shader = sg::make_shader(&&texcube_shader_desc(sg::query_backend())),
        .layout = {
            .attrs = {
                [ATTR_TEXCUBE_POS] = { .format = vertex_format::FLOAT3 },
                [ATTR_TEXCUBE_COLOR0] = { .format = vertex_format::UBYTE4N },
                [ATTR_TEXCUBE_TEXCOORD0] = { .format = vertex_format::SHORT2N },
            },
        },
        .index_type = index_type::UINT16,
        .cull_mode = cull_mode::BACK,
        .depth = {
            .compare = compare_func::LESS_EQUAL,
            .write_enabled = true,
        },
    });

    // default pass action, clear to blue-ish
    state.pass_action.colors[0] = { .load_action = load_action::CLEAR, .clear_value = { 0.25, 0.5, 0.75, 1.0 } };
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
    sg::begin_pass(&&(Pass) { .action = state.pass_action, .swapchain = sglue::swapchain() });
    sg::apply_pipeline(state.pip);
    sg::apply_bindings(&state.bind);
    sg::apply_uniforms(UB_VS_PARAMS, &&(sg::Range) { .ptr = &vs_params, .size = $sizeof(vs_params) } );
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
    sapp::run(&&(sapp::Desc) {
        .init_cb = &init,
        .frame_cb = &frame,
        .cleanup_cb = &cleanup,
        .width = 800,
        .height = 600,
        .sample_count = 4,
        .window_title = "texcube",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
