select pattern, category, count(*) as row_count
from dev.budget_patterns
group by pattern, category
order by 1,2 


--Category vs Object Desc 
select pattern, category, object_desc 
from dev.budget_patterns
group by pattern, category, object_desc 

--Category vs Object Desc (individual)
select category, object_desc 
from dev.budget_patterns 
where category similar to 'travel'
group by category, object_desc


--Full Table 
select descr, category, pattern, month, year, fund_desc, unit_desc, object_desc, debit, credit
from dev.budget_patterns

--Money Spent on each category per year 
select category
, year
, sum(debit) as sub_debit
from dev.budget_patterns
group by category
, year 

-- Top 100 Vendors (most money spent) (ignore payment)
select descr
, year
, sum(debit) as sum_debit
from dev.budget_patterns
group by descr
, year 
order by sum_debit desc 
limit 100 

--Top 100 with object_desc (ignore payment)
select descr 
, category
, year 
, object_desc
, sum(debit) as sum_debit
from dev.budget_patterns
group by descr 
, category
, year  
, object_desc
order by sum_debit desc 
limit 100

