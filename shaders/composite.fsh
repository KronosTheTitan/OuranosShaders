#version 120

const int GL_LINEAR = 9729;
const int GL_EXP = 2048;

uniform sampler2D colortex0; //Albedo
uniform sampler2D colortex1; //Normals
uniform sampler2D colortex2; //World Position
uniform sampler2D colortex3; //Lightmap

uniform int fogMode;
uniform int isEyeInWater;

uniform float fogDensity;

uniform vec3 fogColor;

varying vec2 texcoord;

void main() {
    vec3 color = texture2D(colortex0, texcoord).rgb;
    vec3 normal = texture2D(colortex1, texcoord).xyz;
    vec4 position = texture2D(colortex2, texcoord).xyzw;
    vec3 light = texture2D(colortex3, texcoord).rgb;

    float depth = position.w;

    color *= light;
    color.rgb = mix(color,fogColor,pow(depth*.9,3));

    /* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(color, 1.0);
}