

-- Deep Dive on SR/sr pattern
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like 'SR%' 
    or descr like 'sr%'
)
select *
from subset 
order by 1
limit 500 

-- SR/sr with # 
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like 'SR%' 
    or descr like 'sr%'
)
select distinct descr
from subset 
where descr like'%SR#%' 
	or descr like '%sr#%'
order by 1
limit 500 

-- SR/sr with space 
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like 'SR%' 
    or descr like 'sr%'
)
select distinct descr
from subset 
where descr like '%SR %' 
	or descr like '%sr %'
order by 1
limit 500

-- SR/sr with # and four digits 
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like 'SR%' 
    or descr like 'sr%'
)
select distinct descr
from subset 
where descr similar to '%SR#[0-9]{4}%' 
	or descr similar to '%sr#[0-9]{4}%'
order by 1
limit 500 

-- SR/sr with space and four digits 
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr like 'SR%' 
    or descr like 'sr%'
)
select distinct descr
from subset 
where descr similar to '%SR [0-9]{4}%' 
	or descr similar to '%sr [0-9]{4}%'
order by 1
limit 500 



