struct VertexInput {
    float3 position : LOC0;
    float3 normal : LOC1;
    float3 color : LOC2;
};

struct VertexOutput {
    float4 position : SV_Position;
    float3 color : LOC0;
    float3 normal : LOC1;
};

struct MyUniforms {
    row_major float4x4 projectionMatrix;
    row_major float4x4 viewMatrix;
    row_major float4x4 modelMatrix;
    float4 color;
    float time;
    int _end_pad_0;
    int _end_pad_1;
    int _end_pad_2;
};

cbuffer uMyUniforms : register(b0) { MyUniforms uMyUniforms; }

struct VertexOutput_vs_main {
    float3 color : LOC0;
    float3 normal : LOC1;
    float4 position : SV_Position;
};

struct FragmentInput_fs_main {
    float3 color_1 : LOC0;
    float3 normal_1 : LOC1;
    float4 position_1 : SV_Position;
};

VertexOutput_vs_main vs_main(VertexInput in_)
{
    VertexOutput out_ = (VertexOutput)0;

    float4x4 _expr5 = uMyUniforms.projectionMatrix;
    float4x4 _expr8 = uMyUniforms.viewMatrix;
    float4x4 _expr12 = uMyUniforms.modelMatrix;
    out_.position = mul(float4(in_.position, 1.0), mul(_expr12, mul(_expr8, _expr5)));
    float4x4 _expr21 = uMyUniforms.modelMatrix;
    out_.normal = mul(float4(in_.normal, 0.0), _expr21).xyz;
    out_.color = in_.color;
    VertexOutput _expr29 = out_;
    const VertexOutput vertexoutput = _expr29;
    const VertexOutput_vs_main vertexoutput_1 = { vertexoutput.color, vertexoutput.normal, vertexoutput.position };
    return vertexoutput_1;
}

float4 fs_main(FragmentInput_fs_main fragmentinput_fs_main) : SV_Target0
{
    VertexOutput in_1 = { fragmentinput_fs_main.position_1, fragmentinput_fs_main.color_1, fragmentinput_fs_main.normal_1 };
    float3 normal_2 = normalize(in_1.normal);
    float3 lightColor1_ = float3(1.0, 0.9, 0.6);
    float3 lightColor2_ = float3(0.6, 0.9, 1.0);
    float3 lightDirection1_ = float3(0.5, -0.9, 0.1);
    float3 lightDirection2_ = float3(0.2, 0.4, 0.3);
    float shading1_ = max(0.0, dot(lightDirection1_, normal_2));
    float shading2_ = max(0.0, dot(lightDirection2_, normal_2));
    float3 shading = ((shading1_ * lightColor1_) + (shading2_ * lightColor2_));
    float3 color_2 = (in_1.color * shading);
    float3 corrected_color = pow(color_2, (2.2).xxx);
    float _expr36 = uMyUniforms.color.w;
    return float4(corrected_color, _expr36);
}
