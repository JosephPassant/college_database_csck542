USE college;

-- Calls the AssignCourseToSemester procedure in order to assign courses to semesters
-- populating the course_semester table
-- Inputs required (admin_username VARCHAR(30), admin_password VARCHAR(255),
-- selected_course_id INT, selected_semester_id INT)
CALL AssignCourseToSemester('george_lucas', 'password1', 1, 1);
CALL AssignCourseToSemester('george_lucas', 'password1', 2, 1);
CALL AssignCourseToSemester('george_lucas', 'password1', 3, 1);
CALL AssignCourseToSemester('george_lucas', 'password1', 4, 1);
CALL AssignCourseToSemester('george_lucas', 'password1', 5, 1);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 6, 2);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 7, 2);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 8, 2);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 9, 2);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 10, 2);


-- Calls the AssignCourseToTeacher procedure in order to assign teachers to courses
-- The course_semester table must be populated prior to calling this procedure
-- This populates the course_teacher table
-- Inputs required (admin_username VARCHAR(30), admin_password VARCHAR(255),
-- selected_teacher_id INT, selected_course_semester_id INT)
CALL AssignCourseToTeacher('george_lucas', 'password1', 1, 1);
CALL AssignCourseToTeacher('george_lucas', 'password1', 2, 2);
CALL AssignCourseToTeacher('george_lucas', 'password1', 3, 3);
CALL AssignCourseToTeacher('jeffrey_abrams', 'password2', 4, 4);
CALL AssignCourseToTeacher('jeffrey_abrams', 'password2', 5, 5);

-- Calls the EnrollInCourse stored procedure to enroll a student and add student_id and
-- course_semester_id to the course_student table.alter
-- Inputs required (student_id (INT), user_password (VARCHAR(255), 
-- course_name(VARCHAR(255), semester_name VARCHAR(255))
CALL EnrollInCourse(1, 'password10', 'Jedi 101', 'Fall 2023');
CALL EnrollInCourse(2, 'password11', 'The Force', 'Fall 2023');
CALL EnrollInCourse(3, 'password12', 'Ethics', 'Fall 2023');
CALL EnrollInCourse(4, 'password13', 'History', 'Fall 2023');
CALL EnrollInCourse(5, 'password14', 'Diplomacy', 'Fall 2023');
CALL EnrollInCourse(6, 'password15', 'Jedi 101', 'Fall 2023');
CALL EnrollInCourse(7, 'password16', 'The Force', 'Fall 2023');
CALL EnrollInCourse(8, 'password17', 'Ethics', 'Fall 2023');
CALL EnrollInCourse(9, 'password18', 'History', 'Fall 2023');
CALL EnrollInCourse(10, 'password19', 'Diplomacy', 'Fall 2023');
CALL EnrollInCourse(11, 'password20', 'Jedi 101', 'Fall 2023');
CALL EnrollInCourse(12, 'password21', 'The Force', 'Fall 2023');
CALL EnrollInCourse(13, 'password22', 'Ethics', 'Fall 2023');
CALL EnrollInCourse(14, 'password23', 'History', 'Fall 2023');
CALL EnrollInCourse(15, 'password24', 'Diplomacy', 'Fall 2023');
CALL EnrollInCourse(16, 'password25', 'Jedi 101', 'Fall 2023');
CALL EnrollInCourse(17, 'password26', 'The Force', 'Fall 2023');
CALL EnrollInCourse(18, 'password27', 'Ethics', 'Fall 2023');
CALL EnrollInCourse(19, 'password28', 'History', 'Fall 2023');
CALL EnrollInCourse(20, 'password29', 'Diplomacy', 'Fall 2023');

-- Calls the AssignResultToCourse procedure in order to assign a Pass / Fail result
-- to a student
-- This updates the result collumn in the course_student table
-- Input required teacher_username VARCHAR(30), teacher_password VARCHAR(255),
-- selected_student_id INT, selected_course_semester_id INT,
-- given_result ENUM('Pass', 'Fail')
CALL AssignResultToStudent('master_yoda', 'password3', 1, 1, 'Pass');
CALL AssignResultToStudent('mace_windu', 'password4', 2, 2,'Fail');
CALL AssignResultToStudent('obi-wan_Kenobi', 'password5', 3, 3, 'Pass');
CALL AssignResultToStudent('ki-adi_mundi', 'password6', 4, 4, 'Pass');
CALL AssignResultToStudent('plo_koon', 'password7', 5, 5, 'Pass');
CALL AssignResultToStudent('master_yoda', 'password3', 6, 1, 'Pass');

-- Calls the GetStudentCoursesAndResults stored procedure to enable a student to view
-- their courses and assigned results. 
-- Input required is student_id INT, and the student user_password VARCHAR(255)
-- This shows the results for Student Luke Skywalker
CALL GetStudentCoursesAndResults(1, 'password10');

-- Calls the ViewStudentsInMyCourses stored procedure to enable a teacher to view 
-- the students in courses that they are teaching and their student_id, forename, surname
-- and result
-- Input required is teacher_id and teacher user_password
-- This call shows the students in courses taught by Master Yoda
CALL ViewStudentsInMyCourses(1, 'password3');