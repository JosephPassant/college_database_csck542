USE college;

-- Calls the AssignCourseToSemester procedure in order to assign courses to semesters
-- populating the course_semester table
-- Inputs required (admin_username VARCHAR(30), admin_password VARCHAR(255),
-- selected_course_id INT, selected_semester_id INT)
CALL AssignCourseToSemester('george_lucas', 'password1', 1, 1);
CALL AssignCourseToSemester('george_lucas', 'password1', 3, 2);
CALL AssignCourseToSemester('george_lucas', 'password1', 5, 1);
CALL AssignCourseToSemester('george_lucas', 'password1', 7, 2);
CALL AssignCourseToSemester('george_lucas', 'password1', 9, 1);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 2, 2);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 4, 1);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 6, 2);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 8, 1);
CALL AssignCourseToSemester('jeffrey_abrams', 'password2', 10, 2);


-- Calls the AssignCourseToTeacher procedure in order to assign teachers to courses
-- The course_semester table must be populated prior to calling this procedure
-- This populates the course_teacher table
-- Inputs required (admin_username VARCHAR(30), admin_password VARCHAR(255),
-- selected_teacher_id INT, selected_course_semester_id INT)
CALL AssignCourseToTeacher('george_lucas', 'password1', 1, 1);
CALL AssignCourseToTeacher('george_lucas', 'password1', 2, 2);
CALL AssignCourseToTeacher('george_lucas', 'password1', 3, 4);
CALL AssignCourseToTeacher('jeffrey_abrams', 'password2', 4, 6);
CALL AssignCourseToTeacher('jeffrey_abrams', 'password2', 5, 9);

-- Calls the EnrollInCourse stored procedure to enroll a student and add student_id and
-- course_semester_id to the course_student table.alter
-- Inputs required (student_id (INT), user_password (VARCHAR(255), 
-- course_name(VARCHAR(255), semester_name VARCHAR(255))
CALL EnrollInCourse(1, 'password10', 'Jedi 101', 'Fall 2023');
CALL EnrollInCourse(2, 'password11', 'History', 'Fall 2023');
CALL EnrollInCourse(3, 'password12', 'Diplomacy', 'Fall 2023');
CALL EnrollInCourse(4, 'password13', 'Medicine', 'Fall 2023');
CALL EnrollInCourse(5, 'password14', 'Combat', 'Fall 2023');
CALL EnrollInCourse(6, 'password15', 'Jedi 101', 'Fall 2023');
CALL EnrollInCourse(7, 'password16', 'History', 'Fall 2023');
CALL EnrollInCourse(8, 'password17', 'Diplomacy', 'Fall 2023');
CALL EnrollInCourse(9, 'password18', 'Medicine', 'Fall 2023');
CALL EnrollInCourse(10, 'password19', 'Combat', 'Fall 2023');
CALL EnrollInCourse(11, 'password20', 'Jedi 101', 'Fall 2023');
CALL EnrollInCourse(12, 'password21', 'History', 'Fall 2023');
CALL EnrollInCourse(13, 'password22', 'Diplomacy', 'Fall 2023');
CALL EnrollInCourse(14, 'password23', 'Medicine', 'Fall 2023');
CALL EnrollInCourse(15, 'password24', 'Combat', 'Fall 2023');
CALL EnrollInCourse(16, 'password25', 'Jedi 101', 'Fall 2023');
CALL EnrollInCourse(17, 'password26', 'History', 'Fall 2023');
CALL EnrollInCourse(18, 'password27', 'Diplomacy', 'Fall 2023');
CALL EnrollInCourse(19, 'password28', 'Medicine', 'Fall 2023');
CALL EnrollInCourse(20, 'password29', 'Combat', 'Fall 2023');

-- Calls the AssignResultToCourse procedure in order to assign a Pass / Fail result
-- to a student
-- This updates the result collumn in the course_student table
-- Input required teacher_username VARCHAR(30), teacher_password VARCHAR(255),
-- selected_student_id INT, selected_course_semester_id INT,
-- given_result ENUM('Pass', 'Fail')
CALL AssignResultToStudent('master_yoda', 'password3', 1, 1, 'Pass');
CALL AssignResultToStudent('mace_windu', 'password4', 2, 2,'Fail');
CALL AssignResultToStudent('obi-wan_Kenobi', 'password5', 3, 4, 'Pass');
CALL AssignResultToStudent('ki-adi_mundi', 'password6', 4, 6, 'Pass');
CALL AssignResultToStudent('plo_koon', 'password7', 5, 9, 'Pass');
CALL AssignResultToStudent('master_yoda', 'password3', 6, 1, 'Pass');

-- Calls the GetStudentCoursesAndResults stored procedure to enable a student to view
-- their courses and assigned results. 
-- Input required is student_id INT, and the student user_password VARCHAR(255)
-- This shows the results for Student Rose Tico
CALL GetStudentCoursesAndResults(20, 'password29');

-- Calls the ViewStudentsInMyCourses stored procedure to enable a teacher to view 
-- the students in courses that they are teaching and their student_id, forename, surname
-- and result
-- This call shows the students in classes taught by Master Yoda
CALL ViewStudentsInMyCourses(1, 'password3');