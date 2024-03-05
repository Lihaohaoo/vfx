// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX_FX_ref"
{
	Properties
	{
		_Main_tex("Main_tex", 2D) = "white" {}
		_scale_noise("scale_noise", Float) = 0
		[KeywordEnum(sacal_noise,vertex_aph)] _Use_Particlopacity("Use_Particlopacity", Float) = 0
		[Enum(UnityEngine.Rendering.CompareFunction)]_depth("depth", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		GrabPass{ }
		CGPROGRAM
		#pragma target 3.0
		#pragma shader_feature_local _USE_PARTICLOPACITY_SACAL_NOISE _USE_PARTICLOPACITY_VERTEX_APH
		#if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex);
		#else
		#define ASE_DECLARE_SCREENSPACE_TEXTURE(tex) UNITY_DECLARE_SCREENSPACE_TEXTURE(tex)
		#endif
		#pragma surface surf Unlit alpha:fade keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float4 screenPos;
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
		};

		ASE_DECLARE_SCREENSPACE_TEXTURE( _GrabTexture )
		uniform sampler2D _Main_tex;
		uniform float4 _Main_tex_ST;
		uniform float _scale_noise;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 uv_Main_tex = i.uv_texcoord * _Main_tex_ST.xy + _Main_tex_ST.zw;
			#if defined(_USE_PARTICLOPACITY_SACAL_NOISE)
				float staticSwitch12 = _scale_noise;
			#elif defined(_USE_PARTICLOPACITY_VERTEX_APH)
				float staticSwitch12 = i.vertexColor.a;
			#else
				float staticSwitch12 = _scale_noise;
			#endif
			float4 screenColor13 = UNITY_SAMPLE_SCREENSPACE_TEXTURE(_GrabTexture,( (ase_screenPosNorm).xy + ( tex2D( _Main_tex, uv_Main_tex ).r * staticSwitch12 ) ));
			o.Emission = screenColor13.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
280;474;2100;874;1991.569;256.6829;1.3;True;True
Node;AmplifyShaderEditor.VertexColorNode;11;-854.0083,474.3615;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;10;-852.1082,402.0614;Inherit;False;Property;_scale_noise;scale_noise;1;0;Create;True;0;0;0;False;0;False;0;0.27;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;3;-1079.218,-104.6846;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;12;-583.0083,475.3615;Inherit;False;Property;_Use_Particlopacity;Use_Particlopacity;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;2;sacal_noise;vertex_aph;Create;True;True;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;8;-971.5082,209.3616;Inherit;True;Property;_Main_tex;Main_tex;0;0;Create;True;0;0;0;False;0;False;-1;None;9603006cdcfee6243ae86c89a1ec4fad;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;7;-862.7684,-83.12681;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;-432.0083,223.3615;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;4;-300.368,6.866058;Inherit;True;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenColorNode;13;-78.99593,-167.4114;Inherit;False;Global;_GrabScreen0;Grab Screen 0;3;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;16;-807.6454,644.4297;Inherit;False;Property;_depth;depth;3;1;[Enum];Fetch;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;15;176.9105,-5.781392;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX_FX_ref;False;False;False;False;True;True;True;True;True;True;True;True;False;False;True;False;False;False;False;False;False;Back;0;False;-1;7;True;16;False;0;False;-1;0;False;-1;False;0;Transparent;0.5;True;False;0;True;Transparent;;Transparent;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;0;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;12;1;10;0
WireConnection;12;0;11;4
WireConnection;7;0;3;0
WireConnection;9;0;8;1
WireConnection;9;1;12;0
WireConnection;4;0;7;0
WireConnection;4;1;9;0
WireConnection;13;0;4;0
WireConnection;15;2;13;0
ASEEND*/
//CHKSM=5DC3CF7A978BA4D025257CE7D3321211E1DF3DDF