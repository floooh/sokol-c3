//------------------------------------------------------------------------------
//  math.c3
//------------------------------------------------------------------------------

module sokol_math;
import std::math;

const float TAU = 6.28318530717958647692528676655900576;
const float PI = 3.14159265358979323846264338327950288;

// TODO: Shall we use C3 vectors for `Vec2` and `Vec3`?
//       They are usually aligned so their size may differ from arrays.
//       For example `Vec3.sizeof` could be 16 but `float[3].sizeof` could be 12.
typedef Vec2 = float[<2>];
typedef Vec3 = float[<3>];
// Matrix type is `float[number_of_rows][number_of_columns]`.
// It has column major layout in memory.
// So in memory matrix is stored as an array of columns `{ column0, column1, column2, ... }`
// where each column is an array with length `number_of_rows`.
// But when indexing we have to use opposite order `m[column_index][row_index]`.
// The reason is that matrix has type `T[number_of_columns]` where `T` is `float[number_of_rows]`.
// So when indexing matrix by column `m[column_index]` it returns item of type `T`
// which is array and can be indexed by `row_index`.
typedef Mat4 = float[4][4];

fn float radians(float degrees)
{
    return degrees * TAU / 360;
}

fn Vec3 up()
{
    return { 0.0, 1.0, 0.0 };
}

fn float dot_vec3(Vec3 v0, Vec3 v1)
{
    return v0.x*v1.x + v0.y*v1.y + v0.z*v1.z;
}

fn float dot(Vec3 v0, Vec3 v1)
{
    return dot_vec3(v0, v1);
}

fn float len_vec3(Vec3 v)
{
    return math::sqrt(dot(v, v));
}

fn float len(Vec3 v)
{
    return len_vec3(v);
}

fn Vec3 norm_vec3(Vec3 v)
{
    float l = len(v);
    if (l != 0) return { v.x/l, v.y/l, v.z/l };
    return {};
}

fn Vec3 norm(Vec3 v)
{
    return norm_vec3(v);
}

fn Vec3 cross_vec3(Vec3 v0, Vec3 v1)
{
    return {
        (v0.y * v1.z) - (v0.z * v1.y),
        (v0.z * v1.x) - (v0.x * v1.z),
        (v0.x * v1.y) - (v0.y * v1.x),
    };
}

fn Vec3 cross(Vec3 v0, Vec3 v1)
{
    return cross_vec3(v0, v1);
}

fn Mat4 identity_mat4()
{
    Mat4 m;
    m[0][0] = 1.0;
    m[1][1] = 1.0;
    m[2][2] = 1.0;
    m[3][3] = 1.0;
    return m;
}

fn Mat4 identity()
{
    return identity_mat4();
}

fn Mat4 persp_mat4(float fov, float aspect, float near, float far)
{
    Mat4 m = identity();
    float t = math::tan(fov * (PI / 360));
    m[0][0] = 1 / t;
    m[1][1] = aspect / t;
    m[2][3] = -1;
    m[2][2] = (near + far) / (near - far);
    m[3][2] = (2 * near * far) / (near - far);
    m[3][3] = 0;
    return m;
}

fn Mat4 persp(float fov, float aspect, float near, float far)
{
    return persp_mat4(fov, aspect, near, far);
}

fn Mat4 lookat_mat4(Vec3 eye, Vec3 center, Vec3 up)
{
    Mat4 m;
    Vec3 f = norm(center - eye);
    Vec3 s = norm(cross(f, up));
    Vec3 u = cross(s, f);

    m[0][0] = s.x;
    m[0][1] = u.x;
    m[0][2] = -f.x;

    m[1][0] = s.y;
    m[1][1] = u.y;
    m[1][2] = -f.y;

    m[2][0] = s.z;
    m[2][1] = u.z;
    m[2][2] = -f.z;

    m[3][0] = -dot(s, eye);
    m[3][1] = -dot(u, eye);
    m[3][2] = dot(f, eye);
    m[3][3] = 1.0;

    return m;
}

fn Mat4 lookat(Vec3 eye, Vec3 center, Vec3 up)
{
    return lookat_mat4(eye, center, up);
}

fn Mat4 rotate_mat4(float angle, Vec3 axis_unorm)
{
    Mat4 m = identity();

    Vec3 axis = norm(axis_unorm);
    float sin_theta = math::sin(radians(angle));
    float cos_theta = math::cos(radians(angle));
    float cos_value = 1.0 - cos_theta;

    m[0][0] = (axis.x * axis.x * cos_value) + cos_theta;
    m[0][1] = (axis.x * axis.y * cos_value) + (axis.z * sin_theta);
    m[0][2] = (axis.x * axis.z * cos_value) - (axis.y * sin_theta);
    m[1][0] = (axis.y * axis.x * cos_value) - (axis.z * sin_theta);
    m[1][1] = (axis.y * axis.y * cos_value) + cos_theta;
    m[1][2] = (axis.y * axis.z * cos_value) + (axis.x * sin_theta);
    m[2][0] = (axis.z * axis.x * cos_value) + (axis.y * sin_theta);
    m[2][1] = (axis.z * axis.y * cos_value) - (axis.x * sin_theta);
    m[2][2] = (axis.z * axis.z * cos_value) + cos_theta;

    return m;
}

fn Mat4 rotate(float angle, Vec3 axis_unorm)
{
    return rotate_mat4(angle, axis_unorm);
}

fn Mat4 translate_mat4(Vec3 translation)
{
    Mat4 m = identity();
    m[3][0] = translation.x;
    m[3][1] = translation.y;
    m[3][2] = translation.z;
    return m;
}

fn Mat4 translate(Vec3 translation)
{
    return translate_mat4(translation);
}

fn Mat4 mul_mat4(Mat4 left, Mat4 right)
{
    Mat4 m;
    for (int col = 0; col < 4; col++) {
        for (int row = 0; row < 4; row++) {
            m[col][row] = left[0][row] * right[col][0] +
                          left[1][row] * right[col][1] +
                          left[2][row] * right[col][2] +
                          left[3][row] * right[col][3];
        }
    }
    return m;
}

fn Mat4 mul(Mat4 left, Mat4 right)
{
    return mul_mat4(left, right);
}
