using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.Timeline;

[System.Serializable]
public class BulletTimePlayableAsset : PlayableAsset, ITimelineClipAsset
{
    public BulletTimeBehaviour template = new BulletTimeBehaviour();

    public ClipCaps clipCaps { get { return ClipCaps.None; } }

    public override Playable CreatePlayable(PlayableGraph graph, GameObject owner)
    {
        var playable = ScriptPlayable<BulletTimeBehaviour>.Create(graph, template);
        return playable;
    }
}

[System.Serializable]
public class BulletTimeBehaviour : PlayableBehaviour
{
    [Header("子弹时间控制")]
    [Tooltip("子弹时间的时间缩放（快慢控制）")]
    public float timeScale = 1.0f;  // 子弹时间的时间缩放（快慢控制）

    [Tooltip("强度控制，控制子弹时间效果的强度")]
    public float strength = 1.0f;   // 强度控制

    [Tooltip("时间缩放的动画曲线，用来渐变控制时间快慢")]
    public AnimationCurve timeScaleCurve;  // 时间缩放的动画曲线，用来渐变控制时间快慢

    private float originalTimeScale;  // 原始的时间缩放
    private float timeElapsed = 0f;  // 经过的时间

    public override void OnGraphStart(Playable playable)
    {
        originalTimeScale = Time.timeScale;  // 保存原始时间缩放

        // 确保 timeScale 的值在有效范围内（0.0 到 5.0之间）
        timeScale = Mathf.Clamp(timeScale, 0.0f, 5.0f);

        Time.timeScale = timeScale;  // 设置初始的时间缩放
    }

    public override void OnGraphStop(Playable playable)
    {
        Time.timeScale = originalTimeScale;  // 恢复原始的时间缩放
    }

    public override void PrepareFrame(Playable playable, FrameData info)
    {
        timeElapsed += info.deltaTime;  // 累积经过的时间

        // 根据时间渐变控制时间缩放
        if (timeScaleCurve != null)
        {
            float curveValue = timeScaleCurve.Evaluate(timeElapsed);
            Time.timeScale = Mathf.Lerp(originalTimeScale, timeScale, curveValue);
        }

        // 根据强度调整时间流速（可以调整时间变化的强度）
        Time.timeScale = Mathf.Clamp(Time.timeScale, 0.0f, 5.0f);  // 限制时间缩放的范围
    }
}
