CREATE TABLE Custms (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Gender VARCHAR(10),
    Age INT,
    City VARCHAR(50),
    Membership VARCHAR(20),
    SignupDate DATE,
    TotalOrders INT,
    TotalSpent DECIMAL(10,2),
    PreferredPayment VARCHAR(20),
    Email VARCHAR(100),
    ReferralCode VARCHAR(20) NULL
);

INSERT INTO Custms VALUES
(101,'Rahul Sharma','Male',26,'Mumbai','Gold','2023-01-12',42,68500,'UPI','rahul@gmail.com','REF101'),
(102,'Priya Nair','Female',34,'Bangalore','Silver','2024-03-15',18,24500,'Credit Card','priya@gmail.com',NULL),
(103,'Arjun Patel','Male',29,'Ahmedabad','Gold','2022-07-18',65,98200,'UPI','arjun@gmail.com','REF202'),
(104,'Sneha Das','Female',24,'Delhi','Bronze','2025-01-08',7,5800,'Cash','sneha@gmail.com',NULL),
(105,'Karan Mehta','Male',31,'Mumbai','Gold','2021-05-21',81,145000,'Debit Card','karan@gmail.com','REF303'),
(106,'Meera Joseph','Female',27,'Kochi','Silver','2023-09-11',24,31500,'UPI','meera@gmail.com',NULL),
(107,'Vikram Rao','Male',22,'Hyderabad','Bronze','2025-04-18',5,4200,'Cash','vikram@gmail.com',NULL),
(108,'Anjali Singh','Female',39,'Pune','Platinum','2020-06-15',132,285000,'Credit Card','anjali@gmail.com','VIP001'),
(109,'Rohan Verma','Male',28,'Delhi','Silver','2022-10-02',33,41800,'UPI','rohan@gmail.com','REF404'),
(110,'Divya Thomas','Female',30,'Chennai','Gold','2021-12-20',74,118500,'Debit Card','divya@gmail.com','REF505'),
(111,'Amit Gupta','Male',35,'Bangalore','Platinum','2019-08-12',156,365000,'Credit Card','amit@gmail.com','VIP002'),
(112,'Pooja Menon','Female',25,'Trivandrum','Bronze','2025-02-01',3,1800,'Cash','pooja@gmail.com',NULL);

CREATE TABLE Ordss (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    RestaurantName VARCHAR(100),
    Cuisine VARCHAR(50),
    OrderDate DATE,
    DeliveryCity VARCHAR(50),
    OrderAmount DECIMAL(10,2),
    DeliveryFee DECIMAL(8,2),
    PaymentMethod VARCHAR(20),
    DeliveryStatus VARCHAR(20),
    DeliveryTimeMinutes INT,
    CouponCode VARCHAR(20) NULL
);


INSERT INTO Ordss VALUES
(5001,101,'Burger Hub','Fast Food','2026-02-01','Mumbai',850,40,'UPI','Delivered',32,'SAVE50'),
(5002,102,'Pizza Palace','Italian','2026-02-02','Bangalore',1290,60,'Credit Card','Delivered',48,NULL),
(5003,103,'Spice Route','Indian','2026-02-02','Ahmedabad',680,30,'UPI','Cancelled',0,NULL),
(5004,104,'Dragon Bowl','Chinese','2026-02-03','Delhi',990,50,'Cash','Delivered',55,'NEWUSER'),
(5005,105,'BBQ Nation','Barbecue','2026-02-03','Mumbai',2150,75,'Debit Card','Delivered',64,'MEGA100'),
(5006,106,'Cafe Aroma','Cafe','2026-02-04','Kochi',540,25,'UPI','Preparing',0,NULL),
(5007,107,'Taco Fiesta','Mexican','2026-02-04','Hyderabad',430,20,'Cash','Cancelled',0,NULL),
(5008,108,'Royal Biryani','Indian','2026-02-05','Pune',1850,60,'Credit Card','Delivered',38,'VIP200'),
(5009,109,'Sushi Zen','Japanese','2026-02-05','Delhi',1640,55,'UPI','Out for Delivery',0,NULL),
(5010,110,'Healthy Bowl','Healthy','2026-02-06','Chennai',760,35,'Debit Card','Delivered',28,NULL),
(5011,111,'Steak House','American','2026-02-06','Bangalore',2980,80,'Credit Card','Delivered',71,'VIP500'),
(5012,112,'Idli Express','South Indian','2026-02-07','Trivandrum',240,15,'Cash','Preparing',0,NULL);



select 
customerID, CustomerName, Membership, TotalSpent 
from custms 
where Membership in ('Gold', 'Platinum') and TotalSpent >10000
order by TotalSpent desc

select 
CustomerName, City, Membership, ReferralCode 
from custms 
where 
ReferralCode is null

select 
CustomerName, Age, Membership, SignupDate 
from custms 
where 
Age between 18 and 30 and SignupDate > '2024-01-01'

select 
CustomerName, Age, PreferredPayment, City 
from custms 
where 
PreferredPayment in ('UPI', 'Credit Card')

select 
CustomerID, CustomerName, Age, Email, City 
from custms 
where 
Email like 'a%'

select * from custms 
where Membership not in ('Bronze')

select * from Custms where city in ('Mumbai', 'Bangalore', 'Pune')



select orderId, RestaurantName, OrderAmount, PaymentMethod from Ordss where OrderAmount between 1500 and 3000 order by OrderAmount desc

select orderId, RestaurantName, DeliveryStatus, DeliveryTimeMinutes from Ordss where DeliveryTimeMinutes > 45

select orderId, RestaurantName, OrderAmount, CouponCode from Ordss where CouponCode is not null

select orderId, RestaurantName, OrderAmount, CouponCode from Ordss where CouponCode is null

select orderId, RestaurantName, DeliveryStatus, DeliveryTimeMinutes from Ordss where DeliveryStatus in ('Preparing', 'Out for Delivery')

select RestaurantName, Cuisine, OrderAmount from Ordss where RestaurantName like '%House%'

select OrderID, RestaurantName, OrderAmount, DeliveryTimeMinutes, PaymentMethod from Ordss 
where OrderAmount>700 and PaymentMethod = 'UPI' and DeliveryStatus = 'Delivered' and DeliveryTimeMinutes between 30 and 60

select OrderID, RestaurantName, OrderAmount, DeliveryStatus, DeliveryTimeMinutes, CouponCode from Ordss 
where OrderAmount>2000 or PaymentMethod = 'UPI' or DeliveryStatus = 'Cancelled' or DeliveryTimeMinutes > 60 or CouponCode is null
