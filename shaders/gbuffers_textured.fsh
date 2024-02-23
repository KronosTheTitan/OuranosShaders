#version 100

uniform sampler2D lightmap;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;

varying vec3 normal;

varying vec4 position;
varying vec4 glcolor;

uniform float far;

void main() {
    vec4 color = glcolor;
    vec4 lightmap = texture2D(lightmap, lmcoord);

    vec4 textures = texture2D(texture, texcoord);

    float t = (glcolor.r + glcolor.g + glcolor.b) / 3;

    color.a = textures.a;

    color *= lightmap;

    /* DRAWBUFFERS:0 */
    gl_FragData[0] = color; //Albedo
}