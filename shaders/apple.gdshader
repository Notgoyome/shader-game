shader_type canvas_item;
const float SIZE = 16.0;

void fragment() {
	float pixel_pos_normalized = 1.0 / SIZE;
	float is_in_circle = float(pow(UV.x - 0.5, 2.0) + pow(UV.y - 0.5, 2.0) < pixel_pos_normalized*4.0);
	COLOR = vec4(1.0,1.0,1.0,is_in_circle);
	//COLOR = mix(COLOR, vec4(0.0,0.0,0.0,1), is_border);
}