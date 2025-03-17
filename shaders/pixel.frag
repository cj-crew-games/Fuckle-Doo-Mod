// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define round(a) floor(a+.5)
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

// Pixel Art Shader
// Feel free to use, just give credit as always
// - TPG45

#define COLOR_STEP 32.0
#define PIXEL_SIZE 2.5

vec4 colorize(in vec4 color) {

    // Pixel art coloring
    vec3 nCol = normalize(color.rgb);
    float nLen = length(color.rgb);
    return vec4(nCol * round(nLen * COLOR_STEP) / COLOR_STEP, color.w);

}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Pixel Sizing
    float ratio = iResolution.y/720.0;
    vec2 pixel = round(fragCoord / (PIXEL_SIZE * ratio)) * PIXEL_SIZE * ratio;
    vec2 uv = pixel/iResolution.xy;
    fragColor = colorize(texture(iChannel0, uv));
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}