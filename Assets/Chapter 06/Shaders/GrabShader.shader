Shader "CookbookShaders/Chapter06/GrabShader"
{
	SubShader
	{
		Tags{ "Queue" = "Transparent" "IgnoreProjector" = "True" "RenderType" = "Opaque" }
		ZWrite On Lighting Off Cull Off Fog{ Mode Off } Blend One Zero

		//GrabPass{ "_GrabTexture" }	// For a shared texture //共享一个，如果1-color后叠加的效果一样
		GrabPass{  }					// For a new pass every time //各自有一个，如果1-color后叠加的效果是反复取反

		Pass
	{
		CGPROGRAM
#pragma vertex vert
#pragma fragment frag
#include "UnityCG.cginc"

		sampler2D _GrabTexture;

	struct vin_vct
	{
		float4 vertex : POSITION;
	};

	struct v2f_vct
	{
		float4 vertex : POSITION;
		float4 uvgrab : TEXCOORD1;
	};

	// Vertex function 
	v2f_vct vert(vin_vct v)
	{
		v2f_vct o;
		o.vertex = mul(UNITY_MATRIX_MVP, v.vertex);
		o.uvgrab = ComputeGrabScreenPos(o.vertex);
		return o;
	}

	// Fragment function
	half4 frag(v2f_vct i) : COLOR
	{
		fixed4 col = tex2Dproj(_GrabTexture, UNITY_PROJ_COORD(i.uvgrab));
	return 1-col; // +half4(0.5, 0, 0, 0);
	}

		ENDCG
	}
	}
}