// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/FX_pit_para"
{
	Properties
	{
		[Enum(UnityEngine.Rendering.CullMode)]_Cull_mode("Cull_mode", Float) = 0
		_Base_tex("Base_tex", 2D) = "white" {}
		_opacity("opacity", Float) = 0
		_Parallax_scale("Parallax_scale", Float) = 0
		_Parallax_tex("Parallax_tex", 2D) = "bump" {}
		[HDR]_Color0("Color 0", Color) = (0,0,0,0)
		[HDR]_Color1("Color 1", Color) = (1,1,1,1)
		_Emissive_power("Emissive_power", Float) = 1
		[HDR]_Base_color("Base_color", Color) = (1,1,1,1)
		_Dissovle01_tex("Dissovle01_tex", 2D) = "white" {}
		_Dissolve01("Dissolve01", Range( -0.2 , 1)) = 1
		_Dissolve01_Soft("Dissolve01_Soft", Range( 0 , 1)) = 0
		_Dissovle02_tex("Dissovle02_tex", 2D) = "white" {}
		_Dissolve02("Dissolve02", Range( -0.2 , 1)) = 1
		_Dissolve02_Soft("Dissolve02_Soft", Range( 0 , 1)) = 0
		[Toggle][Enum(OFF,0,ON,1)]_Custm_dissolve("Custm_dissolve", Float) = 0
		_Wenli_tex("Wenli_tex", 2D) = "white" {}
		_Wenli_tex_V("Wenli_tex_V", Float) = 0
		_Wenli_tex_U("Wenli_tex_U", Float) = 0
		[Enum(Off,0,On,1)]_Use_dissolve_02("Use_dissolve_02", Float) = 0
		[HideInInspector] _texcoord2( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Transparent+0" "IsEmissive" = "true"  }
		Cull [_Cull_mode]
		ZWrite Off
		Blend SrcAlpha OneMinusSrcAlpha
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float4 vertexColor : COLOR;
			float2 uv_texcoord;
			float3 viewDir;
			INTERNAL_DATA
			float3 worldNormal;
			float3 worldPos;
			float4 uv2_texcoord2;
		};

		uniform float _Cull_mode;
		uniform sampler2D _Wenli_tex;
		uniform float _Wenli_tex_U;
		uniform float _Wenli_tex_V;
		uniform float4 _Wenli_tex_ST;
		uniform float4 _Color0;
		uniform float4 _Color1;
		uniform sampler2D _Base_tex;
		uniform sampler2D _Parallax_tex;
		uniform float _Parallax_scale;
		uniform float4 _Parallax_tex_ST;
		uniform float _Emissive_power;
		uniform float4 _Base_color;
		uniform sampler2D _Dissovle01_tex;
		uniform float4 _Dissovle01_tex_ST;
		uniform float _Dissolve01;
		uniform float _Custm_dissolve;
		uniform float _Dissolve01_Soft;
		uniform float _opacity;
		uniform sampler2D _Dissovle02_tex;
		uniform float4 _Dissovle02_tex_ST;
		uniform float _Dissolve02;
		uniform float _Dissolve02_Soft;
		uniform float _Use_dissolve_02;


		inline float2 POM( sampler2D heightMap, float2 uvs, float2 dx, float2 dy, float3 normalWorld, float3 viewWorld, float3 viewDirTan, int minSamples, int maxSamples, float parallax, float refPlane, float2 tilling, float2 curv, int index )
		{
			float3 result = 0;
			int stepIndex = 0;
			int numSteps = ( int )lerp( (float)maxSamples, (float)minSamples, saturate( dot( normalWorld, viewWorld ) ) );
			float layerHeight = 1.0 / numSteps;
			float2 plane = parallax * ( viewDirTan.xy / viewDirTan.z );
			uvs.xy += refPlane * plane;
			float2 deltaTex = -plane * layerHeight;
			float2 prevTexOffset = 0;
			float prevRayZ = 1.0f;
			float prevHeight = 0.0f;
			float2 currTexOffset = deltaTex;
			float currRayZ = 1.0f - layerHeight;
			float currHeight = 0.0f;
			float intersection = 0;
			float2 finalTexOffset = 0;
			while ( stepIndex < numSteps + 1 )
			{
			 	currHeight = tex2Dgrad( heightMap, uvs + currTexOffset, dx, dy ).r;
			 	if ( currHeight > currRayZ )
			 	{
			 	 	stepIndex = numSteps + 1;
			 	}
			 	else
			 	{
			 	 	stepIndex++;
			 	 	prevTexOffset = currTexOffset;
			 	 	prevRayZ = currRayZ;
			 	 	prevHeight = currHeight;
			 	 	currTexOffset += deltaTex;
			 	 	currRayZ -= layerHeight;
			 	}
			}
			int sectionSteps = 2;
			int sectionIndex = 0;
			float newZ = 0;
			float newHeight = 0;
			while ( sectionIndex < sectionSteps )
			{
			 	intersection = ( prevHeight - prevRayZ ) / ( prevHeight - currHeight + currRayZ - prevRayZ );
			 	finalTexOffset = prevTexOffset + intersection * deltaTex;
			 	newZ = prevRayZ - intersection * layerHeight;
			 	newHeight = tex2Dgrad( heightMap, uvs + finalTexOffset, dx, dy ).r;
			 	if ( newHeight > newZ )
			 	{
			 	 	currTexOffset = finalTexOffset;
			 	 	currHeight = newHeight;
			 	 	currRayZ = newZ;
			 	 	deltaTex = intersection * deltaTex;
			 	 	layerHeight = intersection * layerHeight;
			 	}
			 	else
			 	{
			 	 	prevTexOffset = finalTexOffset;
			 	 	prevHeight = newHeight;
			 	 	prevRayZ = newZ;
			 	 	deltaTex = ( 1 - intersection ) * deltaTex;
			 	 	layerHeight = ( 1 - intersection ) * layerHeight;
			 	}
			 	sectionIndex++;
			}
			return uvs.xy + finalTexOffset;
		}


		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			o.Normal = float3(0,0,1);
			float2 appendResult45 = (float2(_Wenli_tex_U , _Wenli_tex_V));
			float2 uv_Wenli_tex = i.uv_texcoord * _Wenli_tex_ST.xy + _Wenli_tex_ST.zw;
			float2 panner42 = ( 1.0 * _Time.y * appendResult45 + uv_Wenli_tex);
			float4 tex2DNode40 = tex2D( _Wenli_tex, panner42 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = normalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float2 OffsetPOM13 = POM( _Parallax_tex, i.uv_texcoord, ddx(i.uv_texcoord), ddy(i.uv_texcoord), ase_worldNormal, ase_worldViewDir, i.viewDir, 128, 128, _Parallax_scale, 0, _Parallax_tex_ST.xy, float2(0,0), 0 );
			float4 tex2DNode1 = tex2D( _Base_tex, OffsetPOM13 );
			float4 lerpResult14 = lerp( _Color0 , _Color1 , pow( tex2DNode1.r , _Emissive_power ));
			o.Emission = ( i.vertexColor * ( ( ( tex2DNode40 * tex2DNode40.a ) * lerpResult14 ) + ( tex2DNode1.r * _Base_color ) ) ).rgb;
			float2 uv_Dissovle01_tex = i.uv_texcoord * _Dissovle01_tex_ST.xy + _Dissovle01_tex_ST.zw;
			float temp_output_1_0_g1 = tex2D( _Dissovle01_tex, uv_Dissovle01_tex ).r;
			float lerpResult9_g1 = lerp( temp_output_1_0_g1 , ( 1.0 - temp_output_1_0_g1 ) , 0.0);
			float lerpResult35 = lerp( _Dissolve01 , i.uv2_texcoord2.z , _Custm_dissolve);
			float temp_output_3_0_g1 = _Dissolve01_Soft;
			float2 uv_Dissovle02_tex = i.uv_texcoord * _Dissovle02_tex_ST.xy + _Dissovle02_tex_ST.zw;
			float temp_output_1_0_g2 = tex2D( _Dissovle02_tex, uv_Dissovle02_tex ).r;
			float lerpResult9_g2 = lerp( temp_output_1_0_g2 , ( 1.0 - temp_output_1_0_g2 ) , 0.0);
			float lerpResult53 = lerp( _Dissolve02 , i.uv2_texcoord2.w , _Custm_dissolve);
			float temp_output_3_0_g2 = _Dissolve02_Soft;
			float lerpResult57 = lerp( 1.0 , saturate( ( ( ( ( lerpResult9_g2 + 1.0 ) - ( lerpResult53 * ( 1.0 + ( 1.0 - temp_output_3_0_g2 ) ) ) ) - temp_output_3_0_g2 ) / ( 1.0 - temp_output_3_0_g2 ) ) ) , _Use_dissolve_02);
			o.Alpha = ( tex2DNode1.r * saturate( ( ( ( ( lerpResult9_g1 + 1.0 ) - ( lerpResult35 * ( 1.0 + ( 1.0 - temp_output_3_0_g1 ) ) ) ) - temp_output_3_0_g1 ) / ( 1.0 - temp_output_3_0_g1 ) ) ) * _opacity * lerpResult57 );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.CommentaryNode;28;-2347.134,-397.2709;Inherit;False;796.0122;763.0891;parallax;5;9;8;12;4;13;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TexturePropertyNode;12;-2209.563,-103.9026;Inherit;True;Property;_Parallax_tex;Parallax_tex;5;0;Create;True;0;0;0;False;0;False;None;240516b826761ee48b889709facf135c;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;8;-2176.134,97.72916;Inherit;False;Property;_Parallax_scale;Parallax_scale;4;0;Create;True;0;0;0;False;0;False;0;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-2297.134,-347.2709;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;4;-2167.259,177.8183;Inherit;False;Tangent;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;44;-1223.875,-1286.92;Inherit;False;Property;_Wenli_tex_V;Wenli_tex_V;18;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;43;-1224.875,-1371.92;Inherit;False;Property;_Wenli_tex_U;Wenli_tex_U;19;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;27;-1102.749,-1016.84;Inherit;False;801.6188;560.6035;emissive;5;16;15;17;18;14;;1,0.09067275,0,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;45;-1021.875,-1347.92;Inherit;True;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;41;-1206.437,-1564.707;Inherit;False;0;40;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-1052.749,-572.2366;Inherit;False;Property;_Emissive_power;Emissive_power;8;0;Create;True;0;0;0;False;0;False;1;2.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;42;-748.0401,-1475.742;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;16;-788.7123,-792.0965;Inherit;False;Property;_Color1;Color 1;7;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;5.340313,5.340313,5.340313,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;40;-474.908,-1514.885;Inherit;True;Property;_Wenli_tex;Wenli_tex;17;0;Create;True;0;0;0;False;0;False;-1;None;ec3ddf839ad51dd41943dc1c20c36639;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;17;-741.7967,-601.3704;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;15;-791.0203,-966.8401;Inherit;False;Property;_Color0;Color 0;6;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;47;-155.5702,-1386.504;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;22;-1163.068,120.6952;Inherit;False;Property;_Base_color;Base_color;9;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;14;-483.1301,-765.204;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;23;-868.209,101.0836;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-73.65247,-1046.279;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;24;-68.56793,-150.2283;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;25;0.635587,-341.0154;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;26;253.7356,-149.5153;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-626.785,298.6973;Inherit;False;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;605.3,-118.9;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX/FX_pit_para;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Off;2;False;;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;True;_Cull_mode;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.RangedFloatNode;48;369.0278,-795.599;Inherit;False;Property;_Cull_mode;Cull_mode;1;1;[Enum];Create;True;0;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-1484.318,-120.8486;Inherit;True;Property;_Base_tex;Base_tex;2;0;Create;True;0;0;0;False;0;False;-1;None;44c2945b105b1aa4294aa471a54f0c84;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ParallaxOcclusionMappingNode;13;-1802.121,-93.35558;Inherit;False;0;128;False;;128;False;;2;0.02;0;False;1,1;False;0,0;8;0;FLOAT2;0,0;False;1;SAMPLER2D;;False;7;SAMPLERSTATE;;False;2;FLOAT;0.02;False;3;FLOAT3;0,0,0;False;4;FLOAT;0;False;5;FLOAT2;0,0;False;6;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;36;-1513.927,827.3643;Inherit;False;Property;_Custm_dissolve;Custm_dissolve;16;2;[Toggle];[Enum];Create;True;0;2;OFF;0;ON;1;0;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;34;-1529.484,639.6367;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;37;-862.3729,633.8644;Inherit;False;Property;_opacity;opacity;3;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;38;-925.491,312.6122;Inherit;False;Dissolve;-1;;1;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-1581.54,524.0079;Inherit;False;Property;_Dissolve01;Dissolve01;11;0;Create;True;0;0;0;False;0;False;1;0.2558219;-0.2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-1167.007,722.0062;Inherit;False;Property;_Dissolve01_Soft;Dissolve01_Soft;12;0;Create;True;0;0;0;False;0;False;0;0.78;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;51;-1535.049,1443.475;Inherit;False;1;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;53;-1210.492,1423.202;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;56;-931.0561,1116.45;Inherit;False;Dissolve;-1;;2;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;50;-1587.105,1327.846;Inherit;False;Property;_Dissolve02;Dissolve02;14;0;Create;True;0;0;0;False;0;False;1;0.2558219;-0.2;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;54;-1714.305,1109.546;Inherit;True;Property;_Dissovle02_tex;Dissovle02_tex;13;0;Create;True;0;0;0;False;0;False;-1;None;2e9606ebbb0a5904f87d3c20aaa61ca5;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;52;-1205.072,1558.344;Inherit;False;Property;_Dissolve02_Soft;Dissolve02_Soft;15;0;Create;True;0;0;0;False;0;False;0;0.95;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;35;-1204.927,619.3643;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;57;-659.8244,1062.573;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;58;-821.2603,1259.784;Inherit;False;Property;_Use_dissolve_02;Use_dissolve_02;20;1;[Enum];Create;True;0;2;Off;0;On;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;30;-1560.54,307.0079;Inherit;True;Property;_Dissovle01_tex;Dissovle01_tex;10;0;Create;True;0;0;0;False;0;False;-1;None;44c2945b105b1aa4294aa471a54f0c84;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
WireConnection;45;0;43;0
WireConnection;45;1;44;0
WireConnection;42;0;41;0
WireConnection;42;2;45;0
WireConnection;40;1;42;0
WireConnection;17;0;1;1
WireConnection;17;1;18;0
WireConnection;47;0;40;0
WireConnection;47;1;40;4
WireConnection;14;0;15;0
WireConnection;14;1;16;0
WireConnection;14;2;17;0
WireConnection;23;0;1;1
WireConnection;23;1;22;0
WireConnection;46;0;47;0
WireConnection;46;1;14;0
WireConnection;24;0;46;0
WireConnection;24;1;23;0
WireConnection;26;0;25;0
WireConnection;26;1;24;0
WireConnection;32;0;1;1
WireConnection;32;1;38;0
WireConnection;32;2;37;0
WireConnection;32;3;57;0
WireConnection;0;2;26;0
WireConnection;0;9;32;0
WireConnection;1;1;13;0
WireConnection;13;0;9;0
WireConnection;13;1;12;0
WireConnection;13;7;12;1
WireConnection;13;2;8;0
WireConnection;13;3;4;0
WireConnection;38;1;30;1
WireConnection;38;2;35;0
WireConnection;38;3;39;0
WireConnection;53;0;50;0
WireConnection;53;1;51;4
WireConnection;53;2;36;0
WireConnection;56;1;54;1
WireConnection;56;2;53;0
WireConnection;56;3;52;0
WireConnection;35;0;31;0
WireConnection;35;1;34;3
WireConnection;35;2;36;0
WireConnection;57;1;56;0
WireConnection;57;2;58;0
ASEEND*/
//CHKSM=9F8CD03C304323B9FBEFC37B4E73E2107386333A