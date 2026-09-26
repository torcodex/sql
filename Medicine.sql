CREATE TABLE Patients
(
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    City VARCHAR(50),
    InsuranceType VARCHAR(30)
);

INSERT INTO Patients VALUES
(101,'Rahul Sharma',35,'Male','Mumbai','Private'),
(102,'Priya Nair',42,'Female','Bangalore','Government'),
(103,'Arjun Patel',28,'Male','Ahmedabad','Private'),
(104,'Sneha Das',51,'Female','Delhi',NULL),
(105,'Karan Mehta',39,'Male','Mumbai','Private'),
(106,'Anjali Singh',46,'Female','Pune','Government'),
(107,'Rohan Gupta',60,'Male','Delhi','Private'),
(108,'Meera Joseph',31,'Female','Kochi',NULL);

CREATE TABLE Doctors
(
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100),
    Department VARCHAR(50),
    ExperienceYears INT
);

INSERT INTO Doctors VALUES
(1,'Dr. Amit','Cardiology',15),
(2,'Dr. Susan','Neurology',11),
(3,'Dr. Thomas','Orthopedics',18),
(4,'Dr. David','General Medicine',8),
(5,'Dr. Riya','Oncology',14);

CREATE TABLE Appointments
(
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY(PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY(DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Appointments VALUES
(1001,101,1,'2026-07-01','Completed'),
(1002,102,2,'2026-07-03','Completed'),
(1003,103,1,'2026-07-04','Cancelled'),
(1004,104,5,'2026-07-05','Completed'),
(1005,105,3,'2026-07-05','Completed'),
(1006,106,4,'2026-07-06','Pending'),
(1007,107,1,'2026-07-06','Completed'),
(1008,108,5,'2026-07-07','Completed');


CREATE TABLE Treatments
(
    TreatmentID INT PRIMARY KEY,
    AppointmentID INT,
    TreatmentName VARCHAR(100),
    Cost DECIMAL(10,2),
    FOREIGN KEY(AppointmentID) REFERENCES Appointments(AppointmentID)
);

INSERT INTO Treatments VALUES
(1,1001,'ECG',3500),
(2,1002,'MRI Scan',12000),
(3,1004,'Chemotherapy',85000),
(4,1005,'Knee Surgery',125000),
(5,1007,'Angioplasty',220000),
(6,1008,'Radiation Therapy',95000);

CREATE TABLE Medicines
(
    MedicineID INT PRIMARY KEY,
    TreatmentID INT,
    MedicineName VARCHAR(100),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    FOREIGN KEY(TreatmentID) REFERENCES Treatments(TreatmentID)
);

INSERT INTO Medicines VALUES
(1,1,'Aspirin',10,20),
(2,2,'Painkiller',15,35),
(3,3,'Cancer Drug',8,4500),
(4,4,'Antibiotic',20,150),
(5,5,'Blood Thinner',25,180),
(6,6,'Vitamin Supplement',12,80);



select a.AppointmentID, a.AppointmentDate , p.PatientName, d.DoctorName, d.Department
from Patients p join Appointments a
on p.PatientID = a.PatientID
join Doctors d on d.DoctorID = a.DoctorID
order by a.AppointmentDate

select p.PatientID, p.PatientName, p.InsuranceType
from Patients p left join Appointments a
on p.PatientID = a.PatientID
where a.PatientID is null

select d.DoctorID, d.DoctorName, d.Department, count(a.AppointmentID) as AppointmentTotals
from Doctors d left join Appointments a
on d.DoctorID = a.DoctorID
group by d.DoctorName, d.Department, d.DoctorID
order by AppointmentTotals desc

select a.AppointmentID, p.PatientName, d.DoctorName, a.AppointmentDate, t.TreatmentName, a.Status, t.Cost
from Treatments t left join Appointments a
on a.AppointmentID = t.AppointmentID
join Patients p on a.PatientID = p.PatientID 
join Doctors d on d.DoctorID = a.doctorID
where status = 'Completed'
order by t.Cost desc


select p.PatientName, t.TreatmentName, m.MedicineName, m.Quantity, m.UnitPrice, (m.Quantity * m.UnitPrice) as MedicineCost
from Medicines m join Treatments t 
on m.TreatmentID = t.TreatmentID
join Appointments a on t.AppointmentID = a.AppointmentID
join Patients p on p.PatientID = a.PatientID
join Doctors d on d.DoctorID = a.DoctorID
order by MedicineCost desc

select p.PatientName, a.AppointmentDate
from Patients p left join Appointments a 
on a.PatientID = p.PatientID
left join Treatments t on t.AppointmentID = a.AppointmentID
where t.AppointmentID is null
order by a.AppointmentDate

select d.Department, sum(t.cost) as TreatmentTotal, sum(m.UnitPrice*m.Quantity) As TotalMedicineRevenue
from Doctors d join Appointments a 
on d.DoctorID = a.DoctorID 
join Treatments t on t.AppointmentID = a.AppointmentID
join Medicines m on m.TreatmentID = t.TreatmentID
where a.Status <> 'Pending'
group by Department

select p.PatientName, t.TreatmentName, t.Cost,
case
    when t.Cost >= 150000 then 'Critical'
    when t.Cost between 50000 and 149999 then 'Major'
    else 'Minor'
end as TreatmentEvaluation
from Patients p join Appointments a
on p.PatientID = a.PatientID
join Treatments t on t.AppointmentID = a.AppointmentID
order by t.Cost

select p.PatientName, d.DoctorName, d.Department, t.TreatmentName, m.MedicineName, 
m.Quantity, m.UnitPrice, (m.Quantity*m.UnitPrice) as MedicineCost, t.Cost,
case
    when t.Cost >= 150000 then 'Critical'
    when t.Cost between 50000 and 149999 then 'Major'
    else 'Minor'
end as TreatmentCategory
from Appointments a join Patients p 
on a.PatientID = p.PatientID
join Doctors d on d.DoctorID = a.DoctorID
join Treatments t on t.AppointmentID = a.AppointmentID
join Medicines m on m.TreatmentID = t.TreatmentID
where a.Status = 'Completed'
order by Cost