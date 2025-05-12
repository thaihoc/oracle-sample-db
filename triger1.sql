CREATE TABLE Student_Email_Audit (
    audit_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    student_id NUMBER,
    old_email VARCHAR2(100),
    new_email VARCHAR2(100),
    change_date DATE
);

CREATE OR REPLACE TRIGGER trg_student_email_audit
BEFORE UPDATE OF email ON Students
FOR EACH ROW
WHEN (OLD.email IS NOT NULL AND NEW.email != OLD.email)
BEGIN
    INSERT INTO Student_Email_Audit (student_id, old_email, new_email, change_date)
    VALUES (:OLD.student_id, :OLD.email, :NEW.email, SYSDATE);
END;