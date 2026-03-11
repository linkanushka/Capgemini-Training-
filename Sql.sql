create table students(
name varchar(255),
id varchar(255),
dob int
);
select* from students;
insert into students (name ,id ,dob)
values('anu',01,25);
select * from students;
Insert into students(name,id,dob)
Values (gungun,02,23),
('zia',04,24),
('anamika',05,30);
select * from students;
Alter table students
Add subject varchar(255);
select *from students 
order by dob desc;
select *from students
order by name desc ;
select *from students 
limit 3;
select * from students
limit 2 offset 3;
select min(dob)
from students;
drop table students ;
CREATE TABLE students (
  student_id INT PRIMARY KEY,
  name       VARCHAR(50) NOT NULL,
  dept       VARCHAR(30)
);

CREATE TABLE enrollments (
  enroll_id   INT PRIMARY KEY,
  student_id  INT,
  course      VARCHAR(50) NOT NULL,
  fee_paid    BOOLEAN,
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO students (student_id, name, dept) VALUES
(1, 'Anushka', 'CSE'),
(2, 'Riya',    'IT'),
(3, 'Aman',    'ECE'),
(4, 'Neha',    'CSE');

INSERT INTO enrollments (enroll_id, student_id, course, fee_paid) VALUES
(101, 1, 'DBMS',   TRUE),
(102, 1, 'Java',   TRUE),
(103, 2, 'DBMS',   FALSE),
(104, 5, 'Python', TRUE);  

drop table student;
drop table enrollments;
DROP TABLE IF EXISTS emp;

CREATE TABLE emp (
  empno decimal(4,0) NOT NULL,
  ename varchar(10) default NULL,
  job varchar(9) default NULL,
  mgr decimal(4,0) default NULL,
  hiredate date default NULL,
  sal decimal(7,2) default NULL,
  comm decimal(7,2) default NULL,
  deptno decimal(2,0) default NULL
);

DROP TABLE IF EXISTS dept;

CREATE TABLE dept (
  deptno decimal(2,0) default NULL,
  dname varchar(14) default NULL,
  loc varchar(13) default NULL
);

INSERT INTO emp VALUES ('7369','SMITH','CLERK','7902','1980-12-17','800.00',NULL,'20');
INSERT INTO emp VALUES ('7499','ALLEN','SALESMAN','7698','1981-02-20','1600.00','300.00','30');
INSERT INTO emp VALUES ('7521','WARD','SALESMAN','7698','1981-02-22','1250.00','500.00','30');
INSERT INTO emp VALUES ('7566','JONES','MANAGER','7839','1981-04-02','2975.00',NULL,'20');
INSERT INTO emp VALUES ('7654','MARTIN','SALESMAN','7698','1981-09-28','1250.00','1400.00','30');
INSERT INTO emp VALUES ('7698','BLAKE','MANAGER','7839','1981-05-01','2850.00',NULL,'30');
INSERT INTO emp VALUES ('7782','CLARK','MANAGER','7839','1981-06-09','2450.00',NULL,'10');
INSERT INTO emp VALUES ('7788','SCOTT','ANALYST','7566','1982-12-09','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7839','KING','PRESIDENT',NULL,'1981-11-17','5000.00',NULL,'10');
INSERT INTO emp VALUES ('7844','TURNER','SALESMAN','7698','1981-09-08','1500.00','0.00','30');
INSERT INTO emp VALUES ('7876','ADAMS','CLERK','7788','1983-01-12','1100.00',NULL,'20');
INSERT INTO emp VALUES ('7900','JAMES','CLERK','7698','1981-12-03','950.00',NULL,'30');
INSERT INTO emp VALUES ('7902','FORD','ANALYST','7566','1981-12-03','3000.00',NULL,'20');
INSERT INTO emp VALUES ('7934','MILLER','CLERK','7782','1982-01-23','1300.00',NULL,'10');

INSERT INTO dept VALUES ('10','ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES ('20','RESEARCH','DALLAS');
INSERT INTO dept VALUES ('30','SALES','CHICAGO');
INSERT INTO dept VALUES ('40','OPERATIONS','BOSTON');
select * from emp;
select *from dept;
select ename from emp;
select ename,sal from emp;
select sal from emp;
-- dispalay salary of employee with duplicate
select distinct sal from emp;
-- display employee name ,salary  without duplicate
select  distinct ename,  sal
from emp;
--diplay salary of employee with bonus of 1000 ruppee
select  ename ,sal ,sal+1000 from emp;
--if deduction of 10000;
-- display employee name, salary, and annual salary  of employee;
select ename,sal, sal*12 as annual_sal from emp;
--display employee name, salary with hike of 10%
select ename ,sal , sal+sal*0.1 as new_Sal
from emp;
select ename,sal,sal-sal*0.1 as new_sal from emp;
select ename,sal,sal-sal*0.1  new_sal from emp;
select ename,sal,sal-sal*0.1  "new salary" from emp;
--waqtd name and salary with monthly hike of 50
select ename,sal, sal+50 as hike from emp;
--waqtd name and annualsalary with deduction of 10%
select ename ,sal , sal*12  as annual_sal, sal*12-sal*0.1 as anunal_sal_with_ded from emp;
--waqtd total salary given to each employee (sal +comm);
select ename ,sal,comm, sal+nvl(comm,0) as tot_sal  from emp;
--- waqtd details of all the employee along with annual salary 
select * ,sal*12 as annual_sal from emp;  -- select emp.*
--wqtd name and designitaion along with 100 penalty min salary
select ename,job,sal-100 as penalty from emp;
--waqtd employee name, department number of employees working in dept no 20
select ename, deptno from emp  where deptno=20 ;
-- display name and salry of employee who are earining more than 2000
select ename ,sal from emp where sal>2000;  -- where clause executes after the execution of from clause
--display the details of employee  who are working as manager
select * from emp where job='MANAGER';  ---sql is not case sensitve but values are 
-- display name and hire date of employees who are hired after 1981
select ename ,hiredate from emp where hiredate>'1981-12-31'; --- where hiredate>year(1981)
--- waqtd name and salary and annual salary  of employees if annul salary is more than 12000
select ename ,sal ,sal*12 as annual_sal  from emp where sal*12>12000;
select ename||' '||sal from emp;
select 'Mr '||ename from emp;
-- concat('string 1','String 2')
select ename||' is working as '||job||' and earning salary of '||sal from emp;
select ename||' is working as '||job||' and earning salary of '||sal from emp where ename='SMITH';
-- display the details of employee working in depno 20 and earning salary more than 2000
select * from emp where deptno=20 and sal >2000;
--display the name deptno of employees wjo are woring in depet no 10,20
select ename ,deptno from emp where deptno=10 or deptno=20;
--display the detail of employee who are earning more than 2000 in deptno 10,20
select * from emp where sal>2000 and (deptno=10 or deptno=20);
--display the details of employee who are not working as salesman and analyst
select * from emp where ( job != 'SALESMAN' and  job!='ANALYST');
select * from emp where not (  job='SALESMAN' and job= 'ANALYST');
select * from emp where not   job='SALESMAN' and not job= 'ANALYST' ;
--display name and deptno of employees working in dept no 10 and deptno 20
select ename, deptno from emp where deptno in(10,20);
--display name and deptno of employees not  working in dept no 10 and deptno 20
select ename, deptno from emp where deptno not in(10,20);
--display name and salary of employees   who are earning salary in the range of 1000 to 3000
select ename ,sal from emp where sal between 1000 and 3000;
--display the details of employee who are hired in the year of 1981
select * from emp where hiredate between '1981-01-01' and '1981-12-31';
--display the details of employee who are not earning salary in the range of 1000 to 3000
select * from emp where sal not between 1000 and 3000;
--display details of employees who are not earning commmison
select *from emp where comm is null;
select * from emp where comm is not null;
--display the details of employee who are earning salary but not commision
select *from emp where sal is not null and comm is null;
--display names of employee whose names start with s
select * from emp where ename like 'S%';
--display names of employee whose name consist of character a
select * from emp where ename like '%A%';
--display the details of employees whose name consist of charcater a two times
select *from emp where ename like '%A%A%';
select *from emp where ename like '%A%A%' and ename not like '%A%A%A%' ;
--display name and salary of employee  who are earning 4 digit of salary
 select * from emp where round(sal) like '____';
select * from emp where sal between 1000 and 9999;
select *  from emp where round(sal)::text like'____';
--display the details of employee who are hired in the month of feb;
select * from emp where hiredate :: text like'____-02-__';
--display the employee name who doesnot start with s
select * from emp where ename not like 'S%';
-- display the names of employee whose name start with a or s
select * from emp where ename like'A%' or  ename like 'S%';
--display the names of employee whose naem start  with  vowels
select * from emp where ename like 'A%' or ename like 'E% 'or ename like 'I% 'or ename like 'O% 'or ename like 'U% ';
--display the details of whose name start with consonent and end with vowel
select * from emp where (ename not like 'A%' or ename not like 'E%' or ename not like 'I%' or  ename not like 'O% ' or ename not like 'U%' ) 
and (ename like '%A' or ename like '%E'or ename like '%I'or ename like '%O'or ename like '%U');
  select * from emp where mgr is not null and deptno=10;
  select * from emp where comm is null and job='CLERK';
  select * from emp where  mgr is null  and (deptno=10 or deptno=30); 
  select * from emp where ename like 'J%' and ename like '%S';
  select * from emp where round(sal) :: text like'____';
  select * from emp where ename like '_____';
  select * from emp where hiredate :: text like '1982-__-01';
  select * from emp where ename like'A____A';
  select * from emp where job like '%MAN%';
  select * from emp where ename like'%S';
  select * from emp where job='ANALYST' and round(sal)::text like'____';
  select *from emp where hiredate :: text like '____-01-__';
  select * from emp where ename like'%L%L%' and job='MANAGER';
 select * from emp where ename like'A%' or ename like 'J%' or ename like 'S%';
 select * from emp where ename like '__A%';
  select * from emp;
  select ename,length(ename) from emp;
  --display the names of employee whose name is eectly four charchter##
  select ename from emp where length(ename)=4;
  select upper('smith');
  select lower('SMITH');
  select initcap('anushka');
  select substr('QSPIDERS',2,3);
  select substr('QSPIDERS',2); ---if length not mentioned then it will extractt whole length till end
  select substr('QSPIDERS',-3,2);
  SELECT RIGHT('QSPIDERS', 3);
  SELECT Left('QSPIDERS', 3);
  select substring(ename ,3,2) from emp;
  select right(ename ,3) from emp;
  select left(ename ,3) from emp;
  -- for locate function in postgress there is position() and strpos()
  select position('a' in 'malayalam');
  select strpos('malayalam','a');
SELECT POSITION('a' IN SUBSTRING('malayalam' FROM 3)) + 2;
select substring('abc@gmail.com' from position('@' in 'abc@gmail.com') );
-- round() , ceil() and floor()
select current_date;
select now();
select current_timestamp;
select extract(year from now());
select extract(month from now());
select extract(day from now());
select extract (minute from now());
select extract (hour from now());
select extract (second from now());
select emp.* from emp;
--retrive all emp who hired on friday
--to_char() -- it convert date into format model
--day-Monday
--dy-mon
--dd-16
--d-1
SELECT *, TO_CHAR(hiredate,'FMday') AS day
FROM emp
WHERE TO_CHAR(hiredate,'FMday') = 'friday';
SELECT *, TO_CHAR(hiredate,'day') AS day
FROM emp
WHERE TO_CHAR(hiredate,'day') = 'friday   ';

--display the details of employee who hired in the  year 1981 and in month of feb ,december and april march april may  

SELECT *, TO_CHAR(hiredate,'yyyy') AS year
FROM emp
WHERE TO_CHAR(hiredate,'yyyy') = '1981' )
and to_char(hiredate,'FMMON') in ('FEB','APR','DEC');
T *
FROM emp
WHERE TO_CHAR(hiredate,'YYYY') = '1981'
AND TO_CHAR(hiredate,'FMMON') IN ('FEB','APR','DEC');
select now() + interval'1 day';
select now() - interval'1 day';
select now() - interval'3 month';
select now() - interval'1 year';
--who hired in last 2 year
 select * from emp where hiredate>current_date- interval '45 year';
 select age(current_date , '2025-01-01');
 select extract(year from age(current_date,'2025-01-01')) exp;
 --retrive the employeee who have 10 years of exprience
 select * from emp
 where extract(year from age(current_date ,hiredate))>=10;
select ename, sal,comm,sal+coalesce(comm,0) as total_sal from emp;
select coalesce('null','apple','mango');
select coalesce('apple','null','mango');
select coalesce('null','null','null','banana');
select max(sal) from emp;
select min(sal) from emp;
select ename, max(sal) from emp ;
select count(comm) from emp;
select count(*) from emp;
--display number of employees whose name consst of charcter a
select count(ename) from emp where ename like '%A%';

--display maximum salary , minimum salasry and average salary of all the employees working in deptno 20
select max(sal) as max, min(sal) as min,avg(sal) as avg from emp where deptno=20;

select *from emp;
--display number of emplyees and total salary of all the employees who is earning more than 1700
select count(ename) as emplyee,sum(sal)as sal from emp where sal>1700;
--display no of employees in each dept
select count(*),deptno from emp group by deptno;
--display no of employees in each dept having salary greater than 2000
select count(*),deptno from emp where sal>2000 group by deptno;
--display max sal &min sal given to an employee in each desination
select max(sal), min(sal),job from emp group by job;
--display no of times saalry are repeated in employee table
select count(sal),sal from emp group by sal;
--display average salary given to the employe's in each job
select avg(sal),sal from emp group by sal;
--dispplay no of employees earning commision in each dept
select count(comm),deptno from emp group by deptno;
--display no of employees in each dept only if there is atleast  4 employee

select count(*),deptno 
from emp 
group by deptno
having count(*)>=4;
  --display no of employees in each dept having atleast 2 employee in it,and there name consist of char A and S
  select count(*),deptno
  from emp 
  where ename like '%A%' or ename like '%S%'
  group by deptno
  having count(*)>=2;
  --display the salary which repeated in emp table
   select count(*) , sal
   from emp
   group by sal;
   --display job and salary of each job ,if the tata slary of each job is more than 9500
select sum(sal),job
from emp
group by job
having sum(sal)>9500;
--calculate the avg salary of all employee and display if only if salary exceeds 55000
select avg(sal),ename
from emp
group by ename
having avg(sal)>55000;
--waqtd no of emp earning sal more than 1200 in each job and total salary needed to pay emp of each job must exceed 3800
select count(*),job
from emp
where sal>1200
group by job
having sum(sal)>3800;
--waqtd job and max sal of emplyee in each job if the max sal exceeds 2600
select max(sal),job
from emp
group by job
having max(sal)>2600;
--waqtd the hiredate which are duplicate in emp table
select count(hiredate),hiredate
from emp
group by hiredate
having count(hiredate)>1;
--waqtd min and max salaries of each job if min sal is more than 1000 and max sal is less than 5000
select max(sal),min(sal),job
from emp
group by job
having max(sal)<5000 and min(sal)>1000;
--waqtd deptno and number of emp working only if there are 2 emp working in each dept as manager
select count(ename),deptno
from emp
where job='MANAGER'
group by deptno
having count(job)>=2;
select ename from emp order by ename desc;
select sal from emp where job='MANAGER' order by sal desc;
--waqtd no of times salaries are repeated 
select count(sal),sal
from emp
group by sal
order by sal desc
limit 5;
- 1
SELECT ename
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'ADAMS');

-- 2
SELECT ename, sal
FROM emp
WHERE sal < (SELECT sal FROM emp WHERE ename = 'KING');

-- 3
SELECT ename, deptno
FROM emp
WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'JONES');

-- 4
SELECT ename, job
FROM emp
WHERE job = (SELECT job FROM emp WHERE ename = 'JAMES');

-- 5
SELECT empno, ename, sal*12 AS annual_salary
FROM emp
WHERE sal*12 > (SELECT sal*12 FROM emp WHERE ename = 'WARD');

-- 6
SELECT ename, hiredate
FROM emp
WHERE hiredate < (SELECT hiredate FROM emp WHERE ename = 'SCOTT');

-- 7
SELECT ename, hiredate
FROM emp
WHERE hiredate > (SELECT hiredate FROM emp WHERE job = 'PRESIDENT');

-- 8
SELECT ename, sal
FROM emp
WHERE sal < (SELECT sal FROM emp WHERE empno = 7839);

-- 9
SELECT *
FROM emp
WHERE hiredate < (SELECT hiredate FROM emp WHERE ename = 'MILLER');

-- 10
SELECT ename, empno
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'ALLEN');

-- 11
SELECT ename, sal
FROM emp
WHERE sal > (SELECT sal FROM emp WHERE ename = 'BLAKE');
--display dept name of smith 
select dname from dept where deptno=(select deptno from emp  where  ename='SMITH');
--display dept naem of smith and allen
select dname from dept where deptno in (select deptno from emp  where  ename in ('SMITH','ALLEN'));
--display details of employee who are earning minimum salary 
select * from emp where sal in (select min(sal) from emp) ;
--display dept details of employee who is earning maximum salary
select * from dept where deptno in ( select deptno from emp where sal in(select max(sal)from emp));
--waqtd name,salary ,job and hiredate of an employee who are working in sales department and hired before king
select ename,sal,job,hiredate from emp where deptno in (select deptno from dept where dname='SALES' and hiredate <(select  hiredate from emp where ename='KING'));
--waqtd dept name in which there are atleast 4 employees working 
select dname from dept where deptno in (select deptno from emp group by deptno having count(*)>=4);
--waqtd details of employees getting same salary in same dept
update emp
set sal=3000
where ename='ALLEN';
select * from emp where (deptno,sal) in (select deptno,sal from emp group by sal,deptno having count(*)>1);
 select * from emp limit 1;
 select * from emp limit 1 offset 2; -- 3rd record
 select * from emp limit 3 offset 4;
 select * from emp;
 --display last record 
 select * from emp  limit 1 offset(select count(*)-1 from emp);
 --display four maximum slaary
 select sal from emp order by sal desc limit 4 ;
 --diplay 4th max sal
 select distinct sal from emp order by sal desc limit 1 offset 3;
 --display detail of employee who is earning 3rd and 4th minimum salary
 select * from emp where sal in (select sal from emp order by sal asc limit 2 offset 2)order by sal asc;
 select  ename,sal*12 as annual_sal from emp where annual_sal>12000; --error
 select ename ,sal*12 as annual_sal from (select  emp.*,sal*12 as annual_sal from emp) t1 where annual_sal>12000;
select author_name from author where author_id in (select auhtor_id from books where title='SQL' );
--display no of books written by each author
 select count(author_id) as no_of_time from books group by author_id;
 --dipslay the user details who has borrowed a book atomic habit
 select * from users where user_id in (select user_id from loans where book_id in (select bookid from books where title='Atomic habit' ) ) ;
--display no of books borrowed by each users
--joins
--joining of multiple tables is known as joins
--whenever data to be displayed form multiple tables simultaneousliy we use joins
--1.cartesian join 2. Inner join/equi join  4.outer join 4a.left outer join 4b.right outer join 4c.full outer join  5.natural join 6.self join
select * from emp cross join dept;
select ename,dname from emp,dept where emp.deptno=dept.deptno;
--display employee ,salary and location of all the employees who are working in the location chicago
select ename,sal,loc from emp , dept where emp.deptno=dept.deptno and loc='CHICAGO';
select ename,sal,loc from emp inner join  dept on emp.deptno=dept.deptno where loc='CHICAGO';
select dname,job,ename from emp inner join dept on emp.deptno=dept.deptno where dname like 'S%'; 
select dname ,mgr from emp inner join dept on emp.deptno=dept.deptno where mgr='7839';
select dname ,hiredate  from emp inner join dept on emp.deptno=dept.deptno where hiredate>'1983-12-31' and job in ('ACCOUNTING','RESEARCH');
select ename,dname from emp inner join dept on emp.deptno=dept.deptno where comm is not null and emp.deptno in ('10','30');
select dname,empno from emp inner join dept on emp.deptno=dept.deptno where  empno in ('7839','7902') and loc='NEW YORK';
select count(*) as no_of_employee ,deptno from emp group by deptno;
select count(*) as no_of_employee,emp.deptno, dname from emp inner join dept on  emp.deptno=dept.deptno group by emp.deptno,dname;
--display employee name and their dept name even though the employee who dont work in any dept
select ename,dname from emp left join dept on emp.deptno=dept.deptno;
--waqtd employee naem and their dept name even though the department were no employees are working 
select dname ,ename from emp right join dept on emp.deptno=dept.deptno ;
select dname ,ename from dept left join emp on emp.deptno=dept.deptno ;
select * from emp full join dept on emp.deptno=dept.deptno;
--display author name and their book name 
select author_name ,title from authors inner join books on author.author_id=books.author_id;
--display author who has not written any book
select author_name from author left join books on author.author_id=books.author_id where books.book_id is null;
--display book name and book generes name
select book_name,genres_name from books as b inner join genres as g on b.genre_id=g.genre_id;
--waqtd no of books borrowed by each users with user name
--select title,user_id from books group by title,user_id 
 DROP TABLES (Safe Re-run)
-- ==========================================
DROP TABLE IF EXISTS loans CASCADE;
DROP TABLE IF EXISTS books CASCADE;
DROP TABLE IF EXISTS authors CASCADE;
DROP TABLE IF EXISTS genres CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- ==========================================
-- AUTHORS TABLE
-- ==========================================
CREATE TABLE authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    state VARCHAR(50)
);

-- ==========================================
-- GENRES TABLE
-- ==========================================
CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- ==========================================
-- USERS TABLE
-- ==========================================
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    phno VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

-- ==========================================
-- BOOKS TABLE
-- ==========================================
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author_id INT REFERENCES authors(author_id),
    genre_id INT REFERENCES genres(genre_id)
);

-- ==========================================
-- LOANS TABLE
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
  -- ==========================================
  book_id INT REFERENCES books(book_id),
    borrowed_date DATE NOT NULL,
    return_date DATE
);

-- ==========================================
-- INSERT AUTHORS (10)
-- ==========================================
INSERT INTO authors VALUES
(1, 'Robert Martin', 'Texas'),
(2, 'J.K. Rowling', 'UK'),
(3, 'Chetan Bhagat', 'Delhi'),
(4, 'R.K. Narayan', 'Tamil Nadu'),
(5, 'George Orwell', 'UK'),
(6, 'Dan Brown', 'USA'),
(7, 'Paulo Coelho', 'Brazil'),
(8, 'Agatha Christie', 'UK'),
(9, 'Stephen King', 'USA'),
(10, 'New Author', 'Unknown');  -- No Books

-- ==========================================
-- INSERT GENRES (10)
-- ==========================================
INSERT INTO genres VALUES
(1, 'Programming'),
(2, 'Fantasy'),
(3, 'Fiction'),
(4, 'Classic'),
(5, 'Thriller'),
(6, 'Mystery'),
(7, 'Romance'),
(8, 'Horror'),
(9, 'Drama'),
(10, 'Biography');

-- ==========================================
-- INSERT USERS (10)
-- ==========================================
INSERT INTO users VALUES
(1, 'Aniket', '9876543210', 'aniket@gmail.com'),
(2, 'Rahul', '9876501234', 'rahul@gmail.com'),
(3, 'Priya', '9123456789', 'priya@gmail.com'),
(4, 'Amit', '9012345678', 'amit@gmail.com'),
(5, 'Neha', '9988776655', 'neha@gmail.com'),
(6, 'Rohit', '9090909090', 'rohit@gmail.com'),
(7, 'Kiran', '9871234567', 'kiran@gmail.com'),
(8, 'Meena', '9123987654', 'meena@gmail.com'),
(9, 'Vikas', '9898989898', 'vikas@gmail.com'),
(10, 'Unused User', '9000000000', 'unused@gmail.com'); -- No Loans

-- ==========================================
-- INSERT BOOKS (10)
-- ==========================================
INSERT INTO books VALUES
(1, 'SQL', 1, 1),
(2, 'Clean Code', 1, 1),           -- Robert Martin (Multiple Books)
(3, 'Harry Potter 1', 2, 2),
(4, 'Harry Potter 2', 2, 2),       -- Rowling (Multiple Books)
(5, '2 States', 3, 3),
(6, 'Malgudi Days', 4, 4),
(7, '1984', 5, 3),
(8, 'Da Vinci Code', 6, 5),
(9, 'The Alchemist', 7, 3),
(10, 'Murder on Orient Express', 8, 6);

-- Authors 9 and 10 have NO books

-- ==========================================
-- INSERT LOANS (10)
-- ==========================================
INSERT INTO loans VALUES
(1, 1, 1, '2025-01-10', '2025-01-20'),
(2, 1, 2, '2025-02-01', NULL),          -- Aniket (Multiple Loans)
(3, 2, 3, '2025-02-05', NULL),
(4, 3, 4, '2025-02-07', '2025-02-15'),
(5, 4, 5, '2025-02-10', NULL),
(6, 5, 6, '2025-02-11', NULL),
(7, 6, 7, '2025-02-12', NULL),
(8, 7, 8, '2025-02-13', NULL),
(9, 8, 9, '2025-02-14', NULL),
(10, 9, 10, '2025-02-15', NULL);

-- User 10 has NO loans
-- User 1 has multiple loans
Select    COUNT(*) AS total_books_borrowed
FROM loan l inner join users u
on l.user_id=u.user_id
GROUP BY user_id;
--waqtd to retrive the title of book and the authorname from the books and author tables
select title,author_name
from books b inner join authors a 
on a.author_id=b.author_id;
--waqtd
select title, genre_name 
from books b inner join genres g
on b.genre_id=g.genre_id 
where genre_name='Fiction';
--waqt to find all users details who have borrowed the book with the title '1984'
select u.* 
from users u inner join loans l 
on u.user_id=l.user_id inner join books b  on  b.book_id=l.book_id
where title='1984';
--waqt find the users detail who borrowed the maximum number of books
select u.* 
from users u inner join loans l
on u.user_id=l.user_id
group by u.user_id, u.user_name
order by count(l.book_id) desc
limit 1;
-- other method
select u.user_id,u.user_name
from loans l,user u
where u.user_id=l.user_id
group by u.user_id,u.user_name
having count(*) in (select max(no_of_times_borrowed) 
from (select count(*) no_of_times_borrowed,user_id from loans l ,users u
where u.user_id=l.user_id group by user_id)t1);
--waqt show the most borrowed book title
select title
from books b inner join loans l
 on b.book_id=l.book_id
 group by b.title,b.book_id
having count(l.book_id) in (   SELECT MAX(book_count)
    FROM (SELECT COUNT(book_id) AS book_count
        FROM loans
        GROUP BY book_id  )as t1);
---other method
select b.title
from books b inner join loans l
on b.book_id=l.book_id
group by b.title 
order by count(l.book_id)desc
limit 1;
--why when self join
select e1.ename,e2.ename
from emp e1 join emp e2 
on e1.mgr=e2.empno;
select * from emp;
--display employee naem ,manager name with thier salary  if manager is earning more than employee
select e1.ename,e2.ename,e1.sal as emp_sal,e2.sal as mgr_sal
from emp e1 join emp e2 
on e1.mgr=e2.empno
where e2.sal>e1.sal;
--display employees name,manager name,manger's manager name
select e1.ename,e2.ename,e3.ename
from emp e1 join emp e2 
on e1.mgr=e2.empno 
join emp e3 on e2.mgr=e3.empno;
--display employees name,manager name,manger's manager ,manager 's manger's manager name
select e1.ename,e2.ename,e3.ename,e4.ename
from emp e1 join emp e2 
on e1.mgr=e2.empno 
join emp e3 on e2.mgr=e3.empno
join emp e4 on e3.mgr=e4.empno;

select deptno from emp
union
select deptno from dept;

select deptno from emp
union all
select deptno from dept;

  select deptno from emp
  intersect 
  select deptno from dept;

  select deptno from dept
except
 select deptno from emp;

--display the 1st records form the emp table in output 2 times
(select * from emp 
limit 1)
union all 
(select * from emp 
limit 1);
--display 3rd max salary and 3rd min salary in same output
(select distinct sal from emp 
order by sal desc limit 1 offset 2)
union all
(select distinct sal  from emp
order by sal asc limit 1 offset 2);
create table dummy 
as 
select *from emp 
where job ='SALESMAN';
select * from dummy;
truncate table dummy;
rollback;
