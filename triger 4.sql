CREATE OR REPLACE TRIGGER trg_prevent_duplicate_enrollment
BEFORE INSERT ON Enrollments
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Enrollments
    WHERE student_id = :NEW.student_id AND course_id = :NEW.course_id;

    IF v_count > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Student already enrolled in this course.');
    END IF;
END;