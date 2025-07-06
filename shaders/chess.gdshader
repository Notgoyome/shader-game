shader_type canvas_item;
const float SIZE = 16.0;
void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	COLOR -= vec4(1.0,1.0,1.0,0.0) * float((int(UV.x*SIZE) + (int(UV.y*SIZE) % 2)) % 2);
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
