Shader"Hole"
{
    Properties
    {
        _MainTex("Diffuse", 2d) = "white"{}
    }
    SubShader
    {
        Tags{ "Queue" = "Geometry-1"}

        ColorMask 0
        ZWrite Off

        Stencil{
            Ref 1
            Comp Always
            Pass replace
        }

        CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input
        {
            float2 uv_MainTex;
        };
    
        sampler2D _MainTex;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_MainTex,IN.uv_MainTex).rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
