// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/FX_2"
{
	Properties
	{
		_OutLineColor("OutLineColor", Color) = (0,0,0,0)
		_OutLineWidth("OutLineWidth", Range( 0 , 0.1)) = 0
		[HDR]_Color0("Color 0", Color) = (1,1,1,1)
		[HDR]_Color1("Color 1", Color) = (0,0,0,0)
		_Color3("Color 3", Color) = (0,0,0,0)
		_2_shadow_width("2_shadow_width", Range( 0 , 1)) = 0.34
		_3_shadow_width("3_shadow_width", Range( 0 , 2)) = 0.4146928
		_Main_tex("Main_tex", 2D) = "white" {}
		_Emission_tex("Emission_tex", 2D) = "white" {}
		[HDR]_Emission_color("Emission_color", Color) = (1,1,1,1)
		_Emission_scale("Emission_scale", Float) = 0
		_Emission_speed_U("Emission_speed_U", Float) = 0
		_Emission_speed_V("Emission_speed_V", Float) = 0
		_Mask_tex("Mask_tex", 2D) = "white" {}
		_Noise_tex("Noise_tex", 2D) = "white" {}
		_Noise_scale("Noise_scale", Float) = 0
		_Nosie_speed_U("Nosie_speed_U", Float) = 0
		_Noise_speed_V("Noise_speed_V", Float) = 0
		[NoScaleOffset]_Coloe_tex("Coloe_tex", 2D) = "white" {}
		_Color_tex("Color_tex", Vector) = (1,1,0,0)
		_Color_speed_U("Color_speed_U", Float) = 0
		_Color_speed_V("Color_speed_V", Float) = 0
		_Coloe_desatruate("Coloe_desatruate", Float) = 0
		_Color_scale("Color_scale", Float) = 0
		[Enum(OFF,0,ON,1)]_Mutply_Base_tex("Mutply_Base_tex", Float) = 0
		[Enum(OFF,0,ON,1)]_Fresnel_Switch("Fresnel_Switch", Float) = 0
		[HDR]_Fresnel_color("Fresnel_color", Color) = (1,1,1,0)
		_Fresnel_width("Fresnel_width", Range( 0.01 , 10)) = 10
		_Fresnel_mask_tex("Fresnel_mask_tex", 2D) = "white" {}
		_Fresnel_mask_speed_U("Fresnel_mask_speed_U", Float) = 0
		_Fresnel_mask_speed_V("Fresnel_mask_speed_V", Float) = 0
		_Screen_emissive("Screen_emissive", 2D) = "white" {}
		_Screen_emissive_control("Screen_emissive_control", Vector) = (0,0,0,0)
		[HDR]_Screen_emissive_color("Screen_emissive_color", Color) = (0,0,0,0)
		[Enum(OFF,0,ON,1)]_Use_Screen_emissive("Use_Screen_emissive", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ }
		Cull Front
		CGPROGRAM
		#pragma target 3.0
		#pragma surface outlineSurf Outline nofog  keepalpha noshadow noambient novertexlights nolightmap nodynlightmap nodirlightmap nometa noforwardadd vertex:outlineVertexDataFunc 
		
		void outlineVertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float outlineVar = _OutLineWidth;
			v.vertex.xyz += ( v.normal * outlineVar );
		}
		inline half4 LightingOutline( SurfaceOutput s, half3 lightDir, half atten ) { return half4 ( 0,0,0, s.Alpha); }
		void outlineSurf( Input i, inout SurfaceOutput o )
		{
			o.Emission = _OutLineColor.rgb;
		}
		ENDCG
		

		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGINCLUDE
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
			float3 worldNormal;
			float3 worldPos;
			float3 viewDir;
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

		uniform sampler2D _Emission_tex;
		uniform float _Emission_speed_U;
		uniform float _Emission_speed_V;
		uniform float4 _Emission_tex_ST;
		uniform sampler2D _Noise_tex;
		uniform float _Nosie_speed_U;
		uniform float _Noise_speed_V;
		uniform float _Noise_scale;
		uniform float4 _Emission_color;
		uniform sampler2D _Mask_tex;
		uniform float4 _Mask_tex_ST;
		uniform sampler2D _Coloe_tex;
		uniform float _Color_speed_U;
		uniform float _Color_speed_V;
		uniform float4 _Color_tex;
		uniform float _Coloe_desatruate;
		uniform float _Color_scale;
		uniform float _Emission_scale;
		uniform sampler2D _Main_tex;
		uniform float4 _Main_tex_ST;
		uniform float _Mutply_Base_tex;
		uniform float4 _Color1;
		uniform float4 _Color0;
		uniform float _2_shadow_width;
		uniform float _3_shadow_width;
		uniform float4 _Color3;
		uniform float _Fresnel_width;
		uniform float4 _Fresnel_color;
		uniform sampler2D _Fresnel_mask_tex;
		uniform float _Fresnel_mask_speed_U;
		uniform float _Fresnel_mask_speed_V;
		uniform float4 _Fresnel_mask_tex_ST;
		uniform float _Fresnel_Switch;
		uniform sampler2D _Screen_emissive;
		uniform float4 _Screen_emissive_control;
		uniform float4 _Screen_emissive_color;
		uniform float _Use_Screen_emissive;
		uniform float4 _OutLineColor;
		uniform float _OutLineWidth;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			v.vertex.xyz += 0;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 appendResult63 = (float2(_Emission_speed_U , _Emission_speed_V));
			float2 uv_Emission_tex = i.uv_texcoord * _Emission_tex_ST.xy + _Emission_tex_ST.zw;
			float2 panner59 = ( 1.0 * _Time.y * appendResult63 + uv_Emission_tex);
			float2 appendResult68 = (float2(_Nosie_speed_U , _Noise_speed_V));
			float2 panner65 = ( 1.0 * _Time.y * appendResult68 + uv_Emission_tex);
			float2 uv_Mask_tex = i.uv_texcoord * _Mask_tex_ST.xy + _Mask_tex_ST.zw;
			float4 tex2DNode58 = tex2D( _Mask_tex, uv_Mask_tex );
			float2 appendResult76 = (float2(_Color_speed_U , _Color_speed_V));
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 panner77 = ( 1.0 * _Time.y * appendResult76 + ( ( (ase_screenPosNorm).xy * (_Color_tex).xy ) + (_Color_tex).zw ));
			float3 desaturateInitialColor82 = tex2D( _Coloe_tex, panner77 ).rgb;
			float desaturateDot82 = dot( desaturateInitialColor82, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar82 = lerp( desaturateInitialColor82, desaturateDot82.xxx, _Coloe_desatruate );
			float4 temp_output_36_0 = ( ( ( tex2D( _Emission_tex, ( panner59 + ( tex2D( _Noise_tex, panner65 ).r * _Noise_scale ) ) ) * _Emission_color * tex2DNode58.r ) + float4( ( desaturateVar82 * _Color_scale * tex2DNode58.r ) , 0.0 ) ) * _Emission_scale );
			float2 uv_Main_tex = i.uv_texcoord * _Main_tex_ST.xy + _Main_tex_ST.zw;
			float4 tex2DNode14 = tex2D( _Main_tex, uv_Main_tex );
			float4 lerpResult90 = lerp( temp_output_36_0 , ( temp_output_36_0 * ( tex2DNode58.r * tex2DNode14 ) ) , _Mutply_Base_tex);
			float3 ase_worldNormal = i.worldNormal;
			float3 ase_worldPos = i.worldPos;
			#if defined(LIGHTMAP_ON) && UNITY_VERSION < 560 //aseld
			float3 ase_worldlightDir = 0;
			#else //aseld
			float3 ase_worldlightDir = normalize( UnityWorldSpaceLightDir( ase_worldPos ) );
			#endif //aseld
			float dotResult3 = dot( ase_worldNormal , ase_worldlightDir );
			float temp_output_20_0 = step( dotResult3 , ( _2_shadow_width - _3_shadow_width ) );
			float4 lerpResult10 = lerp( _Color1 , _Color0 , ( saturate( ( 1.0 - step( dotResult3 , _2_shadow_width ) ) ) - temp_output_20_0 ));
			float4 temp_output_15_0 = ( tex2DNode14 * ( lerpResult10 + ( temp_output_20_0 * _Color3 ) ) );
			float dotResult40 = dot( i.viewDir , ase_worldNormal );
			float temp_output_51_0 = ( 1.0 - dotResult40 );
			float2 appendResult98 = (float2(_Fresnel_mask_speed_U , _Fresnel_mask_speed_V));
			float2 uv_Fresnel_mask_tex = i.uv_texcoord * _Fresnel_mask_tex_ST.xy + _Fresnel_mask_tex_ST.zw;
			float2 panner99 = ( 1.0 * _Time.y * appendResult98 + uv_Fresnel_mask_tex);
			float4 lerpResult54 = lerp( temp_output_15_0 , ( temp_output_15_0 + ( saturate( pow( temp_output_51_0 , _Fresnel_width ) ) * _Fresnel_color * tex2D( _Fresnel_mask_tex, panner99 ).r ) ) , _Fresnel_Switch);
			float2 appendResult116 = (float2(_Screen_emissive_control.x , _Screen_emissive_control.y));
			float2 appendResult119 = (float2(_Screen_emissive_control.z , _Screen_emissive_control.w));
			float4 Screen_emissive123 = ( tex2D( _Screen_emissive, ( ( (ase_screenPosNorm).xy * appendResult116 ) + ( appendResult119 * _Time.y ) ) ) * _Screen_emissive_color * temp_output_51_0 );
			float4 lerpResult127 = lerp( float4( 0,0,0,0 ) , Screen_emissive123 , _Use_Screen_emissive);
			c.rgb = ( lerpResult90 + lerpResult54 + lerpResult127 ).rgb;
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
		CGPROGRAM
		#pragma surface surf StandardCustomLighting keepalpha fullforwardshadows vertex:vertexDataFunc 

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
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				float4 screenPos : TEXCOORD3;
				float3 worldNormal : TEXCOORD4;
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
				o.worldNormal = worldNormal;
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				o.screenPos = ComputeScreenPos( o.pos );
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
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.viewDir = worldViewDir;
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = IN.worldNormal;
				surfIN.screenPos = IN.screenPos;
				SurfaceOutputCustomLightingCustom o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutputCustomLightingCustom, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18900
0;678;1667;701;2400.575;-1786.914;1.691679;True;True
Node;AmplifyShaderEditor.CommentaryNode;101;-2534.558,-494.6275;Inherit;False;3105.146;1200.085;Emission;42;66;67;68;64;73;62;74;61;65;71;63;60;69;76;77;59;72;70;79;83;81;58;87;34;82;85;57;84;37;92;36;91;93;90;102;103;104;107;109;110;122;128;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;38;-2316.88,992.4462;Inherit;False;2404.722;1387.057;rendering;31;1;2;8;3;7;24;9;25;30;20;33;27;32;31;28;10;29;14;15;53;111;112;114;115;116;117;118;120;123;125;126;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-2484.558,189.8313;Inherit;False;Property;_Noise_speed_V;Noise_speed_V;17;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;66;-2484.558,111.8313;Inherit;False;Property;_Nosie_speed_U;Nosie_speed_U;16;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;102;-2438.093,271.6481;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;104;-2470.167,464.7768;Inherit;False;Property;_Color_tex;Color_tex;19;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldNormalVector;1;-2319.678,1126.472;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;107;-2226.167,383.7768;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldSpaceLightDirHlpNode;2;-2324.933,1273.188;Inherit;False;False;1;0;FLOAT;0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;64;-2394.558,-25.1687;Inherit;False;0;34;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;68;-2254.558,153.8313;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;103;-2223.167,275.7768;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;62;-1949.44,-203.3735;Inherit;False;Property;_Emission_speed_V;Emission_speed_V;12;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;61;-1949.44,-281.3735;Inherit;False;Property;_Emission_speed_U;Emission_speed_U;11;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-2308.878,1447.851;Inherit;False;Property;_2_shadow_width;2_shadow_width;5;0;Create;True;0;0;0;False;0;False;0.34;0.34;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;108;-1988.167,339.7768;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;65;-2042.557,-20.1687;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-1925.436,535.4578;Inherit;False;Property;_Color_speed_U;Color_speed_U;20;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-1925.436,613.4578;Inherit;False;Property;_Color_speed_V;Color_speed_V;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;109;-2228.167,460.7768;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;3;-2047.476,1166.988;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;115;-1914.516,2181.677;Inherit;False;Property;_Screen_emissive_control;Screen_emissive_control;32;0;Create;True;0;0;0;False;0;False;0,0,0,0;10,10,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;7;-1632.598,1463.697;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;71;-1707.67,147.0592;Inherit;False;Property;_Noise_scale;Noise_scale;15;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;110;-1830.167,337.7768;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;63;-1719.44,-239.3735;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;112;-1852.024,2013.577;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;24;-2308.667,1525.423;Inherit;False;Property;_3_shadow_width;3_shadow_width;6;0;Create;True;0;0;0;False;0;False;0.4146928;0.4146928;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;60;-1859.44,-418.3735;Inherit;False;0;34;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;76;-1695.436,577.4578;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;69;-1839.309,-49.71256;Inherit;True;Property;_Noise_tex;Noise_tex;14;0;Create;True;0;0;0;False;0;False;-1;None;3fb99cfd03db4d3429399e7aaf7ab0bd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;116;-1664.264,2209.601;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;25;-1969.884,1567.672;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;77;-1668.435,379.4578;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-1468.67,-15.94075;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;114;-1642.497,2013.413;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;9;-1495.13,1465.124;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;50;-1462.286,2434.103;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;121;-1681.264,2402.601;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;119;-1652.264,2303.601;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldNormalVector;49;-1462.286,2595.448;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.PannerNode;59;-1507.44,-413.3735;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;117;-1402.264,2016.601;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StepOpNode;20;-1643.142,1565.165;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-1468.264,2289.601;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;30;-1334.09,1465.694;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;79;-1465.187,349.9138;Inherit;True;Property;_Coloe_tex;Coloe_tex;18;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;83;-1319.435,539.5937;Inherit;False;Property;_Coloe_desatruate;Coloe_desatruate;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;95;-1546.776,3088.974;Inherit;False;Property;_Fresnel_mask_speed_V;Fresnel_mask_speed_V;30;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;70;-1274.423,-417.5427;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;96;-1546.776,3010.974;Inherit;False;Property;_Fresnel_mask_speed_U;Fresnel_mask_speed_U;29;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;40;-1250.871,2440.792;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;118;-1234.264,2014.601;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;32;-1552.83,1196.468;Inherit;False;Property;_Color0;Color 0;2;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0.6211448,1.414214,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;34;-991.3704,-444.6275;Inherit;True;Property;_Emission_tex;Emission_tex;8;0;Create;True;0;0;0;False;0;False;-1;None;3fb99cfd03db4d3429399e7aaf7ab0bd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;33;-1183.068,1466.502;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;87;-866.561,500.0607;Inherit;False;Property;_Color_scale;Color_scale;23;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;97;-1456.776,2873.974;Inherit;False;0;94;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;98;-1316.776,3052.974;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;51;-1118.429,2441.151;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;82;-1034.435,363.5936;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;31;-1570.486,1023.665;Inherit;False;Property;_Color1;Color 1;3;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0.1406847,0.3949999,0.8060851,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;81;-1034.386,-232.942;Inherit;False;Property;_Emission_color;Emission_color;9;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0.2993379,2,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;58;-1193.884,-3.219257;Inherit;True;Property;_Mask_tex;Mask_tex;13;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;27;-1631.04,1795.619;Inherit;False;Property;_Color3;Color 3;4;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;44;-1452.209,2751.26;Inherit;False;Property;_Fresnel_width;Fresnel_width;27;0;Create;True;0;0;0;False;0;False;10;3.33;0.01;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-1328.279,1676.873;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;125;-949.7796,2183.237;Inherit;False;Property;_Screen_emissive_color;Screen_emissive_color;33;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;111;-1003.777,1981.833;Inherit;True;Property;_Screen_emissive;Screen_emissive;31;0;Create;True;0;0;0;False;0;False;-1;None;3fb99cfd03db4d3429399e7aaf7ab0bd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;57;-599.5291,-439.0653;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;85;-620.5244,384.7223;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PannerNode;99;-1104.775,2878.974;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;46;-908.7457,2447.836;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;10;-993.3241,1322.975;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;29;-598.7433,1564.478;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;14;-781.0144,1117.396;Inherit;True;Property;_Main_tex;Main_tex;7;0;Create;True;0;0;0;False;0;False;-1;None;a30f071359604574384424e506b2d4cd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;94;-896.2012,2849.886;Inherit;True;Property;_Fresnel_mask_tex;Fresnel_mask_tex;28;0;Create;True;0;0;0;False;0;False;-1;None;3fb99cfd03db4d3429399e7aaf7ab0bd;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;47;-884.7455,2671.838;Inherit;False;Property;_Fresnel_color;Fresnel_color;26;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,0;1.050916,1.609509,3.776172,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;126;-671.8706,2009.282;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;84;-380.1384,-427.2103;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;37;-305.0218,-248.811;Inherit;False;Property;_Emission_scale;Emission_scale;10;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;52;-654.4376,2432.226;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;92;-227.5972,336.7949;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-56.0376,-426.715;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;123;-533.6932,2005.543;Inherit;False;Screen_emissive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-397.8441,1529.172;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-419.4604,2439.3;Inherit;True;3;3;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;128;335.0126,319.58;Inherit;False;Property;_Use_Screen_emissive;Use_Screen_emissive;34;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;122;370.886,180.2936;Inherit;False;123;Screen_emissive;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;91;82.91239,208.2682;Inherit;False;Property;_Mutply_Base_tex;Mutply_Base_tex;24;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-8.748291,1747.285;Inherit;False;Property;_Fresnel_Switch;Fresnel_Switch;25;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;53;-56.10597,1612.166;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;93;60.60315,-165.0024;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;17;636.5505,908.4791;Inherit;False;Property;_OutLineWidth;OutLineWidth;1;0;Create;True;0;0;0;False;0;False;0;0.04;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;54;212.6373,1538.77;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;18;681.981,716.2175;Inherit;False;Property;_OutLineColor;OutLineColor;0;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.8160377,0.9729104,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;127;610.0126,200.58;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;90;305.5881,-259.1696;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.OutlineNode;19;926.2991,730.5391;Inherit;False;0;True;None;0;0;Front;3;0;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;100;737.1013,85.23038;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1009.549,-187.6789;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;FX/FX_2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;14;all;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;107;0;104;0
WireConnection;68;0;66;0
WireConnection;68;1;67;0
WireConnection;103;0;102;0
WireConnection;108;0;103;0
WireConnection;108;1;107;0
WireConnection;65;0;64;0
WireConnection;65;2;68;0
WireConnection;109;0;104;0
WireConnection;3;0;1;0
WireConnection;3;1;2;0
WireConnection;7;0;3;0
WireConnection;7;1;8;0
WireConnection;110;0;108;0
WireConnection;110;1;109;0
WireConnection;63;0;61;0
WireConnection;63;1;62;0
WireConnection;76;0;74;0
WireConnection;76;1;73;0
WireConnection;69;1;65;0
WireConnection;116;0;115;1
WireConnection;116;1;115;2
WireConnection;25;0;8;0
WireConnection;25;1;24;0
WireConnection;77;0;110;0
WireConnection;77;2;76;0
WireConnection;72;0;69;1
WireConnection;72;1;71;0
WireConnection;114;0;112;0
WireConnection;9;0;7;0
WireConnection;119;0;115;3
WireConnection;119;1;115;4
WireConnection;59;0;60;0
WireConnection;59;2;63;0
WireConnection;117;0;114;0
WireConnection;117;1;116;0
WireConnection;20;0;3;0
WireConnection;20;1;25;0
WireConnection;120;0;119;0
WireConnection;120;1;121;0
WireConnection;30;0;9;0
WireConnection;79;1;77;0
WireConnection;70;0;59;0
WireConnection;70;1;72;0
WireConnection;40;0;50;0
WireConnection;40;1;49;0
WireConnection;118;0;117;0
WireConnection;118;1;120;0
WireConnection;34;1;70;0
WireConnection;33;0;30;0
WireConnection;33;1;20;0
WireConnection;98;0;96;0
WireConnection;98;1;95;0
WireConnection;51;0;40;0
WireConnection;82;0;79;0
WireConnection;82;1;83;0
WireConnection;28;0;20;0
WireConnection;28;1;27;0
WireConnection;111;1;118;0
WireConnection;57;0;34;0
WireConnection;57;1;81;0
WireConnection;57;2;58;1
WireConnection;85;0;82;0
WireConnection;85;1;87;0
WireConnection;85;2;58;1
WireConnection;99;0;97;0
WireConnection;99;2;98;0
WireConnection;46;0;51;0
WireConnection;46;1;44;0
WireConnection;10;0;31;0
WireConnection;10;1;32;0
WireConnection;10;2;33;0
WireConnection;29;0;10;0
WireConnection;29;1;28;0
WireConnection;94;1;99;0
WireConnection;126;0;111;0
WireConnection;126;1;125;0
WireConnection;126;2;51;0
WireConnection;84;0;57;0
WireConnection;84;1;85;0
WireConnection;52;0;46;0
WireConnection;92;0;58;1
WireConnection;92;1;14;0
WireConnection;36;0;84;0
WireConnection;36;1;37;0
WireConnection;123;0;126;0
WireConnection;15;0;14;0
WireConnection;15;1;29;0
WireConnection;48;0;52;0
WireConnection;48;1;47;0
WireConnection;48;2;94;1
WireConnection;53;0;15;0
WireConnection;53;1;48;0
WireConnection;93;0;36;0
WireConnection;93;1;92;0
WireConnection;54;0;15;0
WireConnection;54;1;53;0
WireConnection;54;2;56;0
WireConnection;127;1;122;0
WireConnection;127;2;128;0
WireConnection;90;0;36;0
WireConnection;90;1;93;0
WireConnection;90;2;91;0
WireConnection;19;0;18;0
WireConnection;19;1;17;0
WireConnection;100;0;90;0
WireConnection;100;1;54;0
WireConnection;100;2;127;0
WireConnection;0;13;100;0
WireConnection;0;11;19;0
ASEEND*/
//CHKSM=2A654DFB322BFE857B320630243F369DFF6A8067