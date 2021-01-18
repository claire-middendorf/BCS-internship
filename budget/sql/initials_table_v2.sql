



-- Deep Dive on Initials Pattern (Table for Vendor column) (works)
with subset as
(
select gla_posted_date 
	, descr 
	, debit 
	, fund_desc 
	, unit_desc 
	, object_desc
from dev.budget_staging 
where descr similar to '[A-Z]{3};%'
), 
subset_split as
(
select descr
	, split_part (descr, ';', 1) AS three_initials
	, split_part (descr, ';', 2) AS vendor
	, split_part (descr, ';', 3) AS descr_of_item 
	, gla_posted_date 
	, debit 
	, fund_desc 
	, unit_desc 
	, object_desc
from subset
),
food_split as
(
select gla_posted_date 
	, debit 
	, descr
	, three_initials
	, vendor
	, descr_of_item 
	, fund_desc 
	, unit_desc 
	, object_desc
	, case when vendor like '%STARBUCKS%' 
		or vendor like '%PAPA JOHN%' 
		or vendor like '%SUBWAY%' 
		or vendor like '%TABLE FIVE%' 
		or vendor like '%BENTLEYS%' 
		or vendor like '%BISTRO%' 
		or vendor like '%LA MARGARIT%' 
		or vendor like '%RAM RESTAUR%' 
		or vendor like '%MCDONALD%'  
		or vendor like '%PANERA%' 
		or vendor like '%AMADEUS%' 
		or vendor like '%BURGERVILLE%' 
		or vendor like '%THE SASSY%'
		or vendor like '%IN-N-OUT%'
		or vendor like '%THE KITCHEN%' 
		or vendor like '%ARCHIVE%' 
		or vendor like '%IKE BOX%' 
		or vendor like '%WILD PEAR%' 
		or vendor like '%PANDA EXPR%' 
		or vendor like '%JIMMY JOHNS%' 
		or vendor like '%CAFE YUMM%' 
		or vendor like '%PITA PIT%' 
		or vendor like '%MARCO POLO%' 
		or vendor like '%BROADWAY%' 
		or vendor like '%BURGER KING%' 
		or vendor like '%DOMINOS%' 
		or vendor like '%RED ROBIN%' 
		or vendor like '%OLIVE G%' 
		or vendor like '%TACO BELL%' 
		or vendor like '%THAI ORCHID%' 
		or vendor like '%DAYNIGHT%' 
		or vendor like '%FLYING ELEP%'
		or vendor like '%GILGIMESH%' 
		or vendor like '%SISTERS%'
		or vendor like '%BAJA FRESH%' 
		or vendor like '%BUFFALO WIL%' 
		or vendor like '%JACK IN THE%' 
		or vendor like '%COFFEE%' 
		or vendor like '%CALIFORNIA%' 
		or vendor like '%CHIPOTLE%' 
		or vendor like '%NOODLES%' 
		or vendor like '%PIZZA HUT%' 
		or vendor like '%MOS RESTA%' 
		or vendor like '%CHICK-FIL-A%' 
		or vendor like '%JAMBA JUICE%' 
		or vendor like '%THEDAILYCAF%' 
		or vendor like '%TAPROOT%' 
		or vendor like '%CHRISTOS P%' 
		or vendor like '%ADAMS RIB%' 
		or vendor like '%BYARD HOUSE%' 
		or vendor like '%VENTIS%' 
		or vendor like '%SUSHI%' 
		or vendor like '%APPLEBEES%' 
		or vendor like '%CHEESECAKE%' 
		or vendor like '%CAFE%' 
		or vendor like '%FUJI RICE%' 
		or vendor like '%RED LOBSTER%' 
		or vendor like '%CHEESE%' 
		or vendor like '%DONUT%' 
		or vendor like '%MCMENAMINS%' 
		or vendor like '%MARCOS%' 
		or vendor like '%MCGRATH%' 
		or vendor like '%RAYS FOOD%' 
		or vendor like '%DAIRY QUEEN%' 
		or vendor like '%HAWAIIAN%' 
		or vendor like '%FOOD%' 
		or vendor like '%ELMER%' 
		or vendor like '%CARLS JR%' 
		or vendor like '%PIAZZA%' 
		or vendor like '%PINT & JIGG%' 
		or vendor like '%MUCHAS GRAC%' 
		or vendor like '%BRIX TAVERN%' 
		or vendor like '%CAFFE%' 
		or vendor like '%QDOBA%' 
		or vendor like '%WAJI%' 
		or vendor like '%PIETROS%' 
		or vendor like '%DAVE & BUST%' 
		or vendor like '%RESTAURANT%' 
		or vendor like '%MODMARKET%' 
		or vendor like '%DICKEY%' 
		or vendor like '%RESTAU%' 
		or vendor like '%LA TAPANADE%' 
		or vendor like '%OSWEGO GRIL%' 
		or vendor like '%NEW SEASONS%' 
		or vendor like '%BURGER%' 
		or vendor like '%DELI%' 
		or vendor like '%INDIA PALAC%' 
		or vendor like '%THAI BASIL%' 
		or vendor like '%MARGARITAVI%' 
		or vendor like '%PITA%' 
		or vendor like '%BOONS TREAS%' 
		or vendor like '%HOOTERS%' 
		or vendor like '%DAVINCI%' 
		or vendor like '%DUTCH%' 
		or vendor like '%THE GOV%' 
		or vendor like '%GAMBERETTIS%'
		then 'Commercial Food Service'
		 else null end as commercialfoodservice 
from subset_split 
),
retail_split as 
( 
select gla_posted_date 
	, debit 
	, descr
	, three_initials
	, vendor
	, descr_of_item  
	, fund_desc 
	, unit_desc 
	, object_desc
	, case when vendor like '%OFFICE DEPO%' 
		 or vendor like '%SAFEWAY%'
		 or vendor like '%THE HOME DE%' 
		 or vendor like '%FRED-MEYER%' 
		 or vendor like '%SUPPLYWORKS%' 
		 or vendor like '%COOKE STATI%'
		 or vendor like '%LOWES%' 
		 and not vendor like '%FELLOWES%'
		 or vendor like '%TARGET%' 
		 or vendor like '%OFFICEMAX%' 
		 or vendor like '%WAL-MART%' 
		 or vendor like '%WALGREENS%' 
		 or vendor like '%HARBOR FREI%' 
		 or vendor like '%WHOLEFDS%' 
		 or vendor like '%COSTCO%' 
		 or vendor like '%ROTHS%' 
		 or vendor like '%TOTAL OFFIC%' 
		 or vendor like '%TRADER JOE%'
		 or vendor like '%RAPID REFIL%' 
		 or vendor like '%FEDEXOFFICE%'
		 or vendor like '%CAPITAL TRO%' 
		 or vendor like '%MADE IN OR%' 
		 or vendor like '%PARTY MART%' 
		 or vendor like '%RITE AID%' 
		 or vendor like '%JO-ANN%'
		 or vendor like '%NEWEGG%'  
		 or vendor like '%FROMUTH%' 
		 or vendor like '%BEST BUY%' 
		 or vendor like '%ALBERTSONS%'
		 or vendor like '%CRAFT WAREH%' 
		 or vendor like '%MICHAELS%' 
		 or vendor like '%TOMS TROPHI%' 
		 or vendor like '%FAST SIGNS%' 
		 or vendor like '%KMART%' 
		 or vendor like '%WM SUPERCEN%' 
		 or vendor like '%RICKS%' 
		 or vendor like '%HOMEDEPOT%' 
		 or vendor like '%VALUE VILLA%' 
		 or vendor like '%FOODLAND%'
		 then 'Retail Stores'
		 else null end as retailstores 
from subset_split
) ,
travel_split as 
( 
select gla_posted_date 
	, debit 
	, descr
	, three_initials
	, vendor
	, descr_of_item 
	, fund_desc 
	, unit_desc 
	, object_desc
	, case when vendor like '%ALASKA%' 
		 or vendor like '%ENTERPRISE%' 
		 or vendor like '%UNITED 0%' 
		 or vendor like '%DELTA%'
		 or vendor like '%SOUTHWES%' 
		 or vendor like '%INTERNATION%' 
		 or vendor like '%AIRPORT%'
		 or vendor like '%AMERICAN 0%' 
		 or vendor like '%DOUBLETREE%' 
		 or vendor like '%THE GRAND H%'
		 or vendor like '%RED LION HO%' 
		 or vendor like '%JETBLUE%' 
		 or vendor like '%MARRIOTT%'
		 or vendor like '%HILTON HOTE%' 
		 or vendor like '%HILTON PORT%' 
		 or vendor like '%HILTON BUEN%'
		 or vendor like '%HILTON GARD%' 
		 or vendor like '%HILTON WAIK%' 
		 or vendor like '%HILTON OAK%' 
		 or vendor like '%HILTON ADVA%'
		 or vendor like '%HILTON ELAR%' 
		 or vendor like '%HILTON PARK%' 
		 or vendor like '%HILTON MIX%' 
		 or vendor like '%HILTON PARC%' 
		 or vendor like '%HILTON TROP%' 
		 or vendor like '%HILTON EUGE%' 
		 or vendor like '%HILTON WOOD%'   
		 or vendor like '% INN%'  
		 or vendor like '%EMBASSY SUI%' 
		 or vendor like '%HERTZ%' 
		 or vendor like '%HOTEL%' 
		 or vendor like '%BEST WESTER%'
		 or vendor like '%TRAVEL INSU%'  
		 or vendor like '%LA QUINTA%'  
		 or vendor like '%ORBITZ%'
		 or vendor like '%RADISSON%'
		 or vendor like '%AIRBNB%' 
		 or vendor like '%RESIDENCE%' 
		 or vendor like '%TAXI CAB%'  
		 or vendor like '%YELLOW CAB%' 
		 or vendor like '%ORANGE CAB%'
		 or vendor like '%EXPEDIA%' 
		 or vendor like '%SHUTTL%' 
		 or vendor like '%TRIMET%' 
		 or vendor like '%CHEVRON%' 
		 or vendor like '%AMTRAK%' 
		 or vendor like '%CAPERS AIRP%' 
		 or vendor like '%SILVER CLOU%' 
		 or vendor like '%HYATT%' 
		 or vendor like '%SHERATON%' 
		 or vendor like '%AIR CAN%' 
		 or vendor like '%SHELL%' 
		 or vendor like '%COURTYARD%'   
		 or vendor like '%UBER%' 
		 or vendor like '%EXXONMOBIL%' 
		 or vendor like '%CTY CTR PAR%'  
		 or vendor like '%TEXACO%' 
		 or vendor like '%SALEM PERMI%' 
		 or vendor like '%TRAVELOCITY%' 
		 or vendor like '%METER%' 
		 or vendor like '%FAIRMON%' 
		 or vendor like '%PARK%' 
		 and not vendor like '%SPARK%' 
		 and not vendor like '%PROPARK%'
		 then 'Travel'
		 else null end as travel
from subset_split 
)
-- same column list for each common table expression
-- I re-named the CTEs to reflect what they were splitting
select gla_posted_date 
	, debit 
	, descr
	, three_initials
	, vendor
	, descr_of_item 
	, fund_desc 
	, unit_desc 
	, object_desc
	, commercialfoodservice as split
from food_split 
where not commercialfoodservice is null
union all 
select gla_posted_date 
	, debit 
	, descr
	, three_initials
	, vendor
	, descr_of_item  
	, fund_desc 
	, unit_desc 
	, object_desc
	, retailstores as split
from retail_split  
where not retailstores is null
union all 
select gla_posted_date 
	, debit 
	, descr
	, three_initials
	, vendor
	, descr_of_item 
	, fund_desc 
	, unit_desc 
	, object_desc
	, travel as split
from travel_split 
where not travel is null
order by 1

-- This returns a data output of 10586 rows out of the roughly 24,000 rows in the Initials pattern.

