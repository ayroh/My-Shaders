Shader "Unlit/VertFrag"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 color : COLOR;
                float4 vertex : SV_POSITION;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                //o.color.y = (v.vertex.y)/20;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col;
                col.r = i.vertex.x/1000;
                col.g = i.vertex.y/1000;
                return col;
            }
            ENDCG
        }
    }
}
