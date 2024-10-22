using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Shandian_line : MonoBehaviour
{
    public Transform cube1;
    public Transform cube2;
    public Transform cube3;
    
    public int positionmax=10;
    public LineRenderer line;

    Vector3 CalculatCubicBezierPoint(float t, Vector3 p0, Vector3 p1, Vector3 p2)
    {
        float u = 1 - t;
        float tt = t * t;
        float uu = u * u;
        Vector3 p = uu * p0;
        p += 2 * u * t * p1;
        p += tt * p2;
        return p;
    }
    // Start is called before the first frame update
    // Update is called once per frame
    void Update()
    {
        line.positionCount = positionmax;
        for (int i = 0; i < positionmax; i++)
        {
            float ti = (float)i/positionmax;
            Vector3 point = CalculatCubicBezierPoint(ti, cube1.position, cube2.position, cube3.position);
            line.SetPosition(i, point);
        }
        
    }
}
