// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "ROX_FX_Shader/VFXCore"
{
	Properties
	{
		[Enum(AlphaBlend,10,Additive,1)]_Dst("Add/Blend", Float) = 10
		[Enum(UnityEngine.Rendering.CullMode)]_CullMode("CullMode", Float) = 0
		_Emission("Emission", Float) = 1
		_Opacity("Opacity", Float) = 1
		_IntensityPower("EmissionPower", Float) = 1
		_OpacityPower("OpacityPower", Float) = 1
		[Enum(OFF,0,ON,1)]_Custom_UV("Custom_UV", Float) = 0
		[NoScaleOffset][Header(Main Mode)]_MainTex("MainTex", 2D) = "white" {}
		[HDR]_Color("Color", Color) = (1,1,1,1)
		[Enum(R,0,A,1)]_A_R("A_R", Float) = 0
		_MianTilingOffset("MianTilingOffset", Vector) = (1,1,0,0)
		[Toggle]_MainPolar("MainPolar", Float) = 0
		[Enum(Repeat,0,Clmap,1)]_MainTexClamp("MainTexClamp", Float) = 0
		_MainTexRotating2("MainTexRotating", Range( 0 , 360)) = 0
		_MainTex_U("MainTex_U", Float) = 0
		_MainTex_V("MainTex_V", Float) = 0
		[NoScaleOffset][Header(Mask01 Mode)]_MaskTex1("MaskTex01Data", 2D) = "white" {}
		[Enum(R,0,A,1)]_MaskTex01AR("MaskTex01A/R", Float) = 0
		_Mask01TilingOffset1("Mask01TilingOffset", Vector) = (1,1,0,0)
		[Toggle]_Mask01Polar("Mask01Polar", Float) = 0
		[Enum(Repeat,0,Clmap,1)]_MaskTex01Clamp("MaskTex01Clamp", Float) = 0
		_Mask01TexRotating1("Mask01TexRotating", Range( 0 , 360)) = 0
		_MaskTex_U2("MaskTex_U1", Float) = 0
		_MaskTex_V2("MaskTex_V1", Float) = 0
		[Header(Mask02 Mode)]_MaskTex2("MaskTex02", 2D) = "white" {}
		[Enum(R,0,A,1)]_MaskTex02AR("MaskTex02A/R", Float) = 0
		[Enum(Repeat,0,Clmap,1)]_MaskTex02Clamp("MaskTex02Clamp", Float) = 0
		_MaskTex_U3("MaskTex_U2", Float) = 0
		_MaskTex_V3("MaskTex_V2", Float) = 0
		[Enum(OFF,0,ON,1)][Header(Noise Mode)]_OpenNoise("OpenNoise", Float) = 0
		_NoiseTex("NoiseTex", 2D) = "white" {}
		[Enum(R,0,A,1)]_NoiseAR("NoiseA/R", Float) = 0
		[Toggle]_NoisePolar("NoisePolar", Float) = 0
		_NoiseTexRotating("NoiseTexRotating", Range( 0 , 360)) = 0
		_NoiseIntensity("NoiseIntensity", Float) = 0
		_NoiseTex_U1("NoiseTex_U", Float) = 0
		_NoiseTex_V1("NoiseTex_V", Float) = 0
		[Enum(OFF,0,ON,1)]_NoiseMask01("NoiseMask01", Float) = 0
		[Enum(OFF,0,ON,1)]_NoiseDissolve("NoiseDissolve", Float) = 0
		[Enum(OFF,0,ON,1)]_NoiseFixedTex("NoiseFixedTex", Float) = 0
		[Enum(OFF,0,ON,1)]_NoiseGradient("NoiseGradient", Float) = 0
		[NoScaleOffset][Header(Dissslve Mode)]_DissolveTex("DissolveTex", 2D) = "white" {}
		[Enum(R,0,A,1)]_DissolveAR("DissolveA/R", Float) = 0
		_DissolveTilingOffset("DissolveTilingOffset", Vector) = (1,1,0,0)
		[Toggle]_DissolvePolar("DissolvePolar", Float) = 0
		[Enum(Repeat,0,Clmap,1)]_DissolveTexClamp1("DissolveTexClamp", Float) = 0
		_DissolveTexRotating1("DissolveTexRotating", Range( 0 , 360)) = 0
		_Dissolve_U("Dissolve_U", Float) = 0
		_Dissolve_V("Dissolve_V", Float) = 0
		_DissolveIntensity("DissolveIntensity", Range( 0 , 2)) = 0
		_SoftaDissolve1("SoftaDissolve", Range( 0 , 0.5)) = 0
		_LineWidth("LineWidth", Range( 0 , 1)) = 0
		_LineRange("LineRange", Range( 0 , 1)) = 0
		[HDR]_DissolveLineColor1("LineColor", Color) = (1,1,1,1)
		_LineIntensity("LineIntensity", Float) = 1
		[Header(DissloveTexPlus)][Enum(OFF,0,ON,1)]_OpenFixed("OpenFixed", Float) = 0
		[Enum(OFF,0,ON,1)]_SystemFixed("SystemFixed", Float) = 0
		_FixedPower("FixedPower", Range( 0 , 1)) = 0
		[NoScaleOffset][Header(FixedTex Mode)]_FixedTex("FixedTex", 2D) = "white" {}
		[Enum(R,0,A,1)]_FixedTexAR("FixedTexA/R", Float) = 1
		_FixedTexTilingOffset1("FixedTexTilingOffset", Vector) = (1,1,0,0)
		[Toggle]_FixedTexPola("FixedTexPola", Float) = 0
		_FixedTexRotating2("FixedTexRotating", Range( 0 , 360)) = 0
		[Header(Vertex Mode)]_VertexTex("VertexTex", 2D) = "white" {}
		_VertexIntensity("VertexIntensity", Float) = 0
		_VertexU("VertexU", Float) = 0
		_VertexV("VertexV", Float) = 0
		_VertexTexMask("VertexTexMask", 2D) = "white" {}
		[NoScaleOffset][Header(Gradient Mode)]_GradientTex("Gradientin", 2D) = "white" {}
		_GradientTilingOffset2("GradientTilingOffset", Vector) = (1,1,0,0)
		[Toggle]_GradientPolar1("GradientPolar", Float) = 0
		_GradientRotating("GradientRotating", Range( 0 , 360)) = 0
		_GradientinIntensity("GradientinIntensity", Range( 0 , 1)) = 1
		_Gradient_U1("Gradient_U", Float) = 0
		_Gradient_V1("Gradient_V", Float) = 0
		[Header(Fresnel......e(OvO)e)][Toggle]_OpenFresnel("OpenFresnel", Float) = 0
		[HDR]_FresnelColor("FresnelColor", Color) = (1,1,1,1)
		_Fresnelsoft("Fresnelsoft", Float) = 5
		_Fresnelwidth("Fresnelwidth", Float) = 1
		[HideInInspector] _tex4coord2( "", 2D ) = "white" {}
		[HideInInspector] _tex4coord4( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull [_CullMode]
		ZWrite Off
		Blend SrcAlpha [_Dst]
		
		CGPROGRAM
		#include "UnityPBSLighting.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma exclude_renderers xbox360 xboxone ps4 psp2 
		#pragma surface surf StandardCustomLighting keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float2 uv_texcoord;
			float4 uv2_tex4coord2;
			float3 viewDir;
			float3 worldNormal;
			float4 vertexColor : COLOR;
			float4 uv4_tex4coord4;
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

		uniform float _Dst;
		uniform float _CullMode;
		uniform sampler2D _VertexTex;
		uniform half _VertexU;
		uniform half _VertexV;
		uniform float4 _VertexTex_ST;
		uniform sampler2D _VertexTexMask;
		uniform float4 _VertexTexMask_ST;
		uniform float _VertexIntensity;
		uniform float _Custom_UV;
		uniform half _SoftaDissolve1;
		uniform sampler2D _DissolveTex;
		uniform half _Dissolve_U;
		uniform half _Dissolve_V;
		uniform float _DissolvePolar;
		uniform float _MainTexRotating2;
		uniform float _Mask01TexRotating1;
		uniform float _NoiseTexRotating;
		uniform float _DissolveTexRotating1;
		uniform float4 _DissolveTilingOffset;
		uniform float _DissolveTexClamp1;
		uniform sampler2D _NoiseTex;
		uniform float _NoiseTex_U1;
		uniform float _NoiseTex_V1;
		uniform float4 _NoiseTex_ST;
		uniform float _NoisePolar;
		uniform float _NoiseAR;
		uniform half _NoiseIntensity;
		uniform float _OpenNoise;
		uniform float _NoiseDissolve;
		uniform float _DissolveAR;
		uniform sampler2D _FixedTex;
		uniform float _FixedTexPola;
		uniform float _FixedTexRotating2;
		uniform float4 _FixedTexTilingOffset1;
		uniform float _NoiseFixedTex;
		uniform float _FixedTexAR;
		uniform float _SystemFixed;
		uniform float _DissolveIntensity;
		uniform float _FixedPower;
		uniform float _OpenFixed;
		uniform half _LineRange;
		uniform half _LineWidth;
		uniform half4 _DissolveLineColor1;
		uniform float _LineIntensity;
		uniform sampler2D _MainTex;
		uniform float _MainTex_U;
		uniform float _MainTex_V;
		uniform float _MainPolar;
		uniform float4 _MianTilingOffset;
		uniform float _MainTexClamp;
		uniform float _Fresnelsoft;
		uniform float _Fresnelwidth;
		uniform float4 _FresnelColor;
		uniform float _OpenFresnel;
		uniform half4 _Color;
		uniform sampler2D _GradientTex;
		uniform half _Gradient_U1;
		uniform half _Gradient_V1;
		uniform float _GradientPolar1;
		uniform float _GradientRotating;
		uniform float4 _GradientTilingOffset2;
		uniform float _NoiseGradient;
		uniform float _GradientinIntensity;
		uniform half _Emission;
		uniform float _IntensityPower;
		uniform float _A_R;
		uniform sampler2D _MaskTex1;
		uniform half _MaskTex_U2;
		uniform half _MaskTex_V2;
		uniform float _Mask01Polar;
		uniform float4 _Mask01TilingOffset1;
		uniform float _MaskTex01Clamp;
		uniform float _NoiseMask01;
		uniform float _MaskTex01AR;
		uniform sampler2D _MaskTex2;
		uniform half _MaskTex_U3;
		uniform half _MaskTex_V3;
		uniform float4 _MaskTex2_ST;
		uniform float _MaskTex02Clamp;
		uniform float _MaskTex02AR;
		uniform half _Opacity;
		uniform float _OpacityPower;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult1432 = (float2(_VertexU , _VertexV));
			float2 uv_VertexTex = v.texcoord.xy * _VertexTex_ST.xy + _VertexTex_ST.zw;
			float2 VertexUV1445 = ( ( _Time.y * appendResult1432 ) + uv_VertexTex );
			float2 uv_VertexTexMask = v.texcoord * _VertexTexMask_ST.xy + _VertexTexMask_ST.zw;
			float3 desaturateInitialColor1438 = ( tex2Dlod( _VertexTex, float4( VertexUV1445, 0, 0.0) ) * tex2Dlod( _VertexTexMask, float4( uv_VertexTexMask, 0, 0.0) ) ).rgb;
			float desaturateDot1438 = dot( desaturateInitialColor1438, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar1438 = lerp( desaturateInitialColor1438, desaturateDot1438.xxx, 1.0 );
			float3 ase_vertexNormal = v.normal.xyz;
			float Costom2Z877 = v.texcoord3.z;
			float Custom_UV671 = _Custom_UV;
			float lerpResult1521 = lerp( 0.0 , Costom2Z877 , Custom_UV671);
			float3 VertexTEX1442 = ( desaturateVar1438 * ase_vertexNormal * ( _VertexIntensity + lerpResult1521 ) );
			v.vertex.xyz += VertexTEX1442;
			v.vertex.w = 1;
		}

		inline half4 LightingStandardCustomLighting( inout SurfaceOutputCustomLightingCustom s, half3 viewDir, UnityGI gi )
		{
			UnityGIInput data = s.GIData;
			Input i = s.SurfInput;
			half4 c = 0;
			float2 appendResult586 = (float2(_MainTex_U , _MainTex_V));
			float2 appendResult604 = (float2(i.uv2_tex4coord2.x , i.uv2_tex4coord2.y));
			float2 Costom1XY605 = appendResult604;
			float Custom_UV671 = _Custom_UV;
			float2 lerpResult808 = lerp( float2( 0,0 ) , Costom1XY605 , Custom_UV671);
			float2 uv_TexCoord1606 = i.uv_texcoord * float2( 2,2 );
			float2 temp_output_1607_0 = ( uv_TexCoord1606 - float2( 1,1 ) );
			float2 appendResult1616 = (float2(frac( ( atan2( (temp_output_1607_0).x , (temp_output_1607_0).y ) / 6.28318548202515 ) ) , length( temp_output_1607_0 )));
			float2 Polar1617 = appendResult1616;
			float2 lerpResult797 = lerp( i.uv_texcoord , Polar1617 , _MainPolar);
			float4 appendResult749 = (float4(_MainTexRotating2 , _Mask01TexRotating1 , _NoiseTexRotating , _DissolveTexRotating1));
			float4 break750 = appendResult749;
			float MainTexWhirl759 = ( ( break750.x * UNITY_PI ) / 180.0 );
			float cos615 = cos( MainTexWhirl759 );
			float sin615 = sin( MainTexWhirl759 );
			float2 rotator615 = mul( lerpResult797 - float2( 0.5,0.5 ) , float2x2( cos615 , -sin615 , sin615 , cos615 )) + float2( 0.5,0.5 );
			float2 appendResult812 = (float2(_MianTilingOffset.x , _MianTilingOffset.y));
			float2 appendResult813 = (float2(_MianTilingOffset.z , _MianTilingOffset.w));
			float2 panner814 = ( 1.0 * _Time.y * appendResult586 + ( lerpResult808 + (rotator615*appendResult812 + appendResult813) ));
			float2 lerpResult618 = lerp( panner814 , saturate( panner814 ) , _MainTexClamp);
			float2 appendResult887 = (float2(_NoiseTex_U1 , _NoiseTex_V1));
			float2 uv_NoiseTex = i.uv_texcoord * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
			float2 lerpResult1394 = lerp( uv_NoiseTex , Polar1617 , _NoisePolar);
			float NoiseTexWhirl761 = ( ( break750.z * UNITY_PI ) / 180.0 );
			float cos922 = cos( NoiseTexWhirl761 );
			float sin922 = sin( NoiseTexWhirl761 );
			float2 rotator922 = mul( lerpResult1394 - float2( 0.5,0.5 ) , float2x2( cos922 , -sin922 , sin922 , cos922 )) + float2( 0.5,0.5 );
			float2 panner901 = ( 1.0 * _Time.y * appendResult887 + rotator922);
			float2 NoiseTezUV889 = panner901;
			float4 tex2DNode854 = tex2D( _NoiseTex, NoiseTezUV889 );
			float lerpResult1408 = lerp( tex2DNode854.r , tex2DNode854.a , _NoiseAR);
			float Costom1W871 = i.uv2_tex4coord2.w;
			float lerpResult883 = lerp( 0.0 , Costom1W871 , Custom_UV671);
			float lerpResult909 = lerp( 0.0 , ( (-0.5 + (lerpResult1408 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) * ( _NoiseIntensity + lerpResult883 ) ) , _OpenNoise);
			half Noise895 = lerpResult909;
			float2 MianUV620 = ( lerpResult618 + Noise895 );
			float4 tex2DNode1 = tex2D( _MainTex, MianUV620 );
			float lerpResult303 = lerp( tex2DNode1.r , tex2DNode1.a , _A_R);
			float2 appendResult631 = (float2(_MaskTex_U2 , _MaskTex_V2));
			float2 appendResult652 = (float2(i.uv4_tex4coord4.x , i.uv4_tex4coord4.y));
			float2 Costom2XY653 = appendResult652;
			float2 lerpResult852 = lerp( float2( 0,0 ) , Costom2XY653 , Custom_UV671);
			float2 lerpResult824 = lerp( i.uv_texcoord , Polar1617 , _Mask01Polar);
			float Mask01Whirl760 = ( ( break750.y * UNITY_PI ) / 180.0 );
			float cos825 = cos( Mask01Whirl760 );
			float sin825 = sin( Mask01Whirl760 );
			float2 rotator825 = mul( lerpResult824 - float2( 0.5,0.5 ) , float2x2( cos825 , -sin825 , sin825 , cos825 )) + float2( 0.5,0.5 );
			float2 appendResult833 = (float2(_Mask01TilingOffset1.x , _Mask01TilingOffset1.y));
			float2 appendResult834 = (float2(_Mask01TilingOffset1.z , _Mask01TilingOffset1.w));
			float2 panner831 = ( 1.0 * _Time.y * appendResult631 + ( lerpResult852 + (rotator825*appendResult833 + appendResult834) ));
			float2 lerpResult660 = lerp( panner831 , saturate( panner831 ) , _MaskTex01Clamp);
			float2 Mask01UV661 = ( lerpResult660 + ( Noise895 * _NoiseMask01 ) );
			float4 tex2DNode641 = tex2D( _MaskTex1, Mask01UV661 );
			float lerpResult1524 = lerp( tex2DNode641.r , tex2DNode641.a , _MaskTex01AR);
			float2 appendResult743 = (float2(_MaskTex_U3 , _MaskTex_V3));
			float2 uv_MaskTex2 = i.uv_texcoord * _MaskTex2_ST.xy + _MaskTex2_ST.zw;
			float2 temp_output_748_0 = ( ( _Time.y * appendResult743 ) + uv_MaskTex2 );
			float2 lerpResult784 = lerp( temp_output_748_0 , saturate( temp_output_748_0 ) , _MaskTex02Clamp);
			float2 Mask02UV786 = lerpResult784;
			float4 tex2DNode739 = tex2D( _MaskTex2, Mask02UV786 );
			float lerpResult1523 = lerp( tex2DNode739.r , tex2DNode739.a , _MaskTex02AR);
			float MaskAlpha790 = ( lerpResult1524 * lerpResult1523 );
			float2 appendResult986 = (float2(_Dissolve_U , _Dissolve_V));
			float2 lerpResult973 = lerp( i.uv_texcoord , Polar1617 , _DissolvePolar);
			float DissolveWhirl768 = ( ( break750.w * UNITY_PI ) / 180.0 );
			float cos971 = cos( DissolveWhirl768 );
			float sin971 = sin( DissolveWhirl768 );
			float2 rotator971 = mul( lerpResult973 - float2( 0.5,0.5 ) , float2x2( cos971 , -sin971 , sin971 , cos971 )) + float2( 0.5,0.5 );
			float2 appendResult977 = (float2(_DissolveTilingOffset.x , _DissolveTilingOffset.y));
			float2 appendResult978 = (float2(_DissolveTilingOffset.z , _DissolveTilingOffset.w));
			float2 panner987 = ( 1.0 * _Time.y * appendResult986 + (rotator971*appendResult977 + appendResult978));
			float2 lerpResult989 = lerp( panner987 , saturate( panner987 ) , _DissolveTexClamp1);
			float2 DissolveUV997 = ( lerpResult989 + ( Noise895 * _NoiseDissolve ) );
			float4 tex2DNode968 = tex2D( _DissolveTex, DissolveUV997 );
			float lerpResult1406 = lerp( tex2DNode968.r , tex2DNode968.a , _DissolveAR);
			float2 lerpResult1215 = lerp( i.uv_texcoord , Polar1617 , _FixedTexPola);
			float cos1220 = cos( ( ( _FixedTexRotating2 * UNITY_PI ) / 180.0 ) );
			float sin1220 = sin( ( ( _FixedTexRotating2 * UNITY_PI ) / 180.0 ) );
			float2 rotator1220 = mul( lerpResult1215 - float2( 0.5,0.5 ) , float2x2( cos1220 , -sin1220 , sin1220 , cos1220 )) + float2( 0.5,0.5 );
			float2 appendResult1226 = (float2(_FixedTexTilingOffset1.x , _FixedTexTilingOffset1.y));
			float2 appendResult1227 = (float2(_FixedTexTilingOffset1.z , _FixedTexTilingOffset1.w));
			float2 DisslovePlusUV1053 = ( (rotator1220*appendResult1226 + appendResult1227) + ( Noise895 * _NoiseFixedTex ) );
			float4 tex2DNode1385 = tex2D( _FixedTex, DisslovePlusUV1053 );
			float lerpResult1404 = lerp( tex2DNode1385.r , tex2DNode1385.a , _FixedTexAR);
			float lerpResult1389 = lerp( lerpResult1404 , ( 1.0 - (DisslovePlusUV1053).y ) , _SystemFixed);
			float DissolveIntensity1362 = ( _DissolveIntensity - 1.0 );
			float FixedTex1319 = ( ( lerpResult1389 - DissolveIntensity1362 ) / saturate( ( 1.0 - _FixedPower ) ) );
			float lerpResult1370 = lerp( lerpResult1406 , ( lerpResult1406 - ( 1.0 - FixedTex1319 ) ) , _OpenFixed);
			float Costom1Z870 = i.uv2_tex4coord2.z;
			float lerpResult1518 = lerp( 0.0 , ( Costom1Z870 * 2.0 ) , Custom_UV671);
			float clampResult1357 = clamp( ( lerpResult1370 - ( DissolveIntensity1362 + lerpResult1518 ) ) , 0.0 , 1.0 );
			float smoothstepResult1360 = smoothstep( _SoftaDissolve1 , ( 1.0 - _SoftaDissolve1 ) , clampResult1357);
			float Dissolve1383 = smoothstepResult1360;
			float4 temp_cast_5 = (1.0).xxxx;
			float3 ase_worldNormal = i.worldNormal;
			float dotResult1581 = dot( i.viewDir , ase_worldNormal );
			float4 temp_output_1591_0 = ( saturate( ( pow( ( 1.0 - abs( dotResult1581 ) ) , _Fresnelsoft ) * _Fresnelwidth ) ) * _FresnelColor );
			float4 lerpResult1594 = lerp( temp_cast_5 , temp_output_1591_0 , _OpenFresnel);
			float FresnelAlp1599 = (lerpResult1594).a;
			c.rgb = 0;
			c.a = pow( ( saturate( ( lerpResult303 * _Color.a * i.vertexColor.a * MaskAlpha790 * Dissolve1383 * FresnelAlp1599 ) ) * _Opacity ) , _OpacityPower );
			return c;
		}

		inline void LightingStandardCustomLighting_GI( inout SurfaceOutputCustomLightingCustom s, UnityGIInput data, inout UnityGI gi )
		{
			s.GIData = data;
		}

		void surf( Input i , inout SurfaceOutputCustomLightingCustom o )
		{
			o.SurfInput = i;
			float2 appendResult986 = (float2(_Dissolve_U , _Dissolve_V));
			float2 uv_TexCoord1606 = i.uv_texcoord * float2( 2,2 );
			float2 temp_output_1607_0 = ( uv_TexCoord1606 - float2( 1,1 ) );
			float2 appendResult1616 = (float2(frac( ( atan2( (temp_output_1607_0).x , (temp_output_1607_0).y ) / 6.28318548202515 ) ) , length( temp_output_1607_0 )));
			float2 Polar1617 = appendResult1616;
			float2 lerpResult973 = lerp( i.uv_texcoord , Polar1617 , _DissolvePolar);
			float4 appendResult749 = (float4(_MainTexRotating2 , _Mask01TexRotating1 , _NoiseTexRotating , _DissolveTexRotating1));
			float4 break750 = appendResult749;
			float DissolveWhirl768 = ( ( break750.w * UNITY_PI ) / 180.0 );
			float cos971 = cos( DissolveWhirl768 );
			float sin971 = sin( DissolveWhirl768 );
			float2 rotator971 = mul( lerpResult973 - float2( 0.5,0.5 ) , float2x2( cos971 , -sin971 , sin971 , cos971 )) + float2( 0.5,0.5 );
			float2 appendResult977 = (float2(_DissolveTilingOffset.x , _DissolveTilingOffset.y));
			float2 appendResult978 = (float2(_DissolveTilingOffset.z , _DissolveTilingOffset.w));
			float2 panner987 = ( 1.0 * _Time.y * appendResult986 + (rotator971*appendResult977 + appendResult978));
			float2 lerpResult989 = lerp( panner987 , saturate( panner987 ) , _DissolveTexClamp1);
			float2 appendResult887 = (float2(_NoiseTex_U1 , _NoiseTex_V1));
			float2 uv_NoiseTex = i.uv_texcoord * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
			float2 lerpResult1394 = lerp( uv_NoiseTex , Polar1617 , _NoisePolar);
			float NoiseTexWhirl761 = ( ( break750.z * UNITY_PI ) / 180.0 );
			float cos922 = cos( NoiseTexWhirl761 );
			float sin922 = sin( NoiseTexWhirl761 );
			float2 rotator922 = mul( lerpResult1394 - float2( 0.5,0.5 ) , float2x2( cos922 , -sin922 , sin922 , cos922 )) + float2( 0.5,0.5 );
			float2 panner901 = ( 1.0 * _Time.y * appendResult887 + rotator922);
			float2 NoiseTezUV889 = panner901;
			float4 tex2DNode854 = tex2D( _NoiseTex, NoiseTezUV889 );
			float lerpResult1408 = lerp( tex2DNode854.r , tex2DNode854.a , _NoiseAR);
			float Costom1W871 = i.uv2_tex4coord2.w;
			float Custom_UV671 = _Custom_UV;
			float lerpResult883 = lerp( 0.0 , Costom1W871 , Custom_UV671);
			float lerpResult909 = lerp( 0.0 , ( (-0.5 + (lerpResult1408 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) * ( _NoiseIntensity + lerpResult883 ) ) , _OpenNoise);
			half Noise895 = lerpResult909;
			float2 DissolveUV997 = ( lerpResult989 + ( Noise895 * _NoiseDissolve ) );
			float4 tex2DNode968 = tex2D( _DissolveTex, DissolveUV997 );
			float lerpResult1406 = lerp( tex2DNode968.r , tex2DNode968.a , _DissolveAR);
			float2 lerpResult1215 = lerp( i.uv_texcoord , Polar1617 , _FixedTexPola);
			float cos1220 = cos( ( ( _FixedTexRotating2 * UNITY_PI ) / 180.0 ) );
			float sin1220 = sin( ( ( _FixedTexRotating2 * UNITY_PI ) / 180.0 ) );
			float2 rotator1220 = mul( lerpResult1215 - float2( 0.5,0.5 ) , float2x2( cos1220 , -sin1220 , sin1220 , cos1220 )) + float2( 0.5,0.5 );
			float2 appendResult1226 = (float2(_FixedTexTilingOffset1.x , _FixedTexTilingOffset1.y));
			float2 appendResult1227 = (float2(_FixedTexTilingOffset1.z , _FixedTexTilingOffset1.w));
			float2 DisslovePlusUV1053 = ( (rotator1220*appendResult1226 + appendResult1227) + ( Noise895 * _NoiseFixedTex ) );
			float4 tex2DNode1385 = tex2D( _FixedTex, DisslovePlusUV1053 );
			float lerpResult1404 = lerp( tex2DNode1385.r , tex2DNode1385.a , _FixedTexAR);
			float lerpResult1389 = lerp( lerpResult1404 , ( 1.0 - (DisslovePlusUV1053).y ) , _SystemFixed);
			float DissolveIntensity1362 = ( _DissolveIntensity - 1.0 );
			float FixedTex1319 = ( ( lerpResult1389 - DissolveIntensity1362 ) / saturate( ( 1.0 - _FixedPower ) ) );
			float lerpResult1370 = lerp( lerpResult1406 , ( lerpResult1406 - ( 1.0 - FixedTex1319 ) ) , _OpenFixed);
			float Costom1Z870 = i.uv2_tex4coord2.z;
			float lerpResult1518 = lerp( 0.0 , ( Costom1Z870 * 2.0 ) , Custom_UV671);
			float clampResult1357 = clamp( ( lerpResult1370 - ( DissolveIntensity1362 + lerpResult1518 ) ) , 0.0 , 1.0 );
			float smoothstepResult1360 = smoothstep( _SoftaDissolve1 , ( 1.0 - _SoftaDissolve1 ) , clampResult1357);
			float Dissolve1383 = smoothstepResult1360;
			float4 DissolveLine1425 = ( ( ( step( Dissolve1383 , _LineRange ) - step( ( Dissolve1383 + ( 1.0 - _LineWidth ) ) , _LineRange ) ) * _DissolveLineColor1 ) * _LineIntensity );
			float2 appendResult586 = (float2(_MainTex_U , _MainTex_V));
			float2 appendResult604 = (float2(i.uv2_tex4coord2.x , i.uv2_tex4coord2.y));
			float2 Costom1XY605 = appendResult604;
			float2 lerpResult808 = lerp( float2( 0,0 ) , Costom1XY605 , Custom_UV671);
			float2 lerpResult797 = lerp( i.uv_texcoord , Polar1617 , _MainPolar);
			float MainTexWhirl759 = ( ( break750.x * UNITY_PI ) / 180.0 );
			float cos615 = cos( MainTexWhirl759 );
			float sin615 = sin( MainTexWhirl759 );
			float2 rotator615 = mul( lerpResult797 - float2( 0.5,0.5 ) , float2x2( cos615 , -sin615 , sin615 , cos615 )) + float2( 0.5,0.5 );
			float2 appendResult812 = (float2(_MianTilingOffset.x , _MianTilingOffset.y));
			float2 appendResult813 = (float2(_MianTilingOffset.z , _MianTilingOffset.w));
			float2 panner814 = ( 1.0 * _Time.y * appendResult586 + ( lerpResult808 + (rotator615*appendResult812 + appendResult813) ));
			float2 lerpResult618 = lerp( panner814 , saturate( panner814 ) , _MainTexClamp);
			float2 MianUV620 = ( lerpResult618 + Noise895 );
			float4 tex2DNode1 = tex2D( _MainTex, MianUV620 );
			float4 temp_cast_0 = (0.0).xxxx;
			float3 ase_worldNormal = i.worldNormal;
			float dotResult1581 = dot( i.viewDir , ase_worldNormal );
			float4 temp_output_1591_0 = ( saturate( ( pow( ( 1.0 - abs( dotResult1581 ) ) , _Fresnelsoft ) * _Fresnelwidth ) ) * _FresnelColor );
			float4 lerpResult1592 = lerp( temp_cast_0 , temp_output_1591_0 , _OpenFresnel);
			float3 FresnelRGB1598 = (lerpResult1592).rgb;
			float2 appendResult1470 = (float2(_Gradient_U1 , _Gradient_V1));
			float2 lerpResult1450 = lerp( i.uv_texcoord , Polar1617 , _GradientPolar1);
			float cos1455 = cos( ( ( _GradientRotating * UNITY_PI ) / 180.0 ) );
			float sin1455 = sin( ( ( _GradientRotating * UNITY_PI ) / 180.0 ) );
			float2 rotator1455 = mul( lerpResult1450 - float2( 0.5,0.5 ) , float2x2( cos1455 , -sin1455 , sin1455 , cos1455 )) + float2( 0.5,0.5 );
			float2 appendResult1461 = (float2(_GradientTilingOffset2.x , _GradientTilingOffset2.y));
			float2 appendResult1462 = (float2(_GradientTilingOffset2.z , _GradientTilingOffset2.w));
			float2 panner1473 = ( 1.0 * _Time.y * appendResult1470 + (rotator1455*appendResult1461 + appendResult1462));
			float2 GradientUV1479 = ( panner1473 + ( Noise895 * _NoiseGradient ) );
			float3 desaturateInitialColor1540 = (tex2D( _GradientTex, GradientUV1479 )).rgb;
			float desaturateDot1540 = dot( desaturateInitialColor1540, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar1540 = lerp( desaturateInitialColor1540, desaturateDot1540.xxx, ( 1.0 - _GradientinIntensity ) );
			float3 Gradient1484 = desaturateVar1540;
			float4 temp_cast_3 = (_IntensityPower).xxxx;
			o.Emission = pow( ( ( DissolveLine1425 + float4( ( ( (tex2DNode1).rgb + FresnelRGB1598 ) * (( _Color * float4( Gradient1484 , 0.0 ) )).rgb * (i.vertexColor).rgb ) , 0.0 ) ) * _Emission ) , temp_cast_3 ).rgb;
		}

		ENDCG
	}
                Fallback"Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=18800
2560;0;2560;1379;9634.641;-363.432;2.860261;True;True
Node;AmplifyShaderEditor.CommentaryNode;1618;-8187.831,-1064.422;Inherit;False;1628.592;405.9;极坐标;13;1617;1616;1615;1612;1613;1614;1611;1610;1609;1608;1607;1606;1605;;0,1,0.06708169,1;0;0
Node;AmplifyShaderEditor.Vector2Node;1605;-8137.832,-953.4225;Float;False;Constant;_Vector2;Vector 1;0;0;Create;True;0;0;0;False;0;False;2,2;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;1608;-7846.822,-838.2545;Float;False;Constant;_Vector1;Vector 0;0;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;1606;-7914.829,-971.4225;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1607;-7664.336,-967.6737;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;770;-5101.607,-1061.759;Inherit;False;1258;439.4764;旋转组件;18;761;759;766;764;768;765;767;753;752;760;756;755;750;749;751;754;763;762;;0.4433962,0.3498518,0,1;0;0
Node;AmplifyShaderEditor.ComponentMaskNode;1609;-7486.828,-1014.422;Inherit;False;True;False;True;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1610;-7486.828,-934.4225;Inherit;False;False;True;True;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;751;-5050.586,-958.4561;Inherit;False;Property;_MainTexRotating2;MainTexRotating;13;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;754;-5050.589,-882.6512;Inherit;False;Property;_Mask01TexRotating1;Mask01TexRotating;21;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;762;-5051.607,-805.7586;Inherit;False;Property;_NoiseTexRotating;NoiseTexRotating;33;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;763;-5051.607,-733.7585;Inherit;False;Property;_DissolveTexRotating1;DissolveTexRotating;46;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.TauNode;1612;-7292.476,-870.9276;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.ATan2OpNode;1614;-7278.287,-985.4435;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1613;-7152.656,-985.2655;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;749;-4723.8,-901.0425;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FractNode;1615;-7041.825,-984.4225;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;750;-4552.666,-902.2297;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.LengthOpNode;1611;-7477.014,-799.6285;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1616;-6918.82,-985.1305;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;767;-4401.379,-810.7315;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;765;-4205.38,-809.7315;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;890;-7440.091,1411.007;Inherit;False;2314.375;379.2571;NoiseUV;11;857;887;885;886;901;889;922;923;1394;1396;1621;;0.6367924,1,0.6768068,0.4627451;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1617;-6793.729,-989.8876;Inherit;False;Polar;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;857;-7404.758,1457.412;Inherit;False;0;854;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1621;-7078.649,1530.924;Inherit;False;1617;Polar;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;761;-4080.606,-811.7586;Inherit;False;NoiseTexWhirl;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1396;-7025.182,1715.697;Inherit;False;Property;_NoisePolar;NoisePolar;32;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1394;-6820.182,1458.697;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;886;-6509.769,1619.818;Inherit;False;Property;_NoiseTex_U1;NoiseTex_U;35;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;923;-6764.485,1582.672;Inherit;False;761;NoiseTexWhirl;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;885;-6510.769,1701.818;Inherit;False;Property;_NoiseTex_V1;NoiseTex_V;36;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;624;-3833.866,-881.5737;Inherit;False;663.8696;254.562;自定义数据;5;871;870;605;604;875;;0.5039712,0.1745283,1,1;0;0
Node;AmplifyShaderEditor.RotatorNode;922;-6457.239,1460.754;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;887;-6329.629,1627.656;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;875;-3787.866,-835.5737;Inherit;False;211;194;Costom1;1;601;;1,0.04995039,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;879;-3828.185,-1062.711;Inherit;False;1321.187;170.9862;自定义开关;2;671;609;;0.5039712,0.1745283,1,1;0;0
Node;AmplifyShaderEditor.PannerNode;901;-6147.495,1461.465;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;609;-3747.719,-1002.425;Inherit;False;Property;_Custom_UV;Custom_UV;6;1;[Enum];Create;False;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;913;-5102.773,1308.045;Inherit;False;1879.965;506.9672;NoiseTEX;14;895;909;911;904;903;912;894;854;883;881;882;891;1407;1408;;1,0.3823665,0,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;601;-3777.866,-804.5737;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;889;-5969.173,1457.776;Inherit;False;NoiseTezUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;891;-5087.773,1380.888;Inherit;False;889;NoiseTezUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;671;-2805.88,-1000.844;Inherit;False;Custom_UV;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;871;-3366.466,-710.4514;Inherit;False;Costom1W;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;854;-4901.394,1357.045;Inherit;True;Property;_NoiseTex;NoiseTex;30;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;881;-4489.241,1661.604;Inherit;False;871;Costom1W;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1407;-4752,1568;Inherit;False;Property;_NoiseAR;NoiseA/R;31;1;[Enum];Create;False;0;2;R;0;A;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;882;-4492.111,1735.081;Inherit;False;671;Custom_UV;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;894;-4392.662,1544.101;Half;False;Property;_NoiseIntensity;NoiseIntensity;34;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1408;-4560,1392;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;883;-4313.542,1642.512;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;903;-4196.934,1383.32;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-0.5;False;4;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;912;-4149.952,1547.622;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1413;-7441.497,2515.746;Inherit;False;2307.244;533.3877;FixedUV;15;1053;1238;1224;1220;1227;1226;1223;1215;1225;1217;1222;1221;1234;1516;1623;;0.6367924,1,0.6768068,0.4627451;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;904;-4002.622,1384.512;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;911;-3988.454,1482.002;Inherit;False;Property;_OpenNoise;OpenNoise;29;1;[Enum];Create;False;0;2;OFF;0;ON;1;0;False;1;Header(Noise Mode);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1221;-6578.386,2713.201;Inherit;False;Property;_FixedTexRotating2;FixedTexRotating;62;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1217;-6791.873,2847.014;Inherit;False;Property;_FixedTexPola;FixedTexPola;61;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;1222;-6314.842,2716.677;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1623;-6888.564,2678.989;Inherit;False;1617;Polar;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;909;-3829.991,1361.021;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1516;-7381.878,2575.946;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1234;-5814.445,2704.303;Inherit;False;311.4722;175.8679;扰动影响溶解;3;1235;1236;1237;;1,0,0,1;0;0
Node;AmplifyShaderEditor.Vector4Node;1225;-6257.371,2828.512;Inherit;False;Property;_FixedTexTilingOffset1;FixedTexTilingOffset;60;0;Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;895;-3680.69,1355.8;Half;False;Noise;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1215;-6558.938,2576.492;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PiNode;764;-4401.063,-710.2822;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1223;-6145.844,2717.677;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1236;-5808.577,2741.342;Inherit;False;895;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;998;-7441.755,1805.581;Inherit;False;2308.328;686.8293;DissolveUV;20;995;979;973;974;970;975;978;977;971;984;985;986;987;988;989;990;994;997;1517;1622;;0.6367924,1,0.6768068,0.4627451;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;1227;-5996.355,2926.544;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;766;-4206.065,-712.2822;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1226;-5996.387,2820.48;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;1220;-6008.781,2573.508;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1235;-5811.116,2813.209;Inherit;False;Property;_NoiseFixedTex;NoiseFixedTex;39;1;[Enum];Create;False;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1237;-5622.644,2756.36;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1622;-7031.865,2159.487;Inherit;False;1617;Polar;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1517;-7380.981,2055.135;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;974;-7006.331,2360.451;Inherit;False;Property;_DissolvePolar;DissolvePolar;44;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;768;-4077.72,-719.0068;Inherit;False;DissolveWhirl;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1224;-5810.286,2572.513;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1238;-5468.5,2572.399;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;970;-6762.333,2185.944;Inherit;False;768;DissolveWhirl;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;975;-6774.63,2268.859;Inherit;False;Property;_DissolveTilingOffset;DissolveTilingOffset;43;0;Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;973;-6762.233,2045.883;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1414;-5129.083,2444.866;Inherit;False;2376.104;468.8721;FixedTex;16;1319;1324;1302;1311;1389;1303;1363;1393;1404;1367;1101;1385;1403;1368;1388;1054;;1,0.3823665,0,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;977;-6551.824,2257.396;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1035;-5104.368,1833.721;Inherit;False;2373.4;553.3916;DissolveTex;22;1383;1360;1357;1358;1359;1356;1339;1338;1362;1398;1405;1370;1381;1371;1377;1406;968;1369;999;1326;1518;1535;;1,0.3823665,0,1;0;0
Node;AmplifyShaderEditor.RotatorNode;971;-6546.721,2046.858;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;978;-6551.792,2363.46;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;984;-6311.755,2178.267;Half;False;Property;_Dissolve_U;Dissolve_U;47;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;985;-6336.755,2244.265;Half;False;Property;_Dissolve_V;Dissolve_V;48;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1053;-5347.295,2565.746;Inherit;False;DisslovePlusUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1054;-5073.883,2693.152;Inherit;False;1053;DisslovePlusUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1326;-4735.09,2189.174;Inherit;False;Property;_DissolveIntensity;DissolveIntensity;49;0;Create;False;0;0;0;False;0;False;0;0;0;2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1388;-5071.822,2520.354;Inherit;False;1053;DisslovePlusUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;979;-6332.739,2046.395;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;986;-6142.757,2190.266;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1385;-4821.096,2494.866;Inherit;True;Property;_FixedTex;FixedTex;58;1;[NoScaleOffset];Create;False;0;0;0;False;1;Header(FixedTex Mode);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1403;-4532.516,2639.02;Inherit;False;Property;_FixedTexAR;FixedTexA/R;59;1;[Enum];Create;False;0;2;R;0;A;1;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1398;-4438.929,2158.39;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;995;-5805.38,2249.344;Inherit;False;311.4722;175.8679;扰动影响溶解;3;993;992;991;;1,0,0,1;0;0
Node;AmplifyShaderEditor.PannerNode;987;-5960.457,2036.136;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;1368;-4764.01,2693.517;Inherit;True;False;True;False;False;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;988;-5759.908,2094.137;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1393;-4400.194,2784.468;Inherit;False;Property;_SystemFixed;SystemFixed;56;1;[Enum];Create;False;1;DissloveTexPlus;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1362;-4236.555,2185.172;Inherit;False;DissolveIntensity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;991;-5799.841,2283.344;Inherit;False;895;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;990;-5804.097,2171.482;Inherit;False;Property;_DissolveTexClamp1;DissolveTexClamp;45;1;[Enum];Create;False;0;2;Repeat;0;Clmap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1367;-4394.199,2701.404;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;992;-5802.38,2355.212;Inherit;False;Property;_NoiseDissolve;NoiseDissolve;38;1;[Enum];Create;False;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1101;-3749.103,2789.105;Inherit;False;Property;_FixedPower;FixedPower;57;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1404;-4344.313,2517.958;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;989;-5591.644,2039.801;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;1363;-4036.582,2784.021;Inherit;False;1362;DissolveIntensity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;876;-3158.546,-884.0647;Inherit;False;658.0156;256.7176;Comment;5;878;877;653;652;880;;0.5039712,0.1745283,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;1389;-4072.205,2563.016;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1303;-3470.94,2792.9;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;993;-5613.908,2298.362;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;880;-3132.841,-841.1361;Inherit;False;206;195;Costom2;1;664;;1,0.04995039,0,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1311;-3604.249,2559.58;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;1302;-3317.873,2790.31;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;755;-4401.27,-906.0066;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;994;-5432.959,2041.55;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;756;-4207.27,-909.0067;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1324;-3154.96,2559.754;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;778;-7455.104,254.4653;Inherit;False;2321.462;728.3927;Mask01UV;24;829;661;660;658;659;831;631;830;628;630;827;834;825;833;832;824;769;826;822;850;852;917;921;1620;;0.6367924,1,0.6768068,0.4627451;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;664;-3125.841,-809.1361;Inherit;False;3;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;1497;-7434.184,3428.998;Inherit;False;2300.239;1070.726;Comment;21;1462;1461;1463;1478;1479;1473;1477;1475;1476;1451;1450;1455;1454;1453;1452;1460;1470;1471;1472;1444;1624;;0.6367924,1,0.6768068,0.4627451;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;997;-5307.002,2036.029;Inherit;False;DissolveUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;760;-4076.606,-910.7587;Inherit;False;Mask01Whirl;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;822;-7403.602,526.5211;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;652;-2868.806,-844.6594;Inherit;False;FLOAT2;4;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;999;-5096.368,1889.943;Inherit;False;997;DissolveUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1452;-7117.787,3897.806;Inherit;False;Property;_GradientRotating;GradientRotating;71;0;Create;False;0;0;0;False;0;False;0;0;0;360;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;870;-3364.466,-779.4514;Inherit;False;Costom1Z;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;752;-4401.585,-1006.456;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;826;-7030.889,819.6069;Inherit;False;Property;_Mask01Polar;Mask01Polar;19;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1620;-7060.363,585.7463;Inherit;False;1617;Polar;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1319;-2942.595,2555.4;Inherit;False;FixedTex;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1369;-4963.034,2119.84;Inherit;False;1319;FixedTex;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;824;-6826.57,527.9184;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1405;-4785.263,2052.577;Inherit;False;Property;_DissolveAR;DissolveA/R;42;1;[Enum];Create;False;0;2;R;0;A;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1338;-5011.159,2278.292;Inherit;False;870;Costom1Z;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;1453;-6854.243,3901.282;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;753;-4205.586,-1005.456;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;769;-6835.624,670.7079;Inherit;False;760;Mask01Whirl;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;653;-2705.53,-848.0647;Inherit;False;Costom2XY;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;832;-6830.228,771.4514;Inherit;False;Property;_Mask01TilingOffset1;Mask01TilingOffset;18;0;Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1624;-6987.091,3615.132;Inherit;False;1617;Polar;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;771;-7459.666,-601.0398;Inherit;False;2335.557;848.218;主帖图UV;24;618;616;617;814;809;586;808;806;581;580;615;813;812;797;796;579;775;773;772;774;821;906;907;1619;;0.6367924,1,0.6768068,0.4627451;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1444;-7379.46,3550.136;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;968;-4920.011,1866.721;Inherit;True;Property;_DissolveTex;DissolveTex;41;1;[NoScaleOffset];Create;False;0;0;0;False;1;Header(Dissslve Mode);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1451;-6964.734,3824.572;Inherit;False;Property;_GradientPolar1;GradientPolar;70;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;788;-7444.082,998.2819;Inherit;False;2314.229;401.3737;Mask02UV;11;786;784;783;785;748;742;747;743;746;745;744;;0.6367924,1,0.6768068,0.4627451;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;759;-4073.606,-1011.759;Inherit;False;MainTexWhirl;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;834;-6577.043,759.7195;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1535;-4821.423,2285.887;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1519;-4499.219,2333.444;Inherit;False;671;Custom_UV;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1450;-6730.56,3557.08;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RotatorNode;825;-6622.479,528.4872;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;821;-6824.19,-42.08046;Inherit;False;222;206;TexUV;1;815;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;1603;-5103.932,3805.61;Inherit;False;2140.247;431.8779;Fresnel;21;1590;1595;1593;1599;1598;1597;1596;1594;1592;1591;1589;1588;1587;1585;1586;1584;1583;1582;1581;1579;1580;;0.6281409,0,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1619;-7079.107,-245.7844;Inherit;False;1617;Polar;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;850;-6518.93,324.4423;Inherit;False;653;Costom2XY;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;833;-6578.043,662.7195;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;1454;-6685.245,3902.282;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;1463;-6923.115,4008.937;Inherit;False;Property;_GradientTilingOffset2;GradientTilingOffset;69;0;Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;774;-6824.223,-182.2671;Inherit;False;179;112;旋转明示;1;758;;1,0,0.7853518,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;829;-6516.579,394.5707;Inherit;False;671;Custom_UV;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1406;-4612.061,1931.515;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;579;-7414.224,-320.0189;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;604;-3497.406,-842.0117;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;1377;-4798.296,2123.706;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;796;-7047.951,-47.48552;Inherit;False;Property;_MainPolar;MainPolar;11;1;[Toggle];Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1371;-4448.159,2074.673;Inherit;False;Property;_OpenFixed;OpenFixed;55;2;[Header];[Enum];Create;True;1;DissloveTexPlus;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;605;-3364.998,-850.8281;Inherit;False;Costom1XY;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;773;-6590.552,-445.2495;Inherit;False;179;112;自定义开关;1;672;;1,0,0.7853518,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1472;-6062.06,3889.426;Half;False;Property;_Gradient_V1;Gradient_V;74;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;758;-6820.572,-150.429;Inherit;False;759;MainTexWhirl;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;1461;-6448.131,3999.904;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;628;-6343.667,673.8434;Half;False;Property;_MaskTex_U2;MaskTex_U1;22;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;797;-6805.476,-309.8231;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldNormalVector;1580;-5079.906,4017.659;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;772;-6592.358,-556.7241;Inherit;False;179;112;自定义数据明示;1;607;;1,0,0.7853518,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1381;-4419.511,1985.195;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;630;-6342.667,742.842;Half;False;Property;_MaskTex_V2;MaskTex_V1;23;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;1455;-6569.182,3559.114;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1462;-6450.099,4088.969;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;745;-6950.897,1233.589;Half;False;Property;_MaskTex_V3;MaskTex_V2;28;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;815;-6817.19,-4.080494;Inherit;False;Property;_MianTilingOffset;MianTilingOffset;10;0;Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScaleAndOffsetNode;827;-6367.785,526.9911;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;852;-6314.52,304.9111;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;1579;-5079.412,3874.818;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;1471;-6062.06,3821.428;Half;False;Property;_Gradient_U1;Gradient_U;73;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1518;-4250.311,2258.849;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;744;-6953.897,1139.591;Half;False;Property;_MaskTex_U3;MaskTex_U2;27;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;813;-6531.653,84.96563;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DotProductOpNode;1581;-4867.346,3888.818;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;607;-6579.456,-517.2091;Inherit;False;605;Costom1XY;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1470;-5875.062,3835.427;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;672;-6580.263,-410.6677;Inherit;False;671;Custom_UV;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1370;-4175.358,1935.235;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1475;-5761.638,3922.137;Inherit;False;895;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;1460;-6082.025,3677.176;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;746;-6775.279,1065.255;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;743;-6760.897,1147.59;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;631;-6152.669,681.8423;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1476;-5761.638,4002.137;Inherit;False;Property;_NoiseGradient;NoiseGradient;40;1;[Enum];Create;False;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;615;-6578.979,-309.86;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;830;-6129.579,501.5705;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;812;-6539.653,-29.03439;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1339;-4020.342,2191.772;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1359;-3896.366,2158.47;Half;False;Property;_SoftaDissolve1;SoftaDissolve;50;0;Create;False;0;0;0;False;0;False;0;0;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;742;-6522.897,1062.591;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;831;-5974.028,502.2352;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;1473;-5632.345,3662.301;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;806;-6331.38,-310.4556;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1477;-5569.638,3938.137;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;580;-6328.282,-172.9358;Inherit;False;Property;_MainTex_U;MainTex_U;14;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1356;-3932.046,1937.069;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;747;-6621.251,1206.542;Inherit;False;0;739;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;921;-5829.743,717.1287;Inherit;False;330.9321;192.8679;扰动影响开关/待弃用;3;916;919;914;;1,0,0,1;0;0
Node;AmplifyShaderEditor.AbsOpNode;1582;-4745.436,3892.003;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;581;-6329.282,-90.93555;Inherit;False;Property;_MainTex_V;MainTex_V;15;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;808;-6299.985,-486.9941;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;748;-6304.268,1063.546;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;658;-5829.616,644.2762;Inherit;False;Property;_MaskTex01Clamp;MaskTex01Clamp;20;1;[Enum];Create;False;0;2;Repeat;0;Clmap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1358;-3607.385,2211.997;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;586;-6129.144,-130.0978;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1583;-4628.513,3976.395;Inherit;False;Property;_Fresnelsoft;Fresnelsoft;78;0;Create;False;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;659;-5783.026,575.438;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;809;-6116.444,-367.7925;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1478;-5452.951,3663.348;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;914;-5813.743,765.1287;Inherit;False;895;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;916;-5813.743,845.1287;Inherit;False;Property;_NoiseMask01;NoiseMask01;37;1;[Enum];Create;False;0;2;OFF;0;ON;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1584;-4620.606,3895.941;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;1357;-3633.367,1934.999;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1499;-5108.963,3405.885;Inherit;False;1502.383;390.521;GradientTex;7;1540;1483;1539;1536;1443;1484;1480;;1,0.3823665,0,1;0;0
Node;AmplifyShaderEditor.SmoothstepOpNode;1360;-3427.352,1933.904;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;1586;-4460.951,3903.466;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1448;-7438.698,3067.28;Inherit;False;2299.964;331.6309;VertexUV;8;1429;1430;1431;1432;1434;1433;1435;1445;;0.6367924,1,0.6768068,0.4627451;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1479;-5325.638,3659.608;Inherit;False;GradientUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1585;-4447.676,3998.632;Inherit;False;Property;_Fresnelwidth;Fresnelwidth;79;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;785;-6181.695,1207.607;Inherit;False;Property;_MaskTex02Clamp;MaskTex02Clamp;26;1;[Enum];Create;False;0;2;Repeat;0;Clmap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;814;-5982.83,-270.3607;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;660;-5609.762,502.9309;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;783;-6150.455,1126.508;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1424;-2694.623,1843.922;Inherit;False;1360.601;541.5392;描边;13;1425;1541;1422;1542;1420;1421;1418;1419;1423;1417;1416;1415;1604;;0,1,0.04693031,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;919;-5621.743,781.1287;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1587;-4253.38,3907.2;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1383;-3256.723,1930.07;Inherit;False;Dissolve;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;784;-5950.864,1063.953;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1416;-2683.623,2028.983;Half;False;Property;_LineWidth;LineWidth;51;0;Create;False;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;616;-5818.681,-134.7853;Inherit;False;Property;_MainTexClamp;MainTexClamp;12;1;[Enum];Create;True;0;2;Repeat;0;Clmap;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;917;-5445.743,509.1288;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;617;-5782.487,-207.942;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1429;-6955.897,3160.746;Half;False;Property;_VertexU;VertexU;65;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;907;-5677.519,-52.44165;Inherit;False;187;119;扰动输出;1;898;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;1430;-6956.897,3239.746;Half;False;Property;_VertexV;VertexV;66;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1480;-5058.963,3480.542;Inherit;False;1479;GradientUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;1432;-6738.507,3199.061;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;618;-5611.065,-271.0504;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;786;-5746.589,1059.766;Inherit;False;Mask02UV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SaturateNode;1588;-4109.639,3905.221;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;898;-5671.519,-12.44165;Inherit;False;895;Noise;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;789;-5097.593,618.4441;Inherit;False;1247.192;640.2635;MaskTEX;10;790;642;641;739;662;787;1522;1523;1524;1525;;1,0.3823665,0,1;0;0
Node;AmplifyShaderEditor.SimpleTimeNode;1431;-6723.526,3108.509;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1589;-4139.107,3997.101;Inherit;False;Property;_FresnelColor;FresnelColor;77;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1415;-2674.415,1903.922;Inherit;False;1383;Dissolve;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;1604;-2426.096,1973.644;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;661;-5317.743,493.1287;Inherit;False;Mask01UV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;1443;-4856.314,3462.942;Inherit;True;Property;_GradientTex;Gradientin;68;1;[NoScaleOffset];Create;False;0;0;0;False;1;Header(Gradient Mode);False;-1;None;c6b731606c4cc3b4f9554e3005f79c6b;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1536;-4968.263,3656.698;Inherit;False;Property;_GradientinIntensity;GradientinIntensity;72;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;775;-5303.603,-311.8135;Inherit;False;179;112;UV输出明示;1;620;;1,0,0.7853518,1;0;0
Node;AmplifyShaderEditor.OneMinusNode;1539;-4692.407,3660.498;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;255;-5103.401,-602.9387;Inherit;False;2611.625;1211.389;核心;23;1426;0;283;251;1004;250;284;285;282;1005;158;26;25;30;29;1006;846;32;776;33;1600;1601;1602;核心;1,0,0.4306126,1;0;0
Node;AmplifyShaderEditor.ComponentMaskNode;1483;-4549.58,3463.885;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1417;-2274.624,1904.983;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1423;-2567.991,2227.459;Half;False;Property;_LineRange;LineRange;52;0;Create;False;0;0;0;False;0;False;0;0.85;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1590;-3688.763,3846.716;Inherit;False;Constant;_Float0;Float 0;36;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1433;-6551.526,3137.509;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;662;-5078.134,689.4977;Inherit;False;661;Mask01UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1434;-6581.17,3248.765;Inherit;False;0;1437;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1591;-3900.339,3909.29;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1595;-3868.733,4133.279;Inherit;False;Property;_OpenFresnel;OpenFresnel;76;2;[Header];[Toggle];Create;False;1;Fresnel......e(OvO)e;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;787;-5078.229,933.7006;Inherit;False;786;Mask02UV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;906;-5431.005,-270.8567;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;1593;-3655.065,4030.268;Inherit;False;Constant;_Float1;Float 1;36;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;1419;-2135.623,1902.983;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1522;-4743.768,1107.342;Inherit;False;Property;_MaskTex02AR;MaskTex02A/R;25;1;[Enum];Create;False;0;2;R;0;A;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1525;-4744.768,844.3422;Inherit;False;Property;_MaskTex01AR;MaskTex01A/R;17;1;[Enum];Create;False;0;2;R;0;A;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;776;-5071.419,-495.2736;Inherit;False;1153.377;409.9084;主帖图数据;4;626;543;31;2;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;739;-4892.475,909.2149;Inherit;True;Property;_MaskTex2;MaskTex02;24;0;Create;False;0;0;0;False;1;Header(Mask02 Mode);False;-1;None;d162e378b115ddf4f838e7dba12ad457;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;620;-5300.648,-274.8855;Inherit;False;MianUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StepOpNode;1418;-2261.624,2223.983;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1592;-3544.363,3857.673;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;641;-4896.084,663.4441;Inherit;True;Property;_MaskTex1;MaskTex01Data;16;1;[NoScaleOffset];Create;False;0;0;0;False;1;Header(Mask01 Mode);False;-1;None;d162e378b115ddf4f838e7dba12ad457;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;1540;-4341.407,3467.498;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1435;-6354.701,3140.327;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1484;-4178.185,3463.031;Inherit;False;Gradient;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;31;-4811,-456.2973;Inherit;False;337;264;主贴图;1;1;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;33;-5066.521,-57.2052;Inherit;False;707;341;颜色;4;22;1486;1485;21;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;1420;-1959.515,1958.922;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;626;-5049.208,-380.1748;Inherit;False;620;MianUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;1523;-4565.768,949.3422;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;1596;-3391.363,3854.673;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;1524;-4560.768,681.3423;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1421;-2118.724,2127.276;Half;False;Property;_DissolveLineColor1;LineColor;53;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;1594;-3533.385,4114.194;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1445;-6146.076,3150.041;Inherit;False;VertexUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.CommentaryNode;1427;-5109.208,2923.637;Inherit;False;2330.721;465.7027;顶点偏移组件;13;1447;1437;1442;1441;1438;1439;1440;981;1436;1521;1544;1545;1520;;0,0.0136652,1,1;0;0
Node;AmplifyShaderEditor.ColorNode;21;-4996.521,-7.205212;Half;False;Property;_Color;Color;8;1;[HDR];Create;False;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;1597;-3382.494,4109.839;Inherit;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;543;-4366.7,-336.9392;Inherit;False;374.2026;238.0622;A/R通道;2;304;303;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;642;-4181.15,750.8729;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1447;-5059.746,2999.163;Inherit;False;1445;VertexUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1598;-3198.363,3852.673;Inherit;False;FresnelRGB;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;1;-4761.001,-406.2975;Inherit;True;Property;_MainTex;MainTex;7;1;[NoScaleOffset];Create;False;0;0;0;False;1;Header(Main Mode);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;1542;-2039.881,2310.461;Inherit;False;Property;_LineIntensity;LineIntensity;54;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1422;-1817.886,1958.922;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1485;-4952.615,164.5092;Inherit;False;1484;Gradient;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;32;-5065.921,295.9941;Inherit;False;563;271;顶点颜色;2;27;28;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;877;-2705.37,-778.7362;Inherit;False;Costom2Z;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1545;-4842.767,3177.418;Inherit;True;Property;_VertexTexMask;VertexTexMask;67;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;304;-4316.7,-214.8769;Inherit;False;Property;_A_R;A_R;9;1;[Enum];Create;True;0;2;R;0;A;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;790;-4050.306,746.6924;Inherit;False;MaskAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1541;-1673.881,1959.461;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;27;-5017.921,359.9942;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1486;-4741.302,43.75275;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1599;-3182.459,4108.123;Inherit;False;FresnelAlp;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;2;-4102.835,-404.7955;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1520;-4078.577,3314.271;Inherit;False;671;Custom_UV;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1437;-4845.853,2978.341;Inherit;True;Property;_VertexTex;VertexTex;63;0;Create;False;0;0;0;False;1;Header(Vertex Mode);False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;1600;-3909.893,-334.0644;Inherit;False;1598;FresnelRGB;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;981;-4079.077,3242.43;Inherit;False;877;Costom2Z;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;846;-4119.102,196.3015;Inherit;False;173;112;MaskTex;1;791;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;791;-4111.516,237.5422;Inherit;False;790;MaskAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;28;-4745.921,351.9941;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;30;-3775.041,44.30147;Inherit;False;125;272;透明度;1;24;;1,0.5668886,0,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1006;-4105.085,420.1865;Inherit;False;1383;Dissolve;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;303;-4174.498,-286.9392;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1425;-1535.216,1955.305;Inherit;False;DissolveLine;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;1436;-4012.788,3164.286;Inherit;False;Property;_VertexIntensity;VertexIntensity;64;0;Create;False;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;1521;-3846.669,3244.676;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1601;-3726.893,-398.0644;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;22;-4579.521,38.79479;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.CommentaryNode;29;-3576.718,-429.6506;Inherit;False;121;144;自发光;1;23;;1,0.5563879,0,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;1602;-4103.634,495.7532;Inherit;False;1599;FresnelAlp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1544;-4478.767,3162.418;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;1438;-4260.788,2985.286;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1439;-3704.787,3142.286;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;24;-3771.042,81.30135;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;1440;-4259.788,3090.287;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;26;-3435.135,93.85786;Inherit;False;255;195;透明度;2;5;6;;1,0,0.3814187,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;25;-3163.242,-519.7417;Inherit;False;259;182;强度;2;4;3;;1,0,0.4670238,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-3572.718,-397.6507;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;1426;-3804.604,-556.0741;Inherit;False;1425;DissolveLine;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;4;-3159.242,-421.7419;Half;False;Property;_Emission;Emission;2;0;Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;158;-3576.867,136.7786;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;1005;-3284.842,-482.6629;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;1441;-3540.787,2986.287;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-3424.341,208.7628;Half;False;Property;_Opacity;Opacity;3;0;Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;1442;-3382.259,2981.688;Inherit;False;VertexTEX;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;285;-3086.341,-207.0458;Inherit;False;Property;_IntensityPower;EmissionPower;4;0;Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;282;-3327.497,316.7782;Inherit;False;Property;_OpacityPower;OpacityPower;5;0;Create;False;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;3;-3023.242,-481.7417;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-3299.341,136.7627;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;1515;-5104.774,4255.901;Inherit;False;432.0596;250.1279;待使用;3;980;1469;982;;0,1,0.3896697,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;878;-2704.37,-707.7362;Inherit;False;Costom2W;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;283;-3130.804,134.969;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;250;-2837.798,219.9941;Inherit;False;Property;_CullMode;CullMode;1;1;[Enum];Create;False;0;1;Option1;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1004;-3112.487,247.2473;Inherit;False;1442;VertexTEX;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;982;-4854.716,4308.369;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;251;-2837.175,292.9886;Inherit;False;Property;_Dst;Add/Blend;0;1;[Enum];Create;False;0;2;AlphaBlend;10;Additive;1;0;True;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;980;-5054.774,4390.029;Inherit;False;671;Custom_UV;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;284;-2852,-324;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;1469;-5053.116,4305.901;Inherit;False;878;Costom2W;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;847;-4110.307,345.3615;Inherit;False;-1;;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;-2711.998,-370.9973;Float;False;True;-1;2;ASEMaterialInspector;0;0;CustomLighting;ROX_FX_Shader/VFXCore;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Off;2;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;10;d3d9;d3d11_9x;d3d11;glcore;gles;gles3;metal;vulkan;n3ds;wiiu;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;False;2;5;False;-1;10;True;251;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;75;-1;-1;-1;0;False;0;0;True;250;-1;0;False;-1;0;0;0;False;0.1;False;-1;0;False;-1;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;1606;0;1605;0
WireConnection;1607;0;1606;0
WireConnection;1607;1;1608;0
WireConnection;1609;0;1607;0
WireConnection;1610;0;1607;0
WireConnection;1614;0;1609;0
WireConnection;1614;1;1610;0
WireConnection;1613;0;1614;0
WireConnection;1613;1;1612;0
WireConnection;749;0;751;0
WireConnection;749;1;754;0
WireConnection;749;2;762;0
WireConnection;749;3;763;0
WireConnection;1615;0;1613;0
WireConnection;750;0;749;0
WireConnection;1611;0;1607;0
WireConnection;1616;0;1615;0
WireConnection;1616;1;1611;0
WireConnection;767;0;750;2
WireConnection;765;0;767;0
WireConnection;1617;0;1616;0
WireConnection;761;0;765;0
WireConnection;1394;0;857;0
WireConnection;1394;1;1621;0
WireConnection;1394;2;1396;0
WireConnection;922;0;1394;0
WireConnection;922;2;923;0
WireConnection;887;0;886;0
WireConnection;887;1;885;0
WireConnection;901;0;922;0
WireConnection;901;2;887;0
WireConnection;889;0;901;0
WireConnection;671;0;609;0
WireConnection;871;0;601;4
WireConnection;854;1;891;0
WireConnection;1408;0;854;1
WireConnection;1408;1;854;4
WireConnection;1408;2;1407;0
WireConnection;883;1;881;0
WireConnection;883;2;882;0
WireConnection;903;0;1408;0
WireConnection;912;0;894;0
WireConnection;912;1;883;0
WireConnection;904;0;903;0
WireConnection;904;1;912;0
WireConnection;1222;0;1221;0
WireConnection;909;1;904;0
WireConnection;909;2;911;0
WireConnection;895;0;909;0
WireConnection;1215;0;1516;0
WireConnection;1215;1;1623;0
WireConnection;1215;2;1217;0
WireConnection;764;0;750;3
WireConnection;1223;0;1222;0
WireConnection;1227;0;1225;3
WireConnection;1227;1;1225;4
WireConnection;766;0;764;0
WireConnection;1226;0;1225;1
WireConnection;1226;1;1225;2
WireConnection;1220;0;1215;0
WireConnection;1220;2;1223;0
WireConnection;1237;0;1236;0
WireConnection;1237;1;1235;0
WireConnection;768;0;766;0
WireConnection;1224;0;1220;0
WireConnection;1224;1;1226;0
WireConnection;1224;2;1227;0
WireConnection;1238;0;1224;0
WireConnection;1238;1;1237;0
WireConnection;973;0;1517;0
WireConnection;973;1;1622;0
WireConnection;973;2;974;0
WireConnection;977;0;975;1
WireConnection;977;1;975;2
WireConnection;971;0;973;0
WireConnection;971;2;970;0
WireConnection;978;0;975;3
WireConnection;978;1;975;4
WireConnection;1053;0;1238;0
WireConnection;979;0;971;0
WireConnection;979;1;977;0
WireConnection;979;2;978;0
WireConnection;986;0;984;0
WireConnection;986;1;985;0
WireConnection;1385;1;1388;0
WireConnection;1398;0;1326;0
WireConnection;987;0;979;0
WireConnection;987;2;986;0
WireConnection;1368;0;1054;0
WireConnection;988;0;987;0
WireConnection;1362;0;1398;0
WireConnection;1367;0;1368;0
WireConnection;1404;0;1385;1
WireConnection;1404;1;1385;4
WireConnection;1404;2;1403;0
WireConnection;989;0;987;0
WireConnection;989;1;988;0
WireConnection;989;2;990;0
WireConnection;1389;0;1404;0
WireConnection;1389;1;1367;0
WireConnection;1389;2;1393;0
WireConnection;1303;0;1101;0
WireConnection;993;0;991;0
WireConnection;993;1;992;0
WireConnection;1311;0;1389;0
WireConnection;1311;1;1363;0
WireConnection;1302;0;1303;0
WireConnection;755;0;750;1
WireConnection;994;0;989;0
WireConnection;994;1;993;0
WireConnection;756;0;755;0
WireConnection;1324;0;1311;0
WireConnection;1324;1;1302;0
WireConnection;997;0;994;0
WireConnection;760;0;756;0
WireConnection;652;0;664;1
WireConnection;652;1;664;2
WireConnection;870;0;601;3
WireConnection;752;0;750;0
WireConnection;1319;0;1324;0
WireConnection;824;0;822;0
WireConnection;824;1;1620;0
WireConnection;824;2;826;0
WireConnection;1453;0;1452;0
WireConnection;753;0;752;0
WireConnection;653;0;652;0
WireConnection;968;1;999;0
WireConnection;759;0;753;0
WireConnection;834;0;832;3
WireConnection;834;1;832;4
WireConnection;1535;0;1338;0
WireConnection;1450;0;1444;0
WireConnection;1450;1;1624;0
WireConnection;1450;2;1451;0
WireConnection;825;0;824;0
WireConnection;825;2;769;0
WireConnection;833;0;832;1
WireConnection;833;1;832;2
WireConnection;1454;0;1453;0
WireConnection;1406;0;968;1
WireConnection;1406;1;968;4
WireConnection;1406;2;1405;0
WireConnection;604;0;601;1
WireConnection;604;1;601;2
WireConnection;1377;0;1369;0
WireConnection;605;0;604;0
WireConnection;1461;0;1463;1
WireConnection;1461;1;1463;2
WireConnection;797;0;579;0
WireConnection;797;1;1619;0
WireConnection;797;2;796;0
WireConnection;1381;0;1406;0
WireConnection;1381;1;1377;0
WireConnection;1455;0;1450;0
WireConnection;1455;2;1454;0
WireConnection;1462;0;1463;3
WireConnection;1462;1;1463;4
WireConnection;827;0;825;0
WireConnection;827;1;833;0
WireConnection;827;2;834;0
WireConnection;852;1;850;0
WireConnection;852;2;829;0
WireConnection;1518;1;1535;0
WireConnection;1518;2;1519;0
WireConnection;813;0;815;3
WireConnection;813;1;815;4
WireConnection;1581;0;1579;0
WireConnection;1581;1;1580;0
WireConnection;1470;0;1471;0
WireConnection;1470;1;1472;0
WireConnection;1370;0;1406;0
WireConnection;1370;1;1381;0
WireConnection;1370;2;1371;0
WireConnection;1460;0;1455;0
WireConnection;1460;1;1461;0
WireConnection;1460;2;1462;0
WireConnection;743;0;744;0
WireConnection;743;1;745;0
WireConnection;631;0;628;0
WireConnection;631;1;630;0
WireConnection;615;0;797;0
WireConnection;615;2;758;0
WireConnection;830;0;852;0
WireConnection;830;1;827;0
WireConnection;812;0;815;1
WireConnection;812;1;815;2
WireConnection;1339;0;1362;0
WireConnection;1339;1;1518;0
WireConnection;742;0;746;0
WireConnection;742;1;743;0
WireConnection;831;0;830;0
WireConnection;831;2;631;0
WireConnection;1473;0;1460;0
WireConnection;1473;2;1470;0
WireConnection;806;0;615;0
WireConnection;806;1;812;0
WireConnection;806;2;813;0
WireConnection;1477;0;1475;0
WireConnection;1477;1;1476;0
WireConnection;1356;0;1370;0
WireConnection;1356;1;1339;0
WireConnection;1582;0;1581;0
WireConnection;808;1;607;0
WireConnection;808;2;672;0
WireConnection;748;0;742;0
WireConnection;748;1;747;0
WireConnection;1358;0;1359;0
WireConnection;586;0;580;0
WireConnection;586;1;581;0
WireConnection;659;0;831;0
WireConnection;809;0;808;0
WireConnection;809;1;806;0
WireConnection;1478;0;1473;0
WireConnection;1478;1;1477;0
WireConnection;1584;0;1582;0
WireConnection;1357;0;1356;0
WireConnection;1360;0;1357;0
WireConnection;1360;1;1359;0
WireConnection;1360;2;1358;0
WireConnection;1586;0;1584;0
WireConnection;1586;1;1583;0
WireConnection;1479;0;1478;0
WireConnection;814;0;809;0
WireConnection;814;2;586;0
WireConnection;660;0;831;0
WireConnection;660;1;659;0
WireConnection;660;2;658;0
WireConnection;783;0;748;0
WireConnection;919;0;914;0
WireConnection;919;1;916;0
WireConnection;1587;0;1586;0
WireConnection;1587;1;1585;0
WireConnection;1383;0;1360;0
WireConnection;784;0;748;0
WireConnection;784;1;783;0
WireConnection;784;2;785;0
WireConnection;917;0;660;0
WireConnection;917;1;919;0
WireConnection;617;0;814;0
WireConnection;1432;0;1429;0
WireConnection;1432;1;1430;0
WireConnection;618;0;814;0
WireConnection;618;1;617;0
WireConnection;618;2;616;0
WireConnection;786;0;784;0
WireConnection;1588;0;1587;0
WireConnection;1604;0;1416;0
WireConnection;661;0;917;0
WireConnection;1443;1;1480;0
WireConnection;1539;0;1536;0
WireConnection;1483;0;1443;0
WireConnection;1417;0;1415;0
WireConnection;1417;1;1604;0
WireConnection;1433;0;1431;0
WireConnection;1433;1;1432;0
WireConnection;1591;0;1588;0
WireConnection;1591;1;1589;0
WireConnection;906;0;618;0
WireConnection;906;1;898;0
WireConnection;1419;0;1417;0
WireConnection;1419;1;1423;0
WireConnection;739;1;787;0
WireConnection;620;0;906;0
WireConnection;1418;0;1415;0
WireConnection;1418;1;1423;0
WireConnection;1592;0;1590;0
WireConnection;1592;1;1591;0
WireConnection;1592;2;1595;0
WireConnection;641;1;662;0
WireConnection;1540;0;1483;0
WireConnection;1540;1;1539;0
WireConnection;1435;0;1433;0
WireConnection;1435;1;1434;0
WireConnection;1484;0;1540;0
WireConnection;1420;0;1418;0
WireConnection;1420;1;1419;0
WireConnection;1523;0;739;1
WireConnection;1523;1;739;4
WireConnection;1523;2;1522;0
WireConnection;1596;0;1592;0
WireConnection;1524;0;641;1
WireConnection;1524;1;641;4
WireConnection;1524;2;1525;0
WireConnection;1594;0;1593;0
WireConnection;1594;1;1591;0
WireConnection;1594;2;1595;0
WireConnection;1445;0;1435;0
WireConnection;1597;0;1594;0
WireConnection;642;0;1524;0
WireConnection;642;1;1523;0
WireConnection;1598;0;1596;0
WireConnection;1;1;626;0
WireConnection;1422;0;1420;0
WireConnection;1422;1;1421;0
WireConnection;877;0;664;3
WireConnection;790;0;642;0
WireConnection;1541;0;1422;0
WireConnection;1541;1;1542;0
WireConnection;1486;0;21;0
WireConnection;1486;1;1485;0
WireConnection;1599;0;1597;0
WireConnection;2;0;1;0
WireConnection;1437;1;1447;0
WireConnection;28;0;27;0
WireConnection;303;0;1;1
WireConnection;303;1;1;4
WireConnection;303;2;304;0
WireConnection;1425;0;1541;0
WireConnection;1521;1;981;0
WireConnection;1521;2;1520;0
WireConnection;1601;0;2;0
WireConnection;1601;1;1600;0
WireConnection;22;0;1486;0
WireConnection;1544;0;1437;0
WireConnection;1544;1;1545;0
WireConnection;1438;0;1544;0
WireConnection;1439;0;1436;0
WireConnection;1439;1;1521;0
WireConnection;24;0;303;0
WireConnection;24;1;21;4
WireConnection;24;2;27;4
WireConnection;24;3;791;0
WireConnection;24;4;1006;0
WireConnection;24;5;1602;0
WireConnection;23;0;1601;0
WireConnection;23;1;22;0
WireConnection;23;2;28;0
WireConnection;158;0;24;0
WireConnection;1005;0;1426;0
WireConnection;1005;1;23;0
WireConnection;1441;0;1438;0
WireConnection;1441;1;1440;0
WireConnection;1441;2;1439;0
WireConnection;1442;0;1441;0
WireConnection;3;0;1005;0
WireConnection;3;1;4;0
WireConnection;5;0;158;0
WireConnection;5;1;6;0
WireConnection;878;0;664;4
WireConnection;283;0;5;0
WireConnection;283;1;282;0
WireConnection;982;1;1469;0
WireConnection;982;2;980;0
WireConnection;284;0;3;0
WireConnection;284;1;285;0
WireConnection;0;2;284;0
WireConnection;0;9;283;0
WireConnection;0;11;1004;0
ASEEND*/
//CHKSM=4497C892A7F8F2B02C5E808BF29DA60FBEFAE5BD