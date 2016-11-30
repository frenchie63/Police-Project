use crime	
go

create view  vw_CrimeCategoriesOccurenceperYear
as
select
	ct.Categories
	,d.[year]
	,count(*) [Crime Occurence]
from DimCrimeID c

join DimLocation l
	on l.[Location ID]=c.LocationID

join DimDate d
	on d.[Date ID]=c.DateID

join CrimeTypeID ct
	on ct.CrimeTypeID=c.TypeCrimeID

where 1 = 1
group by ct.Categories,d.[year]
