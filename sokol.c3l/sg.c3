// machine generated, do not edit

module sokol::sg;
import sokol;

extern fn void setup(SgDesc* desc) @extern("sg_setup");
extern fn void shutdown() @extern("sg_shutdown");
extern fn bool isvalid() @extern("sg_isvalid");
extern fn void reset_state_cache() @extern("sg_reset_state_cache");
extern fn void push_debug_group(ZString name) @extern("sg_push_debug_group");
extern fn void pop_debug_group() @extern("sg_pop_debug_group");
extern fn bool add_commit_listener(SgCommitListener listener) @extern("sg_add_commit_listener");
extern fn bool remove_commit_listener(SgCommitListener listener) @extern("sg_remove_commit_listener");
extern fn SgBuffer make_buffer(SgBufferDesc* desc) @extern("sg_make_buffer");
extern fn SgImage make_image(SgImageDesc* desc) @extern("sg_make_image");
extern fn SgSampler make_sampler(SgSamplerDesc* desc) @extern("sg_make_sampler");
extern fn SgShader make_shader(SgShaderDesc* desc) @extern("sg_make_shader");
extern fn SgPipeline make_pipeline(SgPipelineDesc* desc) @extern("sg_make_pipeline");
extern fn SgView make_view(SgViewDesc* desc) @extern("sg_make_view");
extern fn void destroy_buffer(SgBuffer buf) @extern("sg_destroy_buffer");
extern fn void destroy_image(SgImage img) @extern("sg_destroy_image");
extern fn void destroy_sampler(SgSampler smp) @extern("sg_destroy_sampler");
extern fn void destroy_shader(SgShader shd) @extern("sg_destroy_shader");
extern fn void destroy_pipeline(SgPipeline pip) @extern("sg_destroy_pipeline");
extern fn void destroy_view(SgView view) @extern("sg_destroy_view");
extern fn void update_buffer(SgBuffer buf, SgRange* data) @extern("sg_update_buffer");
extern fn void update_image(SgImage img, SgImageData* data) @extern("sg_update_image");
extern fn CInt append_buffer(SgBuffer buf, SgRange* data) @extern("sg_append_buffer");
extern fn bool query_buffer_overflow(SgBuffer buf) @extern("sg_query_buffer_overflow");
extern fn bool query_buffer_will_overflow(SgBuffer buf, usz size) @extern("sg_query_buffer_will_overflow");
extern fn void begin_pass(SgPass* pass) @extern("sg_begin_pass");
extern fn void apply_viewport(CInt x, CInt y, CInt width, CInt height, bool origin_top_left) @extern("sg_apply_viewport");
extern fn void apply_viewportf(float x, float y, float width, float height, bool origin_top_left) @extern("sg_apply_viewportf");
extern fn void apply_scissor_rect(CInt x, CInt y, CInt width, CInt height, bool origin_top_left) @extern("sg_apply_scissor_rect");
extern fn void apply_scissor_rectf(float x, float y, float width, float height, bool origin_top_left) @extern("sg_apply_scissor_rectf");
extern fn void apply_pipeline(SgPipeline pip) @extern("sg_apply_pipeline");
extern fn void apply_bindings(SgBindings* bindings) @extern("sg_apply_bindings");
extern fn void apply_uniforms(CInt ub_slot, SgRange* data) @extern("sg_apply_uniforms");
extern fn void draw(CInt base_element, CInt num_elements, CInt num_instances) @extern("sg_draw");
extern fn void dispatch(CInt num_groups_x, CInt num_groups_y, CInt num_groups_z) @extern("sg_dispatch");
extern fn void end_pass() @extern("sg_end_pass");
extern fn void commit() @extern("sg_commit");
extern fn SgDesc query_desc() @extern("sg_query_desc");
extern fn SgBackend query_backend() @extern("sg_query_backend");
extern fn SgFeatures query_features() @extern("sg_query_features");
extern fn SgLimits query_limits() @extern("sg_query_limits");
extern fn SgPixelformatInfo query_pixelformat(SgPixelFormat fmt) @extern("sg_query_pixelformat");
extern fn CInt query_row_pitch(SgPixelFormat fmt, CInt width, CInt row_align_bytes) @extern("sg_query_row_pitch");
extern fn CInt query_surface_pitch(SgPixelFormat fmt, CInt width, CInt height, CInt row_align_bytes) @extern("sg_query_surface_pitch");
extern fn SgResourceState query_buffer_state(SgBuffer buf) @extern("sg_query_buffer_state");
extern fn SgResourceState query_image_state(SgImage img) @extern("sg_query_image_state");
extern fn SgResourceState query_sampler_state(SgSampler smp) @extern("sg_query_sampler_state");
extern fn SgResourceState query_shader_state(SgShader shd) @extern("sg_query_shader_state");
extern fn SgResourceState query_pipeline_state(SgPipeline pip) @extern("sg_query_pipeline_state");
extern fn SgResourceState query_view_state(SgView view) @extern("sg_query_view_state");
extern fn SgBufferInfo query_buffer_info(SgBuffer buf) @extern("sg_query_buffer_info");
extern fn SgImageInfo query_image_info(SgImage img) @extern("sg_query_image_info");
extern fn SgSamplerInfo query_sampler_info(SgSampler smp) @extern("sg_query_sampler_info");
extern fn SgShaderInfo query_shader_info(SgShader shd) @extern("sg_query_shader_info");
extern fn SgPipelineInfo query_pipeline_info(SgPipeline pip) @extern("sg_query_pipeline_info");
extern fn SgViewInfo query_view_info(SgView view) @extern("sg_query_view_info");
extern fn SgBufferDesc query_buffer_desc(SgBuffer buf) @extern("sg_query_buffer_desc");
extern fn SgImageDesc query_image_desc(SgImage img) @extern("sg_query_image_desc");
extern fn SgSamplerDesc query_sampler_desc(SgSampler smp) @extern("sg_query_sampler_desc");
extern fn SgShaderDesc query_shader_desc(SgShader shd) @extern("sg_query_shader_desc");
extern fn SgPipelineDesc query_pipeline_desc(SgPipeline pip) @extern("sg_query_pipeline_desc");
extern fn SgViewDesc query_view_desc(SgView view) @extern("sg_query_view_desc");
extern fn SgBufferDesc query_buffer_defaults(SgBufferDesc* desc) @extern("sg_query_buffer_defaults");
extern fn SgImageDesc query_image_defaults(SgImageDesc* desc) @extern("sg_query_image_defaults");
extern fn SgSamplerDesc query_sampler_defaults(SgSamplerDesc* desc) @extern("sg_query_sampler_defaults");
extern fn SgShaderDesc query_shader_defaults(SgShaderDesc* desc) @extern("sg_query_shader_defaults");
extern fn SgPipelineDesc query_pipeline_defaults(SgPipelineDesc* desc) @extern("sg_query_pipeline_defaults");
extern fn SgViewDesc query_view_defaults(SgViewDesc* desc) @extern("sg_query_view_defaults");
extern fn usz query_buffer_size(SgBuffer buf) @extern("sg_query_buffer_size");
extern fn SgBufferUsage query_buffer_usage(SgBuffer buf) @extern("sg_query_buffer_usage");
extern fn SgImageType query_image_type(SgImage img) @extern("sg_query_image_type");
extern fn CInt query_image_width(SgImage img) @extern("sg_query_image_width");
extern fn CInt query_image_height(SgImage img) @extern("sg_query_image_height");
extern fn CInt query_image_num_slices(SgImage img) @extern("sg_query_image_num_slices");
extern fn CInt query_image_num_mipmaps(SgImage img) @extern("sg_query_image_num_mipmaps");
extern fn SgPixelFormat query_image_pixelformat(SgImage img) @extern("sg_query_image_pixelformat");
extern fn SgImageUsage query_image_usage(SgImage img) @extern("sg_query_image_usage");
extern fn CInt query_image_sample_count(SgImage img) @extern("sg_query_image_sample_count");
extern fn SgViewType query_view_type(SgView view) @extern("sg_query_view_type");
extern fn SgImage query_view_image(SgView view) @extern("sg_query_view_image");
extern fn SgBuffer query_view_buffer(SgView view) @extern("sg_query_view_buffer");
extern fn SgBuffer alloc_buffer() @extern("sg_alloc_buffer");
extern fn SgImage alloc_image() @extern("sg_alloc_image");
extern fn SgSampler alloc_sampler() @extern("sg_alloc_sampler");
extern fn SgShader alloc_shader() @extern("sg_alloc_shader");
extern fn SgPipeline alloc_pipeline() @extern("sg_alloc_pipeline");
extern fn SgView alloc_view() @extern("sg_alloc_view");
extern fn void dealloc_buffer(SgBuffer buf) @extern("sg_dealloc_buffer");
extern fn void dealloc_image(SgImage img) @extern("sg_dealloc_image");
extern fn void dealloc_sampler(SgSampler smp) @extern("sg_dealloc_sampler");
extern fn void dealloc_shader(SgShader shd) @extern("sg_dealloc_shader");
extern fn void dealloc_pipeline(SgPipeline pip) @extern("sg_dealloc_pipeline");
extern fn void dealloc_view(SgView view) @extern("sg_dealloc_view");
extern fn void init_buffer(SgBuffer buf, SgBufferDesc* desc) @extern("sg_init_buffer");
extern fn void init_image(SgImage img, SgImageDesc* desc) @extern("sg_init_image");
extern fn void init_sampler(SgSampler smg, SgSamplerDesc* desc) @extern("sg_init_sampler");
extern fn void init_shader(SgShader shd, SgShaderDesc* desc) @extern("sg_init_shader");
extern fn void init_pipeline(SgPipeline pip, SgPipelineDesc* desc) @extern("sg_init_pipeline");
extern fn void init_view(SgView view, SgViewDesc* desc) @extern("sg_init_view");
extern fn void uninit_buffer(SgBuffer buf) @extern("sg_uninit_buffer");
extern fn void uninit_image(SgImage img) @extern("sg_uninit_image");
extern fn void uninit_sampler(SgSampler smp) @extern("sg_uninit_sampler");
extern fn void uninit_shader(SgShader shd) @extern("sg_uninit_shader");
extern fn void uninit_pipeline(SgPipeline pip) @extern("sg_uninit_pipeline");
extern fn void uninit_view(SgView view) @extern("sg_uninit_view");
extern fn void fail_buffer(SgBuffer buf) @extern("sg_fail_buffer");
extern fn void fail_image(SgImage img) @extern("sg_fail_image");
extern fn void fail_sampler(SgSampler smp) @extern("sg_fail_sampler");
extern fn void fail_shader(SgShader shd) @extern("sg_fail_shader");
extern fn void fail_pipeline(SgPipeline pip) @extern("sg_fail_pipeline");
extern fn void fail_view(SgView view) @extern("sg_fail_view");
extern fn void enable_frame_stats() @extern("sg_enable_frame_stats");
extern fn void disable_frame_stats() @extern("sg_disable_frame_stats");
extern fn bool frame_stats_enabled() @extern("sg_frame_stats_enabled");
extern fn SgFrameStats query_frame_stats() @extern("sg_query_frame_stats");
extern fn void* d3d11_device() @extern("sg_d3d11_device");
extern fn void* d3d11_device_context() @extern("sg_d3d11_device_context");
extern fn SgD3d11BufferInfo d3d11_query_buffer_info(SgBuffer buf) @extern("sg_d3d11_query_buffer_info");
extern fn SgD3d11ImageInfo d3d11_query_image_info(SgImage img) @extern("sg_d3d11_query_image_info");
extern fn SgD3d11SamplerInfo d3d11_query_sampler_info(SgSampler smp) @extern("sg_d3d11_query_sampler_info");
extern fn SgD3d11ShaderInfo d3d11_query_shader_info(SgShader shd) @extern("sg_d3d11_query_shader_info");
extern fn SgD3d11PipelineInfo d3d11_query_pipeline_info(SgPipeline pip) @extern("sg_d3d11_query_pipeline_info");
extern fn SgD3d11ViewInfo d3d11_query_view_info(SgView view) @extern("sg_d3d11_query_view_info");
extern fn void* mtl_device() @extern("sg_mtl_device");
extern fn void* mtl_render_command_encoder() @extern("sg_mtl_render_command_encoder");
extern fn void* mtl_compute_command_encoder() @extern("sg_mtl_compute_command_encoder");
extern fn SgMtlBufferInfo mtl_query_buffer_info(SgBuffer buf) @extern("sg_mtl_query_buffer_info");
extern fn SgMtlImageInfo mtl_query_image_info(SgImage img) @extern("sg_mtl_query_image_info");
extern fn SgMtlSamplerInfo mtl_query_sampler_info(SgSampler smp) @extern("sg_mtl_query_sampler_info");
extern fn SgMtlShaderInfo mtl_query_shader_info(SgShader shd) @extern("sg_mtl_query_shader_info");
extern fn SgMtlPipelineInfo mtl_query_pipeline_info(SgPipeline pip) @extern("sg_mtl_query_pipeline_info");
extern fn void* wgpu_device() @extern("sg_wgpu_device");
extern fn void* wgpu_queue() @extern("sg_wgpu_queue");
extern fn void* wgpu_command_encoder() @extern("sg_wgpu_command_encoder");
extern fn void* wgpu_render_pass_encoder() @extern("sg_wgpu_render_pass_encoder");
extern fn void* wgpu_compute_pass_encoder() @extern("sg_wgpu_compute_pass_encoder");
extern fn SgWgpuBufferInfo wgpu_query_buffer_info(SgBuffer buf) @extern("sg_wgpu_query_buffer_info");
extern fn SgWgpuImageInfo wgpu_query_image_info(SgImage img) @extern("sg_wgpu_query_image_info");
extern fn SgWgpuSamplerInfo wgpu_query_sampler_info(SgSampler smp) @extern("sg_wgpu_query_sampler_info");
extern fn SgWgpuShaderInfo wgpu_query_shader_info(SgShader shd) @extern("sg_wgpu_query_shader_info");
extern fn SgWgpuPipelineInfo wgpu_query_pipeline_info(SgPipeline pip) @extern("sg_wgpu_query_pipeline_info");
extern fn SgWgpuViewInfo wgpu_query_view_info(SgView view) @extern("sg_wgpu_query_view_info");
extern fn SgGlBufferInfo gl_query_buffer_info(SgBuffer buf) @extern("sg_gl_query_buffer_info");
extern fn SgGlImageInfo gl_query_image_info(SgImage img) @extern("sg_gl_query_image_info");
extern fn SgGlSamplerInfo gl_query_sampler_info(SgSampler smp) @extern("sg_gl_query_sampler_info");
extern fn SgGlShaderInfo gl_query_shader_info(SgShader shd) @extern("sg_gl_query_shader_info");
extern fn SgGlViewInfo gl_query_view_info(SgView view) @extern("sg_gl_query_view_info");

struct SgBuffer
{
    uint id;
}

struct SgImage
{
    uint id;
}

struct SgSampler
{
    uint id;
}

struct SgShader
{
    uint id;
}

struct SgPipeline
{
    uint id;
}

struct SgView
{
    uint id;
}

struct SgRange
{
    void* ptr;
    usz size;
}

const uint INVALID_ID = 0;
const usz NUM_INFLIGHT_FRAMES = 2;
const usz MAX_COLOR_ATTACHMENTS = 4;
const usz MAX_UNIFORMBLOCK_MEMBERS = 16;
const usz MAX_VERTEX_ATTRIBUTES = 16;
const usz MAX_MIPMAPS = 16;
const usz MAX_VERTEXBUFFER_BINDSLOTS = 8;
const usz MAX_UNIFORMBLOCK_BINDSLOTS = 8;
const usz MAX_VIEW_BINDSLOTS = 28;
const usz MAX_SAMPLER_BINDSLOTS = 16;
const usz MAX_TEXTURE_SAMPLER_PAIRS = 16;

struct SgColor
{
    float r;
    float g;
    float b;
    float a;
}

enum SgBackend : const int
{
    GLCORE = 0,
    GLES3 = 1,
    D3D11 = 2,
    METAL_IOS = 3,
    METAL_MACOS = 4,
    METAL_SIMULATOR = 5,
    WGPU = 6,
    DUMMY = 7,
}

enum SgPixelFormat : const uint
{
    DEFAULT = 0,
    NONE = 1,
    R8 = 2,
    R8SN = 3,
    R8UI = 4,
    R8SI = 5,
    R16 = 6,
    R16SN = 7,
    R16UI = 8,
    R16SI = 9,
    R16F = 10,
    RG8 = 11,
    RG8SN = 12,
    RG8UI = 13,
    RG8SI = 14,
    R32UI = 15,
    R32SI = 16,
    R32F = 17,
    RG16 = 18,
    RG16SN = 19,
    RG16UI = 20,
    RG16SI = 21,
    RG16F = 22,
    RGBA8 = 23,
    SRGB8A8 = 24,
    RGBA8SN = 25,
    RGBA8UI = 26,
    RGBA8SI = 27,
    BGRA8 = 28,
    RGB10A2 = 29,
    RG11B10F = 30,
    RGB9E5 = 31,
    RG32UI = 32,
    RG32SI = 33,
    RG32F = 34,
    RGBA16 = 35,
    RGBA16SN = 36,
    RGBA16UI = 37,
    RGBA16SI = 38,
    RGBA16F = 39,
    RGBA32UI = 40,
    RGBA32SI = 41,
    RGBA32F = 42,
    DEPTH = 43,
    DEPTH_STENCIL = 44,
    BC1_RGBA = 45,
    BC2_RGBA = 46,
    BC3_RGBA = 47,
    BC3_SRGBA = 48,
    BC4_R = 49,
    BC4_RSN = 50,
    BC5_RG = 51,
    BC5_RGSN = 52,
    BC6H_RGBF = 53,
    BC6H_RGBUF = 54,
    BC7_RGBA = 55,
    BC7_SRGBA = 56,
    ETC2_RGB8 = 57,
    ETC2_SRGB8 = 58,
    ETC2_RGB8A1 = 59,
    ETC2_RGBA8 = 60,
    ETC2_SRGB8A8 = 61,
    EAC_R11 = 62,
    EAC_R11SN = 63,
    EAC_RG11 = 64,
    EAC_RG11SN = 65,
    ASTC_4X4_RGBA = 66,
    ASTC_4X4_SRGBA = 67,
    NUM = 68,
}

struct SgPixelformatInfo
{
    bool sample;
    bool filter;
    bool render;
    bool blend;
    bool msaa;
    bool depth;
    bool compressed;
    bool read;
    bool write;
    CInt bytes_per_pixel;
}

struct SgFeatures
{
    bool origin_top_left;
    bool image_clamp_to_border;
    bool mrt_independent_blend_state;
    bool mrt_independent_write_mask;
    bool compute;
    bool msaa_texture_bindings;
    bool separate_buffer_types;
    bool gl_texture_views;
}

struct SgLimits
{
    CInt max_image_size_2d;
    CInt max_image_size_cube;
    CInt max_image_size_3d;
    CInt max_image_size_array;
    CInt max_image_array_layers;
    CInt max_vertex_attrs;
    CInt gl_max_vertex_uniform_components;
    CInt gl_max_combined_texture_image_units;
}

enum SgResourceState : const uint
{
    INITIAL = 0,
    ALLOC = 1,
    VALID = 2,
    FAILED = 3,
    INVALID = 4,
}

enum SgIndexType : const uint
{
    DEFAULT = 0,
    NONE = 1,
    UINT16 = 2,
    UINT32 = 3,
    NUM = 4,
}

enum SgImageType : const uint
{
    DEFAULT = 0,
    TYPE_2D = 1,
    CUBE = 2,
    TYPE_3D = 3,
    ARRAY = 4,
    NUM = 5,
}

enum SgImageSampleType : const uint
{
    DEFAULT = 0,
    FLOAT = 1,
    DEPTH = 2,
    SINT = 3,
    UINT = 4,
    UNFILTERABLE_FLOAT = 5,
    NUM = 6,
}

enum SgSamplerType : const uint
{
    DEFAULT = 0,
    FILTERING = 1,
    NONFILTERING = 2,
    COMPARISON = 3,
    NUM = 4,
}

enum SgPrimitiveType : const uint
{
    DEFAULT = 0,
    POINTS = 1,
    LINES = 2,
    LINE_STRIP = 3,
    TRIANGLES = 4,
    TRIANGLE_STRIP = 5,
    NUM = 6,
}

enum SgFilter : const uint
{
    DEFAULT = 0,
    NEAREST = 1,
    LINEAR = 2,
    NUM = 3,
}

enum SgWrap : const uint
{
    DEFAULT = 0,
    REPEAT = 1,
    CLAMP_TO_EDGE = 2,
    CLAMP_TO_BORDER = 3,
    MIRRORED_REPEAT = 4,
    NUM = 5,
}

enum SgBorderColor : const uint
{
    DEFAULT = 0,
    TRANSPARENT_BLACK = 1,
    OPAQUE_BLACK = 2,
    OPAQUE_WHITE = 3,
    NUM = 4,
}

enum SgVertexFormat : const uint
{
    INVALID = 0,
    FLOAT = 1,
    FLOAT2 = 2,
    FLOAT3 = 3,
    FLOAT4 = 4,
    INT = 5,
    INT2 = 6,
    INT3 = 7,
    INT4 = 8,
    UINT = 9,
    UINT2 = 10,
    UINT3 = 11,
    UINT4 = 12,
    BYTE4 = 13,
    BYTE4N = 14,
    UBYTE4 = 15,
    UBYTE4N = 16,
    SHORT2 = 17,
    SHORT2N = 18,
    USHORT2 = 19,
    USHORT2N = 20,
    SHORT4 = 21,
    SHORT4N = 22,
    USHORT4 = 23,
    USHORT4N = 24,
    UINT10_N2 = 25,
    HALF2 = 26,
    HALF4 = 27,
    NUM = 28,
}

enum SgVertexStep : const uint
{
    DEFAULT = 0,
    PER_VERTEX = 1,
    PER_INSTANCE = 2,
    NUM = 3,
}

enum SgUniformType : const uint
{
    INVALID = 0,
    FLOAT = 1,
    FLOAT2 = 2,
    FLOAT3 = 3,
    FLOAT4 = 4,
    INT = 5,
    INT2 = 6,
    INT3 = 7,
    INT4 = 8,
    MAT4 = 9,
    NUM = 10,
}

enum SgUniformLayout : const uint
{
    DEFAULT = 0,
    NATIVE = 1,
    STD140 = 2,
    NUM = 3,
}

enum SgCullMode : const uint
{
    DEFAULT = 0,
    NONE = 1,
    FRONT = 2,
    BACK = 3,
    NUM = 4,
}

enum SgFaceWinding : const uint
{
    DEFAULT = 0,
    CCW = 1,
    CW = 2,
    NUM = 3,
}

enum SgCompareFunc : const uint
{
    DEFAULT = 0,
    NEVER = 1,
    LESS = 2,
    EQUAL = 3,
    LESS_EQUAL = 4,
    GREATER = 5,
    NOT_EQUAL = 6,
    GREATER_EQUAL = 7,
    ALWAYS = 8,
    NUM = 9,
}

enum SgStencilOp : const uint
{
    DEFAULT = 0,
    KEEP = 1,
    ZERO = 2,
    REPLACE = 3,
    INCR_CLAMP = 4,
    DECR_CLAMP = 5,
    INVERT = 6,
    INCR_WRAP = 7,
    DECR_WRAP = 8,
    NUM = 9,
}

enum SgBlendFactor : const uint
{
    DEFAULT = 0,
    ZERO = 1,
    ONE = 2,
    SRC_COLOR = 3,
    ONE_MINUS_SRC_COLOR = 4,
    SRC_ALPHA = 5,
    ONE_MINUS_SRC_ALPHA = 6,
    DST_COLOR = 7,
    ONE_MINUS_DST_COLOR = 8,
    DST_ALPHA = 9,
    ONE_MINUS_DST_ALPHA = 10,
    SRC_ALPHA_SATURATED = 11,
    BLEND_COLOR = 12,
    ONE_MINUS_BLEND_COLOR = 13,
    BLEND_ALPHA = 14,
    ONE_MINUS_BLEND_ALPHA = 15,
    NUM = 16,
}

enum SgBlendOp : const uint
{
    DEFAULT = 0,
    ADD = 1,
    SUBTRACT = 2,
    REVERSE_SUBTRACT = 3,
    MIN = 4,
    MAX = 5,
    NUM = 6,
}

enum SgColorMask : const uint
{
    DEFAULT = 0,
    NONE = 16,
    R = 1,
    G = 2,
    RG = 3,
    B = 4,
    RB = 5,
    GB = 6,
    RGB = 7,
    A = 8,
    RA = 9,
    GA = 10,
    RGA = 11,
    BA = 12,
    RBA = 13,
    GBA = 14,
    RGBA = 15,
}

enum SgLoadAction : const uint
{
    DEFAULT = 0,
    CLEAR = 1,
    LOAD = 2,
    DONTCARE = 3,
}

enum SgStoreAction : const uint
{
    DEFAULT = 0,
    STORE = 1,
    DONTCARE = 2,
}

struct SgColorAttachmentAction
{
    SgLoadAction load_action;
    SgStoreAction store_action;
    SgColor clear_value;
}

struct SgDepthAttachmentAction
{
    SgLoadAction load_action;
    SgStoreAction store_action;
    float clear_value;
}

struct SgStencilAttachmentAction
{
    SgLoadAction load_action;
    SgStoreAction store_action;
    char clear_value;
}

struct SgPassAction
{
    SgColorAttachmentAction[4] colors;
    SgDepthAttachmentAction depth;
    SgStencilAttachmentAction stencil;
}

struct SgMetalSwapchain
{
    void* current_drawable;
    void* depth_stencil_texture;
    void* msaa_color_texture;
}

struct SgD3d11Swapchain
{
    void* render_view;
    void* resolve_view;
    void* depth_stencil_view;
}

struct SgWgpuSwapchain
{
    void* render_view;
    void* resolve_view;
    void* depth_stencil_view;
}

struct SgGlSwapchain
{
    uint framebuffer;
}

struct SgSwapchain
{
    CInt width;
    CInt height;
    CInt sample_count;
    SgPixelFormat color_format;
    SgPixelFormat depth_format;
    SgMetalSwapchain metal;
    SgD3d11Swapchain d3d11;
    SgWgpuSwapchain wgpu;
    SgGlSwapchain gl;
}

struct SgAttachments
{
    SgView[4] colors;
    SgView[4] resolves;
    SgView depth_stencil;
}

struct SgPass
{
    uint _start_canary;
    bool compute;
    SgPassAction action;
    SgAttachments attachments;
    SgSwapchain swapchain;
    ZString label;
    uint _end_canary;
}

struct SgBindings
{
    uint _start_canary;
    SgBuffer[8] vertex_buffers;
    CInt[8] vertex_buffer_offsets;
    SgBuffer index_buffer;
    CInt index_buffer_offset;
    SgView[28] views;
    SgSampler[16] samplers;
    uint _end_canary;
}

struct SgBufferUsage
{
    bool vertex_buffer;
    bool index_buffer;
    bool storage_buffer;
    bool immutable;
    bool dynamic_update;
    bool stream_update;
}

struct SgBufferDesc
{
    uint _start_canary;
    usz size;
    SgBufferUsage usage;
    SgRange data;
    ZString label;
    uint[2] gl_buffers;
    void*[2] mtl_buffers;
    void* d3d11_buffer;
    void* wgpu_buffer;
    uint _end_canary;
}

struct SgImageUsage
{
    bool storage_image;
    bool color_attachment;
    bool resolve_attachment;
    bool depth_stencil_attachment;
    bool immutable;
    bool dynamic_update;
    bool stream_update;
}

enum SgViewType : const uint
{
    INVALID = 0,
    STORAGEBUFFER = 1,
    STORAGEIMAGE = 2,
    TEXTURE = 3,
    COLORATTACHMENT = 4,
    RESOLVEATTACHMENT = 5,
    DEPTHSTENCILATTACHMENT = 6,
}

struct SgImageData
{
    SgRange[16] mip_levels;
}

struct SgImageDesc
{
    uint _start_canary;
    SgImageType type;
    SgImageUsage usage;
    CInt width;
    CInt height;
    CInt num_slices;
    CInt num_mipmaps;
    SgPixelFormat pixel_format;
    CInt sample_count;
    SgImageData data;
    ZString label;
    uint[2] gl_textures;
    uint gl_texture_target;
    void*[2] mtl_textures;
    void* d3d11_texture;
    void* wgpu_texture;
    uint _end_canary;
}

struct SgSamplerDesc
{
    uint _start_canary;
    SgFilter min_filter;
    SgFilter mag_filter;
    SgFilter mipmap_filter;
    SgWrap wrap_u;
    SgWrap wrap_v;
    SgWrap wrap_w;
    float min_lod;
    float max_lod;
    SgBorderColor border_color;
    SgCompareFunc compare;
    uint max_anisotropy;
    ZString label;
    uint gl_sampler;
    void* mtl_sampler;
    void* d3d11_sampler;
    void* wgpu_sampler;
    uint _end_canary;
}

enum SgShaderStage : const uint
{
    NONE = 0,
    VERTEX = 1,
    FRAGMENT = 2,
    COMPUTE = 3,
}

struct SgShaderFunction
{
    ZString source;
    SgRange bytecode;
    ZString entry;
    ZString d3d11_target;
    ZString d3d11_filepath;
}

enum SgShaderAttrBaseType : const uint
{
    UNDEFINED = 0,
    FLOAT = 1,
    SINT = 2,
    UINT = 3,
}

struct SgShaderVertexAttr
{
    SgShaderAttrBaseType base_type;
    ZString glsl_name;
    ZString hlsl_sem_name;
    char hlsl_sem_index;
}

struct SgGlslShaderUniform
{
    SgUniformType type;
    ushort array_count;
    ZString glsl_name;
}

struct SgShaderUniformBlock
{
    SgShaderStage stage;
    uint size;
    char hlsl_register_b_n;
    char msl_buffer_n;
    char wgsl_group0_binding_n;
    SgUniformLayout layout;
    SgGlslShaderUniform[16] glsl_uniforms;
}

struct SgShaderTextureView
{
    SgShaderStage stage;
    SgImageType image_type;
    SgImageSampleType sample_type;
    bool multisampled;
    char hlsl_register_t_n;
    char msl_texture_n;
    char wgsl_group1_binding_n;
}

struct SgShaderStorageBufferView
{
    SgShaderStage stage;
    bool readonly;
    char hlsl_register_t_n;
    char hlsl_register_u_n;
    char msl_buffer_n;
    char wgsl_group1_binding_n;
    char glsl_binding_n;
}

struct SgShaderStorageImageView
{
    SgShaderStage stage;
    SgImageType image_type;
    SgPixelFormat access_format;
    bool writeonly;
    char hlsl_register_u_n;
    char msl_texture_n;
    char wgsl_group1_binding_n;
    char glsl_binding_n;
}

struct SgShaderView
{
    SgShaderTextureView texture;
    SgShaderStorageBufferView storage_buffer;
    SgShaderStorageImageView storage_image;
}

struct SgShaderSampler
{
    SgShaderStage stage;
    SgSamplerType sampler_type;
    char hlsl_register_s_n;
    char msl_sampler_n;
    char wgsl_group1_binding_n;
}

struct SgShaderTextureSamplerPair
{
    SgShaderStage stage;
    char view_slot;
    char sampler_slot;
    ZString glsl_name;
}

struct SgMtlShaderThreadsPerThreadgroup
{
    CInt x;
    CInt y;
    CInt z;
}

struct SgShaderDesc
{
    uint _start_canary;
    SgShaderFunction vertex_func;
    SgShaderFunction fragment_func;
    SgShaderFunction compute_func;
    SgShaderVertexAttr[16] attrs;
    SgShaderUniformBlock[8] uniform_blocks;
    SgShaderView[28] views;
    SgShaderSampler[16] samplers;
    SgShaderTextureSamplerPair[16] texture_sampler_pairs;
    SgMtlShaderThreadsPerThreadgroup mtl_threads_per_threadgroup;
    ZString label;
    uint _end_canary;
}

struct SgVertexBufferLayoutState
{
    CInt stride;
    SgVertexStep step_func;
    CInt step_rate;
}

struct SgVertexAttrState
{
    CInt buffer_index;
    CInt offset;
    SgVertexFormat format;
}

struct SgVertexLayoutState
{
    SgVertexBufferLayoutState[8] buffers;
    SgVertexAttrState[16] attrs;
}

struct SgStencilFaceState
{
    SgCompareFunc compare;
    SgStencilOp fail_op;
    SgStencilOp depth_fail_op;
    SgStencilOp pass_op;
}

struct SgStencilState
{
    bool enabled;
    SgStencilFaceState front;
    SgStencilFaceState back;
    char read_mask;
    char write_mask;
    char ref;
}

struct SgDepthState
{
    SgPixelFormat pixel_format;
    SgCompareFunc compare;
    bool write_enabled;
    float bias;
    float bias_slope_scale;
    float bias_clamp;
}

struct SgBlendState
{
    bool enabled;
    SgBlendFactor src_factor_rgb;
    SgBlendFactor dst_factor_rgb;
    SgBlendOp op_rgb;
    SgBlendFactor src_factor_alpha;
    SgBlendFactor dst_factor_alpha;
    SgBlendOp op_alpha;
}

struct SgColorTargetState
{
    SgPixelFormat pixel_format;
    SgColorMask write_mask;
    SgBlendState blend;
}

struct SgPipelineDesc
{
    uint _start_canary;
    bool compute;
    SgShader shader;
    SgVertexLayoutState layout;
    SgDepthState depth;
    SgStencilState stencil;
    CInt color_count;
    SgColorTargetState[4] colors;
    SgPrimitiveType primitive_type;
    SgIndexType index_type;
    SgCullMode cull_mode;
    SgFaceWinding face_winding;
    CInt sample_count;
    SgColor blend_color;
    bool alpha_to_coverage_enabled;
    ZString label;
    uint _end_canary;
}

struct SgBufferViewDesc
{
    SgBuffer buffer;
    CInt offset;
}

struct SgImageViewDesc
{
    SgImage image;
    CInt mip_level;
    CInt slice;
}

struct SgTextureViewRange
{
    CInt base;
    CInt count;
}

struct SgTextureViewDesc
{
    SgImage image;
    SgTextureViewRange mip_levels;
    SgTextureViewRange slices;
}

struct SgViewDesc
{
    uint _start_canary;
    SgTextureViewDesc texture;
    SgBufferViewDesc storage_buffer;
    SgImageViewDesc storage_image;
    SgImageViewDesc color_attachment;
    SgImageViewDesc resolve_attachment;
    SgImageViewDesc depth_stencil_attachment;
    ZString label;
    uint _end_canary;
}

struct SgSlotInfo
{
    SgResourceState state;
    uint res_id;
    uint uninit_count;
}

struct SgBufferInfo
{
    SgSlotInfo slot;
    uint update_frame_index;
    uint append_frame_index;
    CInt append_pos;
    bool append_overflow;
    CInt num_slots;
    CInt active_slot;
}

struct SgImageInfo
{
    SgSlotInfo slot;
    uint upd_frame_index;
    CInt num_slots;
    CInt active_slot;
}

struct SgSamplerInfo
{
    SgSlotInfo slot;
}

struct SgShaderInfo
{
    SgSlotInfo slot;
}

struct SgPipelineInfo
{
    SgSlotInfo slot;
}

struct SgViewInfo
{
    SgSlotInfo slot;
}

struct SgFrameStatsGl
{
    uint num_bind_buffer;
    uint num_active_texture;
    uint num_bind_texture;
    uint num_bind_sampler;
    uint num_bind_image_texture;
    uint num_use_program;
    uint num_render_state;
    uint num_vertex_attrib_pointer;
    uint num_vertex_attrib_divisor;
    uint num_enable_vertex_attrib_array;
    uint num_disable_vertex_attrib_array;
    uint num_uniform;
    uint num_memory_barriers;
}

struct SgFrameStatsD3d11Pass
{
    uint num_om_set_render_targets;
    uint num_clear_render_target_view;
    uint num_clear_depth_stencil_view;
    uint num_resolve_subresource;
}

struct SgFrameStatsD3d11Pipeline
{
    uint num_rs_set_state;
    uint num_om_set_depth_stencil_state;
    uint num_om_set_blend_state;
    uint num_ia_set_primitive_topology;
    uint num_ia_set_input_layout;
    uint num_vs_set_shader;
    uint num_vs_set_constant_buffers;
    uint num_ps_set_shader;
    uint num_ps_set_constant_buffers;
    uint num_cs_set_shader;
    uint num_cs_set_constant_buffers;
}

struct SgFrameStatsD3d11Bindings
{
    uint num_ia_set_vertex_buffers;
    uint num_ia_set_index_buffer;
    uint num_vs_set_shader_resources;
    uint num_vs_set_samplers;
    uint num_ps_set_shader_resources;
    uint num_ps_set_samplers;
    uint num_cs_set_shader_resources;
    uint num_cs_set_samplers;
    uint num_cs_set_unordered_access_views;
}

struct SgFrameStatsD3d11Uniforms
{
    uint num_update_subresource;
}

struct SgFrameStatsD3d11Draw
{
    uint num_draw_indexed_instanced;
    uint num_draw_indexed;
    uint num_draw_instanced;
    uint num_draw;
}

struct SgFrameStatsD3d11
{
    SgFrameStatsD3d11Pass pass;
    SgFrameStatsD3d11Pipeline pipeline;
    SgFrameStatsD3d11Bindings bindings;
    SgFrameStatsD3d11Uniforms uniforms;
    SgFrameStatsD3d11Draw draw;
    uint num_map;
    uint num_unmap;
}

struct SgFrameStatsMetalIdpool
{
    uint num_added;
    uint num_released;
    uint num_garbage_collected;
}

struct SgFrameStatsMetalPipeline
{
    uint num_set_blend_color;
    uint num_set_cull_mode;
    uint num_set_front_facing_winding;
    uint num_set_stencil_reference_value;
    uint num_set_depth_bias;
    uint num_set_render_pipeline_state;
    uint num_set_depth_stencil_state;
}

struct SgFrameStatsMetalBindings
{
    uint num_set_vertex_buffer;
    uint num_set_vertex_buffer_offset;
    uint num_skip_redundant_vertex_buffer;
    uint num_set_vertex_texture;
    uint num_skip_redundant_vertex_texture;
    uint num_set_vertex_sampler_state;
    uint num_skip_redundant_vertex_sampler_state;
    uint num_set_fragment_buffer;
    uint num_set_fragment_buffer_offset;
    uint num_skip_redundant_fragment_buffer;
    uint num_set_fragment_texture;
    uint num_skip_redundant_fragment_texture;
    uint num_set_fragment_sampler_state;
    uint num_skip_redundant_fragment_sampler_state;
    uint num_set_compute_buffer;
    uint num_set_compute_buffer_offset;
    uint num_skip_redundant_compute_buffer;
    uint num_set_compute_texture;
    uint num_skip_redundant_compute_texture;
    uint num_set_compute_sampler_state;
    uint num_skip_redundant_compute_sampler_state;
}

struct SgFrameStatsMetalUniforms
{
    uint num_set_vertex_buffer_offset;
    uint num_set_fragment_buffer_offset;
    uint num_set_compute_buffer_offset;
}

struct SgFrameStatsMetal
{
    SgFrameStatsMetalIdpool idpool;
    SgFrameStatsMetalPipeline pipeline;
    SgFrameStatsMetalBindings bindings;
    SgFrameStatsMetalUniforms uniforms;
}

struct SgFrameStatsWgpuUniforms
{
    uint num_set_bindgroup;
    uint size_write_buffer;
}

struct SgFrameStatsWgpuBindings
{
    uint num_set_vertex_buffer;
    uint num_skip_redundant_vertex_buffer;
    uint num_set_index_buffer;
    uint num_skip_redundant_index_buffer;
    uint num_create_bindgroup;
    uint num_discard_bindgroup;
    uint num_set_bindgroup;
    uint num_skip_redundant_bindgroup;
    uint num_bindgroup_cache_hits;
    uint num_bindgroup_cache_misses;
    uint num_bindgroup_cache_collisions;
    uint num_bindgroup_cache_invalidates;
    uint num_bindgroup_cache_hash_vs_key_mismatch;
}

struct SgFrameStatsWgpu
{
    SgFrameStatsWgpuUniforms uniforms;
    SgFrameStatsWgpuBindings bindings;
}

struct SgResourceStats
{
    uint total_alive;
    uint total_free;
    uint allocated;
    uint deallocated;
    uint inited;
    uint uninited;
}

struct SgFrameStats
{
    uint frame_index;
    uint num_passes;
    uint num_apply_viewport;
    uint num_apply_scissor_rect;
    uint num_apply_pipeline;
    uint num_apply_bindings;
    uint num_apply_uniforms;
    uint num_draw;
    uint num_dispatch;
    uint num_update_buffer;
    uint num_append_buffer;
    uint num_update_image;
    uint size_apply_uniforms;
    uint size_update_buffer;
    uint size_append_buffer;
    uint size_update_image;
    SgResourceStats buffers;
    SgResourceStats images;
    SgResourceStats samplers;
    SgResourceStats views;
    SgResourceStats shaders;
    SgResourceStats pipelines;
    SgFrameStatsGl gl;
    SgFrameStatsD3d11 d3d11;
    SgFrameStatsMetal metal;
    SgFrameStatsWgpu wgpu;
}

enum SgLogItem : const int
{
    OK = 0,
    MALLOC_FAILED = 1,
    GL_TEXTURE_FORMAT_NOT_SUPPORTED = 2,
    GL_3D_TEXTURES_NOT_SUPPORTED = 3,
    GL_ARRAY_TEXTURES_NOT_SUPPORTED = 4,
    GL_STORAGEBUFFER_GLSL_BINDING_OUT_OF_RANGE = 5,
    GL_STORAGEIMAGE_GLSL_BINDING_OUT_OF_RANGE = 6,
    GL_SHADER_COMPILATION_FAILED = 7,
    GL_SHADER_LINKING_FAILED = 8,
    GL_VERTEX_ATTRIBUTE_NOT_FOUND_IN_SHADER = 9,
    GL_UNIFORMBLOCK_NAME_NOT_FOUND_IN_SHADER = 10,
    GL_IMAGE_SAMPLER_NAME_NOT_FOUND_IN_SHADER = 11,
    GL_FRAMEBUFFER_STATUS_UNDEFINED = 12,
    GL_FRAMEBUFFER_STATUS_INCOMPLETE_ATTACHMENT = 13,
    GL_FRAMEBUFFER_STATUS_INCOMPLETE_MISSING_ATTACHMENT = 14,
    GL_FRAMEBUFFER_STATUS_UNSUPPORTED = 15,
    GL_FRAMEBUFFER_STATUS_INCOMPLETE_MULTISAMPLE = 16,
    GL_FRAMEBUFFER_STATUS_UNKNOWN = 17,
    D3D11_CREATE_BUFFER_FAILED = 18,
    D3D11_CREATE_BUFFER_SRV_FAILED = 19,
    D3D11_CREATE_BUFFER_UAV_FAILED = 20,
    D3D11_CREATE_DEPTH_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 21,
    D3D11_CREATE_DEPTH_TEXTURE_FAILED = 22,
    D3D11_CREATE_2D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 23,
    D3D11_CREATE_2D_TEXTURE_FAILED = 24,
    D3D11_CREATE_2D_SRV_FAILED = 25,
    D3D11_CREATE_3D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 26,
    D3D11_CREATE_3D_TEXTURE_FAILED = 27,
    D3D11_CREATE_3D_SRV_FAILED = 28,
    D3D11_CREATE_MSAA_TEXTURE_FAILED = 29,
    D3D11_CREATE_SAMPLER_STATE_FAILED = 30,
    D3D11_UNIFORMBLOCK_HLSL_REGISTER_B_OUT_OF_RANGE = 31,
    D3D11_STORAGEBUFFER_HLSL_REGISTER_T_OUT_OF_RANGE = 32,
    D3D11_STORAGEBUFFER_HLSL_REGISTER_U_OUT_OF_RANGE = 33,
    D3D11_IMAGE_HLSL_REGISTER_T_OUT_OF_RANGE = 34,
    D3D11_STORAGEIMAGE_HLSL_REGISTER_U_OUT_OF_RANGE = 35,
    D3D11_SAMPLER_HLSL_REGISTER_S_OUT_OF_RANGE = 36,
    D3D11_LOAD_D3DCOMPILER_47_DLL_FAILED = 37,
    D3D11_SHADER_COMPILATION_FAILED = 38,
    D3D11_SHADER_COMPILATION_OUTPUT = 39,
    D3D11_CREATE_CONSTANT_BUFFER_FAILED = 40,
    D3D11_CREATE_INPUT_LAYOUT_FAILED = 41,
    D3D11_CREATE_RASTERIZER_STATE_FAILED = 42,
    D3D11_CREATE_DEPTH_STENCIL_STATE_FAILED = 43,
    D3D11_CREATE_BLEND_STATE_FAILED = 44,
    D3D11_CREATE_RTV_FAILED = 45,
    D3D11_CREATE_DSV_FAILED = 46,
    D3D11_CREATE_UAV_FAILED = 47,
    D3D11_MAP_FOR_UPDATE_BUFFER_FAILED = 48,
    D3D11_MAP_FOR_APPEND_BUFFER_FAILED = 49,
    D3D11_MAP_FOR_UPDATE_IMAGE_FAILED = 50,
    METAL_CREATE_BUFFER_FAILED = 51,
    METAL_TEXTURE_FORMAT_NOT_SUPPORTED = 52,
    METAL_CREATE_TEXTURE_FAILED = 53,
    METAL_CREATE_SAMPLER_FAILED = 54,
    METAL_SHADER_COMPILATION_FAILED = 55,
    METAL_SHADER_CREATION_FAILED = 56,
    METAL_SHADER_COMPILATION_OUTPUT = 57,
    METAL_SHADER_ENTRY_NOT_FOUND = 58,
    METAL_UNIFORMBLOCK_MSL_BUFFER_SLOT_OUT_OF_RANGE = 59,
    METAL_STORAGEBUFFER_MSL_BUFFER_SLOT_OUT_OF_RANGE = 60,
    METAL_STORAGEIMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE = 61,
    METAL_IMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE = 62,
    METAL_SAMPLER_MSL_SAMPLER_SLOT_OUT_OF_RANGE = 63,
    METAL_CREATE_CPS_FAILED = 64,
    METAL_CREATE_CPS_OUTPUT = 65,
    METAL_CREATE_RPS_FAILED = 66,
    METAL_CREATE_RPS_OUTPUT = 67,
    METAL_CREATE_DSS_FAILED = 68,
    WGPU_BINDGROUPS_POOL_EXHAUSTED = 69,
    WGPU_BINDGROUPSCACHE_SIZE_GREATER_ONE = 70,
    WGPU_BINDGROUPSCACHE_SIZE_POW2 = 71,
    WGPU_CREATEBINDGROUP_FAILED = 72,
    WGPU_CREATE_BUFFER_FAILED = 73,
    WGPU_CREATE_TEXTURE_FAILED = 74,
    WGPU_CREATE_TEXTURE_VIEW_FAILED = 75,
    WGPU_CREATE_SAMPLER_FAILED = 76,
    WGPU_CREATE_SHADER_MODULE_FAILED = 77,
    WGPU_SHADER_CREATE_BINDGROUP_LAYOUT_FAILED = 78,
    WGPU_UNIFORMBLOCK_WGSL_GROUP0_BINDING_OUT_OF_RANGE = 79,
    WGPU_TEXTURE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 80,
    WGPU_STORAGEBUFFER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 81,
    WGPU_STORAGEIMAGE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 82,
    WGPU_SAMPLER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 83,
    WGPU_CREATE_PIPELINE_LAYOUT_FAILED = 84,
    WGPU_CREATE_RENDER_PIPELINE_FAILED = 85,
    WGPU_CREATE_COMPUTE_PIPELINE_FAILED = 86,
    IDENTICAL_COMMIT_LISTENER = 87,
    COMMIT_LISTENER_ARRAY_FULL = 88,
    TRACE_HOOKS_NOT_ENABLED = 89,
    DEALLOC_BUFFER_INVALID_STATE = 90,
    DEALLOC_IMAGE_INVALID_STATE = 91,
    DEALLOC_SAMPLER_INVALID_STATE = 92,
    DEALLOC_SHADER_INVALID_STATE = 93,
    DEALLOC_PIPELINE_INVALID_STATE = 94,
    DEALLOC_VIEW_INVALID_STATE = 95,
    INIT_BUFFER_INVALID_STATE = 96,
    INIT_IMAGE_INVALID_STATE = 97,
    INIT_SAMPLER_INVALID_STATE = 98,
    INIT_SHADER_INVALID_STATE = 99,
    INIT_PIPELINE_INVALID_STATE = 100,
    INIT_VIEW_INVALID_STATE = 101,
    UNINIT_BUFFER_INVALID_STATE = 102,
    UNINIT_IMAGE_INVALID_STATE = 103,
    UNINIT_SAMPLER_INVALID_STATE = 104,
    UNINIT_SHADER_INVALID_STATE = 105,
    UNINIT_PIPELINE_INVALID_STATE = 106,
    UNINIT_VIEW_INVALID_STATE = 107,
    FAIL_BUFFER_INVALID_STATE = 108,
    FAIL_IMAGE_INVALID_STATE = 109,
    FAIL_SAMPLER_INVALID_STATE = 110,
    FAIL_SHADER_INVALID_STATE = 111,
    FAIL_PIPELINE_INVALID_STATE = 112,
    FAIL_VIEW_INVALID_STATE = 113,
    BUFFER_POOL_EXHAUSTED = 114,
    IMAGE_POOL_EXHAUSTED = 115,
    SAMPLER_POOL_EXHAUSTED = 116,
    SHADER_POOL_EXHAUSTED = 117,
    PIPELINE_POOL_EXHAUSTED = 118,
    VIEW_POOL_EXHAUSTED = 119,
    BEGINPASS_ATTACHMENTS_ALIVE = 120,
    DRAW_WITHOUT_BINDINGS = 121,
    VALIDATE_BUFFERDESC_CANARY = 122,
    VALIDATE_BUFFERDESC_IMMUTABLE_DYNAMIC_STREAM = 123,
    VALIDATE_BUFFERDESC_SEPARATE_BUFFER_TYPES = 124,
    VALIDATE_BUFFERDESC_EXPECT_NONZERO_SIZE = 125,
    VALIDATE_BUFFERDESC_EXPECT_MATCHING_DATA_SIZE = 126,
    VALIDATE_BUFFERDESC_EXPECT_ZERO_DATA_SIZE = 127,
    VALIDATE_BUFFERDESC_EXPECT_NO_DATA = 128,
    VALIDATE_BUFFERDESC_EXPECT_DATA = 129,
    VALIDATE_BUFFERDESC_STORAGEBUFFER_SUPPORTED = 130,
    VALIDATE_BUFFERDESC_STORAGEBUFFER_SIZE_MULTIPLE_4 = 131,
    VALIDATE_IMAGEDATA_NODATA = 132,
    VALIDATE_IMAGEDATA_DATA_SIZE = 133,
    VALIDATE_IMAGEDESC_CANARY = 134,
    VALIDATE_IMAGEDESC_IMMUTABLE_DYNAMIC_STREAM = 135,
    VALIDATE_IMAGEDESC_IMAGETYPE_2D_NUMSLICES = 136,
    VALIDATE_IMAGEDESC_IMAGETYPE_CUBE_NUMSLICES = 137,
    VALIDATE_IMAGEDESC_IMAGETYPE_ARRAY_NUMSLICES = 138,
    VALIDATE_IMAGEDESC_IMAGETYPE_3D_NUMSLICES = 139,
    VALIDATE_IMAGEDESC_NUMSLICES = 140,
    VALIDATE_IMAGEDESC_WIDTH = 141,
    VALIDATE_IMAGEDESC_HEIGHT = 142,
    VALIDATE_IMAGEDESC_NONRT_PIXELFORMAT = 143,
    VALIDATE_IMAGEDESC_MSAA_BUT_NO_ATTACHMENT = 144,
    VALIDATE_IMAGEDESC_DEPTH_3D_IMAGE = 145,
    VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_IMMUTABLE = 146,
    VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_NO_DATA = 147,
    VALIDATE_IMAGEDESC_ATTACHMENT_PIXELFORMAT = 148,
    VALIDATE_IMAGEDESC_ATTACHMENT_RESOLVE_EXPECT_NO_MSAA = 149,
    VALIDATE_IMAGEDESC_ATTACHMENT_NO_MSAA_SUPPORT = 150,
    VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_NUM_MIPMAPS = 151,
    VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_3D_IMAGE = 152,
    VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_CUBE_IMAGE = 153,
    VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_ARRAY_IMAGE = 154,
    VALIDATE_IMAGEDESC_STORAGEIMAGE_PIXELFORMAT = 155,
    VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_MSAA = 156,
    VALIDATE_IMAGEDESC_INJECTED_NO_DATA = 157,
    VALIDATE_IMAGEDESC_DYNAMIC_NO_DATA = 158,
    VALIDATE_IMAGEDESC_COMPRESSED_IMMUTABLE = 159,
    VALIDATE_SAMPLERDESC_CANARY = 160,
    VALIDATE_SAMPLERDESC_ANISTROPIC_REQUIRES_LINEAR_FILTERING = 161,
    VALIDATE_SHADERDESC_CANARY = 162,
    VALIDATE_SHADERDESC_VERTEX_SOURCE = 163,
    VALIDATE_SHADERDESC_FRAGMENT_SOURCE = 164,
    VALIDATE_SHADERDESC_COMPUTE_SOURCE = 165,
    VALIDATE_SHADERDESC_VERTEX_SOURCE_OR_BYTECODE = 166,
    VALIDATE_SHADERDESC_FRAGMENT_SOURCE_OR_BYTECODE = 167,
    VALIDATE_SHADERDESC_COMPUTE_SOURCE_OR_BYTECODE = 168,
    VALIDATE_SHADERDESC_INVALID_SHADER_COMBO = 169,
    VALIDATE_SHADERDESC_NO_BYTECODE_SIZE = 170,
    VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP_INITIALIZED = 171,
    VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP_MULTIPLE_32 = 172,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_CONT_MEMBERS = 173,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_IS_ZERO = 174,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_METAL_BUFFER_SLOT_OUT_OF_RANGE = 175,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_METAL_BUFFER_SLOT_COLLISION = 176,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_HLSL_REGISTER_B_OUT_OF_RANGE = 177,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_HLSL_REGISTER_B_COLLISION = 178,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_WGSL_GROUP0_BINDING_OUT_OF_RANGE = 179,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_WGSL_GROUP0_BINDING_COLLISION = 180,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_MEMBERS = 181,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_UNIFORM_GLSL_NAME = 182,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_MISMATCH = 183,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_ARRAY_COUNT = 184,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_STD140_ARRAY_TYPE = 185,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_METAL_BUFFER_SLOT_OUT_OF_RANGE = 186,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_METAL_BUFFER_SLOT_COLLISION = 187,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_T_OUT_OF_RANGE = 188,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_T_COLLISION = 189,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_U_OUT_OF_RANGE = 190,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_U_COLLISION = 191,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_GLSL_BINDING_OUT_OF_RANGE = 192,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_GLSL_BINDING_COLLISION = 193,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 194,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_WGSL_GROUP1_BINDING_COLLISION = 195,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_EXPECT_COMPUTE_STAGE = 196,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_METAL_TEXTURE_SLOT_OUT_OF_RANGE = 197,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_METAL_TEXTURE_SLOT_COLLISION = 198,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_HLSL_REGISTER_U_OUT_OF_RANGE = 199,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_HLSL_REGISTER_U_COLLISION = 200,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_GLSL_BINDING_OUT_OF_RANGE = 201,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_GLSL_BINDING_COLLISION = 202,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 203,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_WGSL_GROUP1_BINDING_COLLISION = 204,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_METAL_TEXTURE_SLOT_OUT_OF_RANGE = 205,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_METAL_TEXTURE_SLOT_COLLISION = 206,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_HLSL_REGISTER_T_OUT_OF_RANGE = 207,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_HLSL_REGISTER_T_COLLISION = 208,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 209,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_WGSL_GROUP1_BINDING_COLLISION = 210,
    VALIDATE_SHADERDESC_SAMPLER_METAL_SAMPLER_SLOT_OUT_OF_RANGE = 211,
    VALIDATE_SHADERDESC_SAMPLER_METAL_SAMPLER_SLOT_COLLISION = 212,
    VALIDATE_SHADERDESC_SAMPLER_HLSL_REGISTER_S_OUT_OF_RANGE = 213,
    VALIDATE_SHADERDESC_SAMPLER_HLSL_REGISTER_S_COLLISION = 214,
    VALIDATE_SHADERDESC_SAMPLER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 215,
    VALIDATE_SHADERDESC_SAMPLER_WGSL_GROUP1_BINDING_COLLISION = 216,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_VIEW_SLOT_OUT_OF_RANGE = 217,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_SLOT_OUT_OF_RANGE = 218,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_TEXTURE_STAGE_MISMATCH = 219,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_EXPECT_TEXTURE_VIEW = 220,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_STAGE_MISMATCH = 221,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_GLSL_NAME = 222,
    VALIDATE_SHADERDESC_NONFILTERING_SAMPLER_REQUIRED = 223,
    VALIDATE_SHADERDESC_COMPARISON_SAMPLER_REQUIRED = 224,
    VALIDATE_SHADERDESC_TEXVIEW_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS = 225,
    VALIDATE_SHADERDESC_SAMPLER_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS = 226,
    VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG = 227,
    VALIDATE_PIPELINEDESC_CANARY = 228,
    VALIDATE_PIPELINEDESC_SHADER = 229,
    VALIDATE_PIPELINEDESC_COMPUTE_SHADER_EXPECTED = 230,
    VALIDATE_PIPELINEDESC_NO_COMPUTE_SHADER_EXPECTED = 231,
    VALIDATE_PIPELINEDESC_NO_CONT_ATTRS = 232,
    VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH = 233,
    VALIDATE_PIPELINEDESC_LAYOUT_STRIDE4 = 234,
    VALIDATE_PIPELINEDESC_ATTR_SEMANTICS = 235,
    VALIDATE_PIPELINEDESC_SHADER_READONLY_STORAGEBUFFERS = 236,
    VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE = 237,
    VALIDATE_VIEWDESC_CANARY = 238,
    VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE = 239,
    VALIDATE_VIEWDESC_ANY_VIEWTYPE = 240,
    VALIDATE_VIEWDESC_RESOURCE_ALIVE = 241,
    VALIDATE_VIEWDESC_RESOURCE_FAILED = 242,
    VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_VS_BUFFER_SIZE = 243,
    VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_MULTIPLE_256 = 244,
    VALIDATE_VIEWDESC_STORAGEBUFFER_USAGE = 245,
    VALIDATE_VIEWDESC_STORAGEIMAGE_USAGE = 246,
    VALIDATE_VIEWDESC_COLORATTACHMENT_USAGE = 247,
    VALIDATE_VIEWDESC_RESOLVEATTACHMENT_USAGE = 248,
    VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_USAGE = 249,
    VALIDATE_VIEWDESC_IMAGE_MIPLEVEL = 250,
    VALIDATE_VIEWDESC_IMAGE_2D_SLICE = 251,
    VALIDATE_VIEWDESC_IMAGE_CUBEMAP_SLICE = 252,
    VALIDATE_VIEWDESC_IMAGE_ARRAY_SLICE = 253,
    VALIDATE_VIEWDESC_IMAGE_3D_SLICE = 254,
    VALIDATE_VIEWDESC_TEXTURE_EXPECT_NO_MSAA = 255,
    VALIDATE_VIEWDESC_TEXTURE_MIPLEVELS = 256,
    VALIDATE_VIEWDESC_TEXTURE_2D_SLICES = 257,
    VALIDATE_VIEWDESC_TEXTURE_CUBEMAP_SLICES = 258,
    VALIDATE_VIEWDESC_TEXTURE_ARRAY_SLICES = 259,
    VALIDATE_VIEWDESC_TEXTURE_3D_SLICES = 260,
    VALIDATE_VIEWDESC_STORAGEIMAGE_PIXELFORMAT = 261,
    VALIDATE_VIEWDESC_COLORATTACHMENT_PIXELFORMAT = 262,
    VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_PIXELFORMAT = 263,
    VALIDATE_VIEWDESC_RESOLVEATTACHMENT_SAMPLECOUNT = 264,
    VALIDATE_BEGINPASS_CANARY = 265,
    VALIDATE_BEGINPASS_COMPUTEPASS_EXPECT_NO_ATTACHMENTS = 266,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH = 267,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH_NOTSET = 268,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT = 269,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT_NOTSET = 270,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT = 271,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT_NOTSET = 272,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT = 273,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT_NOTSET = 274,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_DEPTHFORMAT_NOTSET = 275,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE = 276,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE_NOTSET = 277,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE = 278,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE_NOTSET = 279,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE = 280,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE_NOTSET = 281,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW = 282,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW_NOTSET = 283,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW = 284,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW_NOTSET = 285,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW = 286,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW_NOTSET = 287,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW = 288,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW_NOTSET = 289,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW = 290,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW_NOTSET = 291,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW = 292,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW_NOTSET = 293,
    VALIDATE_BEGINPASS_SWAPCHAIN_GL_EXPECT_FRAMEBUFFER_NOTSET = 294,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEWS_CONTINUOUS = 295,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_ALIVE = 296,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_VALID = 297,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_TYPE = 298,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_ALIVE = 299,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_VALID = 300,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SIZES = 301,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNTS = 302,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_NO_COLORATTACHMENTVIEW = 303,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_ALIVE = 304,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_VALID = 305,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_TYPE = 306,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_ALIVE = 307,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_VALID = 308,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_SIZES = 309,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEWS_CONTINUOUS = 310,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_ALIVE = 311,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_VALID = 312,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_TYPE = 313,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_ALIVE = 314,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_VALID = 315,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SIZES = 316,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SAMPLECOUNT = 317,
    VALIDATE_BEGINPASS_ATTACHMENTS_EXPECTED = 318,
    VALIDATE_AVP_RENDERPASS_EXPECTED = 319,
    VALIDATE_ASR_RENDERPASS_EXPECTED = 320,
    VALIDATE_APIP_PIPELINE_VALID_ID = 321,
    VALIDATE_APIP_PIPELINE_EXISTS = 322,
    VALIDATE_APIP_PIPELINE_VALID = 323,
    VALIDATE_APIP_PASS_EXPECTED = 324,
    VALIDATE_APIP_PIPELINE_SHADER_ALIVE = 325,
    VALIDATE_APIP_PIPELINE_SHADER_VALID = 326,
    VALIDATE_APIP_COMPUTEPASS_EXPECTED = 327,
    VALIDATE_APIP_RENDERPASS_EXPECTED = 328,
    VALIDATE_APIP_SWAPCHAIN_COLOR_COUNT = 329,
    VALIDATE_APIP_SWAPCHAIN_COLOR_FORMAT = 330,
    VALIDATE_APIP_SWAPCHAIN_DEPTH_FORMAT = 331,
    VALIDATE_APIP_SWAPCHAIN_SAMPLE_COUNT = 332,
    VALIDATE_APIP_ATTACHMENTS_ALIVE = 333,
    VALIDATE_APIP_COLORATTACHMENTS_COUNT = 334,
    VALIDATE_APIP_COLORATTACHMENTS_VIEW_VALID = 335,
    VALIDATE_APIP_COLORATTACHMENTS_IMAGE_VALID = 336,
    VALIDATE_APIP_COLORATTACHMENTS_FORMAT = 337,
    VALIDATE_APIP_DEPTHSTENCILATTACHMENT_VIEW_VALID = 338,
    VALIDATE_APIP_DEPTHSTENCILATTACHMENT_IMAGE_VALID = 339,
    VALIDATE_APIP_DEPTHSTENCILATTACHMENT_FORMAT = 340,
    VALIDATE_APIP_ATTACHMENT_SAMPLE_COUNT = 341,
    VALIDATE_ABND_PASS_EXPECTED = 342,
    VALIDATE_ABND_EMPTY_BINDINGS = 343,
    VALIDATE_ABND_NO_PIPELINE = 344,
    VALIDATE_ABND_PIPELINE_ALIVE = 345,
    VALIDATE_ABND_PIPELINE_VALID = 346,
    VALIDATE_ABND_PIPELINE_SHADER_ALIVE = 347,
    VALIDATE_ABND_PIPELINE_SHADER_VALID = 348,
    VALIDATE_ABND_COMPUTE_EXPECTED_NO_VBUFS = 349,
    VALIDATE_ABND_COMPUTE_EXPECTED_NO_IBUF = 350,
    VALIDATE_ABND_EXPECTED_VBUF = 351,
    VALIDATE_ABND_VBUF_ALIVE = 352,
    VALIDATE_ABND_VBUF_USAGE = 353,
    VALIDATE_ABND_VBUF_OVERFLOW = 354,
    VALIDATE_ABND_EXPECTED_NO_IBUF = 355,
    VALIDATE_ABND_EXPECTED_IBUF = 356,
    VALIDATE_ABND_IBUF_ALIVE = 357,
    VALIDATE_ABND_IBUF_USAGE = 358,
    VALIDATE_ABND_IBUF_OVERFLOW = 359,
    VALIDATE_ABND_EXPECTED_VIEW_BINDING = 360,
    VALIDATE_ABND_VIEW_ALIVE = 361,
    VALIDATE_ABND_EXPECT_TEXVIEW = 362,
    VALIDATE_ABND_EXPECT_SBVIEW = 363,
    VALIDATE_ABND_EXPECT_SIMGVIEW = 364,
    VALIDATE_ABND_TEXVIEW_IMAGETYPE_MISMATCH = 365,
    VALIDATE_ABND_TEXVIEW_EXPECTED_MULTISAMPLED_IMAGE = 366,
    VALIDATE_ABND_TEXVIEW_EXPECTED_NON_MULTISAMPLED_IMAGE = 367,
    VALIDATE_ABND_TEXVIEW_EXPECTED_FILTERABLE_IMAGE = 368,
    VALIDATE_ABND_TEXVIEW_EXPECTED_DEPTH_IMAGE = 369,
    VALIDATE_ABND_SBVIEW_READWRITE_IMMUTABLE = 370,
    VALIDATE_ABND_SIMGVIEW_COMPUTE_PASS_EXPECTED = 371,
    VALIDATE_ABND_SIMGVIEW_IMAGETYPE_MISMATCH = 372,
    VALIDATE_ABND_SIMGVIEW_ACCESSFORMAT = 373,
    VALIDATE_ABND_EXPECTED_SAMPLER_BINDING = 374,
    VALIDATE_ABND_UNEXPECTED_SAMPLER_COMPARE_NEVER = 375,
    VALIDATE_ABND_EXPECTED_SAMPLER_COMPARE_NEVER = 376,
    VALIDATE_ABND_EXPECTED_NONFILTERING_SAMPLER = 377,
    VALIDATE_ABND_SAMPLER_ALIVE = 378,
    VALIDATE_ABND_SAMPLER_VALID = 379,
    VALIDATE_ABND_TEXTURE_BINDING_VS_DEPTHSTENCIL_ATTACHMENT = 380,
    VALIDATE_ABND_TEXTURE_BINDING_VS_COLOR_ATTACHMENT = 381,
    VALIDATE_ABND_TEXTURE_BINDING_VS_RESOLVE_ATTACHMENT = 382,
    VALIDATE_ABND_TEXTURE_VS_STORAGEIMAGE_BINDING = 383,
    VALIDATE_AU_PASS_EXPECTED = 384,
    VALIDATE_AU_NO_PIPELINE = 385,
    VALIDATE_AU_PIPELINE_ALIVE = 386,
    VALIDATE_AU_PIPELINE_VALID = 387,
    VALIDATE_AU_PIPELINE_SHADER_ALIVE = 388,
    VALIDATE_AU_PIPELINE_SHADER_VALID = 389,
    VALIDATE_AU_NO_UNIFORMBLOCK_AT_SLOT = 390,
    VALIDATE_AU_SIZE = 391,
    VALIDATE_DRAW_RENDERPASS_EXPECTED = 392,
    VALIDATE_DRAW_BASEELEMENT = 393,
    VALIDATE_DRAW_NUMELEMENTS = 394,
    VALIDATE_DRAW_NUMINSTANCES = 395,
    VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING = 396,
    VALIDATE_DISPATCH_COMPUTEPASS_EXPECTED = 397,
    VALIDATE_DISPATCH_NUMGROUPSX = 398,
    VALIDATE_DISPATCH_NUMGROUPSY = 399,
    VALIDATE_DISPATCH_NUMGROUPSZ = 400,
    VALIDATE_DISPATCH_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING = 401,
    VALIDATE_UPDATEBUF_USAGE = 402,
    VALIDATE_UPDATEBUF_SIZE = 403,
    VALIDATE_UPDATEBUF_ONCE = 404,
    VALIDATE_UPDATEBUF_APPEND = 405,
    VALIDATE_APPENDBUF_USAGE = 406,
    VALIDATE_APPENDBUF_SIZE = 407,
    VALIDATE_APPENDBUF_UPDATE = 408,
    VALIDATE_UPDIMG_USAGE = 409,
    VALIDATE_UPDIMG_ONCE = 410,
    VALIDATION_FAILED = 411,
}

struct SgEnvironmentDefaults
{
    SgPixelFormat color_format;
    SgPixelFormat depth_format;
    CInt sample_count;
}

struct SgMetalEnvironment
{
    void* device;
}

struct SgD3d11Environment
{
    void* device;
    void* device_context;
}

struct SgWgpuEnvironment
{
    void* device;
}

struct SgEnvironment
{
    SgEnvironmentDefaults defaults;
    SgMetalEnvironment metal;
    SgD3d11Environment d3d11;
    SgWgpuEnvironment wgpu;
}

struct SgCommitListener
{
    DataCb func;
    void* user_data;
}

struct SgAllocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct SgLogger
{
    LogCb func;
    void* user_data;
}

struct SgDesc
{
    uint _start_canary;
    CInt buffer_pool_size;
    CInt image_pool_size;
    CInt sampler_pool_size;
    CInt shader_pool_size;
    CInt pipeline_pool_size;
    CInt view_pool_size;
    CInt uniform_buffer_size;
    CInt max_commit_listeners;
    bool disable_validation;
    bool d3d11_shader_debugging;
    bool mtl_force_managed_storage_mode;
    bool mtl_use_command_buffer_with_retained_references;
    bool wgpu_disable_bindgroups_cache;
    CInt wgpu_bindgroups_cache_size;
    SgAllocator allocator;
    SgLogger logger;
    SgEnvironment environment;
    uint _end_canary;
}

struct SgD3d11BufferInfo
{
    void* buf;
}

struct SgD3d11ImageInfo
{
    void* tex2d;
    void* tex3d;
    void* res;
}

struct SgD3d11SamplerInfo
{
    void* smp;
}

struct SgD3d11ShaderInfo
{
    void*[8] cbufs;
    void* vs;
    void* fs;
}

struct SgD3d11PipelineInfo
{
    void* il;
    void* rs;
    void* dss;
    void* bs;
}

struct SgD3d11ViewInfo
{
    void* srv;
    void* uav;
    void* rtv;
    void* dsv;
}

struct SgMtlBufferInfo
{
    void*[2] buf;
    CInt active_slot;
}

struct SgMtlImageInfo
{
    void*[2] tex;
    CInt active_slot;
}

struct SgMtlSamplerInfo
{
    void* smp;
}

struct SgMtlShaderInfo
{
    void* vertex_lib;
    void* fragment_lib;
    void* vertex_func;
    void* fragment_func;
}

struct SgMtlPipelineInfo
{
    void* rps;
    void* dss;
}

struct SgWgpuBufferInfo
{
    void* buf;
}

struct SgWgpuImageInfo
{
    void* tex;
}

struct SgWgpuSamplerInfo
{
    void* smp;
}

struct SgWgpuShaderInfo
{
    void* vs_mod;
    void* fs_mod;
    void* bgl;
}

struct SgWgpuPipelineInfo
{
    void* render_pipeline;
    void* compute_pipeline;
}

struct SgWgpuViewInfo
{
    void* view;
}

struct SgGlBufferInfo
{
    uint[2] buf;
    CInt active_slot;
}

struct SgGlImageInfo
{
    uint[2] tex;
    uint tex_target;
    CInt active_slot;
}

struct SgGlSamplerInfo
{
    uint smp;
}

struct SgGlShaderInfo
{
    uint prog;
}

struct SgGlViewInfo
{
    uint[2] tex_view;
    uint msaa_render_buffer;
    uint msaa_resolve_frame_buffer;
}

alias DataCb = fn void(void*);
alias AllocCb = fn void*(usz, void*);
alias FreeCb = fn void*(usz, void*);
alias LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);

