// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/FX_Lbeer_mengban_mask"
{
	Properties
	{
		_Cutoff( "Mask Clip Value", Float ) = 0.5
		[Enum(UnityEngine.Rendering.CullMode)]_CullMode("CullMode", Float) = 2
		_Mengban_shuzhi("Mengban_shuzhi", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_Mengban_("Mengban_", Float) = 0
		_TextureSample0("Texture Sample 0", 2D) = "white" {}
		_Dissolve("Dissolve", Float) = 0
		_Back_Color("Back_Color", Color) = (0,0,0,0)
		[Enum(Off,0,On,1)]_Custom("Custom", Float) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "AlphaTest+0" "IsEmissive" = "true"  }
		Cull [_CullMode]
		ZWrite Off
		ZTest [_Depth]
		Stencil
		{
			Ref [_Mengban_shuzhi]
			Comp [_Mengban_]
			Pass Replace
		}
		Blend SrcAlpha [_AddBlend]
		
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float4 uv2_texcoord2;
			float2 uv_texcoord;
		};

		uniform float _Mengban_shuzhi;
		uniform float _CullMode;
		uniform float4 _Back_Color;
		uniform float _Dissolve;
		uniform float _Custom;
		uniform sampler2D _TextureSample0;
		uniform float _Cutoff = 0.5;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Emission = _Back_Color.rgb;
			o.Alpha = _Back_Color.a;
			float lerpResult474 = lerp( _Dissolve , ( _Dissolve + i.uv2_texcoord2.x ) , _Custom);
			clip( step( lerpResult474 , tex2D( _TextureSample0, i.uv_texcoord ).r ) - _Cutoff );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.RangedFloatNode;463;1004.384,-46.07581;Inherit;False;Property;_Mengban_shuzhi;Mengban_shuzhi;2;0;Create;True;0;0;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;464;1010.384,30.92419;Inherit;False;Property;_Mengban_;Mengban_;3;1;[Enum];Fetch;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;465;1081.384,207.4242;Inherit;False;Constant;_Float0;Float 0;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1594.848,-16.93484;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX/FX_Lbeer_mengban_mask;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;2;False;;0;True;_Depth;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;Custom;;AlphaTest;All;12;all;True;True;True;True;0;False;;True;0;True;_Mengban_shuzhi;255;False;;255;False;;0;True;_Mengban_;3;False;_Stencil_Pass_front;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;1;5;False;;8;True;_AddBlend;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;True;_CullMode;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.StepOpNode;468;1155.696,379.2747;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;473;818.6317,129.254;Inherit;False;Property;_CullMode;CullMode;1;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;467;499.6957,812.2747;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;466;731.384,732.4242;Inherit;True;Property;_TextureSample0;Texture Sample 0;4;0;Create;True;0;0;0;False;0;False;-1;None;277a618c6f023ca4bbec18334122892c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;474;897.4227,369.5143;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;469;404.2958,228.0748;Inherit;False;Property;_Dissolve;Dissolve;5;0;Create;True;0;0;0;False;0;False;0;0.23;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;476;639.4227,390.5143;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;475;306.4227,389.5143;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;472;1263.632,43.25403;Inherit;False;Property;_Back_Color;Back_Color;6;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.1996325,0,0.3207547,0.3333333;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;477;754.4227,513.5143;Inherit;False;Property;_Custom;Custom;7;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
WireConnection;0;2;472;0
WireConnection;0;9;472;4
WireConnection;0;10;468;0
WireConnection;468;0;474;0
WireConnection;468;1;466;1
WireConnection;466;1;467;0
WireConnection;474;0;469;0
WireConnection;474;1;476;0
WireConnection;474;2;477;0
WireConnection;476;0;469;0
WireConnection;476;1;475;1
ASEEND*/
//CHKSM=D8EED827066F3E649BD5B92587F1FF2C3331A0AA