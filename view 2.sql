CREATE OR REPLACE VIEW vw_course_enrollments AS
SELECT
    c.course_id,
    c.course_name,
    COUNT(e.enrollment_id) AS total_enrollments
FROM
    Courses c
    LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY
    c.course_id, c.course_name;