#version 330

uniform float time;         // The time uniform to track the scrolling over time
uniform vec2 resolution;    // Screen resolution
uniform sampler2D image;    // The background image texture

void main() {
    // Calculate normalized texture coordinates
    vec2 uv = gl_FragCoord.xy / resolution.xy;

    // Adjust the horizontal scrolling speed
    float scrollSpeed = 0.05; // Try reducing the speed for smoother scrolling

    // Scroll the texture horizontally using time
    uv.x += time * scrollSpeed;

    // Wrap the x-coordinate to ensure seamless looping
    uv.x = mod(uv.x, 1.0); // Wrap UV for continuous scroll

    // Sample the texture using the modified coordinates
    vec4 color = texture(image, uv);

    // Output the final color to the fragment
    gl_FragColor = color;
}
