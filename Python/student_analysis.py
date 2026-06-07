import pandas as pd

# Load dataset
df = pd.read_excel("student_performance_data_300.xlsx")

# Basic KPIs
total_students = len(df)
avg_attendance = df["Attendance_Percentage"].mean()
avg_score = df["Final_Score"].mean()

at_risk = df[
    (df["Attendance_Percentage"] < 70) |
    (df["Final_Score"] < 50)
]

print("Total Students:", total_students)
print("Average Attendance:", round(avg_attendance, 2))
print("Average Score:", round(avg_score, 2))
print("At Risk Students:", len(at_risk))
