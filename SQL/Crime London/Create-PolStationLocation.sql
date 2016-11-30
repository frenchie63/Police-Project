/* Create table of Police Station for restricted LSOA areas*/

create table PolStationLocation
(
[Police Station Name] varchar(50)
,[Borough] varchar(50)
,Longitude varchar(50)
,Latitude varchar(50)
--,[SpatialCoordinates] geography null
)

insert into PolStationLocation
([Police Station Name]
,[Borough]
,Longitude
,Latitude 
)
values
('Belgravia PS','Westminster','-0.149211','51.491283'),
('Charing Cross PS','Westminster','-0.124490','51.509825'),
('Paddington Green PS','Westminster','-0.171007','51.520536'),
('West End Central PS','Westminster',' -0.141031','51.511604'),
('Wood Street PS','City of London','-0.093961','51.516679'),
('Bishopgate PS','City of London','-0.080164','51.517803'),
('Snow Hill PS','City of London',' -0.102985','51.516996'),
('Shoreditch PS','Hackney','-0.091885','51.528703'),
('Stoke Newington PS', 'Hackney','-0.074477','51.557846'),
('Croydon PS','Croydon','-0.096240','51.370628'),
('Holborn PS','Camden','-0.117864','51.520809'),
('Kentish Town PS','Camden','-0.142075','51.549399')

select * from PolStationLocation


-- Create the spatial coordinates for futur analysis with distance
 alter table PolStationLocation add [SpatialCoordinates] geography

  update crime.dbo.PolStationLocation
  set [SpatialCoordinates] = geography::STGeomFromText('POINT(' +longitude +' '+ latitude +')',4326)

