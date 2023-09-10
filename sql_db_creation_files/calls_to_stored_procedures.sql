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


-- Calls the AssignStudentToCourse procedure in order to enroll students on
-- courses populating the course_student table
-- The course_semester table must be populated prior to calling this procedure
-- Input required (admin_password VARCHAR(255), selected_student_id INT,
-- selected_course_semester_id INT)
CALL AssignStudentToCourse('george_lucas', 'password1', 1, 1);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 2, 2);
CALL AssignStudentToCourse('george_lucas', 'password1', 3, 4);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 4, 6);
CALL AssignStudentToCourse('george_lucas', 'password1', 5, 9);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 6, 1);
CALL AssignStudentToCourse('george_lucas', 'password1', 7, 2);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 8, 4);
CALL AssignStudentToCourse('george_lucas', 'password1', 9, 6);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 10, 9);
CALL AssignStudentToCourse('george_lucas', 'password1', 11, 1);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 12, 2);
CALL AssignStudentToCourse('george_lucas', 'password1', 13, 4);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 14, 6);
CALL AssignStudentToCourse('george_lucas', 'password1', 15, 9);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 16, 9);
CALL AssignStudentToCourse('george_lucas', 'password1', 17, 1);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 18, 2);
CALL AssignStudentToCourse('george_lucas', 'password1', 19, 4);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 20, 6);
CALL AssignStudentToCourse('george_lucas', 'password1', 1,9);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 2, 9);
CALL AssignStudentToCourse('george_lucas', 'password1', 3, 2);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 4, 9);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 5, 6);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 6, 4);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 7, 1);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 8, 2);
CALL AssignStudentToCourse('jeffrey_abrams', 'password2', 9, 9);

-- Calls the AssignResultToCourse procedure in order to assign a Pass / Fail result
-- to a student
-- This updates the result collumn in the course_student table
-- Input required (teacher_username VARCHAR(30), teacher_password VARCHAR(255),
-- selected_student_id INT, selected_course_semester_id INT,
-- given_result ENUM('Pass', 'Fail'))
CALL AssignResultToStudent('master_yoda', 'password3', 1, 1, 'Pass');
CALL AssignResultToStudent('mace_windu', 'password4', 2, 2,'Fail');
CALL AssignResultToStudent('obi-wan_Kenobi', 'password5', 3, 4, 'Pass');
CALL AssignResultToStudent('ki-adi_mundi', 'password6', 4, 6, 'Pass');
CALL AssignResultToStudent('plo_koon', 'password7', 5, 9, 'Pass');

