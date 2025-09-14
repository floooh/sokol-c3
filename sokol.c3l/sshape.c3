// machine generated, do not edit

module sokol::sshape;
import sokol;

extern fn SshapeBuffer build_plane(SshapeBuffer* buf, SshapePlane* params) @extern("sshape_build_plane");
extern fn SshapeBuffer build_box(SshapeBuffer* buf, SshapeBox* params) @extern("sshape_build_box");
extern fn SshapeBuffer build_sphere(SshapeBuffer* buf, SshapeSphere* params) @extern("sshape_build_sphere");
extern fn SshapeBuffer build_cylinder(SshapeBuffer* buf, SshapeCylinder* params) @extern("sshape_build_cylinder");
extern fn SshapeBuffer build_torus(SshapeBuffer* buf, SshapeTorus* params) @extern("sshape_build_torus");
extern fn SshapeSizes plane_sizes(uint tiles) @extern("sshape_plane_sizes");
extern fn SshapeSizes box_sizes(uint tiles) @extern("sshape_box_sizes");
extern fn SshapeSizes sphere_sizes(uint slices, uint stacks) @extern("sshape_sphere_sizes");
extern fn SshapeSizes cylinder_sizes(uint slices, uint stacks) @extern("sshape_cylinder_sizes");
extern fn SshapeSizes torus_sizes(uint sides, uint rings) @extern("sshape_torus_sizes");
extern fn SshapeElementRange element_range(SshapeBuffer* buf) @extern("sshape_element_range");
extern fn SgBufferDesc vertex_buffer_desc(SshapeBuffer* buf) @extern("sshape_vertex_buffer_desc");
extern fn SgBufferDesc index_buffer_desc(SshapeBuffer* buf) @extern("sshape_index_buffer_desc");
extern fn SgVertexBufferLayoutState vertex_buffer_layout_state() @extern("sshape_vertex_buffer_layout_state");
extern fn SgVertexAttrState position_vertex_attr_state() @extern("sshape_position_vertex_attr_state");
extern fn SgVertexAttrState normal_vertex_attr_state() @extern("sshape_normal_vertex_attr_state");
extern fn SgVertexAttrState texcoord_vertex_attr_state() @extern("sshape_texcoord_vertex_attr_state");
extern fn SgVertexAttrState color_vertex_attr_state() @extern("sshape_color_vertex_attr_state");
extern fn uint color_4f(float r, float g, float b, float a) @extern("sshape_color_4f");
extern fn uint color_3f(float r, float g, float b) @extern("sshape_color_3f");
extern fn uint color_4b(char r, char g, char b, char a) @extern("sshape_color_4b");
extern fn uint color_3b(char r, char g, char b) @extern("sshape_color_3b");
extern fn SshapeMat4 mat4(float* m) @extern("sshape_mat4");
extern fn SshapeMat4 mat4_transpose(float* m) @extern("sshape_mat4_transpose");

struct SshapeRange
{
    void* ptr;
    usz size;
}

struct SshapeMat4
{
    float[4][4] m;
}

struct SshapeVertex
{
    float x;
    float y;
    float z;
    uint normal;
    ushort u;
    ushort v;
    uint color;
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

struct SshapeBufferItem
{
    SshapeRange buffer;
    usz data_size;
    usz shape_offset;
}

struct SshapeBuffer
{
    bool valid;
    SshapeBufferItem vertices;
    SshapeBufferItem indices;
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


