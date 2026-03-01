-- Set timezone
SET TIME ZONE 'America/Sao_Paulo';

-- SUBJECT
CREATE TABLE subjects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

-- ADMINISTRATORS
CREATE TABLE administrators (
    id SERIAL PRIMARY KEY,
    username VARCHAR(40) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL
);

-- PROFESSORS
CREATE TABLE professors (
    id SERIAL PRIMARY KEY,
    username VARCHAR(40) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    subject_id INTEGER NOT NULL,
    CONSTRAINT fk_professor_subject
        FOREIGN KEY (subject_id)
        REFERENCES subjects(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- GRADES
CREATE TABLE grades (
    id SERIAL PRIMARY KEY,
    grade1 DECIMAL(10,2) NOT NULL CHECK (grade1 BETWEEN 0 AND 10),
    grade2 DECIMAL(10,2) NOT NULL CHECK (grade2 BETWEEN 0 AND 10),
    rec DECIMAL(10,2) CHECK (rec BETWEEN 0 AND 10),
    subject_id INTEGER NOT NULL,
    CONSTRAINT fk_grades_subject
        FOREIGN KEY (subject_id)
        REFERENCES subjects(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
-- STUDENTS
CREATE TABLE students (
    enrollment serial PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    issue_date DATE DEFAULT CURRENT_DATE NOT NULL,
    password VARCHAR(50),
    name VARCHAR(100),
    serie INTEGER
);

-- REPORT_CARD
CREATE TABLE report_card (
    id SERIAL PRIMARY KEY,
    final_situation BOOLEAN,
    subject_id INTEGER NOT NULL,
    professor_id INTEGER NOT NULL,
    student_id INTEGER NOT NULL,
    CONSTRAINT fk_report_card_subject
        FOREIGN KEY (subject_id)
        REFERENCES subjects(id),
     CONSTRAINT fk_report_card_professor
        FOREIGN KEY (professor_id)
        REFERENCES professors(id),
     CONSTRAINT fk_report_card_student
        FOREIGN KEY (student_id)
        REFERENCES students(enrollment)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    
);

-- GRADE_REP
CREATE TABLE grade_rep (
    id SERIAL PRIMARY KEY,
    rep_id INTEGER NOT NULL,
    grade_id INTEGER NOT NULL,
    CONSTRAINT fk_grade_rep_rep
        FOREIGN KEY (rep_id)
        REFERENCES report_card(id),
    CONSTRAINT fk_grade_rep_grade
        FOREIGN KEY (grade_id)
        REFERENCES grades(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- OBSERVATIONS
CREATE TABLE observations (
    id SERIAL PRIMARY KEY,
    observation TEXT,
    student_id INTEGER NOT NULL,
    CONSTRAINT fk_observations_student
        FOREIGN KEY (student_id)
        REFERENCES students(enrollment)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

