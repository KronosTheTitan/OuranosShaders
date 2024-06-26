#version 100

uniform sampler2D colortex0; //Albedo

varying vec2 texcoord;

void main() {
    vec3 Albedo = texture2D(colortex0, texcoord).rgb;
/* DRAWBUFFERS:01 */
    gl_FragData[0] = vec4(Albedo,1); //Color
}
