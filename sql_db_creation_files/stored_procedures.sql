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

//
-- Reset the delimiter back to its default value
DELIMITER ;

