/*Create View with top 10 LSOA codes for sexual assaults for 2014*/

Create view vw_top10sexualAssaults2014
as


with popsbylocyear --CTE which count the full population/year/LSOA code
as
(select
	[Area Codes]
	,[Year]
,sum([Population]) [Full Population]
from DimFullPopulation
group by [Area Codes],[Year]
) 

, crimbylocyear --CTE whuch counts the number of crime/year/LSOA code
as
(select
	l.[LSOA Name]
	,d.[year]
	,count(*) [Crime Occurence]
from DimCrimeID c

join DimLocation l
	on l.[Location ID]=c.LocationID

join DimDate d
	on d.[Date ID]=c.DateID

join CrimeTypeID ct
	on ct.CrimeTypeID=c.TypeCrimeID

where 1 = 1
	and ct.categories='Violence and sexual offences'
	and l.[LSOA Code] != ''
group by [LSOA Name],[Year]
--order by [Crime Occurence] desc
)

select distinct top 10
	l.[LSOA Name]
	,pbly.[Year]
	,pbly.[Full Population]
	,cbly.[Crime Occurence]
	,cast(cbly.[Crime Occurence] as float)/cast(pbly.[Full Population] as float) CrimePerHead
from DimCrimeID c

join dimlocation l
	on l.[Location ID]=c.[LocationID]

right outer join popsbylocyear pbly
 on l.[LSOA Code]=pbly.[Area Codes]

right outer join crimbylocyear cbly
	on l.[LSOA Name]=cbly.[LSOA Name]
	and pbly.[year]=cbly.[Year]

join DimGeography g
	on c.GeographyID=g.GeographyID

where 1=1
	and pbly.[year]='2014'

order by CrimePerHead desc


