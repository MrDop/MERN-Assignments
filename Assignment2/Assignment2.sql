create database projects;
use projects;

create table users(
email VARCHAR(50) PRIMARY KEY,
 password VARCHAR(20) NOT NULL,
 role ENUM('student', 'admin', 'Teacher') NOT NULL
 );

create table courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(20),
description VARCHAR(20),
fees INT,
start_date DATE,
end_date DATE,
video_expiry_days INT
);


create table student(
reg_no INT PRIMARY KEY auto_increment,
name VARCHAR(20),
email VARCHAR(50) UNIQUE,
course_id INT,
mobile_no INT,
profile_pic blob,

FOREIGN KEY (email) REFERENCES users(email),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


create table videos(
video_id INT PRIMARY KEY,
course_id INT,
title VARCHAR(20),
description VARCHAR(20),
youtube_url  VARCHAR(100),
added_at DATE,

FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO users (email, password, role) VALUES
('s1', 'pass1', 'student'),
('s2', 'pass2', 'student'),
('s3', 'pass3', 'student'),
('admin1', 'admin123', 'admin'),
('teacher1', 'teach123', 'Teacher');



INSERT INTO courses (course_id, course_name, description, fees, start_date, end_date, video_expiry_days) VALUES
(1, 'IIT-MERN-2025', 'MERN', 40000, '2025-12-20', '2026-01-20', 30),
(7, 'AI', 'course related to AI', 100000, '2025-12-24', '2026-01-24', 5),
(8, 'Android', 'Android course', 9999, '2025-12-24', '2026-01-24', 7),
(11, 'python', 'py', 10000, '2025-12-24', '2026-01-24', 20),
(3, 'IIT-MERN-2025-July', 'MERN batch', 40000, '2025-07-01', '2025-08-01', 25);


INSERT INTO student (name, email, mobile_no, course_id) VALUES
('student1', 's1', 123456, 1),
('student3', 's3', 123456, 1),
('student2', 's2', 123456, 3);


INSERT INTO videos (video_id, course_id, title, description, youtube_url, added_at) VALUES
(12, 1, 'MERN video 6', 'Module 6 lecture', 'https://youtu.be/vid6', '2025-11-26'),
(14, 1, 'MERN 10', 'Final project video', 'https://youtu.be/vid10', '2025-11-26');


-- Q1.Write a Sql query that will fetch all upcoming courses

   select * from courses;

-- Q2.Write a Sql query that will fetch all the registered students along with course name

    select reg_no,name,email,mobile_no,course_id,course_name
    FROM student 
    NATURAL JOIN courses;
    
  --  Q3. Write an SQL query to fetch the complete details of a student (based on their email) along with the details
   -- of the course they are enrolled in.
   
    select reg_no,name,email,mobile_no,course_id,course_name,description,fees,start_date,end_date,video_expiry_days
    FROM student 
    NATURAL JOIN courses;
    
-- Q4. Write an SQL query to retrieve the course details and the list of non-expired videos for a specific student
-- using their email address. A video is considered active (not expired) if its added_at date plus the course’s
-- video_expire_days has not yet passed compared to the current date.

SELECT course_id,course_name,start_date,end_date,video_expiry_days,video_id,title,added_at
FROM student
NATURAL JOIN courses
NATURAL JOIN videos
WHERE email='s1'
AND DATE_ADD(added_at,INTERVAL video_expiry_days DAY) >= CURRENT_DATE;
create database projects;
use projects;

create table users(
email VARCHAR(50) PRIMARY KEY,
 password VARCHAR(20) NOT NULL,
 role ENUM('student', 'admin', 'Teacher') NOT NULL
 );

create table courses(
course_id INT PRIMARY KEY,
course_name VARCHAR(20),
description VARCHAR(20),
fees INT,
start_date DATE,
end_date DATE,
video_expiry_days INT
);


create table student(
reg_no INT PRIMARY KEY auto_increment,
name VARCHAR(20),
email VARCHAR(50) UNIQUE,
course_id INT,
mobile_no INT,
profile_pic blob,

FOREIGN KEY (email) REFERENCES users(email),
FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


create table videos(
video_id INT PRIMARY KEY,
course_id INT,
title VARCHAR(20),
description VARCHAR(20),
youtube_url  VARCHAR(100),
added_at DATE,

FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO users (email, password, role) VALUES
('s1', 'pass1', 'student'),
('s2', 'pass2', 'student'),
('s3', 'pass3', 'student'),
('admin1', 'admin123', 'admin'),
('teacher1', 'teach123', 'Teacher');



INSERT INTO courses (course_id, course_name, description, fees, start_date, end_date, video_expiry_days) VALUES
(1, 'IIT-MERN-2025', 'MERN', 40000, '2025-12-20', '2026-01-20', 30),
(7, 'AI', 'course related to AI', 100000, '2025-12-24', '2026-01-24', 5),
(8, 'Android', 'Android course', 9999, '2025-12-24', '2026-01-24', 7),
(11, 'python', 'py', 10000, '2025-12-24', '2026-01-24', 20),
(3, 'IIT-MERN-2025-July', 'MERN batch', 40000, '2025-07-01', '2025-08-01', 25);


INSERT INTO student (name, email, mobile_no, course_id) VALUES
('student1', 's1', 123456, 1),
('student3', 's3', 123456, 1),
('student2', 's2', 123456, 3);


INSERT INTO videos (video_id, course_id, title, description, youtube_url, added_at) VALUES
(12, 1, 'MERN video 6', 'Module 6 lecture', 'https://youtu.be/vid6', '2025-11-26'),
(14, 1, 'MERN 10', 'Final project video', 'https://youtu.be/vid10', '2025-11-26');


-- Q1.Write a Sql query that will fetch all upcoming courses

   select * from courses;

-- Q2.Write a Sql query that will fetch all the registered students along with course name

    select reg_no,name,email,mobile_no,course_id,course_name
    FROM student 
    NATURAL JOIN courses;
    
  --  Q3. Write an SQL query to fetch the complete details of a student (based on their email) along with the details
   -- of the course they are enrolled in.
   
    select reg_no,name,email,mobile_no,course_id,course_name,description,fees,start_date,end_date,video_expiry_days
    FROM student 
    NATURAL JOIN courses;
    
-- Q4. Write an SQL query to retrieve the course details and the list of non-expired videos for a specific student
-- using their email address. A video is considered active (not expired) if its added_at date plus the course’s
-- video_expire_days has not yet passed compared to the current date.

SELECT course_id,course_name,start_date,end_date,video_expiry_days,video_id,title,added_at
FROM student
NATURAL JOIN courses
NATURAL JOIN videos
WHERE email='s1'
AND DATE_ADD(added_at,INTERVAL video_expiry_days DAY) >= CURRENT_DATE;










