// machine generated, do not edit

module sokol::sg;
import sokol;

extern fn void setup(Desc* desc) @extern("sg_setup");
extern fn void shutdown() @extern("sg_shutdown");
extern fn bool isvalid() @extern("sg_isvalid");
extern fn void reset_state_cache() @extern("sg_reset_state_cache");
extern fn void push_debug_group(ZString name) @extern("sg_push_debug_group");
extern fn void pop_debug_group() @extern("sg_pop_debug_group");
extern fn bool add_commit_listener(CommitListener listener) @extern("sg_add_commit_listener");
extern fn bool remove_commit_listener(CommitListener listener) @extern("sg_remove_commit_listener");
extern fn Buffer make_buffer(BufferDesc* desc) @extern("sg_make_buffer");
extern fn Image make_image(ImageDesc* desc) @extern("sg_make_image");
extern fn Sampler make_sampler(SamplerDesc* desc) @extern("sg_make_sampler");
extern fn Shader make_shader(ShaderDesc* desc) @extern("sg_make_shader");
extern fn Pipeline make_pipeline(PipelineDesc* desc) @extern("sg_make_pipeline");
extern fn Attachments make_attachments(AttachmentsDesc* desc) @extern("sg_make_attachments");
extern fn void destroy_buffer(Buffer buf) @extern("sg_destroy_buffer");
extern fn void destroy_image(Image img) @extern("sg_destroy_image");
extern fn void destroy_sampler(Sampler smp) @extern("sg_destroy_sampler");
extern fn void destroy_shader(Shader shd) @extern("sg_destroy_shader");
extern fn void destroy_pipeline(Pipeline pip) @extern("sg_destroy_pipeline");
extern fn void destroy_attachments(Attachments atts) @extern("sg_destroy_attachments");
extern fn void update_buffer(Buffer buf, Range* data) @extern("sg_update_buffer");
extern fn void update_image(Image img, ImageData* data) @extern("sg_update_image");
extern fn CInt append_buffer(Buffer buf, Range* data) @extern("sg_append_buffer");
extern fn bool query_buffer_overflow(Buffer buf) @extern("sg_query_buffer_overflow");
extern fn bool query_buffer_will_overflow(Buffer buf, usz size) @extern("sg_query_buffer_will_overflow");
extern fn void begin_pass(Pass* pass) @extern("sg_begin_pass");
extern fn void apply_viewport(CInt x, CInt y, CInt width, CInt height, bool origin_top_left) @extern("sg_apply_viewport");
extern fn void apply_viewportf(float x, float y, float width, float height, bool origin_top_left) @extern("sg_apply_viewportf");
extern fn void apply_scissor_rect(CInt x, CInt y, CInt width, CInt height, bool origin_top_left) @extern("sg_apply_scissor_rect");
extern fn void apply_scissor_rectf(float x, float y, float width, float height, bool origin_top_left) @extern("sg_apply_scissor_rectf");
extern fn void apply_pipeline(Pipeline pip) @extern("sg_apply_pipeline");
extern fn void apply_bindings(Bindings* bindings) @extern("sg_apply_bindings");
extern fn void apply_uniforms(CInt ub_slot, Range* data) @extern("sg_apply_uniforms");
extern fn void draw(CInt base_element, CInt num_elements, CInt num_instances) @extern("sg_draw");
extern fn void dispatch(CInt num_groups_x, CInt num_groups_y, CInt num_groups_z) @extern("sg_dispatch");
extern fn void end_pass() @extern("sg_end_pass");
extern fn void commit() @extern("sg_commit");
extern fn Desc query_desc() @extern("sg_query_desc");
extern fn Backend query_backend() @extern("sg_query_backend");
extern fn Features query_features() @extern("sg_query_features");
extern fn Limits query_limits() @extern("sg_query_limits");
extern fn PixelformatInfo query_pixelformat(PixelFormat fmt) @extern("sg_query_pixelformat");
extern fn CInt query_row_pitch(PixelFormat fmt, CInt width, CInt row_align_bytes) @extern("sg_query_row_pitch");
extern fn CInt query_surface_pitch(PixelFormat fmt, CInt width, CInt height, CInt row_align_bytes) @extern("sg_query_surface_pitch");
extern fn ResourceState query_buffer_state(Buffer buf) @extern("sg_query_buffer_state");
extern fn ResourceState query_image_state(Image img) @extern("sg_query_image_state");
extern fn ResourceState query_sampler_state(Sampler smp) @extern("sg_query_sampler_state");
extern fn ResourceState query_shader_state(Shader shd) @extern("sg_query_shader_state");
extern fn ResourceState query_pipeline_state(Pipeline pip) @extern("sg_query_pipeline_state");
extern fn ResourceState query_attachments_state(Attachments atts) @extern("sg_query_attachments_state");
extern fn BufferInfo query_buffer_info(Buffer buf) @extern("sg_query_buffer_info");
extern fn ImageInfo query_image_info(Image img) @extern("sg_query_image_info");
extern fn SamplerInfo query_sampler_info(Sampler smp) @extern("sg_query_sampler_info");
extern fn ShaderInfo query_shader_info(Shader shd) @extern("sg_query_shader_info");
extern fn PipelineInfo query_pipeline_info(Pipeline pip) @extern("sg_query_pipeline_info");
extern fn AttachmentsInfo query_attachments_info(Attachments atts) @extern("sg_query_attachments_info");
extern fn BufferDesc query_buffer_desc(Buffer buf) @extern("sg_query_buffer_desc");
extern fn ImageDesc query_image_desc(Image img) @extern("sg_query_image_desc");
extern fn SamplerDesc query_sampler_desc(Sampler smp) @extern("sg_query_sampler_desc");
extern fn ShaderDesc query_shader_desc(Shader shd) @extern("sg_query_shader_desc");
extern fn PipelineDesc query_pipeline_desc(Pipeline pip) @extern("sg_query_pipeline_desc");
extern fn AttachmentsDesc query_attachments_desc(Attachments atts) @extern("sg_query_attachments_desc");
extern fn BufferDesc query_buffer_defaults(BufferDesc* desc) @extern("sg_query_buffer_defaults");
extern fn ImageDesc query_image_defaults(ImageDesc* desc) @extern("sg_query_image_defaults");
extern fn SamplerDesc query_sampler_defaults(SamplerDesc* desc) @extern("sg_query_sampler_defaults");
extern fn ShaderDesc query_shader_defaults(ShaderDesc* desc) @extern("sg_query_shader_defaults");
extern fn PipelineDesc query_pipeline_defaults(PipelineDesc* desc) @extern("sg_query_pipeline_defaults");
extern fn AttachmentsDesc query_attachments_defaults(AttachmentsDesc* desc) @extern("sg_query_attachments_defaults");
extern fn usz query_buffer_size(Buffer buf) @extern("sg_query_buffer_size");
extern fn BufferType query_buffer_type(Buffer buf) @extern("sg_query_buffer_type");
extern fn Usage query_buffer_usage(Buffer buf) @extern("sg_query_buffer_usage");
extern fn ImageType query_image_type(Image img) @extern("sg_query_image_type");
extern fn CInt query_image_width(Image img) @extern("sg_query_image_width");
extern fn CInt query_image_height(Image img) @extern("sg_query_image_height");
extern fn CInt query_image_num_slices(Image img) @extern("sg_query_image_num_slices");
extern fn CInt query_image_num_mipmaps(Image img) @extern("sg_query_image_num_mipmaps");
extern fn PixelFormat query_image_pixelformat(Image img) @extern("sg_query_image_pixelformat");
extern fn Usage query_image_usage(Image img) @extern("sg_query_image_usage");
extern fn CInt query_image_sample_count(Image img) @extern("sg_query_image_sample_count");
extern fn Buffer alloc_buffer() @extern("sg_alloc_buffer");
extern fn Image alloc_image() @extern("sg_alloc_image");
extern fn Sampler alloc_sampler() @extern("sg_alloc_sampler");
extern fn Shader alloc_shader() @extern("sg_alloc_shader");
extern fn Pipeline alloc_pipeline() @extern("sg_alloc_pipeline");
extern fn Attachments alloc_attachments() @extern("sg_alloc_attachments");
extern fn void dealloc_buffer(Buffer buf) @extern("sg_dealloc_buffer");
extern fn void dealloc_image(Image img) @extern("sg_dealloc_image");
extern fn void dealloc_sampler(Sampler smp) @extern("sg_dealloc_sampler");
extern fn void dealloc_shader(Shader shd) @extern("sg_dealloc_shader");
extern fn void dealloc_pipeline(Pipeline pip) @extern("sg_dealloc_pipeline");
extern fn void dealloc_attachments(Attachments attachments) @extern("sg_dealloc_attachments");
extern fn void init_buffer(Buffer buf, BufferDesc* desc) @extern("sg_init_buffer");
extern fn void init_image(Image img, ImageDesc* desc) @extern("sg_init_image");
extern fn void init_sampler(Sampler smg, SamplerDesc* desc) @extern("sg_init_sampler");
extern fn void init_shader(Shader shd, ShaderDesc* desc) @extern("sg_init_shader");
extern fn void init_pipeline(Pipeline pip, PipelineDesc* desc) @extern("sg_init_pipeline");
extern fn void init_attachments(Attachments attachments, AttachmentsDesc* desc) @extern("sg_init_attachments");
extern fn void uninit_buffer(Buffer buf) @extern("sg_uninit_buffer");
extern fn void uninit_image(Image img) @extern("sg_uninit_image");
extern fn void uninit_sampler(Sampler smp) @extern("sg_uninit_sampler");
extern fn void uninit_shader(Shader shd) @extern("sg_uninit_shader");
extern fn void uninit_pipeline(Pipeline pip) @extern("sg_uninit_pipeline");
extern fn void uninit_attachments(Attachments atts) @extern("sg_uninit_attachments");
extern fn void fail_buffer(Buffer buf) @extern("sg_fail_buffer");
extern fn void fail_image(Image img) @extern("sg_fail_image");
extern fn void fail_sampler(Sampler smp) @extern("sg_fail_sampler");
extern fn void fail_shader(Shader shd) @extern("sg_fail_shader");
extern fn void fail_pipeline(Pipeline pip) @extern("sg_fail_pipeline");
extern fn void fail_attachments(Attachments atts) @extern("sg_fail_attachments");
extern fn void enable_frame_stats() @extern("sg_enable_frame_stats");
extern fn void disable_frame_stats() @extern("sg_disable_frame_stats");
extern fn bool frame_stats_enabled() @extern("sg_frame_stats_enabled");
extern fn FrameStats query_frame_stats() @extern("sg_query_frame_stats");
extern fn void* d3d11_device() @extern("sg_d3d11_device");
extern fn void* d3d11_device_context() @extern("sg_d3d11_device_context");
extern fn D3d11BufferInfo d3d11_query_buffer_info(Buffer buf) @extern("sg_d3d11_query_buffer_info");
extern fn D3d11ImageInfo d3d11_query_image_info(Image img) @extern("sg_d3d11_query_image_info");
extern fn D3d11SamplerInfo d3d11_query_sampler_info(Sampler smp) @extern("sg_d3d11_query_sampler_info");
extern fn D3d11ShaderInfo d3d11_query_shader_info(Shader shd) @extern("sg_d3d11_query_shader_info");
extern fn D3d11PipelineInfo d3d11_query_pipeline_info(Pipeline pip) @extern("sg_d3d11_query_pipeline_info");
extern fn D3d11AttachmentsInfo d3d11_query_attachments_info(Attachments atts) @extern("sg_d3d11_query_attachments_info");
extern fn void* mtl_device() @extern("sg_mtl_device");
extern fn void* mtl_render_command_encoder() @extern("sg_mtl_render_command_encoder");
extern fn void* mtl_compute_command_encoder() @extern("sg_mtl_compute_command_encoder");
extern fn MtlBufferInfo mtl_query_buffer_info(Buffer buf) @extern("sg_mtl_query_buffer_info");
extern fn MtlImageInfo mtl_query_image_info(Image img) @extern("sg_mtl_query_image_info");
extern fn MtlSamplerInfo mtl_query_sampler_info(Sampler smp) @extern("sg_mtl_query_sampler_info");
extern fn MtlShaderInfo mtl_query_shader_info(Shader shd) @extern("sg_mtl_query_shader_info");
extern fn MtlPipelineInfo mtl_query_pipeline_info(Pipeline pip) @extern("sg_mtl_query_pipeline_info");
extern fn void* wgpu_device() @extern("sg_wgpu_device");
extern fn void* wgpu_queue() @extern("sg_wgpu_queue");
extern fn void* wgpu_command_encoder() @extern("sg_wgpu_command_encoder");
extern fn void* wgpu_render_pass_encoder() @extern("sg_wgpu_render_pass_encoder");
extern fn void* wgpu_compute_pass_encoder() @extern("sg_wgpu_compute_pass_encoder");
extern fn WgpuBufferInfo wgpu_query_buffer_info(Buffer buf) @extern("sg_wgpu_query_buffer_info");
extern fn WgpuImageInfo wgpu_query_image_info(Image img) @extern("sg_wgpu_query_image_info");
extern fn WgpuSamplerInfo wgpu_query_sampler_info(Sampler smp) @extern("sg_wgpu_query_sampler_info");
extern fn WgpuShaderInfo wgpu_query_shader_info(Shader shd) @extern("sg_wgpu_query_shader_info");
extern fn WgpuPipelineInfo wgpu_query_pipeline_info(Pipeline pip) @extern("sg_wgpu_query_pipeline_info");
extern fn WgpuAttachmentsInfo wgpu_query_attachments_info(Attachments atts) @extern("sg_wgpu_query_attachments_info");
extern fn GlBufferInfo gl_query_buffer_info(Buffer buf) @extern("sg_gl_query_buffer_info");
extern fn GlImageInfo gl_query_image_info(Image img) @extern("sg_gl_query_image_info");
extern fn GlSamplerInfo gl_query_sampler_info(Sampler smp) @extern("sg_gl_query_sampler_info");
extern fn GlShaderInfo gl_query_shader_info(Shader shd) @extern("sg_gl_query_shader_info");
extern fn GlAttachmentsInfo gl_query_attachments_info(Attachments atts) @extern("sg_gl_query_attachments_info");

struct Buffer
{
    uint id;
}

struct Image
{
    uint id;
}

struct Sampler
{
    uint id;
}

struct Shader
{
    uint id;
}

struct Pipeline
{
    uint id;
}

struct Attachments
{
    uint id;
}

struct Range
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
const usz MAX_TEXTUREARRAY_LAYERS = 128;
const usz MAX_UNIFORMBLOCK_BINDSLOTS = 8;
const usz MAX_VERTEXBUFFER_BINDSLOTS = 8;
const usz MAX_IMAGE_BINDSLOTS = 16;
const usz MAX_SAMPLER_BINDSLOTS = 16;
const usz MAX_STORAGEBUFFER_BINDSLOTS = 8;
const usz MAX_IMAGE_SAMPLER_PAIRS = 16;

struct Color
{
    float r;
    float g;
    float b;
    float a;
}

distinct Backend = int;
module sokol::sg::backend;
const Backend GLCORE = 0;
const Backend GLES3 = 1;
const Backend D3D11 = 2;
const Backend METAL_IOS = 3;
const Backend METAL_MACOS = 4;
const Backend METAL_SIMULATOR = 5;
const Backend WGPU = 6;
const Backend DUMMY = 7;
module sokol::sg;
import sokol;

distinct PixelFormat = uint;
module sokol::sg::pixel_format;
const PixelFormat DEFAULT = 0;
const PixelFormat NONE = 1;
const PixelFormat R8 = 2;
const PixelFormat R8SN = 3;
const PixelFormat R8UI = 4;
const PixelFormat R8SI = 5;
const PixelFormat R16 = 6;
const PixelFormat R16SN = 7;
const PixelFormat R16UI = 8;
const PixelFormat R16SI = 9;
const PixelFormat R16F = 10;
const PixelFormat RG8 = 11;
const PixelFormat RG8SN = 12;
const PixelFormat RG8UI = 13;
const PixelFormat RG8SI = 14;
const PixelFormat R32UI = 15;
const PixelFormat R32SI = 16;
const PixelFormat R32F = 17;
const PixelFormat RG16 = 18;
const PixelFormat RG16SN = 19;
const PixelFormat RG16UI = 20;
const PixelFormat RG16SI = 21;
const PixelFormat RG16F = 22;
const PixelFormat RGBA8 = 23;
const PixelFormat SRGB8A8 = 24;
const PixelFormat RGBA8SN = 25;
const PixelFormat RGBA8UI = 26;
const PixelFormat RGBA8SI = 27;
const PixelFormat BGRA8 = 28;
const PixelFormat RGB10A2 = 29;
const PixelFormat RG11B10F = 30;
const PixelFormat RGB9E5 = 31;
const PixelFormat RG32UI = 32;
const PixelFormat RG32SI = 33;
const PixelFormat RG32F = 34;
const PixelFormat RGBA16 = 35;
const PixelFormat RGBA16SN = 36;
const PixelFormat RGBA16UI = 37;
const PixelFormat RGBA16SI = 38;
const PixelFormat RGBA16F = 39;
const PixelFormat RGBA32UI = 40;
const PixelFormat RGBA32SI = 41;
const PixelFormat RGBA32F = 42;
const PixelFormat DEPTH = 43;
const PixelFormat DEPTH_STENCIL = 44;
const PixelFormat BC1_RGBA = 45;
const PixelFormat BC2_RGBA = 46;
const PixelFormat BC3_RGBA = 47;
const PixelFormat BC3_SRGBA = 48;
const PixelFormat BC4_R = 49;
const PixelFormat BC4_RSN = 50;
const PixelFormat BC5_RG = 51;
const PixelFormat BC5_RGSN = 52;
const PixelFormat BC6H_RGBF = 53;
const PixelFormat BC6H_RGBUF = 54;
const PixelFormat BC7_RGBA = 55;
const PixelFormat BC7_SRGBA = 56;
const PixelFormat ETC2_RGB8 = 57;
const PixelFormat ETC2_SRGB8 = 58;
const PixelFormat ETC2_RGB8A1 = 59;
const PixelFormat ETC2_RGBA8 = 60;
const PixelFormat ETC2_SRGB8A8 = 61;
const PixelFormat EAC_R11 = 62;
const PixelFormat EAC_R11SN = 63;
const PixelFormat EAC_RG11 = 64;
const PixelFormat EAC_RG11SN = 65;
const PixelFormat ASTC_4X4_RGBA = 66;
const PixelFormat ASTC_4X4_SRGBA = 67;
const PixelFormat NUM = 68;
module sokol::sg;
import sokol;

struct PixelformatInfo
{
    bool sample;
    bool filter;
    bool render;
    bool blend;
    bool msaa;
    bool depth;
    bool compressed;
    CInt bytes_per_pixel;
}

struct Features
{
    bool origin_top_left;
    bool image_clamp_to_border;
    bool mrt_independent_blend_state;
    bool mrt_independent_write_mask;
    bool compute;
    bool msaa_image_bindings;
}

struct Limits
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

distinct ResourceState = uint;
module sokol::sg::resource_state;
const ResourceState INITIAL = 0;
const ResourceState ALLOC = 1;
const ResourceState VALID = 2;
const ResourceState FAILED = 3;
const ResourceState INVALID = 4;
module sokol::sg;
import sokol;

distinct Usage = uint;
module sokol::sg::usage;
const Usage DEFAULT = 0;
const Usage IMMUTABLE = 1;
const Usage DYNAMIC = 2;
const Usage STREAM = 3;
const Usage NUM = 4;
module sokol::sg;
import sokol;

distinct BufferType = uint;
module sokol::sg::buffer_type;
const BufferType DEFAULT = 0;
const BufferType VERTEXBUFFER = 1;
const BufferType INDEXBUFFER = 2;
const BufferType STORAGEBUFFER = 3;
const BufferType NUM = 4;
module sokol::sg;
import sokol;

distinct IndexType = uint;
module sokol::sg::index_type;
const IndexType DEFAULT = 0;
const IndexType NONE = 1;
const IndexType UINT16 = 2;
const IndexType UINT32 = 3;
const IndexType NUM = 4;
module sokol::sg;
import sokol;

distinct ImageType = uint;
module sokol::sg::image_type;
const ImageType DEFAULT = 0;
const ImageType TYPE_2D = 1;
const ImageType CUBE = 2;
const ImageType TYPE_3D = 3;
const ImageType ARRAY = 4;
const ImageType NUM = 5;
module sokol::sg;
import sokol;

distinct ImageSampleType = uint;
module sokol::sg::image_sample_type;
const ImageSampleType DEFAULT = 0;
const ImageSampleType FLOAT = 1;
const ImageSampleType DEPTH = 2;
const ImageSampleType SINT = 3;
const ImageSampleType UINT = 4;
const ImageSampleType UNFILTERABLE_FLOAT = 5;
const ImageSampleType NUM = 6;
module sokol::sg;
import sokol;

distinct SamplerType = uint;
module sokol::sg::sampler_type;
const SamplerType DEFAULT = 0;
const SamplerType FILTERING = 1;
const SamplerType NONFILTERING = 2;
const SamplerType COMPARISON = 3;
const SamplerType NUM = 4;
module sokol::sg;
import sokol;

distinct CubeFace = uint;
module sokol::sg::cube_face;
const CubeFace POS_X = 0;
const CubeFace NEG_X = 1;
const CubeFace POS_Y = 2;
const CubeFace NEG_Y = 3;
const CubeFace POS_Z = 4;
const CubeFace NEG_Z = 5;
const CubeFace NUM = 6;
module sokol::sg;
import sokol;

distinct PrimitiveType = uint;
module sokol::sg::primitive_type;
const PrimitiveType DEFAULT = 0;
const PrimitiveType POINTS = 1;
const PrimitiveType LINES = 2;
const PrimitiveType LINE_STRIP = 3;
const PrimitiveType TRIANGLES = 4;
const PrimitiveType TRIANGLE_STRIP = 5;
const PrimitiveType NUM = 6;
module sokol::sg;
import sokol;

distinct Filter = uint;
module sokol::sg::filter;
const Filter DEFAULT = 0;
const Filter NEAREST = 1;
const Filter LINEAR = 2;
const Filter NUM = 3;
module sokol::sg;
import sokol;

distinct Wrap = uint;
module sokol::sg::wrap;
const Wrap DEFAULT = 0;
const Wrap REPEAT = 1;
const Wrap CLAMP_TO_EDGE = 2;
const Wrap CLAMP_TO_BORDER = 3;
const Wrap MIRRORED_REPEAT = 4;
const Wrap NUM = 5;
module sokol::sg;
import sokol;

distinct BorderColor = uint;
module sokol::sg::border_color;
const BorderColor DEFAULT = 0;
const BorderColor TRANSPARENT_BLACK = 1;
const BorderColor OPAQUE_BLACK = 2;
const BorderColor OPAQUE_WHITE = 3;
const BorderColor NUM = 4;
module sokol::sg;
import sokol;

distinct VertexFormat = uint;
module sokol::sg::vertex_format;
const VertexFormat INVALID = 0;
const VertexFormat FLOAT = 1;
const VertexFormat FLOAT2 = 2;
const VertexFormat FLOAT3 = 3;
const VertexFormat FLOAT4 = 4;
const VertexFormat INT = 5;
const VertexFormat INT2 = 6;
const VertexFormat INT3 = 7;
const VertexFormat INT4 = 8;
const VertexFormat UINT = 9;
const VertexFormat UINT2 = 10;
const VertexFormat UINT3 = 11;
const VertexFormat UINT4 = 12;
const VertexFormat BYTE4 = 13;
const VertexFormat BYTE4N = 14;
const VertexFormat UBYTE4 = 15;
const VertexFormat UBYTE4N = 16;
const VertexFormat SHORT2 = 17;
const VertexFormat SHORT2N = 18;
const VertexFormat USHORT2 = 19;
const VertexFormat USHORT2N = 20;
const VertexFormat SHORT4 = 21;
const VertexFormat SHORT4N = 22;
const VertexFormat USHORT4 = 23;
const VertexFormat USHORT4N = 24;
const VertexFormat UINT10_N2 = 25;
const VertexFormat HALF2 = 26;
const VertexFormat HALF4 = 27;
const VertexFormat NUM = 28;
module sokol::sg;
import sokol;

distinct VertexStep = uint;
module sokol::sg::vertex_step;
const VertexStep DEFAULT = 0;
const VertexStep PER_VERTEX = 1;
const VertexStep PER_INSTANCE = 2;
const VertexStep NUM = 3;
module sokol::sg;
import sokol;

distinct UniformType = uint;
module sokol::sg::uniform_type;
const UniformType INVALID = 0;
const UniformType FLOAT = 1;
const UniformType FLOAT2 = 2;
const UniformType FLOAT3 = 3;
const UniformType FLOAT4 = 4;
const UniformType INT = 5;
const UniformType INT2 = 6;
const UniformType INT3 = 7;
const UniformType INT4 = 8;
const UniformType MAT4 = 9;
const UniformType NUM = 10;
module sokol::sg;
import sokol;

distinct UniformLayout = uint;
module sokol::sg::uniform_layout;
const UniformLayout DEFAULT = 0;
const UniformLayout NATIVE = 1;
const UniformLayout STD140 = 2;
const UniformLayout NUM = 3;
module sokol::sg;
import sokol;

distinct CullMode = uint;
module sokol::sg::cull_mode;
const CullMode DEFAULT = 0;
const CullMode NONE = 1;
const CullMode FRONT = 2;
const CullMode BACK = 3;
const CullMode NUM = 4;
module sokol::sg;
import sokol;

distinct FaceWinding = uint;
module sokol::sg::face_winding;
const FaceWinding DEFAULT = 0;
const FaceWinding CCW = 1;
const FaceWinding CW = 2;
const FaceWinding NUM = 3;
module sokol::sg;
import sokol;

distinct CompareFunc = uint;
module sokol::sg::compare_func;
const CompareFunc DEFAULT = 0;
const CompareFunc NEVER = 1;
const CompareFunc LESS = 2;
const CompareFunc EQUAL = 3;
const CompareFunc LESS_EQUAL = 4;
const CompareFunc GREATER = 5;
const CompareFunc NOT_EQUAL = 6;
const CompareFunc GREATER_EQUAL = 7;
const CompareFunc ALWAYS = 8;
const CompareFunc NUM = 9;
module sokol::sg;
import sokol;

distinct StencilOp = uint;
module sokol::sg::stencil_op;
const StencilOp DEFAULT = 0;
const StencilOp KEEP = 1;
const StencilOp ZERO = 2;
const StencilOp REPLACE = 3;
const StencilOp INCR_CLAMP = 4;
const StencilOp DECR_CLAMP = 5;
const StencilOp INVERT = 6;
const StencilOp INCR_WRAP = 7;
const StencilOp DECR_WRAP = 8;
const StencilOp NUM = 9;
module sokol::sg;
import sokol;

distinct BlendFactor = uint;
module sokol::sg::blend_factor;
const BlendFactor DEFAULT = 0;
const BlendFactor ZERO = 1;
const BlendFactor ONE = 2;
const BlendFactor SRC_COLOR = 3;
const BlendFactor ONE_MINUS_SRC_COLOR = 4;
const BlendFactor SRC_ALPHA = 5;
const BlendFactor ONE_MINUS_SRC_ALPHA = 6;
const BlendFactor DST_COLOR = 7;
const BlendFactor ONE_MINUS_DST_COLOR = 8;
const BlendFactor DST_ALPHA = 9;
const BlendFactor ONE_MINUS_DST_ALPHA = 10;
const BlendFactor SRC_ALPHA_SATURATED = 11;
const BlendFactor BLEND_COLOR = 12;
const BlendFactor ONE_MINUS_BLEND_COLOR = 13;
const BlendFactor BLEND_ALPHA = 14;
const BlendFactor ONE_MINUS_BLEND_ALPHA = 15;
const BlendFactor NUM = 16;
module sokol::sg;
import sokol;

distinct BlendOp = uint;
module sokol::sg::blend_op;
const BlendOp DEFAULT = 0;
const BlendOp ADD = 1;
const BlendOp SUBTRACT = 2;
const BlendOp REVERSE_SUBTRACT = 3;
const BlendOp MIN = 4;
const BlendOp MAX = 5;
const BlendOp NUM = 6;
module sokol::sg;
import sokol;

distinct ColorMask = uint;
module sokol::sg::color_mask;
const ColorMask DEFAULT = 0;
const ColorMask NONE = 16;
const ColorMask R = 1;
const ColorMask G = 2;
const ColorMask RG = 3;
const ColorMask B = 4;
const ColorMask RB = 5;
const ColorMask GB = 6;
const ColorMask RGB = 7;
const ColorMask A = 8;
const ColorMask RA = 9;
const ColorMask GA = 10;
const ColorMask RGA = 11;
const ColorMask BA = 12;
const ColorMask RBA = 13;
const ColorMask GBA = 14;
const ColorMask RGBA = 15;
module sokol::sg;
import sokol;

distinct LoadAction = uint;
module sokol::sg::load_action;
const LoadAction DEFAULT = 0;
const LoadAction CLEAR = 1;
const LoadAction LOAD = 2;
const LoadAction DONTCARE = 3;
module sokol::sg;
import sokol;

distinct StoreAction = uint;
module sokol::sg::store_action;
const StoreAction DEFAULT = 0;
const StoreAction STORE = 1;
const StoreAction DONTCARE = 2;
module sokol::sg;
import sokol;

struct ColorAttachmentAction
{
    LoadAction load_action;
    StoreAction store_action;
    Color clear_value;
}

struct DepthAttachmentAction
{
    LoadAction load_action;
    StoreAction store_action;
    float clear_value;
}

struct StencilAttachmentAction
{
    LoadAction load_action;
    StoreAction store_action;
    char clear_value;
}

struct PassAction
{
    ColorAttachmentAction[4] colors;
    DepthAttachmentAction depth;
    StencilAttachmentAction stencil;
}

struct MetalSwapchain
{
    void* current_drawable;
    void* depth_stencil_texture;
    void* msaa_color_texture;
}

struct D3d11Swapchain
{
    void* render_view;
    void* resolve_view;
    void* depth_stencil_view;
}

struct WgpuSwapchain
{
    void* render_view;
    void* resolve_view;
    void* depth_stencil_view;
}

struct GlSwapchain
{
    uint framebuffer;
}

struct Swapchain
{
    CInt width;
    CInt height;
    CInt sample_count;
    PixelFormat color_format;
    PixelFormat depth_format;
    MetalSwapchain metal;
    D3d11Swapchain d3d11;
    WgpuSwapchain wgpu;
    GlSwapchain gl;
}

struct Pass
{
    uint _start_canary;
    bool compute;
    PassAction action;
    Attachments attachments;
    Swapchain swapchain;
    ZString label;
    uint _end_canary;
}

struct Bindings
{
    uint _start_canary;
    Buffer[8] vertex_buffers;
    CInt[8] vertex_buffer_offsets;
    Buffer index_buffer;
    CInt index_buffer_offset;
    Image[16] images;
    Sampler[16] samplers;
    Buffer[8] storage_buffers;
    uint _end_canary;
}

struct BufferDesc
{
    uint _start_canary;
    usz size;
    BufferType type;
    Usage usage;
    Range data;
    ZString label;
    uint[2] gl_buffers;
    void*[2] mtl_buffers;
    void* d3d11_buffer;
    void* wgpu_buffer;
    uint _end_canary;
}

struct ImageData
{
    Range[6][16] subimage;
}

struct ImageDesc
{
    uint _start_canary;
    ImageType type;
    bool render_target;
    CInt width;
    CInt height;
    CInt num_slices;
    CInt num_mipmaps;
    Usage usage;
    PixelFormat pixel_format;
    CInt sample_count;
    ImageData data;
    ZString label;
    uint[2] gl_textures;
    uint gl_texture_target;
    void*[2] mtl_textures;
    void* d3d11_texture;
    void* d3d11_shader_resource_view;
    void* wgpu_texture;
    void* wgpu_texture_view;
    uint _end_canary;
}

struct SamplerDesc
{
    uint _start_canary;
    Filter min_filter;
    Filter mag_filter;
    Filter mipmap_filter;
    Wrap wrap_u;
    Wrap wrap_v;
    Wrap wrap_w;
    float min_lod;
    float max_lod;
    BorderColor border_color;
    CompareFunc compare;
    uint max_anisotropy;
    ZString label;
    uint gl_sampler;
    void* mtl_sampler;
    void* d3d11_sampler;
    void* wgpu_sampler;
    uint _end_canary;
}

distinct ShaderStage = uint;
module sokol::sg::shader_stage;
const ShaderStage NONE = 0;
const ShaderStage VERTEX = 1;
const ShaderStage FRAGMENT = 2;
const ShaderStage COMPUTE = 3;
module sokol::sg;
import sokol;

struct ShaderFunction
{
    ZString source;
    Range bytecode;
    ZString entry;
    ZString d3d11_target;
}

distinct ShaderAttrBaseType = uint;
module sokol::sg::shader_attr_base_type;
const ShaderAttrBaseType UNDEFINED = 0;
const ShaderAttrBaseType FLOAT = 1;
const ShaderAttrBaseType SINT = 2;
const ShaderAttrBaseType UINT = 3;
module sokol::sg;
import sokol;

struct ShaderVertexAttr
{
    ShaderAttrBaseType base_type;
    ZString glsl_name;
    ZString hlsl_sem_name;
    char hlsl_sem_index;
}

struct GlslShaderUniform
{
    UniformType type;
    ushort array_count;
    ZString glsl_name;
}

struct ShaderUniformBlock
{
    ShaderStage stage;
    uint size;
    char hlsl_register_b_n;
    char msl_buffer_n;
    char wgsl_group0_binding_n;
    UniformLayout layout;
    GlslShaderUniform[16] glsl_uniforms;
}

struct ShaderImage
{
    ShaderStage stage;
    ImageType image_type;
    ImageSampleType sample_type;
    bool multisampled;
    char hlsl_register_t_n;
    char msl_texture_n;
    char wgsl_group1_binding_n;
}

struct ShaderSampler
{
    ShaderStage stage;
    SamplerType sampler_type;
    char hlsl_register_s_n;
    char msl_sampler_n;
    char wgsl_group1_binding_n;
}

struct ShaderStorageBuffer
{
    ShaderStage stage;
    bool readonly;
    char hlsl_register_t_n;
    char hlsl_register_u_n;
    char msl_buffer_n;
    char wgsl_group1_binding_n;
    char glsl_binding_n;
}

struct ShaderImageSamplerPair
{
    ShaderStage stage;
    char image_slot;
    char sampler_slot;
    ZString glsl_name;
}

struct MtlShaderThreadsPerThreadgroup
{
    CInt x;
    CInt y;
    CInt z;
}

struct ShaderDesc
{
    uint _start_canary;
    ShaderFunction vertex_func;
    ShaderFunction fragment_func;
    ShaderFunction compute_func;
    ShaderVertexAttr[16] attrs;
    ShaderUniformBlock[8] uniform_blocks;
    ShaderStorageBuffer[8] storage_buffers;
    ShaderImage[16] images;
    ShaderSampler[16] samplers;
    ShaderImageSamplerPair[16] image_sampler_pairs;
    MtlShaderThreadsPerThreadgroup mtl_threads_per_threadgroup;
    ZString label;
    uint _end_canary;
}

struct VertexBufferLayoutState
{
    CInt stride;
    VertexStep step_func;
    CInt step_rate;
}

struct VertexAttrState
{
    CInt buffer_index;
    CInt offset;
    VertexFormat format;
}

struct VertexLayoutState
{
    VertexBufferLayoutState[8] buffers;
    VertexAttrState[16] attrs;
}

struct StencilFaceState
{
    CompareFunc compare;
    StencilOp fail_op;
    StencilOp depth_fail_op;
    StencilOp pass_op;
}

struct StencilState
{
    bool enabled;
    StencilFaceState front;
    StencilFaceState back;
    char read_mask;
    char write_mask;
    char ref;
}

struct DepthState
{
    PixelFormat pixel_format;
    CompareFunc compare;
    bool write_enabled;
    float bias;
    float bias_slope_scale;
    float bias_clamp;
}

struct BlendState
{
    bool enabled;
    BlendFactor src_factor_rgb;
    BlendFactor dst_factor_rgb;
    BlendOp op_rgb;
    BlendFactor src_factor_alpha;
    BlendFactor dst_factor_alpha;
    BlendOp op_alpha;
}

struct ColorTargetState
{
    PixelFormat pixel_format;
    ColorMask write_mask;
    BlendState blend;
}

struct PipelineDesc
{
    uint _start_canary;
    bool compute;
    Shader shader;
    VertexLayoutState layout;
    DepthState depth;
    StencilState stencil;
    CInt color_count;
    ColorTargetState[4] colors;
    PrimitiveType primitive_type;
    IndexType index_type;
    CullMode cull_mode;
    FaceWinding face_winding;
    CInt sample_count;
    Color blend_color;
    bool alpha_to_coverage_enabled;
    ZString label;
    uint _end_canary;
}

struct AttachmentDesc
{
    Image image;
    CInt mip_level;
    CInt slice;
}

struct AttachmentsDesc
{
    uint _start_canary;
    AttachmentDesc[4] colors;
    AttachmentDesc[4] resolves;
    AttachmentDesc depth_stencil;
    ZString label;
    uint _end_canary;
}

struct SlotInfo
{
    ResourceState state;
    uint res_id;
}

struct BufferInfo
{
    SlotInfo slot;
    uint update_frame_index;
    uint append_frame_index;
    CInt append_pos;
    bool append_overflow;
    CInt num_slots;
    CInt active_slot;
}

struct ImageInfo
{
    SlotInfo slot;
    uint upd_frame_index;
    CInt num_slots;
    CInt active_slot;
}

struct SamplerInfo
{
    SlotInfo slot;
}

struct ShaderInfo
{
    SlotInfo slot;
}

struct PipelineInfo
{
    SlotInfo slot;
}

struct AttachmentsInfo
{
    SlotInfo slot;
}

struct FrameStatsGl
{
    uint num_bind_buffer;
    uint num_active_texture;
    uint num_bind_texture;
    uint num_bind_sampler;
    uint num_use_program;
    uint num_render_state;
    uint num_vertex_attrib_pointer;
    uint num_vertex_attrib_divisor;
    uint num_enable_vertex_attrib_array;
    uint num_disable_vertex_attrib_array;
    uint num_uniform;
    uint num_memory_barriers;
}

struct FrameStatsD3d11Pass
{
    uint num_om_set_render_targets;
    uint num_clear_render_target_view;
    uint num_clear_depth_stencil_view;
    uint num_resolve_subresource;
}

struct FrameStatsD3d11Pipeline
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

struct FrameStatsD3d11Bindings
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

struct FrameStatsD3d11Uniforms
{
    uint num_update_subresource;
}

struct FrameStatsD3d11Draw
{
    uint num_draw_indexed_instanced;
    uint num_draw_indexed;
    uint num_draw_instanced;
    uint num_draw;
}

struct FrameStatsD3d11
{
    FrameStatsD3d11Pass pass;
    FrameStatsD3d11Pipeline pipeline;
    FrameStatsD3d11Bindings bindings;
    FrameStatsD3d11Uniforms uniforms;
    FrameStatsD3d11Draw draw;
    uint num_map;
    uint num_unmap;
}

struct FrameStatsMetalIdpool
{
    uint num_added;
    uint num_released;
    uint num_garbage_collected;
}

struct FrameStatsMetalPipeline
{
    uint num_set_blend_color;
    uint num_set_cull_mode;
    uint num_set_front_facing_winding;
    uint num_set_stencil_reference_value;
    uint num_set_depth_bias;
    uint num_set_render_pipeline_state;
    uint num_set_depth_stencil_state;
}

struct FrameStatsMetalBindings
{
    uint num_set_vertex_buffer;
    uint num_set_vertex_texture;
    uint num_set_vertex_sampler_state;
    uint num_set_fragment_buffer;
    uint num_set_fragment_texture;
    uint num_set_fragment_sampler_state;
    uint num_set_compute_buffer;
    uint num_set_compute_texture;
    uint num_set_compute_sampler_state;
}

struct FrameStatsMetalUniforms
{
    uint num_set_vertex_buffer_offset;
    uint num_set_fragment_buffer_offset;
    uint num_set_compute_buffer_offset;
}

struct FrameStatsMetal
{
    FrameStatsMetalIdpool idpool;
    FrameStatsMetalPipeline pipeline;
    FrameStatsMetalBindings bindings;
    FrameStatsMetalUniforms uniforms;
}

struct FrameStatsWgpuUniforms
{
    uint num_set_bindgroup;
    uint size_write_buffer;
}

struct FrameStatsWgpuBindings
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

struct FrameStatsWgpu
{
    FrameStatsWgpuUniforms uniforms;
    FrameStatsWgpuBindings bindings;
}

struct FrameStats
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
    FrameStatsGl gl;
    FrameStatsD3d11 d3d11;
    FrameStatsMetal metal;
    FrameStatsWgpu wgpu;
}

distinct LogItem = int;
module sokol::sg::log_item;
const LogItem OK = 0;
const LogItem MALLOC_FAILED = 1;
const LogItem GL_TEXTURE_FORMAT_NOT_SUPPORTED = 2;
const LogItem GL_3D_TEXTURES_NOT_SUPPORTED = 3;
const LogItem GL_ARRAY_TEXTURES_NOT_SUPPORTED = 4;
const LogItem GL_STORAGEBUFFER_GLSL_BINDING_OUT_OF_RANGE = 5;
const LogItem GL_SHADER_COMPILATION_FAILED = 6;
const LogItem GL_SHADER_LINKING_FAILED = 7;
const LogItem GL_VERTEX_ATTRIBUTE_NOT_FOUND_IN_SHADER = 8;
const LogItem GL_UNIFORMBLOCK_NAME_NOT_FOUND_IN_SHADER = 9;
const LogItem GL_IMAGE_SAMPLER_NAME_NOT_FOUND_IN_SHADER = 10;
const LogItem GL_FRAMEBUFFER_STATUS_UNDEFINED = 11;
const LogItem GL_FRAMEBUFFER_STATUS_INCOMPLETE_ATTACHMENT = 12;
const LogItem GL_FRAMEBUFFER_STATUS_INCOMPLETE_MISSING_ATTACHMENT = 13;
const LogItem GL_FRAMEBUFFER_STATUS_UNSUPPORTED = 14;
const LogItem GL_FRAMEBUFFER_STATUS_INCOMPLETE_MULTISAMPLE = 15;
const LogItem GL_FRAMEBUFFER_STATUS_UNKNOWN = 16;
const LogItem D3D11_CREATE_BUFFER_FAILED = 17;
const LogItem D3D11_CREATE_BUFFER_SRV_FAILED = 18;
const LogItem D3D11_CREATE_BUFFER_UAV_FAILED = 19;
const LogItem D3D11_CREATE_DEPTH_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 20;
const LogItem D3D11_CREATE_DEPTH_TEXTURE_FAILED = 21;
const LogItem D3D11_CREATE_2D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 22;
const LogItem D3D11_CREATE_2D_TEXTURE_FAILED = 23;
const LogItem D3D11_CREATE_2D_SRV_FAILED = 24;
const LogItem D3D11_CREATE_3D_TEXTURE_UNSUPPORTED_PIXEL_FORMAT = 25;
const LogItem D3D11_CREATE_3D_TEXTURE_FAILED = 26;
const LogItem D3D11_CREATE_3D_SRV_FAILED = 27;
const LogItem D3D11_CREATE_MSAA_TEXTURE_FAILED = 28;
const LogItem D3D11_CREATE_SAMPLER_STATE_FAILED = 29;
const LogItem D3D11_UNIFORMBLOCK_HLSL_REGISTER_B_OUT_OF_RANGE = 30;
const LogItem D3D11_STORAGEBUFFER_HLSL_REGISTER_T_OUT_OF_RANGE = 31;
const LogItem D3D11_STORAGEBUFFER_HLSL_REGISTER_U_OUT_OF_RANGE = 32;
const LogItem D3D11_IMAGE_HLSL_REGISTER_T_OUT_OF_RANGE = 33;
const LogItem D3D11_SAMPLER_HLSL_REGISTER_S_OUT_OF_RANGE = 34;
const LogItem D3D11_LOAD_D3DCOMPILER_47_DLL_FAILED = 35;
const LogItem D3D11_SHADER_COMPILATION_FAILED = 36;
const LogItem D3D11_SHADER_COMPILATION_OUTPUT = 37;
const LogItem D3D11_CREATE_CONSTANT_BUFFER_FAILED = 38;
const LogItem D3D11_CREATE_INPUT_LAYOUT_FAILED = 39;
const LogItem D3D11_CREATE_RASTERIZER_STATE_FAILED = 40;
const LogItem D3D11_CREATE_DEPTH_STENCIL_STATE_FAILED = 41;
const LogItem D3D11_CREATE_BLEND_STATE_FAILED = 42;
const LogItem D3D11_CREATE_RTV_FAILED = 43;
const LogItem D3D11_CREATE_DSV_FAILED = 44;
const LogItem D3D11_MAP_FOR_UPDATE_BUFFER_FAILED = 45;
const LogItem D3D11_MAP_FOR_APPEND_BUFFER_FAILED = 46;
const LogItem D3D11_MAP_FOR_UPDATE_IMAGE_FAILED = 47;
const LogItem METAL_CREATE_BUFFER_FAILED = 48;
const LogItem METAL_TEXTURE_FORMAT_NOT_SUPPORTED = 49;
const LogItem METAL_CREATE_TEXTURE_FAILED = 50;
const LogItem METAL_CREATE_SAMPLER_FAILED = 51;
const LogItem METAL_SHADER_COMPILATION_FAILED = 52;
const LogItem METAL_SHADER_CREATION_FAILED = 53;
const LogItem METAL_SHADER_COMPILATION_OUTPUT = 54;
const LogItem METAL_SHADER_ENTRY_NOT_FOUND = 55;
const LogItem METAL_UNIFORMBLOCK_MSL_BUFFER_SLOT_OUT_OF_RANGE = 56;
const LogItem METAL_STORAGEBUFFER_MSL_BUFFER_SLOT_OUT_OF_RANGE = 57;
const LogItem METAL_IMAGE_MSL_TEXTURE_SLOT_OUT_OF_RANGE = 58;
const LogItem METAL_SAMPLER_MSL_SAMPLER_SLOT_OUT_OF_RANGE = 59;
const LogItem METAL_CREATE_CPS_FAILED = 60;
const LogItem METAL_CREATE_CPS_OUTPUT = 61;
const LogItem METAL_CREATE_RPS_FAILED = 62;
const LogItem METAL_CREATE_RPS_OUTPUT = 63;
const LogItem METAL_CREATE_DSS_FAILED = 64;
const LogItem WGPU_BINDGROUPS_POOL_EXHAUSTED = 65;
const LogItem WGPU_BINDGROUPSCACHE_SIZE_GREATER_ONE = 66;
const LogItem WGPU_BINDGROUPSCACHE_SIZE_POW2 = 67;
const LogItem WGPU_CREATEBINDGROUP_FAILED = 68;
const LogItem WGPU_CREATE_BUFFER_FAILED = 69;
const LogItem WGPU_CREATE_TEXTURE_FAILED = 70;
const LogItem WGPU_CREATE_TEXTURE_VIEW_FAILED = 71;
const LogItem WGPU_CREATE_SAMPLER_FAILED = 72;
const LogItem WGPU_CREATE_SHADER_MODULE_FAILED = 73;
const LogItem WGPU_SHADER_CREATE_BINDGROUP_LAYOUT_FAILED = 74;
const LogItem WGPU_UNIFORMBLOCK_WGSL_GROUP0_BINDING_OUT_OF_RANGE = 75;
const LogItem WGPU_STORAGEBUFFER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 76;
const LogItem WGPU_IMAGE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 77;
const LogItem WGPU_SAMPLER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 78;
const LogItem WGPU_CREATE_PIPELINE_LAYOUT_FAILED = 79;
const LogItem WGPU_CREATE_RENDER_PIPELINE_FAILED = 80;
const LogItem WGPU_CREATE_COMPUTE_PIPELINE_FAILED = 81;
const LogItem WGPU_ATTACHMENTS_CREATE_TEXTURE_VIEW_FAILED = 82;
const LogItem IDENTICAL_COMMIT_LISTENER = 83;
const LogItem COMMIT_LISTENER_ARRAY_FULL = 84;
const LogItem TRACE_HOOKS_NOT_ENABLED = 85;
const LogItem DEALLOC_BUFFER_INVALID_STATE = 86;
const LogItem DEALLOC_IMAGE_INVALID_STATE = 87;
const LogItem DEALLOC_SAMPLER_INVALID_STATE = 88;
const LogItem DEALLOC_SHADER_INVALID_STATE = 89;
const LogItem DEALLOC_PIPELINE_INVALID_STATE = 90;
const LogItem DEALLOC_ATTACHMENTS_INVALID_STATE = 91;
const LogItem INIT_BUFFER_INVALID_STATE = 92;
const LogItem INIT_IMAGE_INVALID_STATE = 93;
const LogItem INIT_SAMPLER_INVALID_STATE = 94;
const LogItem INIT_SHADER_INVALID_STATE = 95;
const LogItem INIT_PIPELINE_INVALID_STATE = 96;
const LogItem INIT_ATTACHMENTS_INVALID_STATE = 97;
const LogItem UNINIT_BUFFER_INVALID_STATE = 98;
const LogItem UNINIT_IMAGE_INVALID_STATE = 99;
const LogItem UNINIT_SAMPLER_INVALID_STATE = 100;
const LogItem UNINIT_SHADER_INVALID_STATE = 101;
const LogItem UNINIT_PIPELINE_INVALID_STATE = 102;
const LogItem UNINIT_ATTACHMENTS_INVALID_STATE = 103;
const LogItem FAIL_BUFFER_INVALID_STATE = 104;
const LogItem FAIL_IMAGE_INVALID_STATE = 105;
const LogItem FAIL_SAMPLER_INVALID_STATE = 106;
const LogItem FAIL_SHADER_INVALID_STATE = 107;
const LogItem FAIL_PIPELINE_INVALID_STATE = 108;
const LogItem FAIL_ATTACHMENTS_INVALID_STATE = 109;
const LogItem BUFFER_POOL_EXHAUSTED = 110;
const LogItem IMAGE_POOL_EXHAUSTED = 111;
const LogItem SAMPLER_POOL_EXHAUSTED = 112;
const LogItem SHADER_POOL_EXHAUSTED = 113;
const LogItem PIPELINE_POOL_EXHAUSTED = 114;
const LogItem PASS_POOL_EXHAUSTED = 115;
const LogItem BEGINPASS_ATTACHMENT_INVALID = 116;
const LogItem APPLY_BINDINGS_STORAGE_BUFFER_TRACKER_EXHAUSTED = 117;
const LogItem DRAW_WITHOUT_BINDINGS = 118;
const LogItem VALIDATE_BUFFERDESC_CANARY = 119;
const LogItem VALIDATE_BUFFERDESC_EXPECT_NONZERO_SIZE = 120;
const LogItem VALIDATE_BUFFERDESC_EXPECT_MATCHING_DATA_SIZE = 121;
const LogItem VALIDATE_BUFFERDESC_EXPECT_ZERO_DATA_SIZE = 122;
const LogItem VALIDATE_BUFFERDESC_EXPECT_NO_DATA = 123;
const LogItem VALIDATE_BUFFERDESC_STORAGEBUFFER_SUPPORTED = 124;
const LogItem VALIDATE_BUFFERDESC_STORAGEBUFFER_SIZE_MULTIPLE_4 = 125;
const LogItem VALIDATE_IMAGEDATA_NODATA = 126;
const LogItem VALIDATE_IMAGEDATA_DATA_SIZE = 127;
const LogItem VALIDATE_IMAGEDESC_CANARY = 128;
const LogItem VALIDATE_IMAGEDESC_WIDTH = 129;
const LogItem VALIDATE_IMAGEDESC_HEIGHT = 130;
const LogItem VALIDATE_IMAGEDESC_RT_PIXELFORMAT = 131;
const LogItem VALIDATE_IMAGEDESC_NONRT_PIXELFORMAT = 132;
const LogItem VALIDATE_IMAGEDESC_MSAA_BUT_NO_RT = 133;
const LogItem VALIDATE_IMAGEDESC_NO_MSAA_RT_SUPPORT = 134;
const LogItem VALIDATE_IMAGEDESC_MSAA_NUM_MIPMAPS = 135;
const LogItem VALIDATE_IMAGEDESC_MSAA_3D_IMAGE = 136;
const LogItem VALIDATE_IMAGEDESC_MSAA_CUBE_IMAGE = 137;
const LogItem VALIDATE_IMAGEDESC_DEPTH_3D_IMAGE = 138;
const LogItem VALIDATE_IMAGEDESC_RT_IMMUTABLE = 139;
const LogItem VALIDATE_IMAGEDESC_RT_NO_DATA = 140;
const LogItem VALIDATE_IMAGEDESC_INJECTED_NO_DATA = 141;
const LogItem VALIDATE_IMAGEDESC_DYNAMIC_NO_DATA = 142;
const LogItem VALIDATE_IMAGEDESC_COMPRESSED_IMMUTABLE = 143;
const LogItem VALIDATE_SAMPLERDESC_CANARY = 144;
const LogItem VALIDATE_SAMPLERDESC_ANISTROPIC_REQUIRES_LINEAR_FILTERING = 145;
const LogItem VALIDATE_SHADERDESC_CANARY = 146;
const LogItem VALIDATE_SHADERDESC_VERTEX_SOURCE = 147;
const LogItem VALIDATE_SHADERDESC_FRAGMENT_SOURCE = 148;
const LogItem VALIDATE_SHADERDESC_COMPUTE_SOURCE = 149;
const LogItem VALIDATE_SHADERDESC_VERTEX_SOURCE_OR_BYTECODE = 150;
const LogItem VALIDATE_SHADERDESC_FRAGMENT_SOURCE_OR_BYTECODE = 151;
const LogItem VALIDATE_SHADERDESC_COMPUTE_SOURCE_OR_BYTECODE = 152;
const LogItem VALIDATE_SHADERDESC_INVALID_SHADER_COMBO = 153;
const LogItem VALIDATE_SHADERDESC_NO_BYTECODE_SIZE = 154;
const LogItem VALIDATE_SHADERDESC_METAL_THREADS_PER_THREADGROUP = 155;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_CONT_MEMBERS = 156;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_IS_ZERO = 157;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_METAL_BUFFER_SLOT_OUT_OF_RANGE = 158;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_METAL_BUFFER_SLOT_COLLISION = 159;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_HLSL_REGISTER_B_OUT_OF_RANGE = 160;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_HLSL_REGISTER_B_COLLISION = 161;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_WGSL_GROUP0_BINDING_OUT_OF_RANGE = 162;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_WGSL_GROUP0_BINDING_COLLISION = 163;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_NO_MEMBERS = 164;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_UNIFORM_GLSL_NAME = 165;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_SIZE_MISMATCH = 166;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_ARRAY_COUNT = 167;
const LogItem VALIDATE_SHADERDESC_UNIFORMBLOCK_STD140_ARRAY_TYPE = 168;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_METAL_BUFFER_SLOT_OUT_OF_RANGE = 169;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_METAL_BUFFER_SLOT_COLLISION = 170;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_HLSL_REGISTER_T_OUT_OF_RANGE = 171;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_HLSL_REGISTER_T_COLLISION = 172;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_HLSL_REGISTER_U_OUT_OF_RANGE = 173;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_HLSL_REGISTER_U_COLLISION = 174;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_GLSL_BINDING_OUT_OF_RANGE = 175;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_GLSL_BINDING_COLLISION = 176;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 177;
const LogItem VALIDATE_SHADERDESC_STORAGEBUFFER_WGSL_GROUP1_BINDING_COLLISION = 178;
const LogItem VALIDATE_SHADERDESC_IMAGE_METAL_TEXTURE_SLOT_OUT_OF_RANGE = 179;
const LogItem VALIDATE_SHADERDESC_IMAGE_METAL_TEXTURE_SLOT_COLLISION = 180;
const LogItem VALIDATE_SHADERDESC_IMAGE_HLSL_REGISTER_T_OUT_OF_RANGE = 181;
const LogItem VALIDATE_SHADERDESC_IMAGE_HLSL_REGISTER_T_COLLISION = 182;
const LogItem VALIDATE_SHADERDESC_IMAGE_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 183;
const LogItem VALIDATE_SHADERDESC_IMAGE_WGSL_GROUP1_BINDING_COLLISION = 184;
const LogItem VALIDATE_SHADERDESC_SAMPLER_METAL_SAMPLER_SLOT_OUT_OF_RANGE = 185;
const LogItem VALIDATE_SHADERDESC_SAMPLER_METAL_SAMPLER_SLOT_COLLISION = 186;
const LogItem VALIDATE_SHADERDESC_SAMPLER_HLSL_REGISTER_S_OUT_OF_RANGE = 187;
const LogItem VALIDATE_SHADERDESC_SAMPLER_HLSL_REGISTER_S_COLLISION = 188;
const LogItem VALIDATE_SHADERDESC_SAMPLER_WGSL_GROUP1_BINDING_OUT_OF_RANGE = 189;
const LogItem VALIDATE_SHADERDESC_SAMPLER_WGSL_GROUP1_BINDING_COLLISION = 190;
const LogItem VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_IMAGE_SLOT_OUT_OF_RANGE = 191;
const LogItem VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_SAMPLER_SLOT_OUT_OF_RANGE = 192;
const LogItem VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_IMAGE_STAGE_MISMATCH = 193;
const LogItem VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_SAMPLER_STAGE_MISMATCH = 194;
const LogItem VALIDATE_SHADERDESC_IMAGE_SAMPLER_PAIR_GLSL_NAME = 195;
const LogItem VALIDATE_SHADERDESC_NONFILTERING_SAMPLER_REQUIRED = 196;
const LogItem VALIDATE_SHADERDESC_COMPARISON_SAMPLER_REQUIRED = 197;
const LogItem VALIDATE_SHADERDESC_IMAGE_NOT_REFERENCED_BY_IMAGE_SAMPLER_PAIRS = 198;
const LogItem VALIDATE_SHADERDESC_SAMPLER_NOT_REFERENCED_BY_IMAGE_SAMPLER_PAIRS = 199;
const LogItem VALIDATE_SHADERDESC_ATTR_STRING_TOO_LONG = 200;
const LogItem VALIDATE_PIPELINEDESC_CANARY = 201;
const LogItem VALIDATE_PIPELINEDESC_SHADER = 202;
const LogItem VALIDATE_PIPELINEDESC_COMPUTE_SHADER_EXPECTED = 203;
const LogItem VALIDATE_PIPELINEDESC_NO_COMPUTE_SHADER_EXPECTED = 204;
const LogItem VALIDATE_PIPELINEDESC_NO_CONT_ATTRS = 205;
const LogItem VALIDATE_PIPELINEDESC_ATTR_BASETYPE_MISMATCH = 206;
const LogItem VALIDATE_PIPELINEDESC_LAYOUT_STRIDE4 = 207;
const LogItem VALIDATE_PIPELINEDESC_ATTR_SEMANTICS = 208;
const LogItem VALIDATE_PIPELINEDESC_SHADER_READONLY_STORAGEBUFFERS = 209;
const LogItem VALIDATE_PIPELINEDESC_BLENDOP_MINMAX_REQUIRES_BLENDFACTOR_ONE = 210;
const LogItem VALIDATE_ATTACHMENTSDESC_CANARY = 211;
const LogItem VALIDATE_ATTACHMENTSDESC_NO_ATTACHMENTS = 212;
const LogItem VALIDATE_ATTACHMENTSDESC_NO_CONT_COLOR_ATTS = 213;
const LogItem VALIDATE_ATTACHMENTSDESC_IMAGE = 214;
const LogItem VALIDATE_ATTACHMENTSDESC_MIPLEVEL = 215;
const LogItem VALIDATE_ATTACHMENTSDESC_FACE = 216;
const LogItem VALIDATE_ATTACHMENTSDESC_LAYER = 217;
const LogItem VALIDATE_ATTACHMENTSDESC_SLICE = 218;
const LogItem VALIDATE_ATTACHMENTSDESC_IMAGE_NO_RT = 219;
const LogItem VALIDATE_ATTACHMENTSDESC_COLOR_INV_PIXELFORMAT = 220;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_INV_PIXELFORMAT = 221;
const LogItem VALIDATE_ATTACHMENTSDESC_IMAGE_SIZES = 222;
const LogItem VALIDATE_ATTACHMENTSDESC_IMAGE_SAMPLE_COUNTS = 223;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_COLOR_IMAGE_MSAA = 224;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_IMAGE = 225;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_SAMPLE_COUNT = 226;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_MIPLEVEL = 227;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_FACE = 228;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_LAYER = 229;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_SLICE = 230;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_IMAGE_NO_RT = 231;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_IMAGE_SIZES = 232;
const LogItem VALIDATE_ATTACHMENTSDESC_RESOLVE_IMAGE_FORMAT = 233;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_IMAGE = 234;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_MIPLEVEL = 235;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_FACE = 236;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_LAYER = 237;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_SLICE = 238;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_IMAGE_NO_RT = 239;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_IMAGE_SIZES = 240;
const LogItem VALIDATE_ATTACHMENTSDESC_DEPTH_IMAGE_SAMPLE_COUNT = 241;
const LogItem VALIDATE_BEGINPASS_CANARY = 242;
const LogItem VALIDATE_BEGINPASS_EXPECT_NO_ATTACHMENTS = 243;
const LogItem VALIDATE_BEGINPASS_ATTACHMENTS_EXISTS = 244;
const LogItem VALIDATE_BEGINPASS_ATTACHMENTS_VALID = 245;
const LogItem VALIDATE_BEGINPASS_COLOR_ATTACHMENT_IMAGE = 246;
const LogItem VALIDATE_BEGINPASS_RESOLVE_ATTACHMENT_IMAGE = 247;
const LogItem VALIDATE_BEGINPASS_DEPTHSTENCIL_ATTACHMENT_IMAGE = 248;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH = 249;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_WIDTH_NOTSET = 250;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT = 251;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_HEIGHT_NOTSET = 252;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT = 253;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_SAMPLECOUNT_NOTSET = 254;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT = 255;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_COLORFORMAT_NOTSET = 256;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_EXPECT_DEPTHFORMAT_NOTSET = 257;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE = 258;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_CURRENTDRAWABLE_NOTSET = 259;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE = 260;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_DEPTHSTENCILTEXTURE_NOTSET = 261;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE = 262;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_METAL_EXPECT_MSAACOLORTEXTURE_NOTSET = 263;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW = 264;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RENDERVIEW_NOTSET = 265;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW = 266;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_RESOLVEVIEW_NOTSET = 267;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW = 268;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_D3D11_EXPECT_DEPTHSTENCILVIEW_NOTSET = 269;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW = 270;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RENDERVIEW_NOTSET = 271;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW = 272;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_RESOLVEVIEW_NOTSET = 273;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW = 274;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_WGPU_EXPECT_DEPTHSTENCILVIEW_NOTSET = 275;
const LogItem VALIDATE_BEGINPASS_SWAPCHAIN_GL_EXPECT_FRAMEBUFFER_NOTSET = 276;
const LogItem VALIDATE_AVP_RENDERPASS_EXPECTED = 277;
const LogItem VALIDATE_ASR_RENDERPASS_EXPECTED = 278;
const LogItem VALIDATE_APIP_PIPELINE_VALID_ID = 279;
const LogItem VALIDATE_APIP_PIPELINE_EXISTS = 280;
const LogItem VALIDATE_APIP_PIPELINE_VALID = 281;
const LogItem VALIDATE_APIP_PASS_EXPECTED = 282;
const LogItem VALIDATE_APIP_SHADER_EXISTS = 283;
const LogItem VALIDATE_APIP_SHADER_VALID = 284;
const LogItem VALIDATE_APIP_COMPUTEPASS_EXPECTED = 285;
const LogItem VALIDATE_APIP_RENDERPASS_EXPECTED = 286;
const LogItem VALIDATE_APIP_CURPASS_ATTACHMENTS_EXISTS = 287;
const LogItem VALIDATE_APIP_CURPASS_ATTACHMENTS_VALID = 288;
const LogItem VALIDATE_APIP_ATT_COUNT = 289;
const LogItem VALIDATE_APIP_COLOR_FORMAT = 290;
const LogItem VALIDATE_APIP_DEPTH_FORMAT = 291;
const LogItem VALIDATE_APIP_SAMPLE_COUNT = 292;
const LogItem VALIDATE_ABND_PASS_EXPECTED = 293;
const LogItem VALIDATE_ABND_PIPELINE = 294;
const LogItem VALIDATE_ABND_PIPELINE_EXISTS = 295;
const LogItem VALIDATE_ABND_PIPELINE_VALID = 296;
const LogItem VALIDATE_ABND_COMPUTE_EXPECTED_NO_VBS = 297;
const LogItem VALIDATE_ABND_COMPUTE_EXPECTED_NO_IB = 298;
const LogItem VALIDATE_ABND_EXPECTED_VB = 299;
const LogItem VALIDATE_ABND_VB_EXISTS = 300;
const LogItem VALIDATE_ABND_VB_TYPE = 301;
const LogItem VALIDATE_ABND_VB_OVERFLOW = 302;
const LogItem VALIDATE_ABND_NO_IB = 303;
const LogItem VALIDATE_ABND_IB = 304;
const LogItem VALIDATE_ABND_IB_EXISTS = 305;
const LogItem VALIDATE_ABND_IB_TYPE = 306;
const LogItem VALIDATE_ABND_IB_OVERFLOW = 307;
const LogItem VALIDATE_ABND_EXPECTED_IMAGE_BINDING = 308;
const LogItem VALIDATE_ABND_IMG_EXISTS = 309;
const LogItem VALIDATE_ABND_IMAGE_TYPE_MISMATCH = 310;
const LogItem VALIDATE_ABND_EXPECTED_MULTISAMPLED_IMAGE = 311;
const LogItem VALIDATE_ABND_IMAGE_MSAA = 312;
const LogItem VALIDATE_ABND_EXPECTED_FILTERABLE_IMAGE = 313;
const LogItem VALIDATE_ABND_EXPECTED_DEPTH_IMAGE = 314;
const LogItem VALIDATE_ABND_EXPECTED_SAMPLER_BINDING = 315;
const LogItem VALIDATE_ABND_UNEXPECTED_SAMPLER_COMPARE_NEVER = 316;
const LogItem VALIDATE_ABND_EXPECTED_SAMPLER_COMPARE_NEVER = 317;
const LogItem VALIDATE_ABND_EXPECTED_NONFILTERING_SAMPLER = 318;
const LogItem VALIDATE_ABND_SMP_EXISTS = 319;
const LogItem VALIDATE_ABND_EXPECTED_STORAGEBUFFER_BINDING = 320;
const LogItem VALIDATE_ABND_STORAGEBUFFER_EXISTS = 321;
const LogItem VALIDATE_ABND_STORAGEBUFFER_BINDING_BUFFERTYPE = 322;
const LogItem VALIDATE_ABND_STORAGEBUFFER_READWRITE_IMMUTABLE = 323;
const LogItem VALIDATE_AU_PASS_EXPECTED = 324;
const LogItem VALIDATE_AU_NO_PIPELINE = 325;
const LogItem VALIDATE_AU_NO_UNIFORMBLOCK_AT_SLOT = 326;
const LogItem VALIDATE_AU_SIZE = 327;
const LogItem VALIDATE_DRAW_RENDERPASS_EXPECTED = 328;
const LogItem VALIDATE_DRAW_BASEELEMENT = 329;
const LogItem VALIDATE_DRAW_NUMELEMENTS = 330;
const LogItem VALIDATE_DRAW_NUMINSTANCES = 331;
const LogItem VALIDATE_DRAW_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING = 332;
const LogItem VALIDATE_DISPATCH_COMPUTEPASS_EXPECTED = 333;
const LogItem VALIDATE_DISPATCH_NUMGROUPSX = 334;
const LogItem VALIDATE_DISPATCH_NUMGROUPSY = 335;
const LogItem VALIDATE_DISPATCH_NUMGROUPSZ = 336;
const LogItem VALIDATE_DISPATCH_REQUIRED_BINDINGS_OR_UNIFORMS_MISSING = 337;
const LogItem VALIDATE_UPDATEBUF_USAGE = 338;
const LogItem VALIDATE_UPDATEBUF_SIZE = 339;
const LogItem VALIDATE_UPDATEBUF_ONCE = 340;
const LogItem VALIDATE_UPDATEBUF_APPEND = 341;
const LogItem VALIDATE_APPENDBUF_USAGE = 342;
const LogItem VALIDATE_APPENDBUF_SIZE = 343;
const LogItem VALIDATE_APPENDBUF_UPDATE = 344;
const LogItem VALIDATE_UPDIMG_USAGE = 345;
const LogItem VALIDATE_UPDIMG_ONCE = 346;
const LogItem VALIDATION_FAILED = 347;
module sokol::sg;
import sokol;

struct EnvironmentDefaults
{
    PixelFormat color_format;
    PixelFormat depth_format;
    CInt sample_count;
}

struct MetalEnvironment
{
    void* device;
}

struct D3d11Environment
{
    void* device;
    void* device_context;
}

struct WgpuEnvironment
{
    void* device;
}

struct Environment
{
    EnvironmentDefaults defaults;
    MetalEnvironment metal;
    D3d11Environment d3d11;
    WgpuEnvironment wgpu;
}

struct CommitListener
{
    DataCb func;
    void* user_data;
}

struct Allocator
{
    AllocCb alloc_fn;
    FreeCb free_fn;
    void* user_data;
}

struct Logger
{
    LogCb func;
    void* user_data;
}

struct Desc
{
    uint _start_canary;
    CInt buffer_pool_size;
    CInt image_pool_size;
    CInt sampler_pool_size;
    CInt shader_pool_size;
    CInt pipeline_pool_size;
    CInt attachments_pool_size;
    CInt uniform_buffer_size;
    CInt max_dispatch_calls_per_pass;
    CInt max_commit_listeners;
    bool disable_validation;
    bool d3d11_shader_debugging;
    bool mtl_force_managed_storage_mode;
    bool mtl_use_command_buffer_with_retained_references;
    bool wgpu_disable_bindgroups_cache;
    CInt wgpu_bindgroups_cache_size;
    Allocator allocator;
    Logger logger;
    Environment environment;
    uint _end_canary;
}

struct D3d11BufferInfo
{
    void* buf;
}

struct D3d11ImageInfo
{
    void* tex2d;
    void* tex3d;
    void* res;
    void* srv;
}

struct D3d11SamplerInfo
{
    void* smp;
}

struct D3d11ShaderInfo
{
    void*[8] cbufs;
    void* vs;
    void* fs;
}

struct D3d11PipelineInfo
{
    void* il;
    void* rs;
    void* dss;
    void* bs;
}

struct D3d11AttachmentsInfo
{
    void*[4] color_rtv;
    void*[4] resolve_rtv;
    void* dsv;
}

struct MtlBufferInfo
{
    void*[2] buf;
    CInt active_slot;
}

struct MtlImageInfo
{
    void*[2] tex;
    CInt active_slot;
}

struct MtlSamplerInfo
{
    void* smp;
}

struct MtlShaderInfo
{
    void* vertex_lib;
    void* fragment_lib;
    void* vertex_func;
    void* fragment_func;
}

struct MtlPipelineInfo
{
    void* rps;
    void* dss;
}

struct WgpuBufferInfo
{
    void* buf;
}

struct WgpuImageInfo
{
    void* tex;
    void* view;
}

struct WgpuSamplerInfo
{
    void* smp;
}

struct WgpuShaderInfo
{
    void* vs_mod;
    void* fs_mod;
    void* bgl;
}

struct WgpuPipelineInfo
{
    void* render_pipeline;
    void* compute_pipeline;
}

struct WgpuAttachmentsInfo
{
    void*[4] color_view;
    void*[4] resolve_view;
    void* ds_view;
}

struct GlBufferInfo
{
    uint[2] buf;
    CInt active_slot;
}

struct GlImageInfo
{
    uint[2] tex;
    uint tex_target;
    uint msaa_render_buffer;
    CInt active_slot;
}

struct GlSamplerInfo
{
    uint smp;
}

struct GlShaderInfo
{
    uint prog;
}

struct GlAttachmentsInfo
{
    uint framebuffer;
    uint[4] msaa_resolve_framebuffer;
}

def DataCb = fn void(void*);
def AllocCb = fn void*(usz, void*);
def FreeCb = fn void*(usz, void*);
def LogCb = fn void(ZString, uint, uint, ZString, uint, ZString, void*);

