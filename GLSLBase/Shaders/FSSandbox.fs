#version 450

layout(location=0) out vec4 FragColor;

in vec4 v_Color;

void main()
{
	/*float dis = distance(v_Color.xy, vec2(0.5, 0.5));
	vec4 newColor = vec4(0, 0, 0, 0);

	if (dis < 0.5)
	{
		newColor = vec4(1, 1, 1, 1);	
	}
	else
	{
		newColor = vec4(0, 0, 0, 0);
	}

	FragColor = newColor; */


	float dis = distance(v_Color.xy, vec2(0.5, 0.5));

	if (dis > 0.48 && dis < 0.5)
		FragColor = vec4(1);
	else
		FragColor = vec4(0);
}
