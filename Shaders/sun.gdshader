shader_type canvas_item;
uniform float red = 1.0;

void fragment() {
	COLOR = vec4(COLOR.r + red, COLOR.g - red, COLOR.b - red, COLOR.a);
}
