-- =========================================
-- RESET DATABASE (SAFE VERSION)
-- =========================================
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-- =========================================
-- EXTENSIONS (OPTIONAL BUT USEFUL)
-- =========================================
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =========================================
-- ENUM: USER ROLE
-- =========================================
CREATE TYPE user_role AS ENUM ('ADMIN','STUDENT','TEACHER');

-- =========================================
-- COURSES TABLE
-- =========================================
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO courses (course_id, code, name, credits)
VALUES
(1, 'CS123', 'Cyber Security', 3),
(2, 'AI101', 'Artificial Intelligence', 3);

-- =========================================
-- STUDENTS TABLE (NORMALIZED ✅)
-- =========================================
CREATE TABLE students (
    lc_number VARCHAR(20) PRIMARY KEY,
    reg_no INT NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    semester INT NOT NULL CHECK (semester > 0),
    course_id INT REFERENCES courses(course_id) ON DELETE SET NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO students
(lc_number, reg_no, full_name, email, phone, semester, course_id, username, password)
VALUES
('LC11103', 1001, 'Alice Smith', 'alice@example.com', '9815609454', 2, 2, 'alice123', 'AliceS@123');

-- =========================================
-- TEACHERS TABLE (NORMALIZED ✅)
-- =========================================
CREATE TABLE teachers (
    employee_no VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20), 
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO teachers
(employee_no, full_name, phone, username, password, email)
VALUES
('55001', 'John Doe', '9815001234', 'johnd', 'JohnD@123', johndoe@example.com);

-- =========================================
-- TEACHER-COURSE RELATION (MANY-TO-MANY ✅)
-- =========================================
CREATE TABLE teacher_courses (
    id SERIAL PRIMARY KEY,
    teacher_id VARCHAR(20) REFERENCES teachers(employee_no) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE
);

-- =========================================
-- ADMIN TABLE
-- =========================================
CREATE TABLE admin (
    employee_no VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admin
(employee_no, full_name, email, phone, username, password)
VALUES
('66001', 'Nolan Shrestha', 'nolan@kfaltd.com', '9815609454', 'nolan678', 'NolanS&678');

-- =========================================
-- USERS TABLE (AUTH SYSTEM 🔐)
-- =========================================
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    role user_role NOT NULL,
    linked_person_id VARCHAR(20),
    is_active BOOLEAN DEFAULT TRUE,
    failed_attempts INT DEFAULT 0,
    last_login TIMESTAMP,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR (50),
    phone VARCHAR (50),
    plain_password(50) VARCHAR (50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (id, full_name, username, role, linked_person_id, is_active, )
VALUES
(1, 'nolan678', 'ADMIN', '66001', true, 0, NULL, 'Nolan Shrestha', nolan@kfaltd.com, 9815609454, NolanS&123),
(2, 'alice123', 'STUDENT', 'LC11103', true, 0, NULL,  'Alice Smith', alice@example.com, 9815609454, AliceS@123),
(3, 'johnd', 'TEACHER', '55001', true, 0, NULL, 'John Doe', johndoe@example.com, 9815001234, JohnD@123);

-- =========================================
-- STUDENTS REGISTRATION REQUESTS
-- =========================================
CREATE TABLE student_registration_requests (
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING'
        CHECK (status IN ('PENDING', 'APPROVED', 'REJECTED')),
    request_id SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO registration_requests (lc_number, full_name, email, phone, username, password)
VALUES
('Bob Smith', 'bob.smith@student.com', '555-5678', 'bobsmith', 'securepass', 'LC11007'),
('Clara Lee', 'clara.lee@student.com', '555-9012', 'claralee', 'mypassword', 'LC11008'),
('Alice Johnson', 'alice.johnson@student.com', '555-1234', 'alicej', 'password123', 'LC11006');

-- =========================================
-- TEACHERS REGISTRATION REQUESTS
-- =========================================
CREATE TABLE teachers_registration_requests (
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    status VARCHAR(20) DEFAULT 'PENDING'
        CHECK (status IN ('PENDING', 'APPROVED', 'REJECTED')),
    request_id SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO registration_requests (lc_number, full_name, email, phone, username, password)
VALUES
('David Brown', 'david.brown@teacher.com', '555-2345', 'davidb', 'teachpass', '55002')
('Eva Green', 'eva.green@teacher.com', '555-6789', 'evagreen', 'strongpass', '55003'),
('Frank White', 'frank.white@teacher.com', '555-3456', 'frankw', 'pass1234', '55004');

-- =========================================
-- LOGIN AUDIT (SECURITY 🔐)
-- =========================================
CREATE TABLE login_audit (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50),
    success BOOLEAN,
    attempt_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(50)
);

-- =========================================
-- INDEXES (PERFORMANCE 🚀)
-- =========================================
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_students_course ON students(course_id);
CREATE INDEX idx_registration_status ON registration_requests(status);
