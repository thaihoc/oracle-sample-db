CREATE OR REPLACE TRIGGER trg_default_grade
BEFORE INSERT ON Grades
FOR EACH ROW
BEGIN
    IF :NEW.grade IS NULL THEN
        :NEW.grade := 'N/A';
    END IF;
END;