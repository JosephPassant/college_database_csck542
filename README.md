# college_database_csck542

The following guide will help you instal the database in MySQL Workbench.

First downlaod the directory to a local file path.

## Installation

The installation can be completed in two ways:

1. From Back Up File
2. From scratch Using SQL Scripts

### From Back Up File

Navigate to the directory where you downloaded the file and open the folder db_backup_files.

Open a new query tab in MySQL Workbench.

Run the following command to create a new database:

```sql
CREATE DATABASE college;
USE college;
```

Open the college_db_backup.sql file in MySQL Workbench and execute the script.

### From scratch Using SQL Scripts

Alternatively, you can create the database from scratch using the SQL scripts provided in the src folder.

Navigate to the directory where you downloaded the file and open the folder src.

Open all scripts in MySQL Workbench and execute them in the following order:
1. create_tables.sql
2. initial_data_entry.sql
3. stored_procedures.sql
4. create_views.sql

Optionally you can also execute the calls_to_stored_procedures.sql file to see the stored procedures in action.

This will assign courses to specific semsters, assign teachers and students to courses, and assign results to students.
Further this will show a table of courses and resuls for a specific student and show the students within a course taught by 
as specific teacher.

## Author
Joseph Passant
j.passant@liverpool.ac.uk
