/* Create a view with everything */

create view dbo.FullData
as
select 
	dc.CrimeID
	,dd.[year]
	,dd.[Month]
	,dd.Season
	,dd.[Quarter]
	,ct.[CrimeType Name]
	,ct.[Categories]
	,l.[LSOA Code]
	,l.[LSOA Name]
from DimCrimeID dc

left join dimdate dd
	on dd.[Date ID]=dc.DateID

left join CrimeTypeID ct
	on ct.CrimeTypeID=dc.TypeCrimeID

left join DimLocation l
	on l.[Location ID]=dc.LocationID
