#version 100

uniform sampler2D texture;
uniform sampler2D lightmap;

varying vec2 lmcoord;
varying vec2 texcoord;

varying vec3 normal;

varying vec4 position;
varying vec4 glcolor;

void main() {
    vec4 color = texture2D(texture, texcoord);
    vec4 lightmap = texture2D(lightmap, lmcoord);

    /* DRAWBUFFERS:0123 */
    gl_FragData[0] = color * lightmap * glcolor; //Albedo
}