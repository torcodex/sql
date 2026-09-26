CREATE TABLE Empls (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Gender VARCHAR(10),
    Department VARCHAR(50),
    JobTitle VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    Bonus INT,
    Age INT,
    ExperienceYears INT,
    JoiningDate DATE,
    Email VARCHAR(100),
    ManagerID INT NULL
);

INSERT INTO Empls VALUES
(101,'Rahul Sharma','Male','Sales','Sales Executive','Mumbai',48000,5000,27,3,'2022-01-15','rahul@shopeasy.com',201),
(102,'Priya Nair','Female','HR','HR Manager','Bangalore',85000,12000,35,10,'2018-04-10','priya@shopeasy.com',NULL),
(103,'Amit Verma','Male','IT','Software Engineer','Hyderabad',76000,8000,29,5,'2021-03-18','amit@shopeasy.com',202),
(104,'Sneha Das','Female','Finance','Financial Analyst','Delhi',65000,7000,30,6,'2020-07-22','sneha@shopeasy.com',203),
(105,'Karan Mehta','Male','Sales','Sales Executive','Mumbai',51000,4000,25,2,'2023-05-14','karan@shopeasy.com',201),
(106,'Anjali Singh','Female','IT','Database Administrator','Pune',92000,15000,33,8,'2019-02-11','anjali@shopeasy.com',202),
(107,'Vikram Rao','Male','Marketing','Marketing Executive','Chennai',47000,3500,26,2,'2024-01-08','vikram@shopeasy.com',204),
(108,'Meera Joseph','Female','Finance','Finance Manager','Bangalore',110000,20000,39,15,'2015-11-03','meera@shopeasy.com',NULL),
(109,'Arjun Kapoor','Male','IT','Team Lead','Hyderabad',125000,25000,41,18,'2012-06-19','arjun@shopeasy.com',NULL),
(110,'Pooja Patel','Female','Sales','Regional Manager','Ahmedabad',98000,18000,36,12,'2016-08-25','pooja@shopeasy.com',NULL),
(111,'Rohan Gupta','Male','Customer Support','Support Executive','Delhi',42000,3000,24,1,'2024-05-10','rohan@shopeasy.com',205),
(112,'Divya Menon','Female','Operations','Operations Executive','Kochi',56000,6000,28,4,'2021-09-15','divya@shopeasy.com',206);


select EmployeeID,FullName, JobTitle, ExperienceYears, Salary from Empls    
    where Department = 'IT' and ExperienceYears >= 5 and Salary > 80000 order by Salary desc;

select FullName, Department, City, Salary from Empls where city in ('Mumbai', 'Bangalore') order by FullName;

select FullName, Department, City, Salary from Empls where Department not in ('Sales') order by FullName;

select FullName, Department, City, Salary from Empls where Salary between 60000 and 100000 order by FullName;

select FullName, Department, City, Salary from Empls where Salary not between 50000 and 90000 order by FullName;

select FullName, Department, Email, City, Salary from Empls where Email like 'a%' order by FullName;

select FullName, Department, Email, City, Salary from Empls where FullName like '%ra%' order by FullName;

select FullName, Department, Email, City, Salary from Empls where Department in ('HR','Finance', 'Operations') order by FullName;

select FullName, Department, Email, City, Salary from Empls where Department not in ('IT','Finance') order by FullName;

select FullName, Department, Email, City, Salary from Empls where ManagerID is null order by FullName;

select FullName, Department, Email, City, Salary from Empls where ManagerID is not null order by FullName;

select FullName, Department, Email, City, Salary from Empls 
    where Department = 'Sales' and Salary between 45000 and 60000 and FullName like 'K%' or FullName like 'R%' order by FullName;

