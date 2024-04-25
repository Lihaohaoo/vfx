using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteAlways]
public class trail_main : MonoBehaviour
{
    private Material mat;
    private Material mat_m;
    private Vector4 Main_t;
    private float zValue;
    private float offset;
    private float offsetSize;
    private Vector3 poslow;
    private Vector3 posnew;
    private Vector3 lowpos;
    private bool isemiiting;
    public float dissolve_start = 0;
    public float dissolve_end = 1;
    public float dissolve_time ;
    float tim;
    float Diss;
    
    private  new TrailRenderer renderer;
    private void Start()
    {
        renderer = GetComponent<TrailRenderer>();
        dissolve_time = 1 /  renderer.time;
        mat_m = GetComponent<TrailRenderer>().material;
        isemiiting = renderer.emitting;
        mat = mat_m;
        lowpos = transform.position;
        Main_t = mat.GetVector("_Main_Tex");
        
    }

    private void LateUpdate()
    {
        isemiiting = renderer.emitting;
        Mat_offset();
        
    }

    void Mat_offset()
    {
        poslow = lowpos;
        OnLowPosSave();
        offset = 0 - Main_t.x;
        posnew = transform.position;
        float distance = Vector3.Distance(poslow, posnew);
        offsetSize += distance;
        zValue = offsetSize * offset;
        Main_t.z = zValue; // 修改 z 分量
        if(isemiiting == true)
        {
            mat.SetVector("_Main_Tex", Main_t); // 更新材质属性

            if (offsetSize >= 1 / Main_t.x * 2)
            {
                offsetSize = offsetSize - 1 / Main_t.x * 2;
            }
        }

        if (isemiiting == false)
        {
            if (dissolve_time > 0f)
            {
                tim += Time.deltaTime * dissolve_time;
                Diss = Mathf.Lerp(dissolve_start, dissolve_end, tim);
                mat.SetFloat("_Dissolve", Diss); // 更新材质属性
                                                 //Debug.Log("disssss" + tim);
                if (tim >= 1)
                {
                    dissolve_time = 0f; // 重置 dissolve_time 值
                }
            }
        }

    }
    void OnLowPosSave()
    {
        lowpos = transform.position;
    }
}
