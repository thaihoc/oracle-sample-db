-- Table: Students
CREATE TABLE Students (
    student_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    registration_date DATE
);

-- Table: Instructors
CREATE TABLE Instructors (
    instructor_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100),
    email VARCHAR2(100)
);

-- Table: Courses
CREATE TABLE Courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100),
    instructor_id NUMBER,
    FOREIGN KEY (instructor_id) REFERENCES Instructors(instructor_id)
);

-- Table: Enrollments
CREATE TABLE Enrollments (
    enrollment_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Table: Grades
CREATE TABLE Grades (
    grade_id NUMBER PRIMARY KEY,
    enrollment_id NUMBER,
    grade VARCHAR2(2),
    grade_date DATE,
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id)
);