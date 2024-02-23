#version 120

uniform sampler2D lightmap;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;

varying vec3 normal;

varying vec4 position;
varying vec4 glcolor;

uniform float far;

void main() {
    vec4 color = texture2D(texture, texcoord) * glcolor;
    vec4 lightmap = texture2D(lightmap, lmcoord);

    vec4 pos = position;
    pos.w = position.w/far;
/* DRAWBUFFERS:0123 */
    gl_FragData[0] = color; //Albedo
    gl_FragData[1] = vec4(normal,1); //Normals
    gl_FragData[2] = pos; //World Position
    gl_FragData[3] = lightmap; //Lightmap

}