CREATE DATABASE IF NOT EXISTS CH06_ICQ;
USE CH06_ICQ;

SET FOREIGN_KEY_CHECKS=0;
Drop table IF EXISTS Student_table;
drop table IF EXISTS faculty_table;
drop table IF EXISTS course_table;
drop table IF EXISTS registration_table;
SET FOREIGN_KEY_CHECKS=1;

create table faculty_table (
faculty_id integer,
faculty_name varchar(30),
CONSTRAINT F_T_PK PRIMARY KEY (faculty_id));

create table student_table (
student_id integer NOT NULL,
student_name varchar(30),
advisor_id integer,
CONSTRAINT S_T_PK PRIMARY KEY (student_id),
CONSTRAINT S_T_FK FOREIGN KEY (advisor_id) REFERENCES faculty_table(faculty_id));

create table course_table (
course_id varchar(20),
course_name varchar(20),
num_credits integer, 
instructor_id integer,
CONSTRAINT C_T_PK PRIMARY KEY (course_id),
CONSTRAINT C_T_FK FOREIGN KEY (instructor_id) REFERENCES faculty_table(faculty_id));

create table registration_table (
course_id char(8),
student_id integer,
grade integer,
CONSTRAINT R_T_PK PRIMARY KEY (course_id, student_id),
CONSTRAINT S_T_FK1 FOREIGN KEY (course_id) REFERENCES course_table(course_id),
CONSTRAINT S_T_FK2 FOREIGN KEY (student_id) REFERENCES student_table(student_id));

insert into faculty_Table values(1001, 'Johnson');
insert into faculty_table values(1010, 'George');
insert into faculty_table values(1020, 'William');

insert into student_table values (1111, 'William', 1001);
insert into student_Table values (2222, 'Baker', 1010);
insert into student_table values (3333, 'Smith', 1001);
insert into student_table values (4444, 'Jones', 1010);

insert into course_table values ('INFO 364', 'Data Base', 3, 1001);
insert into course_table values ('INFO 345', 'JAVA', 2, 1010);

insert into registration_Table values ('INFO 364', 1111, 4);
insert into registration_table values ('INFO 364', 2222, 2);
insert into registration_table values ('INFO 345', 2222, 3);
insert into registration_table values ('INFO 345', 3333, 4);

select * from faculty_table;
select * from student_table;
select * from registration_table;
select * from course_table;