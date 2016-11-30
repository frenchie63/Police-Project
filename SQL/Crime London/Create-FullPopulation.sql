/*Create Location ID
with only LSOA codes used in police crime*/

Create table FullPopulation
(
[FullPopulation-ID] int identity not null  primary key,
[Year] varchar(4),
[LSOA Code] varchar(10),
[Age Brackets] varchar(10),
[Population] int
)


insert into FullPopulation
([Year])
select
	dd.[Year]
from dbo.dimdate dd

select * from dbo.FullPopulation