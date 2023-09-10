CREATE DATABASE college;
USE college;
/*
  Create the admin table to store administrator details.
  - admin_id: Unique identifier for each administrator
  - forename: First name of the administrator
  - surname: Last name of the administrator
  - username: Unique username for login, only unique across all administrators
  - user_password: password for secure login
*/
CREATE TABLE admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    forename VARCHAR(50)NOT NULL,
    surname VARCHAR(50)NOT NULL,
    username VARCHAR(30) UNIQUE NOT NULL,
    user_password VARCHAR(255) NOT NULL
);

/*
  Create the teacher table to store teacher details.
  - teacher_id: Unique identifier for each teacher
  - forename: First name of the teacher
  - surname: Last name of the teacher
  - username: Unique username for login, only unique across all teachers
  - user_password: Password for secure login
*/

CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    forename VARCHAR(50)NOT NULL,
    surname VARCHAR(50)NOT NULL,
    username VARCHAR(30) UNIQUE NOT NULL,     
    user_password VARCHAR(255) NOT NULL            
);

/*
  Create the student table to store student details.
  - student_id: Unique identifier for each student
  - forename: First name of the student
  - surname: Last name of the student
  - username: Unique username for login, only unique across all students
  - user_password: Password for secure login
*/

CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    forename VARCHAR(50)NOT NULL,
    surname VARCHAR(50)NOT NULL,
    username VARCHAR(30) UNIQUE NOT NULL,     
    user_password VARCHAR(255) NOT NULL            
);

/*
  Create the courses table to store course details.
  - semester_id: Unique identifier for each semester
  - semester_name: Name of the semester
  - start_date: Start date of the semester
  - end_date: End date of the semester
*/ 

CREATE TABLE courses (
	course_id INT AUTO_INCREMENT PRIMARY KEY,
	course_name VARCHAR(255) NOT NULL
);

/*
  Create the semesters table to store semester details.
  - semester_id: Unique identifier for each course
  - course_name: Name of the course
*/ 

CREATE TABLE semesters (
	semester_id INT AUTO_INCREMENT PRIMARY KEY,
    semester_name VARCHAR(30)NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
    );

/*
  Create the course_semester table to store the details of courses that are running
  each semester and manage the many to many relationship between courses and semester.
  - course_semester_id: Unique identifier for course running in a semester
  - course_id: the unique course_id fromthe courses table.
  - semester_id: the unique semester_id from the semesters table
*/

CREATE TABLE course_semester (
	course_semester_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    semester_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (semester_id) REFERENCES semesters(semester_id),
    UNIQUE (course_id, semester_id) -- ENsures taht each course-semester combination is unique
    );

/*
  Create the course_teacher table to store the details of each course
  and manage the many to many relationship between teachers and courses.
  - course_teacher_id: Unique identifier for course teachers
  - teacher_id: the unique teacher_id from the teachers table
  - couse_semester_id: The unique course_semester_id from the course_semester table
  that shows the courses running in each semester
*/ 

CREATE TABLE course_teacher (
course_teacher_id INT AUTO_INCREMENT PRIMARY KEY,
teacher_id INT, 
course_semester_id INT,
FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
FOREIGN KEY (course_semester_id) REFERENCES course_semester(course_semester_id),
UNIQUE (teacher_id, course_semester_id)
);

/*
  Create the course_student table to store the details of each course
  and manage the many to many relationship between students and courses.
  - course_student_id: Unique identifier for course students
  - student_id: the unique student_id from the students table
  - couse_semester_id: The unique course_semester_id from the course_semester table
  that shows the courses running in each semester
  - result: the assigned grade for the student and course (pass / fail)
*/ 

CREATE TABLE course_student (
course_student_id INT AUTO_INCREMENT PRIMARY KEY,
student_id INT, 
course_semester_id INT,
result ENUM('pass', 'fail'),
FOREIGN KEY (student_id) REFERENCES students(student_id),
FOREIGN KEY (course_semester_id) REFERENCES course_semester(course_semester_id),
UNIQUE (student_id, course_semester_id)
);