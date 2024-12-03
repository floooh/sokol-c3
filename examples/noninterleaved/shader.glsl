@header module main;
@header import sokol_math;

@ctype mat4 sokol_math::Mat4

@vs vs
layout(binding=0) uniform vs_params {
    mat4 mvp;
};

in vec4 position;
in vec4 color0;
out vec4 color;

void main() {
    gl_Position = mvp * position;
    color = color0;
}
@end

@fs fs
in vec4 color;
out vec4 frag_color;

void main() {
    frag_color = color;
}
@end

@program noninterleaved vs fs