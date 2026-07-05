-- Step 1: Logging personal transaction baseline records
INSERT INTO student_marks (student_id, student_name, subject, marks, attendance, grade)
VALUES (9, 'Chakshu Sharma', 'AWS Cloud Ingestion', 88, 94.0, 'A');

-- 1. Lowest Marks in Each Subject
SELECT subject, MIN(marks) AS lowest_marks FROM student_marks GROUP BY subject;

-- 2. Total Students in Each Subject
SELECT subject, COUNT(student_id) AS total_students FROM student_marks GROUP BY subject;

-- 3. Students Scoring Above Average Marks
SELECT student_name, marks FROM student_marks 
WHERE marks > (SELECT AVG(marks) FROM student_marks);

-- 4. Subject-wise Average Attendance
SELECT subject, ROUND(AVG(attendance), 2) AS avg_attendance FROM student_marks GROUP BY subject;

-- 5. Rank Students by Marks
SELECT student_name, subject, marks, RANK() OVER (ORDER BY marks DESC) as student_rank FROM student_marks;
