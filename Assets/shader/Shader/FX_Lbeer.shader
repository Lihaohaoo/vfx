// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/FX_Lbeer"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Cull_Mode("Cull_Mode", Float) = 0
		[Enum(Off,2,On,8)]_Depth("Depth", Float) = 2
		[Enum(Add,1,Blend,10)]_AddBlend("Add/Blend", Float) = 10
		[Enum(Off,0,On,1)]_Custom("Custom", Float) = 0
		_Opacity_power("Opacity_power", Float) = 1
		_Opacity_scale("Opacity_scale", Float) = 1
		[Enum(Off,0,On,1)]_Use_Depth_fade("Use_Depth_fade", Float) = 0
		_Depth_fade("Depth_fade", Float) = 0
		[HDR]_Main_color("Main_color", Color) = (1,1,1,1)
		_Main_control("Main_control", Vector) = (1,1,1,1)
		[NoScaleOffset]_Main_tex("Main_tex", 2D) = "white" {}
		_Main_Tex("Main_Tex", Vector) = (1,1,0,0)
		_Main_Rotator("Main_Rotator", Float) = 0
		[KeywordEnum(R,G,B,A)] _Main_Split("Main_Split", Float) = 0
		[Enum(Off,0,On,1)]_Use_base_color("Use_base_color", Float) = 0
		[Enum(Off,0,On,1)]_Main_tex_clamp("Main_tex_clamp", Float) = 0
		[Enum(Off,0,On,1)]_Main_tex_radial("Main_tex_radial", Float) = 0
		[Enum(U,0,V,1)]_Main_UV("Main_UV", Float) = 0
		_Main_offset_scale("Main_offset_scale", Float) = 0
		[Enum(OFF,0,ON,1)]_Main_screen_UV("Main_screen_UV", Float) = 0
		_Main_speed_U("Main_speed_U", Float) = 0
		_Main_speed_V("Main_speed_V", Float) = 0
		[NoScaleOffset]_Mask_tex("Mask_tex", 2D) = "white" {}
		[KeywordEnum(R,G,B,A)] _Mask_Split("Mask_Split", Float) = 0
		_Mask_Tex("Mask_Tex", Vector) = (1,1,0,0)
		_Mask_Rotator("Mask_Rotator", Float) = 0
		[Enum(Off,0,On,1)]_Mask_tex_clamp("Mask_tex_clamp", Float) = 0
		[Enum(Off,0,On,1)]_Mask_tex_radial("Mask_tex_radial", Float) = 0
		[Enum(U,0,V,1)]_Mask_UV("Mask_UV", Float) = 0
		_Mask_offset_scale("Mask_offset_scale", Float) = 0
		[Enum(OFF,0,ON,1)]_Mask_screen_UV("Mask_screen_UV", Float) = 0
		_Mask_speed_U("Mask_speed_U", Float) = 0
		_Mask_speed_V("Mask_speed_V", Float) = 0
		[NoScaleOffset]_Noise_tex("Noise_tex", 2D) = "white" {}
		_Noise_Tex("Noise_Tex", Vector) = (1,1,0,0)
		_Noise_Rotator("Noise_Rotator", Float) = 0
		_Noise_scale("Noise_scale", Float) = 0
		[Enum(OFF,0,ON,1)]_Nosie_dissolve("Nosie_dissolve", Float) = 0
		[Enum(off,0,on,1)]_Noise_gradent("Noise_gradent", Float) = 0
		[Enum(Off,0,On,1)]_Noise_tex_radial("Noise_tex_radial", Float) = 0
		[Enum(U,0,V,1)]_Noise_UV("Noise_UV", Float) = 0
		_Noisek_offset_scale("Noisek_offset_scale", Float) = 0
		[Enum(OFF,0,ON,1)]_Noise_screen_UV("Noise_screen_UV", Float) = 0
		_Noise_speed_U("Noise_speed_U", Float) = 0
		_Noise_speed_V("Noise_speed_V", Float) = 0
		[NoScaleOffset]_Dissolove_tex("Dissolove_tex", 2D) = "white" {}
		_Dissolve_Tex("Dissolve_Tex", Vector) = (1,1,0,0)
		_Dissolve_Rotator("Dissolve_Rotator", Float) = 0
		[Enum(Off,0,On,1)]_Dissove_tex_clamp("Dissove_tex_clamp", Float) = 0
		[Enum(Off,0,On,1)]_Dissolve_tex_radial("Dissolve_tex_radial", Float) = 0
		[Enum(U,0,V,1)]_Dissove_UV("Dissove_UV", Float) = 0
		_Dissolve_offset_scale("Dissolve_offset_scale", Float) = 0
		[Enum(OFF,0,ON,1)]_Dissolve_screen_UV("Dissolve_screen_UV", Float) = 0
		_Dissolve_speed_U("Dissolve_speed_U", Float) = 0
		_Dissolve_speed_V("Dissolve_speed_V", Float) = 0
		_Dissolve("Dissolve", Float) = 0
		_Dissolve_soft("Dissolve_soft", Range( 0 , 1)) = 0.5
		_Dissolve_edge("Dissolve_edge", Range( 0 , 1)) = 0
		_Edge_black_scale("Edge_black_scale", Float) = 0
		[HDR]_Dissolve_color("Dissolve_color", Color) = (0,0,0,0)
		[Enum(Off,0,On,1)]_Use_dissolve_gradent("Use_dissolve_gradent", Float) = 0
		[NoScaleOffset]_Dissolvegradent("Dissolve-gradent", 2D) = "white" {}
		_Dissolve_gradent_Tex("Dissolve_gradent_Tex", Vector) = (1,1,0,0)
		_FixedPower1("Dissolve_gradent_width", Range( 0 , 1)) = 0.5
		_Dissolve_gradent_Rotator("Dissolve_gradent_Rotator", Float) = 0
		[NoScaleOffset]_Gradent_tex("Gradent_tex", 2D) = "white" {}
		_Gradent_Tex("Gradent_Tex", Vector) = (1,1,0,0)
		[Enum(Off,0,On,1)]_Gradent_tex_radial("Gradent_tex_radial", Float) = 0
		_Gradent_Rotator("Gradent_Rotator", Float) = 0
		_Gradent_speed_U("Gradent_speed_U", Float) = 0
		_Gradent_speed_V("Gradent_speed_V", Float) = 0
		_Desatruate("Desatruate", Float) = 0
		[NoScaleOffset]_Vertex_tex("Vertex_tex", 2D) = "white" {}
		_Vertex_Tex("Vertex_Tex", Vector) = (1,1,0,0)
		_vertex_mask("vertex_mask", 2D) = "white" {}
		_Vertex_Rotator("Vertex_Rotator", Float) = 0
		[Enum(Off,0,On,1)]_Vertex_tex_radial("Vertex_tex_radial", Float) = 0
		[Enum(U,0,V,1)]_Vertex_UV("Vertex_UV", Float) = 0
		_Vertex_offset_scale("Vertex_offset_scale", Float) = 0
		[Enum(OFF,0,ON,1)]_Vertex_screen_UV("Vertex_screen_UV", Float) = 0
		_Vertex_scale("Vertex_scale", Float) = 0
		_Vertex_speed_U("Vertex_speed_U", Float) = 0
		_Vertex_speed_V("Vertex_speed_V", Float) = 0
		[Enum(Off,0,On,1)]_Fresnel_one_minus("Fresnel_one_minus", Float) = 0
		[Enum(Off,0,On,1)]_Use_fresnel_color("Use_fresnel_color", Float) = 0
		[Enum(Off,0,On,1)]_Use_fresnel_opacity("Use_fresnel_opacity", Float) = 0
		_Fresnelpower("Fresnel+power", Float) = 1
		[HDR]_Fresnel_color("Fresnel_color", Color) = (0,0,0,0)
		[Enum(Defult,0,On,1,Off,2)]_Z_write_mode("Z_write_mode", Float) = 0
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull [_Cull_Mode]
		ZWrite [_Z_write_mode]
		ZTest [_Depth]
		Blend SrcAlpha [_AddBlend]
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma multi_compile_local _MAIN_SPLIT_R _MAIN_SPLIT_G _MAIN_SPLIT_B _MAIN_SPLIT_A
		#pragma shader_feature_local _MASK_SPLIT_R _MASK_SPLIT_G _MASK_SPLIT_B _MASK_SPLIT_A
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float2 uv_texcoord;
			float4 screenPos;
			float4 uv3_texcoord3;
			float4 uv2_texcoord2;
			float4 vertexColor : COLOR;
			float3 worldNormal;
			float3 viewDir;
		};

		uniform float _AddBlend;
		uniform float _Cull_Mode;
		uniform float _Depth;
		uniform float _Z_write_mode;
		uniform sampler2D _Vertex_tex;
		uniform float _Vertex_speed_U;
		uniform float _Vertex_speed_V;
		uniform float _Vertex_screen_UV;
		uniform float _Vertex_offset_scale;
		uniform float _Vertex_UV;
		uniform float _Vertex_tex_radial;
		uniform float _Vertex_Rotator;
		uniform float4 _Vertex_Tex;
		uniform sampler2D _vertex_mask;
		uniform float4 _vertex_mask_ST;
		uniform float _Vertex_scale;
		uniform float _Custom;
		uniform sampler2D _Main_tex;
		uniform float _Main_speed_U;
		uniform float _Main_speed_V;
		uniform float _Main_screen_UV;
		uniform float _Main_offset_scale;
		uniform float _Main_UV;
		uniform float _Main_tex_radial;
		uniform float _Main_Rotator;
		uniform float4 _Main_Tex;
		uniform float _Main_tex_clamp;
		uniform sampler2D _Noise_tex;
		uniform float _Noise_speed_U;
		uniform float _Noise_speed_V;
		uniform float _Noise_screen_UV;
		uniform float _Noisek_offset_scale;
		uniform float _Noise_UV;
		uniform float _Noise_tex_radial;
		uniform float _Noise_Rotator;
		uniform float4 _Noise_Tex;
		uniform float _Noise_scale;
		uniform float _Use_base_color;
		uniform float4 _Main_control;
		uniform float4 _Main_color;
		uniform sampler2D _Gradent_tex;
		uniform float _Gradent_speed_U;
		uniform float _Gradent_speed_V;
		uniform float4 _Gradent_tex_ST;
		uniform float _Gradent_Rotator;
		uniform float4 _Gradent_Tex;
		uniform float _Gradent_tex_radial;
		uniform float _Noise_gradent;
		uniform float _Desatruate;
		uniform float _Fresnel_one_minus;
		uniform float _Fresnelpower;
		uniform float4 _Fresnel_color;
		uniform float _Use_fresnel_color;
		uniform sampler2D _Dissolove_tex;
		uniform float _Dissolve_speed_U;
		uniform float _Dissolve_speed_V;
		uniform float _Dissolve_screen_UV;
		uniform float _Dissolve_offset_scale;
		uniform float _Dissove_UV;
		uniform float _Dissolve_tex_radial;
		uniform float _Dissolve_Rotator;
		uniform float4 _Dissolve_Tex;
		uniform float _Dissove_tex_clamp;
		uniform float _Nosie_dissolve;
		uniform sampler2D _Dissolvegradent;
		uniform float4 _Dissolove_tex_ST;
		uniform float _Dissolve_gradent_Rotator;
		uniform float4 _Dissolve_gradent_Tex;
		uniform float _FixedPower1;
		uniform float _Use_dissolve_gradent;
		uniform float _Dissolve;
		uniform float _Dissolve_soft;
		uniform float _Dissolve_edge;
		uniform float4 _Dissolve_color;
		uniform float _Edge_black_scale;
		uniform sampler2D _Mask_tex;
		uniform float _Mask_speed_U;
		uniform float _Mask_speed_V;
		uniform float _Mask_screen_UV;
		uniform float _Mask_offset_scale;
		uniform float _Mask_UV;
		uniform float _Mask_tex_radial;
		uniform float _Mask_Rotator;
		uniform float4 _Mask_Tex;
		uniform float _Mask_tex_clamp;
		uniform float _Opacity_power;
		uniform float _Opacity_scale;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _Depth_fade;
		uniform float _Use_Depth_fade;
		uniform float _Use_fresnel_opacity;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult392 = (float2(_Vertex_speed_U , _Vertex_speed_V));
			float4 ase_screenPos = ComputeScreenPos( UnityObjectToClipPos( v.vertex ) );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 lerpResult40_g89 = lerp( v.texcoord.xy , (ase_screenPosNorm).xy , _Vertex_screen_UV);
			float temp_output_19_0_g89 = (saturate( lerpResult40_g89 )).x;
			float temp_output_31_0_g89 = _Vertex_offset_scale;
			float temp_output_26_0_g89 = (lerpResult40_g89).y;
			float2 appendResult20_g89 = (float2(temp_output_19_0_g89 , ( ( temp_output_19_0_g89 * temp_output_31_0_g89 ) + temp_output_26_0_g89 )));
			float2 appendResult28_g89 = (float2(( temp_output_19_0_g89 + ( temp_output_26_0_g89 * temp_output_31_0_g89 ) ) , temp_output_26_0_g89));
			float2 lerpResult29_g89 = lerp( appendResult20_g89 , appendResult28_g89 , _Vertex_UV);
			float2 uv_TexCoord30_g90 = v.texcoord.xy * float2( 2,2 );
			float2 temp_output_25_0_g90 = ( uv_TexCoord30_g90 - float2( 1,1 ) );
			float2 appendResult21_g90 = (float2(frac( ( atan2( (temp_output_25_0_g90).x , (temp_output_25_0_g90).y ) / 6.28318548202515 ) ) , length( temp_output_25_0_g90 )));
			float temp_output_44_0_g90 = (saturate( appendResult21_g90 )).x;
			float temp_output_62_0_g90 = _Vertex_offset_scale;
			float temp_output_45_0_g90 = (appendResult21_g90).y;
			float2 appendResult49_g90 = (float2(temp_output_44_0_g90 , ( ( temp_output_44_0_g90 * temp_output_62_0_g90 ) + temp_output_45_0_g90 )));
			float2 appendResult50_g90 = (float2(( temp_output_44_0_g90 + ( temp_output_45_0_g90 * temp_output_62_0_g90 ) ) , temp_output_45_0_g90));
			float2 lerpResult58_g90 = lerp( appendResult49_g90 , appendResult50_g90 , _Vertex_UV);
			float2 lerpResult505 = lerp( lerpResult29_g89 , lerpResult58_g90 , _Vertex_tex_radial);
			float cos384 = cos( ( ( _Vertex_Rotator * UNITY_PI ) / 180.0 ) );
			float sin384 = sin( ( ( _Vertex_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator384 = mul( lerpResult505 - float2( 0.5,0.5 ) , float2x2( cos384 , -sin384 , sin384 , cos384 )) + float2( 0.5,0.5 );
			float2 panner396 = ( 1.0 * _Time.y * appendResult392 + ( ( rotator384 * (_Vertex_Tex).xy ) + (_Vertex_Tex).zw ));
			float2 uv_vertex_mask = v.texcoord * _vertex_mask_ST.xy + _vertex_mask_ST.zw;
			float Custom2_z315 = v.texcoord2.z;
			float Use_custom327 = _Custom;
			float lerpResult400 = lerp( _Vertex_scale , ( _Vertex_scale + Custom2_z315 ) , Use_custom327);
			float3 ase_vertexNormal = v.normal.xyz;
			float3 Vertexoffset403 = ( ( tex2Dlod( _Vertex_tex, float4( panner396, 0, 0.0) ).r * tex2Dlod( _vertex_mask, float4( uv_vertex_mask, 0, 0.0) ).r ) * lerpResult400 * ase_vertexNormal );
			v.vertex.xyz += Vertexoffset403;
			v.vertex.w = 1;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 appendResult15 = (float2(_Main_speed_U , _Main_speed_V));
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 lerpResult40_g100 = lerp( i.uv_texcoord , (ase_screenPosNorm).xy , _Main_screen_UV);
			float temp_output_19_0_g100 = (saturate( lerpResult40_g100 )).x;
			float Custom2_w316 = i.uv3_texcoord3.w;
			float Use_custom327 = _Custom;
			float lerpResult534 = lerp( _Main_offset_scale , ( _Main_offset_scale + Custom2_w316 ) , Use_custom327);
			float temp_output_31_0_g100 = lerpResult534;
			float temp_output_26_0_g100 = (lerpResult40_g100).y;
			float2 appendResult20_g100 = (float2(temp_output_19_0_g100 , ( ( temp_output_19_0_g100 * temp_output_31_0_g100 ) + temp_output_26_0_g100 )));
			float2 appendResult28_g100 = (float2(( temp_output_19_0_g100 + ( temp_output_26_0_g100 * temp_output_31_0_g100 ) ) , temp_output_26_0_g100));
			float2 lerpResult29_g100 = lerp( appendResult20_g100 , appendResult28_g100 , _Main_UV);
			float2 uv_TexCoord30_g99 = i.uv_texcoord * float2( 2,2 );
			float2 temp_output_25_0_g99 = ( uv_TexCoord30_g99 - float2( 1,1 ) );
			float2 appendResult21_g99 = (float2(frac( ( atan2( (temp_output_25_0_g99).x , (temp_output_25_0_g99).y ) / 6.28318548202515 ) ) , length( temp_output_25_0_g99 )));
			float temp_output_44_0_g99 = (saturate( appendResult21_g99 )).x;
			float temp_output_62_0_g99 = lerpResult534;
			float temp_output_45_0_g99 = (appendResult21_g99).y;
			float2 appendResult49_g99 = (float2(temp_output_44_0_g99 , ( ( temp_output_44_0_g99 * temp_output_62_0_g99 ) + temp_output_45_0_g99 )));
			float2 appendResult50_g99 = (float2(( temp_output_44_0_g99 + ( temp_output_45_0_g99 * temp_output_62_0_g99 ) ) , temp_output_45_0_g99));
			float2 lerpResult58_g99 = lerp( appendResult49_g99 , appendResult50_g99 , _Main_UV);
			float2 lerpResult491 = lerp( lerpResult29_g100 , lerpResult58_g99 , _Main_tex_radial);
			float cos256 = cos( ( ( _Main_Rotator * UNITY_PI ) / 180.0 ) );
			float sin256 = sin( ( ( _Main_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator256 = mul( lerpResult491 - float2( 0.5,0.5 ) , float2x2( cos256 , -sin256 , sin256 , cos256 )) + float2( 0.5,0.5 );
			float2 temp_output_61_0 = (_Main_Tex).zw;
			float2 Custom1_xy311 = (i.uv2_texcoord2).xy;
			float2 lerpResult324 = lerp( temp_output_61_0 , ( temp_output_61_0 + Custom1_xy311 ) , Use_custom327);
			float2 panner68 = ( 1.0 * _Time.y * appendResult15 + ( ( rotator256 * (_Main_Tex).xy ) + lerpResult324 ));
			float2 lerpResult85 = lerp( panner68 , saturate( panner68 ) , _Main_tex_clamp);
			float2 appendResult113 = (float2(_Noise_speed_U , _Noise_speed_V));
			float2 lerpResult40_g95 = lerp( i.uv_texcoord , (ase_screenPosNorm).xy , _Noise_screen_UV);
			float temp_output_19_0_g95 = (saturate( lerpResult40_g95 )).x;
			float temp_output_31_0_g95 = _Noisek_offset_scale;
			float temp_output_26_0_g95 = (lerpResult40_g95).y;
			float2 appendResult20_g95 = (float2(temp_output_19_0_g95 , ( ( temp_output_19_0_g95 * temp_output_31_0_g95 ) + temp_output_26_0_g95 )));
			float2 appendResult28_g95 = (float2(( temp_output_19_0_g95 + ( temp_output_26_0_g95 * temp_output_31_0_g95 ) ) , temp_output_26_0_g95));
			float2 lerpResult29_g95 = lerp( appendResult20_g95 , appendResult28_g95 , _Noise_UV);
			float2 uv_TexCoord30_g96 = i.uv_texcoord * float2( 2,2 );
			float2 temp_output_25_0_g96 = ( uv_TexCoord30_g96 - float2( 1,1 ) );
			float2 appendResult21_g96 = (float2(frac( ( atan2( (temp_output_25_0_g96).x , (temp_output_25_0_g96).y ) / 6.28318548202515 ) ) , length( temp_output_25_0_g96 )));
			float temp_output_44_0_g96 = (saturate( appendResult21_g96 )).x;
			float temp_output_62_0_g96 = _Noisek_offset_scale;
			float temp_output_45_0_g96 = (appendResult21_g96).y;
			float2 appendResult49_g96 = (float2(temp_output_44_0_g96 , ( ( temp_output_44_0_g96 * temp_output_62_0_g96 ) + temp_output_45_0_g96 )));
			float2 appendResult50_g96 = (float2(( temp_output_44_0_g96 + ( temp_output_45_0_g96 * temp_output_62_0_g96 ) ) , temp_output_45_0_g96));
			float2 lerpResult58_g96 = lerp( appendResult49_g96 , appendResult50_g96 , _Noise_UV);
			float2 lerpResult527 = lerp( lerpResult29_g95 , lerpResult58_g96 , _Noise_tex_radial);
			float cos265 = cos( ( ( _Noise_Rotator * UNITY_PI ) / 180.0 ) );
			float sin265 = sin( ( ( _Noise_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator265 = mul( lerpResult527 - float2( 0.5,0.5 ) , float2x2( cos265 , -sin265 , sin265 , cos265 )) + float2( 0.5,0.5 );
			float2 panner115 = ( 1.0 * _Time.y * appendResult113 + ( ( rotator265 * (_Noise_Tex).xy ) + (_Noise_Tex).zw ));
			float Custom1_w313 = i.uv2_texcoord2.w;
			float lerpResult336 = lerp( _Noise_scale , ( _Noise_scale + Custom1_w313 ) , Use_custom327);
			float Noise43 = ( (-0.5 + (tex2D( _Noise_tex, panner115 ).r - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) * lerpResult336 );
			float4 tex2DNode1 = tex2D( _Main_tex, ( lerpResult85 + Noise43 ) );
			#if defined(_MAIN_SPLIT_R)
				float staticSwitch169 = tex2DNode1.r;
			#elif defined(_MAIN_SPLIT_G)
				float staticSwitch169 = tex2DNode1.g;
			#elif defined(_MAIN_SPLIT_B)
				float staticSwitch169 = tex2DNode1.b;
			#elif defined(_MAIN_SPLIT_A)
				float staticSwitch169 = tex2DNode1.a;
			#else
				float staticSwitch169 = tex2DNode1.r;
			#endif
			float4 temp_cast_0 = (staticSwitch169).xxxx;
			float4 lerpResult170 = lerp( temp_cast_0 , tex2DNode1 , _Use_base_color);
			float4 temp_cast_1 = (_Main_control.x).xxxx;
			float4 lerpResult452 = lerp( ( pow( lerpResult170 , temp_cast_1 ) * _Main_control.y ) , ( lerpResult170 * _Main_control.z ) , _Main_control.w);
			float3 Color177 = ( (i.vertexColor).rgb * (_Main_color).rgb );
			float2 appendResult245 = (float2(_Gradent_speed_U , _Gradent_speed_V));
			float2 uv_Gradent_tex = i.uv_texcoord * _Gradent_tex_ST.xy + _Gradent_tex_ST.zw;
			float cos272 = cos( ( ( _Gradent_Rotator * UNITY_PI ) / 180.0 ) );
			float sin272 = sin( ( ( _Gradent_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator272 = mul( uv_Gradent_tex - float2( 0.5,0.5 ) , float2x2( cos272 , -sin272 , sin272 , cos272 )) + float2( 0.5,0.5 );
			float2 uv_TexCoord30_g75 = i.uv_texcoord * float2( 2,2 );
			float2 temp_output_25_0_g75 = ( uv_TexCoord30_g75 - float2( 1,1 ) );
			float2 appendResult21_g75 = (float2(frac( ( atan2( (temp_output_25_0_g75).x , (temp_output_25_0_g75).y ) / 6.28318548202515 ) ) , length( temp_output_25_0_g75 )));
			float4 temp_output_40_0_g75 = _Gradent_Tex;
			float2 lerpResult244 = lerp( ( ( rotator272 * (_Gradent_Tex).xy ) + (_Gradent_Tex).zw ) , ( ( appendResult21_g75 * (temp_output_40_0_g75).xy ) + (temp_output_40_0_g75).zw ) , _Gradent_tex_radial);
			float2 panner246 = ( 1.0 * _Time.y * appendResult245 + lerpResult244);
			float lerpResult446 = lerp( 0.0 , Noise43 , _Noise_gradent);
			float4 tex2DNode247 = tex2D( _Gradent_tex, ( panner246 + lerpResult446 ) );
			float3 desaturateInitialColor253 = tex2DNode247.rgb;
			float desaturateDot253 = dot( desaturateInitialColor253, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar253 = lerp( desaturateInitialColor253, desaturateDot253.xxx, _Desatruate );
			float3 Gradent251 = desaturateVar253;
			float3 ase_worldNormal = i.worldNormal;
			float dotResult280 = dot( ase_worldNormal , i.viewDir );
			float temp_output_460_0 = saturate( dotResult280 );
			float lerpResult282 = lerp( ( 1.0 - temp_output_460_0 ) , temp_output_460_0 , _Fresnel_one_minus);
			float temp_output_286_0 = saturate( pow( lerpResult282 , _Fresnelpower ) );
			float4 Fresnel_color293 = ( temp_output_286_0 * _Fresnel_color );
			float Use_fresnel_color294 = _Use_fresnel_color;
			float4 lerpResult300 = lerp( float4( 0,0,0,0 ) , Fresnel_color293 , Use_fresnel_color294);
			float2 appendResult158 = (float2(_Dissolve_speed_U , _Dissolve_speed_V));
			float2 lerpResult40_g97 = lerp( i.uv_texcoord , (ase_screenPosNorm).xy , _Dissolve_screen_UV);
			float temp_output_19_0_g97 = (saturate( lerpResult40_g97 )).x;
			float lerpResult538 = lerp( _Dissolve_offset_scale , ( _Dissolve_offset_scale + Custom2_w316 ) , Use_custom327);
			float temp_output_31_0_g97 = lerpResult538;
			float temp_output_26_0_g97 = (lerpResult40_g97).y;
			float2 appendResult20_g97 = (float2(temp_output_19_0_g97 , ( ( temp_output_19_0_g97 * temp_output_31_0_g97 ) + temp_output_26_0_g97 )));
			float2 appendResult28_g97 = (float2(( temp_output_19_0_g97 + ( temp_output_26_0_g97 * temp_output_31_0_g97 ) ) , temp_output_26_0_g97));
			float2 lerpResult29_g97 = lerp( appendResult20_g97 , appendResult28_g97 , _Dissove_UV);
			float2 uv_TexCoord30_g98 = i.uv_texcoord * float2( 2,2 );
			float2 temp_output_25_0_g98 = ( uv_TexCoord30_g98 - float2( 1,1 ) );
			float2 appendResult21_g98 = (float2(frac( ( atan2( (temp_output_25_0_g98).x , (temp_output_25_0_g98).y ) / 6.28318548202515 ) ) , length( temp_output_25_0_g98 )));
			float temp_output_44_0_g98 = (saturate( appendResult21_g98 )).x;
			float temp_output_62_0_g98 = lerpResult538;
			float temp_output_45_0_g98 = (appendResult21_g98).y;
			float2 appendResult49_g98 = (float2(temp_output_44_0_g98 , ( ( temp_output_44_0_g98 * temp_output_62_0_g98 ) + temp_output_45_0_g98 )));
			float2 appendResult50_g98 = (float2(( temp_output_44_0_g98 + ( temp_output_45_0_g98 * temp_output_62_0_g98 ) ) , temp_output_45_0_g98));
			float2 lerpResult58_g98 = lerp( appendResult49_g98 , appendResult50_g98 , _Dissove_UV);
			float2 lerpResult533 = lerp( lerpResult29_g97 , lerpResult58_g98 , _Dissolve_tex_radial);
			float cos268 = cos( ( ( _Dissolve_Rotator * UNITY_PI ) / 180.0 ) );
			float sin268 = sin( ( ( _Dissolve_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator268 = mul( lerpResult533 - float2( 0.5,0.5 ) , float2x2( cos268 , -sin268 , sin268 , cos268 )) + float2( 0.5,0.5 );
			float2 temp_output_150_0 = (_Dissolve_Tex).zw;
			float2 Custom2_xy314 = (i.uv3_texcoord3).xy;
			float2 lerpResult373 = lerp( temp_output_150_0 , ( temp_output_150_0 + Custom2_xy314 ) , Use_custom327);
			float2 panner159 = ( 1.0 * _Time.y * appendResult158 + ( ( rotator268 * (_Dissolve_Tex).xy ) + lerpResult373 ));
			float2 lerpResult162 = lerp( panner159 , saturate( panner159 ) , _Dissove_tex_clamp);
			float lerpResult409 = lerp( 0.0 , Noise43 , _Nosie_dissolve);
			float4 tex2DNode163 = tex2D( _Dissolove_tex, ( lerpResult162 + lerpResult409 ) );
			float2 uv_Dissolove_tex = i.uv_texcoord * _Dissolove_tex_ST.xy + _Dissolove_tex_ST.zw;
			float cos363 = cos( ( ( _Dissolve_gradent_Rotator * UNITY_PI ) / 180.0 ) );
			float sin363 = sin( ( ( _Dissolve_gradent_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator363 = mul( uv_Dissolove_tex - float2( 0.5,0.5 ) , float2x2( cos363 , -sin363 , sin363 , cos363 )) + float2( 0.5,0.5 );
			float lerpResult228 = lerp( tex2DNode163.r , ( tex2DNode163.r - ( 1.0 - ( tex2D( _Dissolvegradent, ( ( saturate( rotator363 ) * (_Dissolve_gradent_Tex).xy ) + (_Dissolve_gradent_Tex).zw ) ).r / saturate( ( 1.0 - _FixedPower1 ) ) ) ) ) , _Use_dissolve_gradent);
			float temp_output_1_0_g51 = lerpResult228;
			float lerpResult9_g51 = lerp( temp_output_1_0_g51 , ( 1.0 - temp_output_1_0_g51 ) , 0.0);
			float Custom1_z312 = i.uv2_texcoord2.z;
			float lerpResult331 = lerp( _Dissolve , ( _Dissolve + Custom1_z312 ) , Use_custom327);
			float temp_output_3_0_g51 = _Dissolve_soft;
			float temp_output_183_0 = saturate( ( ( ( ( lerpResult9_g51 + 1.0 ) - ( lerpResult331 * ( 1.0 + ( 1.0 - temp_output_3_0_g51 ) ) ) ) - temp_output_3_0_g51 ) / ( 1.0 - temp_output_3_0_g51 ) ) );
			float temp_output_1_0_g52 = lerpResult228;
			float lerpResult9_g52 = lerp( temp_output_1_0_g52 , ( 1.0 - temp_output_1_0_g52 ) , 0.0);
			float temp_output_3_0_g52 = _Dissolve_soft;
			float temp_output_190_0 = ( temp_output_183_0 - saturate( ( ( ( ( lerpResult9_g52 + 1.0 ) - ( ( lerpResult331 + _Dissolve_edge ) * ( 1.0 + ( 1.0 - temp_output_3_0_g52 ) ) ) ) - temp_output_3_0_g52 ) / ( 1.0 - temp_output_3_0_g52 ) ) ) );
			float4 Dissove_edge_color192 = ( temp_output_190_0 * _Dissolve_color );
			float Dissolve_edge432 = temp_output_190_0;
			float4 temp_cast_5 = (( Dissolve_edge432 * _Edge_black_scale )).xxxx;
			o.Emission = ( ( ( lerpResult452 * float4( Color177 , 0.0 ) * float4( Gradent251 , 0.0 ) ) + lerpResult300 + Dissove_edge_color192 ) - temp_cast_5 ).rgb;
			float2 appendResult129 = (float2(_Mask_speed_U , _Mask_speed_V));
			float2 lerpResult40_g94 = lerp( i.uv_texcoord , (ase_screenPosNorm).xy , _Mask_screen_UV);
			float temp_output_19_0_g94 = (saturate( lerpResult40_g94 )).x;
			float temp_output_31_0_g94 = _Mask_offset_scale;
			float temp_output_26_0_g94 = (lerpResult40_g94).y;
			float2 appendResult20_g94 = (float2(temp_output_19_0_g94 , ( ( temp_output_19_0_g94 * temp_output_31_0_g94 ) + temp_output_26_0_g94 )));
			float2 appendResult28_g94 = (float2(( temp_output_19_0_g94 + ( temp_output_26_0_g94 * temp_output_31_0_g94 ) ) , temp_output_26_0_g94));
			float2 lerpResult29_g94 = lerp( appendResult20_g94 , appendResult28_g94 , _Mask_UV);
			float2 uv_TexCoord30_g93 = i.uv_texcoord * float2( 2,2 );
			float2 temp_output_25_0_g93 = ( uv_TexCoord30_g93 - float2( 1,1 ) );
			float2 appendResult21_g93 = (float2(frac( ( atan2( (temp_output_25_0_g93).x , (temp_output_25_0_g93).y ) / 6.28318548202515 ) ) , length( temp_output_25_0_g93 )));
			float temp_output_44_0_g93 = (saturate( appendResult21_g93 )).x;
			float temp_output_62_0_g93 = _Mask_offset_scale;
			float temp_output_45_0_g93 = (appendResult21_g93).y;
			float2 appendResult49_g93 = (float2(temp_output_44_0_g93 , ( ( temp_output_44_0_g93 * temp_output_62_0_g93 ) + temp_output_45_0_g93 )));
			float2 appendResult50_g93 = (float2(( temp_output_44_0_g93 + ( temp_output_45_0_g93 * temp_output_62_0_g93 ) ) , temp_output_45_0_g93));
			float2 lerpResult58_g93 = lerp( appendResult49_g93 , appendResult50_g93 , _Mask_UV);
			float2 lerpResult520 = lerp( lerpResult29_g94 , lerpResult58_g93 , _Mask_tex_radial);
			float cos263 = cos( ( ( _Mask_Rotator * UNITY_PI ) / 180.0 ) );
			float sin263 = sin( ( ( _Mask_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator263 = mul( lerpResult520 - float2( 0.5,0.5 ) , float2x2( cos263 , -sin263 , sin263 , cos263 )) + float2( 0.5,0.5 );
			float2 panner131 = ( 1.0 * _Time.y * appendResult129 + ( ( rotator263 * (_Mask_Tex).xy ) + (_Mask_Tex).zw ));
			float2 lerpResult144 = lerp( panner131 , saturate( panner131 ) , _Mask_tex_clamp);
			float4 tex2DNode133 = tex2D( _Mask_tex, lerpResult144 );
			#if defined(_MASK_SPLIT_R)
				float staticSwitch304 = tex2DNode133.r;
			#elif defined(_MASK_SPLIT_G)
				float staticSwitch304 = tex2DNode133.g;
			#elif defined(_MASK_SPLIT_B)
				float staticSwitch304 = tex2DNode133.b;
			#elif defined(_MASK_SPLIT_A)
				float staticSwitch304 = tex2DNode133.a;
			#else
				float staticSwitch304 = tex2DNode133.r;
			#endif
			float Dissovle164 = temp_output_183_0;
			float screenDepth351 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth351 = saturate( abs( ( screenDepth351 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _Depth_fade ) ) );
			float lerpResult355 = lerp( 1.0 , distanceDepth351 , _Use_Depth_fade);
			float Depth_fade354 = saturate( lerpResult355 );
			float Opacity179 = ( i.vertexColor.a * _Main_color.a );
			float Fresnel_opacity291 = temp_output_286_0;
			float Use_fresnel_opacity295 = _Use_fresnel_opacity;
			float lerpResult297 = lerp( 1.0 , Fresnel_opacity291 , Use_fresnel_opacity295);
			o.Alpha = saturate( ( saturate( ( pow( ( staticSwitch304 * Dissovle164 * staticSwitch169 ) , _Opacity_power ) * _Opacity_scale * Depth_fade354 * Opacity179 ) ) * lerpResult297 ) );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.CommentaryNode;549;-2232.466,-602.6592;Inherit;False;601.9861;518.3137;UV_vave_power;6;546;548;547;543;545;550;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;321;-1607.787,-388.6964;Inherit;False;1416.925;325;Custom;12;306;316;315;314;313;312;311;309;327;326;317;307;Custom;1,0,0,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;307;-898.9019,-329.2785;Inherit;False;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;317;-653.8621,-337.6964;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;326;-1576.533,-159.3598;Inherit;False;Property;_Custom;Custom;3;1;[Enum];Create;True;0;2;Off;0;On;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;327;-1408.007,-159.9034;Inherit;False;Use_custom;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;359;-2842.984,2661.094;Inherit;False;Property;_Dissolve_gradent_Rotator;Dissolve_gradent_Rotator;66;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;102;-2548.285,1290.894;Inherit;False;1985.907;618.8409;Noise_tex;21;121;336;108;111;106;107;112;109;113;103;264;265;267;527;110;142;334;341;140;335;115;;1,1,1,1;0;0
Node;AmplifyShaderEditor.PannerNode;115;-1304.559,1373.41;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;360;-2591.591,2669.681;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;309;-1321.863,-338.6964;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;335;-1263.813,1666.448;Inherit;False;313;Custom1_w;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;140;-1246.157,1581.499;Inherit;False;Property;_Noise_scale;Noise_scale;37;0;Create;True;0;0;0;False;0;False;0;-0.35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;361;-2422.371,2666.555;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;341;-1040.604,1646.613;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;311;-1120.862,-334.6964;Inherit;False;Custom1_xy;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;362;-2528.378,2535.688;Inherit;False;0;163;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;334;-1263.382,1752.547;Inherit;False;327;Use_custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;363;-2283.475,2540.674;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;368;-2440.693,2812.814;Inherit;False;Property;_Dissolve_gradent_Tex;Dissolve_gradent_Tex;64;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;364;-2065.381,2541.669;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;141;-593.1569,1374.499;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;366;-2031.479,2645.388;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;87;-2541.726,-12.58177;Inherit;False;2353.65;647.4432;Main_tex;25;1;67;256;258;12;44;85;86;84;68;15;14;13;324;376;491;325;328;61;59;257;45;521;70;18;01;1,1,1,1;0;0
Node;AmplifyShaderEditor.PannerNode;159;-1309.333,1992.998;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;365;-2034.161,2721.132;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;367;-1812.477,2539.388;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;205;-1773.76,2709.043;Inherit;False;Property;_FixedPower1;Dissolve_gradent_width;65;0;Create;False;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;137;-2508.922,995.2968;Inherit;False;Property;_Mask_Tex;Mask_Tex;25;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,-0.01;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;206;-1495.597,2712.839;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;408;-1272.057,2344.127;Inherit;False;43;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;369;-1675.08,2535.791;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;160;-1198.256,2222.287;Inherit;False;Property;_Dissove_tex_clamp;Dissove_tex_clamp;49;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;410;-1278.331,2413.776;Inherit;False;Property;_Nosie_dissolve;Nosie_dissolve;38;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;275;-2796.501,3212.698;Inherit;False;Property;_Gradent_Rotator;Gradent_Rotator;70;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;161;-1126.256,2056.287;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;378;-2863.92,4352.13;Inherit;False;Property;_Vertex_Rotator;Vertex_Rotator;77;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-1631.558,470.8614;Inherit;False;Property;_Main_speed_U;Main_speed_U;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;409;-1032.792,2290.207;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;274;-2613.108,3216.285;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;207;-1342.53,2710.248;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;162;-952.2563,1997.287;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-1630.558,550.8615;Inherit;False;Property;_Main_speed_V;Main_speed_V;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;186;-1490.172,2512.185;Inherit;True;Property;_Dissolvegradent;Dissolve-gradent;63;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;407;-855.2018,2178.063;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;135;-2036.004,1110.155;Inherit;False;Property;_Mask_speed_U;Mask_speed_U;32;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;281;-1965.188,3764.102;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;273;-2443.888,3213.159;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;208;-1129.966,2678.908;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;235;-2540.294,3089.953;Inherit;False;0;247;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;234;-2471.127,3376.487;Inherit;False;Property;_Gradent_Tex;Gradent_Tex;68;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;136;-2035.004,1190.155;Inherit;False;Property;_Mask_speed_V;Mask_speed_V;33;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;283;-2186.188,4014.102;Inherit;False;Property;_Fresnel_one_minus;Fresnel_one_minus;85;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;379;-2680.528,4355.717;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;129;-1863.004,1104.155;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;282;-1808.188,3774.102;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;272;-2230.992,3099.278;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;163;-758.4084,1964.182;Inherit;True;Property;_Dissolove_tex;Dissolove_tex;46;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;c1e34b34727001740aa873905a01a943;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;68;-1298,69.93449;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;285;-1767.188,4000.102;Inherit;False;Property;_Fresnelpower;Fresnel+power;88;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;211;-885.0961,2670.792;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;332;51.24057,2204.208;Inherit;False;312;Custom1_z;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;236;-2076.912,3204.06;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;380;-2545.208,4447.283;Inherit;False;Property;_Vertex_Tex;Vertex_Tex;75;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleDivideOpNode;381;-2511.308,4350.591;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;184;68.73077,2118.051;Inherit;False;Property;_Dissolve;Dissolve;57;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;238;-1811.913,3098.06;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;384;-2304.412,4240.71;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;131;-1302.446,741.2268;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;230;-469.8929,2200.034;Inherit;False;Property;_Use_dissolve_gradent;Use_dissolve_gradent;62;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;342;252.4791,2183.046;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;383;-2125.993,4354.856;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;330;169.61,2310.706;Inherit;False;327;Use_custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;84;-1113.899,126.3655;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;86;-1208.899,225.3656;Inherit;False;Property;_Main_tex_clamp;Main_tex_clamp;15;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;343;352,2160;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;239;-2079.594,3279.804;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;200;-682.0918,2641.453;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;228;-193.3156,2001.888;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;286;-1362.188,3774.102;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;-474.7273,-779.6596;Inherit;False;Property;_Depth_fade;Depth_fade;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;145;-1191.37,970.5154;Inherit;False;Property;_Mask_tex_clamp;Mask_tex_clamp;27;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;143;-1119.37,804.5153;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;191;430.0425,2372.442;Inherit;False;Property;_Dissolve_soft;Dissolve_soft;58;0;Create;True;0;0;0;False;0;False;0.5;0.767;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;386;-2128.675,4430.601;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;385;-1860.994,4248.856;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;233;-2039.644,3542.403;Inherit;False;Property;_Gradent_speed_V;Gradent_speed_V;72;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;331;426.5689,2177.288;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;243;-1759.326,3319.094;Inherit;False;Property;_Gradent_tex_radial;Gradent_tex_radial;69;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;240;-2040.644,3462.403;Inherit;False;Property;_Gradent_speed_U;Gradent_speed_U;71;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;187;427.8245,2297.624;Inherit;False;Property;_Dissolve_edge;Dissolve_edge;59;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;241;-1658.644,3100.402;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DepthFade;351;-273.9116,-799.2147;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;245;-1867.644,3456.403;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;244;-1508.326,3101.094;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;388;-1707.724,4251.198;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;189;765.4664,2238.243;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;291;-951.3712,3767.107;Inherit;False;Fresnel_opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;390;-2089.725,4613.199;Inherit;False;Property;_Vertex_speed_U;Vertex_speed_U;83;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;391;-2093.725,4693.199;Inherit;False;Property;_Vertex_speed_V;Vertex_speed_V;84;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;183;1212.873,1913.587;Inherit;True;Dissolve;-1;;51;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;144;-945.37,745.5153;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;133;-803.522,713.7106;Inherit;True;Property;_Mask_tex;Mask_tex;23;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;aade6b7826081f747b1f1ec151aefca1;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;355;8.471695,-804.5039;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;168;-304.7296,-1186.058;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;392;-1916.724,4607.199;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;175;-324.3806,-1020.317;Inherit;False;Property;_Main_color;Main_color;8;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;7.873743,7.873743,7.873743,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;164;1591.12,1907.97;Inherit;False;Dissovle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;394;-1315.421,4537.31;Inherit;False;315;Custom2_z;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;173;-94.78147,-1185.715;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;190;1587.11,1990.853;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;395;-1317.765,4460.36;Inherit;False;Property;_Vertex_scale;Vertex_scale;82;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;396;-1356.167,4244.271;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;287;-1398.44,4015.543;Inherit;False;Property;_Fresnel_color;Fresnel_color;89;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;194;1595.287,2206.262;Inherit;False;Property;_Dissolve_color;Dissolve_color;61;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;304;-461.3964,736.2181;Inherit;False;Property;_Mask_Split;Mask_Split;24;0;Create;True;0;0;0;True;0;False;0;0;0;True;;KeywordEnum;4;R;G;B;A;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;167;-549.0002,905.2763;Inherit;False;164;Dissovle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;176;-106.4594,-1021.44;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;178;333.1555,-1044.212;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;254;-1002.388,3279.149;Inherit;False;Property;_Desatruate;Desatruate;73;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;358;175.337,-797.9283;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;397;-1314.99,4623.408;Inherit;False;327;Use_custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;412;-1222.854,4724.935;Inherit;True;Property;_vertex_mask;vertex_mask;76;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;166;-36.52875,730.882;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;179;570.644,-1056.429;Inherit;False;Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;398;-1171.301,4218.196;Inherit;True;Property;_Vertex_tex;Vertex_tex;74;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;196;1842.72,1991.831;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;345;-40.0105,918.7766;Inherit;False;Property;_Opacity_power;Opacity_power;4;0;Create;True;0;0;0;False;0;False;1;1.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;399;-1092.211,4517.475;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;174;329.7856,-1150.926;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;288;-1125.433,3854.944;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;354;348.4717,-807.5039;Inherit;False;Depth_fade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DesaturateOpNode;253;-821.3882,3071.149;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;290;-1072.895,4000.75;Inherit;False;Property;_Use_fresnel_color;Use_fresnel_color;86;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;293;-953.0497,3845.594;Inherit;False;Fresnel_color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;192;1990.292,1981.55;Inherit;False;Dissove_edge_color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;346;-29.8105,991.3767;Inherit;False;Property;_Opacity_scale;Opacity_scale;5;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;400;-838.0305,4463.99;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;177;568.8769,-1156.402;Inherit;False;Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;405;-873.7147,4608.455;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;411;-825.0536,4247.837;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;294;-888.0497,3998.594;Inherit;False;Use_fresnel_color;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;402;-644.7645,4245.36;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;255;275.4667,237.5304;Inherit;False;251;Gradent;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;182;268.496,153.7472;Inherit;False;177;Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;348;402.8895,726.7767;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;292;259.1745,311.2095;Inherit;False;293;Fresnel_color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;199;244.3254,490.9596;Inherit;False;192;Dissove_edge_color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;301;236.0142,393.7621;Inherit;False;294;Use_fresnel_color;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;303;673.8199,422.8388;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;300;451.1142,280.0619;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;181;592.9401,29.16544;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;403;-429.2908,4243.51;Inherit;False;Vertexoffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;198;770.2778,29.86061;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;6;340.0814,-922.9353;Inherit;False;Property;_AddBlend;Add/Blend;2;1;[Enum];Create;True;0;2;Add;1;Blend;10;0;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;7;481.2558,-921.0865;Inherit;False;Property;_Cull_Mode;Cull_Mode;0;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;1442.848,-20.93484;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX/FX_Lbeer;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;0;True;_Z_write_mode;0;True;_Depth;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;True;_Stencil_refernce;255;False;;255;False;;0;True;_Stencil_Comparision;0;True;_Stencil_Pass_front;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;1;5;False;;8;True;_AddBlend;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;56;-1;-1;-1;0;False;0;0;True;_Cull_Mode;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.CommentaryNode;404;-2913.92,4168.196;Inherit;False;2648.629;641.0029;vertex;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;232;-1823.76,2462.185;Inherit;False;1376.669;470.7234;Dissolve_gradent;0;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;123;-2546.173,658.7106;Inherit;False;1985.907;618.8409;Mask_tex;9;128;127;125;126;263;260;261;520;134;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;305;-374.3806,-1236.058;Inherit;False;1169.024;430.9713;Color;1;9;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;165;-2553.06,1915.482;Inherit;False;2415.935;1085.727;Comment;16;151;153;148;373;370;372;377;150;155;154;158;268;146;269;270;533;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;231;355.8245,1837.906;Inherit;False;2007.468;735.536;Dissolve_color;2;188;432;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;252;-2550.812,3017.4;Inherit;False;2334.602;641.0029;Gradent;8;251;438;445;446;447;246;247;448;;1,1,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;188;1220.314,2162.204;Inherit;True;Dissolve;-1;;52;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;432;1945.941,2142.789;Inherit;False;Dissolve_edge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;433;1040.556,60.10255;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;251;-561.2106,3064.714;Inherit;False;Gradent;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;438;-654.9471,3222.531;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;439;-310.4912,3251.846;Inherit;False;Gradent_R;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;435;961.6045,277.0966;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;436;744.5766,345.6292;Inherit;False;Property;_Edge_black_scale;Edge_black_scale;60;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;356;-280.5283,-650.5039;Inherit;False;Property;_Use_Depth_fade;Use_Depth_fade;6;1;[Enum];Create;True;0;2;Off;0;On;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;357;-29.82007,1069.812;Inherit;False;354;Depth_fade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;297;154.092,1347.452;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;298;-123.2559,1414.779;Inherit;False;295;Use_fresnel_opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;121;-1119.693,1347.335;Inherit;True;Property;_Noise_tex;Noise_tex;34;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;b02e4785728929b42bfb178f62537738;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;336;-786.423,1593.129;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;445;-1433.599,3326.12;Inherit;False;43;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;446;-1244.373,3281.81;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;247;-1093.22,3065.4;Inherit;True;Property;_Gradent_tex;Gradent_tex;67;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;448;-1201.975,3109.871;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;246;-1365.086,3103.475;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;447;-1445.512,3451.197;Inherit;False;Property;_Noise_gradent;Noise_gradent;39;1;[Enum];Create;True;0;2;off;0;on;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;169;-176.9534,96.09109;Inherit;False;Property;_Main_Split;Main_Split;13;0;Create;True;0;0;0;True;0;False;1;0;3;True;;KeywordEnum;4;R;G;B;A;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;172;-198.094,253.8926;Inherit;False;Property;_Use_base_color;Use_base_color;14;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;170;22.85041,23.9078;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;453;247.8173,40.80404;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;451;420.7173,-137.296;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;450;251.7173,-137.2959;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;452;545.5173,-150.2959;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;449;21.6173,144.804;Inherit;False;Property;_Main_control;Main_control;9;0;Create;True;0;0;0;False;0;False;1,1,1,1;0.1,1,1.5,0.5;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;434;745.9581,276.0601;Inherit;False;432;Dissolve_edge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;441;835.9507,453.2039;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;440;671.9507,450.2039;Inherit;True;439;Gradent_R;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;180;-6.171443,1226.878;Inherit;False;179;Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;344;140.3251,731.0961;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;423;576.251,723.3994;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;456;779.9211,721.3709;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;455;913.7507,717.0945;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;406;1165.567,658.3109;Inherit;False;403;Vertexoffset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;299;-97.20534,1341.173;Inherit;False;291;Fresnel_opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;296;-1087.474,4087.152;Inherit;False;Property;_Use_fresnel_opacity;Use_fresnel_opacity;87;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;295;-887.6291,4086.996;Inherit;False;Use_fresnel_opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;284;-1532.188,3774.102;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;278;-2593.902,3755.983;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;279;-2620.902,3933.983;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SaturateNode;460;-2112.804,3788.262;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;280;-2316.95,3774.544;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;9;613.7958,-921.6151;Inherit;False;Property;_Depth;Depth;1;1;[Enum];Create;True;0;2;Off;2;On;8;0;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;461;749.522,-924.0104;Inherit;False;Property;_Z_write_mode;Z_write_mode;90;1;[Enum];Create;True;0;3;Defult;0;On;1;Off;2;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;486;-2081.939,3359.644;Inherit;False;Radio;-1;;75;7c1c147933262c743969f15c5621a6a5;0;2;43;FLOAT2;2,2;False;40;FLOAT4;0,0,0,0;False;1;FLOAT2;41
Node;AmplifyShaderEditor.DynamicAppendNode;15;-1458.558,464.8614;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;504;-3465.876,4159.506;Inherit;False;UV_chamfer_offset;-1;;89;d3e76986f1dd0804c84cb7f1a0379131;0;3;35;FLOAT;0;False;31;FLOAT;0;False;41;FLOAT;0;False;1;FLOAT2;30
Node;AmplifyShaderEditor.FunctionNode;503;-3465.446,4309.925;Inherit;False;Radio_UVring;-1;;90;448eee16a1283c34eba4b217ca5bee2c;0;3;61;FLOAT;0;False;62;FLOAT;0;False;40;FLOAT4;0,0,0,0;False;1;FLOAT2;41
Node;AmplifyShaderEditor.LerpOp;505;-3055.36,4236.952;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;389;-3357.48,4410.018;Inherit;False;Property;_Vertex_tex_radial;Vertex_tex_radial;78;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;509;-3788.183,4333.917;Inherit;False;Property;_Vertex_screen_UV;Vertex_screen_UV;81;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;511;-3788.946,4153.235;Inherit;False;Property;_Vertex_UV;Vertex_UV;79;1;[Enum];Create;True;0;2;U;0;V;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;510;-3820.946,4246.235;Inherit;False;Property;_Vertex_offset_scale;Vertex_offset_scale;80;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;306;-1557.788,-332.1743;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;128;-1468.004,740.1537;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;-1635.273,745.8115;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;125;-1817.274,835.8116;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;126;-1819.956,911.5558;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;263;-1975,749;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;260;-2530.609,903.1265;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;261;-2343,898;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;134;-2533.386,826.4457;Inherit;False;Property;_Mask_tex_radial;Mask_tex_radial;28;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;262;-2710.2,898.2001;Inherit;False;Property;_Mask_Rotator;Mask_Rotator;26;0;Create;True;0;0;0;False;0;False;0;270;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;12;-1457.258,73.76051;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;67;-1673.527,73.21885;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;324;-1707.078,311.1867;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;376;-1895.26,346.8252;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;328;-1942.239,446.0045;Inherit;False;327;Use_custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;325;-2125.87,365.0063;Inherit;False;311;Custom1_xy;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;59;-2120.956,206.5395;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;61;-2123.758,283.7888;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;491;-2135.019,54.23418;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;45;-2347.598,381.3231;Inherit;False;Property;_Main_Tex;Main_Tex;11;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,2.5,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PiNode;257;-2463.947,226.4308;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;258;-2287.947,226.3308;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;521;-2136.14,178.9113;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;70;-2348.541,151.1534;Inherit;False;Property;_Main_tex_radial;Main_tex_radial;16;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;416;-3125.424,141.6419;Inherit;False;Property;_Main_screen_UV;Main_screen_UV;20;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;259;-2714.655,214.2833;Inherit;False;Property;_Main_Rotator;Main_Rotator;12;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;518;-2827.943,804.9054;Inherit;False;Radio_UVring;-1;;93;448eee16a1283c34eba4b217ca5bee2c;0;3;61;FLOAT;0;False;62;FLOAT;0;False;40;FLOAT4;0,0,0,0;False;1;FLOAT2;41
Node;AmplifyShaderEditor.FunctionNode;519;-2828.373,654.4876;Inherit;False;UV_chamfer_offset;-1;;94;d3e76986f1dd0804c84cb7f1a0379131;0;3;35;FLOAT;0;False;31;FLOAT;0;False;41;FLOAT;0;False;1;FLOAT2;30
Node;AmplifyShaderEditor.RangedFloatNode;515;-3085.944,652.2056;Inherit;False;Property;_Mask_UV;Mask_UV;29;1;[Enum];Create;True;0;2;U;0;V;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;516;-3139.944,727.2056;Inherit;False;Property;_Mask_offset_scale;Mask_offset_scale;30;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;517;-3124.181,811.8873;Inherit;False;Property;_Mask_screen_UV;Mask_screen_UV;31;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;520;-2278.758,743.5287;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;108;-1619.386,1372.995;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;111;-1466.117,1375.337;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;106;-1810.385,1476.995;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;107;-1813.067,1552.739;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-1778.117,1664.338;Inherit;False;Property;_Noise_speed_U;Noise_speed_U;44;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-1777.117,1744.338;Inherit;False;Property;_Noise_speed_V;Noise_speed_V;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;113;-1605.117,1658.338;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;265;-1969.804,1378.849;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;266;-2737.861,1585.178;Inherit;False;Property;_Noise_Rotator;Noise_Rotator;36;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;264;-2332.09,1578.945;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;267;-2513.31,1590.071;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;103;-2492.071,1679.274;Inherit;False;Property;_Noise_Tex;Noise_Tex;35;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,2,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;110;-2496.269,1490.247;Inherit;False;Property;_Noise_tex_radial;Noise_tex_radial;40;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;523;-2831.299,1309.014;Inherit;False;UV_chamfer_offset;-1;;95;d3e76986f1dd0804c84cb7f1a0379131;0;3;35;FLOAT;0;False;31;FLOAT;0;False;41;FLOAT;0;False;1;FLOAT2;30
Node;AmplifyShaderEditor.FunctionNode;522;-2830.869,1437.836;Inherit;False;Radio_UVring;-1;;96;448eee16a1283c34eba4b217ca5bee2c;0;3;61;FLOAT;0;False;62;FLOAT;0;False;40;FLOAT4;0,0,0,0;False;1;FLOAT2;41
Node;AmplifyShaderEditor.RangedFloatNode;524;-3068.479,1295.021;Inherit;False;Property;_Noise_UV;Noise_UV;41;1;[Enum];Create;True;0;2;U;0;V;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;525;-3122.479,1370.021;Inherit;False;Property;_Noisek_offset_scale;Noisek_offset_scale;42;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;526;-3106.716,1454.703;Inherit;False;Property;_Noise_screen_UV;Noise_screen_UV;43;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;527;-2249.341,1376.508;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;151;-1607.459,1993.683;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;153;-1454.191,1996.025;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;155;-1653.891,2296.926;Inherit;False;Property;_Dissolve_speed_U;Dissolve_speed_U;54;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;154;-1652.891,2376.926;Inherit;False;Property;_Dissolve_speed_V;Dissolve_speed_V;55;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;158;-1438.027,2305.59;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;373;-1590.879,2165.471;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;370;-1984.46,2296.969;Inherit;False;314;Custom2_xy;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;372;-1985.72,2369.844;Inherit;False;327;Use_custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;377;-1782.569,2238.124;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;150;-2000.143,2185.927;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;268;-2009.157,1993.869;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;148;-1998.4,2114.554;Inherit;False;True;True;False;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;146;-2297.475,2303.608;Inherit;False;Property;_Dissolve_Tex;Dissolve_Tex;47;0;Create;True;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PiNode;270;-2438.273,2215.876;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;269;-2269.053,2212.75;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;533;-2264.198,1997.779;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;528;-2831.156,1918.285;Inherit;False;UV_chamfer_offset;-1;;97;d3e76986f1dd0804c84cb7f1a0379131;0;3;35;FLOAT;0;False;31;FLOAT;0;False;41;FLOAT;0;False;1;FLOAT2;30
Node;AmplifyShaderEditor.FunctionNode;529;-2830.726,2047.107;Inherit;False;Radio_UVring;-1;;98;448eee16a1283c34eba4b217ca5bee2c;0;3;61;FLOAT;0;False;62;FLOAT;0;False;40;FLOAT4;0,0,0,0;False;1;FLOAT2;41
Node;AmplifyShaderEditor.RangedFloatNode;271;-2725.666,2233.289;Inherit;False;Property;_Dissolve_Rotator;Dissolve_Rotator;48;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;152;-2748.105,2154.385;Inherit;False;Property;_Dissolve_tex_radial;Dissolve_tex_radial;50;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;314;-416.8622,-336.6964;Inherit;False;Custom2_xy;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;315;-415.8622,-260.6965;Inherit;False;Custom2_z;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;313;-1123.862,-179.6963;Inherit;False;Custom1_w;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;312;-1120.862,-255.6965;Inherit;False;Custom1_z;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;316;-414.8622,-185.6963;Inherit;False;Custom2_w;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;493;-3108.187,-39.03973;Inherit;False;Property;_Main_UV;Main_UV;18;1;[Enum];Create;True;0;2;U;0;V;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;495;-3449.187,-249.0397;Inherit;False;Property;_Main_offset_scale;Main_offset_scale;19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;534;-3078.262,-167.6371;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;535;-3443.408,-82.00351;Inherit;False;327;Use_custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;537;-3227.408,-158.0035;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;539;-3583.212,2043.732;Inherit;False;327;Use_custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;540;-3389.212,1887.732;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;532;-3178.573,2066.974;Inherit;False;Property;_Dissolve_screen_UV;Dissolve_screen_UV;53;1;[Enum];Create;True;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;538;-3136.066,1945.098;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;530;-3137.336,1858.292;Inherit;False;Property;_Dissove_UV;Dissove_UV;51;1;[Enum];Create;True;0;2;U;0;V;1;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;531;-3587.336,1753.292;Inherit;False;Property;_Dissolve_offset_scale;Dissolve_offset_scale;52;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;541;-3626.752,1915.544;Inherit;False;316;Custom2_w;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;542;-3445.452,-155.302;Inherit;False;316;Custom2_w;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;142;-803.6766,1371.872;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.5;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;43;-245.6832,1274.649;Inherit;False;Noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;85;-976.8028,69.36552;Inherit;True;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1;-466.4757,45.21822;Inherit;True;Property;_Main_tex;Main_tex;10;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;ee1b8f7d3eaab6f4180c8be71769cb9b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;18;-586.8237,112.4156;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;44;-904.6801,296.226;Inherit;False;43;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;496;-2822.686,115.1602;Inherit;False;Radio_UVring;-1;;99;448eee16a1283c34eba4b217ca5bee2c;0;3;61;FLOAT;0;False;62;FLOAT;0;False;40;FLOAT4;0,0,0,0;False;1;FLOAT2;41
Node;AmplifyShaderEditor.FunctionNode;500;-2827.016,-6.657513;Inherit;False;UV_chamfer_offset;-1;;100;d3e76986f1dd0804c84cb7f1a0379131;0;3;35;FLOAT;0;False;31;FLOAT;0;False;41;FLOAT;0;False;1;FLOAT2;30
Node;AmplifyShaderEditor.SwizzleNode;548;-2071.959,-237.3455;Inherit;False;FLOAT;1;1;2;3;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;543;-2073.466,-314.6592;Inherit;False;FLOAT;0;1;2;3;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;546;-1946.899,-234.7929;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;550;-2162.425,-207.6531;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;545;-1785.48,-308.0574;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;547;-2071.467,-163.3084;Inherit;False;Property;_V_power;V_power;17;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;256;-1921.298,72.93952;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
WireConnection;317;0;307;0
WireConnection;327;0;326;0
WireConnection;115;0;111;0
WireConnection;115;2;113;0
WireConnection;360;0;359;0
WireConnection;309;0;306;0
WireConnection;361;0;360;0
WireConnection;341;0;140;0
WireConnection;341;1;335;0
WireConnection;311;0;309;0
WireConnection;363;0;362;0
WireConnection;363;2;361;0
WireConnection;364;0;363;0
WireConnection;141;0;142;0
WireConnection;141;1;336;0
WireConnection;366;0;368;0
WireConnection;159;0;153;0
WireConnection;159;2;158;0
WireConnection;365;0;368;0
WireConnection;367;0;364;0
WireConnection;367;1;366;0
WireConnection;206;0;205;0
WireConnection;369;0;367;0
WireConnection;369;1;365;0
WireConnection;161;0;159;0
WireConnection;409;1;408;0
WireConnection;409;2;410;0
WireConnection;274;0;275;0
WireConnection;207;0;206;0
WireConnection;162;0;159;0
WireConnection;162;1;161;0
WireConnection;162;2;160;0
WireConnection;186;1;369;0
WireConnection;407;0;162;0
WireConnection;407;1;409;0
WireConnection;281;0;460;0
WireConnection;273;0;274;0
WireConnection;208;0;186;1
WireConnection;208;1;207;0
WireConnection;379;0;378;0
WireConnection;129;0;135;0
WireConnection;129;1;136;0
WireConnection;282;0;281;0
WireConnection;282;1;460;0
WireConnection;282;2;283;0
WireConnection;272;0;235;0
WireConnection;272;2;273;0
WireConnection;163;1;407;0
WireConnection;68;0;12;0
WireConnection;68;2;15;0
WireConnection;211;0;208;0
WireConnection;236;0;234;0
WireConnection;381;0;379;0
WireConnection;238;0;272;0
WireConnection;238;1;236;0
WireConnection;384;0;505;0
WireConnection;384;2;381;0
WireConnection;131;0;128;0
WireConnection;131;2;129;0
WireConnection;342;0;184;0
WireConnection;342;1;332;0
WireConnection;383;0;380;0
WireConnection;84;0;68;0
WireConnection;343;0;184;0
WireConnection;239;0;234;0
WireConnection;200;0;163;1
WireConnection;200;1;211;0
WireConnection;228;0;163;1
WireConnection;228;1;200;0
WireConnection;228;2;230;0
WireConnection;286;0;284;0
WireConnection;143;0;131;0
WireConnection;386;0;380;0
WireConnection;385;0;384;0
WireConnection;385;1;383;0
WireConnection;331;0;343;0
WireConnection;331;1;342;0
WireConnection;331;2;330;0
WireConnection;241;0;238;0
WireConnection;241;1;239;0
WireConnection;351;0;353;0
WireConnection;245;0;240;0
WireConnection;245;1;233;0
WireConnection;244;0;241;0
WireConnection;244;1;486;41
WireConnection;244;2;243;0
WireConnection;388;0;385;0
WireConnection;388;1;386;0
WireConnection;189;0;331;0
WireConnection;189;1;187;0
WireConnection;291;0;286;0
WireConnection;183;1;228;0
WireConnection;183;2;331;0
WireConnection;183;3;191;0
WireConnection;144;0;131;0
WireConnection;144;1;143;0
WireConnection;144;2;145;0
WireConnection;133;1;144;0
WireConnection;355;1;351;0
WireConnection;355;2;356;0
WireConnection;392;0;390;0
WireConnection;392;1;391;0
WireConnection;164;0;183;0
WireConnection;173;0;168;0
WireConnection;190;0;183;0
WireConnection;190;1;188;0
WireConnection;396;0;388;0
WireConnection;396;2;392;0
WireConnection;304;1;133;1
WireConnection;304;0;133;2
WireConnection;304;2;133;3
WireConnection;304;3;133;4
WireConnection;176;0;175;0
WireConnection;178;0;168;4
WireConnection;178;1;175;4
WireConnection;358;0;355;0
WireConnection;166;0;304;0
WireConnection;166;1;167;0
WireConnection;166;2;169;0
WireConnection;179;0;178;0
WireConnection;398;1;396;0
WireConnection;196;0;190;0
WireConnection;196;1;194;0
WireConnection;399;0;395;0
WireConnection;399;1;394;0
WireConnection;174;0;173;0
WireConnection;174;1;176;0
WireConnection;288;0;286;0
WireConnection;288;1;287;0
WireConnection;354;0;358;0
WireConnection;253;0;247;0
WireConnection;253;1;254;0
WireConnection;293;0;288;0
WireConnection;192;0;196;0
WireConnection;400;0;395;0
WireConnection;400;1;399;0
WireConnection;400;2;397;0
WireConnection;177;0;174;0
WireConnection;411;0;398;1
WireConnection;411;1;412;1
WireConnection;294;0;290;0
WireConnection;402;0;411;0
WireConnection;402;1;400;0
WireConnection;402;2;405;0
WireConnection;348;0;344;0
WireConnection;348;1;346;0
WireConnection;348;2;357;0
WireConnection;348;3;180;0
WireConnection;303;0;199;0
WireConnection;300;1;292;0
WireConnection;300;2;301;0
WireConnection;181;0;452;0
WireConnection;181;1;182;0
WireConnection;181;2;255;0
WireConnection;403;0;402;0
WireConnection;198;0;181;0
WireConnection;198;1;300;0
WireConnection;198;2;303;0
WireConnection;0;2;433;0
WireConnection;0;9;455;0
WireConnection;0;11;406;0
WireConnection;188;1;228;0
WireConnection;188;2;189;0
WireConnection;188;3;191;0
WireConnection;432;0;190;0
WireConnection;433;0;198;0
WireConnection;433;1;435;0
WireConnection;251;0;253;0
WireConnection;438;0;247;1
WireConnection;439;0;438;0
WireConnection;435;0;434;0
WireConnection;435;1;436;0
WireConnection;297;1;299;0
WireConnection;297;2;298;0
WireConnection;121;1;115;0
WireConnection;336;0;140;0
WireConnection;336;1;341;0
WireConnection;336;2;334;0
WireConnection;446;1;445;0
WireConnection;446;2;447;0
WireConnection;247;1;448;0
WireConnection;448;0;246;0
WireConnection;448;1;446;0
WireConnection;246;0;244;0
WireConnection;246;2;245;0
WireConnection;169;1;1;1
WireConnection;169;0;1;2
WireConnection;169;2;1;3
WireConnection;169;3;1;4
WireConnection;170;0;169;0
WireConnection;170;1;1;0
WireConnection;170;2;172;0
WireConnection;453;0;170;0
WireConnection;453;1;449;3
WireConnection;451;0;450;0
WireConnection;451;1;449;2
WireConnection;450;0;170;0
WireConnection;450;1;449;1
WireConnection;452;0;451;0
WireConnection;452;1;453;0
WireConnection;452;2;449;4
WireConnection;441;0;440;0
WireConnection;344;0;166;0
WireConnection;344;1;345;0
WireConnection;423;0;348;0
WireConnection;456;0;423;0
WireConnection;456;1;297;0
WireConnection;455;0;456;0
WireConnection;295;0;296;0
WireConnection;284;0;282;0
WireConnection;284;1;285;0
WireConnection;460;0;280;0
WireConnection;280;0;278;0
WireConnection;280;1;279;0
WireConnection;486;40;234;0
WireConnection;15;0;13;0
WireConnection;15;1;14;0
WireConnection;504;35;511;0
WireConnection;504;31;510;0
WireConnection;504;41;509;0
WireConnection;503;61;511;0
WireConnection;503;62;510;0
WireConnection;505;0;504;30
WireConnection;505;1;503;41
WireConnection;505;2;389;0
WireConnection;128;0;127;0
WireConnection;128;1;126;0
WireConnection;127;0;263;0
WireConnection;127;1;125;0
WireConnection;125;0;137;0
WireConnection;126;0;137;0
WireConnection;263;0;520;0
WireConnection;263;2;261;0
WireConnection;260;0;262;0
WireConnection;261;0;260;0
WireConnection;12;0;67;0
WireConnection;12;1;324;0
WireConnection;67;0;256;0
WireConnection;67;1;59;0
WireConnection;324;0;61;0
WireConnection;324;1;376;0
WireConnection;324;2;328;0
WireConnection;376;0;61;0
WireConnection;376;1;325;0
WireConnection;59;0;45;0
WireConnection;61;0;45;0
WireConnection;491;0;500;30
WireConnection;491;1;496;41
WireConnection;491;2;70;0
WireConnection;257;0;259;0
WireConnection;258;0;257;0
WireConnection;521;0;258;0
WireConnection;518;61;515;0
WireConnection;518;62;516;0
WireConnection;519;35;515;0
WireConnection;519;31;516;0
WireConnection;519;41;517;0
WireConnection;520;0;519;30
WireConnection;520;1;518;41
WireConnection;520;2;134;0
WireConnection;108;0;265;0
WireConnection;108;1;106;0
WireConnection;111;0;108;0
WireConnection;111;1;107;0
WireConnection;106;0;103;0
WireConnection;107;0;103;0
WireConnection;113;0;112;0
WireConnection;113;1;109;0
WireConnection;265;0;527;0
WireConnection;265;2;264;0
WireConnection;264;0;267;0
WireConnection;267;0;266;0
WireConnection;523;35;524;0
WireConnection;523;31;525;0
WireConnection;523;41;526;0
WireConnection;522;61;524;0
WireConnection;522;62;525;0
WireConnection;527;0;523;30
WireConnection;527;1;522;41
WireConnection;527;2;110;0
WireConnection;151;0;268;0
WireConnection;151;1;148;0
WireConnection;153;0;151;0
WireConnection;153;1;373;0
WireConnection;158;0;155;0
WireConnection;158;1;154;0
WireConnection;373;0;150;0
WireConnection;373;1;377;0
WireConnection;373;2;372;0
WireConnection;377;0;150;0
WireConnection;377;1;370;0
WireConnection;150;0;146;0
WireConnection;268;0;533;0
WireConnection;268;2;269;0
WireConnection;148;0;146;0
WireConnection;270;0;271;0
WireConnection;269;0;270;0
WireConnection;533;0;528;30
WireConnection;533;1;529;41
WireConnection;533;2;152;0
WireConnection;528;35;530;0
WireConnection;528;31;538;0
WireConnection;528;41;532;0
WireConnection;529;61;530;0
WireConnection;529;62;538;0
WireConnection;314;0;317;0
WireConnection;315;0;307;3
WireConnection;313;0;306;4
WireConnection;312;0;306;3
WireConnection;316;0;307;4
WireConnection;534;0;495;0
WireConnection;534;1;537;0
WireConnection;534;2;535;0
WireConnection;537;0;495;0
WireConnection;537;1;542;0
WireConnection;540;0;531;0
WireConnection;540;1;541;0
WireConnection;538;0;531;0
WireConnection;538;1;540;0
WireConnection;538;2;539;0
WireConnection;142;0;121;1
WireConnection;43;0;141;0
WireConnection;85;0;68;0
WireConnection;85;1;84;0
WireConnection;85;2;86;0
WireConnection;1;1;18;0
WireConnection;18;0;85;0
WireConnection;18;1;44;0
WireConnection;496;61;493;0
WireConnection;496;62;534;0
WireConnection;500;35;493;0
WireConnection;500;31;534;0
WireConnection;500;41;416;0
WireConnection;548;0;491;0
WireConnection;543;0;550;0
WireConnection;546;0;548;0
WireConnection;546;1;547;0
WireConnection;550;0;491;0
WireConnection;545;0;543;0
WireConnection;545;1;546;0
WireConnection;256;0;491;0
WireConnection;256;2;521;0
ASEEND*/
//CHKSM=97CE3D1EAF9DBD38544C1072C1117AEC9BA1F856