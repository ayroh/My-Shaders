Shader"BlinnPhongShading"
{
    Properties
    {
        _SpecColor ("Spec Color", color) = (0.5,0.0,0.5,1.0)
        _Spec ("Rim Constant", Range(0, 1)) = 0.5
        _Phong ("Phong Constant", Range(0,3)) = 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf BlinnPhong
        
        struct Input
        {
            float3 viewDir;
        };

        float _Spec;
        float _Phong;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _SpecColor;
            o.Gloss = _Phong;
            o.Specular = _Spec;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
