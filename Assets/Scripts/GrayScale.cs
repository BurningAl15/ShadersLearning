using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GrayScale : MonoBehaviour {
    [Range(0f,1f)]
    public float t;
    public Material m;
    //Solo funciona cuando esta pegado a la camara
    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        //blit hace un copy paste del buffer
        Graphics.Blit(source, destination, m);
        
    }
    //Lerp -> mathf.Lerp(valInicial,valFinal,valordeCambio)
    private void Update()
    {
        m.SetFloat("_Porcentaje", t);
    }
}
