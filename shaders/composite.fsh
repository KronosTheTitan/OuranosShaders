#version 100

uniform sampler2D texture;

varying vec2 texcoord;

void main() {
    vec4 color = texture2D(texture, texcoord);

/* DRAWBUFFERS:0 */
    gl_FragData[0] = color; //Albedo
}