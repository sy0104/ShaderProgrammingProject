#version 450

layout(location=0) out vec4 FragColor;

in vec2 v_TexCoord;

uniform sampler2D u_TexSampler;

void main()
{
	FragColor = texture(u_TexSampler, v_TexCoord);
	//FragColor = vec4(1,1,1,1);
}
