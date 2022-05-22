#version 450

in vec3 a_Position;
in vec3 a_Velocity;
in float a_EmitTime;
in float a_LifeTime;
in float a_Amp;
in float a_Period;
in float a_RandomValue;

uniform float u_Time;
uniform vec3 u_Accel;

bool bLoop = true;	// ����

const float g_PI = 3.14;
const mat3 g_RotMat = mat3(0, -1, 0, 1, 0, 0, 0, 0, 0);

void main()
{
	vec3 newPos;
	float t = u_Time - a_EmitTime;	// �� ��ƼŬ���� �������� ���ð�
	float tt = t * t;

	// if (t > 0 && (t < a_LifeTime && !bLoop))

	if (t > 0)
	{
		newPos.x = sin(a_RandomValue * 2 * g_PI);
		newPos.y = cos(a_RandomValue * 2 * g_PI);
		newPos.z = 0;
		newPos = a_Position + newPos;
		
		float temp = t / a_LifeTime;
		float fractional = fract(temp);	// �Ҽ��� �Ʒ��κи� ���� �־���
		t = fractional * a_LifeTime;
		tt = t * t;

		float period = a_Period;	// �ֱ�
		float amp = a_Amp;	// ����
		newPos = newPos + a_Velocity * t + 0.5 * u_Accel * tt;

		vec3 rotVec = normalize(a_Velocity * g_RotMat);
		newPos = newPos + t * amp * rotVec * sin(period * t * 2.0 * g_PI);
		newPos.z = 0;
	}

	else	// ���� �¾�� �ʾҴٸ�
	{
		newPos = vec3(-100000, -100000, -100000);
	}

	gl_Position = vec4(newPos, 1);
}
