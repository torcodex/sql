------ Question 1 ------

select COUNT(distinct State) as NumberOfState from Location

------ Question 2 ------

select COUNT(Type) as RegularProducts from Product where Type = 'Regular'

------ Question 3 ------

select SUM(marketing) as TotalMarketingSales from fact where ProductId = 1

------ Question 4 ------

select MIN(sales) as MinSales from fact 

------ Question 5 ------

select max(cogs) as MaxGoodSold from fact

------ Question 6 ------

select * from Product where Product_Type = 'Coffee'

------ Question 7 ------

select * from fact where Total_Expenses > 40


------ Question 8 ------

select avg(sales) as AverageSales from fact where Area_Code = 719


------ Question 9 ------

select sum(profit) as TotalProfit
from fact f join Product p 
on f.ProductId = p.ProductId
join Location l on l.Area_Code = f.Area_Code
where l.state = 'Colorado'

------ Question 10 ------

select ProductId, AVG(inventory) as AverageInventory
from fact group by ProductId


------ Question 11 ------

select distinct state from Location order by state asc

------ Question 12 ------

select ProductId, AVG(budget_Margin) as AverageMargin
from fact group by ProductId having AVG(budget_Margin) > 100

------ Question 13 ------

select sum(sales) as TotalSales 
from fact
where Date = '2010-01-01'

------ Question 14 ------

select ProductId, Date, AVG(Total_Expenses) as AverageExpenses
from fact group by ProductId, Date

------ Question 15 ------

select f.ProductId, p.Product_Type, p.Product, f.Date, f.Sales, f.Profit, f.Area_Code, l.State
from fact f join Location l on f.Area_Code = l.Area_Code
join Product p on f.ProductId = p.ProductId

------ Question 16 ------

select ProductId, sales, DENSE_RANK() over(partition by ProductId order by sales) as Rank
from fact

------ Question 17 ------

select l.State, sum(f.Profit) as TotalProfit, sum(f.Sales) as TotalSales
from fact f join location l 
on f.Area_Code = l.Area_Code
group by l.State

------ Question 18 ------

select l.State, p.product, sum(f.Profit) as TotalProfit, sum(f.Sales) as TotalSales
from fact f join location l 
on f.Area_Code = l.Area_Code
join product p on p.ProductId = f.productId
group by l.State, Product

------ Question 19 ------

update fact 
set Sales += (Sales * 0.05)

------ Question 20 ------

select f.ProductId, p.Product_Type, max(f.Profit) as MaxProfit
from fact f join Product p 
on f.ProductId = p.ProductId
group by f.ProductId, p.Product_Type

------ Question 21 ------

create or alter procedure result(@Type varchar(200))
as 
begin
	select * from Product where Product_Type = @Type
end 

exec dbo.result 'Coffee'

------ Question 22 ------

select Total_Expenses,
case
	when Total_Expenses < 60 then 'Profit'
	else 'Loss'
end as Result	
from fact

------ Question 23 ------

select date, ProductId, SUM(Sales) as TotalSales,
DATEPART(WEEK,date) as WeekNumber
from fact
group by rollup(
DATEPART(WEEK,date), date, ProductId)
order by WeekNumber, Date, ProductId

------ Question 24 ------

select Area_Code from fact
Union
select Area_Code from Location

------ Question 25 ------

create or alter function Fun_Type(@Type varchar(200))
returns Table
as
	return(
	select * from Product where Product_Type = @Type)

select * from dbo.Fun_Type('Coffee')

------ Question 26 ------

begin transaction
	update Product 
	set Product_Type = 'Tea'
	where ProductId = 1

rollback

------ Question 27 ------

select ProductId, Date, Sales 
from fact 
where Total_Expenses between 100 and 200

------ Question 28 ------

DELETE from Product
where Type = 'Regular'

------ Question 28 ------

select ASCII(SUBSTRING(Product, 5, 1)) as ASCII_Value
from Product

select * from fact
select * from Location
select * from Product

