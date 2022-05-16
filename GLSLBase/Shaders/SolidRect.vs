#version 450

// in: attribÀÌ¶û µ¿ÀÏ
in vec3 a_Position;

void main()
{
	gl_Position = vec4(a_Position, 1);
}
