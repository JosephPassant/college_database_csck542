-- Change the default delimiter to allow for stored procedure blocks
DELIMITER //

-- Create a stored procedure named 'AssignCourseToSemester' which enables admins to assign a course
-- to run in a given semester
CREATE PROCEDURE AssignCourseToSemester(
    IN admin_username VARCHAR(30),  -- Input for admin username
    IN admin_password VARCHAR(255), -- Input for admin password
    IN selected_course_id INT,      -- Input for selected course ID
    IN selected_semester_id INT     -- Input for selected semester ID
)
BEGIN
    -- Declare variables to hold counts
    DECLARE admin_count INT DEFAULT 0;    -- Variable to hold the count of matching admin records
    DECLARE existing_count INT DEFAULT 0; -- Variable to hold the count of existing course-semester assignments

    -- Validate admin credentials by counting matching records in the 'admins' table
    SELECT COUNT(*) INTO admin_count 
    FROM admins 
    WHERE username = admin_username AND user_password = SHA2(admin_password,256);

    -- If admin credentials are valid (count is 1), proceed
    IF admin_count = 1 THEN
        -- Check if the course is already assigned to the semester by counting matching records
        SELECT COUNT(*) INTO existing_count 
        FROM course_semester 
        WHERE course_id = selected_course_id AND semester_id = selected_semester_id;

        -- If the course is not already assigned to the semester (count is 0), assign it
        IF existing_count = 0 THEN
            INSERT INTO course_semester (course_id, semester_id) 
            VALUES (selected_course_id, selected_semester_id);
            SELECT 'Course successfully assigned to semester' AS message; -- Success message
        ELSE
            SELECT 'This course is already assigned to the given semester' AS message; -- Error message
        END IF;
    ELSE
        SELECT 'Invalid admin username or password' AS message; -- Error message for invalid admin credentials
    END IF;
END;


-- Create a stored procedure named 'AssignCourseToTeacher' which enables admins to assign a teacher to a course 
-- that has been assigned to run in a semester
CREATE PROCEDURE AssignCourseToTeacher(
    IN admin_username VARCHAR(30),             -- Input for admin username
    IN admin_password VARCHAR(255),            -- Input for admin password
    IN selected_teacher_id INT,                -- Input for selected teacher ID
    IN selected_course_semester_id INT         -- Input for selected course-semester ID
)
BEGIN
    -- Declare variables to hold counts
    DECLARE admin_count INT DEFAULT 0;         -- Variable to hold the count of matching admin records
    DECLARE existing_count INT DEFAULT 0;      -- Variable to hold the count of existing teacher-course assignments

    -- Validate admin credentials by counting matching records in the 'admins' table
    SELECT COUNT(*) INTO admin_count 
    FROM admins 
    WHERE username = admin_username AND user_password = SHA2(admin_password,256);

    -- If admin credentials are valid (count is 1), proceed
    IF admin_count = 1 THEN
        -- Check if the teacher is already assigned to the course-semester by counting matching records
        SELECT COUNT(*) INTO existing_count
        FROM course_teacher
        WHERE teacher_id = selected_teacher_id AND course_semester_id = selected_course_semester_id;

        -- If the teacher is not already assigned to the course-semester (count is 0), assign them
        IF existing_count = 0 THEN
            INSERT INTO course_teacher (teacher_id, course_semester_id)
            VALUES (selected_teacher_id, selected_course_semester_id);
            SELECT 'Teacher successfully assigned to course' AS message;  -- Success message
        ELSE
            SELECT 'Teacher is already assigned the course' AS message;  -- Error message
        END IF;
    ELSE
        SELECT 'Invalid admin username or password' AS message;  -- Error message for invalid admin credentials
    END IF;
END;

-- Create a stored procedure named 'AssignResultToStudent' that enables teachers of students on a course to assign
-- a Pass or Fail result to a student enrolled in the course
CREATE PROCEDURE AssignResultToStudent(
    IN teacher_username VARCHAR(30),            -- Input for teacher username
    IN teacher_password VARCHAR(255),           -- Input for teacher password
    IN selected_student_id INT,                 -- Input for selected student ID
    IN selected_course_semester_id INT,         -- Input for selected course-semester ID
    IN given_result ENUM('Pass', 'Fail')        -- Input for the result to be assigned
)
BEGIN
    -- Declare variables to hold counts and IDs
    DECLARE selected_teacher_id INT DEFAULT 0;  -- Variable to hold the teacher ID
    DECLARE teacher_count INT DEFAULT 0;        -- Variable to hold the count of matching teacher records
    DECLARE teacher_course_count INT DEFAULT 0; -- Variable to hold the count of teacher-course assignments
    DECLARE student_count INT DEFAULT 0;        -- Variable to hold the count of student-course enrollments

    -- Validate teacher credentials by counting matching records in the 'teachers' table
    SELECT COUNT(*) INTO teacher_count 
    FROM teachers 
    WHERE username = teacher_username AND user_password = SHA2(teacher_password,256);

    -- Get the teacher_id for the authenticated teacher
    SELECT teacher_id INTO selected_teacher_id
    FROM teachers
    WHERE username = teacher_username AND user_password = SHA2(teacher_password,256);

    -- Check if the teacher is assigned to the course for the given semester
    SELECT COUNT(*) INTO teacher_course_count
    FROM course_teacher
    WHERE teacher_id = selected_teacher_id AND course_semester_id = selected_course_semester_id;

    -- Validate teacher credentials and course assignment
    IF teacher_count = 0 THEN
        SELECT 'Invalid teacher username or password' AS message;  -- Error message for invalid teacher credentials
    ELSEIF teacher_course_count = 0 THEN
        SELECT 'Teacher not assigned to the course for the given semester' AS message;  -- Error message for unassigned teacher
    ELSE
        -- Check if the student is enrolled in the course for the given semester
        SELECT COUNT(*) INTO student_count
        FROM course_student
        WHERE student_id = selected_student_id AND course_semester_id = selected_course_semester_id;

        -- Validate student enrollment
        IF student_count = 0 THEN
            SELECT 'Student not enrolled in the course for the given semester' AS message;  -- Error message for unenrolled student
        ELSE
            -- Assign the result to the student for the course in the given semester
            UPDATE course_student
            SET result = given_result
            WHERE student_id = selected_student_id AND course_semester_id = selected_course_semester_id;

            SELECT 'Result successfully assigned to student' AS message;  -- Success message
        END IF;
    END IF;
END;

-- Create a stored procedure named 'EnrollInCourse' that enables students to enroll in a course
-- available in a given semester
CREATE PROCEDURE EnrollInCourse(
	IN studentID INT,                          -- Input for student ID
    IN student_password VARCHAR(255),          -- Input for student password
    IN selected_course_name VARCHAR(255),      -- Input for selected course name
    IN selected_semester_name VARCHAR(30)      -- Input for selected semester name
)
proc_label: BEGIN  -- Define a label at the beginning of the compound statement
	-- Declare variables for various checks and IDs
    DECLARE course_available INT;
    DECLARE is_already_enrolled INT;
    DECLARE selected_course_id INT;
    DECLARE selected_semester_id INT;
    DECLARE selected_course_semester_id INT;
    DECLARE actual_password VARCHAR(255);
    
	-- Declare a handler for duplicate key error
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
        SELECT 'Student is already enrolled in this course for the current semester' AS message;
    END;

    -- Verify the student's password
    SELECT user_password INTO actual_password 
    FROM students 
    WHERE student_id = studentID;
    
    IF actual_password != SHA2(student_password,256) THEN
        SELECT 'Invalid password' AS message;
        LEAVE proc_label;  -- Use LEAVE followed by the label name
    END IF;

    -- Get the selected_course_id and selected_semester_id
    SELECT course_id INTO selected_course_id 
    FROM courses 
    WHERE course_name = selected_course_name;
    
    SELECT semester_id INTO selected_semester_id 
    FROM semesters 
    WHERE semester_name = selected_semester_name;

    -- Check course availability by cross-referencing with course_semester table
    SELECT COUNT(*) INTO course_available
    FROM course_semester
    WHERE course_id = selected_course_id AND semester_id = selected_semester_id;

    -- Check if the student is already enrolled in the course for the current semester
    SELECT COUNT(*) INTO is_already_enrolled
    FROM course_student 
    WHERE course_semester_id = selected_course_semester_id AND student_id = studentID;

    -- If the course is available and the student is not already enrolled, then enroll the student
    IF course_available > 0 AND is_already_enrolled = 0 THEN
        SELECT course_semester_id INTO selected_course_semester_id 
        FROM course_semester 
        WHERE course_id = selected_course_id AND semester_id = selected_semester_id;
        
        INSERT INTO course_student (student_id, course_semester_id)
        VALUES (studentID, selected_course_semester_id);
    ELSE
        -- Output a message if the course is not available or the student is already enrolled
        IF course_available = 0 THEN
            SELECT 'Course is not available in the current semester' AS message;
        ELSE
            SELECT 'Student is already enrolled in this course for the current semester' AS message;
        END IF;
    END IF;
END;

-- Create a stored procedure named 'GetStudentCoursesAndResults' that enables students to view their
-- courses and results for each cours
CREATE PROCEDURE GetStudentCoursesAndResults(
	IN studentID INT,                          -- Input for student ID
    IN studentPassword VARCHAR(255)            -- Input for student password
)
proc_label: BEGIN
	-- Declare variables for password verification
    DECLARE actual_password VARCHAR(255);

    -- Verify the student's password
    SELECT user_password INTO actual_password 
    FROM students 
    WHERE student_id = studentID;

    IF actual_password != SHA2(studentPassword,256) THEN
        SELECT 'Invalid password' AS message;
        LEAVE proc_label;  -- Use LEAVE followed by the label name
    END IF;

    -- If password is verified, fetch the enrolled courses and grades
    SELECT 
        c.course_name,
        s.semester_name,
        cs.result  -- Assuming result is stored in course_student table
    FROM 
        course_student AS cs
    JOIN 
        course_semester AS csem ON cs.course_semester_id = csem.course_semester_id
    JOIN 
        courses AS c ON csem.course_id = c.course_id
    JOIN 
        semesters AS s ON csem.semester_id = s.semester_id
    WHERE 
        cs.student_id = studentID;
        
END;

-- Create a stored procedure named 'ViewStudentsInMyCourses' that enables teachers to view the list of students
-- enrolled in the courses they are teaching, along with the grades of those students
CREATE PROCEDURE ViewStudentsInMyCourses(
	IN teacherID INT,                          -- Input for teacher ID
    IN teacher_password VARCHAR(255)           -- Input for teacher password
)
proc_label: BEGIN
	-- Declare variables for password verification
    DECLARE actual_password VARCHAR(255);
    
    -- Verify the teacher's password
    SELECT user_password INTO actual_password 
    FROM teachers 
    WHERE teacher_id = teacherID;
    
    IF actual_password != SHA2(teacher_password, 256) THEN
        SELECT 'Invalid password' AS message;
        LEAVE proc_label;  -- Use LEAVE followed by the label name
    END IF;

    -- Query to get the list of students enrolled in the courses that the teacher teaches, along with their result
    SELECT 
        c.course_name,
        s.student_id,
        s.forename,
        s.surname,
        cs.result
    FROM 
        teachers AS t
    JOIN 
        course_teacher AS ct ON t.teacher_id = ct.teacher_id
    JOIN 
        course_semester AS csem ON ct.course_semester_id = csem.course_semester_id
    JOIN 
        courses AS c ON csem.course_id = c.course_id
    JOIN 
        course_student AS cs ON csem.course_semester_id = cs.course_semester_id
    JOIN 
        students AS s ON cs.student_id = s.student_id
    WHERE 
        t.teacher_id = teacherID;
END;
//
-- Reset the delimiter back to its default value
DELIMITER ;

