// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX/FXStart"
{
	Properties
	{
		[Enum(AlphaBlend,10,Additive,1)]_Dst1("Add/Blend", Float) = 10
		[Toggle(_CUSTOM_ON)] _Custom("Custom", Float) = 0
		[Enum(Start_1,0,Start_2,1)]_Start_jiaodu("Start_jiaodu", Float) = 0
		[Enum(World,0,Map,1)]_worldMap1("World/Map", Float) = 0
		[NoScaleOffset]_Main_tex("Main_tex", 2D) = "white" {}
		[HDR]_Main_color("Main_color", Color) = (0,0,0,0)
		_ColorUV("Main_control", Vector) = (1,1,0,0)
		_Color_U("Main_speed_U", Float) = 0
		_Color_V("Main_speed_V", Float) = 0
		_Dissolve_scale("Dissolve_scale", Range( 0 , 1)) = 0
		_Dissolve_edge("Dissolve_edge", Range( 0 , 1)) = 0
		_Dissolve_edge_scale("Dissolve_edge_scale", Range( 0 , 1)) = 1
		[HDR]_Dissolve_Edge_Color("Dissolve_Edge_Color", Color) = (1,1,1,1)
		_ColorScale("ColorScale", Range( 0 , 1)) = 1
		_Main_desatruste("Main_desatruste", Range( 0 , 1)) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Custom"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		ZWrite Off
		Blend SrcAlpha [_Dst1]
		
		CGPROGRAM
		#include "UnityShaderVariables.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _CUSTOM_ON
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd 
		struct Input
		{
			float4 screenPos;
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float2 uv3_texcoord3;
		};

		uniform float _Dst1;
		uniform float4 _Main_color;
		uniform sampler2D _Main_tex;
		uniform float _Color_U;
		uniform float _Color_V;
		uniform float _worldMap1;
		uniform float4 _ColorUV;
		uniform float _Main_desatruste;
		uniform float _ColorScale;
		uniform float4 _Dissolve_Edge_Color;
		uniform float _Dissolve_edge_scale;
		uniform float _Dissolve_scale;
		uniform float _Start_jiaodu;
		uniform float _Dissolve_edge;

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 appendResult115 = (float2(_Color_U , _Color_V));
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float2 appendResult88 = (float2(ase_screenPosNorm.x , ase_screenPosNorm.y));
			float2 lerpResult110 = lerp( appendResult88 , i.uv_texcoord , _worldMap1);
			float2 appendResult96 = (float2(_ColorUV.x , _ColorUV.y));
			float2 appendResult98 = (float2(_ColorUV.z , _ColorUV.w));
			float2 panner112 = ( 1.0 * _Time.y * appendResult115 + (lerpResult110*appendResult96 + appendResult98));
			float3 desaturateInitialColor119 = (tex2D( _Main_tex, panner112 )).rgb;
			float desaturateDot119 = dot( desaturateInitialColor119, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar119 = lerp( desaturateInitialColor119, desaturateDot119.xxx, ( 1.0 - _Main_desatruste ) );
			float U126 = i.uv_texcoord.x;
			float Width123 = (0.0 + (_Dissolve_edge_scale - 0.0) * (50.0 - 0.0) / (1.0 - 0.0));
			float V127 = i.uv_texcoord.y;
			float blendOpSrc2 = U126;
			float blendOpDest2 = V127;
			float temp_output_2_0 = ( saturate( abs( blendOpSrc2 - blendOpDest2 ) ));
			float blendOpSrc3 = U126;
			float blendOpDest3 = ( 1.0 - V127 );
			float temp_output_3_0 = ( saturate( abs( blendOpSrc3 - blendOpDest3 ) ));
			float blendOpSrc5 = temp_output_2_0;
			float blendOpDest5 = temp_output_3_0;
			float lerpBlendMode5 = lerp(blendOpDest5,( blendOpDest5/ max( 1.0 - blendOpSrc5, 0.00001 ) ),0.99);
			float temp_output_5_0 = ( saturate( lerpBlendMode5 ));
			float blendOpSrc6 = temp_output_3_0;
			float blendOpDest6 = temp_output_2_0;
			float temp_output_6_0 = ( saturate( ( blendOpDest6/ max( 1.0 - blendOpSrc6, 0.00001 ) ) ));
			float temp_output_7_0 = ( temp_output_5_0 * temp_output_6_0 );
			#ifdef _CUSTOM_ON
				float staticSwitch168 = ( _Dissolve_scale + i.uv3_texcoord3.x );
			#else
				float staticSwitch168 = _Dissolve_scale;
			#endif
			float Dissovle163 = staticSwitch168;
			float lerpResult205 = lerp( step( temp_output_7_0 , Dissovle163 ) , max( step( temp_output_5_0 , Dissovle163 ) , step( temp_output_6_0 , Dissovle163 ) ) , _Start_jiaodu);
			float Dissolve_edge192 = ( Dissovle163 - _Dissolve_edge );
			float lerpResult206 = lerp( step( temp_output_7_0 , Dissolve_edge192 ) , max( step( temp_output_5_0 , Dissolve_edge192 ) , step( temp_output_6_0 , Dissolve_edge192 ) ) , _Start_jiaodu);
			o.Emission = ( ( saturate( ( _Main_color * float4( desaturateVar119 , 0.0 ) * _ColorScale ) ) * float4( (i.vertexColor).rgb , 0.0 ) ) + ( _Dissolve_Edge_Color * ( step( 0.5 , saturate( ( saturate( ( pow( U126 , Width123 ) + pow( V127 , Width123 ) + pow( ( 1.0 - U126 ) , Width123 ) + pow( ( 1.0 - V127 ) , Width123 ) ) ) + temp_output_7_0 ) ) ) + ( lerpResult205 - lerpResult206 ) ) * i.vertexColor ) ).rgb;
			o.Alpha = ( i.vertexColor.a * saturate( lerpResult205 ) );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.CommentaryNode;188;-537.2596,297.3156;Inherit;False;1857.65;949.9583;Dissolve_edge;7;179;182;184;187;193;195;206;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;173;-2386.248,291.0209;Inherit;False;1113;355.0597;Dissolve;6;168;166;169;163;164;191;;1,1,1,1;0;0
Node;AmplifyShaderEditor.GetLocalVarNode;134;-2240.354,-684.8718;Inherit;False;127;V;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;132;-2216.354,-834.8715;Inherit;False;126;U;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;133;-2073.355,-758.8715;Inherit;False;123;Width;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;80;-2059.362,-676.7389;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;79;-2049.862,-831.2391;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;124;-2068.036,-1057.034;Inherit;False;123;Width;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;128;-2071.449,-1138.605;Inherit;False;126;U;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;135;-2072.355,-596.8718;Inherit;False;123;Width;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;81;-1859.362,-811.8388;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;82;-1867.663,-633.3394;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;73;-1859.78,-1143.423;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;76;-1857.465,-948.9447;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;136;-2119.097,-113.4907;Inherit;False;127;V;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;87;-533.692,-2053.247;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;78;-1279.555,-962.5624;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;23;1548.91,-1633.961;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;138;-2105.118,-379.7167;Inherit;False;127;V;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;137;-2119.118,-240.7168;Inherit;False;126;U;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;139;-2114.118,-456.7167;Inherit;False;126;U;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;4;-1936.885,-112.2059;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-497.1947,-1739.311;Inherit;False;Property;_worldMap1;World/Map;3;1;[Enum];Create;False;0;2;World;0;Map;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;88;-259.1017,-2023.376;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;108;-558.2354,-1868.54;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;96;-241.1982,-1680.052;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;98;-238.3981,-1562.053;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BlendOpsNode;3;-1728.531,-153.7964;Inherit;True;Difference;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;110;-47.63567,-2018.046;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BlendOpsNode;2;-1740.531,-423.7965;Inherit;True;Difference;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;111;173.9506,-1903.438;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;1,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BlendOpsNode;6;-1342.532,-165.7964;Inherit;True;ColorDodge;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;115;355.0287,-1747.22;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BlendOpsNode;5;-1364.532,-421.7965;Inherit;True;ColorDodge;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0.99;False;1;FLOAT;0
Node;AmplifyShaderEditor.PannerNode;112;584.0452,-1792.982;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;116;999.0952,-1599.087;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;118;1084.922,-1820.7;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;145;1763.191,-1651.657;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SaturateNode;99;1914.256,-1813.793;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;33;1978.976,-1334.108;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;34;2086.718,-1655.728;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;31;2288.185,-1654.478;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;69;2802.434,-1738.728;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX/FXStart;False;False;False;False;True;True;True;True;True;True;True;True;False;False;True;False;False;False;False;False;False;Back;2;False;;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;True;_Dst1;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;14;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.GetLocalVarNode;130;-2064.354,-981.8715;Inherit;False;127;V;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;131;-2065.355,-905.8715;Inherit;False;123;Width;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;83;-1033.473,-968.6536;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;168;-1884.248,358.0806;Inherit;False;Property;_Custom;Custom;1;0;Create;True;0;0;0;False;0;False;0;0;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;169;-2104.248,510.0805;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;163;-1497.248,358.0806;Inherit;False;Dissovle;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;160;-615.78,-154.7694;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;161;-621.5496,-42.84868;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;171;-1233.668,82.4072;Inherit;False;163;Dissovle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;192;-1074.95,359.1354;Inherit;False;Dissolve_edge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;146;3560.225,-1487.783;Inherit;False;Property;_Dst1;Add/Blend;0;1;[Enum];Create;False;0;2;AlphaBlend;10;Additive;1;0;True;0;False;10;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;157;31.41142,-503.8481;Inherit;True;2;0;FLOAT;0.17;False;1;FLOAT;0.17;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;174;43.39942,-183.8108;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;175;-229.7658,-656.1268;Inherit;False;163;Dissovle;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;197;-1227.45,367.6432;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;195;-249.9796,584.0214;Inherit;False;192;Dissolve_edge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;187;77.95843,687.9147;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;179;-154.0162,693.9433;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;184;-159.7858,805.8647;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;193;-480.2849,735.9631;Inherit;False;192;Dissolve_edge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;200;1585.225,-994.2271;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;198;1038.802,-657.3106;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;121;-1645.579,-1685.749;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;50;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;125;-2363.252,-1339.126;Inherit;True;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;126;-2108.252,-1332.126;Inherit;False;U;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;127;-2107.252,-1245.126;Inherit;False;V;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;123;-1434.964,-1745.079;Inherit;False;Width;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;203;-482.9869,-990.7227;Inherit;False;2;0;FLOAT;0.5;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-916.0527,-402.1402;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;204;-782.8507,-966.2761;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;156;-644.7679,-968.2381;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;207;215.0735,91.97009;Inherit;False;Property;_Start_jiaodu;Start_jiaodu;2;1;[Enum];Create;True;0;2;Start_1;0;Start_2;1;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;206;550.1583,542.9868;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;205;538.0439,-173.0988;Inherit;True;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;86;774.6375,-1819.795;Inherit;True;Property;_Main_tex;Main_tex;4;1;[NoScaleOffset];Create;True;0;0;0;False;0;False;-1;None;4ec285382865f9241a52d3e8df86b777;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;117;723.2392,-1602.886;Inherit;False;Property;_Main_desatruste;Main_desatruste;15;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;95;-501.1982,-1664.052;Inherit;False;Property;_ColorUV;Main_control;6;0;Create;False;0;0;0;False;0;False;1,1,0,0;1,1,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;113;172.0288,-1750.22;Inherit;False;Property;_Color_U;Main_speed_U;7;0;Create;False;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;114;172.0288,-1667.221;Inherit;False;Property;_Color_V;Main_speed_V;8;0;Create;False;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;191;-1561.95,450.1354;Inherit;False;Property;_Dissolve_edge;Dissolve_edge;10;0;Create;True;0;0;0;False;0;False;0;0.083;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;74;-2271.809,-1812.868;Inherit;False;Property;_Dissolve_edge_scale;Dissolve_edge_scale;11;0;Create;True;0;0;0;False;0;False;1;0.26;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;166;-2388.248,508.0806;Inherit;False;2;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;182;64.92851,546.0035;Inherit;False;2;0;FLOAT;0.17;False;1;FLOAT;0.17;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;164;-2370.455,342.9196;Inherit;False;Property;_Dissolve_scale;Dissolve_scale;9;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;32;1704.965,-1327.263;Inherit;False;Property;_Dissolve_Edge_Color;Dissolve_Edge_Color;12;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;7.552344,7.552344,7.552344,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;119;1307.095,-1814.087;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;101;1385.946,-1712.755;Inherit;False;Property;_ColorScale;ColorScale;13;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;100;1767.256,-1818.793;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;208;1342.258,-1983.343;Inherit;False;Property;_Main_color;Main_color;5;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;2,1.311321,1.311321,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;209;2470.605,-1363.831;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;178;1651.633,-200.5968;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
WireConnection;80;0;134;0
WireConnection;79;0;132;0
WireConnection;81;0;79;0
WireConnection;81;1;133;0
WireConnection;82;0;80;0
WireConnection;82;1;135;0
WireConnection;73;0;128;0
WireConnection;73;1;124;0
WireConnection;76;0;130;0
WireConnection;76;1;131;0
WireConnection;78;0;73;0
WireConnection;78;1;76;0
WireConnection;78;2;81;0
WireConnection;78;3;82;0
WireConnection;4;0;136;0
WireConnection;88;0;87;1
WireConnection;88;1;87;2
WireConnection;96;0;95;1
WireConnection;96;1;95;2
WireConnection;98;0;95;3
WireConnection;98;1;95;4
WireConnection;3;0;137;0
WireConnection;3;1;4;0
WireConnection;110;0;88;0
WireConnection;110;1;108;0
WireConnection;110;2;107;0
WireConnection;2;0;139;0
WireConnection;2;1;138;0
WireConnection;111;0;110;0
WireConnection;111;1;96;0
WireConnection;111;2;98;0
WireConnection;6;0;3;0
WireConnection;6;1;2;0
WireConnection;115;0;113;0
WireConnection;115;1;114;0
WireConnection;5;0;2;0
WireConnection;5;1;3;0
WireConnection;112;0;111;0
WireConnection;112;2;115;0
WireConnection;116;0;117;0
WireConnection;118;0;86;0
WireConnection;145;0;23;0
WireConnection;99;0;100;0
WireConnection;33;0;32;0
WireConnection;33;1;200;0
WireConnection;33;2;23;0
WireConnection;34;0;99;0
WireConnection;34;1;145;0
WireConnection;31;0;34;0
WireConnection;31;1;33;0
WireConnection;69;2;31;0
WireConnection;69;9;209;0
WireConnection;83;0;78;0
WireConnection;168;1;164;0
WireConnection;168;0;169;0
WireConnection;169;0;164;0
WireConnection;169;1;166;1
WireConnection;163;0;168;0
WireConnection;160;0;5;0
WireConnection;160;1;171;0
WireConnection;161;0;6;0
WireConnection;161;1;171;0
WireConnection;192;0;197;0
WireConnection;157;0;7;0
WireConnection;157;1;175;0
WireConnection;174;0;160;0
WireConnection;174;1;161;0
WireConnection;197;0;163;0
WireConnection;197;1;191;0
WireConnection;187;0;179;0
WireConnection;187;1;184;0
WireConnection;179;0;5;0
WireConnection;179;1;193;0
WireConnection;184;0;6;0
WireConnection;184;1;193;0
WireConnection;200;0;203;0
WireConnection;200;1;198;0
WireConnection;198;0;205;0
WireConnection;198;1;206;0
WireConnection;121;0;74;0
WireConnection;126;0;125;1
WireConnection;127;0;125;2
WireConnection;123;0;121;0
WireConnection;203;1;156;0
WireConnection;7;0;5;0
WireConnection;7;1;6;0
WireConnection;204;0;83;0
WireConnection;204;1;7;0
WireConnection;156;0;204;0
WireConnection;206;0;182;0
WireConnection;206;1;187;0
WireConnection;206;2;207;0
WireConnection;205;0;157;0
WireConnection;205;1;174;0
WireConnection;205;2;207;0
WireConnection;86;1;112;0
WireConnection;182;0;7;0
WireConnection;182;1;195;0
WireConnection;119;0;118;0
WireConnection;119;1;116;0
WireConnection;100;0;208;0
WireConnection;100;1;119;0
WireConnection;100;2;101;0
WireConnection;209;0;23;4
WireConnection;209;1;178;0
WireConnection;178;0;205;0
ASEEND*/
//CHKSM=1A23A9977107812280658C0DA0D40B9EC90A8AD6