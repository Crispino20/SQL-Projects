


#1 - Create database and create a table 
#Database - TheTestingAcademy
    
    #Create Students table 
    #Student - id, name, address 
    #Course - id, name, price 
    #StudentCourses - will help us to have relations and queries 

show databases

CREATE database thetestingacademy;

use thetestingacademy;

show tables 

#Creating a Student table 
CREATE TABLE `students` (
    `id` bigint NOT NULL AUTO_INCREMENT ,
    `name` varchar (255) NOT NULL,
    `age` BIGINT NOT NULL,
    `phone` INT NOT NULL,
    CONSTRAINT `PRIMARY`PRIMARY KEY (`id`)
);

select * from students
#Shows the amount of columns there are within the table 
describe student 

drop table students
drop table studentcourses
ALTER table student rename students 

#Creating a Courses table 
CREATE TABLE `courses` (
    `id` bigint NOT NULL AUTO_INCREMENT ,
    `name` varchar (255) NOT NULL,
    `price` int,
    PRIMARY KEY(id)
);

select * from courses

#Creating StudentCourses table 
CREATE TABLE `studentcourses` (
    `student_id` bigint NOT NULL ,
    `course_id` bigint NOT NULL
)

#Adding FK constraint - these should always be added last lastly, affter table creation
alter table studentcourses 
add FOREIGN KEY (student_id) REFERENCES students(id);

alter table studentcourses 
add FOREIGN KEY (course_id) REFERENCES courses(id);


describe studentcourses



select * from student
where id in (1,2,4)


insert into students  (name, age, phone) values ("Sarah", "25","079898112");
insert into students  (name, age, phone) values ("Kim", "29","079898113");
insert into students  (name, age, phone) values ("Crispin", "32","079898114");

insert into courses (name, price) values ("Cloud Computing","300");
insert into courses (name, price) values ("Web Develpment","200");
insert into courses (name, price) values ("Software Testing","200");

insert into studentcourses (student_id, course_id) values ("1","1")
insert into studentcourses (student_id, course_id) values ("1","2")
insert into studentcourses (student_id, course_id) values ("2","2");
insert into studentcourses (student_id, course_id) values ("3","1");
insert into studentcourses (student_id, course_id) values ("3","2");
insert into studentcourses (student_id, course_id) values ("3","3");


select * from students 
select * from courses 
select * from studentcourses




select studentcourses.student_id, student.name, studentcourses.course_id, courses.name
    from studentcourses  
     join student  
        on student_id = student.id
     join courses 
        on studentcourses.course_id = courses.id 
    
        
#Updating records
update student 
set address = "Slade Green" where id = 1;

select * from student


#EMPLOYEE tables

CREATE table employee (
    id bigint NOT NULL AUTO_INCREMENT,
    firstname varchar (50) NULL,
    lastname varchar (50) NULL,
    salary bigint,
    PRIMARY KEY(id)
);


select * from employee 

insert into employee (firstname, lastname, salary) values ("James", "Lock", 25000)
insert into employee (firstname, lastname, salary) values ("Zainab", "Hassan", 35000)
insert into employee (firstname, lastname, salary) values ("Richard", "Mills", 50000)
insert into employee (firstname, lastname, salary) values ("Amaka", "Mensah", 60000)
insert into employee (firstname, lastname, salary) values ("Amieibi", "Jama", 60000)

# Limit restrits the number of rows returned
select * from employee limit 1


select * from employee
order by salary desc 

#MAX

select max(salary) from employee 


select * from employee where salary < 60000 limit 1 
#2nd top salary 

select * from employee 
where 
    salary < (select max(salary) from employee) limit 3;
    

# 2nd highest salary - think of it as discounting the highest salary and returning the 
select * from employee 
order by salary desc limit 1,1

# 2nd highest salary - think of it as discounting the highest salary 
# and returning the next 2 (2nd and 3rd) highest salaries
select * from employee 
order by salary desc limit 1,2


#Count
select count(firstname) from employee;

#Like 

select * from employee where firstname like "Ja%"

select count(id) from employee 
group by salary 

#After using Group by, you cannot use WHERE. Can only use HAVING

#TRUNCATE only clears all data from table but DROP deletes the table entirely 