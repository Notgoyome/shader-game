shader_type canvas_item;

void fragment() {
    vec4 color = texture(TEXTURE,vec2(1.0,1.0) - UV);
	COLOR = color;
}