shader_type canvas_item;
const float SIZE = 16.0;
uniform sampler2D noise_texture: hint_normal;
void fragment() {
	float pixel_pos_normalized = 1.0 / SIZE;
    vec4 color = texture(TEXTURE,UV);
	vec4 noise_color = texture(noise_texture,UV);
	// check if surrounding pixel is alpha 1.0 atleast
	float should_draw = float(UV.x > 0.5);
	float is_alpha = color.a;
	COLOR = mix(color, noise_color, should_draw * is_alpha);
}