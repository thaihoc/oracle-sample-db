CREATE OR REPLACE TRIGGER trg_auto_grade_date
BEFORE INSERT ON Grades
FOR EACH ROW
BEGIN
    IF :NEW.grade_date IS NULL THEN
        :NEW.grade_date := SYSDATE;
    END IF;
END;