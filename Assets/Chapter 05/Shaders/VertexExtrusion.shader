Shader "CookbookShaders/Chapter05/Normal Extrusion" {
	Properties{
		_MainTex("Texture", 2D) = "white" {}
	_Amount("Extrusion Amount", Range(-0.0001,0.0001)) = 0
	}
		SubShader{
		Tags{ "RenderType" = "Opaque" }
		CGPROGRAM
#pragma surface surf Standard vertex:vert
	struct Input {
		float2 uv_MainTex;
	};
	float _Amount;
	void vert(inout appdata_full v) {
		v.vertex.xyz += v.normal * _Amount;
	}
	sampler2D _MainTex;
	void surf(Input IN, inout SurfaceOutputStandard o) {
		o.Albedo = tex2D(_MainTex, IN.uv_MainTex).rgb;
	}
	ENDCG
	}
		Fallback "Diffuse"
}