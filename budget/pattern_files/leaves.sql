08/19/2020 
--Leaves

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
select distinct descr 
from subset 
where descr similar to 'Dept%' 
	or descr similar to 'Department%' 

-- "Department of Consumer Affairs" "Department of Justice" "Dept. coffee purchase" "Dept. of Administrative Services" "Dept. of Consumer & Bus. Serv."

--LLC (List of Vendors)
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
select distinct descr 
	, count(*) as row_count
from subset 
where descr similar to '%LLC%' 
group by descr
order by row_count desc 

--Universities and Colleges and College Fairs (14) (list)
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
		and descr not similar to '%Inc%'
		and descr not similar to '%print%' 
		and descr not similar to 'Dept%'
) 
select distinct descr 
	, count(*) as row_count
from subset 
where descr similar to '%University%' 
	or descr similar to '%university%'
	or descr similar to '%College%' 
	or descr similar to '%college%' 
group by descr
order by row_count desc 

--Inc (19) (list)
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
select distinct descr 
	, count(*) as row_count
from subset 
where descr similar to '%Inc%'
group by descr
order by row_count desc
	
