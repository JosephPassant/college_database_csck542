-- Use the 'college' database
USE college;

-- Insert data into the admins table
-- Columns: forename, surname, username, user_password
-- Values: Provided for each admin
INSERT INTO admins (forename, surname, username, user_password) VALUES
('George', 'Lucas', 'george_lucas', SHA2('password1', 256)),
('Jeffrey', 'Abrams', 'jeffrey_abrams', SHA2('password2', 256));

-- Insert data into the teachers table
-- Columns: forename, surname, username, user_password
-- Values: Provided for each teacher
INSERT INTO teachers (forename, surname, username, user_password) VALUES
('Yoda', 'Master', 'master_yoda', SHA2('password3', 256)),
('Mace', 'Windu', 'mace_windu', SHA2('password4', 256)),
('Obi-Wan', 'Kenobi', 'obi-wan_kenobi', SHA2('password5', 256)),
('Ki-Adi', 'Mundi', 'ki-adi_mundi', SHA2('password6', 256)),
('Plo', 'Koon', 'plo_koon', SHA2('password7', 256)),
('Shaak', 'Ti', 'shaak_ti', SHA2('password8', 256)),
('Kit', 'Fisto', 'kit_fisto', SHA2('password9', 256));

-- Insert data into the students table
-- Columns: forename, surname, username, user_password
-- Values: Provided for each students
INSERT INTO students (forename, surname, username, user_password) VALUES
('Luke', 'Skywalker', 'luke_skywalker', SHA2('password10', 256)),
('Leia', 'Organa', 'leia_organa', SHA2('password11', 256)),
('Han', 'Solo', 'han_solo', SHA2('password12', 256)),
('Bacca', 'Chew', 'chew_bacca', SHA2('password13', 256)),
('Lando', 'Calrissian', 'lando_calrissian', SHA2('password14', 256)),
('Padme', 'Amidala', 'padme_amidala', SHA2('password15', 256)),
('Anakin', 'Skywalker', 'anakin_skywalker', SHA2('password16', 256)),
('Rey', 'Skywalker', 'rey_skywalker', SHA2('password17', 256)),
('FN', '2187', 'FN_2187', SHA2('password18', 256)),
('Poe', 'Dameron', 'poe_dameron', SHA2('password19', 256)),
('BB', '8', 'bb_8', SHA2('password20', 256)),
('C', '3PO', 'c_3po', SHA2('password21', 256)),
('D2', 'R2', 'r2_d2', SHA2('password22', 256)),
('Qui-Gon', 'Jinn', 'qui_gon_jinn', SHA2('password23', 256)),
('Shmi', 'Skywalker', 'shmi_skywalker', SHA2('password24', 256)),
('Bail', 'Organa', 'bail_organa', SHA2('password25', 256)),
('Mon', 'Mothma', 'mon_mothma', SHA2('password26', 256)),
('Wedge', 'Antilles', 'wedge_antilles', SHA2('password27', 256)),
('Admiral', 'Ackbar', 'admiral_ackbar', SHA2('password28', 256)),
('Rose', 'Tico', 'rose_tico', SHA2('password29', 256));

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
