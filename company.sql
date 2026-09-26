CREATE TABLE Empes (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Department VARCHAR(50),
    JobTitle VARCHAR(60),
    City VARCHAR(50),
    Salary INT,
    Bonus INT,
    Age INT,
    ExperienceYears INT,
    JoiningDate DATE,
    EmploymentType VARCHAR(20),
    PerformanceRating DECIMAL(2,1),
    ManagerID INT NULL
);

INSERT INTO Empes VALUES
(101,'Rahul Sharma','Male','Sales','Sales Executive','Mumbai',48000,5000,27,3,'2022-01-15','Permanent',4.3,201),

(102,'Priya Nair','Female','HR','HR Manager','Bangalore',85000,12000,35,10,'2018-04-10','Permanent',4.7,NULL),

(103,'Amit Verma','Male','IT','Software Engineer','Hyderabad',76000,8000,29,5,'2021-03-18','Permanent',4.5,202),

(104,'Sneha Das','Female','Finance','Financial Analyst','Delhi',65000,7000,30,6,'2020-07-22','Permanent',4.1,203),

(105,'Karan Mehta','Male','Sales','Sales Executive','Mumbai',51000,4000,25,2,'2023-05-14','Contract',3.9,201),

(106,'Anjali Singh','Female','IT','Database Administrator','Pune',92000,15000,33,8,'2019-02-11','Permanent',4.8,202),

(107,'Vikram Rao','Male','Marketing','Marketing Executive','Chennai',47000,3500,26,2,'2024-01-08','Contract',3.8,204),

(108,'Meera Joseph','Female','Finance','Finance Manager','Bangalore',110000,20000,39,15,'2015-11-03','Permanent',4.9,NULL),

(109,'Arjun Kapoor','Male','IT','Team Lead','Hyderabad',125000,25000,41,18,'2012-06-19','Permanent',4.9,NULL),

(110,'Pooja Patel','Female','Sales','Regional Manager','Ahmedabad',98000,18000,36,12,'2016-08-25','Permanent',4.6,NULL),

(111,'Rohan Gupta','Male','Customer Support','Support Executive','Delhi',42000,3000,24,1,'2024-05-10','Contract',3.7,205),

(112,'Divya Menon','Female','Operations','Operations Executive','Kochi',56000,6000,28,4,'2021-09-15','Permanent',4.2,206),

(113,'Nikhil Bansal','Male','Operations','Operations Manager','Mumbai',115000,22000,40,16,'2014-12-18','Permanent',4.8,NULL),

(114,'Sara Thomas','Female','HR','HR Executive','Kochi',52000,4500,27,3,'2022-11-11','Permanent',4.0,102),

(115,'Deepak Iyer','Male','Marketing','Marketing Manager','Bangalore',102000,19000,38,13,'2017-05-28','Permanent',4.6,NULL);

select count(*) as TotalEmployees from Empes

select count(*) as PermanentEmployees from Empes where EmploymentType = 'Permanent'

select sum(Salary) as TotalPayroll from Empes

select sum(Bonus) as TotalBonusBudget from Empes

select avg(Salary) as AverageSalary from Empes

select cast(avg(Salary) as decimal(10,2)) as AverageSalary from Empes

select max(Salary) as HighestSalary from Empes

select min(Salary) as LowestSalary from Empes

select max(ExperienceYears) as MaximumExperience from Empes

select cast(avg(PerformanceRating) as decimal(10,2)) as MaximumExperience from Empes

select count(distinct City) from Empes

