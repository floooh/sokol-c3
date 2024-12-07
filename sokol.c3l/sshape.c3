// machine generated, do not edit

module sokol::sshape;
import sokol;

extern fn Buffer build_plane(Buffer* buf, Plane* params) @extern("sshape_build_plane");
extern fn Buffer build_box(Buffer* buf, Box* params) @extern("sshape_build_box");
extern fn Buffer build_sphere(Buffer* buf, Sphere* params) @extern("sshape_build_sphere");
extern fn Buffer build_cylinder(Buffer* buf, Cylinder* params) @extern("sshape_build_cylinder");
extern fn Buffer build_torus(Buffer* buf, Torus* params) @extern("sshape_build_torus");
extern fn Sizes plane_sizes(uint tiles) @extern("sshape_plane_sizes");
extern fn Sizes box_sizes(uint tiles) @extern("sshape_box_sizes");
extern fn Sizes sphere_sizes(uint slices, uint stacks) @extern("sshape_sphere_sizes");
extern fn Sizes cylinder_sizes(uint slices, uint stacks) @extern("sshape_cylinder_sizes");
extern fn Sizes torus_sizes(uint sides, uint rings) @extern("sshape_torus_sizes");
extern fn ElementRange element_range(Buffer* buf) @extern("sshape_element_range");
extern fn sokol::sg::BufferDesc vertex_buffer_desc(Buffer* buf) @extern("sshape_vertex_buffer_desc");
extern fn sokol::sg::BufferDesc index_buffer_desc(Buffer* buf) @extern("sshape_index_buffer_desc");
extern fn sokol::sg::VertexBufferLayoutState vertex_buffer_layout_state() @extern("sshape_vertex_buffer_layout_state");
extern fn sokol::sg::VertexAttrState position_vertex_attr_state() @extern("sshape_position_vertex_attr_state");
extern fn sokol::sg::VertexAttrState normal_vertex_attr_state() @extern("sshape_normal_vertex_attr_state");
extern fn sokol::sg::VertexAttrState texcoord_vertex_attr_state() @extern("sshape_texcoord_vertex_attr_state");
extern fn sokol::sg::VertexAttrState color_vertex_attr_state() @extern("sshape_color_vertex_attr_state");
extern fn uint color_4f(float r, float g, float b, float a) @extern("sshape_color_4f");
extern fn uint color_3f(float r, float g, float b) @extern("sshape_color_3f");
extern fn uint color_4b(char r, char g, char b, char a) @extern("sshape_color_4b");
extern fn uint color_3b(char r, char g, char b) @extern("sshape_color_3b");
extern fn Mat4 mat4(float* m) @extern("sshape_mat4");
extern fn Mat4 mat4_transpose(float* m) @extern("sshape_mat4_transpose");

struct Range
{
    void* ptr;
    usz size;
}

struct Mat4
{
    float[4][4] m;
}

struct Vertex
{
    float x;
    float y;
    float z;
    uint normal;
    ushort u;
    ushort v;
    uint color;
}

struct ElementRange
{
    CInt base_element;
    CInt num_elements;
}

struct SizesItem
{
    uint num;
    uint size;
}

struct Sizes
{
    SizesItem vertices;
    SizesItem indices;
}

struct BufferItem
{
    Range buffer;
    usz data_size;
    usz shape_offset;
}

struct Buffer
{
    bool valid;
    BufferItem vertices;
    BufferItem indices;
}

struct Plane
{
    float width;
    float depth;
    ushort tiles;
    uint color;
    bool random_colors;
    bool merge;
    Mat4 transform;
}

struct Box
{
    float width;
    float height;
    float depth;
    ushort tiles;
    uint color;
    bool random_colors;
    bool merge;
    Mat4 transform;
}

struct Sphere
{
    float radius;
    ushort slices;
    ushort stacks;
    uint color;
    bool random_colors;
    bool merge;
    Mat4 transform;
}

struct Cylinder
{
    float radius;
    float height;
    ushort slices;
    ushort stacks;
    uint color;
    bool random_colors;
    bool merge;
    Mat4 transform;
}

struct Torus
{
    float radius;
    float ring_radius;
    ushort sides;
    ushort rings;
    uint color;
    bool random_colors;
    bool merge;
    Mat4 transform;
}


