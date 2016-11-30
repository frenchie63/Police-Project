/* Alter DimFullPopulation table to get percentage */

use Crime
go

alter table DimFullPopulation
add PercentagePerAge float

update DimFullPopulation
set PercentagePerAge = (cast([Population] as float)/cast([All Ages] as float))*100


select top 1000 * from DimFullPopulation