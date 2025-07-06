shader_type canvas_item;
const float SIZE = 16.0;

void fragment() {
	float pixel_pos_normalized = 1.0 / SIZE;
    vec4 color = texture(TEXTURE,UV);
	// check if surrounding pixel is alpha 1.0 atleast
	float is_transparent = 1.0 - color.a;
	float should_outline = (texture(TEXTURE,vec2(UV.x+pixel_pos_normalized, UV.y)).a + 
							texture(TEXTURE,vec2(UV.x-pixel_pos_normalized, UV.y)).a + 
							texture(TEXTURE,vec2(UV.x, UV.y + pixel_pos_normalized)).a +
							texture(TEXTURE,vec2(UV.x, UV.y - +pixel_pos_normalized)).a);
	COLOR = mix(color, vec4(vec3(0.0),should_outline), is_transparent);
}