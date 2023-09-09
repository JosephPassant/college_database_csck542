-- Use the 'college' database
USE college;

-- Insert data into the admins table
-- Columns: forename, surname, username, user_password
-- Values: Provided for each admin
INSERT INTO admins (forename, surname, username, user_password) VALUES
('George', 'Lucas', 'george_lucas', 'password1'),
('Jeffrey', 'Abrams', 'jeffrey_abrams', 'password2');

-- Insert data into the teachers table
-- Columns: forename, surname, username, user_password
-- Values: Provided for each teacher
INSERT INTO teachers (forename, surname, username, user_password) VALUES
('Yoda', 'Master', 'master_yoda', 'password3'),
('Mace', 'Windu', 'mace_windu', 'password4'),
('Obi-Wan', 'Kenobi', 'obi_wan', 'password5'),
('Ki-Adi', 'Mundi', 'ki_adi_mundi', 'password6'),
('Plo', 'Koon', 'plo_koon', 'password7'),
('Shaak', 'Ti', 'shaak_ti', 'password8'),
('Kit', 'Fisto', 'kit_fisto', 'password9');

-- Insert data into the students table
-- Columns: forename, surname, username, user_password
-- Values: Provided for each students
INSERT INTO students (forename, surname, username, user_password) VALUES
('Luke', 'Skywalker', 'luke_skywalker', 'password10'),
('Leia', 'Organa', 'leia_organa', 'password11'),
('Han', 'Solo', 'han_solo', 'password12'),
('Bacca', 'Chew', 'chew_bacca', 'password13'),
('Lando', 'Calrissian', 'lando_calrissian', 'password14'),
('Padme', 'Amidala', 'padme_amidala', 'password15'),
('Anakin', 'Skywalker', 'anakin_skywalker', 'password16'),
('Rey', 'Skywalker', 'rey_skywalker', 'password17'),
('FN', '2187', 'FN_2187', 'password18'),
('Poe', 'Dameron', 'poe_dameron', 'password19'),
('BB', '8', 'bb_8', 'password20'),
('C', '3PO', 'c_3po', 'password21'),
('D2', 'R2', 'r2_d2', 'password22'),
('Qui-Gon', 'Jinn', 'qui_gon_jinn', 'password23'),
('Shmi', 'Skywalker', 'shmi_skywalker', 'password24'),
('Bail', 'Organa', 'bail_organa', 'password25'),
('Mon', 'Mothma', 'mon_mothma', 'password26'),
('Wedge', 'Antilles', 'wedge_antilles', 'password27'),
('Admiral', 'Ackbar', 'admiral_ackbar', 'password28'),
('Rose', 'Tico', 'rose_tico', 'password29');

-- Insert data into the course table
-- Column: course_name
-- Values: Provided for each course
INSERT INTO courses (course_name) VALUES
('Jedi 101'),
('The Force'),
('Ethics'),
('History'),
('Diplomacy'),
('Leadership'),
('Philosophy'),
('Medicine'),
('Combat'),
('Politics');

-- Insert data into the 'semesters' table
-- Columns: semester_name, start_date, end_date
-- Values: Provided for each semester
INSERT INTO semesters (semester_name, start_date, end_date) VALUES
('Fall 2023', '2023-09-01', '2023-12-20'),
('Spring 2024', '2024-01-15', '2024-05-15');
