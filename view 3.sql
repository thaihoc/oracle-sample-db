CREATE OR REPLACE VIEW vw_instructor_courses AS
SELECT
    i.instructor_id,
    i.full_name AS instructor_name,
    c.course_id,
    c.course_name
FROM
    Instructors i
    JOIN Courses c ON i.instructor_id = c.instructor_id;