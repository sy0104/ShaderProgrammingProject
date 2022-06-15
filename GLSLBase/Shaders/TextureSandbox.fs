#version 450

layout(location=0) out vec4 FragColor;

in vec2 v_TexCoord;

uniform sampler2D u_TexSampler;

vec4 Flip()
{
	// 위아래로 반전
	vec4 returnValue = vec4(0);
	vec2 newTexCoord = v_TexCoord;

	newTexCoord = vec2(v_TexCoord.x, 1.0 - v_TexCoord.y);
	returnValue = texture(u_TexSampler, v_TexCoord);

	return returnValue;
}

void main()
{
	FragColor = Flip();
	//FragColor = vec4(1,1,1,1);
}
