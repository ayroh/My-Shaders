Shader"Hologram"
{
    Properties
    {
        _RimColor ("Rim Color", color) = (0.5,0.0,0.5,1.0)
        _RimConstant ("Rim Constant", Range(1, 5)) = 3
    }
    SubShader
    {
        Tags{
            "Queue" = "Transparent"
        }

        Pass{
            ZWrite On
            ColorMask 0
        }


        CGPROGRAM
        #pragma surface surf Lambert alpha:fade
        
        struct Input
        {
            float3 viewDir;
        };

        float4 _RimColor;
        float _RimConstant;

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = (1 - saturate(dot(normalize(IN.viewDir), o.Normal)));
            o.Emission = _RimColor.rgb * pow(rim, _RimConstant) * 10 ;

            o.Alpha = pow(rim, _RimConstant);
        }
        ENDCG

        
        
    }
    FallBack "Diffuse"
}
