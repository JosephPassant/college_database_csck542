-- Calls the AssignCourseToSemester procedure in order to assign courses to semesters
-- populating the course_semester table
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
CALL AssignCourseToTeacher('george_lucas', 'password1', 1, 1);
CALL AssignCourseToTeacher('george_lucas', 'password1', 2, 2);
CALL AssignCourseToTeacher('george_lucas', 'password1', 3, 4);
CALL AssignCourseToTeacher('jeffrey_abrams', 'password2', 4, 6);
CALL AssignCourseToTeacher('jeffrey_abrams', 'password2', 5, 9);
