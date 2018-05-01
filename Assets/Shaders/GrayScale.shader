Shader "ShadersLearning/Shaders/GrayScale"
{
	Properties
	{
		_MainTex ("Texture", 2D) = "white" {}
		//nombre de variable("nombre que se puede ver desde afuera", tipo de dato) = numero desde donde se va a inicializar
		_Porcentaje("Porcentaje",float) = 1
	}
		SubShader
		{
			// No culling or depth
			Cull Off ZWrite Off ZTest Always

			Pass
			{
				CGPROGRAM
				float _Porcentaje;
				//Vertex shader -> toca los vertices, sirve para hacer transformaciones (rotacion, translacion y escalamiento) desde la camara
				#pragma vertex vert
				//Frag shader -> Pinta los triangulos y les da (sombras, texturas, luces, efectos)
				#pragma fragment frag
			
				#include "UnityCG.cginc"

				struct appdata
				{
					float4 vertex : POSITION;
					float2 uv : TEXCOORD0;
				};

				struct v2f
				{
					float2 uv : TEXCOORD0;
					float4 vertex : SV_POSITION;
				};

				v2f vert (appdata v)
				{
					v2f o;
					o.vertex = UnityObjectToClipPos(v.vertex);
					o.uv = v.uv;
					return o;
				}
			
				sampler2D _MainTex;

				fixed4 frag (v2f i) : SV_Target
				{
					fixed4 col = tex2D(_MainTex, i.uv);
					// just invert the colors
					float g = 0.3*col.r + 0.4*col.g + 0.3*col.b;
					float4 gris = float4(g, g, g, 1.0);
					col = lerp(col, gris, _Porcentaje);
					//col = 1 - col;
					return col;
				}
				ENDCG
			}
	}
}
