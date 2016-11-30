/* Create view with age brackets, their percentage, per gender, per year, per restricted area names*/

create view vw_PercentagePerAgePerGender
as
select distinct
	[Area Names]
	,[Year]
	,[Age Bracket]
	,Gender
	,PercentagePerAge
from DimFullPopulation

where 1 = 1
	and [Area Names] in ('Westminster 018A','City of London 001F','Westminster 013E','Westminster 013B',
	'Westminster 018C','Hackney 027G','Westminster 018B','Camden 021A','Croydon 027B')
	and [Year] in ('2013','2014','2015')

--order by [Area Names],[year],[gender]