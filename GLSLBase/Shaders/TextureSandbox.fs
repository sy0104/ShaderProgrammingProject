#version 450

layout(location=0) out vec4 FragColor;

in vec2 v_TexCoord;

uniform sampler2D u_TexSampler;
uniform sampler2D u_TexSampler1;

uniform float u_Time;

vec4 Flip()
{
	// ���Ʒ��� ����
	vec4 returnValue = vec4(0);
	vec2 newTexCoord = v_TexCoord;

	newTexCoord = vec2(v_TexCoord.x, 1.0 - v_TexCoord.y);
	returnValue = texture(u_TexSampler, v_TexCoord);

	return returnValue;
}

vec4 P1()
{
	vec4 returnValue = vec4(0);
	vec2 newTexCoord = v_TexCoord;

	newTexCoord.y = abs(2.0 * (v_TexCoord.y - 0.5));
	returnValue = texture(u_TexSampler, newTexCoord);

	return returnValue;
}

vec4 P2()
{
	vec4 returnValue = vec4(0);
	vec2 newTexCoord = v_TexCoord;

	newTexCoord.x = fract(v_TexCoord.x * 3.0);
	newTexCoord.y = newTexCoord.y / 3.0 + floor(v_TexCoord.x * 3.0) / 3.0;
	returnValue = texture(u_TexSampler, newTexCoord);

	return returnValue;
}

vec4 P3()
{
	vec4 returnValue = vec4(0);
	vec2 newTexCoord = v_TexCoord;

	newTexCoord.x = fract(v_TexCoord.x * 2.0) + floor(v_TexCoord.y * 2.0) * 0.5;
	newTexCoord.y = fract(v_TexCoord.y * 2.0);
	returnValue = texture(u_TexSampler, newTexCoord);

	return returnValue;
}

vec4 P4()	// exam
{
	vec4 returnValue = vec4(0);
	vec2 newTexCoord = v_TexCoord;
	newTexCoord.x = fract(v_TexCoord.x * 2.0);

	if (v_TexCoord.x > 0.5)
	{
		returnValue = texture(u_TexSampler1, newTexCoord);
	}
	else
	{
		returnValue = texture(u_TexSampler, newTexCoord);
	}

	return returnValue;
}

vec4 P5()
{
	vec4 returnValue = vec4(0);
	vec2 newTexCoord = v_TexCoord;
	vec2 newTexCoord1 = v_TexCoord;
	newTexCoord1.x += u_Time;
	newTexCoord1.x = fract(newTexCoord1.x);

	returnValue = texture(u_TexSampler, newTexCoord) * texture(u_TexSampler1, newTexCoord1);

	return returnValue;
}

void main()
{
	//FragColor = Flip();
	FragColor = P5();
	//FragColor = vec4(1,1,1,1);
}
