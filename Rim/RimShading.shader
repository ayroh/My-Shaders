Shader"RimShading"
{
    Properties
    {
        _RimColor ("Rim Color", color) = (0.5,0.0,0.5,1.0)
        _RimConstant ("Rim Constant", Range(1, 5)) = 3
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert
        
        struct Input
        {
            float3 viewDir;
        };

        float4 _RimColor;
        float _RimConstant;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Emission = _RimColor.rgb * pow((1 - saturate(dot(normalize(IN.viewDir), o.Normal))), _RimConstant);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
