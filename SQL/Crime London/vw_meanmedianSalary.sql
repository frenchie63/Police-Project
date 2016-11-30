/* Create view for Mean and Median Salary*/

create view vw_Salary
as

select 
	[Code]
      ,[Name]
      ,[Borough]
      ,cast([Mean 2012 13] as money) [Mean 2012-13]
      ,cast([Median 2012 13] as money) [Median 2012-13]
from [dbo].[MeanSalary]
where 1=1
	and [Name] in ('Westminster 018A','City of London 001F','Westminster 013E','Westminster 013B',
	'Westminster 018C','Hackney 027G','Westminster 018B','Camden 021A','Croydon 027B')

