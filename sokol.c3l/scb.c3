// machine generated, do not edit

module sokol::scb;
import sokol;

extern fn void setup(ScbDesc* desc) @cname("scb_setup");
extern fn void shutdown() @cname("scb_shutdown");
extern fn ScbCmdbuf make_cmdbuf(ScbCmdbufDesc* desc) @cname("scb_make_cmdbuf");
extern fn void destroy_cmdbuf(ScbCmdbuf cb) @cname("scb_destroy_cmdbuf");
extern fn void submit(ScbCmdbuf cb) @cname("scb_submit");
extern fn void reset(ScbCmdbuf cb) @cname("scb_reset");
extern fn void apply_viewport(ScbCmdbuf cb, CInt x, CInt y, CInt width, CInt height, bool origin_top_left) @cname("scb_apply_viewport");
extern fn void apply_viewportf(ScbCmdbuf cb, float x, float y, float width, float height, bool origin_top_left) @cname("scb_apply_viewportf");
extern fn void apply_scissor_rect(ScbCmdbuf cb, CInt x, CInt y, CInt width, CInt height, bool origin_top_left) @cname("scb_apply_scissor_rect");
extern fn void apply_scissor_rectf(ScbCmdbuf cb, float x, float y, float width, float height, bool origin_top_left) @cname("scb_apply_scissor_rectf");
extern fn void apply_pipeline(ScbCmdbuf cb, SgPipeline pip) @cname("scb_apply_pipeline");
extern fn void apply_bindings(ScbCmdbuf cb, SgBindings* bindings) @cname("scb_apply_bindings");
extern fn void apply_uniforms(ScbCmdbuf cb, CInt ub_slot, SgRange* data) @cname("scb_apply_uniforms");
extern fn void draw(ScbCmdbuf cb, CInt base_element, CInt num_elements, CInt num_instances) @cname("scb_draw");
extern fn void draw_ex(ScbCmdbuf cb, CInt base_element, CInt num_elements, CInt num_instances, CInt base_vertex, CInt base_instance) @cname("scb_draw_ex");
extern fn void dispatch(ScbCmdbuf cb, CInt num_groups_x, CInt num_groups_y, CInt num_groups_z) @cname("scb_dispatch");
extern fn ScbResourceState query_cmdbuf_state(ScbCmdbuf cb) @cname("scb_query_cmdbuf_state");
extern fn ScbCmdbufInfo query_cmdbuf_info(ScbCmdbuf cb) @cname("scb_query_cmdbuf_info");

const usz INVALID_ID = 0;

struct ScbCmdbuf
{
    uint id;
}

constdef ScbResourceState : uint
{
    INITIAL = 0,
    ALLOC = 1,
    VALID = 2,
    FAILED = 3,
    INVALID = 4,
}

struct ScbCmdbufDesc
{
    usz size;
    ZString label;
}

struct ScbCmdbufInfo
{
    usz size;
    usz remaining;
    bool overflown;
}

constdef ScbLogItem : int
{
    OK = 0,
    MALLOC_FAILED = 1,
    CMDBUF_POOL_EXHAUSTED = 2,
    CMDBUF_OVERFLOW = 3,
    CMDBUF_NOT_VALID = 4,
    SUBMIT_CMDBUF_OVERFLOWN = 5,
    SUBMIT_INVALID_COMMAND = 6,
}

struct ScbLogger
{
    LogCb func;
    void* user_data;
}

struct ScbAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct ScbDesc
{
    CInt cmdbuf_pool_size;
    ScbAllocator allocator;
    ScbLogger logger;
}

alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);
alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);

