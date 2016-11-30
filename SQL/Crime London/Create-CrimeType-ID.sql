use Crime
go

--drop table dbo.CrimeTypeID

--create CrimeTypeID
create table CrimeTypeID
(CrimeTypeID int identity not null primary key
,[CrimeType Name] varchar (30) null --max length=28
,[Categories] varchar (30) null
)

insert into CrimeTypeID
([CrimeType Name], [Categories])

select distinct
	[Crime type]
	,case 
		when rc.[Crime type] like '%theft%' then 'Theft'
		when rc.[Crime type] in ('Burglary','Robbery','Shoplifting') then 'Theft'
		when rc.[Crime type] like '%crime%' then 'Crime'
		when rc.[Crime type] like '%pub%' then 'Public disorder'
		when rc.[Crime type] like 'Anti-social behaviour' then 'Public disorder'
		when rc.[Crime type] in ('Drugs','Possession of weapons') then 'Possession'
		else [Crime type]
	end Categories
from dbo.RawCrime rc

select * from CrimeTypeID