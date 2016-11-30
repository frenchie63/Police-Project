/* Create the crime list with latitude and longitude
NB SQL read it Longitude then Latitude */


Create table DimGeography
(GeographyID int identity not null primary key
,Longitude varchar(50) null
,Latitude varchar(50) null
)

--truncate table DimGeography

insert into DimGeography
(Longitude,
Latitude)

select distinct
	rc.Longitude
	,rc.Latitude
 from RawCrime rc
 where 1=1
		and rc.Longitude != ''
		and rc.Latitude != ''

-- Create the spatial coordinates for futur analysis with distance
 alter table dimgeography add [SpatialCoordinates] geography

  update crime.dbo.DimGeography
  set [SpatialCoordinates] = geography::STGeomFromText('POINT(' +longitude +' '+ latitude +')',4326)

  select * from DimGeography

--  select
--	len(longitude)
--	,count(len(longitude))
--from dimgeography
--group by len(longitude)