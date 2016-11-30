with popsbylocyear
as
(
SELECT [Area Codes]
      ,[Year ]
      ,sum([Population]) pop
      
FROM [Crime].[dbo].[DimFullPopulation]
group by
[Area Codes]
      ,[Year ]
)
select * from popsbylocyear