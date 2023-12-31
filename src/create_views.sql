-- Creates a view of which course are offered in what semester
CREATE VIEW CoursesOfferedInSemester AS
-- Select relevant columns to be included in the view
SELECT 
    c.course_name,       
    s.semester_name,     
    s.start_date,        
    s.end_date           
-- Specify the source table for the view
FROM 
    course_semester AS cs 
-- Join course_semester with courses on course_id
JOIN courses AS c ON cs.course_id = c.course_id
-- Join course_semester with semesters on semester_id
JOIN semesters AS s ON cs.semester_id = s.semester_id;
