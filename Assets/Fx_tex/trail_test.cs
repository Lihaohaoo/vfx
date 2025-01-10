using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteAlways]
public class trail_test : MonoBehaviour
{
    Vector3 poslow;
    Vector3 posnew;
    Material mat;
    float dis;
    public float offset;
    public Vector3 lowpos;
    public float offsetSize;
    private Vector4 Main_t;
    // Start is called before the first frame update
    void Start()
    {
        lowpos = transform.position;
        mat = gameObject.GetComponent<Renderer>().material;
        //Main_t = mat.GetVector("_Main_Tex");
    }

    // Update is called once per frame
    void Update()
    {
        poslow = lowpos;
        OnLowPosSave();
        //offset = 0 - Main_t.x;
        posnew = transform.position;
        dis = Vector3.Distance(poslow,posnew);
        offsetSize += dis;
        mat.SetFloat("_offset_U", offsetSize * offset);
        

    }
    void OnLowPosSave()
    {
        lowpos = transform.position;
    }
}
