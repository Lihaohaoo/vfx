// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/screen_water"
{
	Properties
	{
		[NoScaleOffset]_Main_tex("Main_tex", 2D) = "white" {}
		_Main_tex_control("Main_tex_control", Vector) = (1,1,0,0)
		_Main_Offset("Main_Offset", Float) = 0
		_Main_Strength("Main_Strength", Float) = 0
		_Main_noise("Main_noise", 2D) = "white" {}
		_Main_noise_control("Main_noise_control", Vector) = (1,1,0,0)
		_Main_noise_scale("Main_noise_scale", Float) = 0
		_Render_tex("Render_tex", 2D) = "white" {}
		_Render_tex_Strength("Render_tex_Strength", Float) = 0
		_Render_tex_Offset("Render_tex_Offset", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" }
		Cull Back
		GrabPass{ }
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf StandardCustomLighting alpha:fade keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float4 screenPos;
			float2 uv_texcoord;
		};

		struct SurfaceOutputCustomLightingCustom
		{
			half3 Albedo;
			half3 Normal;
			half3 Emission;
			half Metallic;
			half Smoothness;
			half Occlusion;
			half Alpha;
			Input SurfInput;
			UnityGIInput GIData;
		};

		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform sampler2D _Main_tex;
		uniform float4 _Main_tex_control;
		uniform sampler2D _Main_noise;
		uniform float4 _Main_noise_ST;
		uniform float4 _Main_noise_control;
		uniform float _Main_noise_scale;
		uniform float _Main_Offset;
		uniform float _Main_Strength;
		uniform sampler2D _Render_tex;
		uniform float4 _Render_tex_ST;
		uniform float _Render_tex_Offset;
		uniform float _Render_tex_Strength;

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 appendResult38 = (float2(_Main_tex_control.x , _Main_tex_control.y));
			float2 appendResult26 = (float2(_Main_tex_control.z , _Main_tex_control.w));
			float2 uv_Main_noise = i.uv_texcoord * _Main_noise_ST.xy + _Main_noise_ST.zw;
			float2 appendResult43 = (float2(_Main_noise_control.x , _Main_noise_control.y));
			float2 appendResult45 = (float2(_Main_noise_control.z , _Main_noise_control.w));
			float2 temp_output_2_0_g5 = ( ( ( i.uv_texcoord * appendResult38 ) + ( appendResult26 * _Time.y ) ) + ( tex2D( _Main_noise, ( ( uv_Main_noise * appendResult43 ) + ( appendResult45 * _Time.y ) ) ).r * _Main_noise_scale ) );
			float2 break6_g5 = temp_output_2_0_g5;
			float temp_output_25_0_g5 = ( pow( _Main_Offset , 3.0 ) * 0.1 );
			float2 appendResult8_g5 = (float2(( break6_g5.x + temp_output_25_0_g5 ) , break6_g5.y));
			float4 tex2DNode14_g5 = tex2D( _Main_tex, temp_output_2_0_g5 );
			float temp_output_4_0_g5 = _Main_Strength;
			float3 appendResult13_g5 = (float3(1.0 , 0.0 , ( ( tex2D( _Main_tex, appendResult8_g5 ).g - tex2DNode14_g5.g ) * temp_output_4_0_g5 )));
			float2 appendResult9_g5 = (float2(break6_g5.x , ( break6_g5.y + temp_output_25_0_g5 )));
			float3 appendResult16_g5 = (float3(0.0 , 1.0 , ( ( tex2D( _Main_tex, appendResult9_g5 ).g - tex2DNode14_g5.g ) * temp_output_4_0_g5 )));
			float3 normalizeResult22_g5 = normalize( cross( appendResult13_g5 , appendResult16_g5 ) );
			float2 uv_Render_tex = i.uv_texcoord * _Render_tex_ST.xy + _Render_tex_ST.zw;
			float2 temp_output_2_0_g4 = uv_Render_tex;
			float2 break6_g4 = temp_output_2_0_g4;
			float temp_output_25_0_g4 = ( pow( _Render_tex_Offset , 3.0 ) * 0.1 );
			float2 appendResult8_g4 = (float2(( break6_g4.x + temp_output_25_0_g4 ) , break6_g4.y));
			float4 tex2DNode14_g4 = tex2D( _Render_tex, temp_output_2_0_g4 );
			float temp_output_4_0_g4 = _Render_tex_Strength;
			float3 appendResult13_g4 = (float3(1.0 , 0.0 , ( ( tex2D( _Render_tex, appendResult8_g4 ).g - tex2DNode14_g4.g ) * temp_output_4_0_g4 )));
			float2 appendResult9_g4 = (float2(break6_g4.x , ( break6_g4.y + temp_output_25_0_g4 )));
			float3 appendResult16_g4 = (float3(0.0 , 1.0 , ( ( tex2D( _Render_tex, appendResult9_g4 ).g - tex2DNode14_g4.g ) * temp_output_4_0_g4 )));
			float3 normalizeResult22_g4 = normalize( cross( appendResult13_g4 , appendResult16_g4 ) );
			float4 screenColor1 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( float3( (ase_screenPosNorm).xy ,  0.0 ) + normalizeResult22_g5 + normalizeResult22_g4 ).xy);
			c.rgb = screenColor1.rgb;
			c.a = 1;
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
310;533;1667;695;4087.268;-52.72525;1.632358;True;True
Node;AmplifyShaderEditor.Vector4Node;42;-3350.488,859.7511;Inherit;False;Property;_Main_noise_control;Main_noise_control;7;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;43;-3082.997,872.3434;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;47;-3559.719,807.6287;Inherit;False;0;40;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;45;-3083.056,959.8734;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;44;-3118.056,1050.874;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-2894.665,813.415;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-2917.056,958.8734;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;36;-2709.574,295.8008;Inherit;False;Property;_Main_tex_control;Main_tex_control;3;0;Create;True;0;0;0;False;0;False;1,1,0,0;3,1,0,0.1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;48;-2733.613,844.3733;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;26;-2440.633,408.3309;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;28;-2475.633,499.331;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;38;-2440.574,320.8008;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;13;-2727.639,178.7422;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;51;-2500.419,1000.1;Inherit;False;Property;_Main_noise_scale;Main_noise_scale;8;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;40;-2600.98,812.1141;Inherit;True;Property;_Main_noise;Main_noise;6;0;Create;True;0;0;0;False;0;False;-1;None;c5204b48a96d2ea489922b2f101c17ce;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;27;-2274.633,407.3309;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-2284.574,268.8008;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-2271.419,841.1005;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;14;-2139.437,270.042;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;5;-1853.901,111.8;Inherit;True;Property;_Main_tex;Main_tex;2;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;None;c5204b48a96d2ea489922b2f101c17ce;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;16;-1753.471,932.1691;Inherit;False;Property;_Render_tex_Strength;Render_tex_Strength;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1753.471,861.1691;Inherit;False;Property;_Render_tex_Offset;Render_tex_Offset;11;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-1482.5,399.5;Inherit;False;Property;_Main_Offset;Main_Offset;4;0;Create;True;0;0;0;False;0;False;0;0.12;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;-1482.5,470.5;Inherit;False;Property;_Main_Strength;Main_Strength;5;0;Create;True;0;0;0;False;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;18;-1772.888,671.4584;Inherit;True;Property;_Render_tex;Render_tex;9;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleAddOpNode;39;-1957.664,348.2245;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;29;-1354.218,-90.255;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;30;-1115.218,-88.25499;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;19;-1061.471,725.1691;Inherit;False;NormalCreate;0;;4;e12f7ae19d416b942820e3932b56220f;0;4;1;SAMPLER2D;;False;2;FLOAT2;0,0;False;3;FLOAT;0.5;False;4;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;3;-1091.5,221.5;Inherit;False;NormalCreate;0;;5;e12f7ae19d416b942820e3932b56220f;0;4;1;SAMPLER2D;;False;2;FLOAT2;0,0;False;3;FLOAT;0.5;False;4;FLOAT;2;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;8;-619.5,87.5;Inherit;True;3;3;0;FLOAT2;0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScreenColorNode;1;-357.5,79.5;Inherit;False;Global;_GrabScreen0;Grab Screen 0;1;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;FX/screen_water;False;False;False;False;True;True;True;True;True;True;True;True;False;False;True;False;False;False;False;False;False;Back;0;False;-1;7;False;-1;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;False;Transparent;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;43;0;42;1
WireConnection;43;1;42;2
WireConnection;45;0;42;3
WireConnection;45;1;42;4
WireConnection;41;0;47;0
WireConnection;41;1;43;0
WireConnection;46;0;45;0
WireConnection;46;1;44;0
WireConnection;48;0;41;0
WireConnection;48;1;46;0
WireConnection;26;0;36;3
WireConnection;26;1;36;4
WireConnection;38;0;36;1
WireConnection;38;1;36;2
WireConnection;40;1;48;0
WireConnection;27;0;26;0
WireConnection;27;1;28;0
WireConnection;37;0;13;0
WireConnection;37;1;38;0
WireConnection;50;0;40;1
WireConnection;50;1;51;0
WireConnection;14;0;37;0
WireConnection;14;1;27;0
WireConnection;39;0;14;0
WireConnection;39;1;50;0
WireConnection;30;0;29;0
WireConnection;19;1;18;0
WireConnection;19;3;17;0
WireConnection;19;4;16;0
WireConnection;3;1;5;0
WireConnection;3;2;39;0
WireConnection;3;3;6;0
WireConnection;3;4;7;0
WireConnection;8;0;30;0
WireConnection;8;1;3;0
WireConnection;8;2;19;0
WireConnection;1;0;8;0
WireConnection;0;13;1;0
ASEEND*/
//CHKSM=8B8BC0B537A1872500FC2A5746CB44EE8FFE4074