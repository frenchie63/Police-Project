/* Create DimLocation */

create table DimLocation
(
[LocationID] int identity not null primary key,
[LSOA Code] varchar(50),
[LSOA Name] varchar(50),
)
GO

drop table #location
select
[LSOA code]
,[LSOA Name]
into #location
from dbo.RawCrime
group by
[LSOA code],[LSOA Name]

insert into DimLocation
([LSOA Code], [LSOA Name])
Select
[LSOA code]
,[LSOA name]
from #location
