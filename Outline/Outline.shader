Shader "Outline"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Outline("Outline Width", Range(.01,.1)) = .05
    }
    SubShader
    {
        Tags { "Queue"="Transparent" }

        ZWrite off
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert

        sampler2D _MainTex;
        float _Outline;

        struct Input
        {
            float2 uv_MainTex;
        };

        struct appdata{
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 texcoord: TEXCOORD0;
        };

        void vert(inout appdata v){ 
            v.vertex.xyz += v.normal * _Outline;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Emission = fixed4(1,0,0,1);
        }

        ENDCG

        ZWrite on
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D (_MainTex, IN.uv_MainTex);
        }

        ENDCG
    }
    FallBack "Diffuse"
}
