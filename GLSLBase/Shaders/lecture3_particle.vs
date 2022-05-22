#version 450

in vec3 a_Position;
in vec3 a_Velocity;
in float a_EmitTime;
in float a_LifeTime;
in float a_Amp;
in float a_Period;
in float a_RandomValue;
in vec4 a_Color;

out vec4 v_Color;

uniform float u_Time;
uniform vec3 u_Accel;

bool bLoop = true;	// 숙제

const float g_PI = 3.14;
const mat3 g_RotMat = mat3(0, -1, 0, 1, 0, 0, 0, 0, 0);
const vec3 g_Gravity = vec3(0, -0.5, 0);

void main()
{
	vec3 newPos;
	float t = u_Time - a_EmitTime;	// 각 파티클만의 독립적인 상대시간
	float tt = t * t;

	// if (t > 0 && (t < a_LifeTime && !bLoop))

	if (t > 0)
	{
		vec3 newAccel = g_Gravity + a_Velocity;

		newPos.x = sin(a_RandomValue * 2 * g_PI);
		newPos.y = cos(a_RandomValue * 2 * g_PI);
		newPos.z = 0;
		newPos = a_Position + newPos;
		
		float temp = t / a_LifeTime;
		float fractional = fract(temp);	// 소수점 아래부분만 빼서 넣어줌
		t = fractional * a_LifeTime;
		tt = t * t;

		float period = a_Period;	// 주기
		float amp = a_Amp;	// 진폭
		newPos = newPos + newAccel * t + 0.5 * u_Accel * tt;

		vec3 rotVec = normalize(newAccel * g_RotMat);
		newPos = newPos + 0.1 * amp * rotVec * sin(period * t * 2.0 * g_PI);
		newPos.z = 0;
		v_Color = a_Color * (1.0 - fractional);
	}

	else	// 아직 태어나지 않았다면
	{
		newPos = vec3(-100000, -100000, -100000);
		v_Color = vec4(0, 0, 0, 0);
	}

	gl_Position = vec4(newPos, 1);
	v_Color = a_Color;
}
