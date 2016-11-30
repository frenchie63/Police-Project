/* view to map sexual assault for top 8 LSOA codes */

use crime
go

create view vw_assaultlocationrestricted
as
select
	l.[LSOA Name]
	,d.year
	,g. longitude
	,g.latitude
	,g.SpatialCoordinates
	
from DimCrimeID c

join DimLocation l
	on l.[Location ID]=c.locationID

join DimDate d
	on d.[Date ID]=c.DateID

join DimGeography g
	on g.GeographyID=c.GeographyID

join CrimeTypeID ct
	on ct.CrimeTypeID=c.TypeCrimeID

where 1 = 1
	and ct.Categories like '%sexual%'
	and l.[LSOA Name] in ('Westminster 018A','City of London 001F','Westminster 013E','Westminster 013B',
	'Westminster 018C','Hackney 027G','Westminster 018B','Camden 021A','Croydon 027B')


