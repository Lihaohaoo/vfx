// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/shandian_vertex"
{
	Properties
	{
		[Enum(off,0,on,1)]_Custom("Custom", Float) = 0
		[HDR]_Color0("Color 0", Color) = (0,0,0,0)
		_Main_tex("Main_tex", 2D) = "white" {}
		_Speed_U("Speed_U", Float) = 0
		_Speed_V("Speed_V", Float) = 0
		_X("X", 2D) = "white" {}
		_X_speed_U("X_speed_U", Float) = 0
		_X_speed_V("X_speed_V", Float) = 0
		_Y("Y", 2D) = "white" {}
		_Y_speed_U("Y_speed_U", Float) = 0
		_Y_speed_V("Y_speed_V", Float) = 0
		_Z("Z", 2D) = "white" {}
		_Z_speed_U("Z_speed_U", Float) = 0
		_Z_speed_V("Z_speed_V", Float) = 0
		_Scale("Scale", Float) = 0
		_Vetex_normal_scale("Vetex_normal_scale", Float) = 0
		_Vertex_nomal_mask("Vertex_nomal_mask", 2D) = "white" {}
		_Mask("Mask", 2D) = "white" {}
		_Mask_power("Mask_power", Float) = 1
		_Dissolve("Dissolve", 2D) = "white" {}
		_Dissolve_speed_U("Dissolve_speed_U", Float) = 0
		_Dissolve_speed_V("Dissolve_speed_V", Float) = 0
		_Dissolve_scale("Dissolve_scale", Float) = 0
		_Dissolve_soft("Dissolve_soft", Float) = 1
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Off
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float4 vertexColor : COLOR;
			float4 uv2_texcoord2;
			float2 uv_texcoord;
			float2 uv3_texcoord3;
		};

		uniform sampler2D _X;
		uniform float _X_speed_U;
		uniform float _X_speed_V;
		uniform float _Custom;
		uniform float4 _X_ST;
		uniform sampler2D _Y;
		uniform float _Y_speed_U;
		uniform float _Y_speed_V;
		uniform float4 _Y_ST;
		uniform sampler2D _Z;
		uniform float _Z_speed_U;
		uniform float _Z_speed_V;
		uniform float4 _Z_ST;
		uniform float _Scale;
		uniform sampler2D _Mask;
		uniform float4 _Mask_ST;
		uniform float _Mask_power;
		uniform float _Vetex_normal_scale;
		uniform sampler2D _Vertex_nomal_mask;
		uniform float4 _Vertex_nomal_mask_ST;
		uniform float4 _Color0;
		uniform sampler2D _Main_tex;
		uniform float _Speed_U;
		uniform float _Speed_V;
		uniform float4 _Main_tex_ST;
		uniform sampler2D _Dissolve;
		uniform float _Dissolve_speed_U;
		uniform float _Dissolve_speed_V;
		uniform float4 _Dissolve_ST;
		uniform float _Dissolve_scale;
		uniform float _Dissolve_soft;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult23 = (float2(_X_speed_U , _X_speed_V));
			float custom65 = _Custom;
			float lerpResult58 = lerp( 0.0 , v.texcoord1.z , custom65);
			float Custom_W50 = lerpResult58;
			float2 uv_X = v.texcoord.xy * _X_ST.xy + _X_ST.zw;
			float2 panner22 = ( 1.0 * _Time.y * appendResult23 + ( Custom_W50 + uv_X ));
			float2 appendResult25 = (float2(_Y_speed_U , _Y_speed_V));
			float2 uv_Y = v.texcoord.xy * _Y_ST.xy + _Y_ST.zw;
			float2 panner24 = ( 1.0 * _Time.y * appendResult25 + ( Custom_W50 + uv_Y ));
			float2 appendResult27 = (float2(_Z_speed_U , _Z_speed_V));
			float2 uv_Z = v.texcoord.xy * _Z_ST.xy + _Z_ST.zw;
			float2 panner26 = ( 1.0 * _Time.y * appendResult27 + ( uv_Z + Custom_W50 ));
			float3 appendResult4 = (float3((-1.0 + (tex2Dlod( _X, float4( panner22, 0, 0.0) ).r - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , (-1.0 + (tex2Dlod( _Y, float4( panner24, 0, 0.0) ).r - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , (-1.0 + (tex2Dlod( _Z, float4( panner26, 0, 0.0) ).r - 0.0) * (1.0 - -1.0) / (1.0 - 0.0))));
			float lerpResult39 = lerp( _Scale , ( _Scale + v.texcoord1.x ) , custom65);
			float2 uv_Mask = v.texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float lerpResult44 = lerp( _Vetex_normal_scale , ( v.texcoord1.y + _Vetex_normal_scale ) , custom65);
			float3 ase_vertexNormal = v.normal.xyz;
			float2 uv_Vertex_nomal_mask = v.texcoord * _Vertex_nomal_mask_ST.xy + _Vertex_nomal_mask_ST.zw;
			v.vertex.xyz += ( ( appendResult4 * lerpResult39 * pow( tex2Dlod( _Mask, float4( uv_Mask, 0, 0.0) ).r , _Mask_power ) * v.color.a ) + ( lerpResult44 * ase_vertexNormal * tex2Dlod( _Vertex_nomal_mask, float4( uv_Vertex_nomal_mask, 0, 0.0) ).r ) );
			v.vertex.w = 1;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float Custom_T51 = i.uv2_texcoord2.w;
			float2 appendResult63 = (float2(Custom_T51 , 0.0));
			float custom65 = _Custom;
			float2 lerpResult67 = lerp( float2( 0,0 ) , appendResult63 , custom65);
			float2 appendResult37 = (float2(_Speed_U , _Speed_V));
			float2 uv_Main_tex = i.uv_texcoord * _Main_tex_ST.xy + _Main_tex_ST.zw;
			float2 panner33 = ( 1.0 * _Time.y * appendResult37 + uv_Main_tex);
			float4 tex2DNode32 = tex2D( _Main_tex, ( lerpResult67 + panner33 ) );
			o.Emission = ( i.vertexColor * _Color0 * tex2DNode32.r ).rgb;
			float2 appendResult78 = (float2(_Dissolve_speed_U , _Dissolve_speed_V));
			float lerpResult58 = lerp( 0.0 , i.uv2_texcoord2.z , custom65);
			float Custom_W50 = lerpResult58;
			float2 uv_Dissolve = i.uv_texcoord * _Dissolve_ST.xy + _Dissolve_ST.zw;
			float2 panner77 = ( 1.0 * _Time.y * appendResult78 + ( Custom_W50 + uv_Dissolve ));
			float temp_output_1_0_g1 = tex2D( _Dissolve, panner77 ).r;
			float lerpResult9_g1 = lerp( temp_output_1_0_g1 , ( 1.0 - temp_output_1_0_g1 ) , 0.0);
			float lerpResult85 = lerp( _Dissolve_scale , ( _Dissolve_scale + i.uv3_texcoord3.x ) , custom65);
			float temp_output_3_0_g1 = _Dissolve_soft;
			o.Alpha = ( tex2DNode32.r * saturate( ( ( ( ( lerpResult9_g1 + 1.0 ) - ( lerpResult85 * ( 1.0 + ( 1.0 - temp_output_3_0_g1 ) ) ) ) - temp_output_3_0_g1 ) / ( 1.0 - temp_output_3_0_g1 ) ) ) );
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Unlit alpha:fade keepalpha fullforwardshadows noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float4 customPack1 : TEXCOORD1;
				float4 customPack2 : TEXCOORD2;
				float3 worldPos : TEXCOORD3;
				half4 color : COLOR0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.customPack1.xyzw = customInputData.uv2_texcoord2;
				o.customPack1.xyzw = v.texcoord1;
				o.customPack2.xy = customInputData.uv_texcoord;
				o.customPack2.xy = v.texcoord;
				o.customPack2.zw = customInputData.uv3_texcoord3;
				o.customPack2.zw = v.texcoord2;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.color = v.color;
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv2_texcoord2 = IN.customPack1.xyzw;
				surfIN.uv_texcoord = IN.customPack2.xy;
				surfIN.uv3_texcoord3 = IN.customPack2.zw;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.vertexColor = IN.color;
				SurfaceOutput o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutput, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.ColorNode;28;-313.9165,-774.1347;Inherit;False;Property;_Color0;Color 0;1;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;7.046587,7.046587,7.046587,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;48.51742,-709.475;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;31;-282.0636,-979.9504;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;32;-353.1886,-586.6943;Inherit;True;Property;_Main_tex;Main_tex;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;513.9999,8.699999;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX/shandian_vertex;False;False;False;False;True;True;True;True;True;True;True;True;False;False;True;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Transparent;0.5;True;True;0;False;Transparent;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;2;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;34;-1296.066,-666.2313;Inherit;False;0;32;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;67;-1231.511,-807.5906;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;60;-542.2574,-647.1428;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;68;-1528.244,-967.9678;Inherit;False;65;custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;63;-1431.588,-791.5414;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;69;-1739.968,-703.3137;Inherit;False;Constant;_Float0;Float 0;18;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;70;-1772.968,-820.3137;Inherit;False;51;Custom_T;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;4;-932.4225,791.178;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-759.4225,803.178;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2;-1525.692,691.127;Inherit;True;Property;_Y;Y;8;0;Create;True;0;0;0;False;0;False;-1;None;ad18c0a40da84554c8ef66c4818f1ce3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-1536.192,942.0269;Inherit;True;Property;_Z;Z;11;0;Create;True;0;0;0;False;0;False;-1;None;ad18c0a40da84554c8ef66c4818f1ce3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;9;-1190.963,713.3779;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;10;-1215.963,962.3781;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;24;-1919.002,757.821;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;25;-2071.002,850.821;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;26;-1938.002,955.8212;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-2316.002,847.321;Inherit;False;Property;_Y_speed_U;Y_speed_U;9;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-2315.002,925.3212;Inherit;False;Property;_Y_speed_V;Y_speed_V;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-1093.422,1131.178;Inherit;False;Property;_Scale;Scale;14;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;39;-699.7283,1092.421;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;42;-908.4669,1183.54;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;55;-2099.24,748.0784;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;20;-2505.002,728.321;Inherit;False;0;2;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;21;-2624.001,964.3211;Inherit;False;0;3;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;27;-2037.002,1278.821;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-2232.002,1319.321;Inherit;False;Property;_Z_speed_U;Z_speed_U;12;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-2236.002,1386.321;Inherit;False;Property;_Z_speed_V;Z_speed_V;13;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;56;-2312.243,1005.86;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;44;-676.4962,1238.523;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;45;-785.4963,1443.523;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;54;-2456.24,635.0784;Inherit;False;50;Custom_W;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;57;-2571.242,1105.86;Inherit;False;50;Custom_W;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-1073.496,1493.523;Inherit;False;Property;_Vetex_normal_scale;Vetex_normal_scale;15;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;48;-539.0616,1431.627;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;59;-948.4612,1898.881;Inherit;True;Property;_Vertex_nomal_mask;Vertex_nomal_mask;16;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;64;-959.8794,1269.624;Inherit;False;65;custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-1638.911,1763.728;Inherit;False;Property;_Custom;Custom;0;1;[Enum];Create;True;0;2;off;0;on;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;58;-723.4019,1591.554;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;66;-944.929,1665.808;Inherit;False;65;custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;50;-556.6763,1591.88;Inherit;False;Custom_W;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;65;-1490.218,1760.074;Inherit;False;custom;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;51;-945.6766,1756.88;Inherit;False;Custom_T;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-55.73158,1155.888;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;188.8651,807.3579;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1067.066,-432.2313;Inherit;False;Property;_Speed_U;Speed_U;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1060.066,-323.2313;Inherit;False;Property;_Speed_V;Speed_V;4;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;37;-874.0664,-360.2313;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;33;-676.0664,-531.2313;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-2268.002,602.3209;Inherit;False;Property;_X_speed_V;X_speed_V;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-1532.992,439.2271;Inherit;True;Property;_X;X;5;0;Create;True;0;0;0;False;0;False;-1;None;ad18c0a40da84554c8ef66c4818f1ce3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;19;-2405.001,404.3213;Inherit;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-2273.002,533.321;Inherit;False;Property;_X_speed_U;X_speed_U;6;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;22;-1950.002,456.321;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;23;-2102.002,549.321;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;52;-2135.681,335.2037;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;49;-2429.012,228.2586;Inherit;False;50;Custom_W;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;8;-1189.297,501.5169;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;77;-1279.528,109.6469;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;78;-1439.528,205.647;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;76;-1679.528,189.6469;Inherit;False;Property;_Dissolve_speed_U;Dissolve_speed_U;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-1679.528,269.647;Inherit;False;Property;_Dissolve_speed_V;Dissolve_speed_V;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;79;-1471.528,-18.35314;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;81;-1743.528,-82.35314;Inherit;False;50;Custom_W;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;71;-81.90923,117.1612;Inherit;True;Dissolve;-1;;1;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;84;-721.9093,373.1612;Inherit;False;65;custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;87;-529.9092,309.1612;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;74;-1073.909,85.16122;Inherit;True;Property;_Dissolve;Dissolve;19;0;Create;True;0;0;0;False;0;False;-1;None;ad18c0a40da84554c8ef66c4818f1ce3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;88;314.1561,98.80603;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;85;-356.9092,247.1612;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;86;-714.9093,186.1612;Inherit;False;Property;_Dissolve_scale;Dissolve_scale;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;75;-1743.528,61.64685;Inherit;False;0;74;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;40;-1640.158,1474.378;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;82;-929.9092,277.1612;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;89;-522.6289,456.1204;Inherit;False;Property;_Dissolve_soft;Dissolve_soft;23;0;Create;True;0;0;0;False;0;False;1;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;29;-1645.08,1144.091;Inherit;True;Property;_Mask;Mask;17;0;Create;True;0;0;0;False;0;False;-1;None;2e9606ebbb0a5904f87d3c20aaa61ca5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;92;-1288.299,1190.568;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-1481.299,1344.568;Inherit;False;Property;_Mask_power;Mask_power;18;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
WireConnection;30;0;31;0
WireConnection;30;1;28;0
WireConnection;30;2;32;1
WireConnection;32;1;60;0
WireConnection;0;2;30;0
WireConnection;0;9;88;0
WireConnection;0;11;43;0
WireConnection;67;1;63;0
WireConnection;67;2;68;0
WireConnection;60;0;67;0
WireConnection;60;1;33;0
WireConnection;63;0;70;0
WireConnection;63;1;69;0
WireConnection;4;0;8;0
WireConnection;4;1;9;0
WireConnection;4;2;10;0
WireConnection;5;0;4;0
WireConnection;5;1;39;0
WireConnection;5;2;92;0
WireConnection;5;3;31;4
WireConnection;2;1;24;0
WireConnection;3;1;26;0
WireConnection;9;0;2;1
WireConnection;10;0;3;1
WireConnection;24;0;55;0
WireConnection;24;2;25;0
WireConnection;25;0;14;0
WireConnection;25;1;15;0
WireConnection;26;0;56;0
WireConnection;26;2;27;0
WireConnection;39;0;6;0
WireConnection;39;1;42;0
WireConnection;39;2;64;0
WireConnection;42;0;6;0
WireConnection;42;1;40;1
WireConnection;55;0;54;0
WireConnection;55;1;20;0
WireConnection;27;0;16;0
WireConnection;27;1;17;0
WireConnection;56;0;21;0
WireConnection;56;1;57;0
WireConnection;44;0;46;0
WireConnection;44;1;45;0
WireConnection;44;2;64;0
WireConnection;45;0;40;2
WireConnection;45;1;46;0
WireConnection;58;1;40;3
WireConnection;58;2;66;0
WireConnection;50;0;58;0
WireConnection;65;0;41;0
WireConnection;51;0;40;4
WireConnection;47;0;44;0
WireConnection;47;1;48;0
WireConnection;47;2;59;1
WireConnection;43;0;5;0
WireConnection;43;1;47;0
WireConnection;37;0;35;0
WireConnection;37;1;36;0
WireConnection;33;0;34;0
WireConnection;33;2;37;0
WireConnection;1;1;22;0
WireConnection;22;0;52;0
WireConnection;22;2;23;0
WireConnection;23;0;12;0
WireConnection;23;1;13;0
WireConnection;52;0;49;0
WireConnection;52;1;19;0
WireConnection;8;0;1;1
WireConnection;77;0;79;0
WireConnection;77;2;78;0
WireConnection;78;0;76;0
WireConnection;78;1;73;0
WireConnection;79;0;81;0
WireConnection;79;1;75;0
WireConnection;71;1;74;1
WireConnection;71;2;85;0
WireConnection;71;3;89;0
WireConnection;87;0;86;0
WireConnection;87;1;82;1
WireConnection;74;1;77;0
WireConnection;88;0;32;1
WireConnection;88;1;71;0
WireConnection;85;0;86;0
WireConnection;85;1;87;0
WireConnection;85;2;84;0
WireConnection;92;0;29;1
WireConnection;92;1;91;0
ASEEND*/
//CHKSM=1860C8BDE512D3394ECEA7AF6E55E6CD1D05474A