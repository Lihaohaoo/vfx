using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;

//[ExecuteAlways]
public class AFX_SkinRandomLight : MonoBehaviour
{
    [Header("······全身电弧功能········")]
    [Space(21)]
    [Header("角色蒙皮（将角色的所有身体部件添加到这里）")]
    public SkinnedMeshRenderer[] skinneds;
    [Header("闪电本体特效（line组件,数量将决定闪电数量）")]
    public LineRenderer[] lines = new LineRenderer[6];
    [Header("闪电精度（line段数）")]
    [Range(5, 500)]
    public int lightaccuracy = 50;
    private int lightshuliang = 6;
    [Header("闪电坐标刷新时间间隔")]
    public Vector2 shuaxinrange = new Vector2(0.1f,0.25f);
     float[] lightlife = new float[6];
     float[] lighttime = new float[6];
    //拿到的所有蒙皮的顶点位置和法向
    Vector3[] vertexPositions;
     Vector3[] vertexDir;

    private Vector3[] startpos = new Vector3[6];
    private Vector3[] endpos = new Vector3[6];
    private Vector3[] startdirs = new Vector3[6];
    private Vector3[] enddirs = new Vector3[6];
    //记录起始顶点位置和结束顶点位置 的序号
    private int[] randomStartpos = new int[6];
    private int[] randomEndpos = new int[6];
    [Header("闪电隆起高度")]
    public float height = 1;
    [Header("闪电隆起高度依据电弧头尾距离决定，定义它在多大距离下达到最大高度")]
    public float distanceRange = 2.1f;
    [Header("电弧最大连接距离 （可以调整此值 来限制闪电的起始点和结束点的最大距离，（米））")]
    public float maxdis = 0.6f;
    [Space(21)]
    [Header("调整这个曲线 决定闪电高度依据电弧头尾距离 变高的趋势（默认近低远高）")]
    public AnimationCurve curvelightGaodu = new AnimationCurve();
    [Header("闪电在生命过程中隆起（调整曲线，让闪电的隆起高度在生命中有变化）")]
    public AnimationCurve curvelightLifeGaodu = new AnimationCurve();

    [Space(31)]
    [Header("`````````````````````````````````````````````````````````````````")]
    [Header("击打地面的闪电")]
    public bool isdm = false;
    [Space(11)]
    [Header("闪电打击 范围区间")]
    public float lightingRangeXZ = 1.5f;
    [Header("连地闪电（line组件,数量将决定闪电数量）")]
    public LineRenderer[] dmlines = new LineRenderer[4];
    [Header("闪电打击 打击位置的特效 （粒子生命不要高于打击间隔）")]
    public Transform[] attackfx = new Transform[4];
    [Header("闪电击打位置刷新时间间隔")]
    public Vector2 shuaxinrange1 = new Vector2(0.12f, 0.25f);
    float[] lightlife1 = new float[4];
    float[] lighttime1 = new float[4];
    int[] suijidingdian = new int[4];
     Vector3[] startpos1 = new Vector3[6];
     Vector3[] endpos1 = new Vector3[6];
    [Header("闪电精度（line段数）")]
    [Range(5, 500)]
    public int lightaccuracy1 = 50;
    [Header("闪电形态（近距离时）")]
    public AnimationCurve dmlinecurve = new AnimationCurve();
    [Header("闪电形态（远距离时）")]
    public AnimationCurve dmlinecurve1 = new AnimationCurve();
    [Header("最大距离 （闪电长度达到此距离时切换到远距离的闪电形态）")]
    public float maxdis1 = 3f;
    [Space(11)]
    [Header("地面的位置（如果指定一个物体 将认为此物体的高度就是地面）")]
    public Transform dmgo;
    [Header("不指定地面物体的话，则需要指定一个世界坐标的位置 告诉我这个高度是地面")]
    public Vector3 dmpositoon = new Vector3(0,0,0);

    Mesh Meshaa ;
    float startdisend = 0;
    float ddd = 0;
    float gaodu = 0;
    float gm = 1;
    float dd = 0;
    float dis =0;//
    void Reset()
    {
        lightshuliang = 6;
        curvelightGaodu.keys = new Keyframe[] { new Keyframe(0.0f, 0.0f), new Keyframe(1.0f, 1.0f), };
        curvelightLifeGaodu.keys = new Keyframe[] { new Keyframe(0.0f, 0.4f), new Keyframe(1.0f, 1.0f), };
        startpos = new Vector3[lightshuliang];
        endpos = new Vector3[lightshuliang];
        startdirs = new Vector3[lightshuliang];
        enddirs = new Vector3[lightshuliang];
        lightlife = new float[lightshuliang];
        lines = new LineRenderer[6];
        for (int i = 0; i < lightlife.Length; i++) 
        {
            lightlife[i] = Random.Range(shuaxinrange.x, shuaxinrange.y);
        }
        dmlinecurve.keys = new Keyframe[] { new Keyframe(0.0f, 0.0f), new Keyframe(0.5f, 1.0f), new Keyframe(1f, 0f) };
        dmlinecurve1.keys = new Keyframe[] { new Keyframe(0.0f, 0.0f), new Keyframe(0.5f, -1.0f) , new Keyframe(1f, 0f) };
    }
    private void OnEnable()
    {
        //InvokeRepeating("ramdomVertexpos",0, suijipinlv);
        //初始化各个参数
        Meshaa = new Mesh();
        lightshuliang = lines.Length;
        startpos = new Vector3[lightshuliang];
        endpos = new Vector3[lightshuliang];
        startdirs = new Vector3[lightshuliang];
        enddirs = new Vector3[lightshuliang];
        lightlife = new float[lightshuliang];
        lighttime = new float[lightshuliang];

        randomStartpos = new int[lightshuliang];
        randomEndpos = new int[lightshuliang];

        lightlife1 = new float[dmlines.Length];
        lighttime1 = new float[dmlines.Length];
        suijidingdian = new int[dmlines.Length];
         startpos1 = new Vector3[dmlines.Length];
        endpos1 = new Vector3[dmlines.Length];
        MyRandomTime0();
        MyRandomTime1();
    }
    private void OnDisable()
    {
        //CancelInvoke();
    }
    private void Update()
    {
        ///随机值部分,每次随机为 每个闪电随机一个生命，在此次生命结束之前 不分配新的位置，此次生命结束则继续随机新的生命和位置

        if (lines.Length>=1) 
        {
            //每帧先同步顶点位置
            vertexPositions = new Vector3[0];
            vertexDir = new Vector3[0];
            for (int i = 0; i < skinneds.Length; i++)
            {
                //Meshaa = new Mesh();
                skinneds[i].BakeMesh(Meshaa);
                vertexPositions = vertexPositions.Concat(Meshaa.vertices).ToArray();
                vertexDir = vertexDir.Concat(Meshaa.normals).ToArray();
            }

            //循环闪电数量次数 判断当前闪电时间是否到它该刷新的时候了
            for (int i = 0; i < lightshuliang; i++)
            {
                if (startpos.Length > i && endpos.Length > i && startdirs.Length > i && enddirs.Length > i && lightlife.Length > i && lighttime.Length > i && randomStartpos.Length > i && randomEndpos.Length > i)
                {
                    if (lighttime[i] <= lightlife[i])//判断当前时间是否到刷新位置的时间了
                    {
                        ///同步闪电部分
                        //未到刷新时间则继续同步当前顶点序号的位置
                        lighttime[i] += Time.deltaTime;

                        vertexPositions[randomStartpos[i]] = transform.TransformPoint(vertexPositions[randomStartpos[i]]);
                        startpos[i] = vertexPositions[randomStartpos[i]];//起始点
                        startdirs[i] = vertexDir[randomStartpos[i]];

                        vertexPositions[randomEndpos[i]] = transform.TransformPoint(vertexPositions[randomEndpos[i]]);
                        endpos[i] = vertexPositions[randomEndpos[i]];//结束点
                        enddirs[i] = vertexDir[randomEndpos[i]];

                        float distest = Vector3.Distance(startpos[i], endpos[i]);
                        if (distest > maxdis*1.5f) 
                        {
                            endpos[i] = new Vector3(startpos[i].x, startpos[i].y, startpos[i].z);
                        }

                        if (lines.Length > i)
                        {
                            if (lines[i] != null)
                            {
                                lines[i].useWorldSpace = true;
                                   //在起始点和结束点之间 链接闪电。在起始点和结束点的法线方向的延长线上偏移一定距离，作为贝塞尔计算的手柄，
                                   lines[i].positionCount = lightaccuracy;
                                for (int j = 0; j < lines[i].positionCount; j++)
                                {
                                    //起点与终点的距离
                                     startdisend = Vector3.Distance(startpos[i], endpos[i]);
                                     ddd = startdisend / distanceRange;
                                     gaodu = Mathf.Lerp(0, height, ddd);
                                     gm = 1;
                                    gm = curvelightLifeGaodu.Evaluate(lighttime[i] / lightlife[i]);
                                    gaodu = gaodu * gm;
                                    //偏移方向，
                                    Vector3 direction1 = startdirs[i];
                                    // 确保方向向量是归一化的  
                                    //direction1.Normalize();
                                    // 计算位移向量  
                                    Vector3 displacement1 = direction1 * gaodu;
                                    // 更新物体位置  
                                    Vector3 newPosition = startpos[i] + displacement1;
                                    Vector3 pos1 = newPosition;

                                    //偏移方向，
                                    Vector3 direction2 = enddirs[i];
                                    // 确保方向向量是归一化的  
                                    //direction2.Normalize();
                                    // 计算位移向量  
                                    Vector3 displacement2 = direction2 * gaodu;
                                    // 更新物体位置  
                                    Vector3 newPosition1 = endpos[i] + displacement2;
                                    Vector3 pos2 = newPosition1;
                                    Vector3 zhongdian = Vector3.Lerp(pos1, pos2, 0.5f);
                                    dd = (float)j / (float)lines[i].positionCount;
                                    lines[i].SetPosition(j, BezierCurve(startpos[i], zhongdian, endpos[i], dd));
                                }
                            }
                        }
                    }
                    else
                    {
                        lighttime[i] = 0;//重置时间
                                         //重新随机此条闪电起始和结束点的顶点位置
                                         //先随机出一个起始位置，再从这个起始位置每间隔 10 个顶点向外寻找，找到符合距离限制的范围，再从这个范围中随机选择一个顶点作为结束点
                        int aas = Random.Range(0, vertexPositions.Length - 1);
                        randomStartpos[i] = aas;//先随机出一个起始位置序号

                        List<int> tempposs = new List<int>();
                        for (int j = aas; j < vertexPositions.Length - 11; j += 10)//每隔10个顶点判断一次，如果这个顶点在限制距离内 则加入列表
                        {
                             dis = Vector3.Distance(vertexPositions[randomStartpos[i]], vertexPositions[j]);//
                            if (dis < maxdis)
                            {
                                tempposs.Add(j);
                            }
                        }
                        if (tempposs.Count >= 2)//判断加入列表的是否大于1个，如果大于从中随机用一个，如果不大于，随意选择一个位置作为结束点
                        {
                            aas = Random.Range(0, tempposs.Count - 1);
                            randomEndpos[i] = tempposs[aas];
                        }
                        else
                        {
                            randomEndpos[i] = Random.Range(0, vertexPositions.Length - 1);
                        }
                    }
                }


            }
            if (isdm == true)
            {
                if (dmlines.Length >= 1)
                {
                    if (dmgo != null)
                    {
                        dmpositoon = dmgo.position;
                    }
                    for (int i = 0; i < dmlines.Length; i++)
                    {
                        dmlines[i].gameObject.SetActive(true);
                        if (lighttime1[i] <= lightlife1[i])//判断当前时间是否到刷新位置的时间了
                        {
                            ///同步闪电部分
                            //未到刷新时间则继续同步当前顶点序号的位置
                            lighttime1[i] += Time.deltaTime;

                            vertexPositions[suijidingdian[i]] = transform.TransformPoint(vertexPositions[suijidingdian[i]]);
                            startpos1[i] = vertexPositions[suijidingdian[i]];//起始点

                            if (attackfx.Length > i)
                            {
                                if (attackfx[i] != null)
                                {
                                    attackfx[i].position = endpos1[i];
                                }
                            }

                            if (dmlines.Length > i)
                            {
                                if (dmlines[i] != null)
                                {
                                    dmlines[i].useWorldSpace = true;
                                    //在起始点和结束点之间 链接闪电。在起始点和结束点的法线方向的延长线上偏移一定距离，作为贝塞尔计算的手柄，
                                    dmlines[i].positionCount = lightaccuracy1;

                                    Vector3 juesejiaoxia00 = new Vector3(startpos1[i].x, dmpositoon.y, startpos1[i].z);
                                    Vector3 zhongjiandian = Vector3.Lerp(startpos1[i], endpos1[i], 0.5f);
                                    // 计算方向向量  
                                    Vector3 direction = zhongjiandian - juesejiaoxia00;
                                    // 归一化方向向量以得到单位向量  
                                    Vector3 normalizedDirection = direction.normalized;
                                    float ddd = Vector3.Distance(startpos1[i], endpos1[i]);
                                    for (int j = 0; j < dmlines[i].positionCount; j++)
                                    {
                                        float dd = (float)j / (float)dmlines[i].positionCount;
                                        // 计算新位置  
                                        Vector3 newPosition = Vector3.Lerp(startpos1[i], endpos1[i], dd);
                                        // 计算移动量  
                                        Vector3 moveAmount = normalizedDirection * Mathf.Lerp(dmlinecurve.Evaluate(dd) * curvelightLifeGaodu.Evaluate(lighttime1[i] / lightlife1[i]),
                                            dmlinecurve1.Evaluate(dd) * curvelightLifeGaodu.Evaluate(lighttime1[i] / lightlife1[i]),
                                            Mathf.Lerp(0, 1, ddd / maxdis1));
                                        newPosition = newPosition + moveAmount;
                                        dmlines[i].SetPosition(j, newPosition);
                                    }

                                }
                            }
                        }
                        else
                        {
                            lighttime1[i] = 0;//重置时间
                                              //重新随机此条闪电起始和结束点
                            int aas = Random.Range(0, vertexPositions.Length - 1);
                            suijidingdian[i] = aas;
                            endpos1[i] = new Vector3(Random.Range(transform.position.x - lightingRangeXZ, transform.position.x + lightingRangeXZ), dmpositoon.y, Random.Range(transform.position.z - lightingRangeXZ, transform.position.z + lightingRangeXZ));
                            if (attackfx.Length > i)
                            {
                                if (attackfx[i] != null)
                                {
                                    attackfx[i].gameObject.SetActive(false);
                                    attackfx[i].position = endpos1[i];
                                    attackfx[i].gameObject.SetActive(true);
                                }
                            }

                        }
                    }
                }
            }
            else 
            {
                if (dmlines.Length >= 1) 
                {
                    for (int j = 0; j < dmlines.Length; j++)
                    {
                        dmlines[j].gameObject.SetActive(false);
                    }

                }
            }
        }

    }
    public void MyRandomTime0() 
    {
        for (int i = 0; i < lightlife.Length; i++)
        {
            lightlife[i] = Random.Range(shuaxinrange.x, shuaxinrange.y);
        }
    }
    public void MyRandomTime1()
    {
        for (int i = 0; i < lightlife1.Length; i++)
        {
            lightlife1[i] = Random.Range(shuaxinrange1.x, shuaxinrange1.y);
        }
    }

    // 计算二次Bezier曲线上的点  
    public static Vector3 BezierCurve(Vector3 startPoint, Vector3 controlPoint, Vector3 endPoint, float t)
    {
        t = Mathf.Clamp01(t);
        float u = 1 - t;
        float tt = t * t;
        float uu = u * u;
        // 根据Bezier公式计算点  
        Vector3 p = uu * startPoint; 
        p += 2 * u * t * controlPoint; 
        p += tt * endPoint; 
        return p;
    }

}
