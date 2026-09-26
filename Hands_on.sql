-------- Hands On - 1 ----------

CREATE TABLE Emps (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Department VARCHAR(50),
    JobTitle VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    JoiningDate DATE,
    Age INT
);

INSERT INTO Emps VALUES
(101,'Rahul Sharma','Male','Sales','Executive','Mumbai',45000,'2021-05-15',27),
(102,'Priya Nair','Female','HR','Manager','Bangalore',70000,'2019-08-21',34),
(103,'Amit Verma','Male','IT','Developer','Hyderabad',65000,'2022-01-10',29),
(104,'Sneha Das','Female','Finance','Analyst','Delhi',55000,'2020-06-18',31),
(105,'Karan Mehta','Male','Sales','Executive','Mumbai',47000,'2023-02-12',25),
(106,'Anjali Singh','Female','IT','Developer','Pune',62000,'2021-09-01',28),
(107,'Vikram Rao','Male','HR','Executive','Chennai',42000,'2024-01-03',26),
(108,'Meera Joseph','Female','Finance','Manager','Bangalore',82000,'2018-11-19',38),
(109,'Arjun Kapoor','Male','IT','Team Lead','Hyderabad',95000,'2017-04-11',40),
(110,'Pooja Patel','Female','Sales','Manager','Ahmedabad',88000,'2019-07-25',36);

select EmployeeID,FullName, Department, Salary from Emps

select * from Emps where Salary>60000

select EmployeeID, FullName, Department, JobTitle, City from Emps where Department = 'Sales'

select * from Emps order by JoiningDate

select EmployeeID,FullName, Department, Salary, JobTitle, City from Emps where City = 'Bangalore';

SELECT DISTINCT Department, Name FROM Emps;


--------------------------------------------------------------------------------------------------------------------------------------------------

-------------- Hands On - 2 ----------------


CREATE TABLE Custs(
CustomerID INT PRIMARY KEY,
CustomerName VARCHAR(100),
Gender VARCHAR(10),
City VARCHAR(50),
SignupDate DATE,
Membership VARCHAR(20),
TotalOrders INT,
TotalSpent INT
);

INSERT INTO Custs VALUES
(1,'Aarav','Male','Mumbai','2023-01-10','Gold',45,56000),
(2,'Diya','Female','Delhi','2024-02-15','Silver',15,12000),
(3,'Rohan','Male','Bangalore','2022-07-01','Gold',72,92000),
(4,'Ishita','Female','Pune','2025-03-18','Bronze',5,3200),
(5,'Kabir','Male','Hyderabad','2021-08-11','Gold',88,110000),
(6,'Ananya','Female','Mumbai','2024-09-05','Silver',20,16000),
(7,'Vivaan','Male','Chennai','2023-06-19','Bronze',8,4500),
(8,'Sara','Female','Delhi','2022-11-30','Gold',60,70000),
(9,'Aryan','Male','Pune','2021-12-22','Silver',30,25000),
(10,'Kiara','Female','Bangalore','2025-01-10','Bronze',3,1800);


select * from Custs where TotalSpent >50000

select * from Custs order by TotalOrders

select * from Custs where Membership = 'Gold'

select * from Custs where City = 'Mumbai'

select CustomerName from Custs




--------------------------------------------------------------------------------------------------------------------------------------------------

-------------- Hands On - 3 ----------------

