shader_type canvas_item;
render_mode unshaded;
// Read the docs at
// https://docs.godotengine.org/en/4.0/tutorials/shaders/shader_reference/shading_language.html
// https://docs.godotengine.org/en/latest/classes/class_canvasgroup.html
uniform vec3 smoke: source_color = vec3(1.);
uniform vec2 time_scale = vec2(0.1, 0.03);
uniform vec2 noise_density = vec2(1., 1.);
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;
uniform sampler2D NOISE_PATTERN;
global uniform bool ENABLE_SHADERS;

void fragment() {
	if (ENABLE_SHADERS) {
		ivec2 bg_size = textureSize(screen_texture, 0);
		ivec2 noise_size = textureSize(NOISE_PATTERN, 0);
		vec2 cpos = vec2(
			mod((UV.x + TIME*time_scale.x) * noise_density.x, 1),
			mod((UV.y + TIME*time_scale.y) * noise_density.y, 1)
			//mod(SCREEN_UV.y*SCREEN_PIXEL_SIZE.y + TIME/50000., SCREEN_PIXEL_SIZE.y)/SCREEN_PIXEL_SIZE.y
			);

		float noiseValue = texture(NOISE_PATTERN, cpos).x;
		vec4 base_color = texture(screen_texture, SCREEN_UV);
		COLOR.rgb *= mix(base_color.rgb, smoke, noiseValue);
		//COLOR.a = base_color.a;
	} else {
		COLOR = texture(screen_texture, SCREEN_UV);
	}
}
