using System;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

[ExecuteAlways]
public class HoleScript : MonoBehaviour
{

    float topDist, botDist;
    Vector3 dir;
    public float speed = 10f;

    private void OnEnable() {
        topDist = 1.75f;
        botDist = -0.55f;
        dir = new Vector3(0f, speed, 0f);
        EditorApplication.update += Move;
    }

    private void OnDisable() {
        EditorApplication.update -= Move;
    }


    private void Move() {
        transform.position += dir * Time.deltaTime;
        if (transform.position.y > topDist || transform.position.y < botDist)
            dir = -dir;
    }
}
