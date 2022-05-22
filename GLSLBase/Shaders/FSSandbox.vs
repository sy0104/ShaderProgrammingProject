#version 450

in vec3 a_Position;

out vec4 v_Color;

void main()
{
	gl_Position = vec4(a_Position, 1);	// -0.5 ~ 0.5, x, y �� �ະ�� ��ǥ(vertex���� ���� �ٸ��� ����)
	vec3 newValue = a_Position + vec3(0.5, 0.5, 0);
	v_Color = vec4(newValue, 1);
}
