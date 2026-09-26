CREATE TABLE LOCATION (
  Location_ID INT PRIMARY KEY,
  City VARCHAR(50)
);

INSERT INTO LOCATION (Location_ID, City)
VALUES (122, 'New York'),
       (123, 'Dallas'),
       (124, 'Chicago'),
       (167, 'Boston');


  CREATE TABLE DEPARTMENT (
  Department_Id INT PRIMARY KEY,
  Name VARCHAR(50),
  Location_Id INT,
  FOREIGN KEY (Location_Id) REFERENCES LOCATION(Location_ID)
);


INSERT INTO DEPARTMENT (Department_Id, Name, Location_Id)
VALUES (10, 'Accounting', 122),
       (20, 'Sales', 124),
       (30, 'Research', 123),
       (40, 'Operations', 167);

	   CREATE TABLE JOB (
  Job_ID INT PRIMARY KEY,
  Designation VARCHAR(50)
);

INSERT  INTO JOB VALUES
(667, 'CLERK'),
(668,'STAFF'),
(669,'ANALYST'),
(670,'SALES_PERSON'),
(671,'MANAGER'),
(672, 'PRESIDENT')


CREATE TABLE EMPLOYEE
(EMPLOYEE_ID INT,
LAST_NAME VARCHAR(20),
FIRST_NAME VARCHAR(20),
MIDDLE_NAME CHAR(1),
JOB_ID INT FOREIGN KEY
REFERENCES JOB(JOB_ID),
MANAGER_ID INT,
HIRE_DATE DATE,
SALARY INT,
COMM INT,
DEPARTMENT_ID  INT FOREIGN KEY
REFERENCES DEPARTMENT(DEPARTMENT_ID))

INSERT INTO EMPLOYEE VALUES
(7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,NULL,20),
(7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-84',1600,300,30),
(7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,NULl,30),
(7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,NULL,30),
(7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,NULL,40),
(7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30)

--- Simple Queries
------- Question 1 -------

select * from EMPLOYEE

------- Question 2 -------

select * from DEPARTMENT

------- Question 3 -------

select * from JOB

------- Question 4 -------

select * from LOCATION

------- Question 5 -------

select FIRST_NAME, LAST_NAME, SALARY, COMM
from EMPLOYEE

------- Question 6 -------

select EMPLOYEE_ID as IDoftheEmployee , LAST_NAME as NameOftheEmployee, DEPARTMENT_ID as Dep_id
from EMPLOYEE

------- Question 7 -------

select FIRST_NAME, LAST_NAME, SALARY*12 as AnnualSalary
from EMPLOYEE


--- Where Condition
------- Question 1 -------

select * from EMPLOYEE 
where LAST_NAME = 'SMITH'

------- Question 2 -------

select * from EMPLOYEE where DEPARTMENT_ID = 20

------- Question 3 -------

select * from EMPLOYEE where SALARY between 3000 and 4500

------- Question 4 -------

select * from EMPLOYEE where DEPARTMENT_ID in (10,20)

------- Question 5 -------

select * from EMPLOYEE where DEPARTMENT_ID not in (10,30)

------- Question 6 -------

select * from EMPLOYEE where LAST_NAME like 'S%'

------- Question 7 -------

select * from EMPLOYEE where LAST_NAME like 'S%H'

------- Question 8 -------

select * from EMPLOYEE where LAST_NAME like 'S___'

------- Question 9 -------

select * from EMPLOYEE where DEPARTMENT_ID = 10 and SALARY > 3500

------- Question 10 -------

select * from EMPLOYEE where COMM is null

--- Order by Clause
------- Question 1 -------

select EMPLOYEE_ID, LAST_NAME
from EMPLOYEE
order by EMPLOYEE_ID 

------- Question 2 -------

select EMPLOYEE_ID, LAST_NAME, FIRST_NAME
from EMPLOYEE
order by SALARY desc

------- Question 3 -------

select *
from EMPLOYEE 
order by LAST_NAME

------- Question 4 -------

select * from EMPLOYEE
order by LAST_NAME, DEPARTMENT_ID desc

--- Group by and Having Clauses
------- Question 1 -------

select COUNT(EMPLOYEE_ID) as CountOfEmployees, DEPARTMENT_ID
from EMPLOYEE
group by DEPARTMENT_ID

------- Question 2 -------

select DEPARTMENT_ID, MAX(SALARY) as MaxSalary, min(SALARY) as MinSalary, 
AVG(SALARY) as AvgSalary from EMPLOYEE group by DEPARTMENT_ID

------- Question 3 -------

select j.Designation, MAX(e.SALARY) as MaxSalary, min(e.SALARY) as MinSalary, 
AVG(e.SALARY) as AvgSalary 
from EMPLOYEE e join JOB j 
on e.JOB_ID = j.Job_ID
group by j.Designation 

------- Question 4 -------

select COUNT(EMPLOYEE_ID) as CountOfEmployee, DATENAME(MONTH,HIRE_DATE) as HireMonth
from EMPLOYEE
group by MONTH(HIRE_DATE), DATENAME(MONTH, HIRE_DATE)
order by MONTH(HIRE_DATE)

------- Question 5 -------

select COUNT(EMPLOYEE_ID) as CountOfEmployee, DATENAME(MONTH,HIRE_DATE) as HireMonth,
DATENAME(Year,HIRE_DATE) as HireYear from EMPLOYEE
group by YEAR(HIRE_DATE), MONTH(HIRE_DATE)
order by YEAR(HIRE_DATE), MONTH(HIRE_DATE)

------- Question 6 -------

select DEPARTMENT_ID, COUNT(EMPLOYEE_ID) as NumberOfEmployee
from EMPLOYEE group by DEPARTMENT_ID having COUNT(EMPLOYEE_ID) > 3

------- Question 7 -------

select COUNT(EMPLOYEE_ID) as CountOfEmployee, DATENAME(MONTH,HIRE_DATE) as HireMonth
from EMPLOYEE
where DATENAME(MONTH,HIRE_DATE) = 'January'
group by DATENAME(MONTH,HIRE_DATE)

------- Question 8 -------

select COUNT(EMPLOYEE_ID) as CountOfEmployee, DATENAME(MONTH,HIRE_DATE) as HireMonth
from EMPLOYEE
where DATENAME(MONTH,HIRE_DATE) in ('January','September')
group by DATENAME(MONTH,HIRE_DATE)

------- Question 9 -------

SELECT COUNT(EMPLOYEE_ID) AS NumberOfEmployees
FROM EMPLOYEE
WHERE YEAR(HIRE_DATE) = 1985


------- Question 10 -------

select COUNT(EMPLOYEE_ID) as HiredEmps, DATENAME(MONTH,HIRE_DATE) as Hiring_Month
from EMPLOYEE
where DATENAME(YEAR,HIRE_DATE) = 1985
group by DATENAME(MONTH,HIRE_DATE)

------- Question 11 -------

select COUNT(EMPLOYEE_ID) as HiredEmps, DATENAME(MONTH,HIRE_DATE) as Hiring_Month
from EMPLOYEE
where DATENAME(YEAR,HIRE_DATE) = 1985 and DATENAME(MONTH,HIRE_DATE) = 'March'
group by DATENAME(MONTH,HIRE_DATE)

------- Question 12 -------

select DEPARTMENT_ID, COUNT(EMPLOYEE_ID) as HiredEmps, DATENAME(MONTH,HIRE_DATE) as Hiring_Month
from EMPLOYEE
where DATENAME(YEAR,HIRE_DATE) = 1985 and DATENAME(MONTH,HIRE_DATE) = 'April'
group by DATENAME(MONTH,HIRE_DATE), DEPARTMENT_ID
having COUNT(EMPLOYEE_ID) >=3

--- Joins
------- Question 1 -------

select e.LAST_NAME, d.Name
from EMPLOYEE e join DEPARTMENT d
on e.DEPARTMENT_ID = d.Department_Id

------- Question 2 -------

select e.LAST_NAME, j.Designation
from JOB j join EMPLOYEE e
on j.Job_ID = e.JOB_ID

------- Question 3 -------

select e.LAST_NAME, d.Name, l.City
from EMPLOYEE e join JOB j
on e.JOB_ID = j.Job_ID
join DEPARTMENT d on d.Department_Id = e.DEPARTMENT_ID
join LOCATION l on l.Location_ID = d.Location_Id

------- Question 4 -------

select d.Name, COUNT(e.EMPLOYEE_ID) as NumberOfEmployee
from EMPLOYEE e join DEPARTMENT d
on e.DEPARTMENT_ID = d.Department_Id
group by d.Name

------- Question 5 -------

select d.Name, COUNT(e.EMPLOYEE_ID) as NumberOfEmployee
from EMPLOYEE e join DEPARTMENT d
on e.DEPARTMENT_ID = d.Department_Id
where d.Name = 'Sales'
group by d.Name

------- Question 6 -------

select d.Name, COUNT(e.EMPLOYEE_ID) as NumberOfEmployee
from EMPLOYEE e join DEPARTMENT d
on e.DEPARTMENT_ID = d.Department_Id
group by d.Name
having COUNT(e.EMPLOYEE_ID) >= 5

------- Question 7 -------

select j.Designation, COUNT(e.EMPLOYEE_ID) as NumberOfEmployee
from EMPLOYEE e join JOB j
on e.JOB_ID = j.Job_ID
group by j.Designation

------- Question 8 -------

select l.City, COUNT(e.EMPLOYEE_ID) as NumberofEmployees
from EMPLOYEE e join DEPARTMENT d 
on e.DEPARTMENT_ID = d.Department_Id
join LOCATION l on l.Location_ID = d.Location_Id
WHERE l.City = 'New York'
group by l.City


------- Question 9 -------

select *,
case
 when SALARY >= 3000 then 'Great'
 when SALARY >= 2000 then 'Good'
 when SALARY >= 1000 then 'Average'
 else 'Bad'
end as SalaryGrade
from EMPLOYEE

------- Question 10 -------

select DEPARTMENT_ID, COUNT(EMPLOYEE_ID) as NumberOfEmployees,
CASE
  WHEN SALARY >= 3000 THEN 'Great'
  WHEN SALARY >= 2000 THEN 'Good'
  WHEN SALARY >= 1000 THEN 'Average'
  ELSE 'Bad'
END AS SalaryGrade
from EMPLOYEE
group by DEPARTMENT_ID


------- Question 11 -------

select COUNT(EMPLOYEE_ID) as CountOfEmployee, SalaryGrade
from 
(
select EMPLOYEE_ID, 
case
 when SALARY >= 3000 then 'Great'
 when SALARY >= 2000 then 'Good'
 when SALARY >= 1000 then 'Average'
 else 'Bad'
end as SalaryGrade
from EMPLOYEE
where SALARY between 2000 and 5000
) e
group by SalaryGrade

------- Question 12 -------

select * from EMPLOYEE e 
join DEPARTMENT d 
on e.DEPARTMENT_ID = d.DEPARTMENT_ID
where d.Name in ('Sales', 'Operations')

--- Set Operators
------- Question 1 -------

SELECT e.JOB_ID, j.Designation
FROM EMPLOYEE e
JOIN DEPARTMENT d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
join JOB j on j.Job_ID = e.JOB_ID
WHERE d.NAME = 'Sales'

union

SELECT e.JOB_ID, j.Designation
FROM EMPLOYEE e
JOIN DEPARTMENT d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
join JOB j on j.Job_ID = e.JOB_ID
WHERE d.NAME = 'Accounting'

------- Question 2 -------

SELECT e.JOB_ID, j.Designation
FROM EMPLOYEE e
JOIN DEPARTMENT d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
join JOB j on j.Job_ID = e.JOB_ID
WHERE d.NAME = 'Sales'

union all

SELECT e.JOB_ID, j.Designation
FROM EMPLOYEE e
JOIN DEPARTMENT d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
join JOB j on j.Job_ID = e.JOB_ID
WHERE d.NAME = 'Accounting'

------- Question 3 -------

select e.JOB_ID, j.Designation
from EMPLOYEE e join DEPARTMENT d
on e.DEPARTMENT_ID = d.Department_Id 
join JOB j on e.JOB_ID = j.Job_ID
where d.Name = 'Research'

intersect

select e.JOB_ID, j.Designation
from EMPLOYEE e join DEPARTMENT d
on e.DEPARTMENT_ID = d.Department_Id 
join JOB j on e.JOB_ID = j.Job_ID
where d.Name = 'Accounting'

order by JOB_ID

--- Subqueries
------- Question 1 -------

select * from EMPLOYEE 
where SALARY = (select MAX(SALARY)from EMPLOYEE)


------- Question 2 -------

select *
from EMPLOYEE
where DEPARTMENT_ID = 
(select DEPARTMENT_ID from DEPARTMENT WHERE Name = 'Sales')

------- Question 3 -------

select *
from EMPLOYEE 
where JOB_ID = 
(select JOB_ID from JOB where Designation = 'Clerk')

------- Question 4 -------

select *
from EMPLOYEE
where DEPARTMENT_ID = 
(
select DEPARTMENT_ID
from DEPARTMENT
where Location_Id = 
(
select Location_Id
from LOCATION
where City = 'New York'
)
)

------- Question 5 -------

select COUNT(EMPLOYEE_ID) as CountOfEmployee
from EMPLOYEE 
where DEPARTMENT_ID = 
(
select DEPARTMENT_ID
from DEPARTMENT
where name = 'Sales'
)

------- Question 6 -------

update EMPLOYEE
set SALARY += SALARY*0.1
where JOB_ID = 
(
select JOB_ID
from JOB
where Designation = 'Clerk'
)

------- Question 7 -------

delete from EMPLOYEE
where DEPARTMENT_ID = 
(
select DEPARTMENT_ID
from DEPARTMENT
where Name = 'Accounting'
)

------- Question 8 -------

select *
from 
(
select *, DENSE_RANK() over(order by salary desc) as SalaryRank
from EMPLOYEE
) e
where SalaryRank = 2

------- Question 9 -------
CREATE OR ALTER PROCEDURE nth_highest_salary
    @n INT
AS
BEGIN
    SELECT *
    FROM
    (
        SELECT *,
        DENSE_RANK() OVER (ORDER BY SALARY DESC) AS SalaryRank
        FROM EMPLOYEE
    ) E
    WHERE SalaryRank = @n
END

exec dbo.nth_highest_salary 4

------- Question 10 -------

select * 
from EMPLOYEE
where SALARY > all
(
select SALARY
from EMPLOYEE
where DEPARTMENT_ID = 30
)

------- Question 11 -------

SELECT *
FROM EMPLOYEE e
WHERE SALARY > 
(
SELECT MIN(SALARY)
FROM EMPLOYEE
WHERE DEPARTMENT_ID = e.DEPARTMENT_ID
)

------- Question 12 -------

SELECT d.Department_Id, d.Name
FROM DEPARTMENT d
LEFT JOIN EMPLOYEE e
ON d.Department_Id = e.DEPARTMENT_ID
WHERE e.EMPLOYEE_ID IS NULL

------- Question 13 -------

select * 
from EMPLOYEE e 
where SALARY >
(
select AVG(SALARY) 
from EMPLOYEE
where DEPARTMENT_ID = e.DEPARTMENT_ID
)
