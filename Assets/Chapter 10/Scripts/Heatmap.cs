using UnityEngine;
using System.Collections;

public class Heatmap : MonoBehaviour
{

    public Vector3[] positions;
    public float[] radiuses;
    public float[] intensities;

    public Material material;

    void Start()
    {
        material.SetInt("_Points_Length", positions.Length);
        for (int i = 0; i < positions.Length; i++)
        {
            material.SetVector("_Points" + i.ToString(), positions[i]);

            Vector2 properties = new Vector2(radiuses[i], intensities[i]);
            material.SetVector("_Properties" + i.ToString(), properties);
        }
    }
}