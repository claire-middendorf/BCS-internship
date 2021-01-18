

-- Deep Dive on BonApp Pattern
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '%BonApp%'
	and not descr like 'SR%' 
	and not descr like 'sr%'
)
select *
from subset 
order by 1
limit 500 

-- BonApp space Four Digits 
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like'%BonApp%'
	and not descr like 'SR%' 
	and not descr like 'sr%'
)
select distinct descr
from subset 
where descr similar to 'BonApp [0-9]{4}%'
order by 1
limit 500 

-- BonApp no space Four Digits 

with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like'%BonApp%'
	and not descr like 'SR%' 
	and not descr like 'sr%'
)
select distinct descr
from subset 
where descr similar to 'BonApp[0-9]{4}%'
order by 1
limit 500 

-- BonApp no space Four Digits underscore 
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like'%BonApp%'
	and not descr like 'SR%' 
	and not descr like 'sr%'
)
select distinct descr
from subset 
where descr similar to 'BonApp[0-9]{4}_%'
order by 1
limit 500  

-- BonApp no space Four Digits no space 
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like'%BonApp%'
	and not descr like 'SR%' 
	and not descr like 'sr%'
)
select distinct descr
from subset 
where descr similar to 'BonApp[0-9]{4}[A-Z]{1}%'
order by 1
limit 500  


