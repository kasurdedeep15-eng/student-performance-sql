CREATE DATABASE student_performance;
USE student_performance;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    course VARCHAR(50)
);

INSERT INTO students (student_id, name, age, gender, city, course)
VALUES
(1, 'Rahul', 20, 'Male', 'Pune', 'Data Science'),
(2, 'Priya', 19, 'Female', 'Pune', 'Data Science'),
(3, 'Amit', 21, 'Male', 'Thane', 'Computer Science'),
(4, 'Sneha', 20, 'Female', 'Mumbai', 'Data Science'),
(5, 'Rohan', 22, 'Male', 'Nashik', 'Computer Science'),
(6, 'Neha', 19, 'Female', 'Pune', 'Data Science'),
(7, 'Akash', 21, 'Male', 'Mumbai', 'IT'),
(8, 'Pooja', 20, 'Female', 'Thane', 'IT'),
(9, 'Karan', 22, 'Male', 'Nagpur', 'Data Science'),
(10, 'Anjali', 19, 'Female', 'Mumbai', 'Computer Science');

CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(50),
    marks INT
);

INSERT INTO marks (mark_id, student_id, subject, marks)
VALUES
(1, 1, 'SQL', 85),
(2, 1, 'Python', 78),
(3, 2, 'SQL', 92),
(4, 2, 'Python', 88),
(5, 3, 'SQL', 76),
(6, 3, 'Python', 81),
(7, 4, 'SQL', 88),
(8, 4, 'Python', 91),
(9, 5, 'SQL', 69),
(10, 5, 'Python', 74),
(11, 6, 'SQL', 95),
(12, 6, 'Python', 93),
(13, 7, 'SQL', 73),
(14, 7, 'Python', 79),
(15, 8, 'SQL', 81),
(16, 8, 'Python', 86),
(17, 10, 'SQL', 90),
(18, 10, 'Python', 94);

-- 1. Show all students
SELECT * FROM students;

-- 2. Find students from Mumbai
SELECT *
FROM students
WHERE city = 'Mumbai';

-- 3. Find students older than 20
SELECT *
FROM students
WHERE age > 20;

-- 4. Count total students
SELECT COUNT(*) AS total_students
FROM students;

-- 5. Average age
SELECT AVG(age) AS average_age
FROM students;

-- 6. Number of students in each course
SELECT course, COUNT(*) AS total_students
FROM students
GROUP BY course;

-- 7. Connect students with their marks
SELECT students.name, marks.subject, marks.marks
FROM students
JOIN marks
ON students.student_id = marks.student_id;

-- 8. Average marks of each student
SELECT students.name, AVG(marks.marks) AS average_marks
FROM students
JOIN marks
ON students.student_id = marks.student_id
GROUP BY students.student_id, students.name;

-- 9. Top 3 students
SELECT students.name, AVG(marks.marks) AS average_marks
FROM students
JOIN marks
ON students.student_id = marks.student_id
GROUP BY students.student_id, students.name
ORDER BY average_marks DESC
LIMIT 3;
