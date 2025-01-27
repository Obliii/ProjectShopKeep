shader_type canvas_item;

uniform float quantity: hint_range(0.0, 1.0);

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 base = texture(TEXTURE, UV);
	vec4 new_color = vec4(1.0, 0, 0, base.a);
	COLOR = mix(base, new_color, quantity);
}


