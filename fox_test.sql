drop table student_class;
drop table student;
drop table class;

create table fox_student
  (
  ssn char(11) not null,
  lname varchar(40)  not null,
  fname varchar(20)  not null,
  phone char(12),
  address varchar(40),
  city varchar(20),
  state char(2),
  zip char(5),
  dob date,
  salary number  
);

create table fox_class
(
  	class_code varchar2(10),
	class_description varchar2(30)
);

create table fox_student_class
(
  	ssn char(11) not null,
  	class_code varchar2(10) not null	
);


alter table student add constraint student_pk primary key (ssn);
alter table student_class add constraint stu_cla_pk primary key(ssn,class_code);
alter table class add constraint clss_pk primary key(class_code);
alter table student_class add constraint st_fk foreign key (ssn) references student;
alter table student add constraint student_uk unique(lname,fname);
create index clss_desc_indx on class (class_description);

insert into student
values('409-56-7008', 'Bennet', 'Abraham',
'', '6223 Bateman St.', 'Berkeley', 'CA', '94705','26-feb-1988',10000);

insert into student
values ('213-46-8915', 'Green', 'Marjorie',
'', '309 63rd St. #411', 'Oakland', 'CA', '94618','25-feb-1989',20000 );

insert into student
values('238-95-7766', 'Gren', 'Cheryl',
'415 548-7723', '589 Darwin Ln.', 'Berkeley', 'CA', '94705',null,45000);

insert into student
values('998-72-3567', 'Greeenr', 'Albert',
'801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', '84152','24-feb-1992',15000);

insert into student
values('427-17-2319', 'Dull', 'Ann',
'415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301','23-feb-1993',30000);

insert into student
values('672-71-3249', 'Yokomoto', 'Akiko',
'415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', '94595','22-feb-1994',35000);

insert into student
values('267-41-2394', 'O''Leary', 'Michael',
'409-56-7008', '22 Cleveland Av. #14', 'San Jose', 'CA', '95128','12-feb-1995',32000);

insert into student
values('472-27-2349', 'Gringlesby', 'Burt',
'707 938-6445', 'PO Box 792', 'Covelo', 'NY', '95428','12-feb-1996',34000);

insert into student
values('527-72-3246', 'Greene', 'Morningstar',
'615 297-2723', '22 Graybar House Rd.', 'Nashville', 'TN', '37215','11-feb-1995',25000);

insert into student
values('999-00-0000', 'Al', 'Cal',
'615 297-2723', '22 Graybar House Rd.', 'Nashville', 'TN', '37215','06-feb-1998',22000);

insert into student
values('172-32-1176', 'White', 'Johnson',
'408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'ma', '94025','05-feb-1999',23000);

insert into student
values('712-45-1867', 'del Castillo', 'Innes',
'615 996-8275', '2286 Cram Pl. #86', 'Ann Arbor', 'MI', '48105','04-feb-1982',23500);

insert into student
values('846-92-7186', 'Hunter', 'Sheryl',
'415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', '94301','03-feb-1979',18000);

insert into student
values('486-29-1786', 'Locksley', 'Chastity',
'415 585-4620', '18 Broadway Av.', 'San Francisco', 'CA', '94130','02-feb-1978',15500);

insert into student
values('648-92-1872', 'Blotchet-Halls', 'Reginald',
'503 745-6402', '55 Hillsdale Bl.', 'Corvallis', 'OR', '97330','01-feb-1977',43000);





insert into class
values('37','Database Programming');

insert into class
values('3','Introduction to Computers');

insert into class
values('32','Introduction to C programming');

insert into class
values('34','Intro to principles');

insert into class
values('14A','Operating systems');

insert into class
values('1','');

insert into class
values('55','');






insert into student_class
values('409-56-7008', '37');

insert into student_class
values ('213-46-8915', '32');


insert into student_class
values('998-72-3567', '3');

insert into student_class
values('998-72-3567', '55');

insert into student_class
values('427-17-2319', '34');

insert into student_class
values('672-71-3249', '3');

insert into student_class
values('267-41-2394', '34');

insert into student_class
values('472-27-2349', '32');

insert into student_class
values('527-72-3246', '1');

insert into student_class
values('172-32-1176', '37');

insert into student_class
values('712-45-1867', '37');

insert into student_class
values('846-92-7186', '32');

insert into student_class
values('486-29-1786', '1');

insert into student_class
values('648-92-1872', '55');

/*Problem 1 */
SELECT fname, lname, dob, salary 
FROM student
WHERE dob > '01-01-1985';

/*Problem 2 */
SELECT ssn, CONCAT(LOWER(lname), UPPER(fname)) 
FROM student;

/*Problem 3 */
SELECT fname, lname, dob, salary
FROM student
WHERE lname LIKE '%a%' AND '%h%';

/*Problem 4 */
SELECT INSTR(fname, 'abr'), lname, salary, NVL(dob,'not born yet')
FROM student
WHERE age BETWEEN 15 AND 25;

/*Problem 5 */
SELECT fname, lname, dob, DECODE(salary <20000, 'rich', 'poor')
FROM student
WHERE dob = NOT null;

/*Problem 6 */
SELECT fname, lname, dob, salary
FROM student
WHERE fname NOT IN('Jack', 'John', 'Bob');

/*Problem 7 */
SELECT MONTHS_BETWEEN(SYSDATE, dob) AS years
FROM student;
WHERE (years + 20)/5;

/*Problem 8 */
SELECT SUBSTR(fname, 1, 3), lname, dob, salary
FROM student
WHERE salary > 10000 AND phone ='527%';