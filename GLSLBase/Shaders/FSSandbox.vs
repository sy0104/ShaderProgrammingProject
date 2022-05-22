#version 450

in vec3 a_Position;

out vec4 v_Color;

void main()
{
	gl_Position = vec4(a_Position, 1);	// -0.5 ~ 0.5, x, y 각 축별로 좌표(vertex별로 각기 다른게 들어옴)
	vec3 newValue = a_Position + vec3(0.5, 0.5, 0);
	v_Color = vec4(newValue, 1);
}
