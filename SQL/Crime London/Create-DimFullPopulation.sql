/* Create final population table from RawFullPopulation*/

--create buckets for ages
create table FullPopulation_Bucket
([Area Codes] varchar(50)
      ,[Area Names] varchar (50)
      ,[All Ages] int
      ,[0-4]  int
      ,[5-9]  int
      ,[10-14]  int
      ,[15-19]  int
      ,[20-24]  int
      ,[25-29]  int
      ,[30-34]  int
      ,[35-39]  int
      ,[40-44]  int
      ,[45-49]  int
      ,[50-54]  int
      ,[55-59]  int
      ,[60-64]  int
      ,[65-69]  int
      ,[70-74]  int
      ,[75-79]  int
      ,[80-84]  int
      ,[85-89]  int
      ,[90+]  int
	  ,[Gender] char(1)
      ,[Year ]  int
)  
insert into FullPopulation_Bucket
(  [Area Codes]  
      ,[Area Names]
      ,[All Ages]
      ,[0-4]
      ,[5-9]
      ,[10-14]
      ,[15-19]
      ,[20-24]
      ,[25-29]
      ,[30-34]
      ,[35-39]
      ,[40-44]
      ,[45-49]
      ,[50-54]
      ,[55-59]
      ,[60-64]
      ,[65-69]
      ,[70-74]
      ,[75-79]
      ,[80-84]
      ,[85-89]
      ,[90+]
	  ,[Gender]
      ,[Year ]
)

SELECT 
		[Area Codes]
      ,[Area Names]
      ,[All Ages]
	  ,cast([0] AS INT)+cast([1] AS INT) +cast([2] AS INT)+cast([3] AS INT)+cast([4] AS INT)[0-4]
     ,cast([5] AS INT)+cast([6] AS INT) +cast([7] AS INT)+cast([8] AS INT)+cast([9] AS INT)[5-9]
,cast([10] AS INT)+cast([11] AS INT) +cast([12] AS INT)+cast([13] AS INT)+cast([14] AS INT)[10-14]
,cast([15] AS INT)+cast([16] AS INT) +cast([17] AS INT)+cast([18] AS INT)+cast([19] AS INT)[15-19]
,cast([20] AS INT)+cast([21] AS INT) +cast([22] AS INT)+cast([23] AS INT)+cast([24] AS INT)[20-24]
,cast([25] AS INT)+cast([26] AS INT) +cast([27] AS INT)+cast([28] AS INT)+cast([29] AS INT)[25-29]
,cast([30] AS INT)+cast([31] AS INT) +cast([32] AS INT)+cast([33] AS INT)+cast([34] AS INT)[30-34]
,cast([35] AS INT)+cast([36] AS INT) +cast([37] AS INT)+cast([38] AS INT)+cast([39] AS INT)[35-39]
,cast([40] AS INT)+cast([41] AS INT) +cast([42] AS INT)+cast([43] AS INT)+cast([44] AS INT)[40-44]
,cast([45] AS INT)+cast([46] AS INT) +cast([47] AS INT)+cast([48] AS INT)+cast([49] AS INT)[45-49]
,cast([50] AS INT)+cast([51] AS INT) +cast([52] AS INT)+cast([53] AS INT)+cast([54] AS INT)[50-54]
,cast([55] AS INT)+cast([56] AS INT) +cast([57] AS INT)+cast([58] AS INT)+cast([59] AS INT)[55-59]
,cast([60] AS INT)+cast([61] AS INT) +cast([62] AS INT)+cast([63] AS INT)+cast([64] AS INT)[60-64]
,cast([65] AS INT)+cast([66] AS INT) +cast([67] AS INT)+cast([68] AS INT)+cast([69] AS INT)[65-69]
,cast([70] AS INT)+cast([71] AS INT) +cast([72] AS INT)+cast([73] AS INT)+cast([74] AS INT)[70-74]
,cast([75] AS INT)+cast([76] AS INT) +cast([77] AS INT)+cast([78] AS INT)+cast([79] AS INT)[75-79]
,cast([80] AS INT)+cast([81] AS INT) +cast([82] AS INT)+cast([83] AS INT)+cast([84] AS INT)[80-84]
,cast([85] AS INT)+cast([86] AS INT) +cast([87] AS INT)+cast([88] AS INT)+cast([89] AS INT)[85-89]
,cast([90+] AS INT) [90+]
   ,[Gender]
   ,[Year]
 
  FROM dbo.RawPopulation

 --pivot the table
SELECT *
into FullPopulationFinal
FROM 
   (SELECT *
   FROM [dbo].[FullPopulation_Bucket]) p
UNPIVOT
   ([Population] FOR [Age Bracket] IN 
      ([0-4]
      ,[5-9]
      ,[10-14]
      ,[15-19]
      ,[20-24]
      ,[25-29]
      ,[30-34]
      ,[35-39]
      ,[40-44]
      ,[45-49]
      ,[50-54]
      ,[55-59]
      ,[60-64]
      ,[65-69]
      ,[70-74]
      ,[75-79]
      ,[80-84]
      ,[85-89]
      ,[90+])
)AS unpvt;


--create tables with area codes only and clean empty 'area names' 
 SELECT  
	[Area Codes]
      ,[Area Names]
      ,[All Ages]
      ,[Year ]
      ,[Population]
      ,[Age Bracket]
	  ,[Gender]
into dbo.DimFullPopulation
 
  FROM [Crime].[dbo].[FullPopulationFinal]
  where 
  [Area Names] != ''
  and [Area Codes] in 
(select
[lsoa code]
from dbo.RawCrime)

-- add a primary key to DimFullPopulation
alter table dbo.DimFullPopulation
ADD FullPopulationID int identity not null primary key

select * from dbo.DimFullPopulation