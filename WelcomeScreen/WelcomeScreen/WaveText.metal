 
#include <metal_stdlib>
using namespace metal;
[[stitchable]] float2 wave (float2 position){
    return position-float2(0,sin(position.x * 0.023) * 15);
}

[[stitchable]] float2 Awave (float2 position, float time){
    return position-float2(0,sin(position.x * 0.023 + time) * 15);
}

