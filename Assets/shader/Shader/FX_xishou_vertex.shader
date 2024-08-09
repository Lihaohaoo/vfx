// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX_xishou_vertex"
{
	Properties
	{
		_EdgeLength ( "Edge length", Range( 2, 50 ) ) = 16.1
		_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		_Target_position("Target_position", Vector) = (0,0,5,0)
		_Hardness("Hardness", Float) = 15
		_Radius("Radius", Float) = 0
		_Rotate_Scale("Rotate_Scale", Float) = 0
		_MaskSmoothness("MaskSmoothness", Range( 0 , 1)) = 0.1
		_color("color", Float) = 0.5
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" }
		Cull Back
		CGPROGRAM
		#include "Tessellation.cginc"
		#pragma target 4.6
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows vertex:vertexDataFunc tessellate:tessFunction tessphong:_TessPhongStrength 
		struct Input
		{
			float3 worldPos;
		};

		uniform float3 _Target_position;
		uniform float _Radius;
		uniform float _Hardness;
		uniform float _Rotate_Scale;
		uniform float _MaskSmoothness;
		uniform float _color;
		uniform float _EdgeLength;
		uniform float _TessPhongStrength;


		float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
		{
			original -= center;
			float C = cos( angle );
			float S = sin( angle );
			float t = 1 - C;
			float m00 = t * u.x * u.x + C;
			float m01 = t * u.x * u.y - S * u.z;
			float m02 = t * u.x * u.z + S * u.y;
			float m10 = t * u.x * u.y + S * u.z;
			float m11 = t * u.y * u.y + C;
			float m12 = t * u.y * u.z - S * u.x;
			float m20 = t * u.x * u.z - S * u.y;
			float m21 = t * u.y * u.z + S * u.x;
			float m22 = t * u.z * u.z + C;
			float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
			return mul( finalMatrix, original ) + center;
		}


		float4 tessFunction( appdata_full v0, appdata_full v1, appdata_full v2 )
		{
			return UnityEdgeLengthBasedTess (v0.vertex, v1.vertex, v2.vertex, _EdgeLength);
		}

		void vertexDataFunc( inout appdata_full v )
		{
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 objToWorld2 = mul( unity_ObjectToWorld, float4( float3(0,0,0), 1 ) ).xyz;
			float3 normalizeResult14 = normalize( ( _Target_position - objToWorld2 ) );
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 temp_output_5_0_g1 = ( ( ase_worldPos - _Target_position ) / ( _Radius * 0.5 ) );
			float dotResult8_g1 = dot( temp_output_5_0_g1 , temp_output_5_0_g1 );
			float temp_output_4_0 = pow( saturate( dotResult8_g1 ) , _Hardness );
			float RotateAnged11 = sin( temp_output_4_0 );
			float3 rotatedValue12 = RotateAroundAxis( _Target_position, ase_worldPos, normalizeResult14, ( RotateAnged11 * ( _Rotate_Scale * UNITY_PI ) ) );
			float Mask9 = ( 1.0 - saturate( temp_output_4_0 ) );
			float3 worldToObj26 = mul( unity_WorldToObject, float4( ( ( ( _Target_position - rotatedValue12 ) * Mask9 ) + rotatedValue12 ), 1 ) ).xyz;
			float smoothstepResult30 = smoothstep( 0.0 , _MaskSmoothness , Mask9);
			float3 lerpResult27 = lerp( ase_vertex3Pos , worldToObj26 , smoothstepResult30);
			v.vertex.xyz = lerpResult27;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float3 temp_cast_0 = (_color).xxx;
			o.Albedo = temp_cast_0;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.FunctionNode;4;-473.5,220.5;Inherit;True;SphereMask;-1;;1;988803ee12caf5f4690caee3c8c4a5bb;0;3;15;FLOAT3;0,0,0;False;14;FLOAT;0;False;12;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-660.5,384.5;Inherit;False;Property;_Hardness;Hardness;6;0;Create;True;0;0;0;False;0;False;15;45.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;7;-136.5,219.5;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;8;19.5,221.5;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;9;196.7453,218.7666;Inherit;False;Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;10;-122.4547,325.2666;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;11;11.94592,328.3654;Inherit;False;RotateAnged;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;13;-855.8586,492.5442;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalizeNode;14;-667.8586,501.5442;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-595.9214,732.6353;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;15;-877.2491,694.8779;Inherit;False;11;RotateAnged;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1082.921,849.6353;Inherit;False;Property;_Rotate_Scale;Rotate_Scale;8;0;Create;True;0;0;0;False;0;False;0;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PiNode;19;-901.9214,851.6353;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;20;-529.5051,917.8586;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RotateAboutAxisNode;12;-331.0541,531.3655;Inherit;False;False;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.Vector3Node;3;-1734.933,436.8187;Inherit;False;Constant;_Pivet;Pivet;1;0;Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TransformPositionNode;2;-1506.933,433.8187;Inherit;False;Object;World;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;1;-1612.04,149.2642;Inherit;False;Property;_Target_position;Target_position;5;0;Create;True;0;0;0;False;0;False;0,0,5;0,1.19,3;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WireNode;22;358.5144,81.16982;Inherit;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;25;1009.769,551.2805;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;21;536.4386,302.5447;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;780.5696,323.8808;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;24;557.5696,447.8807;Inherit;False;9;Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TransformPositionNode;26;1240.369,544.0587;Inherit;False;World;Object;False;Fast;True;1;0;FLOAT3;0,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.LerpOp;27;1556.369,578.0587;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PosVertexDataNode;28;1214.369,367.0587;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;30;1102.369,863.0587;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;31;835.3687,773.0587;Inherit;False;9;Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;32;878.3687,871.0587;Inherit;False;Constant;_Float0;Float 0;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;754.3687,981.0587;Inherit;False;Property;_MaskSmoothness;MaskSmoothness;9;0;Create;True;0;0;0;False;0;False;0.1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-892.5,268.5;Inherit;False;Property;_Radius;Radius;7;0;Create;True;0;0;0;False;0;False;0;6.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;35;-729.088,300.0822;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;42;1580.183,334.2503;Inherit;False;Property;_color;color;10;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;43;1900.699,442.0716;Float;False;True;-1;6;ASEMaterialInspector;0;0;Standard;FX_xishou_vertex;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;2;16.1;10;25;True;0.5;True;0;0;False;;0;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Absolute;0;;-1;-1;-1;0;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;4;15;1;0
WireConnection;4;14;35;0
WireConnection;4;12;6;0
WireConnection;7;0;4;0
WireConnection;8;0;7;0
WireConnection;9;0;8;0
WireConnection;10;0;4;0
WireConnection;11;0;10;0
WireConnection;13;0;1;0
WireConnection;13;1;2;0
WireConnection;14;0;13;0
WireConnection;16;0;15;0
WireConnection;16;1;19;0
WireConnection;19;0;17;0
WireConnection;12;0;14;0
WireConnection;12;1;16;0
WireConnection;12;2;1;0
WireConnection;12;3;20;0
WireConnection;2;0;3;0
WireConnection;22;0;1;0
WireConnection;25;0;23;0
WireConnection;25;1;12;0
WireConnection;21;0;22;0
WireConnection;21;1;12;0
WireConnection;23;0;21;0
WireConnection;23;1;24;0
WireConnection;26;0;25;0
WireConnection;27;0;28;0
WireConnection;27;1;26;0
WireConnection;27;2;30;0
WireConnection;30;0;31;0
WireConnection;30;1;32;0
WireConnection;30;2;33;0
WireConnection;35;0;5;0
WireConnection;43;0;42;0
WireConnection;43;11;27;0
ASEEND*/
//CHKSM=768FDD18470EACBB60CA839BD45D7A98DC5451CB