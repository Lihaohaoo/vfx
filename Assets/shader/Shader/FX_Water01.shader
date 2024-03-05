// Made with Amplify Shader Editor v1.9.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "FX_Water01"
{
	Properties
	{
		[ToggleUI]_Zwrite_modo("Zwrite_modo", Float) = 0
		[Enum(UnityEngine.Rendering.CullMode)]_Cull_modo("Cull_modo", Float) = 0
		[Enum(off,0,on,1)]_Custom("Custom", Float) = 0
		_Desatruate("Desatruate", Range( 0 , 1)) = 0
		_Emission_scale("Emission_scale", Float) = 1
		[HDR]_Main_color("Main_color", Color) = (1,1,1,1)
		_Main_tex("Main_tex", 2D) = "white" {}
		_Main_control("Main_control", Vector) = (1,1,1,1)
		_Main_scale("Main_scale", Float) = 1
		_Main_speed_U("Main_speed_U", Float) = 0
		_Main_speed_V("Main_speed_V", Float) = 0
		_Dissolve_edge_allColor("Dissolve_edge_allColor", Range( 0 , 1)) = 0
		_Tex_01("Tex_01", 2D) = "white" {}
		_Tex01_speed_U("Tex01_speed_U", Float) = 0
		_Tex01_speed_V("Tex01_speed_V", Float) = 0
		_Tex_01_Dissolve("Tex_01_Dissolve", Float) = 0
		_Tex_01_edge("Tex_01_edge", Float) = 0
		_Tex_01_color("Tex_01_color", Color) = (0,0,0,0)
		_Tex01_Blend_scale("Tex01_Blend_scale", Float) = 0
		_Tex_02("Tex_02", 2D) = "white" {}
		_Tex02_speed_U("Tex02_speed_U", Float) = 0
		_Tex02_speed_V("Tex02_speed_V", Float) = 0
		_Tex_02_Dissolve("Tex_02_Dissolve", Float) = 0
		_Tex_02_edge("Tex_02_edge", Float) = 0
		_Tex_02_color("Tex_02_color", Color) = (0,0,0,0)
		_Tex02_Blend_scale("Tex02_Blend_scale", Float) = 0
		_Tex_Dissolve("Tex_Dissolve", 2D) = "white" {}
		_Dissolve("Dissolve", Float) = 0
		_Dissolve_speed_U("Dissolve_speed_U", Float) = 0
		_Dissolve_speed_V("Dissolve_speed_V", Float) = 0
		[HDR]_Dissolve_color("Dissolve_color", Color) = (0,0,0,0)
		_Dissolve_soft("Dissolve_soft", Range( 0 , 1)) = 0
		_Dissolve_soft_edge("Dissolve_soft_edge", Range( 0 , 1)) = 1
		_Dissolve_edge("Dissolve_edge", Range( 0 , 1)) = 0
		[Enum(off,0,on,1)]_Dissolve_fanxiang("Dissolve_fanxiang", Float) = 1
		_Vertex("Vertex", 2D) = "white" {}
		_Vertex_speed_U("Vertex_speed_U", Float) = 0
		_Vertex_speed_V("Vertex_speed_V", Float) = 0
		_Vertex_scale("Vertex_scale", Float) = 0
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
		[HideInInspector] _texcoord3( "", 2D ) = "white" {}
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] _texcoord4( "", 2D ) = "white" {}
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
		#pragma target 3.0
		#pragma surface surf Unlit keepalpha noshadow noambient novertexlights nolightmap  nodynlightmap nodirlightmap nofog nometa noforwardadd vertex:vertexDataFunc 
		#undef TRANSFORM_TEX
		#define TRANSFORM_TEX(tex,name) float4(tex.xy * name##_ST.xy + name##_ST.zw, tex.z, tex.w)
		struct Input
		{
			float2 uv_texcoord;
			float4 vertexColor : COLOR;
			float4 uv3_texcoord3;
			float3 worldNormal;
			float4 uv4_texcoord4;
			float3 viewDir;
		};

		uniform sampler2D _Vertex;
		uniform float _Vertex_speed_U;
		uniform float _Vertex_speed_V;
		uniform float4 _Vertex_ST;
		uniform float _Vertex_scale;
		uniform float _Custom;
		uniform sampler2D _Main_tex;
		uniform float _Main_speed_U;
		uniform float _Main_speed_V;
		uniform float4 _Main_tex_ST;
		uniform float4 _Main_control;
		uniform float _Main_scale;
		uniform float4 _Main_color;
		uniform float _Emission_scale;
		uniform float _Desatruate;
		uniform sampler2D _Tex_Dissolve;
		uniform float _Dissolve_speed_U;
		uniform float _Dissolve_speed_V;
		uniform float4 _Tex_Dissolve_ST;
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
		uniform sampler2D _Tex_01;
		uniform float _Tex01_speed_U;
		uniform float _Tex01_speed_V;
		uniform float4 _Tex_01_ST;
		uniform float _Tex_01_Dissolve;
		uniform float _Tex_01_edge;
		uniform float _Tex01_Blend_scale;
		uniform float4 _Tex_01_color;
		uniform sampler2D _Tex_02;
		uniform float _Tex02_speed_U;
		uniform float _Tex02_speed_V;
		uniform float4 _Tex_02_ST;
		uniform float _Tex_02_Dissolve;
		uniform float _Tex_02_edge;
		uniform float _Tex02_Blend_scale;
		uniform float4 _Tex_02_color;
		uniform float _Fresnel_power;
		uniform sampler2D _Frednel_mask;
		uniform float _Fresnel_Speed_U;
		uniform float _Fresnel_Speed_V;
		uniform float4 _Fresnel_color;
		uniform float _Fresnel_scale;
		uniform float _Dissolve_edge_allColor;

		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float2 appendResult306 = (float2(_Vertex_speed_U , _Vertex_speed_V));
			float2 uv_Vertex = v.texcoord.xy * _Vertex_ST.xy + _Vertex_ST.zw;
			float2 panner313 = ( 1.0 * _Time.y * appendResult306 + uv_Vertex);
			float Custom2_z279 = v.texcoord3.z;
			float Custom_bool287 = _Custom;
			float lerpResult317 = lerp( _Vertex_scale , ( _Vertex_scale + Custom2_z279 ) , Custom_bool287);
			float3 ase_vertexNormal = v.normal.xyz;
			float3 Vertex325 = ( tex2Dlod( _Vertex, float4( panner313, 0, 0.0) ).r * lerpResult317 * ase_vertexNormal );
			v.vertex.xyz += Vertex325;
			v.vertex.w = 1;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float2 appendResult297 = (float2(_Main_speed_U , _Main_speed_V));
			float2 uv_Main_tex = i.uv_texcoord * _Main_tex_ST.xy + _Main_tex_ST.zw;
			float2 panner298 = ( 1.0 * _Time.y * appendResult297 + uv_Main_tex);
			float4 tex2DNode122 = tex2D( _Main_tex, panner298 );
			float4 temp_cast_0 = (_Main_control.x).xxxx;
			float4 lerpResult80 = lerp( ( pow( tex2DNode122 , temp_cast_0 ) * _Main_control.y ) , ( tex2DNode122 * _Main_control.z ) , _Main_control.w);
			float3 temp_output_58_0 = (i.vertexColor).rgb;
			float3 desaturateInitialColor39 = ( ( lerpResult80 * _Main_scale * _Main_color ) * float4( temp_output_58_0 , 0.0 ) * _Emission_scale ).rgb;
			float desaturateDot39 = dot( desaturateInitialColor39, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar39 = lerp( desaturateInitialColor39, desaturateDot39.xxx, _Desatruate );
			float2 appendResult102 = (float2(_Dissolve_speed_U , _Dissolve_speed_V));
			float2 uv_Tex_Dissolve = i.uv_texcoord * _Tex_Dissolve_ST.xy + _Tex_Dissolve_ST.zw;
			float2 panner99 = ( 1.0 * _Time.y * appendResult102 + uv_Tex_Dissolve);
			float4 tex2DNode23 = tex2D( _Tex_Dissolve, panner99 );
			float temp_output_1_0_g1 = tex2DNode23.r;
			float temp_output_107_0 = ( 1.0 - _Dissolve_fanxiang );
			float lerpResult9_g1 = lerp( temp_output_1_0_g1 , ( 1.0 - temp_output_1_0_g1 ) , temp_output_107_0);
			float Custom1_z275 = i.uv3_texcoord3.z;
			float Custom_bool287 = _Custom;
			float lerpResult28 = lerp( _Dissolve , ( _Dissolve + Custom1_z275 ) , Custom_bool287);
			float temp_output_3_0_g1 = _Dissolve_soft;
			float temp_output_85_0 = saturate( ( ( ( ( lerpResult9_g1 + 1.0 ) - ( lerpResult28 * ( 1.0 + ( 1.0 - temp_output_3_0_g1 ) ) ) ) - temp_output_3_0_g1 ) / ( 1.0 - temp_output_3_0_g1 ) ) );
			float temp_output_1_0_g2 = tex2DNode23.r;
			float lerpResult9_g2 = lerp( temp_output_1_0_g2 , ( 1.0 - temp_output_1_0_g2 ) , temp_output_107_0);
			float temp_output_3_0_g2 = _Dissolve_soft_edge;
			float4 Dissiovle_color172 = ( ( temp_output_85_0 - saturate( ( ( ( ( lerpResult9_g2 + 1.0 ) - ( ( lerpResult28 + _Dissolve_edge ) * ( 1.0 + ( 1.0 - temp_output_3_0_g2 ) ) ) ) - temp_output_3_0_g2 ) / ( 1.0 - temp_output_3_0_g2 ) ) ) ) * _Dissolve_color );
			float3 ase_worldNormal = i.worldNormal;
			float3 WorldNormal153 = ase_worldNormal;
			float dotResult156 = dot( WorldNormal153 , float3(0,1,0) );
			float temp_output_157_0 = (0.0 + (dotResult156 - -1.0) * (1.0 - 0.0) / (1.0 - -1.0));
			float lerpResult181 = lerp( ( 1.0 - temp_output_157_0 ) , temp_output_157_0 , _Light_);
			float4 Top_light_164 = ( saturate( pow( lerpResult181 , _Top_linght_power ) ) * _Top_linght_scale * _Top_light_color );
			float2 appendResult241 = (float2(_Tex01_speed_U , _Tex01_speed_V));
			float2 uv_Tex_01 = i.uv_texcoord * _Tex_01_ST.xy + _Tex_01_ST.zw;
			float2 panner242 = ( 1.0 * _Time.y * appendResult241 + uv_Tex_01);
			float temp_output_223_0 = ( 1.0 - tex2D( _Tex_01, panner242 ).r );
			float Custom2_X277 = i.uv4_texcoord4.x;
			float lerpResult283 = lerp( _Tex_01_Dissolve , ( _Tex_01_Dissolve + Custom2_X277 ) , Custom_bool287);
			float temp_output_221_0 = step( temp_output_223_0 , lerpResult283 );
			float temp_output_266_0 = ( ( temp_output_221_0 - step( temp_output_223_0 , ( lerpResult283 - _Tex_01_edge ) ) ) * _Tex01_Blend_scale );
			float temp_output_267_0 = ( temp_output_221_0 - temp_output_266_0 );
			float4 Tex_01257 = ( temp_output_267_0 * ( temp_output_267_0 * _Tex_01_color ) );
			float2 appendResult246 = (float2(_Tex02_speed_U , _Tex02_speed_V));
			float2 uv_Tex_02 = i.uv_texcoord * _Tex_02_ST.xy + _Tex_02_ST.zw;
			float2 panner247 = ( 1.0 * _Time.y * appendResult246 + uv_Tex_02);
			float temp_output_232_0 = ( 1.0 - tex2D( _Tex_02, panner247 ).r );
			float Custom2_y278 = i.uv4_texcoord4.y;
			float lerpResult289 = lerp( _Tex_02_Dissolve , ( _Tex_02_Dissolve + Custom2_y278 ) , Custom_bool287);
			float temp_output_235_0 = step( temp_output_232_0 , lerpResult289 );
			float temp_output_263_0 = ( ( temp_output_235_0 - step( temp_output_232_0 , ( lerpResult289 - _Tex_02_edge ) ) ) * _Tex02_Blend_scale );
			float temp_output_262_0 = ( temp_output_235_0 - temp_output_263_0 );
			float4 Tex_02258 = ( temp_output_262_0 * ( temp_output_262_0 * _Tex_02_color ) );
			float dotResult189 = dot( i.viewDir , WorldNormal153 );
			float2 appendResult191 = (float2(_Fresnel_Speed_U , _Fresnel_Speed_V));
			float2 panner194 = ( 1.0 * _Time.y * appendResult191 + i.uv_texcoord);
			float4 Fresnel_color205 = ( ( saturate( pow( ( 1.0 - dotResult189 ) , _Fresnel_power ) ) * tex2D( _Frednel_mask, panner194 ).r * _Fresnel_color ) * _Fresnel_scale );
			float Dissolve_edge332 = saturate( max( temp_output_266_0 , temp_output_263_0 ) );
			float4 temp_cast_4 = (( Dissolve_edge332 * _Dissolve_edge_allColor )).xxxx;
			o.Emission = ( ( saturate( ( float4( ( desaturateVar39 * temp_output_58_0 ) , 0.0 ) + ( i.vertexColor * Dissiovle_color172 ) + Top_light_164 + Tex_01257 + Tex_02258 ) ) + Fresnel_color205 ) - temp_cast_4 ).rgb;
			o.Alpha = ( i.vertexColor.a * temp_output_85_0 );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=19100
Node;AmplifyShaderEditor.CommentaryNode;281;-991.5479,-3373.834;Inherit;False;995.7213;399.6396;Custom;10;271;272;273;274;275;276;277;278;279;280;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;256;-1044.133,-1377.023;Inherit;False;2337.369;587.4333;Tex02;22;232;235;238;231;244;245;246;247;237;233;234;252;251;248;262;263;264;289;290;291;292;293;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;255;-1032.005,-2165.894;Inherit;False;2325.541;730.1044;Tex01;22;220;223;230;241;242;239;240;243;222;228;221;225;226;253;254;265;266;283;285;286;288;267;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;200;-315.5762,3406.075;Inherit;False;1908.192;1400.649;Fresnel;16;185;186;187;188;189;190;191;192;193;194;195;196;197;198;199;204;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;179;-1732.216,1347.931;Inherit;False;2230.806;583.5865;双溶解以及溶解减法边缘;12;212;99;102;101;100;23;103;107;88;86;87;85;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;176;-108.0395,-743.304;Inherit;False;1102.963;400.6315;主帖图对比度;7;80;79;78;81;82;122;130;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;171;661.0285,1526.659;Inherit;False;559.6995;485.443;溶解颜色;3;94;92;95;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;170;-1391.956,2409.187;Inherit;False;916.0399;448.6289;自定义溶解;7;28;25;90;89;282;294;338;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;43;699.532,-403.1494;Inherit;False;283;262;olor;1;42;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;60;1738.746,674.5756;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;151;-285.9631,2371.234;Inherit;False;520.0781;311.037;World_normal;2;153;152;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;155;-293.0892,2693.344;Inherit;False;1872.212;703.7258;Top_light;14;182;158;157;156;169;154;164;160;163;162;161;159;181;165;;1,1,1,1;0;0
Node;AmplifyShaderEditor.LerpOp;28;-915.956,2499.187;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;89;-1245.439,2741.816;Inherit;False;Property;_Dissolve_edge;Dissolve_edge;34;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;90;-629.47,2719.985;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;94;985.728,1588.302;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;92;711.0285,1576.659;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;172;1253.518,1587.068;Inherit;False;Dissiovle_color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;85;213.5902,1442.789;Inherit;True;Dissolve;-1;;1;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;87;204.2672,1691.449;Inherit;True;Dissolve;-1;;2;cf9a8bad52fbab443a0a200abdef43f6;0;4;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;86;-173.3002,1488.352;Inherit;False;Property;_Dissolve_soft;Dissolve_soft;32;0;Create;True;0;0;0;False;0;False;0;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;88;-131.3615,1744.076;Inherit;False;Property;_Dissolve_soft_edge;Dissolve_soft_edge;33;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;107;-290.2894,1650.297;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;103;-528.3786,1646.246;Inherit;False;Property;_Dissolve_fanxiang;Dissolve_fanxiang;35;1;[Enum];Create;True;0;2;off;0;on;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldNormalVector;152;-235.9631,2428.271;Inherit;False;False;1;0;FLOAT3;0,0,1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;154;-256.2212,2946.655;Inherit;False;Constant;_Vector0;Vector 0;19;0;Create;True;0;0;0;False;0;False;0,1,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;169;-276.4902,2746.929;Inherit;False;153;WorldNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;190;-220.5448,3981.649;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;191;58.13395,4149.708;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;194;284.4492,4040.985;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;187;-194.3249,4238.84;Inherit;False;Property;_Fresnel_Speed_U;Fresnel_Speed_U;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;188;-189.5245,4311.781;Inherit;False;Property;_Fresnel_Speed_V;Fresnel_Speed_V;48;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;197;567.9033,4010.112;Inherit;True;Property;_Frednel_mask;Frednel_mask;44;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;196;629.2284,4199.683;Inherit;False;Property;_Fresnel_color;Fresnel_color;47;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;97;1933.939,344.5186;Inherit;False;5;5;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;39;1540.497,242.7435;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;59;1369.739,240.9961;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;215;1769.943,253.5975;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ComponentMaskNode;58;1065.733,367.6637;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;61;1072.224,451.1765;Inherit;False;Property;_Emission_scale;Emission_scale;5;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;96;1119.058,605.907;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;173;879.7642,626.3385;Inherit;False;172;Dissiovle_color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;184;1982.375,-253.7253;Inherit;False;Property;_Cull_modo;Cull_modo;2;1;[Enum];Fetch;True;0;1;Option1;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;217;1981.411,-172.5878;Inherit;False;Property;_Zwrite_modo;Zwrite_modo;1;1;[ToggleUI];Fetch;True;0;3;Option1;0;Option2;1;Option3;2;1;UnityEngine.Rendering.CompareFunction;True;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;95;714.6528,1800.102;Inherit;False;Property;_Dissolve_color;Dissolve_color;31;1;[HDR];Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;153;10.11487,2421.234;Inherit;False;WorldNormal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;156;8.976807,2752.121;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;157;280.4132,2752.474;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0;False;4;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;164;1400.325,2748.925;Inherit;True;Top_light_;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;163;1185.022,2752.586;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;162;1045.862,2751.867;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;159;821.671,2744.256;Inherit;True;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;181;627.924,2753.551;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;158;609.5001,2942.06;Inherit;False;Property;_Top_linght_power;Top_linght_power;42;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;165;481.8893,2737.038;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;182;342.9239,3055.551;Inherit;False;Property;_Light_;Light_;40;1;[Enum];Create;True;0;2;Down;0;Up;1;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;161;892.588,3005.255;Inherit;False;Property;_Top_linght_scale;Top_linght_scale;41;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ViewDirInputsCoordNode;185;122.4984,3456.075;Inherit;False;World;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;186;154.8195,3654.295;Inherit;False;153;WorldNormal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DotProductOpNode;189;368.4981,3547.075;Inherit;True;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;193;618.5192,3761.188;Inherit;True;Property;_Fresnel_power;Fresnel_power;46;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;195;810.4841,3547.344;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;198;1061.498,3545.075;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;199;1328.016,3544.524;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;192;626.4982,3548.075;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;203;1616.683,3546.825;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;204;1389.683,3785.825;Inherit;False;Property;_Fresnel_scale;Fresnel_scale;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;1798.354,3550.054;Inherit;False;Fresnel_color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;160;878.7218,3092.331;Inherit;False;Property;_Top_light_color;Top_light_color;43;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;42;749.532,-353.1494;Inherit;False;Property;_Main_color;Main_color;6;1;[HDR];Create;True;0;0;0;False;0;False;1,1,1,1;0.9883373,0.9883373,0.9883373,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;80;812.9241,-622.2361;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;79;630.8771,-693.304;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;78;459.8241,-691.068;Inherit;False;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;81;591.405,-555.077;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.Vector4Node;82;243.1085,-554.6725;Inherit;False;Property;_Main_control;Main_control;8;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;129;1036.878,-509.1986;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;130;841.52,-486.5626;Inherit;False;Property;_Main_scale;Main_scale;9;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;232;182.1935,-1273.177;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;235;530.1934,-1291.177;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;238;264.1935,-1125.177;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;231;-192.8554,-1311.091;Inherit;True;Property;_Tex_02;Tex_02;20;0;Create;True;0;0;0;False;0;False;-1;3454dca00bdaebf429549917eab7f109;ad18c0a40da84554c8ef66c4818f1ce3;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StepOpNode;233;534.5572,-1196.91;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;40;1356.991,97.67767;Inherit;False;Property;_Desatruate;Desatruate;4;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;259;1577.245,554.0773;Inherit;False;257;Tex_01;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;260;1572.245,634.0773;Inherit;False;258;Tex_02;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;234;691.4193,-1242.363;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;258;1565.54,-1338.447;Inherit;False;Tex_02;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;264;679.6875,-1139.543;Inherit;False;Property;_Tex02_Blend_scale;Tex02_Blend_scale;26;0;Create;True;0;0;0;False;0;False;0;0.63;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;263;892.6184,-1181.395;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;251;1129.983,-1239.916;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;23;-936.7025,1462.859;Inherit;True;Property;_Tex_Dissolve;Tex_Dissolve;27;0;Create;True;0;0;0;False;0;False;-1;None;3454dca00bdaebf429549917eab7f109;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;100;-1633.907,1585.338;Inherit;False;Property;_Dissolve_speed_U;Dissolve_speed_U;29;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;101;-1631.907,1655.338;Inherit;False;Property;_Dissolve_speed_V;Dissolve_speed_V;30;0;Create;True;0;0;0;False;0;False;0;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;102;-1383.907,1622.338;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;99;-1178.906,1492.338;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;212;-1452.653,1372.743;Inherit;False;0;23;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WireNode;270;862.7992,688.679;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;57;554.718,368.1325;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;282;-1293.752,2528.736;Inherit;False;275;Custom1_z;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;289;-58.54071,-1029.47;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;291;-189.1845,-994.4579;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;293;-399.3999,-861.7738;Inherit;False;287;Custom_bool;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;292;-400.1845,-944.4578;Inherit;False;278;Custom2_y;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;290;-400.302,-1022.62;Inherit;False;Property;_Tex_02_Dissolve;Tex_02_Dissolve;23;0;Create;True;0;0;0;False;0;False;0;0.61;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;244;-994.1332,-1199.928;Inherit;False;Property;_Tex02_speed_U;Tex02_speed_U;21;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;245;-992.1332,-1129.928;Inherit;False;Property;_Tex02_speed_V;Tex02_speed_V;22;0;Create;True;0;0;0;False;0;False;0;-0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;246;-744.134,-1162.928;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;247;-539.1332,-1292.928;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;248;-888.8799,-1327.023;Inherit;False;0;231;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;297;-525.7227,-481.5697;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;298;-320.7219,-611.5697;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;122;-58.03946,-629.1537;Inherit;True;Property;_Main_tex;Main_tex;7;0;Create;True;0;0;0;False;0;False;-1;None;4ec285382865f9241a52d3e8df86b777;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;295;-775.7219,-518.5697;Inherit;False;Property;_Main_speed_U;Main_speed_U;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;296;-773.7219,-448.5697;Inherit;False;Property;_Main_speed_V;Main_speed_V;11;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;237;75.19345,-1092.177;Inherit;False;Property;_Tex_02_edge;Tex_02_edge;24;0;Create;True;0;0;0;False;0;False;0;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;299;-670.4686,-645.6647;Inherit;False;0;122;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;252;766.1711,-1052.652;Inherit;False;Property;_Tex_02_color;Tex_02_color;25;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;301;1416.272,-1322.564;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;183;1579.847,397.198;Inherit;False;164;Top_light_;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;206;1963.093,589.2492;Inherit;False;205;Fresnel_color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;302;2101.624,320.201;Inherit;False;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;303;2294.624,424.201;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;223;183.9719,-1944.218;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;241;-732.0055,-1866.298;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;239;-982.0045,-1903.298;Inherit;False;Property;_Tex01_speed_U;Tex01_speed_U;14;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;221;531.972,-1949.944;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;225;530.1993,-1861.814;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;220;-191.077,-1982.133;Inherit;True;Property;_Tex_01;Tex_01;13;0;Create;True;0;0;0;False;0;False;-1;3454dca00bdaebf429549917eab7f109;3454dca00bdaebf429549917eab7f109;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;243;-800.7513,-2115.894;Inherit;False;0;220;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PannerNode;242;-527.0045,-1996.298;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ColorNode;253;696.387,-1671.381;Inherit;False;Property;_Tex_01_color;Tex_01_color;18;0;Create;True;0;0;0;False;0;False;0,0,0,0;0.3962264,0.3962264,0.3962264,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;226;711.308,-1897.623;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;230;329.9718,-1794.218;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;283;-34.80251,-1798.668;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;286;-165.4463,-1763.656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;285;-376.4463,-1713.656;Inherit;False;277;Custom2_X;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;288;-352.6617,-1627.972;Inherit;False;287;Custom_bool;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;222;-357.0281,-1800.218;Inherit;False;Property;_Tex_01_Dissolve;Tex_01_Dissolve;16;0;Create;True;0;0;0;False;0;False;0;0.55;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;228;140.9719,-1761.218;Inherit;False;Property;_Tex_01_edge;Tex_01_edge;17;0;Create;True;0;0;0;False;0;False;0;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;265;667.582,-1783.398;Inherit;False;Property;_Tex01_Blend_scale;Tex01_Blend_scale;19;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;300;1415.301,-1953.893;Inherit;True;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;257;1621.148,-1963.928;Inherit;True;Tex_01;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;254;1265.6,-1700.51;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;266;855.55,-1907.418;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;267;1080.193,-1949.655;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;304;-1006.705,-2928.445;Inherit;False;2325.541;730.1044;Tex01;14;321;320;319;318;317;313;312;311;308;307;306;324;325;330;;1,1,1,1;0;0
Node;AmplifyShaderEditor.DynamicAppendNode;306;-706.7057,-2628.849;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;313;-501.7048,-2758.849;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;318;-140.1465,-2526.207;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;271;-941.548,-3323.834;Inherit;False;2;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;272;-448.0767,-3320.194;Inherit;False;3;-1;4;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;273;-706.0767,-3320.194;Inherit;False;Custom1_X;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;274;-703.0767,-3257.194;Inherit;False;Custom1_y;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;275;-707.0767,-3197.194;Inherit;False;Custom1_z;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;276;-705.0767,-3130.194;Inherit;False;Custom1_w;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;277;-222.8267,-3280.194;Inherit;False;Custom2_X;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;278;-219.8267,-3217.194;Inherit;False;Custom2_y;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;279;-223.8267,-3157.194;Inherit;False;Custom2_z;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;280;-221.8267,-3090.194;Inherit;False;Custom2_w;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;284;64.79688,-3282.772;Inherit;False;Property;_Custom;Custom;3;1;[Enum];Create;True;0;2;off;0;on;1;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;287;225.9656,-3289.023;Inherit;False;Custom_bool;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;311;-165.7772,-2744.684;Inherit;True;Property;_Vertex;Vertex;36;0;Create;True;0;0;0;False;0;False;-1;3454dca00bdaebf429549917eab7f109;3454dca00bdaebf429549917eab7f109;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;319;-351.1465,-2476.207;Inherit;False;279;Custom2_z;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;320;-370.3619,-2397.523;Inherit;False;287;Custom_bool;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;324;427.9006,-2747.644;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;325;633.7475,-2757.679;Inherit;True;Vertex;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;317;17.49725,-2562.219;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;312;-775.4515,-2878.445;Inherit;False;0;311;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;307;-956.7047,-2665.849;Inherit;False;Property;_Vertex_speed_U;Vertex_speed_U;37;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;308;-954.7047,-2595.849;Inherit;False;Property;_Vertex_speed_V;Vertex_speed_V;38;0;Create;True;0;0;0;False;0;False;0;-0.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;329;2240.736,759.5669;Inherit;False;325;Vertex;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.NormalVertexDataNode;330;88.0212,-2427.829;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;240;-980.0045,-1833.298;Inherit;False;Property;_Tex01_speed_V;Tex01_speed_V;15;0;Create;True;0;0;0;False;0;False;0;-0.511;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-331.7283,-2562.769;Inherit;False;Property;_Vertex_scale;Vertex_scale;39;0;Create;True;0;0;0;False;0;False;0;0.34;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;262;1050.589,-1336.473;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;331;1431.013,-1606.676;Inherit;True;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;333;1652.044,-1582.271;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;332;1797.806,-1585.525;Inherit;False;Dissolve_edge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;335;2228.069,515.6803;Inherit;False;332;Dissolve_edge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;2846.642,385.0243;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;FX_Water01;False;False;False;False;True;True;True;True;True;True;True;True;False;False;False;False;False;False;False;False;False;Back;2;True;_Zwrite_modo;0;False;;False;0;False;;0;False;;False;0;Custom;0.5;True;False;0;True;Custom;;Transparent;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;2;5;False;;10;False;;0;0;False;;0;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;0;-1;-1;-1;0;False;0;0;True;_Cull_modo;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;336;2416.368,518.5039;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;334;2615.069,419.6803;Inherit;False;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;337;2165.368,645.5039;Inherit;False;Property;_Dissolve_edge_allColor;Dissolve_edge_allColor;12;0;Create;True;0;0;0;False;0;False;0;0.082;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;294;-1301.531,2604.573;Inherit;False;287;Custom_bool;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-1244.956,2455.187;Inherit;False;Property;_Dissolve;Dissolve;28;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;338;-1089.108,2529.069;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
WireConnection;60;0;270;0
WireConnection;60;1;85;0
WireConnection;28;0;25;0
WireConnection;28;1;338;0
WireConnection;28;2;294;0
WireConnection;90;0;28;0
WireConnection;90;1;89;0
WireConnection;94;0;92;0
WireConnection;94;1;95;0
WireConnection;92;0;85;0
WireConnection;92;1;87;0
WireConnection;172;0;94;0
WireConnection;85;1;23;1
WireConnection;85;2;28;0
WireConnection;85;3;86;0
WireConnection;85;4;107;0
WireConnection;87;1;23;1
WireConnection;87;2;90;0
WireConnection;87;3;88;0
WireConnection;87;4;107;0
WireConnection;107;0;103;0
WireConnection;191;0;187;0
WireConnection;191;1;188;0
WireConnection;194;0;190;0
WireConnection;194;2;191;0
WireConnection;197;1;194;0
WireConnection;97;0;215;0
WireConnection;97;1;96;0
WireConnection;97;2;183;0
WireConnection;97;3;259;0
WireConnection;97;4;260;0
WireConnection;39;0;59;0
WireConnection;39;1;40;0
WireConnection;59;0;129;0
WireConnection;59;1;58;0
WireConnection;59;2;61;0
WireConnection;215;0;39;0
WireConnection;215;1;58;0
WireConnection;58;0;57;0
WireConnection;96;0;57;0
WireConnection;96;1;173;0
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
WireConnection;199;0;198;0
WireConnection;199;1;197;1
WireConnection;199;2;196;0
WireConnection;192;0;189;0
WireConnection;203;0;199;0
WireConnection;203;1;204;0
WireConnection;205;0;203;0
WireConnection;80;0;79;0
WireConnection;80;1;81;0
WireConnection;80;2;82;4
WireConnection;79;0;78;0
WireConnection;79;1;82;2
WireConnection;78;0;122;0
WireConnection;78;1;82;1
WireConnection;81;0;122;0
WireConnection;81;1;82;3
WireConnection;129;0;80;0
WireConnection;129;1;130;0
WireConnection;129;2;42;0
WireConnection;232;0;231;1
WireConnection;235;0;232;0
WireConnection;235;1;289;0
WireConnection;238;0;289;0
WireConnection;238;1;237;0
WireConnection;231;1;247;0
WireConnection;233;0;232;0
WireConnection;233;1;238;0
WireConnection;234;0;235;0
WireConnection;234;1;233;0
WireConnection;258;0;301;0
WireConnection;263;0;234;0
WireConnection;263;1;264;0
WireConnection;251;0;262;0
WireConnection;251;1;252;0
WireConnection;23;1;99;0
WireConnection;102;0;100;0
WireConnection;102;1;101;0
WireConnection;99;0;212;0
WireConnection;99;2;102;0
WireConnection;270;0;57;4
WireConnection;289;0;290;0
WireConnection;289;1;291;0
WireConnection;289;2;293;0
WireConnection;291;0;290;0
WireConnection;291;1;292;0
WireConnection;246;0;244;0
WireConnection;246;1;245;0
WireConnection;247;0;248;0
WireConnection;247;2;246;0
WireConnection;297;0;295;0
WireConnection;297;1;296;0
WireConnection;298;0;299;0
WireConnection;298;2;297;0
WireConnection;122;1;298;0
WireConnection;301;0;262;0
WireConnection;301;1;251;0
WireConnection;302;0;97;0
WireConnection;303;0;302;0
WireConnection;303;1;206;0
WireConnection;223;0;220;1
WireConnection;241;0;239;0
WireConnection;241;1;240;0
WireConnection;221;0;223;0
WireConnection;221;1;283;0
WireConnection;225;0;223;0
WireConnection;225;1;230;0
WireConnection;220;1;242;0
WireConnection;242;0;243;0
WireConnection;242;2;241;0
WireConnection;226;0;221;0
WireConnection;226;1;225;0
WireConnection;230;0;283;0
WireConnection;230;1;228;0
WireConnection;283;0;222;0
WireConnection;283;1;286;0
WireConnection;283;2;288;0
WireConnection;286;0;222;0
WireConnection;286;1;285;0
WireConnection;300;0;267;0
WireConnection;300;1;254;0
WireConnection;257;0;300;0
WireConnection;254;0;267;0
WireConnection;254;1;253;0
WireConnection;266;0;226;0
WireConnection;266;1;265;0
WireConnection;267;0;221;0
WireConnection;267;1;266;0
WireConnection;306;0;307;0
WireConnection;306;1;308;0
WireConnection;313;0;312;0
WireConnection;313;2;306;0
WireConnection;318;0;321;0
WireConnection;318;1;319;0
WireConnection;273;0;271;1
WireConnection;274;0;271;2
WireConnection;275;0;271;3
WireConnection;276;0;271;4
WireConnection;277;0;272;1
WireConnection;278;0;272;2
WireConnection;279;0;272;3
WireConnection;280;0;272;4
WireConnection;287;0;284;0
WireConnection;311;1;313;0
WireConnection;324;0;311;1
WireConnection;324;1;317;0
WireConnection;324;2;330;0
WireConnection;325;0;324;0
WireConnection;317;0;321;0
WireConnection;317;1;318;0
WireConnection;317;2;320;0
WireConnection;262;0;235;0
WireConnection;262;1;263;0
WireConnection;331;0;266;0
WireConnection;331;1;263;0
WireConnection;333;0;331;0
WireConnection;332;0;333;0
WireConnection;0;2;334;0
WireConnection;0;9;60;0
WireConnection;0;11;329;0
WireConnection;336;0;335;0
WireConnection;336;1;337;0
WireConnection;334;0;303;0
WireConnection;334;1;336;0
WireConnection;338;0;25;0
WireConnection;338;1;282;0
ASEEND*/
//CHKSM=78BDB37DD6A00AA83DB7910A4F9FBF7B3C3A6237