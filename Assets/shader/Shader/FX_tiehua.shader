// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "t"
{
	Properties
	{
		_Main("Main", 2D) = "white" {}
		[HDR]_Emission_color("Emission_color", Color) = (1,1,1,1)
		_Emission_scale("Emission_scale", Float) = 1
		[Enum(UnityEngine.Rendering.CompareFunction)]_Ztest_modo("Ztest_modo", Float) = 5
		_Mask("Mask", 2D) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" }
	LOD 100

		CGINCLUDE
		#pragma target 3.0
		ENDCG
		Blend One One, One One
		AlphaToMask Off
		Cull Back
		ColorMask RGBA
		ZWrite Off
		ZTest [_Ztest_modo]
		
		
		
		Pass
		{
			Name "Unlit"

			CGPROGRAM

			

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_COLOR


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform sampler2D _Mask;
			uniform float4 _Mask_ST;
			uniform sampler2D _Main;
			uniform float4 _Main_ST;
			uniform float4 _Emission_color;
			uniform float _Emission_scale;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float2 uv_Mask = i.ase_texcoord1.xy * _Mask_ST.xy + _Mask_ST.zw;
				float4 tex2DNode13 = tex2D( _Mask, uv_Mask );
				float2 uv_Main = i.ase_texcoord1.xy * _Main_ST.xy + _Main_ST.zw;
				float4 tex2DNode1 = tex2D( _Main, uv_Main );
				float4 appendResult3 = (float4(( tex2DNode13.r * tex2DNode13.a * ( tex2DNode1 * i.ase_color * _Emission_color ) ).rgb , ( tex2DNode1.a * i.ase_color.a * _Emission_color.a )));
				
				
				finalColor = ( appendResult3 * _Emission_scale );
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-191.5,-31;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-172.5,-149;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;3;23.5,-149;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.VertexColorNode;5;-552.5,59;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;8;-562.5,280;Inherit;False;Property;_Emission_color;Emission_color;1;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;2,2,2,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;0;420,-145;Float;False;True;-1;2;ASEMaterialInspector;100;5;t;0770190933193b94aaa3065e307002fa;True;Unlit;0;0;Unlit;2;True;True;4;1;False;;1;False;;4;1;False;;1;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;True;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;2;True;_Ztest_modo;True;False;0;False;;0;False;;True;1;RenderType=Transparent=RenderType;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;1;True;False;;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;9;209.834,-125.7279;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;10;-160.166,184.2721;Inherit;False;Property;_Emission_scale;Emission_scale;2;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-49.75,-376;Inherit;False;Property;_Ztest_modo;Ztest_modo;3;1;[Enum];Fetch;True;0;0;1;UnityEngine.Rendering.CompareFunction;True;0;False;5;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-654.5,-152;Inherit;True;Property;_Main;Main;0;0;Create;True;0;0;0;False;0;False;-1;None;2148ffc48107e0a4896b9c86362a4cca;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;13;-744.4902,-417.1391;Inherit;True;Property;_Mask;Mask;4;0;Create;True;0;0;0;False;0;False;-1;None;7105edeff6d53ac49bc6dd7ad24c6603;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;12;-94.13861,-302.2706;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
WireConnection;4;0;1;4
WireConnection;4;1;5;4
WireConnection;4;2;8;4
WireConnection;6;0;1;0
WireConnection;6;1;5;0
WireConnection;6;2;8;0
WireConnection;3;0;12;0
WireConnection;3;3;4;0
WireConnection;0;0;9;0
WireConnection;9;0;3;0
WireConnection;9;1;10;0
WireConnection;12;0;13;1
WireConnection;12;1;13;4
WireConnection;12;2;6;0
ASEEND*/
//CHKSM=D4963D656406A698463FEE0118F43DFCE0C6F90E