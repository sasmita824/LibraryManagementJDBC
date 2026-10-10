SELECT branch, COUNT(*) AS total_students
FROM student
GROUP BY branch
HAVING COUNT(*) > 2;