

-- Deep Dive on Initials Pattern 
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
)
select *
from subset 
order by 1
limit 500 

-- These rows are separated into three parts by semi colons. First the three initials, then the name of the vendor, and then the description of what they bought. This pattern needs to be split into these categories. Sometimes there is a space between the text and the semi colon and sometomes there is not. 

7/14/2020 

-- Deep Dive on Initials Pattern (split into columns)
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
)
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
from subset
order by 1 


-- Deep Dive on Initials Pattern (count of locations)
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
) 
	, subset_split as(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
from subset
order by 1
--limit 1000 
) 
select col2 , count(*) 
from subset_split 
group by col2 
order by count (*) desc

-- According to this query, there is a total of 5133 different locations where a PCARD was used. Some of these names are similar or provide similar services that can be grouped together. (ie: commercial food) 

-- Deep Dive on Initials Pattern (money spent on Amazon in July 2015)
with subset as
(
select distinct descr 
	, month 
	, year
	, debit
	, credit
from dev.budget_staging 
where descr similar to '[A-Z]{3};%' 
	and month = 'July' 
	and year = 2015
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS col1
    , split_part (descr, ';', 2) AS col2
    , split_part (descr, ';', 3) AS col3 
	, month
	, year
	, debit
	, credit
from subset
order by 1
--limit 1000 
) 
select col2
	, month
	, year
	, round(sum(debit)) as debit
from subset_split 
where col2 like 'AMAZON%'
	and credit = 0
group by col2
	, month
	, year
	
-- Deep Dive on Initials Pattern (money spent on Amazon in 2015)
with subset as
(
select distinct descr 
	, year
	, debit
	, credit
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'  
	and year = 2015
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS col1
    , split_part (descr, ';', 2) AS col2
    , split_part (descr, ';', 3) AS col3 
	, year
	, debit
	, credit
from subset
order by 1
--limit 1000 
) 
select col2
	, year
	, round(sum(debit)) as debit
from subset_split 
where col2 like 'AMAZON%'
	and credit = 0
group by col2
	, year
	
-- Deep Dive on Initials Pattern (count of description of purchase)
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
) 
	, subset_split as(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
from subset
order by 1
--limit 1000 
) 
select col3 , count(*) 
from subset_split 
group by col3 
order by count (*) desc

-- According to this query there are 11264 variations of descriptions in the initials field. 

-- Deep Dive on Initials Pattern (count of description of purchases lowercase)
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
) 
	, subset_split as(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , lower(split_part (descr, ';', 3)) AS col3 
from subset
order by 1
--limit 1000 
) 
select col3 , count(*) 
from subset_split 
group by col3 
order by count (*) desc

-- Deep Dive on Initials Pattern (Money spent at Starbucks)
with subset as
(
select distinct descr 
	, debit
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
) 
	, subset_split as(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
	, debit
from subset
order by 1
--limit 1000 
) 
select 
	case when col2 like '%STARBUCKS%' then 'Starbucks' 
		 else null end as pattern_starbucks 
	, round(sum(debit)) as debit
from subset_split 
where col2 like '%STARBUCKS%' 
group by case when col2 like '%STARBUCKS%' then 'Starbucks' 
	else null end 
order by debit 


-- Deep Dive on Initials Pattern (Money spent at Commercial Food Services)
with subset as
(
select distinct descr 
	, debit
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
) 
	, subset_split as(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
	, debit
from subset
order by 1
--limit 1000 
) 
select 
	case when col2 like '%STARBUCKS%' 
		or col2 like '%PAPA JOHN%' 
		or col2 like '%SUBWAY%' 
		or col2 like '%TABLE FIVE%' 
		or col2 like '%BENTLEYS%' 
		or col2 like '%BISTRO%' 
		or col2 like '%LA MARGARIT%' 
		or col2 like '%RAM RESTAUR%' 
		or col2 like '%MCDONALD%' 
		or col2 like '%WHOLEFDS%' 
		or col2 like '%PANERA%' 
		or col2 like '%AMADEUS%' 
		or col2 like '%BURGERVILLE%' 
		or col2 like '%IN-N-OUT%'
		or col2 like '%THE KITCHEN%' 
		or col2 like '%ARCHIVE%' 
		or col2 like '%IKE BOX%' 
		or col2 like '%WILD PEAR%' 
		or col2 like '%PANDA EXPR%' 
		or col2 like '%JIMMY JOHNS%' 
		or col2 like '%CAFE YUMM%' 
		or col2 like '%PITA PIT%' 
		or col2 like '%MARCO POLO%' 
		or col2 like '%BROADWAY%' 
		or col2 like '%BURGER KING%'
		then 'Commercial Food Service'
		 else null end as pattern_commercialfoodservice 
	, round(sum(debit)) as debit
from subset_split 
where col2 like '%STARBUCKS%' 
	or col2 like '%PAPA JOHN%' 
		or col2 like '%SUBWAY%' 
		or col2 like '%TABLE FIVE%' 
		or col2 like '%BENTLEYS%' 
		or col2 like '%BISTRO%' 
		or col2 like '%LA MARGARIT%' 
		or col2 like '%RAM RESTAUR%' 
		or col2 like '%MCDONALD%' 
		or col2 like '%WHOLEFDS%' 
		or col2 like '%PANERA%' 
		or col2 like '%AMADEUS%' 
		or col2 like '%BURGERVILLE%' 
		or col2 like '%IN-N-OUT%'
		or col2 like '%THE KITCHEN%' 
		or col2 like '%ARCHIVE%' 
		or col2 like '%IKE BOX%' 
		or col2 like '%WILD PEAR%' 
		or col2 like '%PANDA EXPR%' 
		or col2 like '%JIMMY JOHNS%' 
		or col2 like '%CAFE YUMM%' 
		or col2 like '%PITA PIT%' 
		or col2 like '%MARCO POLO%' 
		or col2 like '%BROADWAY%' 
		or col2 like '%BURGER KING%'
group by case when col2 like '%STARBUCKS%' 
				or col2 like '%PAPA JOHN%' 
		or col2 like '%SUBWAY%' 
		or col2 like '%TABLE FIVE%' 
		or col2 like '%BENTLEYS%' 
		or col2 like '%BISTRO%' 
		or col2 like '%LA MARGARIT%' 
		or col2 like '%RAM RESTAUR%' 
		or col2 like '%MCDONALD%' 
		or col2 like '%WHOLEFDS%' 
		or col2 like '%PANERA%' 
		or col2 like '%AMADEUS%' 
		or col2 like '%BURGERVILLE%' 
		or col2 like '%IN-N-OUT%'
		or col2 like '%THE KITCHEN%' 
		or col2 like '%ARCHIVE%' 
		or col2 like '%IKE BOX%' 
		or col2 like '%WILD PEAR%' 
		or col2 like '%PANDA EXPR%' 
		or col2 like '%JIMMY JOHNS%' 
		or col2 like '%CAFE YUMM%' 
		or col2 like '%PITA PIT%' 
		or col2 like '%MARCO POLO%' 
		or col2 like '%BROADWAY%' 
		or col2 like '%BURGER KING%'
		then 'Commercial Food Service'
	else null end 
order by debit 



-- Deep Dive on Initials Pattern (Money spent at Commercial Food Services)
with subset as
(
select distinct descr 
	, debit
	, year
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
	, debit
	, year
from subset
),
subset_case as
(
select 
	case when col2 like '%STARBUCKS%' 
		or col2 like '%PAPA JOHN%' 
		or col2 like '%SUBWAY%' 
		or col2 like '%TABLE FIVE%' 
		or col2 like '%BENTLEYS%' 
		or col2 like '%BISTRO%' 
		or col2 like '%LA MARGARIT%' 
		or col2 like '%RAM RESTAUR%' 
		or col2 like '%MCDONALD%' 
		or col2 like '%WHOLEFDS%' 
		or col2 like '%PANERA%' 
		or col2 like '%AMADEUS%' 
		or col2 like '%BURGERVILLE%' 
		or col2 like '%THE SASSY%' 
		or col2 like '%IN-N-OUT%'
		or col2 like '%THE KITCHEN%' 
		or col2 like '%ARCHIVE%' 
		or col2 like '%IKE BOX%' 
		or col2 like '%WILD PEAR%' 
		or col2 like '%PANDA EXPR%' 
		or col2 like '%JIMMY JOHNS%' 
		or col2 like '%CAFE YUMM%' 
		or col2 like '%PITA PIT%' 
		or col2 like '%MARCO POLO%' 
		or col2 like '%BROADWAY%' 
		or col2 like '%BURGER KING%' 
		or col2 like '%DOMINOS%' 
		or col2 like '%RED ROBIN%' 
		or col2 like '%OLIVE G%' 
		or col2 like '%TACO BELL%' 
		or col2 like '%THAI ORCHID%'
		or col2 like '%DAYNIGHT%' 
		or col2 like '%FLYING ELEP%' 
		or col2 like '%GILGIMESH%'
		or col2 like '%BAJA FRESH%' 
		or col2 like '%SISTERS%'
		or col2 like '%BUFFALO WIL%' 
		or col2 like '%JACK IN THE%' 
		or col2 like '%COFFEE%' 
		or col2 like '%CALIFORNIA%' 
		or col2 like '%CHIPOTLE%' 
		or col2 like '%NOODLES%' 
		or col2 like '%PIZZA HUT%' 
		or col2 like '%MOS RESTA%' 
		or col2 like '%CHICK-FIL-A%' 
		or col2 like '%JAMBA JUICE%' 
		or col2 like '%THEDAILYCAF%' 
		or col2 like '%TAPROOT%' 
		or col2 like '%CHRISTOS P%' 
		or col2 like '%ADAMS RIB%' 
		or col2 like '%BYARD HOUSE%' 
		or col2 like '%VENTIS%' 
		or col2 like '%SUSHI%' 
		or col2 like '%APPLEBEES%' 
		or col2 like '%CHEESECAKE%' 
		or col2 like '%CAFE%' 
		or col2 like '%FUJI RICE%' 
		or col2 like '%RED LOBSTER%' 
		or col2 like '%CHEESE%' 
		or col2 like '%DONUT%' 
		or col2 like '%MCMENAMINS%' 
		or col2 like '%MARCOS%' 
		or col2 like '%MCGRATH%' 
		or col2 like '%RAYS FOOD%' 
		or col2 like '%DAIRY QUEEN%' 
		or col2 like '%HAWAIIAN%' 
		or col2 like '%FOOD%' 
		or col2 like '%ELMER%' 
		or col2 like '%CARLS JR%' 
		or col2 like '%PIAZZA%' 
		or col2 like '%PINT & JIGG%' 
		or col2 like '%MUCHAS GRAC%' 
		or col2 like '%BRIX TAVERN%' 
		or col2 like '%CAFFE%' 
		or col2 like '%QDOBA%' 
		or col2 like '%WAJI%' 
		or col2 like '%PIETROS%' 
		or col2 like '%DAVE & BUST%' 
		or col2 like '%RESTAURANT%' 
		or col2 like '%MODMARKET%' 
		or col2 like '%DICKEY%' 
		or col2 like '%RESTAU%' 
		or col2 like '%LA TAPANADE%' 
		or col2 like '%OSWEGO GRIL%' 
		or col2 like '%NEW SEASONS%' 
		or col2 like '%BURGER%' 
		or col2 like '%DELI%' 
		or col2 like '%INDIA PALAC%' 
		or col2 like '%THAI BASIL%' 
		or col2 like '%MARGARITAVI%' 
		or col2 like '%PITA%' 
		or col2 like '%BOONS TREAS%' 
		or col2 like '%HOOTERS%' 
		or col2 like '%DAVINCI%' 
		or col2 like '%DUTCH%' 
		or col2 like '%THE GOV%' 
		or col2 like '%GAMBERETTIS%'
		then 'Commercial Food Service'
		 else null end as commercialfoodservice 
	, debit
	, year
from subset_split 
)
select year
	, commercialfoodservice
	, round(sum(debit)) as debit
from subset_case
where not commercialfoodservice is null
group by year
	, commercialfoodservice
order by 3 desc

-- Deep Dive on Initials Pattern (Count of Food Services in col2)
with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
from subset
),
subset_case as
(
select 
	case when col2 like '%STARBUCKS%' 
		or col2 like '%PAPA JOHN%' 
		or col2 like '%SUBWAY%' 
		or col2 like '%TABLE FIVE%' 
		or col2 like '%BENTLEYS%' 
		or col2 like '%BISTRO%' 
		or col2 like '%LA MARGARIT%' 
		or col2 like '%RAM RESTAUR%' 
		or col2 like '%MCDONALD%'  
		or col2 like '%PANERA%' 
		or col2 like '%AMADEUS%' 
		or col2 like '%BURGERVILLE%' 
		or col2 like '%THE SASSY%'
		or col2 like '%IN-N-OUT%'
		or col2 like '%THE KITCHEN%' 
		or col2 like '%ARCHIVE%' 
		or col2 like '%IKE BOX%' 
		or col2 like '%WILD PEAR%' 
		or col2 like '%PANDA EXPR%' 
		or col2 like '%JIMMY JOHNS%' 
		or col2 like '%CAFE YUMM%' 
		or col2 like '%PITA PIT%' 
		or col2 like '%MARCO POLO%' 
		or col2 like '%BROADWAY%' 
		or col2 like '%BURGER KING%' 
		or col2 like '%DOMINOS%' 
		or col2 like '%RED ROBIN%' 
		or col2 like '%OLIVE G%' 
		or col2 like '%TACO BELL%' 
		or col2 like '%THAI ORCHID%' 
		or col2 like '%DAYNIGHT%' 
		or col2 like '%FLYING ELEP%'
		or col2 like '%GILGIMESH%' 
		or col2 like '%SISTERS%'
		or col2 like '%BAJA FRESH%' 
		or col2 like '%BUFFALO WIL%' 
		or col2 like '%JACK IN THE%' 
		or col2 like '%COFFEE%' 
		or col2 like '%CALIFORNIA%' 
		or col2 like '%CHIPOTLE%' 
		or col2 like '%NOODLES%' 
		or col2 like '%PIZZA HUT%' 
		or col2 like '%MOS RESTA%' 
		or col2 like '%CHICK-FIL-A%' 
		or col2 like '%JAMBA JUICE%' 
		or col2 like '%THEDAILYCAF%' 
		or col2 like '%TAPROOT%' 
		or col2 like '%CHRISTOS P%' 
		or col2 like '%ADAMS RIB%' 
		or col2 like '%BYARD HOUSE%' 
		or col2 like '%VENTIS%' 
		or col2 like '%SUSHI%' 
		or col2 like '%APPLEBEES%' 
		or col2 like '%CHEESECAKE%' 
		or col2 like '%CAFE%' 
		or col2 like '%FUJI RICE%' 
		or col2 like '%RED LOBSTER%' 
		or col2 like '%CHEESE%' 
		or col2 like '%DONUT%' 
		or col2 like '%MCMENAMINS%' 
		or col2 like '%MARCOS%' 
		or col2 like '%MCGRATH%' 
		or col2 like '%RAYS FOOD%' 
		or col2 like '%DAIRY QUEEN%' 
		or col2 like '%HAWAIIAN%' 
		or col2 like '%FOOD%' 
		or col2 like '%ELMER%' 
		or col2 like '%CARLS JR%' 
		or col2 like '%PIAZZA%' 
		or col2 like '%PINT & JIGG%' 
		or col2 like '%MUCHAS GRAC%' 
		or col2 like '%BRIX TAVERN%' 
		or col2 like '%CAFFE%' 
		or col2 like '%QDOBA%' 
		or col2 like '%WAJI%' 
		or col2 like '%PIETROS%' 
		or col2 like '%DAVE & BUST%' 
		or col2 like '%RESTAURANT%' 
		or col2 like '%MODMARKET%' 
		or col2 like '%DICKEY%' 
		or col2 like '%RESTAU%' 
		or col2 like '%LA TAPANADE%' 
		or col2 like '%OSWEGO GRIL%' 
		or col2 like '%NEW SEASONS%' 
		or col2 like '%BURGER%' 
		or col2 like '%DELI%' 
		or col2 like '%INDIA PALAC%' 
		or col2 like '%THAI BASIL%' 
		or col2 like '%MARGARITAVI%' 
		or col2 like '%PITA%' 
		or col2 like '%BOONS TREAS%' 
		or col2 like '%HOOTERS%' 
		or col2 like '%DAVINCI%' 
		or col2 like '%DUTCH%' 
		or col2 like '%THE GOV%' 
		or col2 like '%GAMBERETTIS%'
		then 'Commercial Food Service'
		 else null end as commercialfoodservice 
from subset_split 
)
select subset_case
	, count (*)
from subset_case
where not commercialfoodservice is null
group by subset_case


-- According to this query, commercial food services account for 1756/5133 locations where PCARDS spend their money. This makes up 34% of the locations. 


-- Deep Dive on Initials Pattern (Money spent at Retail Stores)
with subset as
(
select distinct descr 
	, debit
	, year
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
	, debit
	, year
from subset
),
subset_case as
(
select 
	case when col2 like '%OFFICE DEPO%' 
		 or col2 like '%SAFEWAY%'
		 or col2 like '%THE HOME DE%' 
		 or col2 like '%FRED-MEYER%' 
		 or col2 like '%SUPPLYWORKS%' 
		 or col2 like '%COOKE STATI%'
		 or col2 like '%LOWES%' 
		 or col2 like '%TARGET%' 
		 or col2 like '%OFFICEMAX%' 
		 or col2 like '%WAL-MART%' 
		 or col2 like '%WALGREENS%' 
		 or col2 like '%HARBOR FREI%' 
		 or col2 like '%WHOLEFDS%' 
		 or col2 like '%COSTCO%' 
		 or col2 like '%ROTHS%' 
		 or col2 like '%TOTAL OFFIC%' 
		 or col2 like '%TRADER JOE%'
		 or col2 like '%RAPID REFIL%' 
		 or col2 like '%FEDEXOFFICE%'
		 or col2 like '%CAPITAL TRO%' 
		 or col2 like '%MADE IN OR%' 
		 or col2 like '%PARTY MART%' 
		 or col2 like '%RITE AID%' 
		 or col2 like '%JO-ANN%'
		 or col2 like '%NEWEGG%'  
		 or col2 like '%FROMUTH%' 
		 or col2 like '%BEST BUY%' 
		 or col2 like '%ALBERTSONS%'
		 or col2 like '%CRAFT WAREH%' 
		 or col2 like '%MICHAELS%' 
		 or col2 like '%TOMS TROPHI%' 
		 or col2 like '%FAST SIGNS%' 
		 or col2 like '%KMART%' 
		 or col2 like '%WM SUPERCEN%' 
		 or col2 like '%RICKS%' 
		 or col2 like '%HOMEDEPOT%' 
		 or col2 like '%VALUE VILLA%'
		
		 
		then 'Retail Stores'
		 else null end as retailstores 
	, debit
	, year
from subset_split 
)
select year
	, retailstores
	, round(sum(debit)) as debit
from subset_case
where not retailstores is null
group by year
	, retailstores
order by 3 desc


-- Deep Dive on Initials Pattern (Money spent on Travel and Lodging)
with subset as
(
select distinct descr 
	, debit
	, year
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
	, debit
	, year
from subset
),
subset_case as
(
select 
	case when col2 like '%ALASKA%' 
		 or col2 like '%ENTERPRISE%' 
		 or col2 like '%UNITED%' 
		 or col2 like '%DELTA%'
		 or col2 like '%SOUTHWES%' 
		 or col2 like '%INTERNATION%' 
		 or col2 like '%AIRPORT%'
		 or col2 like '%AMERICAN%' 
		 or col2 like '%DOUBLETREE%' 
		 or col2 like '%THE GRAND H%'
		 or col2 like '%RED LION HO%' 
		 or col2 like '%JETBLUE%' 
		 or col2 like '%MARRIOTT%'
		 or col2 like '%HILTON%'
		 or col2 like '%INN%'  
		 or col2 like '%EMBASSY SUI%' 
		 or col2 like '%HERTZ%' 
		 or col2 like '%HOTEL%' 
		 or col2 like '%BEST WESTERN%'
		 or col2 like '%TRAVEL INSU%'  
		 or col2 like '%LA QUINTA%' 
		 or col2 like '%SUPERSHUTTL%' 
		 or col2 like '%ORBITZ%'
		 or col2 like '%RADISSON%'
		 or col2 like '%AIRBNB%' 
		 or col2 like '%RESIDENCE%' 
		 or col2 like '%CAB%' 
		 or col2 like '%EXPEDIA%' 
		 or col2 like '%SHUTTL%' 
		 or col2 like '%TRIMET%' 
		 or col2 like '%CHEVRON%' 
		 or col2 like '%AMTRAK%' 
		 or col2 like '%CAPERS AIRP%' 
		 or col2 like '%SILVER CLOU%' 
		 or col2 like '%HYATT%' 
		 or col2 like '%SHERATON%' 
		 or col2 like '%AIR CAN%' 
		 or col2 like '%SHELL%' 
		 or col2 like '%COURTYARD%' 
		 or col2 like '%PARKING%' 
		 or col2 like '%SMARTPARK%'  
		 or col2 like '%UBER%' 
		 or col2 like '%EXXONMOBIL%' 
		 or col2 like '%CTY CTR PAR%' 
		 or col2 like '%STAR PARK%' 
		 or col2 like '%TEXACO%' 
		 or col2 like '%SALEM PERMI%' 
		 or col2 like '%TRAVELOCITY%' 
		 or col2 like '%METER%' 
		 or col2 like '%PARKING%' 
		 or col2 like '%FAIRMON%' 
		 or col2 like '%PARK%'


		then 'Travel, Lodging, and Transportation'
		 else null end as travelandlodging
	, debit
	, year
from subset_split 
)
select year
	, travelandlodging
	, round(sum(debit)) as debit
from subset_case
where not travelandlodging is null
group by year
	, travelandlodging
order by 3 desc


-- 07/20/2020


-- Deep Dive on Initials Pattern (Count of Retail Stores in col2)

with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS col1
     , split_part (descr, ';', 2) AS col2
     , split_part (descr, ';', 3) AS col3 
from subset
),
subset_case as
(
select 
	case when col2 like '%OFFICE DEPO%' 
		 or col2 like '%SAFEWAY%'
		 or col2 like '%THE HOME DE%' 
		 or col2 like '%FRED-MEYER%' 
		 or col2 like '%SUPPLYWORKS%' 
		 or col2 like '%COOKE STATI%'
		 or col2 like '%LOWES%' 
		 or col2 like '%TARGET%' 
		 or col2 like '%OFFICEMAX%' 
		 or col2 like '%WAL-MART%' 
		 or col2 like '%WALGREENS%' 
		 or col2 like '%HARBOR FREI%' 
		 or col2 like '%WHOLEFDS%' 
		 or col2 like '%COSTCO%' 
		 or col2 like '%ROTHS%' 
		 or col2 like '%TOTAL OFFIC%' 
		 or col2 like '%TRADER JOE%'
		 or col2 like '%RAPID REFIL%' 
		 or col2 like '%FEDEXOFFICE%'
		 or col2 like '%CAPITAL TRO%' 
		 or col2 like '%MADE IN OR%' 
		 or col2 like '%PARTY MART%' 
		 or col2 like '%RITE AID%' 
		 or col2 like '%JO-ANN%'
		 or col2 like '%NEWEGG%'  
		 or col2 like '%FROMUTH%' 
		 or col2 like '%BEST BUY%' 
		 or col2 like '%ALBERTSONS%'
		 or col2 like '%CRAFT WAREH%' 
		 or col2 like '%MICHAELS%' 
		 or col2 like '%TOMS TROPHI%' 
		 or col2 like '%FAST SIGNS%' 
		 or col2 like '%KMART%' 
		 or col2 like '%WM SUPERCEN%' 
		 or col2 like '%RICKS%' 
		 or col2 like '%HOMEDEPOT%' 
		 or col2 like '%VALUE VILLA%'
		 then 'Retail Stores'
		 else null end as retailstores 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not retailstores is null
group by subset_case 

-- According to this query, retail stores account for 2380/5133 locations where PCARDS spend their money. This makes up 45% of the locations. 


-- Deep Dive on Initials Pattern (Count of Transportation in col2) 

with subset as
(
select distinct descr 
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS col1
    , split_part (descr, ';', 2) AS col2
    , split_part (descr, ';', 3) AS col3 
from subset
),
subset_case as
(
select 
	case when col2 like '%ALASKA%' 
		 or col2 like '%ENTERPRISE%' 
		 or col2 like '%UNITED%' 
		 or col2 like '%DELTA%'
		 or col2 like '%SOUTHWES%' 
		 or col2 like '%INTERNATION%' 
		 or col2 like '%AIRPORT%'
		 or col2 like '%AMERICAN%' 
		 or col2 like '%DOUBLETREE%' 
		 or col2 like '%THE GRAND H%'
		 or col2 like '%RED LION HO%' 
		 or col2 like '%JETBLUE%' 
		 or col2 like '%MARRIOTT%'
		 or col2 like '%HILTON%'
		 or col2 like '%INN%'  
		 or col2 like '%EMBASSY SUI%' 
		 or col2 like '%HERTZ%' 
		 or col2 like '%HOTEL%' 
		 or col2 like '%BEST WESTERN%'
		 or col2 like '%TRAVEL INSU%'  
		 or col2 like '%LA QUINTA%'  
		 or col2 like '%ORBITZ%'
		 or col2 like '%RADISSON%'
		 or col2 like '%AIRBNB%' 
		 or col2 like '%RESIDENCE%' 
		 or col2 like '%CAB%' 
		 or col2 like '%EXPEDIA%' 
		 or col2 like '%SHUTTL%' 
		 or col2 like '%TRIMET%' 
		 or col2 like '%CHEVRON%' 
		 or col2 like '%AMTRAK%' 
		 or col2 like '%CAPERS AIRP%' 
		 or col2 like '%SILVER CLOU%' 
		 or col2 like '%HYATT%' 
		 or col2 like '%SHERATON%' 
		 or col2 like '%AIR CAN%' 
		 or col2 like '%SHELL%' 
		 or col2 like '%COURTYARD%'   
		 or col2 like '%UBER%' 
		 or col2 like '%EXXONMOBIL%' 
		 or col2 like '%CTY CTR PAR%'  
		 or col2 like '%TEXACO%' 
		 or col2 like '%SALEM PERMI%' 
		 or col2 like '%TRAVELOCITY%' 
		 or col2 like '%METER%' 
		 or col2 like '%FAIRMON%' 
		 or col2 like '%PARK%' 
		 and not like '%SPARK%' 
		 and not like '%PROPARK%'
		 then 'Travel, Lodging, and Transportation'
		 else null end as travelandlodging
from subset_split 
)
select subset_case 
	, count(*)
from subset_case
where not travelandlodging is null
group by subset_case

-- Continued in notes_07_20_2020












