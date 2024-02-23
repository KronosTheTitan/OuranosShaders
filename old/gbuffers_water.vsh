#version 120

const float PI = 3.14;

varying vec2 lmcoord;
varying vec2 texcoord;

varying vec3 normal;
varying vec3 vworldpos;

varying vec4 position;
varying vec4 glcolor;

uniform float frameTimeCounter;

uniform vec3 cameraPosition;

uniform mat4 gbufferModelView;
uniform mat4 gbufferModelViewInverse;

void main() {
    position = ftransform();
    position.xyz = mat3(gbufferModelViewInverse) * (gl_ModelViewMatrix * gl_Vertex).xyz + gbufferModelViewInverse[3].xyz;

    vworldpos = position.xyz + cameraPosition;

    float fy = fract(vworldpos.y + 0.001);
    float wave = 0.05 * sin(2 * PI * (frameTimeCounter*0.8 + vworldpos.x /  2.5 + vworldpos.z / 5.0))
    + 0.05 * sin(2 * PI * (frameTimeCounter*0.6 + vworldpos.x / 6.0 + vworldpos.z /  12.0));
    position.y += clamp(wave, -fy, 1.0-fy)*0.80f;

    //position.y = 65;

    position = gl_ProjectionMatrix * gbufferModelView * vec4(position.xyz, 1.0);

    gl_Position = position;

    normal = gl_Normal;

    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    lmcoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    glcolor = gl_Color;
}