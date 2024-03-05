using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[ExecuteAlways]
public class FX_guadian : MonoBehaviour
{
    
    public Transform guadian;
    // Start is called before the first frame update
    void Start()
    {
        
        
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 worldPosition = guadian.TransformPoint(Vector3.zero);
        Vector3 worldRotation = guadian.rotation.eulerAngles;
        Transform transformL = gameObject.transform;
        transformL.position = worldPosition;
        transformL.rotation = Quaternion.Euler(worldRotation); ;
        //Debug.Log("挂点的世界坐标：" + worldPosition);
    }
}
