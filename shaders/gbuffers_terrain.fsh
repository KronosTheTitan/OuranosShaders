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

void main() {
    vec4 color = texture2D(texture, texcoord) * glcolor;
    vec4 lightmap = texture2D(lightmap, lmcoord);

    color *= lightmap;

    color = vec4(0,0,0,1);

    /* DRAWBUFFERS:0 */
    gl_FragData[0] = color; //Albedo
}