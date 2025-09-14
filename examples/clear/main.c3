//------------------------------------------------------------------------------
//  clear/main.c3
//
//  Minimal sample which just clears the default framebuffer.
//------------------------------------------------------------------------------

import std::io;

import sokol;

SgPassAction pass_action;

fn void init()
{
    sg::setup(&&(SgDesc) {
        .environment = sglue::environment(),
        .logger.func = &slog::func,
    });
    pass_action.colors[0] = { .load_action = CLEAR, .clear_value = { 1.0, 0.0, 0.0, 1.0 } };

    // just some debug output what backend we're running on
    switch (sg::query_backend())
    {
        case D3D11:
            io::printfn(">> using D3D11 backend");
        case GLCORE:
        case GLES3:
            io::printfn(">> using GL backend");
        case METAL_MACOS:
        case METAL_IOS:
        case METAL_SIMULATOR:
            io::printfn(">> using Metal backend");
        case WGPU:
            io::printfn(">> using WebGPU backend");
        case DUMMY:
            io::printfn(">> using dummy backend");
    }
}

fn void frame()
{
    float g = pass_action.colors[0].clear_value.g + 0.01;
    pass_action.colors[0].clear_value.g = g > 1.0 ? 0.0 : g;
    sg::begin_pass(&&(SgPass) { .action = pass_action, .swapchain = sglue::swapchain() });
    sg::end_pass();
    sg::commit();
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
        .width = 400,
        .height = 300,
        .window_title = "clear",
        .icon.sokol_default = true,
        .logger.func = &slog::func,
    });
}
