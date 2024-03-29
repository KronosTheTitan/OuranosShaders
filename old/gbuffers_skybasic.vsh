#version 120

varying vec2 lmcoord;
varying vec2 texcoord;

varying vec3 normal;

varying vec4 position;
varying vec4 glcolor;

void main() {
    position = ftransform();
    gl_Position = position;

    normal = gl_Normal;

    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    lmcoord  = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    glcolor = gl_Color;
}