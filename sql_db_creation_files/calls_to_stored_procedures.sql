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