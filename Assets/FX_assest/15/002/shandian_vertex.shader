// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/shandian_vertex"
{
	Properties
	{
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
		[HDR]_Color0("Color 0", Color) = (0,0,0,0)
		_Mask("Mask", 2D) = "white" {}
		[Enum(off,0,on,1)]_Custom("Custom", Float) = 0
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
		struct Input
		{
			float4 vertexColor : COLOR;
			float2 uv_texcoord;
		};

		uniform sampler2D _X;
		uniform float _X_speed_U;
		uniform float _X_speed_V;
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
		uniform float _Custom;
		uniform sampler2D _Mask;
		uniform float4 _Mask_ST;
		uniform float _Vetex_normal_scale;
		uniform float4 _Color0;
		uniform sampler2D _Main_tex;
		uniform float _Speed_U;
		uniform float _Speed_V;
		uniform float4 _Main_tex_ST;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult23 = (float2(_X_speed_U , _X_speed_V));
			float2 uv_X = v.texcoord.xy * _X_ST.xy + _X_ST.zw;
			float2 panner22 = ( 1.0 * _Time.y * appendResult23 + uv_X);
			float2 appendResult25 = (float2(_Y_speed_U , _Y_speed_V));
			float2 uv_Y = v.texcoord.xy * _Y_ST.xy + _Y_ST.zw;
			float2 panner24 = ( 1.0 * _Time.y * appendResult25 + uv_Y);
			float2 appendResult27 = (float2(_Z_speed_U , _Z_speed_V));
			float2 uv_Z = v.texcoord.xy * _Z_ST.xy + _Z_ST.zw;
			float2 panner26 = ( 1.0 * _Time.y * appendResult27 + uv_Z);
			float3 appendResult4 = (float3((-1.0 + (tex2Dlod( _X, float4( panner22, 0, 0.0) ).r - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , (-1.0 + (tex2Dlod( _Y, float4( panner24, 0, 0.0) ).r - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) , (-1.0 + (tex2Dlod( _Z, float4( panner26, 0, 0.0) ).r - 0.0) * (1.0 - -1.0) / (1.0 - 0.0))));
			float lerpResult39 = lerp( _Scale , ( _Scale + v.texcoord2.xy.x ) , _Custom);
			float2 uv_Mask = v.texcoord * _Mask_ST.xy + _Mask_ST.zw;
			float lerpResult44 = lerp( _Vetex_normal_scale , ( v.texcoord2.xy.y + _Vetex_normal_scale ) , _Custom);
			float3 ase_vertexNormal = v.normal.xyz;
			v.vertex.xyz += ( ( appendResult4 * lerpResult39 * tex2Dlod( _Mask, float4( uv_Mask, 0, 0.0) ).r * v.color.a ) + ( lerpResult44 * ase_vertexNormal ) );
			v.vertex.w = 1;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 appendResult37 = (float2(_Speed_U , _Speed_V));
			float2 uv_Main_tex = i.uv_texcoord * _Main_tex_ST.xy + _Main_tex_ST.zw;
			float2 panner33 = ( 1.0 * _Time.y * appendResult37 + uv_Main_tex);
			float4 tex2DNode32 = tex2D( _Main_tex, panner33 );
			o.Emission = ( i.vertexColor * _Color0 * tex2DNode32.r ).rgb;
			o.Alpha = tex2DNode32.r;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Unlit alpha:fade keepalpha fullforwardshadows vertex:vertexDataFunc 

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
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
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
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
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
				surfIN.uv_texcoord = IN.customPack1.xy;
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
Node;AmplifyShaderEditor.DynamicAppendNode;4;-85.9303,336.4512;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;87.0697,348.4512;Inherit;False;4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;2;-679.1998,236.4001;Inherit;True;Property;_Y;Y;6;0;Create;True;0;0;0;False;0;False;-1;None;ad18c0a40da84554c8ef66c4818f1ce3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-686.4999,-15.5;Inherit;True;Property;_X;X;3;0;Create;True;0;0;0;False;0;False;-1;None;3454dca00bdaebf429549917eab7f109;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-689.6999,487.3001;Inherit;True;Property;_Z;Z;9;0;Create;True;0;0;0;False;0;False;-1;None;ad18c0a40da84554c8ef66c4818f1ce3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;9;-344.4711,258.6511;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;10;-369.4711,507.6511;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;19;-1558.51,-50.40587;Inherit;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;21;-1559.51,564.5941;Inherit;False;0;3;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-1426.51,78.59413;Inherit;False;Property;_X_speed_U;X_speed_U;4;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-1421.51,147.5941;Inherit;False;Property;_X_speed_V;X_speed_V;5;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;22;-1103.51,1.594128;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;23;-1255.51,94.59413;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;24;-1072.51,303.0942;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;25;-1224.51,396.0942;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;27;-1195.51,659.0941;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;20;-1539.51,269.5942;Inherit;False;0;2;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;26;-1091.51,501.0942;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-1469.51,392.5942;Inherit;False;Property;_Y_speed_U;Y_speed_U;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1468.51,470.5942;Inherit;False;Property;_Y_speed_V;Y_speed_V;8;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1390.51,699.5941;Inherit;False;Property;_Z_speed_U;Z_speed_U;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1394.51,766.5941;Inherit;False;Property;_Z_speed_V;Z_speed_V;11;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;8;-342.8047,46.78999;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;29;-686.5876,711.3636;Inherit;True;Property;_Mask;Mask;15;0;Create;True;0;0;0;False;0;False;-1;None;2e9606ebbb0a5904f87d3c20aaa61ca5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;28;-313.9165,-774.1347;Inherit;False;Property;_Color0;Color 0;14;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0.5228239,1.865785,5.278032,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;48.51742,-709.475;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;31;-282.0636,-979.9504;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;32;-353.1886,-586.6943;Inherit;True;Property;_Main_tex;Main_tex;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;33;-619.0664,-554.2313;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;35;-1067.066,-432.2313;Inherit;False;Property;_Speed_U;Speed_U;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1060.066,-323.2313;Inherit;False;Property;_Speed_V;Speed_V;2;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;37;-874.0664,-360.2313;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;34;-985.0664,-624.2313;Inherit;False;0;32;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;6;-246.9303,676.4512;Inherit;False;Property;_Scale;Scale;12;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;43;293.3455,430.1352;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;39;146.7639,637.6943;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;44;278.996,796.7958;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;42;-61.97461,728.8132;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;41;-249.9746,909.8132;Inherit;False;Property;_Custom;Custom;16;1;[Enum];Create;True;0;2;off;0;on;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;40;-328.2361,774.6943;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;45;89.99597,1014.796;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;513.9999,8.699999;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX/shandian_vertex;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Transparent;0.5;True;True;0;False;Transparent;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;2;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.RangedFloatNode;46;-244.004,1019.796;Inherit;False;Property;_Vetex_normal_scale;Vetex_normal_scale;13;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;533.4304,816.8998;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;48;307.4304,976.8998;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;4;0;8;0
WireConnection;4;1;9;0
WireConnection;4;2;10;0
WireConnection;5;0;4;0
WireConnection;5;1;39;0
WireConnection;5;2;29;1
WireConnection;5;3;31;4
WireConnection;2;1;24;0
WireConnection;1;1;22;0
WireConnection;3;1;26;0
WireConnection;9;0;2;1
WireConnection;10;0;3;1
WireConnection;22;0;19;0
WireConnection;22;2;23;0
WireConnection;23;0;12;0
WireConnection;23;1;13;0
WireConnection;24;0;20;0
WireConnection;24;2;25;0
WireConnection;25;0;14;0
WireConnection;25;1;15;0
WireConnection;27;0;16;0
WireConnection;27;1;17;0
WireConnection;26;0;21;0
WireConnection;26;2;27;0
WireConnection;8;0;1;1
WireConnection;30;0;31;0
WireConnection;30;1;28;0
WireConnection;30;2;32;1
WireConnection;32;1;33;0
WireConnection;33;0;34;0
WireConnection;33;2;37;0
WireConnection;37;0;35;0
WireConnection;37;1;36;0
WireConnection;43;0;5;0
WireConnection;43;1;47;0
WireConnection;39;0;6;0
WireConnection;39;1;42;0
WireConnection;39;2;41;0
WireConnection;44;0;46;0
WireConnection;44;1;45;0
WireConnection;44;2;41;0
WireConnection;42;0;6;0
WireConnection;42;1;40;1
WireConnection;45;0;40;2
WireConnection;45;1;46;0
WireConnection;0;2;30;0
WireConnection;0;9;32;1
WireConnection;0;11;43;0
WireConnection;47;0;44;0
WireConnection;47;1;48;0
ASEEND*/
//CHKSM=5EE4FBC61C7A82A2536AE6A3402C4C7CCCEFA9D6