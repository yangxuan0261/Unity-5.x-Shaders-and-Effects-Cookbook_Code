Shader "MyShader/MyCharacter" {
	Properties{
		_Color("Main Color", Color) = (1,1,1,1)
		_MainTex("Base (RGB)", 2D) = "white" {}
	_OccludeColor("Occlusion Color", Color) = (0,0,1,1)
	}

		SubShader{
		Tags{ "Queue" = "Geometry+1" }

		Pass{
		ZWrite Off
		Blend One Zero
		ZTest Greater
		Color[_OccludeColor]
	}

		Pass{
		Tags{ "LightMode" = "Vertex" }
		ZWrite On
		Lighting On

		Material{
		Diffuse[_Color]
		Ambient[_Color]
	}

		SetTexture[_MainTex]{
		ConstantColor[_Color]
		Combine texture * primary DOUBLE, texture * constant
	}
	}
	}
		FallBack "Diffuse", 1
}