CREATE OR REPLACE VIEW vw_student_grades AS
SELECT
    s.student_id,
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_name,
    g.grade,
    g.grade_date
FROM
    Students s
    JOIN Enrollments e ON s.student_id = e.student_id
    JOIN Courses c ON e.course_id = c.course_id
    JOIN Grades g ON e.enrollment_id = g.enrollment_id;