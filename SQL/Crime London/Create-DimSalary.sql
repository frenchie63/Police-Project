/*Create table with mean and median salary for 2013 for restricted LSOA codes*/
use Crime
go

create table DimSalary
	([Code] varchar(50)
      ,[Name] varchar(50)
      ,[Borough] varchar(50)
      ,[Mean 2012 13] varchar(50)
      ,[Median 2012 13] varchar(50)
)

insert into DimSalary
(		[Code] 
      ,[Name] 
      ,[Borough] 
      ,[Mean 2012 13]
      ,[Median 2012 13])

select 
	[Code]
      ,[Name]
      ,[Borough]
      ,[Mean 2012 13]
      ,[Median 2012 13]
from [dbo].[MeanSalary]
where 1=1
	and [Name] in ('Westminster 018A','City of London 001F','Westminster 013E','Westminster 013B',
	'Westminster 018C','Hackney 027G','Westminster 018B','Camden 021A','Croydon 027B')

select * from DimSalary