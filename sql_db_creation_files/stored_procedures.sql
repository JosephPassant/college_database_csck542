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
    WHERE username = admin_username AND user_password = admin_password;

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
    WHERE username = admin_username AND user_password = admin_password;

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


-- Create a stored procedure named 'AssignStudentToCourse' to allow administrators to enroll a student
-- in a course that has been assigned to run in a semester
CREATE PROCEDURE AssignStudentToCourse(
    IN admin_username VARCHAR(30),             -- Input for admin username
    IN admin_password VARCHAR(255),            -- Input for admin password
    IN selected_student_id INT,                -- Input for selected student ID
    IN selected_course_semester_id INT         -- Input for selected course-semester ID
)
BEGIN
    -- Declare variables to hold counts
    DECLARE admin_count INT DEFAULT 0;         -- Variable to hold the count of matching admin records
    DECLARE existing_count INT DEFAULT 0;      -- Variable to hold the count of existing student-course assignments

    -- Validate admin credentials by counting matching records in the 'admins' table
    SELECT COUNT(*) INTO admin_count 
    FROM admins 
    WHERE username = admin_username AND user_password = admin_password;

    -- If admin credentials are valid (count is 1), proceed
    IF admin_count = 1 THEN
        -- Check if the student is already assigned to the course-semester by counting matching records
        SELECT COUNT(*) INTO existing_count
        FROM course_student
        WHERE student_id = selected_student_id AND course_semester_id = selected_course_semester_id;

        -- If the student is not already assigned to the course-semester (count is 0), assign them
        IF existing_count = 0 THEN
            INSERT INTO course_student (student_id, course_semester_id)
            VALUES (selected_student_id, selected_course_semester_id);
            SELECT 'Student successfully assigned to course' AS message;  -- Success message
        ELSE
            SELECT 'Student is already assigned the course' AS message;  -- Error message
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
    WHERE username = teacher_username AND user_password = teacher_password;

    -- Get the teacher_id for the authenticated teacher
    SELECT teacher_id INTO selected_teacher_id
    FROM teachers
    WHERE username = teacher_username AND user_password = teacher_password;

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

//
-- Reset the delimiter back to its default value
DELIMITER ;

