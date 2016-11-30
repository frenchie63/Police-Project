/*Create view with the different categories of crime and their occurence for years 2011,2012,2013, 2014 and 2015*/

create view vw_CrimeCategoriesOccurenceperYearPivoted
as
select Name,[2011],[2012],[2013],[2014],[2015]
from(select c.typecrimeid [type], d.year [year], t.[Categories] Name
from dbo.DimCrimeID c
join dbo.DimDate d on c.DateID=d.[Date ID]
join dbo.CrimeTypeID t on c.TypeCrimeID=t.CrimeTypeID) as Dim

pivot (count([type]) for [year] in ([2011],[2012],[2013],[2014],[2015])) as pvt

--order by name -- to be left out for view