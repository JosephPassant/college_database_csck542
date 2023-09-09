-- Creates a view of which course are offered in what semester
CREATE VIEW CoursesOfferedInSemester AS
-- Select relevant columns to be included in the view
SELECT 
    c.course_name,       -- Name of the course from the 'courses' table
    s.semester_name,     -- Name of the semester from the 'semesters' table
    s.start_date,        -- Start date of the semester from the 'semesters' table
    s.end_date           -- End date of the semester from the 'semesters' table
-- Specify the source table for the view
FROM 
    course_semester AS cs  -- 'course_semester' table serves as the base table
-- Join the 'course_semester' table with the 'courses' table on 'course_id'
JOIN courses AS c ON cs.course_id = c.course_id
-- Join the 'course_semester' table with the 'semesters' table on 'semester_id'
JOIN semesters AS s ON cs.semester_id = s.semester_id;
