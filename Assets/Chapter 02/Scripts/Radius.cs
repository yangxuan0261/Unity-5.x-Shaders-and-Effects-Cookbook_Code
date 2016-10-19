using UnityEngine;

[ExecuteInEditMode]
public class Radius : MonoBehaviour {

    public Material radiusMaterial;
    public float radius = 1;
    public Color color = Color.white;

    // Use this for initialization
    void Start () {
	
	}
	
    //每帧更新shader中的参数值
	// Update is called once per frame
	void Update () {
        radiusMaterial.SetVector("_Center", transform.position);
        radiusMaterial.SetFloat("_Radius", radius);
        radiusMaterial.SetColor("_RadiusColor", color);
    }
}
