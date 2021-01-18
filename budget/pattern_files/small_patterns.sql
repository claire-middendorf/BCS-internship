--07/30/2020  

--Total= 9505 rows

--Plant Tender (4)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Plant Tender%'  then 'Plant Tender' 
	else null end as pattern_planttender
	, count(*) as row_count 
from subset 
where descr similar to '%Plant Tender%'  
group by case when descr similar to '%Plant Tender%'  then 'Plant Tender'
	else null end
order by row_count desc  

--51 rows

--Sierra Springs (5) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Sierra Springs%'  
	or descr similar to '%sierra springs%' then 'Sierra Springs'
	else null end as pattern_sierrasprings
	, count(*) as row_count 
from subset 
where descr similar to '%Sierra Springs%'  
	or descr similar to '%sierra springs%'
group by case when descr similar to '%Sierra Springs%' 
	or descr similar to '%sierra springs%' then 'Sierra Springs'
	else null end
order by row_count desc 

-- 189 rows

--Year-End (8) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Year-End%' then 'Year-End'
	when descr similar to '%year-end%' then 'Year-End' 
	when descr similar to '%YE%' then 'Year-End'
	else null end as pattern_YE
	, count(*) as row_count 
from subset 
where descr similar to '%Year-End%' 
	or descr similar to '%year-end%' 
	or descr similar to '%YE%'
group by case when descr similar to '%Year-End%' then 'Year-End'
	when descr similar to '%year-end%' then 'Year-End' 
	when descr similar to '%YE%' then 'Year-End'
	else null end
order by row_count desc  

--1584 rows

--Pepsi (10) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Pepsi%' then 'Pepsi'
	else null end as pattern_pepsi
	, count(*) as row_count 
from subset 
where descr similar to '%Pepsi%'  
group by case when descr similar to '%Pepsi%' then 'Pepsi'
	else null end
order by row_count desc 

--34 rows

--Canteen (11)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Canteen%' then 'Canteen' 
	else null end as pattern_canteen
	, count(*) as row_count 
from subset 
where descr similar to '%Canteen%'  
group by case when descr similar to '%Canteen%' then 'Canteen' 
	else null end 
order by row_count desc

--17 rows 

--Shred-it (12) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%SHRED-IT%' 
	or descr similar to '%Shred-it%' then 'Shred-it'
	else null end as pattern_shredit
	, count(*) as row_count 
from subset 
where descr similar to '%SHRED-IT%' 
	or descr similar to '%Shred-it%'  
group by case when descr similar to '%SHRED-IT%' 
	or descr similar to '%Shred-it%' then 'Shred-it'
	else null end
order by row_count desc 

-- 4 rows


--Print (15) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Print%'  
	or descr similar to '%print%'  
	or descr similar to '%printing%' then 'Print'
	else null end as pattern_print
	, count(*) as row_count 
from subset 
where descr similar to '%Print%'
	or descr similar to '%print%'  
	or descr similar to '%printing%' 
group by case when descr similar to '%Print%'  
	or descr similar to '%print%'
	or descr similar to '%printing%' then 'Print'
	else null end
order by row_count desc  

-- 1271 rows

---Lile International Companies (17)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Lile International Companies%' then 'Lile International Companies' 
	else null end as pattern_lile
	, count(*) as row_count 
from subset 
where descr similar to '%Lile International Companies%'  
group by case when descr similar to '%Lile International Companies%' then 'Lile International Companies'
	else null end
order by row_count desc 

--24 rows

--Stanley Convergent Security Solutions (18)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Stanley Convergent Security Solutions%' then 'Stanley Convergent Security Solutions' 
	else null end as pattern_Systrackingid
	, count(*) as row_count 
from subset 
where descr similar to '%Stanley Convergent Security Solutions%'  
group by case when descr similar to '%Stanley Convergent Security Solutions%' then 'Stanley Convergent Security Solutions'
	else null end
order by row_count desc

--46 rows

--Security Pattern (21) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Security%'  then 'Security' 
	else null end as pattern_OD
	, count(*) as row_count 
from subset 
where descr similar to '%Security%'  
group by case when descr similar to '%Security%'  then 'Security'
	else null end
order by row_count desc
--125 rows

--Pattern 22- Opening Day (count)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Opening Days%'  then 'Opening Day' 
	when descr similar to '%OD %' then 'Opening Day'
	else null end as pattern_OD
	, count(*) as row_count 
from subset 
where descr similar to '%Opening Days%'  
	or descr similar to '%OD %'
group by case when descr similar to '%Opening Days%'  then 'Opening Day'
	when descr similar to '%OD %' then 'Opening Day'
	else null end
order by row_count desc			

--48 rows 

--Motor Pool (23) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Motor Pool%'  then 'Motor Pool' 
	else null end as pattern_motorpool
	, count(*) as row_count 
from subset 
where descr similar to '%Motor Pool%'  
group by case when descr similar to '%Motor Pool%'  then 'Motor Pool'
	else null end
order by row_count desc 	 

-- 177 rows 

--Sys Tracking id (24)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Sys tracking id%'  then 'Sys tracking id' 
	else null end as pattern_Systrackingid
	, count(*) as row_count 
from subset 
where descr similar to '%Sys tracking id%'  
group by case when descr similar to '%Sys tracking id%'  then 'Sys tracking id'
	else null end
order by row_count desc

--645 rows

--Allocation (25)
select 
	case when descr similar to '%allocation%' then 'allocation' 
	when descr similar to '%allocate%' then 'allocation'
	else null end as allocation_pattern
	, count(*) as row_count 
from dev.budget_staging 
where descr similar to '%allocation%'  
	or descr similar to '%allocate%'
group by case when descr similar to '%allocation%' then 'allocation' 
	when descr similar to '%allocate%' then 'allocation'
	else null end
order by row_count desc
limit 100;  

-- 67 rows  

--Pattern 26- Xerox Pattern (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Xerox%'  then 'Xerox' 
	else null end as pattern_Xerox
	, count(*) as row_count 
from subset 
where descr similar to '%Xerox%'  
group by case when descr similar to '%Xerox%'  then 'Xerox'
	else null end
order by row_count desc 

-- 1458 rows 

--Pattern 27- Campus Safety Pattern (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Campus Safety%'  then 'Campus Safety' 
	else null end as pattern_campussafety
	, count(*) as row_count 
from subset 
where descr similar to '%Campus Safety%'  
group by case when descr similar to '%Campus Safety%'  then 'Campus Safety'
	else null end
order by row_count desc  

-- 253 rows  

--Pattern 28- Id Card Replacement Pattern (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Id Card Replacement%'  then 'Id Card Replacement' 
	else null end as pattern_id
	, count(*) as row_count 
from subset 
where descr similar to '%Id Card Replacement%'  
group by case when descr similar to '%Id Card Replacement%'  then 'Id Card Replacement'
	else null end
order by row_count desc  

-- 18 rows  

--Pattern 29- Stationery (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Stationery%'  then 'Stationery' 
	else null end as pattern_Stationery
	, count(*) as row_count 
from subset 
where descr similar to '%Stationery%'  
group by case when descr similar to '%Stationery%'  then 'Stationery'
	else null end
order by row_count desc  

-- 288 rows 

--Pattern 30- Paper (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%'  
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Paper%'  then 'Paper' 
	else null end as pattern_paper
	, count(*) as row_count 
from subset 
where descr similar to '%Paper%'  
group by case when descr similar to '%Paper%'  then 'Paper'
	else null end
order by row_count desc  

-- 313 rows 

--Pattern 31- Candy (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Candy%'  then 'Candy' 
	else null end as pattern_candy
	, count(*) as row_count 
from subset 
where descr similar to '%Candy%'  
group by case when descr similar to '%Candy%'  then 'Candy'
	else null end
order by row_count desc  

-- 30 rows 

--Pattern 33- Arlington Club (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Arlington Club%'  then 'Arlington Club' 
	else null end as pattern_aclub
	, count(*) as row_count 
from subset 
where descr similar to '%Arlington Club%'  
group by case when descr similar to '%Arlington Club%'  then 'Arlington Club'
	else null end
order by row_count desc   

-- 60 rows 

--Pattern 34- Salem (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%'
)  
select 
	case when descr similar to '%Salem%'  then 'Salem' 
	else null end as pattern_Salem
	, count(*) as row_count 
from subset 
where descr similar to '%Salem%'  
group by case when descr similar to '%Salem%'  then 'Salem'
	else null end
order by row_count desc   

-- 198 rows 

--Pattern 35- Alliance Airport Advertising (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%'
)  
select 
	case when descr similar to '%Alliance Airport Advertising%'  then 'Alliance Airport Advertising' 
	else null end as pattern_Salem
	, count(*) as row_count 
from subset 
where descr similar to '%Alliance Airport Advertising%'  
group by case when descr similar to '%Alliance Airport Advertising%'  then 'Alliance Airport Advertising'
	else null end
order by row_count desc 

--33 rows  

--Pattern 36- Meter Charges (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%'
)  
select 
	case when descr similar to '%meter charges%'  then 'Meter Charges' 
	when descr similar to '%Meter Charges%' then 'Meter Charges' 
	when descr similar to '%meter chgs%'  then 'Meter Charges' 
	when descr similar to '%Meter Chgs%' then 'Meter Charges' 
	else null end as pattern_mc
	, count(*) as row_count 
from subset 
where descr similar to '%meter charges%'
	or descr similar to '%Meter Charges%' 
	or descr similar to '%meter chgs%'   
	or descr similar to '%Meter Chgs%'
group by case when descr similar to '%meter charges%'  then 'Meter Charges' 
	when descr similar to '%Meter Charges%' then 'Meter Charges'
	when descr similar to '%meter chgs%' then 'Meter Charges' 
	when descr similar to '%Meter Chgs%' then 'Meter Charges' 
	else null end
order by row_count desc  

-- 814 rows 

--Pattern 37- UPS (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%'
)  
select 
	case when descr similar to '%UPS%'  then 'UPS'  
	else null end as pattern_mc
	, count(*) as row_count 
from subset 
where descr similar to '%UPS%'  
group by case when descr similar to '%UPS%'  then 'UPS' 
	else null end
order by row_count desc 

-- 225 rows  

--Pattern 38- BRM (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%'
)  
select 
	case when descr similar to '%BRM%'  then 'UBRMPS'  
	else null end as pattern_brm
	, count(*) as row_count 
from subset 
where descr similar to '%BRM%'  
group by case when descr similar to '%BRM%'  then 'BRM' 
	else null end
order by row_count desc 

-- 66 rows 

--Pattern 39- Postage (count) 
with subset as
( 
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%' 
		and descr not similar to '%UPS%' 
		and descr not similar to '%BRM%'
)  
select 
	case when descr similar to '%Postage%'  then 'Postage'  
	else null end as pattern_postage
	, count(*) as row_count 
from subset 
where descr similar to '%Postage%'  
group by case when descr similar to '%Postage%'  then 'Postage' 
	else null end
order by row_count desc  

-- 70 rows 

--Pattern 40- Processing (count) 
with subset as
( 
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%' 
		and descr not similar to '%UPS%' 
		and descr not similar to '%BRM%'
)  
select 
	case when descr similar to '%Processing%'  then 'Processing'  
	else null end as pattern_processing
	, count(*) as row_count 
from subset 
where descr similar to '%Processing%'  
group by case when descr similar to '%Processing%'  then 'Processing' 
	else null end
order by row_count desc  

--51 rows 

--Pattern 41- Travel (count) 
with subset as
( 
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%' 
		and descr not similar to '%UPS%' 
		and descr not similar to '%BRM%'
)  
select 
	case when descr similar to '%Airline%' 
	or descr similar to '%Travel%'
	or descr similar to '%Hotel%' 
	or descr similar to '%airfare%' then 'Travel'  
	else null end as pattern_processing
	, count(*) as row_count 
from subset 
where descr similar to '%Airline%' 
	or descr similar to '%Travel%'
	or descr similar to '%Hotel%' 
	or descr similar to '%airfare%'  
group by case when descr similar to '%Airline%' 
	or descr similar to '%Travel%'
	or descr similar to '%Hotel%' 
	or descr similar to '%airfare%' then 'Travel'
	else null end
order by row_count desc  

--418 rows	

--Pattern 42- Experience Oregon Inc (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Experience Oregon Inc%'  then 'Experience Oregon Inc' 
	else null end as pattern_OD
	, count(*) as row_count 
from subset 
where descr similar to '%Experience Oregon Inc%'  
group by case when descr similar to '%Experience Oregon Inc%'  then 'Experience Oregon Inc'
	else null end
order by row_count desc   

--51 rows 

--Pattern 43- Verizon Wireless (count) 
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr similar to '%Verizon Wireless%'  then 'Verizon Wireless' 
	else null end as pattern_OD
	, count(*) as row_count 
from subset 
where descr similar to '%Verizon Wireless%'  
group by case when descr similar to '%Verizon Wireless%'  then 'Verizon Wireless'
	else null end
order by row_count desc   

--118 rows 

--Pattern 44- Motor Pool (count) 
with subset as
( 
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%' 
		and descr not similar to '%UPS%' 
		and descr not similar to '%BRM%'
)  
select 
	case when descr similar to '%Motor Pool%' 
	or descr similar to '%Motorpool%' then 'Motor Pool'  
	else null end as pattern_motorpool
	, count(*) as row_count 
from subset 
where descr similar to '%Motor Pool%' 
	or descr similar to '%Motorpool%'  
group by case when descr similar to '%Motor Pool%' 
	or descr similar to '%Motorpool%' then 'Motor Pool' 
	else null end
order by row_count desc 

--212 rows 

--Pattern 45- Fees (count)
with subset as
( 
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%Plant Tender%'
		and descr not similar to '%Sierra Springs%'
		and descr not similar to '%sierra springs%'
		and descr not similar to '%BonApp%' 
		and descr not similar to '%Bon App%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Pepsi%'
		and descr not similar to '%Canteen%'
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%' 
		and descr not similar to '%Inc%' 
		and descr not similar to '%UPS%' 
		and descr not similar to '%BRM%'
)  
select 
	case when descr similar to '%fee%' 
	or descr similar to '%Fee%'
	and not descr similar to '%Coffee%' then 'Fees'  
	else null end as pattern_fees
	, count(*) as row_count 
from subset 
where descr similar to '%fee%' 
	or descr similar to '%Fee%'
	and not descr similar to '%Coffee%'  
group by case when descr similar to '%fee%' 
	or descr similar to '%Fee%'
	and not descr similar to '%Coffee%' then 'Fees'
	else null end
order by row_count desc 

--547 rows











