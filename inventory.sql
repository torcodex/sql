CREATE TABLE Pros (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    StoreCity VARCHAR(50),
    Supplier VARCHAR(100),
    UnitPrice DECIMAL(10,2),
    QuantityInStock INT,
    UnitsSold INT,
    Revenue DECIMAL(12,2),
    DiscountPercent DECIMAL(5,2),
    CustomerRating DECIMAL(3,1),
    LaunchDate DATE,
    WarrantyYears INT,
    IsActive VARCHAR(3)
);

INSERT INTO Pros VALUES
(101,'Galaxy S25','Smartphone','Samsung','Bangalore','Samsung India',79999,42,520,41599480,10,4.8,'2025-01-15',2,'Yes'),
(102,'iPhone 17','Smartphone','Apple','Mumbai','Apple India',89999,25,610,54899390,5,4.9,'2025-02-01',1,'Yes'),
(103,'ThinkPad X1','Laptop','Lenovo','Delhi','Lenovo India',145000,18,180,26100000,12,4.7,'2024-11-01',3,'Yes'),
(104,'MacBook Air M5','Laptop','Apple','Bangalore','Apple India',129999,20,275,35749725,7,4.9,'2025-03-12',1,'Yes'),
(105,'Sony Bravia 65','Television','Sony','Hyderabad','Sony India',98000,14,92,9016000,15,4.6,'2024-09-18',3,'Yes'),
(106,'LG OLED C5','Television','LG','Chennai','LG Electronics',155000,8,68,10540000,8,4.8,'2025-01-05',3,'Yes'),
(107,'Boat Rockerz','Headphones','Boat','Kochi','Boat Lifestyle',2999,180,1250,3748750,20,4.3,'2024-07-15',1,'Yes'),
(108,'Dell Inspiron 15','Laptop','Dell','Pune','Dell India',72000,34,310,22320000,10,4.4,'2024-10-21',2,'Yes'),
(109,'Echo Dot','Smart Home','Amazon','Mumbai','Amazon India',5499,95,780,4289220,18,4.5,'2025-01-10',1,'Yes'),
(110,'PlayStation 6','Gaming Console','Sony','Delhi','Sony India',69999,12,145,10149855,5,4.9,'2025-02-18',2,'Yes'),
(111,'Mi Power Bank','Accessories','Xiaomi','Ahmedabad','Xiaomi India',1999,320,2100,4197900,25,4.2,'2024-06-01',1,'Yes'),
(112,'Canon EOS R8','Camera','Canon','Bangalore','Canon India',139999,10,75,10499925,6,4.8,'2025-01-25',2,'Yes'),
(113,'HP Pavilion','Laptop','HP','Chennai','HP India',78000,26,205,15990000,9,4.5,'2024-12-15',2,'Yes'),
(114,'OnePlus 14','Smartphone','OnePlus','Hyderabad','OnePlus India',64999,38,390,25349610,12,4.6,'2025-02-22',2,'Yes'),
(115,'TP-Link AX3000','Networking','TP-Link','Pune','TP-Link India',8999,72,430,3869570,15,4.4,'2024-08-10',3,'Yes');

select (QuantityInStock * UnitPrice) as TotalInventoryValue from Pros

select sum(revenue) as TotalRevenue from Pros

select cast(avg(UnitPrice)as decimal(10,2)) as AvgProductPrice from Pros

select ProductID, ProductName, Revenue from Pros where Revenue = (select MAX(Revenue) from Pros)

select ProductID, ProductName, CustomerRating from Pros where CustomerRating = (select MIN(CustomerRating) from Pros)

select sum(QuantityInStock) as TotalStock from Pros

select PRODUCTName, avg(QuantityInStock) as AvgStock from Pros group by ProductName

select max(UnitsSold) as HighestInStock from Pros

select min(UnitsSold) as LowestInStock from Pros

select sum(UnitsSold) as SoldUnits from Pros

select count(distinct Brand) as TotalBrand from Pros

select count(distinct Category) as SoldUnits from Pros

select ProductName, sum(WarrantyYears) as ProductsWarranty from Pros group by ProductName having sum(WarrantyYears) > 2

select ProductName, sum(WarrantyYears) as ProductsWarranty from Pros group by ProductName having sum(WarrantyYears) > 2
