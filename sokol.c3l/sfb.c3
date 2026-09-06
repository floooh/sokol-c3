// machine generated, do not edit

module sokol::sfb;
import sokol;

extern fn void setup(SfbDesc* desc) @cname("sfb_setup");
extern fn void shutdown() @cname("sfb_shutdown");
extern fn SfbFramebuffer make_framebuffer(SfbFramebufferDesc* desc) @cname("sfb_make_framebuffer");
extern fn void destroy_framebuffer(SfbFramebuffer fb) @cname("sfb_destroy_framebuffer");
extern fn bool resize(SfbFramebuffer fb, SfbResizeDesc* desc) @cname("sfb_resize");
extern fn void update(SfbFramebuffer fb, SfbUpdateDesc* desc) @cname("sfb_update");
extern fn void render(SfbFramebuffer fb) @cname("sfb_render");
extern fn void render_ex(SfbFramebuffer fb, SfbRenderDesc* desc) @cname("sfb_render_ex");
extern fn SfbResourceState query_framebuffer_state(SfbFramebuffer fb) @cname("sfb_query_framebuffer_state");
extern fn SfbFramebufferInfo query_framebuffer_info(SfbFramebuffer fb) @cname("sfb_query_framebuffer_info");
extern fn SfbFramebufferDesc query_framebuffer_desc(SfbFramebuffer fb) @cname("sfb_query_framebuffer_desc");

const usz INVALID_ID = 0;

struct SfbFramebuffer
{
    uint id;
}

constdef SfbResourceState : uint
{
    INITIAL = 0,
    ALLOC = 1,
    VALID = 2,
    FAILED = 3,
    INVALID = 4,
}

constdef SfbFormat : uint
{
    DEFAULT = 0,
    RGBA8 = 1,
    PALETTE8 = 2,
}

struct SfbRect
{
    CInt x;
    CInt y;
    CInt width;
    CInt height;
}

struct SfbRenderPassDesc
{
    SgPixelFormat color_format;
    SgPixelFormat depth_format;
    CInt sample_count;
}

struct SfbFramebufferDesc
{
    CInt width;
    CInt height;
    CInt prescale;
    SfbFormat format;
    SfbRect cliprect;
    bool rotate90;
    SfbRenderPassDesc render_pass;
}

struct SfbResizeDesc
{
    CInt width;
    CInt height;
    CInt prescale;
    SfbRect cliprect;
}

struct SfbUpdateDesc
{
    SgRange pixels;
    SgRange palette;
}

struct SfbRenderDesc
{
    bool use_nearest_filter;
    SgPipeline pip;
    SgView[32] views;
    SgSampler[12] samplers;
    SgRange[8] uniforms;
}

struct SfbTextureInfo
{
    CInt width;
    CInt height;
    SgPixelFormat pixel_format;
    SgImage image;
    SgView tex_view;
}

struct SfbFramebufferInfo
{
    SfbTextureInfo update;
    SfbTextureInfo offscreen;
    SfbTextureInfo palette;
    SgSampler nearest_sampler;
    SgSampler linear_sampler;
}

struct SfbAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct SfbLogger
{
    LogCb func;
    void* user_data;
}

struct SfbDesc
{
    CInt framebuffer_pool_size;
    SfbAllocator allocator;
    SfbLogger logger;
}

alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);
alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);

