-- 08/23/2020


--Other Services
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
		and descr not similar to '%University%'
		and descr not similar to '%College%'
) 
select descr 
from subset 
where descr similar to '%Department of Consumer Affairs%' 
	or descr similar to '%Department of Justice%'  
	or descr similar to '%Dept. of Administrative Services%'
	or descr similar to '%Dept. of Consumer & Bus. Serv.%'
	or descr similar to '%Plant Tender%'
	or descr similar to '%Security%'
	or descr similar to '%Sys tracking id%'  
	or descr similar to '%Campus Safety%' 
	or descr similar to '%Id Card Replacement%' 
	or descr similar to '%Alliance Airport Advertising%'
	or descr similar to '%UPS%' 
	or descr similar to '%BRM%' 
	or descr similar to '%Processing%'
	
--Paper and Postage
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
		and descr not similar to '%University%'
		and descr not similar to '%College%'
) 
select descr 
from subset 
where descr similar to '%Shred-it%' 
	or descr similar to '%Print%'
	or descr similar to '%print%'  
	or descr similar to '%printing%' 
	or descr similar to '%Xerox%'  
	or descr similar to '%Paper%' 
	or descr similar to '%Postage%' 
	
--Food
with subset as
(
select descr 
from dev.budget_staging 
where descr not similar to '[A-Z]{3};%' 
		and descr not similar to '% [A-Z]{1}. %'
		and descr not similar to 'SR%' 
		and descr not similar to 'sr%'
		and descr not similar to '[0-9]{4}%'
		and descr not similar to '%BonApp%'
		and descr not similar to '%Year-End%'
		and descr not similar to '%LLC%' 
		and descr not similar to '%Shred-it%'
		and descr not similar to '%University%'
		and descr not similar to '%College%'
		and descr not similar to '%Print%'
		and descr not similar to '%print%' 
) 
select descr 
from subset 
where descr similar to '%Dept. coffee purchase%' 
	or descr similar to '%Sierra Springs%' 
	or descr similar to '%Pepsi%'
	or descr similar to '%Canteen%'
	or descr similar to '%Candy%' 
	
--Network
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
select descr 
from subset 
where descr similar to '%Verizon Wireless%' 	
	
	

--Academic
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
) 
select descr 
from subset 
where descr similar to '%University%' 
	or descr similar to '%university%'
	or descr similar to '%College%' 
	or descr similar to '%college%'  
	or descr similar to '%Opening Days%'  
	or descr similar to '%OD %'
	
--Retail
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
select descr 
from subset  
where descr similar to  
		or descr similar to '%Stationery%'
		or descr similar to '%Arlington Club%'


--Transportation
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
select descr 
from subset 
where descr similar to  
		or descr similar to '%Lile International Companies%'
		or descr similar to '%Motor Pool%' 
		or descr similar to '%meter charges%'
		or descr similar to '%Meter Charges%' 
		or descr similar to '%meter chgs%'   
		or descr similar to '%Meter Chgs%' 
		or descr similar to '%Airline%' 
		or descr similar to '%Travel%'
		or descr similar to '%Hotel%' 
		or descr similar to '%airfare%'
		or descr similar to '%Motorpool%'

--Payment
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
select descr 
from subset 
where descr similar to '%allocation%'  
	or descr similar to '%allocate%'  
	or descr similar to '%fee%' 
	or descr similar to '%Fee%'
	and not descr similar to '%Coffee%' 






	
	
