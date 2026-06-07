-- 1. Total Students

SELECT
COUNT(*) AS Total_Students
FROM student_performance;

-- 2. Average Attendance

SELECT
ROUND(AVG(Attendance_Percentage),2) AS Avg_Attendance
FROM student_performance;

-- 3. Average Final Score

SELECT
ROUND(AVG(Final_Score),2) AS Avg_Final_Score
FROM student_performance;

-- 4. Total At-Risk Students

SELECT
COUNT(*) AS At_Risk_Students
FROM student_performance
WHERE Attendance_Percentage < 70
OR Final_Score < 50;

-- 5. Student Distribution by Grade

SELECT
Grade,
COUNT(*) AS Total_Students
FROM student_performance
GROUP BY Grade
ORDER BY Grade;

-- 6. Student Distribution by Batch

SELECT
Batch,
COUNT(*) AS Total_Students
FROM student_performance
GROUP BY Batch
ORDER BY Total_Students DESC;

-- 7. Average Performance by Grade

SELECT
Grade,
ROUND(AVG(Final_Score),2) AS Avg_Score
FROM student_performance
GROUP BY Grade
ORDER BY Avg_Score DESC;

-- 8. Average Performance by Batch

SELECT
Batch,
ROUND(AVG(Final_Score),2) AS Avg_Score
FROM student_performance
GROUP BY Batch
ORDER BY Avg_Score DESC;

-- 9. Top 10 Performing Students

SELECT
Student_ID,
Student_Name,
Batch,
Final_Score
FROM student_performance
ORDER BY Final_Score DESC
LIMIT 10;

-- 10. Bottom 10 Performing Students

SELECT
Student_ID,
Student_Name,
Batch,
Final_Score
FROM student_performance
ORDER BY Final_Score ASC
LIMIT 10;

-- 11. Attendance vs Performance Analysis

SELECT
CASE
WHEN Attendance_Percentage >= 90 THEN 'High Attendance'
WHEN Attendance_Percentage >= 75 THEN 'Medium Attendance'
ELSE 'Low Attendance'
END AS Attendance_Group,

ROUND(AVG(Final_Score),2) AS Avg_Performance

FROM student_performance

GROUP BY Attendance_Group

ORDER BY Avg_Performance DESC;

-- 12. Active vs At-Risk Students

SELECT
Status,
COUNT(*) AS Student_Count
FROM student_performance
GROUP BY Status;

-- 13. Students Requiring Intervention

SELECT
Student_ID,
Student_Name,
Batch,
Attendance_Percentage,
Final_Score
FROM student_performance
WHERE Attendance_Percentage < 70
OR Final_Score < 50
ORDER BY Final_Score ASC;

-- 14. Batch-wise At-Risk Students

SELECT
Batch,
COUNT(*) AS At_Risk_Count
FROM student_performance
WHERE Attendance_Percentage < 70
OR Final_Score < 50
GROUP BY Batch
ORDER BY At_Risk_Count DESC;

-- 15. Grade-wise At-Risk Students

SELECT
Grade,
COUNT(*) AS At_Risk_Count
FROM student_performance
WHERE Attendance_Percentage < 70
OR Final_Score < 50
GROUP BY Grade
ORDER BY At_Risk_Count DESC;

-- 16. Assignment Score Analysis

SELECT
Grade,
ROUND(AVG(Assignment_Score),2) AS Avg_Assignment_Score
FROM student_performance
GROUP BY Grade
ORDER BY Avg_Assignment_Score DESC;

-- 17. Test Score Analysis

SELECT
Grade,
ROUND(AVG(Test_Score),2) AS Avg_Test_Score
FROM student_performance
GROUP BY Grade
ORDER BY Avg_Test_Score DESC;

-- 18. Overall Academic Performance Summary

SELECT
MIN(Final_Score) AS Lowest_Score,
MAX(Final_Score) AS Highest_Score,
ROUND(AVG(Final_Score),2) AS Average_Score
FROM student_performance;
