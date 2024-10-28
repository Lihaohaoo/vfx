// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/shandian_vertex"
{
	Properties
	{
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
		[HDR]_Color0("Color 0", Color) = (0,0,0,0)
		_Mask("Mask", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc 
		struct Input
		{
			half filler;
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
		uniform sampler2D _Mask;
		uniform float4 _Mask_ST;
		uniform float4 _Color0;

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
			float2 uv_Mask = v.texcoord * _Mask_ST.xy + _Mask_ST.zw;
			v.vertex.xyz += ( appendResult4 * _Scale * tex2Dlod( _Mask, float4( uv_Mask, 0, 0.0) ).r );
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Emission = _Color0.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.DynamicAppendNode;4;-85.9303,336.4512;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;348.9,10;Float;False;True;-1;2;ASEMaterialInspector;0;0;Standard;FX/shandian_vertex;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;87.0697,348.4512;Inherit;False;3;3;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-117.9303,510.4512;Inherit;False;Property;_Scale;Scale;9;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;2;-679.1998,236.4001;Inherit;True;Property;_Y;Y;3;0;Create;True;0;0;0;False;0;False;-1;None;0e616e9c69b8b68489dbf83194b0a869;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;1;-686.4999,-15.5;Inherit;True;Property;_X;X;0;0;Create;True;0;0;0;False;0;False;-1;None;3454dca00bdaebf429549917eab7f109;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;3;-689.6999,487.3001;Inherit;True;Property;_Z;Z;6;0;Create;True;0;0;0;False;0;False;-1;None;ad18c0a40da84554c8ef66c4818f1ce3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TFHCRemapNode;9;-344.4711,258.6511;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;10;-369.4711,507.6511;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;19;-1558.51,-50.40587;Inherit;False;0;1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;21;-1559.51,564.5941;Inherit;False;0;3;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;12;-1426.51,78.59413;Inherit;False;Property;_X_speed_U;X_speed_U;1;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-1421.51,147.5941;Inherit;False;Property;_X_speed_V;X_speed_V;2;0;Create;True;0;0;0;False;0;False;0;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;22;-1103.51,1.594128;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;23;-1255.51,94.59413;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;24;-1072.51,303.0942;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;25;-1224.51,396.0942;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;27;-1195.51,659.0941;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;20;-1539.51,269.5942;Inherit;False;0;2;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;26;-1091.51,501.0942;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-1469.51,392.5942;Inherit;False;Property;_Y_speed_U;Y_speed_U;4;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1468.51,470.5942;Inherit;False;Property;_Y_speed_V;Y_speed_V;5;0;Create;True;0;0;0;False;0;False;0;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1390.51,699.5941;Inherit;False;Property;_Z_speed_U;Z_speed_U;7;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1394.51,766.5941;Inherit;False;Property;_Z_speed_V;Z_speed_V;8;0;Create;True;0;0;0;False;0;False;0;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;8;-342.8047,46.78999;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;-1;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;28;-167.8752,-179.7799;Inherit;False;Property;_Color0;Color 0;10;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0.5228239,1.865785,5.278032,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;29;-686.5876,711.3636;Inherit;True;Property;_Mask;Mask;11;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;4;0;8;0
WireConnection;4;1;9;0
WireConnection;4;2;10;0
WireConnection;0;2;28;0
WireConnection;0;11;5;0
WireConnection;5;0;4;0
WireConnection;5;1;6;0
WireConnection;5;2;29;1
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
ASEEND*/
//CHKSM=6035B7E4C6F8DFB8F7A3536FF699A140FE9D2359