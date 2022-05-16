#version 450

in vec3 a_Position;
in vec3 a_Velocity;
in float a_EmitTime;
in float a_LifeTime;
in float a_Amp;
in float a_Period;

uniform float u_Time;
uniform vec3 u_Accel;

bool bLoop = true;	// 숙제

float g_PI = 3.14;

void main()
{
	vec3 newPos;
	float t = u_Time - a_EmitTime;	// 각 파티클만의 독립적인 상대시간
	float tt = t * t;

	// if (t > 0 && (t < a_LifeTime && !bLoop))

	if (t > 0)
	{
		float temp = t / a_LifeTime;
		float fractional = fract(temp);	// 소수점 아래부분만 빼서 넣어줌
		t = fractional * a_LifeTime;
		tt = t * t;

		float period = a_Period;	// 주기
		float amp = a_Amp;	// 진폭

		newPos.x = a_Position.x + a_Velocity.x * t + 0.5 * u_Accel.x * tt;
		newPos.y = a_Position.y + amp * sin(period * t * 2.0 * g_PI);
		newPos.z = 0;
	}

	else	// 아직 태어나지 않았다면
	{
		newPos = vec3(-100000, -100000, -100000);
	}

	gl_Position = vec4(newPos, 1);
}
