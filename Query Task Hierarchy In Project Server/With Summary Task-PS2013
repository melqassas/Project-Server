WITH CTE(ProjectUID, TaskUID, TaskParentUID, TaskName, LEVEL) AS
  (SELECT ProjectUID,
          TaskUID,
          TaskParentUID,
          CAST(TaskName AS NVARCHAR(MAX)),
          0
   FROM dbo.MSP_EpmTask_UserView WITH(NOLOCK)
   WHERE TaskIsSummary = 0
   UNION ALL SELECT UV.ProjectUID,
                    CTE.TaskUID,
                    UV.TaskParentUID,
                    CAST(UV.TaskName AS NVARCHAR(MAX)) + ' -> ' + CAST(CTE.TaskName AS NVARCHAR(MAX)),
                    CTE.Level + 1
   FROM CTE
   INNER JOIN dbo.MSP_EpmTask_UserView UV WITH(NOLOCK) ON CTE.ProjectUID = UV.ProjectUID
   AND CTE.TaskParentUID = UV.TaskUID
   WHERE TaskIsSummary = 1
     AND CTE.TaskParentUID <> UV.TaskParentUID )
SELECT X.TaskUID,

  (SELECT TaskName
   FROM MSP_EpmTask_UserView
   WHERE TaskIndex = 0
     AND ProjectUID = '2D43C978-00F3-E511-80D4-A0481C8F7133') + ' -> ' + X.TaskName AS 'Task Hierarchy'
FROM CTE X
INNER JOIN
  (SELECT ProjectUID,
          TaskUID,
          MAX(LEVEL) AS 'Level'
   FROM CTE
   GROUP BY ProjectUID,
            TaskUID) Y ON X.ProjectUID = Y.ProjectUID
AND X.TaskUID = Y.TaskUID
AND X.Level = Y.Level
WHERE X.ProjectUID = '2D43C978-00F3-E511-80D4-A0481C8F7133'
