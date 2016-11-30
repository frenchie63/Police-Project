/* Create View with the number of assaults per season per year */

create view vw_assaultsperseasonperyear
as
with assaultsbyseasonbyyear 
as
(
select
	d.[year]
	,d.Season
	,count(*) [Crime Occurence]
from DimCrimeID c

join DimDate d
	on d.[Date ID]=c.DateID

join CrimeTypeID ct
	on ct.CrimeTypeID=c.TypeCrimeID

where 1=1
	and ct.Categories like '%sexual%'

group by d.[year],d.Season
)
, assaultbyyear 
as
(
select 
	d.[year]
	,count(*) [Crime Occurence Per Year]
from DimCrimeID c

join DimDate d
	on d.[Date ID]=c.DateID

join CrimeTypeID ct
	on ct.CrimeTypeID=c.TypeCrimeID

where 1=1
	and ct.Categories like '%sexual%'

group by d.year
)

select distinct
	season.year
	,season.season
	,season.[Crime Occurence]
	,yr.[Crime Occurence Per Year]
	,(cast(season.[Crime Occurence] as float)/cast(yr.[Crime Occurence Per Year] as float))*100 Percentage 
from assaultsbyseasonbyyear season

join assaultbyyear yr
	on yr.Year=season.Year
