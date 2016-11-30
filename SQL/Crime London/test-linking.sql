/* link population with crime ID*/

with popsbylocyear
as
(
SELECT [Area Codes]
      ,[Year ]
      ,sum([Population]) FullPopulation
      
FROM [Crime].[dbo].[DimFullPopulation]
group by
[Area Codes]
      ,[Year ]
)
select 
	l.[LSOA Code],
	ply.FullPopulation
from popsbylocyear ply

right join dbo.DimLocation l
	on l.[LSOA Code]=ply.[Area Codes]

right join dbo.DimCrimeID dc
	on dc.LocationID=l.[Location ID]