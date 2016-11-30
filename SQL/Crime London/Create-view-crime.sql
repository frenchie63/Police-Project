/*Create Full View */

create view vw_Crime
as
select
	dc.CrimeID
	,d.[Month]
	,d.[Year]
	,d.Season
	,d.[Quarter]
	,l.[LSOA Code]
	,l.[LSOA Name]
	,tc.[CrimeType Name]
	,tc.Categories
	,g.Longitude
	,g.Latitude
from [dbo].[DimCrimeID] dc

left join Dimdate d
on d.[date ID]=dc.DateID

left join dimlocation l
	on l.[Location ID]=dc.LocationID

left join CrimeTypeID tc
 on tc.CrimeTypeID=dc.TypeCrimeID

left join DimGeography g
	on g.GeographyID=dc.GeographyID