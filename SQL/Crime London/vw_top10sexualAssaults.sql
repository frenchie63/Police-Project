/* union all view to get an idea of the top 10 of LSOA areas
where most sexual assaults happen */

create view vw_top10SexualAssaultAllYears
as

select 
* 
from vw_top10sexualAssaults2013

union all

select 
* 
from vw_top10sexualAssaults2014

union all

select 
* 
from vw_top10sexualAssaults2015