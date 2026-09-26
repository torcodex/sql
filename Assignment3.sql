------ Question 1 ------
create or alter Procedure Display
as
begin
	select RestaurantName, RestaurantType, CuisinesType
	from Jomato
	where TableBooking > 0
end

exec Display

------ Question 2 ------

begin transaction

	update Jomato
	set CuisinesType = 'Cafeteria'
	where CuisinesType = 'Cafe'

-- It worked
--53	4th Tea Block	Cafe	4	62	150	0	0	""Cafeteria""	Basavanagudi	Jayanagar	38	Excellent

Rollback transaction

--53	4th Tea Block	Cafe	4	62	150	0	0	""Cafe""	Basavanagudi	Jayanagar	38	Excellent


------ Question 3 ------
with ctes as(
	select ROW_NUMBER() over(order by Rating desc) as Rank, 
	Area, max(Rating) as HighestRating
	from Jomato
	group by Area, Rating
)
select Rank, Area, Round(HighestRating,2) from ctes

------ Question 4 ------
declare @i int = 1
while(@i <= 50)
begin
	print @i
	set @i = @i+1
end

------ Question 5 ------

create or alter view TopRating
as
select top 5 
	RestaurantName, RestaurantType, Rating
	from Jomato
	order by Rating desc

select * from TopRating

------ Question 6 ------

create or alter trigger trg_NewRestaurant
on Jomato
AFTER INSERT
as
BEGIN
    print 'A new restaurant record has been inserted successfully.';
END

insert into Jomato values
(
    1001,
    'ABC Restaurant',
    'Casual Dining',
    4.5,
    1200,
    800,
    1,
    0,
    'North Indian',
    'Indiranagar',
    '100 Feet Road',
    30,
    'Excellent'
)

select * from Jomato