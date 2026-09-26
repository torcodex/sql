create database assignments

use assignments
go

------ Question 1 ------

create or alter function stuffing(@RestaurantType VARCHAR(200))
returns VARCHAR(200)
as
begin
    return REPLACE(@RestaurantType, 'Quick Bites', 'Quick Chicken Bites');
end;
go

update Jomato
set RestaurantType = dbo.stuffing(RestaurantType)
where RestaurantType = 'Quick Bites';

select * from Jomato

------ Question 2 ------
create or alter function max_rating()
returns table
as
return(
   select RestaurantName,CuisinesType
   from Jomato
   where Rating = 
       (select max(rating) 
       from Jomato)
);
go

select * from dbo.max_rating();


------ Question 3 ------

alter table Jomato
add RatingStatus varchar(200);


update Jomato 
set RatingStatus = 
case 
when Rating >= 4 then 'Excellent'
when Rating >=3.5 then 'Good'
else 'Bad'
end


------ Question 4 ------

select CEILING(Rating) as CeilingRating, FLOOR(Rating) as FloorRating, 
ABS(Rating) as AbsoluteRating, GETDATE() as Date, YEAR(GETDATE()) as Year,
datename(month,GETDATE()) as Month, DATENAME(WEEKDAY,GETDATE()) as Day
from Jomato

------ Question 4 ------

select RestaurantType, sum(AverageCost)  AS TotalAverageCost
from Jomato 
GROUP BY ROLLUP(RestaurantType);