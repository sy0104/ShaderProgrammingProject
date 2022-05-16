#version 450

in vec3 a_Position;
in vec4 a_Color;

uniform float u_Time;

// vs에서는 출력물까지 영향을 미치는 color를 지정할 수 없음
// color는 fs에서 결정됨
// fs에 전달해주기 위해서 출력해줘야함

out vec4 v_Color;

void main()
{
	gl_Position = vec4(a_Position * u_Time, 1);
	v_Color = a_Color;	// vs에서는 color 관련 연산 없이 그대로 넘기게 됨
}
