DROP TABLE IF EXISTS attendance_logs CASCADE;
DROP TABLE IF EXISTS students CASCADE;
-- TABLE: students
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_number VARCHAR(30) NOT NULL UNIQUE,
    student_name VARCHAR(100) NOT NULL,
    section VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- TABLE: attendance_logs
CREATE TABLE attendance_logs (
    log_id SERIAL PRIMARY KEY,
    student_id INT NOT NULL,
    time_in TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    time_out TIMESTAMP,
    log_date DATE NOT NULL DEFAULT CURRENT_DATE,
    CONSTRAINT fk_student FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE
);
-- INDEXES
CREATE INDEX idx_attendance_student_id ON attendance_logs(student_id);
CREATE INDEX idx_attendance_log_date ON attendance_logs(log_date);
CREATE INDEX idx_students_number ON students(student_number);
-- STUDENT DATA
INSERT INTO students (student_number, student_name, section)
VALUES (
        '2024-00001-SR-0',
        'Aleya Catleen Malaque',
        'BSIT 2-2'
    ),
    (
        '2024-00002-SR-0',
        'Alvin Jan Calambro',
        'BSIT 2-2'
    ),
    (
        '2024-00003-SR-0',
        'Darrel Jed Ramos',
        'BSIT 2-2'
    ),
    (
        '2024-00004-SR-0',
        'Drew Quierra',
        'BSIT 2-2'
    ),
    (
        '2024-00005-SR-0',
        'Jan Arby Cruz',
        'BSIT 2-2'
    ),
    (
        '2024-00006-SR-0',
        'Joyce Aguilar',
        'BSIT 2-2'
    ),
    (
        '2024-00007-SR-0',
        'Lamuel Alojado',
        'BSIT 2-2'
    ),
    (
        '2024-00008-SR-0',
        'Laurence Lucero',
        'BSIT 2-2'
    ),
    (
        '2024-00009-SR-0',
        'Mark Justine Cailao',
        'BSIT 2-2'
    ),
    (
        '2024-00010-SR-0',
        'Might Xyrel Malinay',
        'BSIT 2-2'
    ),
    (
        '2024-00011-SR-0',
        'Neil Apolinar',
        'BSIT 2-2'
    ),
    (
        '2024-00012-SR-0',
        'Ram Acosta',
        'BSIT 2-2'
    ),
    (
        '2024-00013-SR-0',
        'Revo Trinidad',
        'BSIT 2-2'
    ),
    (
        '2024-00014-SR-0',
        'Rhain Lorenz Sancho',
        'BSIT 2-2'
    ),
    (
        '2024-00015-SR-0',
        'Sheerie Asuncion',
        'BSIT 2-2'
    );