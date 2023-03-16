shader_type canvas_item;

void fragment() {
	COLOR.r = UV.x;
	COLOR.g = 1.-UV.y;
	COLOR.b = UV.y;
}
