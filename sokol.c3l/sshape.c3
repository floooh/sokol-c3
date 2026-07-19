// machine generated, do not edit

module sokol::sshape;
import sokol;

extern fn void build_plane(SshapeState* state, SshapePlane* params) @cname("sshape_build_plane");
extern fn void build_box(SshapeState* state, SshapeBox* params) @cname("sshape_build_box");
extern fn void build_sphere(SshapeState* state, SshapeSphere* params) @cname("sshape_build_sphere");
extern fn void build_cylinder(SshapeState* state, SshapeCylinder* params) @cname("sshape_build_cylinder");
extern fn void build_torus(SshapeState* state, SshapeTorus* params) @cname("sshape_build_torus");
extern fn usz vertex_size(SshapeOptionalComponents* components) @cname("sshape_vertex_size");
extern fn SshapeSizes plane_sizes(uint tiles, usz vertex_size) @cname("sshape_plane_sizes");
extern fn SshapeSizes box_sizes(uint tiles, usz vertex_size) @cname("sshape_box_sizes");
extern fn SshapeSizes sphere_sizes(uint slices, uint stacks, usz vertex_size) @cname("sshape_sphere_sizes");
extern fn SshapeSizes cylinder_sizes(uint slices, uint stacks, usz vertex_size) @cname("sshape_cylinder_sizes");
extern fn SshapeSizes torus_sizes(uint sides, uint rings, usz vertex_size) @cname("sshape_torus_sizes");
extern fn SshapeElementRange element_range(SshapeState* state) @cname("sshape_element_range");
extern fn SgBufferDesc vertex_buffer_desc(SshapeState* state) @cname("sshape_vertex_buffer_desc");
extern fn SgBufferDesc index_buffer_desc(SshapeState* state) @cname("sshape_index_buffer_desc");
extern fn SgVertexBufferLayoutState vertex_buffer_layout_state(SshapeState* state) @cname("sshape_vertex_buffer_layout_state");
extern fn SgVertexAttrState position_vertex_attr_state(SshapeState* state) @cname("sshape_position_vertex_attr_state");
extern fn SgVertexAttrState normal_vertex_attr_state(SshapeState* state) @cname("sshape_normal_vertex_attr_state");
extern fn SgVertexAttrState texcoord_vertex_attr_state(SshapeState* state) @cname("sshape_texcoord_vertex_attr_state");
extern fn SgVertexAttrState color_vertex_attr_state(SshapeState* state) @cname("sshape_color_vertex_attr_state");
extern fn uint color_4f(float r, float g, float b, float a) @cname("sshape_color_4f");
extern fn uint color_3f(float r, float g, float b) @cname("sshape_color_3f");
extern fn uint color_4b(char r, char g, char b, char a) @cname("sshape_color_4b");
extern fn uint color_3b(char r, char g, char b) @cname("sshape_color_3b");
extern fn SshapeMat4 mat4(float* m) @cname("sshape_mat4");
extern fn SshapeMat4 mat4_transpose(float* m) @cname("sshape_mat4_transpose");

struct SshapeRange
{
    void* ptr;
    usz size;
}

const usz MIN_VERTEX_SIZE = 12;
const usz MAX_VERTEX_SIZE = 24;

struct SshapeMat4
{
    float[4][4] m;
}

struct SshapeOptionalComponents
{
    bool normals;
    bool texcoords;
    bool colors;
}

struct SshapeElementRange
{
    CInt base_element;
    CInt num_elements;
}

struct SshapeSizesItem
{
    uint num;
    uint size;
}

struct SshapeSizes
{
    SshapeSizesItem vertices;
    SshapeSizesItem indices;
}

struct SshapeBufferState
{
    SshapeRange buffer;
    usz data_size;
    usz shape_offset;
}

struct SshapeState
{
    bool valid;
    SshapeOptionalComponents disable;
    SshapeBufferState vertices;
    SshapeBufferState indices;
}

struct SshapePlane
{
    float width;
    float depth;
    ushort tiles;
    uint color;
    bool random_colors;
    bool merge;
    SshapeMat4 transform;
}

struct SshapeBox
{
    float width;
    float height;
    float depth;
    ushort tiles;
    uint color;
    bool random_colors;
    bool merge;
    SshapeMat4 transform;
}

struct SshapeSphere
{
    float radius;
    ushort slices;
    ushort stacks;
    uint color;
    bool random_colors;
    bool merge;
    SshapeMat4 transform;
}

struct SshapeCylinder
{
    float radius;
    float height;
    ushort slices;
    ushort stacks;
    uint color;
    bool random_colors;
    bool merge;
    SshapeMat4 transform;
}

struct SshapeTorus
{
    float radius;
    float ring_radius;
    ushort sides;
    ushort rings;
    uint color;
    bool random_colors;
    bool merge;
    SshapeMat4 transform;
}


