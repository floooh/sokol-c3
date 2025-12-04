// machine generated, do not edit

module sokol::sg;
import sokol;

extern fn void setup(SgDesc* desc) @cname("sg_setup");
extern fn void shutdown() @cname("sg_shutdown");
extern fn bool isvalid() @cname("sg_isvalid");
extern fn void reset_state_cache() @cname("sg_reset_state_cache");
extern fn void push_debug_group(ZString name) @cname("sg_push_debug_group");
extern fn void pop_debug_group() @cname("sg_pop_debug_group");
extern fn bool add_commit_listener(SgCommitListener listener) @cname("sg_add_commit_listener");
extern fn bool remove_commit_listener(SgCommitListener listener) @cname("sg_remove_commit_listener");
extern fn SgBuffer make_buffer(SgBufferDesc* desc) @cname("sg_make_buffer");
extern fn SgImage make_image(SgImageDesc* desc) @cname("sg_make_image");
extern fn SgSampler make_sampler(SgSamplerDesc* desc) @cname("sg_make_sampler");
extern fn SgShader make_shader(SgShaderDesc* desc) @cname("sg_make_shader");
extern fn SgPipeline make_pipeline(SgPipelineDesc* desc) @cname("sg_make_pipeline");
extern fn SgView make_view(SgViewDesc* desc) @cname("sg_make_view");
extern fn void destroy_buffer(SgBuffer buf) @cname("sg_destroy_buffer");
extern fn void destroy_image(SgImage img) @cname("sg_destroy_image");
extern fn void destroy_sampler(SgSampler smp) @cname("sg_destroy_sampler");
extern fn void destroy_shader(SgShader shd) @cname("sg_destroy_shader");
extern fn void destroy_pipeline(SgPipeline pip) @cname("sg_destroy_pipeline");
extern fn void destroy_view(SgView view) @cname("sg_destroy_view");
extern fn void update_buffer(SgBuffer buf, SgRange* data) @cname("sg_update_buffer");
extern fn void update_image(SgImage img, SgImageData* data) @cname("sg_update_image");
extern fn CInt append_buffer(SgBuffer buf, SgRange* data) @cname("sg_append_buffer");
extern fn bool query_buffer_overflow(SgBuffer buf) @cname("sg_query_buffer_overflow");
extern fn bool query_buffer_will_overflow(SgBuffer buf, usz size) @cname("sg_query_buffer_will_overflow");
extern fn void begin_pass(SgPass* pass) @cname("sg_begin_pass");
extern fn void apply_viewport(CInt x, CInt y, CInt width, CInt height, bool origin_top_left) @cname("sg_apply_viewport");
extern fn void apply_viewportf(float x, float y, float width, float height, bool origin_top_left) @cname("sg_apply_viewportf");
extern fn void apply_scissor_rect(CInt x, CInt y, CInt width, CInt height, bool origin_top_left) @cname("sg_apply_scissor_rect");
extern fn void apply_scissor_rectf(float x, float y, float width, float height, bool origin_top_left) @cname("sg_apply_scissor_rectf");
extern fn void apply_pipeline(SgPipeline pip) @cname("sg_apply_pipeline");
extern fn void apply_bindings(SgBindings* bindings) @cname("sg_apply_bindings");
extern fn void apply_uniforms(CInt ub_slot, SgRange* data) @cname("sg_apply_uniforms");
extern fn void draw(CInt base_element, CInt num_elements, CInt num_instances) @cname("sg_draw");
extern fn void draw_ex(CInt base_element, CInt num_elements, CInt num_instances, CInt base_vertex, CInt base_instance) @cname("sg_draw_ex");
extern fn void dispatch(CInt num_groups_x, CInt num_groups_y, CInt num_groups_z) @cname("sg_dispatch");
extern fn void end_pass() @cname("sg_end_pass");
extern fn void commit() @cname("sg_commit");
extern fn SgDesc query_desc() @cname("sg_query_desc");
extern fn SgBackend query_backend() @cname("sg_query_backend");
extern fn SgFeatures query_features() @cname("sg_query_features");
extern fn SgLimits query_limits() @cname("sg_query_limits");
extern fn SgPixelformatInfo query_pixelformat(SgPixelFormat fmt) @cname("sg_query_pixelformat");
extern fn CInt query_row_pitch(SgPixelFormat fmt, CInt width, CInt row_align_bytes) @cname("sg_query_row_pitch");
extern fn CInt query_surface_pitch(SgPixelFormat fmt, CInt width, CInt height, CInt row_align_bytes) @cname("sg_query_surface_pitch");
extern fn SgResourceState query_buffer_state(SgBuffer buf) @cname("sg_query_buffer_state");
extern fn SgResourceState query_image_state(SgImage img) @cname("sg_query_image_state");
extern fn SgResourceState query_sampler_state(SgSampler smp) @cname("sg_query_sampler_state");
extern fn SgResourceState query_shader_state(SgShader shd) @cname("sg_query_shader_state");
extern fn SgResourceState query_pipeline_state(SgPipeline pip) @cname("sg_query_pipeline_state");
extern fn SgResourceState query_view_state(SgView view) @cname("sg_query_view_state");
extern fn SgBufferInfo query_buffer_info(SgBuffer buf) @cname("sg_query_buffer_info");
extern fn SgImageInfo query_image_info(SgImage img) @cname("sg_query_image_info");
extern fn SgSamplerInfo query_sampler_info(SgSampler smp) @cname("sg_query_sampler_info");
extern fn SgShaderInfo query_shader_info(SgShader shd) @cname("sg_query_shader_info");
extern fn SgPipelineInfo query_pipeline_info(SgPipeline pip) @cname("sg_query_pipeline_info");
extern fn SgViewInfo query_view_info(SgView view) @cname("sg_query_view_info");
extern fn SgBufferDesc query_buffer_desc(SgBuffer buf) @cname("sg_query_buffer_desc");
extern fn SgImageDesc query_image_desc(SgImage img) @cname("sg_query_image_desc");
extern fn SgSamplerDesc query_sampler_desc(SgSampler smp) @cname("sg_query_sampler_desc");
extern fn SgShaderDesc query_shader_desc(SgShader shd) @cname("sg_query_shader_desc");
extern fn SgPipelineDesc query_pipeline_desc(SgPipeline pip) @cname("sg_query_pipeline_desc");
extern fn SgViewDesc query_view_desc(SgView view) @cname("sg_query_view_desc");
extern fn SgBufferDesc query_buffer_defaults(SgBufferDesc* desc) @cname("sg_query_buffer_defaults");
extern fn SgImageDesc query_image_defaults(SgImageDesc* desc) @cname("sg_query_image_defaults");
extern fn SgSamplerDesc query_sampler_defaults(SgSamplerDesc* desc) @cname("sg_query_sampler_defaults");
extern fn SgShaderDesc query_shader_defaults(SgShaderDesc* desc) @cname("sg_query_shader_defaults");
extern fn SgPipelineDesc query_pipeline_defaults(SgPipelineDesc* desc) @cname("sg_query_pipeline_defaults");
extern fn SgViewDesc query_view_defaults(SgViewDesc* desc) @cname("sg_query_view_defaults");
extern fn usz query_buffer_size(SgBuffer buf) @cname("sg_query_buffer_size");
extern fn SgBufferUsage query_buffer_usage(SgBuffer buf) @cname("sg_query_buffer_usage");
extern fn SgImageType query_image_type(SgImage img) @cname("sg_query_image_type");
extern fn CInt query_image_width(SgImage img) @cname("sg_query_image_width");
extern fn CInt query_image_height(SgImage img) @cname("sg_query_image_height");
extern fn CInt query_image_num_slices(SgImage img) @cname("sg_query_image_num_slices");
extern fn CInt query_image_num_mipmaps(SgImage img) @cname("sg_query_image_num_mipmaps");
extern fn SgPixelFormat query_image_pixelformat(SgImage img) @cname("sg_query_image_pixelformat");
extern fn SgImageUsage query_image_usage(SgImage img) @cname("sg_query_image_usage");
extern fn CInt query_image_sample_count(SgImage img) @cname("sg_query_image_sample_count");
extern fn SgViewType query_view_type(SgView view) @cname("sg_query_view_type");
extern fn SgImage query_view_image(SgView view) @cname("sg_query_view_image");
extern fn SgBuffer query_view_buffer(SgView view) @cname("sg_query_view_buffer");
extern fn SgBuffer alloc_buffer() @cname("sg_alloc_buffer");
extern fn SgImage alloc_image() @cname("sg_alloc_image");
extern fn SgSampler alloc_sampler() @cname("sg_alloc_sampler");
extern fn SgShader alloc_shader() @cname("sg_alloc_shader");
extern fn SgPipeline alloc_pipeline() @cname("sg_alloc_pipeline");
extern fn SgView alloc_view() @cname("sg_alloc_view");
extern fn void dealloc_buffer(SgBuffer buf) @cname("sg_dealloc_buffer");
extern fn void dealloc_image(SgImage img) @cname("sg_dealloc_image");
extern fn void dealloc_sampler(SgSampler smp) @cname("sg_dealloc_sampler");
extern fn void dealloc_shader(SgShader shd) @cname("sg_dealloc_shader");
extern fn void dealloc_pipeline(SgPipeline pip) @cname("sg_dealloc_pipeline");
extern fn void dealloc_view(SgView view) @cname("sg_dealloc_view");
extern fn void init_buffer(SgBuffer buf, SgBufferDesc* desc) @cname("sg_init_buffer");
extern fn void init_image(SgImage img, SgImageDesc* desc) @cname("sg_init_image");
extern fn void init_sampler(SgSampler smg, SgSamplerDesc* desc) @cname("sg_init_sampler");
extern fn void init_shader(SgShader shd, SgShaderDesc* desc) @cname("sg_init_shader");
extern fn void init_pipeline(SgPipeline pip, SgPipelineDesc* desc) @cname("sg_init_pipeline");
extern fn void init_view(SgView view, SgViewDesc* desc) @cname("sg_init_view");
extern fn void uninit_buffer(SgBuffer buf) @cname("sg_uninit_buffer");
extern fn void uninit_image(SgImage img) @cname("sg_uninit_image");
extern fn void uninit_sampler(SgSampler smp) @cname("sg_uninit_sampler");
extern fn void uninit_shader(SgShader shd) @cname("sg_uninit_shader");
extern fn void uninit_pipeline(SgPipeline pip) @cname("sg_uninit_pipeline");
extern fn void uninit_view(SgView view) @cname("sg_uninit_view");
extern fn void fail_buffer(SgBuffer buf) @cname("sg_fail_buffer");
extern fn void fail_image(SgImage img) @cname("sg_fail_image");
extern fn void fail_sampler(SgSampler smp) @cname("sg_fail_sampler");
extern fn void fail_shader(SgShader shd) @cname("sg_fail_shader");
extern fn void fail_pipeline(SgPipeline pip) @cname("sg_fail_pipeline");
extern fn void fail_view(SgView view) @cname("sg_fail_view");
extern fn void enable_stats() @cname("sg_enable_stats");
extern fn void disable_stats() @cname("sg_disable_stats");
extern fn bool stats_enabled() @cname("sg_stats_enabled");
extern fn SgStats query_stats() @cname("sg_query_stats");
extern fn void* d3d11_device() @cname("sg_d3d11_device");
extern fn void* d3d11_device_context() @cname("sg_d3d11_device_context");
extern fn SgD3d11BufferInfo d3d11_query_buffer_info(SgBuffer buf) @cname("sg_d3d11_query_buffer_info");
extern fn SgD3d11ImageInfo d3d11_query_image_info(SgImage img) @cname("sg_d3d11_query_image_info");
extern fn SgD3d11SamplerInfo d3d11_query_sampler_info(SgSampler smp) @cname("sg_d3d11_query_sampler_info");
extern fn SgD3d11ShaderInfo d3d11_query_shader_info(SgShader shd) @cname("sg_d3d11_query_shader_info");
extern fn SgD3d11PipelineInfo d3d11_query_pipeline_info(SgPipeline pip) @cname("sg_d3d11_query_pipeline_info");
extern fn SgD3d11ViewInfo d3d11_query_view_info(SgView view) @cname("sg_d3d11_query_view_info");
extern fn void* mtl_device() @cname("sg_mtl_device");
extern fn void* mtl_render_command_encoder() @cname("sg_mtl_render_command_encoder");
extern fn void* mtl_compute_command_encoder() @cname("sg_mtl_compute_command_encoder");
extern fn SgMtlBufferInfo mtl_query_buffer_info(SgBuffer buf) @cname("sg_mtl_query_buffer_info");
extern fn SgMtlImageInfo mtl_query_image_info(SgImage img) @cname("sg_mtl_query_image_info");
extern fn SgMtlSamplerInfo mtl_query_sampler_info(SgSampler smp) @cname("sg_mtl_query_sampler_info");
extern fn SgMtlShaderInfo mtl_query_shader_info(SgShader shd) @cname("sg_mtl_query_shader_info");
extern fn SgMtlPipelineInfo mtl_query_pipeline_info(SgPipeline pip) @cname("sg_mtl_query_pipeline_info");
extern fn void* wgpu_device() @cname("sg_wgpu_device");
extern fn void* wgpu_queue() @cname("sg_wgpu_queue");
extern fn void* wgpu_command_encoder() @cname("sg_wgpu_command_encoder");
extern fn void* wgpu_render_pass_encoder() @cname("sg_wgpu_render_pass_encoder");
extern fn void* wgpu_compute_pass_encoder() @cname("sg_wgpu_compute_pass_encoder");
extern fn SgWgpuBufferInfo wgpu_query_buffer_info(SgBuffer buf) @cname("sg_wgpu_query_buffer_info");
extern fn SgWgpuImageInfo wgpu_query_image_info(SgImage img) @cname("sg_wgpu_query_image_info");
extern fn SgWgpuSamplerInfo wgpu_query_sampler_info(SgSampler smp) @cname("sg_wgpu_query_sampler_info");
extern fn SgWgpuShaderInfo wgpu_query_shader_info(SgShader shd) @cname("sg_wgpu_query_shader_info");
extern fn SgWgpuPipelineInfo wgpu_query_pipeline_info(SgPipeline pip) @cname("sg_wgpu_query_pipeline_info");
extern fn SgWgpuViewInfo wgpu_query_view_info(SgView view) @cname("sg_wgpu_query_view_info");
extern fn SgGlBufferInfo gl_query_buffer_info(SgBuffer buf) @cname("sg_gl_query_buffer_info");
extern fn SgGlImageInfo gl_query_image_info(SgImage img) @cname("sg_gl_query_image_info");
extern fn SgGlSamplerInfo gl_query_sampler_info(SgSampler smp) @cname("sg_gl_query_sampler_info");
extern fn SgGlShaderInfo gl_query_shader_info(SgShader shd) @cname("sg_gl_query_shader_info");
extern fn SgGlViewInfo gl_query_view_info(SgView view) @cname("sg_gl_query_view_info");

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
const usz MAX_COLOR_ATTACHMENTS = 8;
const usz MAX_UNIFORMBLOCK_MEMBERS = 16;
const usz MAX_VERTEX_ATTRIBUTES = 16;
const usz MAX_MIPMAPS = 16;
const usz MAX_VERTEXBUFFER_BINDSLOTS = 8;
const usz MAX_UNIFORMBLOCK_BINDSLOTS = 8;
const usz MAX_VIEW_BINDSLOTS = 32;
const usz MAX_SAMPLER_BINDSLOTS = 12;
const usz MAX_TEXTURE_SAMPLER_PAIRS = 32;
const usz MAX_PORTABLE_COLOR_ATTACHMENTS = 4;
const usz MAX_PORTABLE_TEXTURE_BINDINGS_PER_STAGE = 16;
const usz MAX_PORTABLE_STORAGEBUFFER_BINDINGS_PER_STAGE = 8;
const usz MAX_PORTABLE_STORAGEIMAGE_BINDINGS_PER_STAGE = 4;

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
    VULKAN = 7,
    DUMMY = 8,
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
    bool draw_base_vertex;
    bool draw_base_instance;
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
    CInt max_color_attachments;
    CInt max_texture_bindings_per_stage;
    CInt max_storage_buffer_bindings_per_stage;
    CInt max_storage_image_bindings_per_stage;
    CInt gl_max_vertex_uniform_components;
    CInt gl_max_combined_texture_image_units;
    CInt d3d11_max_unordered_access_views;
    CInt vk_min_uniform_buffer_offset_alignment;
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
    SgColorAttachmentAction[8] colors;
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

struct SgVulkanSwapchain
{
    void* render_image;
    void* render_view;
    void* resolve_image;
    void* resolve_view;
    void* depth_stencil_image;
    void* depth_stencil_view;
    void* render_finished_semaphore;
    void* present_complete_semaphore;
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
    SgVulkanSwapchain vulkan;
    SgGlSwapchain gl;
}

struct SgAttachments
{
    SgView[8] colors;
    SgView[8] resolves;
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
    SgView[32] views;
    SgSampler[12] samplers;
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
    char spirv_set0_binding_n;
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
    char spirv_set1_binding_n;
}

struct SgShaderStorageBufferView
{
    SgShaderStage stage;
    bool readonly;
    char hlsl_register_t_n;
    char hlsl_register_u_n;
    char msl_buffer_n;
    char wgsl_group1_binding_n;
    char spirv_set1_binding_n;
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
    char spirv_set1_binding_n;
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
    char spirv_set1_binding_n;
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
    SgShaderView[32] views;
    SgShaderSampler[12] samplers;
    SgShaderTextureSamplerPair[32] texture_sampler_pairs;
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
    SgColorTargetState[8] colors;
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

struct SgFrameStatsVk
{
    uint num_cmd_pipeline_barrier;
    uint num_allocate_memory;
    uint num_free_memory;
    uint size_allocate_memory;
    uint num_delete_queue_added;
    uint num_delete_queue_collected;
    uint num_cmd_copy_buffer;
    uint num_cmd_copy_buffer_to_image;
    uint num_cmd_set_descriptor_buffer_offsets;
    uint size_descriptor_buffer_writes;
}

struct SgFrameResourceStats
{
    uint allocated;
    uint deallocated;
    uint inited;
    uint uninited;
}

struct SgTotalResourceStats
{
    uint alive;
    uint free;
    uint allocated;
    uint deallocated;
    uint inited;
    uint uninited;
}

struct SgTotalStats
{
    SgTotalResourceStats buffers;
    SgTotalResourceStats images;
    SgTotalResourceStats samplers;
    SgTotalResourceStats views;
    SgTotalResourceStats shaders;
    SgTotalResourceStats pipelines;
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
    uint num_draw_ex;
    uint num_dispatch;
    uint num_update_buffer;
    uint num_append_buffer;
    uint num_update_image;
    uint size_apply_uniforms;
    uint size_update_buffer;
    uint size_append_buffer;
    uint size_update_image;
    SgFrameResourceStats buffers;
    SgFrameResourceStats images;
    SgFrameResourceStats samplers;
    SgFrameResourceStats views;
    SgFrameResourceStats shaders;
    SgFrameResourceStats pipelines;
    SgFrameStatsGl gl;
    SgFrameStatsD3d11 d3d11;
    SgFrameStatsMetal metal;
    SgFrameStatsWgpu wgpu;
    SgFrameStatsVk vk;
}

struct SgStats
{
    SgFrameStats prev_frame;
    SgFrameStats cur_frame;
    SgTotalStats total;
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
    D3D11_FEATURE_LEVEL_0_DETECTED = 18,
    D3D11_CREATE_BUFFER_FAILED = 19,
    D3D11_CREATE_BUFFER_SRV_FAILED = 20,
    D3D11_CREATE_BUFFER_UAV_FAILED = 21,
    D3D11_CREATE_DEPTH_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 22,
    D3D11_CREATE_DEPTH_TEXTURE_FAILED = 23,
    D3D11_CREATE_2D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 24,
    D3D11_CREATE_2D_TEXTURE_FAILED = 25,
    D3D11_CREATE_2D_SRV_FAILED = 26,
    D3D11_CREATE_3D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 27,
    D3D11_CREATE_3D_TEXTURE_FAILED = 28,
    D3D11_CREATE_3D_SRV_FAILED = 29,
    D3D11_CREATE_MSAA_TEXTURE_FAILED = 30,
    D3D11_CREATE_SAMPLER_STATE_FAILED = 31,
    D3D11_UNIFORMBLOCK_HLSL_REGISTER_B_OUT_OF_RANGE = 32,
    D3D11_STORAGEBUFFER_HLSL_REGISTER_T_OUT_OF_RANGE = 33,
    D3D11_STORAGEBUFFER_HLSL_REGISTER_U_OUT_OF_RANGE = 34,
    D3D11_IMAGE_HLSL_REGISTER_T_OUT_OF_RANGE = 35,
    D3D11_STORAGEIMAGE_HLSL_REGISTER_U_OUT_OF_RANGE = 36,
    D3D11_SAMPLER_HLSL_REGISTER_S_OUT_OF_RANGE = 37,
    D3D11_LOAD_D3DCOMPILER_47_DLL_FAILED = 38,
    D3D11_SHADER_COMPILATION_FAILED = 39,
    D3D11_SHADER_COMPILATION_OUTPUT = 40,
    D3D11_CREATE_CONSTANT_BUFFER_FAILED = 41,
    D3D11_CREATE_INPUT_LAYOUT_FAILED = 42,
    D3D11_CREATE_RASTERIZER_STATE_FAILED = 43,
    D3D11_CREATE_DEPTH_STENCIL_STATE_FAILED = 44,
    D3D11_CREATE_BLEND_STATE_FAILED = 45,
    D3D11_CREATE_RTV_FAILED = 46,
    D3D11_CREATE_DSV_FAILED = 47,
    D3D11_CREATE_UAV_FAILED = 48,
    D3D11_MAP_FOR_UPDATE_BUFFER_FAILED = 49,
    D3D11_MAP_FOR_APPEND_BUFFER_FAILED = 50,
    D3D11_MAP_FOR_UPDATE_IMAGE_FAILED = 51,
    METAL_CREATE_BUFFER_FAILED = 52,
    METAL_TEXTURE_FORMAT_NOT_SUPPORTED = 53,
    METAL_CREATE_TEXTURE_FAILED = 54,
    METAL_CREATE_SAMPLER_FAILED = 55,
    METAL_SHADER_COMPILATION_FAILED = 56,
    METAL_SHADER_CREATION_FAILED = 57,
    METAL_SHADER_COMPILATION_OUTPUT = 58,
    METAL_SHADER_ENTRY_NOT_FOUND = 59,
    METAL_UNIFORMBLOCK_MSL_BUFFER_SLOT_OUT_OF_RANGE = 60,
    METAL_STORAGEBUFFER_MSL_BUFFER_SLOT_OUT_OF_RANGE = 61,
    METAL_STORAGEIMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE = 62,
    METAL_IMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE = 63,
    METAL_SAMPLER_MSL_SAMPLER_SLOT_OUT_OF_RANGE = 64,
    METAL_CREATE_CPS_FAILED = 65,
    METAL_CREATE_CPS_OUTPUT = 66,
    METAL_CREATE_RPS_FAILED = 67,
    METAL_CREATE_RPS_OUTPUT = 68,
    METAL_CREATE_DSS_FAILED = 69,
    WGPU_BINDGROUPS_POOL_EXHAUSTED = 70,
    WGPU_BINDGROUPSCACHE_SIZE_GREATER_ONE = 71,
    WGPU_BINDGROUPSCACHE_SIZE_POW2 = 72,
    WGPU_CREATEBINDGROUP_FAILED = 73,
    WGPU_CREATE_BUFFER_FAILED = 74,
    WGPU_CREATE_TEXTURE_FAILED = 75,
    WGPU_CREATE_TEXTURE_VIEW_FAILED = 76,
    WGPU_CREATE_SAMPLER_FAILED = 77,
    WGPU_CREATE_SHADER_MODULE_FAILED = 78,
    WGPU_SHADER_CREATE_BINDGROUP_LAYOUT_FAILED = 79,
    WGPU_UNIFORMBLOCK_WGSL_GROUP0_BINDING_OUT_OF_RANGE = 80,
    WGPU_TEXTURE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 81,
    WGPU_STORAGEBUFFER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 82,
    WGPU_STORAGEIMAGE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 83,
    WGPU_SAMPLER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 84,
    WGPU_CREATE_PIPELINE_LAYOUT_FAILED = 85,
    WGPU_CREATE_RENDER_PIPELINE_FAILED = 86,
    WGPU_CREATE_COMPUTE_PIPELINE_FAILED = 87,
    VULKAN_REQUIRED_EXTENSION_FUNCTION_MISSING = 88,
    VULKAN_ALLOC_DEVICE_MEMORY_NO_SUITABLE_MEMORY_TYPE = 89,
    VULKAN_ALLOCATE_MEMORY_FAILED = 90,
    VULKAN_ALLOC_BUFFER_DEVICE_MEMORY_FAILED = 91,
    VULKAN_ALLOC_IMAGE_DEVICE_MEMORY_FAILED = 92,
    VULKAN_DELETE_QUEUE_EXHAUSTED = 93,
    VULKAN_STAGING_CREATE_BUFFER_FAILED = 94,
    VULKAN_STAGING_ALLOCATE_MEMORY_FAILED = 95,
    VULKAN_STAGING_BIND_BUFFER_MEMORY_FAILED = 96,
    VULKAN_STAGING_STREAM_BUFFER_OVERFLOW = 97,
    VULKAN_CREATE_SHARED_BUFFER_FAILED = 98,
    VULKAN_ALLOCATE_SHARED_BUFFER_MEMORY_FAILED = 99,
    VULKAN_BIND_SHARED_BUFFER_MEMORY_FAILED = 100,
    VULKAN_MAP_SHARED_BUFFER_MEMORY_FAILED = 101,
    VULKAN_CREATE_BUFFER_FAILED = 102,
    VULKAN_BIND_BUFFER_MEMORY_FAILED = 103,
    VULKAN_CREATE_IMAGE_FAILED = 104,
    VULKAN_BIND_IMAGE_MEMORY_FAILED = 105,
    VULKAN_CREATE_SHADER_MODULE_FAILED = 106,
    VULKAN_UNIFORMBLOCK_SPIRV_SET0_BINDING_OUT_OF_RANGE = 107,
    VULKAN_TEXTURE_SPIRV_SET1_BINDING_OUT_OF_RANGE = 108,
    VULKAN_STORAGEBUFFER_SPIRV_SET1_BINDING_OUT_OF_RANGE = 109,
    VULKAN_STORAGEIMAGE_SPIRV_SET1_BINDING_OUT_OF_RANGE = 110,
    VULKAN_SAMPLER_SPIRV_SET1_BINDING_OUT_OF_RANGE = 111,
    VULKAN_CREATE_DESCRIPTOR_SET_LAYOUT_FAILED = 112,
    VULKAN_CREATE_PIPELINE_LAYOUT_FAILED = 113,
    VULKAN_CREATE_GRAPHICS_PIPELINE_FAILED = 114,
    VULKAN_CREATE_COMPUTE_PIPELINE_FAILED = 115,
    VULKAN_CREATE_IMAGE_VIEW_FAILED = 116,
    VULKAN_VIEW_MAX_DESCRIPTOR_SIZE = 117,
    VULKAN_CREATE_SAMPLER_FAILED = 118,
    VULKAN_SAMPLER_MAX_DESCRIPTOR_SIZE = 119,
    VULKAN_WAIT_FOR_FENCE_FAILED = 120,
    VULKAN_UNIFORM_BUFFER_OVERFLOW = 121,
    VULKAN_DESCRIPTOR_BUFFER_OVERFLOW = 122,
    IDENTICAL_COMMIT_LISTENER = 123,
    COMMIT_LISTENER_ARRAY_FULL = 124,
    TRACE_HOOKS_NOT_ENABLED = 125,
    DEALLOC_BUFFER_INVALID_STATE = 126,
    DEALLOC_IMAGE_INVALID_STATE = 127,
    DEALLOC_SAMPLER_INVALID_STATE = 128,
    DEALLOC_SHADER_INVALID_STATE = 129,
    DEALLOC_PIPELINE_INVALID_STATE = 130,
    DEALLOC_VIEW_INVALID_STATE = 131,
    INIT_BUFFER_INVALID_STATE = 132,
    INIT_IMAGE_INVALID_STATE = 133,
    INIT_SAMPLER_INVALID_STATE = 134,
    INIT_SHADER_INVALID_STATE = 135,
    INIT_PIPELINE_INVALID_STATE = 136,
    INIT_VIEW_INVALID_STATE = 137,
    UNINIT_BUFFER_INVALID_STATE = 138,
    UNINIT_IMAGE_INVALID_STATE = 139,
    UNINIT_SAMPLER_INVALID_STATE = 140,
    UNINIT_SHADER_INVALID_STATE = 141,
    UNINIT_PIPELINE_INVALID_STATE = 142,
    UNINIT_VIEW_INVALID_STATE = 143,
    FAIL_BUFFER_INVALID_STATE = 144,
    FAIL_IMAGE_INVALID_STATE = 145,
    FAIL_SAMPLER_INVALID_STATE = 146,
    FAIL_SHADER_INVALID_STATE = 147,
    FAIL_PIPELINE_INVALID_STATE = 148,
    FAIL_VIEW_INVALID_STATE = 149,
    BUFFER_POOL_EXHAUSTED = 150,
    IMAGE_POOL_EXHAUSTED = 151,
    SAMPLER_POOL_EXHAUSTED = 152,
    SHADER_POOL_EXHAUSTED = 153,
    PIPELINE_POOL_EXHAUSTED = 154,
    VIEW_POOL_EXHAUSTED = 155,
    BEGINPASS_TOO_MANY_COLOR_ATTACHMENTS = 156,
    BEGINPASS_TOO_MANY_RESOLVE_ATTACHMENTS = 157,
    BEGINPASS_ATTACHMENTS_ALIVE = 158,
    DRAW_WITHOUT_BINDINGS = 159,
    SHADERDESC_TOO_MANY_VERTEXSTAGE_TEXTURES = 160,
    SHADERDESC_TOO_MANY_FRAGMENTSTAGE_TEXTURES = 161,
    SHADERDESC_TOO_MANY_COMPUTESTAGE_TEXTURES = 162,
    SHADERDESC_TOO_MANY_VERTEXSTAGE_STORAGEBUFFERS = 163,
    SHADERDESC_TOO_MANY_FRAGMENTSTAGE_STORAGEBUFFERS = 164,
    SHADERDESC_TOO_MANY_COMPUTESTAGE_STORAGEBUFFERS = 165,
    SHADERDESC_TOO_MANY_VERTEXSTAGE_STORAGEIMAGES = 166,
    SHADERDESC_TOO_MANY_FRAGMENTSTAGE_STORAGEIMAGES = 167,
    SHADERDESC_TOO_MANY_COMPUTESTAGE_STORAGEIMAGES = 168,
    SHADERDESC_TOO_MANY_VERTEXSTAGE_TEXTURESAMPLERPAIRS = 169,
    SHADERDESC_TOO_MANY_FRAGMENTSTAGE_TEXTURESAMPLERPAIRS = 170,
    SHADERDESC_TOO_MANY_COMPUTESTAGE_TEXTURESAMPLERPAIRS = 171,
    VALIDATE_BUFFERDESC_CANARY = 172,
    VALIDATE_BUFFERDESC_IMMUTABLE_DYNAMIC_STREAM = 173,
    VALIDATE_BUFFERDESC_SEPARATE_BUFFER_TYPES = 174,
    VALIDATE_BUFFERDESC_EXPECT_NONZERO_SIZE = 175,
    VALIDATE_BUFFERDESC_EXPECT_MATCHING_DATA_SIZE = 176,
    VALIDATE_BUFFERDESC_EXPECT_ZERO_DATA_SIZE = 177,
    VALIDATE_BUFFERDESC_EXPECT_NO_DATA = 178,
    VALIDATE_BUFFERDESC_EXPECT_DATA = 179,
    VALIDATE_BUFFERDESC_STORAGEBUFFER_SUPPORTED = 180,
    VALIDATE_BUFFERDESC_STORAGEBUFFER_SIZE_MULTIPLE_4 = 181,
    VALIDATE_IMAGEDATA_NODATA = 182,
    VALIDATE_IMAGEDATA_DATA_SIZE = 183,
    VALIDATE_IMAGEDESC_CANARY = 184,
    VALIDATE_IMAGEDESC_IMMUTABLE_DYNAMIC_STREAM = 185,
    VALIDATE_IMAGEDESC_IMAGETYPE_2D_NUMSLICES = 186,
    VALIDATE_IMAGEDESC_IMAGETYPE_CUBE_NUMSLICES = 187,
    VALIDATE_IMAGEDESC_IMAGETYPE_ARRAY_NUMSLICES = 188,
    VALIDATE_IMAGEDESC_IMAGETYPE_3D_NUMSLICES = 189,
    VALIDATE_IMAGEDESC_NUMSLICES = 190,
    VALIDATE_IMAGEDESC_WIDTH = 191,
    VALIDATE_IMAGEDESC_HEIGHT = 192,
    VALIDATE_IMAGEDESC_NONRT_PIXELFORMAT = 193,
    VALIDATE_IMAGEDESC_MSAA_BUT_NO_ATTACHMENT = 194,
    VALIDATE_IMAGEDESC_DEPTH_3D_IMAGE = 195,
    VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_IMMUTABLE = 196,
    VALIDATE_IMAGEDESC_ATTACHMENT_EXPECT_NO_DATA = 197,
    VALIDATE_IMAGEDESC_ATTACHMENT_PIXELFORMAT = 198,
    VALIDATE_IMAGEDESC_ATTACHMENT_RESOLVE_EXPECT_NO_MSAA = 199,
    VALIDATE_IMAGEDESC_ATTACHMENT_NO_MSAA_SUPPORT = 200,
    VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_NUM_MIPMAPS = 201,
    VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_3D_IMAGE = 202,
    VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_CUBE_IMAGE = 203,
    VALIDATE_IMAGEDESC_ATTACHMENT_MSAA_ARRAY_IMAGE = 204,
    VALIDATE_IMAGEDESC_STORAGEIMAGE_PIXELFORMAT = 205,
    VALIDATE_IMAGEDESC_STORAGEIMAGE_EXPECT_NO_MSAA = 206,
    VALIDATE_IMAGEDESC_INJECTED_NO_DATA = 207,
    VALIDATE_IMAGEDESC_DYNAMIC_NO_DATA = 208,
    VALIDATE_IMAGEDESC_COMPRESSED_IMMUTABLE = 209,
    VALIDATE_SAMPLERDESC_CANARY = 210,
    VALIDATE_SAMPLERDESC_ANISTROPIC_REQUIRES_LINEAR_FILTERING = 211,
    VALIDATE_SHADERDESC_CANARY = 212,
    VALIDATE_SHADERDESC_VERTEX_SOURCE = 213,
    VALIDATE_SHADERDESC_FRAGMENT_SOURCE = 214,
    VALIDATE_SHADERDESC_COMPUTE_SOURCE = 215,
    VALIDATE_SHADERDESC_VERTEX_SOURCE_OR_BYTECODE = 216,
    VALIDATE_SHADERDESC_FRAGMENT_SOURCE_OR_BYTECODE = 217,
    VALIDATE_SHADERDESC_COMPUTE_SOURCE_OR_BYTECODE = 218,
    VALIDATE_SHADERDESC_INVALID_SHADER_COMBO = 219,
    VALIDATE_SHADERDESC_NO_BYTECODE_SIZE = 220,
    VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP_INITIALIZED = 221,
    VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP_MULTIPLE_32 = 222,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_CONT_MEMBERS = 223,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_IS_ZERO = 224,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_METAL_BUFFER_SLOT_COLLISION = 225,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_HLSL_REGISTER_B_COLLISION = 226,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_WGSL_GROUP0_BINDING_COLLISION = 227,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_SPIRV_SET0_BINDING_COLLISION = 228,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_MEMBERS = 229,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_UNIFORM_GLSL_NAME = 230,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_MISMATCH = 231,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_ARRAY_COUNT = 232,
    VALIDATE_SHADERDESC_UNIFORMBLOCK_STD140_ARRAY_TYPE = 233,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_METAL_BUFFER_SLOT_COLLISION = 234,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_T_COLLISION = 235,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_HLSL_REGISTER_U_COLLISION = 236,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_GLSL_BINDING_COLLISION = 237,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_WGSL_GROUP1_BINDING_COLLISION = 238,
    VALIDATE_SHADERDESC_VIEW_STORAGEBUFFER_SPIRV_SET1_BINDING_COLLISION = 239,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_EXPECT_COMPUTE_STAGE = 240,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_METAL_TEXTURE_SLOT_COLLISION = 241,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_HLSL_REGISTER_U_COLLISION = 242,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_GLSL_BINDING_COLLISION = 243,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_WGSL_GROUP1_BINDING_COLLISION = 244,
    VALIDATE_SHADERDESC_VIEW_STORAGEIMAGE_SPIRV_SET1_BINDING_COLLISION = 245,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_METAL_TEXTURE_SLOT_COLLISION = 246,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_HLSL_REGISTER_T_COLLISION = 247,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_WGSL_GROUP1_BINDING_COLLISION = 248,
    VALIDATE_SHADERDESC_VIEW_TEXTURE_SPIRV_SET1_BINDING_COLLISION = 249,
    VALIDATE_SHADERDESC_SAMPLER_METAL_SAMPLER_SLOT_COLLISION = 250,
    VALIDATE_SHADERDESC_SAMPLER_HLSL_REGISTER_S_COLLISION = 251,
    VALIDATE_SHADERDESC_SAMPLER_WGSL_GROUP1_BINDING_COLLISION = 252,
    VALIDATE_SHADERDESC_SAMPLER_SPIRV_SET1_BINDING_COLLISION = 253,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_VIEW_SLOT_OUT_OF_RANGE = 254,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_SLOT_OUT_OF_RANGE = 255,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_TEXTURE_STAGE_MISMATCH = 256,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_EXPECT_TEXTURE_VIEW = 257,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_SAMPLER_STAGE_MISMATCH = 258,
    VALIDATE_SHADERDESC_TEXTURE_SAMPLER_PAIR_GLSL_NAME = 259,
    VALIDATE_SHADERDESC_NONFILTERING_SAMPLER_REQUIRED = 260,
    VALIDATE_SHADERDESC_COMPARISON_SAMPLER_REQUIRED = 261,
    VALIDATE_SHADERDESC_TEXVIEW_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS = 262,
    VALIDATE_SHADERDESC_SAMPLER_NOT_REFERENCED_BY_TEXTURE_SAMPLER_PAIRS = 263,
    VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG = 264,
    VALIDATE_PIPELINEDESC_CANARY = 265,
    VALIDATE_PIPELINEDESC_SHADER = 266,
    VALIDATE_PIPELINEDESC_COMPUTE_SHADER_EXPECTED = 267,
    VALIDATE_PIPELINEDESC_NO_COMPUTE_SHADER_EXPECTED = 268,
    VALIDATE_PIPELINEDESC_NO_CONT_ATTRS = 269,
    VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH = 270,
    VALIDATE_PIPELINEDESC_LAYOUT_STRIDE4 = 271,
    VALIDATE_PIPELINEDESC_ATTR_SEMANTICS = 272,
    VALIDATE_PIPELINEDESC_SHADER_READONLY_STORAGEBUFFERS = 273,
    VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE = 274,
    VALIDATE_VIEWDESC_CANARY = 275,
    VALIDATE_VIEWDESC_UNIQUE_VIEWTYPE = 276,
    VALIDATE_VIEWDESC_ANY_VIEWTYPE = 277,
    VALIDATE_VIEWDESC_RESOURCE_ALIVE = 278,
    VALIDATE_VIEWDESC_RESOURCE_FAILED = 279,
    VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_VS_BUFFER_SIZE = 280,
    VALIDATE_VIEWDESC_STORAGEBUFFER_OFFSET_MULTIPLE_256 = 281,
    VALIDATE_VIEWDESC_STORAGEBUFFER_USAGE = 282,
    VALIDATE_VIEWDESC_STORAGEIMAGE_USAGE = 283,
    VALIDATE_VIEWDESC_COLORATTACHMENT_USAGE = 284,
    VALIDATE_VIEWDESC_RESOLVEATTACHMENT_USAGE = 285,
    VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_USAGE = 286,
    VALIDATE_VIEWDESC_IMAGE_MIPLEVEL = 287,
    VALIDATE_VIEWDESC_IMAGE_2D_SLICE = 288,
    VALIDATE_VIEWDESC_IMAGE_CUBEMAP_SLICE = 289,
    VALIDATE_VIEWDESC_IMAGE_ARRAY_SLICE = 290,
    VALIDATE_VIEWDESC_IMAGE_3D_SLICE = 291,
    VALIDATE_VIEWDESC_TEXTURE_EXPECT_NO_MSAA = 292,
    VALIDATE_VIEWDESC_TEXTURE_MIPLEVELS = 293,
    VALIDATE_VIEWDESC_TEXTURE_2D_SLICES = 294,
    VALIDATE_VIEWDESC_TEXTURE_CUBEMAP_SLICES = 295,
    VALIDATE_VIEWDESC_TEXTURE_ARRAY_SLICES = 296,
    VALIDATE_VIEWDESC_TEXTURE_3D_SLICES = 297,
    VALIDATE_VIEWDESC_STORAGEIMAGE_PIXELFORMAT = 298,
    VALIDATE_VIEWDESC_COLORATTACHMENT_PIXELFORMAT = 299,
    VALIDATE_VIEWDESC_DEPTHSTENCILATTACHMENT_PIXELFORMAT = 300,
    VALIDATE_VIEWDESC_RESOLVEATTACHMENT_SAMPLECOUNT = 301,
    VALIDATE_BEGINPASS_CANARY = 302,
    VALIDATE_BEGINPASS_COMPUTEPASS_EXPECT_NO_ATTACHMENTS = 303,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH = 304,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH_NOTSET = 305,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT = 306,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT_NOTSET = 307,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT = 308,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT_NOTSET = 309,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT = 310,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT_NOTSET = 311,
    VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_DEPTHFORMAT_NOTSET = 312,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE = 313,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE_NOTSET = 314,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE = 315,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE_NOTSET = 316,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE = 317,
    VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE_NOTSET = 318,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW = 319,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW_NOTSET = 320,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW = 321,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW_NOTSET = 322,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW = 323,
    VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW_NOTSET = 324,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW = 325,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW_NOTSET = 326,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW = 327,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW_NOTSET = 328,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW = 329,
    VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW_NOTSET = 330,
    VALIDATE_BEGINPASS_SWAPCHAIN_GL_EXPECT_FRAMEBUFFER_NOTSET = 331,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEWS_CONTINUOUS = 332,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_ALIVE = 333,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_VALID = 334,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_TYPE = 335,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_ALIVE = 336,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_IMAGE_VALID = 337,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SIZES = 338,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNT = 339,
    VALIDATE_BEGINPASS_COLORATTACHMENTVIEW_SAMPLECOUNTS_EQUAL = 340,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_NO_COLORATTACHMENTVIEW = 341,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_ALIVE = 342,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_VALID = 343,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_TYPE = 344,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_ALIVE = 345,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_IMAGE_VALID = 346,
    VALIDATE_BEGINPASS_RESOLVEATTACHMENTVIEW_SIZES = 347,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEWS_CONTINUOUS = 348,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_ALIVE = 349,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_VALID = 350,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_TYPE = 351,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_ALIVE = 352,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_IMAGE_VALID = 353,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SIZES = 354,
    VALIDATE_BEGINPASS_DEPTHSTENCILATTACHMENTVIEW_SAMPLECOUNT = 355,
    VALIDATE_BEGINPASS_ATTACHMENTS_EXPECTED = 356,
    VALIDATE_AVP_RENDERPASS_EXPECTED = 357,
    VALIDATE_ASR_RENDERPASS_EXPECTED = 358,
    VALIDATE_APIP_PIPELINE_VALID_ID = 359,
    VALIDATE_APIP_PIPELINE_EXISTS = 360,
    VALIDATE_APIP_PIPELINE_VALID = 361,
    VALIDATE_APIP_PASS_EXPECTED = 362,
    VALIDATE_APIP_PIPELINE_SHADER_ALIVE = 363,
    VALIDATE_APIP_PIPELINE_SHADER_VALID = 364,
    VALIDATE_APIP_COMPUTEPASS_EXPECTED = 365,
    VALIDATE_APIP_RENDERPASS_EXPECTED = 366,
    VALIDATE_APIP_SWAPCHAIN_COLOR_COUNT = 367,
    VALIDATE_APIP_SWAPCHAIN_COLOR_FORMAT = 368,
    VALIDATE_APIP_SWAPCHAIN_DEPTH_FORMAT = 369,
    VALIDATE_APIP_SWAPCHAIN_SAMPLE_COUNT = 370,
    VALIDATE_APIP_ATTACHMENTS_ALIVE = 371,
    VALIDATE_APIP_COLORATTACHMENTS_COUNT = 372,
    VALIDATE_APIP_COLORATTACHMENTS_VIEW_VALID = 373,
    VALIDATE_APIP_COLORATTACHMENTS_IMAGE_VALID = 374,
    VALIDATE_APIP_COLORATTACHMENTS_FORMAT = 375,
    VALIDATE_APIP_DEPTHSTENCILATTACHMENT_VIEW_VALID = 376,
    VALIDATE_APIP_DEPTHSTENCILATTACHMENT_IMAGE_VALID = 377,
    VALIDATE_APIP_DEPTHSTENCILATTACHMENT_FORMAT = 378,
    VALIDATE_APIP_ATTACHMENT_SAMPLE_COUNT = 379,
    VALIDATE_ABND_PASS_EXPECTED = 380,
    VALIDATE_ABND_EMPTY_BINDINGS = 381,
    VALIDATE_ABND_NO_PIPELINE = 382,
    VALIDATE_ABND_PIPELINE_ALIVE = 383,
    VALIDATE_ABND_PIPELINE_VALID = 384,
    VALIDATE_ABND_PIPELINE_SHADER_ALIVE = 385,
    VALIDATE_ABND_PIPELINE_SHADER_VALID = 386,
    VALIDATE_ABND_COMPUTE_EXPECTED_NO_VBUFS = 387,
    VALIDATE_ABND_COMPUTE_EXPECTED_NO_IBUF = 388,
    VALIDATE_ABND_EXPECTED_VBUF = 389,
    VALIDATE_ABND_VBUF_ALIVE = 390,
    VALIDATE_ABND_VBUF_USAGE = 391,
    VALIDATE_ABND_VBUF_OVERFLOW = 392,
    VALIDATE_ABND_EXPECTED_NO_IBUF = 393,
    VALIDATE_ABND_EXPECTED_IBUF = 394,
    VALIDATE_ABND_IBUF_ALIVE = 395,
    VALIDATE_ABND_IBUF_USAGE = 396,
    VALIDATE_ABND_IBUF_OVERFLOW = 397,
    VALIDATE_ABND_EXPECTED_VIEW_BINDING = 398,
    VALIDATE_ABND_VIEW_ALIVE = 399,
    VALIDATE_ABND_EXPECT_TEXVIEW = 400,
    VALIDATE_ABND_EXPECT_SBVIEW = 401,
    VALIDATE_ABND_EXPECT_SIMGVIEW = 402,
    VALIDATE_ABND_TEXVIEW_IMAGETYPE_MISMATCH = 403,
    VALIDATE_ABND_TEXVIEW_EXPECTED_MULTISAMPLED_IMAGE = 404,
    VALIDATE_ABND_TEXVIEW_EXPECTED_NON_MULTISAMPLED_IMAGE = 405,
    VALIDATE_ABND_TEXVIEW_EXPECTED_FILTERABLE_IMAGE = 406,
    VALIDATE_ABND_TEXVIEW_EXPECTED_DEPTH_IMAGE = 407,
    VALIDATE_ABND_SBVIEW_READWRITE_IMMUTABLE = 408,
    VALIDATE_ABND_SIMGVIEW_COMPUTE_PASS_EXPECTED = 409,
    VALIDATE_ABND_SIMGVIEW_IMAGETYPE_MISMATCH = 410,
    VALIDATE_ABND_SIMGVIEW_ACCESSFORMAT = 411,
    VALIDATE_ABND_EXPECTED_SAMPLER_BINDING = 412,
    VALIDATE_ABND_UNEXPECTED_SAMPLER_COMPARE_NEVER = 413,
    VALIDATE_ABND_EXPECTED_SAMPLER_COMPARE_NEVER = 414,
    VALIDATE_ABND_EXPECTED_NONFILTERING_SAMPLER = 415,
    VALIDATE_ABND_SAMPLER_ALIVE = 416,
    VALIDATE_ABND_SAMPLER_VALID = 417,
    VALIDATE_ABND_TEXTURE_BINDING_VS_DEPTHSTENCIL_ATTACHMENT = 418,
    VALIDATE_ABND_TEXTURE_BINDING_VS_COLOR_ATTACHMENT = 419,
    VALIDATE_ABND_TEXTURE_BINDING_VS_RESOLVE_ATTACHMENT = 420,
    VALIDATE_ABND_TEXTURE_VS_STORAGEIMAGE_BINDING = 421,
    VALIDATE_AU_PASS_EXPECTED = 422,
    VALIDATE_AU_NO_PIPELINE = 423,
    VALIDATE_AU_PIPELINE_ALIVE = 424,
    VALIDATE_AU_PIPELINE_VALID = 425,
    VALIDATE_AU_PIPELINE_SHADER_ALIVE = 426,
    VALIDATE_AU_PIPELINE_SHADER_VALID = 427,
    VALIDATE_AU_NO_UNIFORMBLOCK_AT_SLOT = 428,
    VALIDATE_AU_SIZE = 429,
    VALIDATE_DRAW_RENDERPASS_EXPECTED = 430,
    VALIDATE_DRAW_BASEELEMENT_GE_ZERO = 431,
    VALIDATE_DRAW_NUMELEMENTS_GE_ZERO = 432,
    VALIDATE_DRAW_NUMINSTANCES_GE_ZERO = 433,
    VALIDATE_DRAW_EX_RENDERPASS_EXPECTED = 434,
    VALIDATE_DRAW_EX_BASEELEMENT_GE_ZERO = 435,
    VALIDATE_DRAW_EX_NUMELEMENTS_GE_ZERO = 436,
    VALIDATE_DRAW_EX_NUMINSTANCES_GE_ZERO = 437,
    VALIDATE_DRAW_EX_BASEINSTANCE_GE_ZERO = 438,
    VALIDATE_DRAW_EX_BASEVERTEX_VS_INDEXED = 439,
    VALIDATE_DRAW_EX_BASEINSTANCE_VS_INSTANCED = 440,
    VALIDATE_DRAW_EX_BASEVERTEX_NOT_SUPPORTED = 441,
    VALIDATE_DRAW_EX_BASEINSTANCE_NOT_SUPPORTED = 442,
    VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING = 443,
    VALIDATE_DISPATCH_COMPUTEPASS_EXPECTED = 444,
    VALIDATE_DISPATCH_NUMGROUPSX = 445,
    VALIDATE_DISPATCH_NUMGROUPSY = 446,
    VALIDATE_DISPATCH_NUMGROUPSZ = 447,
    VALIDATE_DISPATCH_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING = 448,
    VALIDATE_UPDATEBUF_USAGE = 449,
    VALIDATE_UPDATEBUF_SIZE = 450,
    VALIDATE_UPDATEBUF_ONCE = 451,
    VALIDATE_UPDATEBUF_APPEND = 452,
    VALIDATE_APPENDBUF_USAGE = 453,
    VALIDATE_APPENDBUF_SIZE = 454,
    VALIDATE_APPENDBUF_UPDATE = 455,
    VALIDATE_UPDIMG_USAGE = 456,
    VALIDATE_UPDIMG_ONCE = 457,
    VALIDATION_FAILED = 458,
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

struct SgVulkanEnvironment
{
    void* physical_device;
    void* device;
    void* queue;
    uint queue_family_index;
}

struct SgEnvironment
{
    SgEnvironmentDefaults defaults;
    SgMetalEnvironment metal;
    SgD3d11Environment d3d11;
    SgWgpuEnvironment wgpu;
    SgVulkanEnvironment vulkan;
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

struct SgD3d11Desc
{
    bool shader_debugging;
}

struct SgMetalDesc
{
    bool force_managed_storage_mode;
    bool use_command_buffer_with_retained_references;
}

struct SgWgpuDesc
{
    bool disable_bindgroups_cache;
    CInt bindgroups_cache_size;
}

struct SgVulkanDesc
{
    CInt copy_staging_buffer_size;
    CInt stream_staging_buffer_size;
    CInt descriptor_buffer_size;
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
    bool enforce_portable_limits;
    SgD3d11Desc d3d11;
    SgMetalDesc metal;
    SgWgpuDesc wgpu;
    SgVulkanDesc vulkan;
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

