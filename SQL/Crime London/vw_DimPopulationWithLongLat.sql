/*Create a view with Full Population with latitude and longitude */

use Crime
go

create view vw_DimPopulationWithLongLat
as

select
	fp.[Area Names]
	,g.Longitude
	,g.Latitude 
	,fp.[Year ]
	,fp.[All Ages]
	,fp.[Age Bracket]
	,fp.Gender
from dbo.DimFullPopulation fp

join DimLocation l
	on l.[LSOA Code] = fp.[Area Codes]

join DimCrimeID c
	on c.LocationID = l.[Location ID]

join DimGeography g
	on g.GeographyID = c.GeographyID