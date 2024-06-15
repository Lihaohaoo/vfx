// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX_Water"
{
	Properties
	{
		[Enum(Off,0,On,1)]_Use_Depth_fade("Use_Depth_fade", Float) = 0
		_Depth_fade("Depth_fade", Float) = 0
		[ToggleUI]_Zwrite_modo("Zwrite_modo", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_Cull_modo("Cull_modo", Float) = 0
		_Desatruate("Desatruate", Range( 0 , 1)) = 0
		[Enum(Off,0,On,1)]_custom("custom", Float) = 0
		_Emission_scale("Emission_scale", Float) = 1
		[HDR]_Main_color("Main_color", Color) = (1,1,1,1)
		[NoScaleOffset]_Matecap("Matecap", 2D) = "white" {}
		_Matcap_tex_scale("Matcap_tex_scale", Float) = 1
		_Matcap_add_color("Matcap_add_color", Color) = (0,0,0,0)
		_Mat_cap_control1("Mat_cap_control", Vector) = (1,1,1,1)
		[Normal]_Normal("Normal", 2D) = "bump" {}
		_Normal_scale("Normal_scale", Float) = 0
		_Normal_speed_U("Normal_speed_U", Float) = 0
		_Normal_speed_V("Normal_speed_V", Float) = 0
		_Main_tex("Main_tex", 2D) = "white" {}
		_Main_control("Main_control", Vector) = (1,1,1,1)
		_Main_Rotator("Main_Rotator", Float) = 0
		_Main_scale("Main_scale", Float) = 1
		_Main_speed_U("Main_speed_U", Float) = 0
		_Main_speed_V("Main_speed_V", Float) = 0
		_Tex_Dissolve("Tex_Dissolve", 2D) = "white" {}
		_Dissolve_Rotator("Dissolve_Rotator", Float) = 0
		_Dissolve_speed_U("Dissolve_speed_U", Float) = 0
		_Dissolve_speed_V("Dissolve_speed_V", Float) = 0
		_Dissolve("Dissolve", Float) = 0
		_Dissolve_soft_edge("Dissolve_soft_edge", Range( 0 , 1)) = 1
		_Dissolve_edge("Dissolve_edge", Range( 0 , 1)) = 0
		[HDR]_Dissolve_color("Dissolve_color", Color) = (0,0,0,0)
		_Dissolve_soft("Dissolve_soft", Range( 0 , 1)) = 0
		[Enum(off,0,on,1)]_Dissolve_fanxiang("Dissolve_fanxiang", Float) = 1
		[Enum(Off,0,On,1)]_Use_dissolve_gradent("Use_dissolve_gradent", Float) = 1
		[NoScaleOffset]_Tex_Dissolve_gradent("Tex_Dissolve_gradent", 2D) = "white" {}
		_FixedPower1("Dissolve_gradent_width", Range( 0 , 1)) = 0.5
		[Enum(Down,0,Up,1)]_Light_("Light_", Float) = 1
		_Top_linght_scale("Top_linght_scale", Float) = 0
		_Top_linght_power("Top_linght_power", Float) = 5
		_Top_light_color("Top_light_color", Color) = (1,1,1,1)
		_Frednel_mask("Frednel_mask", 2D) = "white" {}
		_Fresnel_scale("Fresnel_scale", Float) = 0
		_Fresnel_power("Fresnel_power", Float) = 1
		[HDR]_Fresnel_color("Fresnel_color", Color) = (1,1,1,1)
		_Fresnel_Speed_V("Fresnel_Speed_V", Float) = 0
		_Fresnel_Speed_U("Fresnel_Speed_U", Float) = 0
		_Tex_Vertex("Tex_Vertex", 2D) = "white" {}
		_Vertex_Rotator("Vertex_Rotator", Float) = 0
		_vertex_scale("vertex_scale", Float) = 0
		_Vertex_speed_U("Vertex_speed_U", Float) = 0
		_Vertex_speed_V("Vertex_speed_V", Float) = 0
		_Vertex_mask("Vertex_mask", 2D) = "white" {}
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull [_Cull_modo]
		ZWrite [_Zwrite_modo]
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#include "UnityStandardUtils.cginc"
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float2 uv_texcoord;
			float4 uv2_texcoord2;
			float4 vertexColor : COLOR;
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
			float4 screenPos;
		};

		uniform sampler2D _Tex_Vertex;
		uniform float _Vertex_speed_U;
		uniform float _Vertex_speed_V;
		uniform float4 _Tex_Vertex_ST;
		uniform float _Vertex_Rotator;
		uniform float _vertex_scale;
		uniform float _custom;
		uniform sampler2D _Vertex_mask;
		uniform float4 _Vertex_mask_ST;
		uniform sampler2D _Main_tex;
		uniform float _Main_speed_U;
		uniform float _Main_speed_V;
		uniform float4 _Main_tex_ST;
		uniform float _Main_Rotator;
		uniform float4 _Main_control;
		uniform float _Main_scale;
		uniform float4 _Main_color;
		uniform float _Emission_scale;
		uniform float4 _Matcap_add_color;
		uniform sampler2D _Matecap;
		uniform sampler2D _Normal;
		uniform float _Normal_speed_U;
		uniform float _Normal_speed_V;
		uniform float4 _Normal_ST;
		uniform float _Normal_scale;
		uniform float _Matcap_tex_scale;
		uniform float4 _Mat_cap_control1;
		uniform float _Desatruate;
		uniform sampler2D _Tex_Dissolve;
		uniform float _Dissolve_speed_U;
		uniform float _Dissolve_speed_V;
		uniform float4 _Tex_Dissolve_ST;
		uniform float _Dissolve_Rotator;
		uniform sampler2D _Tex_Dissolve_gradent;
		uniform float _FixedPower1;
		uniform float _Use_dissolve_gradent;
		uniform float _Dissolve_fanxiang;
		uniform float _Dissolve;
		uniform float _Dissolve_soft;
		uniform float _Dissolve_edge;
		uniform float _Dissolve_soft_edge;
		uniform float4 _Dissolve_color;
		uniform float _Light_;
		uniform float _Top_linght_power;
		uniform float _Top_linght_scale;
		uniform float4 _Top_light_color;
		uniform float _Fresnel_power;
		uniform sampler2D _Frednel_mask;
		uniform float _Fresnel_Speed_U;
		uniform float _Fresnel_Speed_V;
		uniform float4 _Fresnel_color;
		uniform float _Fresnel_scale;
		UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
		uniform float4 _CameraDepthTexture_TexelSize;
		uniform float _Depth_fade;
		uniform float _Use_Depth_fade;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult255 = (float2(_Vertex_speed_U , _Vertex_speed_V));
			float2 uv_Tex_Vertex = v.texcoord.xy * _Tex_Vertex_ST.xy + _Tex_Vertex_ST.zw;
			float cos257 = cos( ( ( _Vertex_Rotator * UNITY_PI ) / 180.0 ) );
			float sin257 = sin( ( ( _Vertex_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator257 = mul( uv_Tex_Vertex - float2( 0.5,0.5 ) , float2x2( cos257 , -sin257 , sin257 , cos257 )) + float2( 0.5,0.5 );
			float2 panner256 = ( 1.0 * _Time.y * appendResult255 + rotator257);
			float Custom_vertex264 = v.texcoord1.w;
			float Custom235 = _custom;
			float lerpResult265 = lerp( _vertex_scale , ( _vertex_scale + Custom_vertex264 ) , Custom235);
			float3 ase_vertexNormal = v.normal.xyz;
			float2 uv_Vertex_mask = v.texcoord * _Vertex_mask_ST.xy + _Vertex_mask_ST.zw;
			float3 Vertex_output269 = ( tex2Dlod( _Tex_Vertex, float4( panner256, 0, 0.0) ).r * lerpResult265 * ase_vertexNormal * tex2Dlod( _Vertex_mask, float4( uv_Vertex_mask, 0, 0.0) ).r );
			v.vertex.xyz += Vertex_output269;
			v.vertex.w = 1;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Normal = float3(0,0,1);
			float2 appendResult127 = (float2(_Main_speed_U , _Main_speed_V));
			float2 uv_Main_tex = i.uv_texcoord * _Main_tex_ST.xy + _Main_tex_ST.zw;
			float cos209 = cos( ( ( _Main_Rotator * UNITY_PI ) / 180.0 ) );
			float sin209 = sin( ( ( _Main_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator209 = mul( uv_Main_tex - float2( 0.5,0.5 ) , float2x2( cos209 , -sin209 , sin209 , cos209 )) + float2( 0.5,0.5 );
			float2 appendResult232 = (float2(i.uv2_texcoord2.x , i.uv2_texcoord2.y));
			float Custom235 = _custom;
			float2 lerpResult233 = lerp( float2( 0,0 ) , appendResult232 , Custom235);
			float2 panner124 = ( 1.0 * _Time.y * appendResult127 + ( rotator209 + lerpResult233 ));
			float4 tex2DNode122 = tex2D( _Main_tex, panner124 );
			float4 temp_cast_0 = (_Main_control.x).xxxx;
			float4 lerpResult80 = lerp( ( pow( tex2DNode122 , temp_cast_0 ) * _Main_control.y ) , ( tex2DNode122 * _Main_control.z ) , _Main_control.w);
			float3 temp_output_58_0 = (i.vertexColor).rgb;
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 objToView142 = mul( UNITY_MATRIX_MV, float4( ase_vertex3Pos, 1 ) ).xyz;
			float3 normalizeResult144 = normalize( objToView142 );
			float2 appendResult221 = (float2(_Normal_speed_U , _Normal_speed_V));
			float2 uv_Normal = i.uv_texcoord * _Normal_ST.xy + _Normal_ST.zw;
			float2 panner223 = ( 1.0 * _Time.y * appendResult221 + uv_Normal);
			float3 tex2DNode32 = UnpackScaleNormal( tex2D( _Normal, panner223 ), _Normal_scale );
			float3 break147 = cross( normalizeResult144 , mul( UNITY_MATRIX_V, float4( (WorldNormalVector( i , tex2DNode32 )) , 0.0 ) ).xyz );
			float2 appendResult148 = (float2(-break147.y , break147.x));
			float4 tex2DNode9 = tex2D( _Matecap, ( ( ( (appendResult148*0.5 + 0.5) - float2( 0.5,0.5 ) ) * _Matcap_tex_scale ) + float2( 0.5,0.5 ) ) );
			float4 temp_cast_4 = (_Mat_cap_control1.x).xxxx;
			float4 lerpResult131 = lerp( ( pow( tex2DNode9 , temp_cast_4 ) * _Mat_cap_control1.y ) , ( tex2DNode9 * _Mat_cap_control1.z ) , _Mat_cap_control1.w);
			float3 desaturateInitialColor39 = ( ( lerpResult80 * _Main_scale * _Main_color ) * float4( temp_output_58_0 , 0.0 ) * _Emission_scale * ( _Matcap_add_color + saturate( lerpResult131 ) ) ).rgb;
			float desaturateDot39 = dot( desaturateInitialColor39, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar39 = lerp( desaturateInitialColor39, desaturateDot39.xxx, _Desatruate );
			float2 appendResult102 = (float2(_Dissolve_speed_U , _Dissolve_speed_V));
			float2 uv_Tex_Dissolve = i.uv_texcoord * _Tex_Dissolve_ST.xy + _Tex_Dissolve_ST.zw;
			float cos239 = cos( ( ( _Dissolve_Rotator * UNITY_PI ) / 180.0 ) );
			float sin239 = sin( ( ( _Dissolve_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator239 = mul( uv_Tex_Dissolve - float2( 0.5,0.5 ) , float2x2( cos239 , -sin239 , sin239 , cos239 )) + float2( 0.5,0.5 );
			float2 panner99 = ( 1.0 * _Time.y * appendResult102 + rotator239);
			float4 tex2DNode23 = tex2D( _Tex_Dissolve, panner99 );
			float2 uv_Tex_Dissolve_gradent121 = i.uv_texcoord;
			float lerpResult113 = lerp( tex2DNode23.r , ( tex2DNode23.r - ( 1.0 - ( tex2D( _Tex_Dissolve_gradent, uv_Tex_Dissolve_gradent121 ).r / saturate( ( 1.0 - _FixedPower1 ) ) ) ) ) , _Use_dissolve_gradent);
			float temp_output_1_0_g1 = lerpResult113;
			float temp_output_107_0 = ( 1.0 - _Dissolve_fanxiang );
			float lerpResult9_g1 = lerp( temp_output_1_0_g1 , ( 1.0 - temp_output_1_0_g1 ) , temp_output_107_0);
			float lerpResult28 = lerp( _Dissolve , i.uv2_texcoord2.z , Custom235);
			float temp_output_3_0_g1 = _Dissolve_soft;
			float temp_output_85_0 = saturate( ( ( ( ( lerpResult9_g1 + 1.0 ) - ( lerpResult28 * ( 1.0 + ( 1.0 - temp_output_3_0_g1 ) ) ) ) - temp_output_3_0_g1 ) / ( 1.0 - temp_output_3_0_g1 ) ) );
			float temp_output_1_0_g2 = lerpResult113;
			float lerpResult9_g2 = lerp( temp_output_1_0_g2 , ( 1.0 - temp_output_1_0_g2 ) , temp_output_107_0);
			float temp_output_3_0_g2 = _Dissolve_soft_edge;
			float4 Dissiovle_color172 = ( ( temp_output_85_0 - saturate( ( ( ( ( lerpResult9_g2 + 1.0 ) - ( ( lerpResult28 + _Dissolve_edge ) * ( 1.0 + ( 1.0 - temp_output_3_0_g2 ) ) ) ) - temp_output_3_0_g2 ) / ( 1.0 - temp_output_3_0_g2 ) ) ) ) * _Dissolve_color );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 WorldNormal153 = ase_worldNormal;
			float dotResult156 = dot( WorldNormal153 , float3(0,1,0) );
			float temp_output_157_0 = (0.0 + (dotResult156 - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
			float lerpResult181 = lerp( ( 1.0 - temp_output_157_0 ) , temp_output_157_0 , _Light_);
			float4 Top_light_164 = ( saturate( pow( lerpResult181 , _Top_linght_power ) ) * _Top_linght_scale * _Top_light_color );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float dotResult189 = dot( ase_worldViewDir , WorldNormal153 );
			float2 appendResult191 = (float2(_Fresnel_Speed_U , _Fresnel_Speed_V));
			float2 panner194 = ( 1.0 * _Time.y * appendResult191 + i.uv_texcoord);
			float4 Fresnel_color205 = ( ( saturate( pow( ( 1.0 - dotResult189 ) , _Fresnel_power ) ) * tex2D( _Frednel_mask, panner194 ).r * _Fresnel_color ) * _Fresnel_scale );
			o.Emission = ( float4( ( desaturateVar39 * temp_output_58_0 ) , 0.0 ) + ( i.vertexColor * Dissiovle_color172 ) + Top_light_164 + Fresnel_color205 ).rgb;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float screenDepth281 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
			float distanceDepth281 = saturate( abs( ( screenDepth281 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _Depth_fade ) ) );
			float lerpResult282 = lerp( 1.0 , distanceDepth281 , _Use_Depth_fade);
			float Depth_fade284 = saturate( lerpResult282 );
			o.Alpha = ( i.vertexColor.a * temp_output_85_0 * saturate( ( _Matcap_add_color.a + tex2DNode9.a ) ) * Depth_fade284 );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.CommentaryNode;286;-78.10276,-1305.849;Inherit;False;1097.199;323;depth;6;280;281;282;283;284;285;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;268;1723.303,1422.357;Inherit;False;1929.605;591.3032;Vertex_scale;16;258;261;255;256;257;259;260;253;254;252;262;263;265;234;267;271;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;200;-315.5762,3406.075;Inherit;False;1908.192;1400.649;Fresnel;16;185;186;187;188;189;190;191;192;193;194;195;196;197;198;199;204;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;179;-808.1037,1347.931;Inherit;False;1306.694;597.5178;双溶解以及溶解减法边缘;8;85;113;87;86;88;107;103;114;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;178;-2493.649,1739.508;Inherit;False;1390.938;470.7229;定向溶解图;7;117;119;116;121;120;118;115;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;176;-108.0395,-743.304;Inherit;False;1102.963;400.6315;主帖图对比度;7;80;79;78;81;82;122;130;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;174;-381.2285,257.3568;Inherit;False;809.8159;474.0884;主帖图对比度调整;6;131;134;135;132;133;9;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;171;661.0285,1526.659;Inherit;False;559.6995;485.443;溶解颜色;3;94;92;95;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;170;-1391.956,2409.187;Inherit;False;916.0399;448.6289;自定义溶解;8;27;28;29;25;90;89;235;264;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;150;-3455.526,-757.1444;Inherit;False;1911.372;558.4434;Matcap_UV;12;138;139;140;143;142;145;144;146;147;148;149;141;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;136;-3468.589,192.6223;Inherit;False;1517.969;486.5469;Mat_cap;6;33;32;137;13;11;10;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;43;699.532,-403.1494;Inherit;False;283;262;olor;1;42;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;1738.746,674.5756;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2560.642,367.0243;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX_Water;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;2;True;_Zwrite_modo;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;2;-1;-1;-1;0;False;0;0;True;_Cull_modo;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.ViewMatrixNode;138;-3031.857,-509.701;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.WorldNormalVector;139;-3062.858,-381.701;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;140;-2741.857,-408.701;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CrossProductOpNode;145;-2372.025,-675.9445;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;144;-2707.425,-698.0444;Inherit;True;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DynamicAppendNode;148;-1935.225,-675.9445;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NegateNode;149;-2043.225,-566.2445;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;151;-285.9631,2371.234;Inherit;False;520.0781;311.037;World_normal;2;153;152;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;155;-293.0892,2693.344;Inherit;False;1872.212;703.7258;Top_light;14;182;158;157;156;169;154;164;160;163;162;161;159;181;165;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;28;-915.956,2499.187;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-1065.956,2494.187;Inherit;False;Property;_Dissolve;Dissolve;27;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;89;-1245.439,2741.816;Inherit;False;Property;_Dissolve_edge;Dissolve_edge;29;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;90;-629.47,2719.985;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;985.728,1588.302;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;92;711.0285,1576.659;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;172;1253.518,1587.068;Inherit;False;Dissiovle_color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;131;246.5875,451.8814;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;134;25.06864,519.0406;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;135;-331.2285,519.4453;Inherit;False;Property;_Mat_cap_control1;Mat_cap_control;12;0;Create;True;0;0;0;False;0;False;1,1,1,1;2,1,1.55,0.5;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;110.0139,307.3568;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;133;-61.03909,309.5927;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;177;-971.7343,1535.059;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;117;-1756.784,1956.231;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;119;-2122.416,1990.162;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;116;-1534.915,1955.115;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;121;-2116.991,1789.508;Inherit;True;Property;_Tex_Dissolve_gradent;Tex_Dissolve_gradent;34;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;120;-2443.649,1986.365;Inherit;False;Property;_FixedPower1;Dissolve_gradent_width;35;0;Create;False;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;118;-1971.349,1991.571;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;115;-1337.711,1923.576;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;85;213.5902,1442.789;Inherit;True;Dissolve;-1;;1;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;113;-438.6843,1397.931;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;87;204.2672,1691.449;Inherit;True;Dissolve;-1;;2;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;86;-173.3002,1488.352;Inherit;False;Property;_Dissolve_soft;Dissolve_soft;31;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-131.3615,1744.076;Inherit;False;Property;_Dissolve_soft_edge;Dissolve_soft_edge;28;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;107;-290.2894,1650.297;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-528.3786,1646.246;Inherit;False;Property;_Dissolve_fanxiang;Dissolve_fanxiang;32;1;[Enum];Create;True;0;2;off;0;on;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;114;-758.1037,1495.222;Inherit;False;Property;_Use_dissolve_gradent;Use_dissolve_gradent;33;1;[Enum];Create;True;0;2;Off;0;On;1;0;True;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;152;-235.9631,2428.271;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RegisterLocalVarNode;153;10.11487,2421.234;Inherit;False;WorldNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;154;-256.2212,2946.655;Inherit;False;Constant;_Vector0;Vector 0;19;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;169;-276.4902,2746.929;Inherit;False;153;WorldNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;156;8.976807,2752.121;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;157;280.4132,2752.474;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;164;1400.325,2748.925;Inherit;True;Top_light_;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;163;1185.022,2752.586;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;162;1045.862,2751.867;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;159;821.671,2744.256;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;181;627.924,2753.551;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;158;609.5001,2942.06;Inherit;False;Property;_Top_linght_power;Top_linght_power;38;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;165;481.8893,2737.038;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;182;342.9239,3055.551;Inherit;False;Property;_Light_;Light_;36;1;[Enum];Create;True;0;2;Down;0;Up;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;161;892.588,3005.255;Inherit;False;Property;_Top_linght_scale;Top_linght_scale;37;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;185;122.4984,3456.075;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;186;154.8195,3654.295;Inherit;False;153;WorldNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;189;368.4981,3547.075;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;193;618.5192,3761.188;Inherit;True;Property;_Fresnel_power;Fresnel_power;42;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;195;810.4841,3547.344;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;198;1061.498,3545.075;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;190;-220.5448,3981.649;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;191;58.13395,4149.708;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;194;284.4492,4040.985;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;187;-194.3249,4238.84;Inherit;False;Property;_Fresnel_Speed_U;Fresnel_Speed_U;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;188;-189.5245,4311.781;Inherit;False;Property;_Fresnel_Speed_V;Fresnel_Speed_V;44;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;199;1328.016,3544.524;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;192;626.4982,3548.075;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;1616.683,3546.825;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;204;1389.683,3785.825;Inherit;False;Property;_Fresnel_scale;Fresnel_scale;41;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;1798.354,3550.054;Inherit;False;Fresnel_color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;183;1571.847,549.198;Inherit;False;164;Top_light_;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;206;1565.093,628.2492;Inherit;False;205;Fresnel_color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;197;567.9033,4010.112;Inherit;True;Property;_Frednel_mask;Frednel_mask;40;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;196;629.2284,4199.683;Inherit;False;Property;_Fresnel_color;Fresnel_color;43;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;160;878.7218,3092.331;Inherit;False;Property;_Top_light_color;Top_light_color;39;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;40;1359.991,97.67767;Inherit;False;Property;_Desatruate;Desatruate;5;0;Create;True;0;0;0;False;0;False;0;0.295;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;97;1933.939,344.5186;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;39;1540.497,242.7435;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;1369.739,240.9961;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;215;1769.943,253.5975;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ColorNode;42;749.532,-353.1494;Inherit;False;Property;_Main_color;Main_color;8;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0.8160377,0.918977,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;80;812.9241,-622.2361;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;630.8771,-693.304;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;78;459.8241,-691.068;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;591.405,-555.077;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;82;243.1085,-554.6725;Inherit;False;Property;_Main_control;Main_control;18;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;122;-58.03946,-629.1537;Inherit;True;Property;_Main_tex;Main_tex;17;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;129;1036.878,-509.1986;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;130;841.52,-486.5626;Inherit;False;Property;_Main_scale;Main_scale;20;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;57;729.4568,388.5806;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;58;1065.733,367.6637;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;61;1072.224,451.1765;Inherit;False;Property;_Emission_scale;Emission_scale;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;96;1119.058,605.907;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;173;879.7642,626.3385;Inherit;False;172;Dissiovle_color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;184;1982.375,-253.7253;Inherit;False;Property;_Cull_modo;Cull_modo;4;1;[Enum];Fetch;True;0;1;Option1;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;217;1981.411,-172.5878;Inherit;False;Property;_Zwrite_modo;Zwrite_modo;3;1;[ToggleUI];Fetch;True;0;3;Option1;0;Option2;1;Option3;2;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;95;714.6528,1800.102;Inherit;False;Property;_Dissolve_color;Dissolve_color;30;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;218;1369.83,807.1893;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;124;-460.1815,-600.3737;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;141;-1761.153,-689.1325;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT;0.5;False;2;FLOAT;0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PosVertexDataNode;143;-3321.526,-700.1444;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TransformPositionNode;142;-3003.225,-706.1445;Inherit;False;Object;View;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;147;-2170.825,-676.7444;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.BreakToComponentsNode;146;-2342.125,-569.3445;Inherit;False;FLOAT;1;0;FLOAT;0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.ViewMatrixNode;10;-2839.619,242.6223;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-3448.988,415.0385;Inherit;False;Property;_Normal_scale;Normal_scale;14;0;Create;True;0;0;0;False;0;False;0;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;221;-3902.481,566.5118;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;223;-3744.88,401.8117;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;219;-4074.971,399.5955;Inherit;False;0;32;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;220;-4139.277,550.0117;Inherit;False;Property;_Normal_speed_U;Normal_speed_U;15;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;222;-4140.177,621.2114;Inherit;False;Property;_Normal_speed_V;Normal_speed_V;16;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;11;-2870.619,370.6223;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-2549.619,343.6224;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;137;-2376.715,278.3909;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT;0.5;False;2;FLOAT;0.5;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;32;-3251.388,368.5623;Inherit;True;Property;_Normal;Normal;13;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;17a4a50ba0987b0418777049ea4015e2;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;125;-904.5813,-333.1737;Inherit;False;Property;_Main_speed_U;Main_speed_U;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;127;-667.7825,-316.6737;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;126;-905.4813,-261.9737;Inherit;False;Property;_Main_speed_V;Main_speed_V;22;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;232;-1010.235,-506.2643;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1282.956,2643.188;Inherit;False;Property;_custom;custom;6;1;[Enum];Create;True;0;2;Off;0;On;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;236;-1029.04,-411.2124;Inherit;False;235;Custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;233;-838.2324,-498.2643;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;227;-571.436,-681.5964;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;231;-1260.44,-513.5968;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PiNode;207;-1182.679,-605.5439;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;208;-995.0702,-610.6704;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;209;-787.0699,-738.6707;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;211;-1395.071,-610.6704;Inherit;False;Property;_Main_Rotator;Main_Rotator;19;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;210;-1036.975,-806.0973;Inherit;False;0;122;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;243;626.4427,269.0157;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;248;356.6073,97.74036;Inherit;False;Property;_Matcap_add_color;Matcap_add_color;11;0;Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;250;625.1331,646.7015;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;251;765.0222,682.6361;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;23;-2097.647,1418.743;Inherit;True;Property;_Tex_Dissolve;Tex_Dissolve;23;0;Create;True;0;0;0;False;0;False;-1;None;b8236d5ab6f141a4d80fdf8b950117db;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;100;-2794.851,1541.222;Inherit;False;Property;_Dissolve_speed_U;Dissolve_speed_U;25;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;101;-2792.851,1611.222;Inherit;False;Property;_Dissolve_speed_V;Dissolve_speed_V;26;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;102;-2544.852,1578.222;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;99;-2339.851,1448.222;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;239;-2805.418,1375.156;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;237;-3201.028,1508.283;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;238;-3013.419,1503.157;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;212;-3105.517,1377.691;Inherit;False;0;23;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;242;-3423.959,1493.685;Inherit;False;Property;_Dissolve_Rotator;Dissolve_Rotator;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;27;-1363.973,2449.487;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;235;-1133.268,2649.614;Inherit;False;Custom;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;258;1996.234,1605.485;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;261;1773.303,1590.887;Inherit;False;Property;_Vertex_Rotator;Vertex_Rotator;47;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;255;2652.411,1675.424;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;256;2857.412,1545.424;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;257;2391.845,1472.357;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;259;2183.844,1600.359;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;253;2402.412,1638.424;Inherit;False;Property;_Vertex_speed_U;Vertex_speed_U;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;254;2404.412,1708.424;Inherit;False;Property;_Vertex_speed_V;Vertex_speed_V;50;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;252;3099.616,1515.945;Inherit;True;Property;_Tex_Vertex;Tex_Vertex;46;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;262;3490.908,1541.676;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;265;3247.209,1731.234;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;270;2251.583,688.9162;Inherit;False;269;Vertex_output;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;267;3018.475,1886.584;Inherit;False;235;Custom;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;264;-1135.648,2572.647;Inherit;False;Custom_vertex;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;234;2856.06,1805.946;Inherit;False;264;Custom_vertex;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;263;2924.585,1701.627;Inherit;False;Property;_vertex_scale;vertex_scale;48;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;271;3089.768,1786.401;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;260;2091.745,1474.893;Inherit;False;0;252;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;269;3806.031,1521.022;Inherit;False;Vertex_output;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;272;3233.22,1903.285;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;273;3151.299,2083.373;Inherit;True;Property;_Vertex_mask;Vertex_mask;51;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;274;-1451.563,-437.8657;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;275;-1690.835,-333.256;Inherit;False;Property;_Matcap_tex_scale;Matcap_tex_scale;10;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;278;-1598.574,-546.3073;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;276;-1198.574,-220.3073;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;9;-368.6543,312.1218;Inherit;True;Property;_Matecap;Matecap;9;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;c17ecc07f3d8c924ba93cd6d49ea6ffb;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;279;423.4486,452.6313;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;280;-28.10276,-1228.005;Inherit;False;Property;_Depth_fade;Depth_fade;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;281;172.7129,-1247.56;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;282;455.0962,-1252.849;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;283;621.9615,-1246.273;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;285;166.0962,-1098.849;Inherit;False;Property;_Use_Depth_fade;Use_Depth_fade;0;1;[Enum];Create;True;0;2;Off;0;On;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;284;795.0962,-1255.849;Inherit;False;Depth_fade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;287;1564.212,959.0231;Inherit;False;284;Depth_fade;1;0;OBJECT;;False;1;FLOAT;0
WireConnection;60;0;57;4
WireConnection;60;1;85;0
WireConnection;60;2;251;0
WireConnection;60;3;287;0
WireConnection;0;2;97;0
WireConnection;0;9;60;0
WireConnection;0;11;270;0
WireConnection;139;0;32;0
WireConnection;140;0;138;0
WireConnection;140;1;139;0
WireConnection;145;0;144;0
WireConnection;145;1;140;0
WireConnection;144;0;142;0
WireConnection;148;0;149;0
WireConnection;148;1;147;0
WireConnection;149;0;147;1
WireConnection;28;0;25;0
WireConnection;28;1;27;3
WireConnection;28;2;235;0
WireConnection;90;0;28;0
WireConnection;90;1;89;0
WireConnection;94;0;92;0
WireConnection;94;1;95;0
WireConnection;92;0;85;0
WireConnection;92;1;87;0
WireConnection;172;0;94;0
WireConnection;131;0;132;0
WireConnection;131;1;134;0
WireConnection;131;2;135;4
WireConnection;134;0;9;0
WireConnection;134;1;135;3
WireConnection;132;0;133;0
WireConnection;132;1;135;2
WireConnection;133;0;9;0
WireConnection;133;1;135;1
WireConnection;177;0;115;0
WireConnection;117;0;121;1
WireConnection;117;1;118;0
WireConnection;119;0;120;0
WireConnection;116;0;117;0
WireConnection;118;0;119;0
WireConnection;115;0;23;1
WireConnection;115;1;116;0
WireConnection;85;1;113;0
WireConnection;85;2;28;0
WireConnection;85;3;86;0
WireConnection;85;4;107;0
WireConnection;113;0;23;1
WireConnection;113;1;177;0
WireConnection;113;2;114;0
WireConnection;87;1;113;0
WireConnection;87;2;90;0
WireConnection;87;3;88;0
WireConnection;87;4;107;0
WireConnection;107;0;103;0
WireConnection;153;0;152;0
WireConnection;156;0;169;0
WireConnection;156;1;154;0
WireConnection;157;0;156;0
WireConnection;164;0;163;0
WireConnection;163;0;162;0
WireConnection;163;1;161;0
WireConnection;163;2;160;0
WireConnection;162;0;159;0
WireConnection;159;0;181;0
WireConnection;159;1;158;0
WireConnection;181;0;165;0
WireConnection;181;1;157;0
WireConnection;181;2;182;0
WireConnection;165;0;157;0
WireConnection;189;0;185;0
WireConnection;189;1;186;0
WireConnection;195;0;192;0
WireConnection;195;1;193;0
WireConnection;198;0;195;0
WireConnection;191;0;187;0
WireConnection;191;1;188;0
WireConnection;194;0;190;0
WireConnection;194;2;191;0
WireConnection;199;0;198;0
WireConnection;199;1;197;1
WireConnection;199;2;196;0
WireConnection;192;0;189;0
WireConnection;203;0;199;0
WireConnection;203;1;204;0
WireConnection;205;0;203;0
WireConnection;197;1;194;0
WireConnection;97;0;215;0
WireConnection;97;1;96;0
WireConnection;97;2;183;0
WireConnection;97;3;206;0
WireConnection;39;0;59;0
WireConnection;39;1;40;0
WireConnection;59;0;129;0
WireConnection;59;1;58;0
WireConnection;59;2;61;0
WireConnection;59;3;243;0
WireConnection;215;0;39;0
WireConnection;215;1;58;0
WireConnection;80;0;79;0
WireConnection;80;1;81;0
WireConnection;80;2;82;4
WireConnection;79;0;78;0
WireConnection;79;1;82;2
WireConnection;78;0;122;0
WireConnection;78;1;82;1
WireConnection;81;0;122;0
WireConnection;81;1;82;3
WireConnection;122;1;124;0
WireConnection;129;0;80;0
WireConnection;129;1;130;0
WireConnection;129;2;42;0
WireConnection;58;0;57;0
WireConnection;96;0;57;0
WireConnection;96;1;173;0
WireConnection;124;0;227;0
WireConnection;124;2;127;0
WireConnection;141;0;148;0
WireConnection;142;0;143;0
WireConnection;147;0;145;0
WireConnection;221;0;220;0
WireConnection;221;1;222;0
WireConnection;223;0;219;0
WireConnection;223;2;221;0
WireConnection;11;0;32;0
WireConnection;13;0;10;0
WireConnection;13;1;11;0
WireConnection;137;0;13;0
WireConnection;32;1;223;0
WireConnection;32;5;33;0
WireConnection;127;0;125;0
WireConnection;127;1;126;0
WireConnection;232;0;231;1
WireConnection;232;1;231;2
WireConnection;233;1;232;0
WireConnection;233;2;236;0
WireConnection;227;0;209;0
WireConnection;227;1;233;0
WireConnection;207;0;211;0
WireConnection;208;0;207;0
WireConnection;209;0;210;0
WireConnection;209;2;208;0
WireConnection;243;0;248;0
WireConnection;243;1;279;0
WireConnection;250;0;248;4
WireConnection;250;1;9;4
WireConnection;251;0;250;0
WireConnection;23;1;99;0
WireConnection;102;0;100;0
WireConnection;102;1;101;0
WireConnection;99;0;239;0
WireConnection;99;2;102;0
WireConnection;239;0;212;0
WireConnection;239;2;238;0
WireConnection;237;0;242;0
WireConnection;238;0;237;0
WireConnection;235;0;29;0
WireConnection;258;0;261;0
WireConnection;255;0;253;0
WireConnection;255;1;254;0
WireConnection;256;0;257;0
WireConnection;256;2;255;0
WireConnection;257;0;260;0
WireConnection;257;2;259;0
WireConnection;259;0;258;0
WireConnection;252;1;256;0
WireConnection;262;0;252;1
WireConnection;262;1;265;0
WireConnection;262;2;272;0
WireConnection;262;3;273;1
WireConnection;265;0;263;0
WireConnection;265;1;271;0
WireConnection;265;2;267;0
WireConnection;264;0;27;4
WireConnection;271;0;263;0
WireConnection;271;1;234;0
WireConnection;269;0;262;0
WireConnection;274;0;278;0
WireConnection;274;1;275;0
WireConnection;278;0;141;0
WireConnection;276;0;274;0
WireConnection;9;1;276;0
WireConnection;279;0;131;0
WireConnection;281;0;280;0
WireConnection;282;1;281;0
WireConnection;282;2;285;0
WireConnection;283;0;282;0
WireConnection;284;0;283;0
ASEEND*/
//CHKSM=B9110280E6615CB62E7B055438ECAA170FCEBC42