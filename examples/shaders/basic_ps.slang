import "common";

struct PS_Input {
    float3 color: COLOR;
}

struct Data {
    float3 color;
};

[vk::push_constant]
PixelParams<Data> sp;

[shader("pixel")]
float4 main(PS_Input input) : SV_Target0 {
    // can either fetch the color from the shader inputs or from the vertex colors.
    //return float4(sp.get().color, 1.);
    return float4(input.color, 1.);
}