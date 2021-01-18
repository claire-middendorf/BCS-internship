--07/30/2020 

--Total= 35898 rows

--SR (1)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
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
	case when descr similar to 'Sr%'
	or descr similar to 'sr%' 
	or descr similar to '%SR%' then 'SR Pattern'
	else null end as pattern_sr
	, count(*) as row_count 
from subset
where descr similar to 'Sr%'
	or descr similar to 'sr%' 
	or descr similar to '%SR%'
group by case when descr similar to 'Sr%'
	or descr similar to 'sr%' 
	or descr similar to '%SR%' then 'SR Pattern'
	else null end
order by row_count desc

--5316 rows

--Vendor 4 digit codes (2)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
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
	case when descr similar to '[0-9]{4}%' 
	and not descr like '20%' then 'Four Digit'
	else null end as pattern_fourdigit
	, count(*) as row_count 
from subset 
where descr similar to '[0-9]{4}%' 
	and not descr like '20%'
group by case when descr similar to '[0-9]{4}%' 
	and not descr like '20%' then 'Four Digit'
	else null end
order by row_count desc

--368 rows

--Initials (3)
select 
	case when descr similar to'[A-Z]{3};%' then 'PCARD' 
	else null end as PCARD_pattern
	, count(*) as row_count 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%' 
group by case when descr similar to '[A-Z]{3};%' then 'PCARD'
	else null end
order by row_count desc 

-- 24534 rows

-- Department (6)
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
) 
select 
	case when descr similar to 'Dept%'  then 'Department' 
	or descr similar to 'Department%'
	else null end as pattern_dept
	, count(*) as row_count 
from subset
where descr similar to 'Dept%'   
	or descr similar to 'Department%'
group by case when descr similar to 'Dept%'  
	or descr similar to 'Department%' then 'Department' 
	else null end
order by row_count desc 

--24 rows

--Bon App (7) 
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
	case when descr like '%BonApp%' then 'BonApp' 
	when descr like '%BONAPP%' then 'BonApp' 
	when descr like '%Bon App%' then 'BonApp'
	else null end as pattern_bonapp
	, count(*) as row_count 
from subset 
where descr like '%BonApp%' 
	or descr like '%BONAPP%' 
	or descr like '%Bon App%' then 'BonApp'
group by case when descr like '%BonApp%' then 'BonApp'
	when descr like '%BONAPP%' then 'BonApp' 
	when descr like '%Bon App%' then 'BonApp'
	else null end
order by row_count desc 

--1725 rows

--LLC (9)
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
	case when descr like '%LLC%' then 'LLC'
	else null end as pattern_llc
	, count(*) as row_count 
from subset 
where descr like '%LLC%' 
group by case when descr like '%LLC%' then 'LLC'
	else null end
order by row_count desc 

--722 rows

--Universities and Colleges and College Fairs (14)
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
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select 
	case when descr like '%University%' 
	or descr like '%university%'
	or descr like '%College%' 
	or descr like '%college%' then 'College or University' 
	else null end as pattern_college
	, count(*) as row_count 
from subset 
where 1=1
	and (descr like '%University%' 
	or descr like '%university%' 
	or descr like '%College%' 
	or descr like '%college%')  
group by case when descr like '%University%' 
	or descr like '%university%'
	or descr like '%College%' 
	or descr like '%college%' then 'College or University'
		 else null end
order by row_count desc 
--193 rows 

--Inc (19)
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
	case when descr similar to '%Inc%'  then 'Inc' 
	else null end as pattern_Inc
	, count(*) as row_count 
from subset
where descr similar to '%Inc%'  
group by case when descr similar to '%Inc%'  then 'Inc'
	else null end
order by row_count desc

--1603 rows

--Names (20)
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '%SR%' 
		and descr not similar to '%SR#%'
		and descr not similar to 'sr%' 
		and descr not similar to 'Sr%'
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
		and descr not similar to '%Inc%'
) 
select 
	case when descr similar to '% [A-Z]{1}. %'  then 'Name' 
		when descr similar to '% [A-Z]{1} % ' then 'Name'
		 else null end as pattern_name
	, count(*) as row_count 
from subset 
where descr similar to '% [A-Z]{1}. %'  
		or descr similar to '% [A-Z]{1} % '
group by case when descr similar to '% [A-Z]{1}. %'  then 'Name'
			when descr similar to '% [A-Z]{1} % ' then 'Name'
		 else null end
order by row_count desc 

-- 1390 rows





