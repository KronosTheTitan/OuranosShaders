#version 120

uniform vec3 skyColor;

uniform sampler2D lightmap;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;

varying vec3 normal;

varying vec4 position;
varying vec4 glcolor;

void main() {
    vec4 color = texture2D(texture, texcoord) * glcolor;
    vec4 lightmap = texture2D(lightmap, lmcoord);

/* DRAWBUFFERS:0123 */
    gl_FragData[0] = color; //Albedo
    gl_FragData[1] = vec4(normal,1); //Normals
    gl_FragData[2] = vec4(position.xyz,1); //World Position
    gl_FragData[3] = lightmap; //Lightmap
    gl_FragData[4] = vec4(1); //ForwardRendedredElements
}