/*Create View with
LSOA Code - Year - Nb of crimes - Full Population - NbCrime/Full Pop*/

create view vw_2012_CrimeOccurence
as

with popsbylocyear --CTE which count the full population/year/LSOA code
as
(select
[Area Codes]
,[Year]
,sum([Population]) [Full Population]
from DimFullPopulation
group by [Area Codes],
	[year]
) 

, crimbylocyear --CTE whuch counts the number of crime/year/LSOA code
as
(select
	[LSOA Code]
	,d.[Year]
	,count(*) [Crime Occurence]
from DimCrimeID c

join DimLocation l
	on l.[Location ID]=c.LocationID

join DimDate d
	on d.[Date ID]=c.DateID

group by [LSOA code] ,[Year]
)

select distinct top 10
	l.[LSOA Code]
	,pbly.[Year]
	,pbly.[Full Population]
	,cbly.[Crime Occurence]
	,cast(cbly.[Crime Occurence] as float)/cast(pbly.[Full Population] as float) CrimePerHead
from DimCrimeID c

join dimlocation l
	on l.[Location ID]=c.[LocationID]

join popsbylocyear pbly
 on l.[LSOA Code]=pbly.[Area Codes]

join crimbylocyear cbly
	on l.[LSOA Code]=cbly.[LSOA Code]

 where pbly.[year]='2012'
 order by CrimePerHead desc
 