/* Create main Table with Crime ID*/

use Crime
go

--drop table dbo.CrimeTypeID

--create Crime-ID

create table DimCrimeID
(CrimeID int identity primary key
,DateID varchar(10) null 
,LocationID int null
,TypeCrimeID int null
,GeographyID int null
)

insert into DimCrimeID
(DateID,
LocationID, 
TypeCrimeID,
GeographyID)

select
	d.[date ID] 
	,l.[Location ID]
	,tc.CrimeTypeID
	,g.GeographyID
from [dbo].[RawCrime] c

join Dimdate d
on d.[date ID]=c.[Month]

join dimlocation l
	on l.[LSOA code]=c.[LSOA code]

join CrimeTypeID tc
 on tc.[CrimeType Name]=c.[Crime type]

 join DimGeography g
	on g.Latitude=c.Latitude
	and g.Longitude=c.Longitude

--truncate table dbo.DimCrimeID

select * from DimCrimeID

