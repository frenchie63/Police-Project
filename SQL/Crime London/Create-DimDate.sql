/* Create Normalized DimDate */

create table DimDate
(
[Date ID] varchar(10) not null primary key,
[Year] varchar(10),
[Month] varchar(10),
[Season] varchar(10),
[Quarter] varchar(10)
)
GO

insert into DimDate
([Date ID], [Year], [Month], [Season], [Quarter])
Select
[Month]
,left([Month], 4)
,right([Month], 2)
,case when right([Month], 2) in ('12', '01', '02') then 'Winter'
when right([Month], 2) in ('03', '04', '05') then 'Spring'
when right([Month], 2) in ('06', '07', '08') then 'Summer'
when right([Month], 2) in ('09', '10', '11') then 'Autumn'
else right([Month], 2)
end
,case when right([Month], 2) in ('01', '02', '03') then 'Q1'
when right([Month], 2) in ('04', '05', '06') then 'Q2'
when right([Month], 2) in ('07', '08', '09') then 'Q3'
when right([Month], 2) in ('10', '11', '12') then 'Q4'
else right([Month], 2)
end
from dbo.RawCrime
group by [Month]