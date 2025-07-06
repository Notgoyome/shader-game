shader_type canvas_item;
const vec3 PURPLE = vec3(0.625, 0.231, 0.894);
const vec3 DARK_PURPLE = vec3(0.294, 0.184, 0.566);

void fragment() {
	if ((COLOR.rgb == vec3(1.0, 0.0, 0.0))) {
		COLOR.rgb = PURPLE;
	};
	if (distance(COLOR.rgb,vec3(1, 0.0, 1)) < 0.1) {
		COLOR.rgb = DARK_PURPLE;
	};
}
