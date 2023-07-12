Shader"Blend"
{
    Properties
    {
        _MainTex("Texture",2d) = "black"{}
    }
    SubShader
    {
        Tags{
            "Queue" = "Transparent"
        }
        Blend SrcAlpha OneMinusSrcAlpha

        Pass{
            SetTexture[_MainTex]{combine texture}
        }

        
    }
}
