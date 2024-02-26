#version 100

uniform sampler2D lightmap;
uniform sampler2D texture;

varying vec2 lmcoord;
varying vec2 texcoord;

varying vec3 normal;

varying vec4 position;
varying vec4 glcolor;

uniform float far;
uniform vec3 fogColor;
uniform vec3 cameraPosition;
uniform vec3 skyColor;

void main() {
    vec4 color = vec4(skyColor,1);

/* DRAWBUFFERS:0 */
    gl_FragData[0] = color; //Albedo
}