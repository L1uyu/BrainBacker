#version 300 es

precision highp float;
precision highp int;

struct VertexInput {
    vec3 position;
    vec3 normal;
    vec3 color;
};
struct VertexOutput {
    vec4 position;
    vec3 color;
    vec3 normal;
};
struct MyUniforms {
    mat4x4 projectionMatrix;
    mat4x4 viewMatrix;
    mat4x4 modelMatrix;
    vec4 color;
    float time;
};
uniform MyUniforms_block_0Vertex { MyUniforms _group_0_binding_0_vs; };

layout(location = 0) in vec3 _p2vs_location0;
layout(location = 1) in vec3 _p2vs_location1;
layout(location = 2) in vec3 _p2vs_location2;
smooth out vec3 _vs2fs_location0;
smooth out vec3 _vs2fs_location1;

void main() {
    VertexInput in_ = VertexInput(_p2vs_location0, _p2vs_location1, _p2vs_location2);
    VertexOutput out_ = VertexOutput(vec4(0.0), vec3(0.0), vec3(0.0));
    mat4x4 _e5 = _group_0_binding_0_vs.projectionMatrix;
    mat4x4 _e8 = _group_0_binding_0_vs.viewMatrix;
    mat4x4 _e12 = _group_0_binding_0_vs.modelMatrix;
    out_.position = (((_e5 * _e8) * _e12) * vec4(in_.position, 1.0));
    mat4x4 _e21 = _group_0_binding_0_vs.modelMatrix;
    out_.normal = (_e21 * vec4(in_.normal, 0.0)).xyz;
    out_.color = in_.color;
    VertexOutput _e29 = out_;
    gl_Position = _e29.position;
    _vs2fs_location0 = _e29.color;
    _vs2fs_location1 = _e29.normal;
    gl_Position.yz = vec2(-gl_Position.y, gl_Position.z * 2.0 - gl_Position.w);
    return;
}

