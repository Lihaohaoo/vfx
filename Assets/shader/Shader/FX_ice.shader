// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX_icee"
{
	Properties
	{
		[HDR]_Main_color("Main_color", Color) = (1,1,1,1)
		[NoScaleOffset]_Matecap("Matecap", 2D) = "white" {}
		_Mat_cap_control("Mat_cap_control", Vector) = (1,1,1,1)
		[Normal]_Normal("Normal", 2D) = "bump" {}
		_Nosrmal_S("Nosrmal_S", Float) = 1
		_Main_tex("Main_tex", 2D) = "white" {}
		_Mask_Rotator("Mask_Rotator", Float) = 0
		_Main_control("Main_control", Vector) = (1,1,1,1)
		_Main_speed_U("Main_speed_U", Float) = 0
		_Main_speed_V("Main_speed_V", Float) = 0
		_Desatruate("Desatruate", Range( 0 , 1)) = 0
		_Frednel_mask("Frednel_mask", 2D) = "white" {}
		[HDR]_Fresnel_color("Fresnel_color", Color) = (0,0,0,0)
		_Fresnel_power("Fresnel_power", Float) = 1
		_Speed_U("Speed_U", Float) = 0
		_Speed_V("Speed_V", Float) = 0
		_Top_light_color("Top_light_color", Color) = (1,1,1,1)
		_Top_linght_power("Top_linght_power", Float) = 5
		_Top_linght_scale("Top_linght_scale", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Back
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityStandardUtils.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#ifdef UNITY_PASS_SHADOWCASTER
			#undef INTERNAL_DATA
			#undef WorldReflectionVector
			#undef WorldNormalVector
			#define INTERNAL_DATA half3 internalSurfaceTtoW0; half3 internalSurfaceTtoW1; half3 internalSurfaceTtoW2;
			#define WorldReflectionVector(data,normal) reflect (data.worldRefl, half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal)))
			#define WorldNormalVector(data,normal) half3(dot(data.internalSurfaceTtoW0,normal), dot(data.internalSurfaceTtoW1,normal), dot(data.internalSurfaceTtoW2,normal))
		#endif
		struct Input
		{
			float3 worldNormal;
			INTERNAL_DATA
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float3 worldPos;
		};

		uniform sampler2D _Matecap;
		uniform sampler2D _Normal;
		uniform float4 _Normal_ST;
		uniform float _Nosrmal_S;
		uniform float4 _Mat_cap_control;
		uniform sampler2D _Main_tex;
		uniform float _Main_speed_U;
		uniform float _Main_speed_V;
		uniform float4 _Main_tex_ST;
		uniform float _Mask_Rotator;
		uniform float4 _Main_control;
		uniform float4 _Main_color;
		uniform float _Desatruate;
		uniform float _Fresnel_power;
		uniform sampler2D _Frednel_mask;
		uniform float _Speed_U;
		uniform float _Speed_V;
		uniform float4 _Frednel_mask_ST;
		uniform float4 _Fresnel_color;
		uniform float _Top_linght_power;
		uniform float _Top_linght_scale;
		uniform float4 _Top_light_color;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Normal = float3(0,0,1);
			float2 uv_Normal = i.uv_texcoord * _Normal_ST.xy + _Normal_ST.zw;
			float4 tex2DNode9 = tex2D( _Matecap, ( ( mul( UNITY_MATRIX_V, float4( (WorldNormalVector( i , UnpackScaleNormal( tex2D( _Normal, uv_Normal ), _Nosrmal_S ) )) , 0.0 ) ).xyz + 1.0 ) * 0.5 ).xy );
			float4 temp_cast_3 = (_Mat_cap_control.x).xxxx;
			float4 lerpResult131 = lerp( ( pow( tex2DNode9 , temp_cast_3 ) * _Mat_cap_control.y ) , ( tex2DNode9 * _Mat_cap_control.z ) , _Mat_cap_control.w);
			float2 appendResult127 = (float2(_Main_speed_U , _Main_speed_V));
			float2 uv_Main_tex = i.uv_texcoord * _Main_tex_ST.xy + _Main_tex_ST.zw;
			float cos210 = cos( ( ( _Mask_Rotator * UNITY_PI ) / 180.0 ) );
			float sin210 = sin( ( ( _Mask_Rotator * UNITY_PI ) / 180.0 ) );
			float2 rotator210 = mul( uv_Main_tex - float2( 0.5,0.5 ) , float2x2( cos210 , -sin210 , sin210 , cos210 )) + float2( 0.5,0.5 );
			float2 panner124 = ( 1.0 * _Time.y * appendResult127 + rotator210);
			float4 tex2DNode122 = tex2D( _Main_tex, panner124 );
			float4 temp_cast_4 = (_Main_control.x).xxxx;
			float4 lerpResult80 = lerp( ( pow( tex2DNode122 , temp_cast_4 ) * _Main_control.y ) , ( tex2DNode122 * _Main_control.z ) , _Main_control.w);
			float3 desaturateInitialColor39 = ( lerpResult131 * ( lerpResult80 * _Main_color ) ).rgb;
			float desaturateDot39 = dot( desaturateInitialColor39, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar39 = lerp( desaturateInitialColor39, desaturateDot39.xxx, _Desatruate );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 WorldNormal168 = ase_worldNormal;
			float dotResult139 = dot( ase_worldViewDir , WorldNormal168 );
			float2 appendResult158 = (float2(_Speed_U , _Speed_V));
			float2 uv_Frednel_mask = i.uv_texcoord * _Frednel_mask_ST.xy + _Frednel_mask_ST.zw;
			float2 panner154 = ( 1.0 * _Time.y * appendResult158 + uv_Frednel_mask);
			float dotResult171 = dot( WorldNormal168 , float3(0,1,0) );
			float temp_output_206_0 = (0.0 + (dotResult171 - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
			float4 Top_light_186 = ( saturate( pow( temp_output_206_0 , _Top_linght_power ) ) * _Top_linght_scale * _Top_light_color );
			o.Emission = ( float4( ( desaturateVar39 * (i.vertexColor).rgb ) , 0.0 ) + ( saturate( pow( ( 1.0 - dotResult139 ) , _Fresnel_power ) ) * tex2D( _Frednel_mask, panner154 ).r * _Fresnel_color ) + Top_light_186 ).rgb;
			o.Alpha = 1;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Unlit keepalpha fullforwardshadows noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 

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
				float4 tSpace0 : TEXCOORD2;
				float4 tSpace1 : TEXCOORD3;
				float4 tSpace2 : TEXCOORD4;
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
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				half3 worldTangent = UnityObjectToWorldDir( v.tangent.xyz );
				half tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				half3 worldBinormal = cross( worldNormal, worldTangent ) * tangentSign;
				o.tSpace0 = float4( worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x );
				o.tSpace1 = float4( worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y );
				o.tSpace2 = float4( worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
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
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = float3( IN.tSpace0.w, IN.tSpace1.w, IN.tSpace2.w );
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				surfIN.worldPos = worldPos;
				surfIN.worldNormal = float3( IN.tSpace0.z, IN.tSpace1.z, IN.tSpace2.z );
				surfIN.internalSurfaceTtoW0 = IN.tSpace0.xyz;
				surfIN.internalSurfaceTtoW1 = IN.tSpace1.xyz;
				surfIN.internalSurfaceTtoW2 = IN.tSpace2.xyz;
				surfIN.vertexColor = IN.color;
				SurfaceOutput o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutput, o )
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
Version=19100
Node;AmplifyShaderEditor.RangedFloatNode;149;-3130.646,532.7198;Inherit;False;Property;_Nosrmal_S;Nosrmal_S;4;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;32;-2951.43,483.5482;Inherit;True;Property;_Normal;Normal;3;1;[Normal];Create;True;0;0;0;False;0;False;-1;None;a00e47ef9254b15468f61254e8229e8d;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;125;-1305.906,-431.4922;Inherit;False;Property;_Main_speed_U;Main_speed_U;8;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;126;-1307.106,-367.6922;Inherit;False;Property;_Main_speed_V;Main_speed_V;9;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;11;-2657.892,487.7345;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ViewMatrixNode;10;-2626.892,359.7345;Inherit;False;0;1;FLOAT4x4;0
Node;AmplifyShaderEditor.CommentaryNode;188;1794.47,-1238.277;Inherit;False;520.0781;311.037;World_normal;2;137;168;;1,1,1,1;0;0
Node;AmplifyShaderEditor.WorldNormalVector;137;1844.47,-1181.24;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;15;-2299.892,665.7346;Inherit;False;Constant;_Float0;Float 0;1;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-2290.917,880.8265;Inherit;False;Constant;_Float1;Float 1;21;0;Create;True;0;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;127;-1097.884,-429.9198;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;13;-2336.892,460.7346;Inherit;False;2;2;0;FLOAT4x4;0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.WireNode;195;-1956.634,825.5469;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;124;-938.3104,-552.5737;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;73;-2119.917,458.8261;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;168;2090.548,-1188.277;Inherit;False;WorldNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;169;1514.344,-865.1668;Inherit;False;168;WorldNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;170;1534.613,-665.441;Inherit;False;Constant;_Vector0;Vector 0;19;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.CommentaryNode;185;1787.344,-916.1668;Inherit;False;1318.612;687.7258;Top_light;9;190;184;186;183;182;172;171;204;206;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SamplerNode;122;-699.2324,-581.3191;Inherit;True;Property;_Main_tex;Main_tex;5;0;Create;True;0;0;0;False;0;False;-1;None;46ecd398e9deeff449b5dcc5001c17c0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-1885.892,455.7346;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector4Node;82;-566.9171,-389.5244;Inherit;False;Property;_Main_control;Main_control;7;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;9;-1653.385,425.9999;Inherit;True;Property;_Matecap;Matecap;1;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;dd5d009f43f5f624ebd820c33770406c;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;-166.9201,-581.7955;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;135;-1472.156,634.1599;Inherit;False;Property;_Mat_cap_control;Mat_cap_control;2;0;Create;True;0;0;0;False;0;False;1,1,1,1;3,2,1,0.88;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;153;-17.65285,-529.4707;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;78;-187.5011,-791.7862;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.DotProductOpNode;171;1799.81,-859.9749;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;206;2072.547,-859.6221;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;182;2072.334,-677.0365;Inherit;False;Property;_Top_linght_power;Top_linght_power;17;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;151;179.3473,-636.4706;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;59.55201,-774.0222;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;138;692.7393,673.8368;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;187;725.0604,872.056;Inherit;False;168;WorldNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;133;-1201.967,424.3074;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;152;179.3473,-491.4708;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;155;330.8847,1691.545;Inherit;False;Property;_Speed_U;Speed_U;14;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;80;263.5991,-770.9543;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;156;335.6851,1908.486;Inherit;False;Property;_Speed_V;Speed_V;15;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;132;-1030.914,422.0715;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.WireNode;196;-861.3254,770.5424;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DotProductOpNode;139;938.7391,764.8368;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;172;2331.604,-860.1547;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;42;292.4439,-556.1085;Inherit;False;Property;_Main_color;Main_color;0;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1.350109,1.350109,1.350109,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;134;-1115.859,633.7553;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;190;2355.255,-406.1809;Inherit;False;Property;_Top_light_color;Top_light_color;16;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;184;2353.521,-640.1556;Inherit;False;Property;_Top_linght_scale;Top_linght_scale;18;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;204;2587.796,-862.5442;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;157;304.6648,1434.354;Inherit;False;0;141;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;158;583.3435,1602.414;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;140;1196.739,765.8368;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;129;551.0331,-773.3833;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;147;1188.76,978.9493;Inherit;True;Property;_Fresnel_power;Fresnel_power;13;0;Create;True;0;0;0;False;0;False;1;9;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;131;-695.3406,456.5961;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PannerNode;154;809.6589,1493.69;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;146;1380.725,765.1049;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;1241.235,166.2809;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;57;1449.506,438.407;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;40;1182.225,386.5228;Inherit;False;Property;_Desatruate;Desatruate;10;0;Create;True;0;0;0;False;0;False;0;0.53;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;183;2742.956,-864.8248;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;144;1167.438,1650.388;Inherit;False;Property;_Fresnel_color;Fresnel_color;12;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;3.283019,3.283019,3.283019,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;186;3036.258,-868.486;Inherit;True;Top_light_;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;141;1093.113,1462.817;Inherit;True;Property;_Frednel_mask;Frednel_mask;11;0;Create;True;0;0;0;False;0;False;-1;None;7961951f20243e8468eca79edce4cd7d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;58;1661.51,426.7325;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;39;1484.458,168.0152;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;143;1631.739,762.8368;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;198;2176.97,525.2048;Inherit;True;186;Top_light_;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;142;1926.857,780.4855;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;150;1899.414,166.6853;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;97;2545.004,146.8383;Inherit;True;3;3;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2862.865,144.9103;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX_icee;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.PiNode;208;-1893.485,-453.282;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;209;-1705.876,-458.4085;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;180;False;1;FLOAT;0
Node;AmplifyShaderEditor.RotatorNode;210;-1497.876,-586.4084;Inherit;False;3;0;FLOAT2;0.5,0.5;False;1;FLOAT2;0.5,0.5;False;2;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;128;-1747.781,-653.8351;Inherit;False;0;122;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;207;-2105.877,-458.4085;Inherit;False;Property;_Mask_Rotator;Mask_Rotator;6;0;Create;True;0;0;0;False;0;False;0;90;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;211;2719.554,-1095.684;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;218;2881.471,-1177.877;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;9.44;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;219;3173.971,-1196.077;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;213;3331.303,-1198.699;Inherit;False;top_mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;214;2263.72,791.457;Inherit;True;Property;_TextureSample0;Texture Sample 0;19;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;220;2727.549,769.1241;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;221;2575.278,834.9569;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;212;2343.713,1174.93;Inherit;True;213;top_mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;217;2347.36,972.6144;Inherit;True;Property;_Vertex_scale;Vertex_scale;20;0;Create;True;0;0;0;False;0;False;0;1.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;223;2572.467,1004.681;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
WireConnection;32;5;149;0
WireConnection;11;0;32;0
WireConnection;127;0;125;0
WireConnection;127;1;126;0
WireConnection;13;0;10;0
WireConnection;13;1;11;0
WireConnection;195;0;74;0
WireConnection;124;0;210;0
WireConnection;124;2;127;0
WireConnection;73;0;13;0
WireConnection;73;1;15;0
WireConnection;168;0;137;0
WireConnection;122;1;124;0
WireConnection;14;0;73;0
WireConnection;14;1;195;0
WireConnection;9;1;14;0
WireConnection;81;0;122;0
WireConnection;81;1;82;3
WireConnection;153;0;82;2
WireConnection;78;0;122;0
WireConnection;78;1;82;1
WireConnection;171;0;169;0
WireConnection;171;1;170;0
WireConnection;206;0;171;0
WireConnection;151;0;81;0
WireConnection;79;0;78;0
WireConnection;79;1;153;0
WireConnection;133;0;9;0
WireConnection;133;1;135;1
WireConnection;152;0;82;4
WireConnection;80;0;79;0
WireConnection;80;1;151;0
WireConnection;80;2;152;0
WireConnection;132;0;133;0
WireConnection;132;1;135;2
WireConnection;196;0;135;4
WireConnection;139;0;138;0
WireConnection;139;1;187;0
WireConnection;172;0;206;0
WireConnection;172;1;182;0
WireConnection;134;0;9;0
WireConnection;134;1;135;3
WireConnection;204;0;172;0
WireConnection;158;0;155;0
WireConnection;158;1;156;0
WireConnection;140;0;139;0
WireConnection;129;0;80;0
WireConnection;129;1;42;0
WireConnection;131;0;132;0
WireConnection;131;1;134;0
WireConnection;131;2;196;0
WireConnection;154;0;157;0
WireConnection;154;2;158;0
WireConnection;146;0;140;0
WireConnection;146;1;147;0
WireConnection;59;0;131;0
WireConnection;59;1;129;0
WireConnection;183;0;204;0
WireConnection;183;1;184;0
WireConnection;183;2;190;0
WireConnection;186;0;183;0
WireConnection;141;1;154;0
WireConnection;58;0;57;0
WireConnection;39;0;59;0
WireConnection;39;1;40;0
WireConnection;143;0;146;0
WireConnection;142;0;143;0
WireConnection;142;1;141;1
WireConnection;142;2;144;0
WireConnection;150;0;39;0
WireConnection;150;1;58;0
WireConnection;97;0;150;0
WireConnection;97;1;142;0
WireConnection;97;2;198;0
WireConnection;0;2;97;0
WireConnection;208;0;207;0
WireConnection;209;0;208;0
WireConnection;210;0;128;0
WireConnection;210;2;209;0
WireConnection;211;0;206;0
WireConnection;218;0;211;0
WireConnection;219;0;218;0
WireConnection;213;0;219;0
WireConnection;220;2;221;0
WireConnection;221;0;214;1
WireConnection;221;1;217;0
WireConnection;221;2;212;0
ASEEND*/
//CHKSM=AECA94D2A7A08B17EC26AF4DD1261A26E9D00D8D