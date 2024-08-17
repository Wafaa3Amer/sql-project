create table students(stu_id int PRIMARY KEY ,
    f_name varchar, 
	EnrollmentDate date);

insert into students(stu_id,f_name, EnrollmentDate )
values
(1,'John Doe', '2023-08-01'),
(2,'eyad rafek','2023-09-10'),
(3,'Alice Johnson', '2023-10-01');

create table courses (course_id int PRIMARY KEY  ,
	courseName varchar,credits int);

insert into courses(course_id,courseName , credits)
values
	(100,'Mathematics', 3),
(200,'Physics', 3),
(300,'Chemistry', 4); 

select*
from students,courses;

update courses
	set Credits = 4 
	where CourseName = 'Physics'; 

delete from students 
	where f_name='John Doe'; 



select * 
	from Students
	where EnrollmentDate > '2023-09-01'; 


select *
	from courses 
	where credits > 3; 

select count(*) as totalStudents 
	from students;

select avg(credits) as averageCredits 
	from courses;

alter table courses
	add constraint chkCredits 
	check (credits >= 0);


insert into students(stu_id,f_name, EnrollmentDate )
values
(1, 'John Doe', '2023-08-01');
	

create table Enrollments ( Enrollment_id int PRIMARY KEY ,
	stu_id int,
	course_id int,
	FOREIGN KEY (stu_id) REFERENCES students(stu_id), 
	FOREIGN KEY (course_id) REFERENCES courses(course_id));

insert into Enrollments
	(Enrollment_id,stu_id, course_id)
	values
	(10, 1, 100),
	(20 ,2 , 200), 
	(30, 3,300); 


select students.f_name,  
	courses.courseName 
	from Enrollments 
	join students on Enrollments.stu_id = students.stu_id 
	join courses on Enrollments.course_id = courses.course_id; 


select courseName,
	length (courseName) as courseNameLength  
	from courses; 


select *
	from students
	where stu_id in
	( select stu_id 
	from Enrollments 
	join courses on Enrollments.course_id = courses.course_id
	where courses.credits > 3 ); 

create view	StudentCourseView as select students.f_name, 
	Courses.courseName 
	from Enrollments 
	join students on Enrollments.stu_id = Students.stu_id 
	join courses on Enrollments.course_id = courses.course_id; 

create index idx_lastname on students(f_name); 


start transaction;
insert into students (stu_id ,f_name, EnrollmentDate)
	values (4,'Bob Miller', '2023-11-01');
	
insert into courses (courseName, credits) 
	values ('Biology', 4)




create table MixedData
	( ID INT PRIMARY KEY ,
	Name VARCHAR(100),
	CreatedAt date,
	Price DECIMAL(10, 2), 
	IsActive BOOLEAN ); 


insert into MixedData
	(Name, CreatedAt,Price, IsActive)
	values ('Product A', '2023-08-17 12:30:00', 19.99, TRUE), 
	('Product B', '2023-08-17 13:00:00', 25.50, FALSE);

select Name, CreatedAt, Price, IsActive 
	from MixedData
	where Price > 20.00 and IsActive = FALSE; 
