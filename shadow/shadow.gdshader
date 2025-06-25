shader_type canvas_item;
render_mode skip_vertex_transform, unshaded;

uniform vec2 offset = vec2(0.,128.);
uniform vec4 shadow_color:source_color = vec4(0.0, 0.0, 0.0, 0.4);

void vertex() {
	VERTEX = (MODEL_MATRIX * vec4(VERTEX, 0.0, 1.0)).xy + offset;
}

void fragment() {
	float a = texture(TEXTURE, UV).a;
	COLOR = vec4(shadow_color.rgb, shadow_color.a * a);
}