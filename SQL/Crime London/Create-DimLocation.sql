create table DimLocation
(
[Location ID] int identity not null primary key,
[LSOA Code] varchar(50),
[LSOA Name] varchar(50)
)
GO

drop table #location
select
[LSOA code]
,[LSOA Name]
into #location
from rawcrime
group by
[LSOA code],[LSOA Name]

insert into DimLocation
([LSOA Code], [LSOA Name])
Select
[LSOA code]
,[LSOA name]
from #location

--truncate table dimlocation

select * from DimLocation
