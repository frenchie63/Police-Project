/* create view with the area names, the year, the gender and the percentage for each*/

use Crime
go

create view vw_genderpercentperyear
as

--CTE with count the full population for each area name (restricted) per year
with popbyareabyyear 
as
(select
	[Area Names]
	,[Year]
,sum([Population]) [Full Population]
from DimFullPopulation

where 1 = 1
	and [Area Names] in ('Westminster 018A','City of London 001F','Westminster 013E','Westminster 013B',
	'Westminster 018C','Hackney 027G','Westminster 018B','Camden 021A','Croydon 027B')
	and [Year] in ('2013','2014','2015')

group by [Area Names],[Year]
) 
--CTE with count the gender population for each area name (restricted) per year
, genderpopbyareabyyear
as
(
select  
[Area Names],
[Year],
Gender,
sum(Population) [Population per gender]

from DimFullPopulation

where 1 = 1
	and [Area Names] in ('Westminster 018A','City of London 001F','Westminster 013E','Westminster 013B',
	'Westminster 018C','Hackney 027G','Westminster 018B','Camden 021A','Croydon 027B')
	and [Year] in ('2013','2014','2015')

group by Gender,[Area Names],[Year]
)

-- Put all results together and gives the percentage of M/F for each area names per year
select distinct
	pop.[Area Names]
	,pop.[Year]
	,pop.gender
	,yy.[Full Population]
	,gender.[Population per gender]
	,cast(gender.[Population per gender] as float)/cast(yy.[Full Population] as float)*100 Percentage

from DimFullPopulation pop

join popbyareabyyear yy
	on yy.[Area Names] = pop.[Area Names]
	and yy.[Year] = pop.[Year]

join genderpopbyareabyyear gender
	on gender.[Area Names] = pop.[Area Names]
	and gender.[Year] = pop.[Year]
	and gender.Gender = pop.Gender

where 1 = 1
	and pop.[Area Names] in ('Westminster 018A','City of London 001F','Westminster 013E','Westminster 013B',
	'Westminster 018C','Hackney 027G','Westminster 018B','Camden 021A','Croydon 027B')
	and pop.[Year] in ('2013','2014','2015')

