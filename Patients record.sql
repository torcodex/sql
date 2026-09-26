CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    BloodGroup VARCHAR(5),
    City VARCHAR(50),
    Disease VARCHAR(50),
    DoctorAssigned VARCHAR(100),
    Department VARCHAR(50),
    AdmissionDate DATE,
    DischargeDate DATE NULL,
    RoomType VARCHAR(30),
    InsuranceProvider VARCHAR(50) NULL,
    BillAmount DECIMAL(10,2),
    PaymentStatus VARCHAR(20),
    EmergencyContact VARCHAR(20)
);

INSERT INTO Patients VALUES
(1001,'Rahul Sharma','Male',27,'O+','Mumbai','Dengue','Dr. Mehta','General Medicine','2026-01-05','2026-01-10','General','Star Health',28500,'Paid','9876543210'),

(1002,'Priya Nair','Female',42,'A+','Bangalore','Diabetes','Dr. Iyer','Endocrinology','2026-01-08',NULL,'Private','ICICI Lombard',68000,'Pending','9876543211'),

(1003,'Arjun Patel','Male',65,'B+','Ahmedabad','Heart Attack','Dr. Kapoor','Cardiology','2026-01-10',NULL,'ICU','HDFC ERGO',285000,'Pending','9876543212'),

(1004,'Sneha Das','Female',31,'AB+','Delhi','Migraine','Dr. Sharma','Neurology','2026-01-12','2026-01-14','General',NULL,14500,'Paid','9876543213'),

(1005,'Karan Mehta','Male',54,'O-','Mumbai','Kidney Stone','Dr. Reddy','Urology','2026-01-15','2026-01-20','Private','Star Health',92000,'Paid','9876543214'),

(1006,'Meera Joseph','Female',23,'B+','Kochi','Appendicitis','Dr. Nair','General Surgery','2026-01-18','2026-01-23','Private','Care Health',78000,'Paid','9876543215'),

(1007,'Vikram Rao','Male',37,'A-','Hyderabad','COVID-19','Dr. Khan','Pulmonology','2026-01-20',NULL,'Isolation','Niva Bupa',156000,'Pending','9876543216'),

(1008,'Anjali Singh','Female',48,'O+','Pune','Cancer','Dr. Gupta','Oncology','2026-01-21',NULL,'ICU','ManipalCigna',520000,'Pending','9876543217'),

(1009,'Rohan Verma','Male',18,'A+','Delhi','Fracture','Dr. Thomas','Orthopedics','2026-01-22','2026-01-25','General',NULL,32000,'Paid','9876543218'),

(1010,'Pooja Menon','Female',60,'AB-','Chennai','Stroke','Dr. Kapoor','Neurology','2026-01-23',NULL,'ICU','Star Health',460000,'Pending','9876543219'),

(1011,'Amit Gupta','Male',45,'B-','Bangalore','Hypertension','Dr. Iyer','Cardiology','2026-01-24',NULL,'Private','ICICI Lombard',98000,'Pending','9876543220'),

(1012,'Divya Thomas','Female',29,'O+','Trivandrum','Typhoid','Dr. Mehta','General Medicine','2026-01-25','2026-01-30','General','Care Health',26000,'Paid','9876543221');

select * from Patients where Department = 'Cardiology' and age>40 order by BillAmount desc

select * from Patients where InsuranceProvider is null

select * from Patients where InsuranceProvider in ('Star Health', 'ICICI Lombard')

select * from Patients where RoomType = 'ICU' and BillAmount between 200000 and 500000 order by BillAmount desc

select PatientName,Department, BillAmount, PaymentStatus from Patients where PaymentStatus = 'Pending' and BillAmount > 100000

select 
PatientName, Disease, Department, RoomType 
from Patients 
where 
RoomType = 'General' and AdmissionDate > '2026-01-15'

select 
PatientName, Disease, Department, DoctorAssigned 
from Patients 
where 
Department in ('Neurology','Oncology')

select 
PatientName, Disease, Department, AdmissionDate 
from Patients 
where 
DischargeDate is null

select 
PatientName, Disease, Department, AdmissionDate, DischargeDate
from Patients 
where 
DischargeDate is not null

select 
PatientID, PatientName, Disease, Department, AdmissionDate
from Patients 
where 
PatientName like 'A%'
order by PatientName

select 
PatientID, PatientName, Disease, Department, AdmissionDate
from Patients 
where 
PatientName like 'A%'
order by PatientName

select 
PatientID, PatientName, Disease, Department, AdmissionDate
from Patients 
where 
Disease like '%Heart%'

select 
PatientID, PatientName, Age, Disease, Department, AdmissionDate
from Patients 
where 
AGE between 30 and 60
order by age 

select 
PatientID, PatientName, Disease, Department, City , AdmissionDate
from Patients 
where 
City not in ('Mumbai', 'Delhi', 'Bangalore')

select 
PatientID, PatientName, Disease, Department, City , AdmissionDate
from Patients 
where 
Department in ('Cardiology', 'Neurology') 
and 
Age>40
and 
PaymentStatus = 'Pending'
and 
BillAmount > 90000
and InsuranceProvider is not null
order by BillAmount desc

select * from Patients
where 
RoomType =  'ICU'
or 
BillAmount > 400000
or
Disease like '%Cancer%'
or
InsuranceProvider is null
order by BillAmount desc