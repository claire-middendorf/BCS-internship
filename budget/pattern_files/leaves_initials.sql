--07/30/2020  

--Total: 17986 rows

-- Deep Dive on Initials Pattern (Count of Food Services in col2) (With Changes)
with subset as
(
select descr 
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
		or col2 like '%CANTEEN%' 
		or col2 like '%SUBWAY%' 
		or col2 like '%TABLE FIVE%' 
		or col2 like '%BENTLEYS%' 
		or col2 like '%BISTRO%' 
		or col2 like '%LA MARGARIT%'  
		or col2 like '%MCDONALD%' 
		or col2 like '%COURTYARD%'  
		or col2 like '%PANERA%' 
		or col2 like '%AMADEUS%'  
		or col2 like '%THE SASSY%'
		or col2 like '%C&C%'
		or col2 like '%IN-N-OUT%'
		or col2 like '%THE KITCHEN%' 
		or col2 like '%ARCHIVE%' 
		or col2 like '%IKE BOX%' 
		or col2 like '%WILD PEAR%' 
		or col2 like '%PANDA EXPR%' 
		or col2 like '%JIMMY JOHNS%'  
		or col2 like '%PITA PIT%' 
		or col2 like '%MARCO POLO%' 
		or col2 like '%RENAISSANCE%'
		or col2 like '%BROADWAY%'  
		or col2 like '%DOMINO%' 
		or col2 like '%RED ROBIN%' 
		or col2 like '%OLIVE G%' 
		or col2 like '%STAIGHT FR%'
		or col2 like '%COUNTRY CAT%'
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
		or col2 like '%RAFNS%'
		or col2 like '%PIZZA HUT%'  
		or col2 like '%CHICK-FIL-A%' 
		or col2 like '%CHINA SO 7%'
		or col2 like '%INSTACART%'
		or col2 like '%JAMBA JUICE%' 
		or col2 like '%THEDAILYCAF%' 
		or col2 like '%TAPROOT%' 
		or col2 like '%CHRISTO%' 
		or col2 like '%CURB%'
		or col2 like '%ADAMS RIB%'
		or col2 like '%ORUPA%' 
		or col2 like '%TAPROOT%' 
		or col2 like '%HENRYS%' 
		or col2 like '%GERRY FRANK%' 
		or col2 like '%J W PEPPER%'
		or col2 like '%BYARD HOUSE%'  
		or col2 like '%SWEETWATER%' 
		or col2 like '%YARD HOUSE%'
		or col2 like '%SUSHI%' 
		or col2 like '%APPLEBEES%'   
		or col2 like '%BEECHERS%' 
		or col2 like '%BRIDGEPORT%'
		or col2 like '%CAFE%' 
		or col2 like '%FUJI RICE%' 
		or col2 like '%RED LOBSTER%' 
		or col2 like '%CHEESE%' 
		or col2 like '%CORNER BAKE%' 
		or col2 like 'EARL%'
		or col2 like 'ELEPHANTS%' 
		or col2 like '%GARTEN SERV%'
		or col2 like '%DONUT%' 
		or col2 like '%MCMENAMINS%' 
		or col2 like '%MCGRATH%' 
		or col2 like '%RAYS FOOD%' 
		or col2 like '%SEAFOOD%' 
		or col2 like '%PF CHANGS%'
		or col2 like '%UFOOD GRILL%'
		or col2 like '%DAIRY QUEEN%' 
		or col2 like '%HAWAIIAN%'  
		or col2 like '%ELMER%' 
		or col2 like '%CARLS JR%' 
		or col2 like '%PIAZZA%' 
		or col2 like '%PINT & JIGG%' 
		or col2 like '%WORD OF MOU%'
		or col2 like '%MUCHAS GRAC%' 
		or col2 like '%BRIX TAVERN%' 
		or col2 like '%CAFFE%' 
		or col2 like '%QDOBA%' 
		or col2 like '%WAJI%' 
		or col2 like '%PIETROS%' 
		or col2 like '%DAVE & BUST%'  
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
		or col2 like '%AUNTIE ANNE%' 
		or col2 like '%LOVEJOY%' 
		or col2 like '%BA WILLAMET%'  
		or col2 like '%INF*PEOPLES%' 
		or col2 like '%SQ *WILLAME%'
		then 'Commercial Food Service'
		 else null end as commercialfoodservice 
from subset_split 
)
select subset_case
	, count (*)
from subset_case
where not commercialfoodservice is null
group by subset_case 

-- According to this query, Food services accounts for 2647 locations. (Out of 24534) 

-- Deep Dive on Initials Pattern (Count of Retail Stores in col2) (With Changes)

with subset as
(
select descr 
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
		 or col2 like '%RAPID REFIL%'
		 or col2 like '%AMAZON%' 
		 or col2 like '%SAFEWAY%'
		 or col2 like '%THE HOME DE%' 
		 or col2 like '%FRED-MEYER%' 
		 or col2 like '%SUPPLYWORKS%' 
		 or col2 like '%COOKE STATI%'
		 or col2 like '%LOWES%' 
		 and not col2 like '%FELLOWES%' 
		 or col2 like '%TARGET%' 
		 or col2 like '%OFFICEMAX%' 
		 or col2 like '%WAL-MART%'  
		 or col2 like '%WALMART%'
		 or col2 like '%WALGREENS%' 
		 or col2 like '%HARBOR FREI%' 
		 or col2 like '%WHOLEFDS%' 
		 or col2 like '%COSTCO%' 
		 or col2 like '%ROTHS%' 
		 or col2 like '%TOTAL OFFIC%' 
		 or col2 like '%TRADER JOE%' 
		 or col2 like '%FEDEXOFFICE%'
		 or col2 like '%CAPITAL TRO%' 
		 or col2 like '%MADE IN OR%' 
		 or col2 like '%PARTY MART%' 
		 or col2 like '%RITE AID%' 
		 or col2 like '%JO-ANN%'
		 or col2 like '%NEWEGG%'  
		 or col2 like '%FROMUTH%'  
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
		 or col2 like '%FOODLAND%' 
		 or col2 like '%RITE AID%' 
		 or col2 like '%THE WILLAME%' 
		 or col2 like '%WILLAMETT%'
		 or col2 like '%ULINE *SHI%'  
		 or col2 like '%ART DEPARTM%' 
		 or col2 like '%CRUCIAL.COM%' 
		 or col2 like '%ACUSHNET CO%'
		 or col2 like '%ECO-PRODUCT%'
		 or col2 like '%EBAY%'
		 or col2 like '%DICK%'
		 or col2 like '%BIG 5 SPORT%'
		 or col2 like '%BED BATH &%'
		 or col2 like '%POWELL%'
		 or col2 like '%SEARS%' 
		 or col2 like '%MEGA FOODS%'
		 or col2 like '%GROCERY%'
		 or col2 like '%CORNER STO%'
		 or col2 like '%BI-MART%'
		 or col2 like '%BARNES & NOBLE%'
		 or col2 like '%STAPLES%'
		 or col2 like '%FULL C%'
		 or col2 like '%CIRELLA%'
		 or col2 like '%PARTSWAREHO%'
		 or col2 like '%MONOPRICE%'
		 or col2 like '%MELITTA%'
		 or col2 like '%IKEA%' 
		 or col2 like '%DOLLAR TREE%'
		 or col2 like '%CINDYS HALL%' 
		 or col2 like '%BEST BUY%'
		 or col2 like '%BATTERIES%'
		 or col2 like '%ZORO TOOL%'
		 or col2 like '%WEST MARINE%'
		 or col2 like '%MILL END%'
		 or col2 like '%J W PEPPER%'
		 or col2 like '%GOODWILL%'
		 or col2 like '%CUSTOMINK%'
		 or col2 like '%CREATIVE IM%'
		 or col2 like '%COST PLUS%'
		 or col2 like '%CASH AND CA%'
		 or col2 like '%BOOK BIN%' 
		 or col2 like '%DBC*BLICK A%'
		 or col2 like '%BSN*SPORT S%'
		 or col2 like '%S AND S VEN%'
		 or col2 like '%ABEBOOK%'
		 or col2 like '%THE MARKET%'
		 or col2 like '%DMI* DELL H%'
		 or col2 like '%DKC*DIGI KE%'
		 then 'Retail Stores'
		 else null end as retailstores 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not retailstores is null
group by subset_case 

-- 6931 Locations 

-- Deep Dive on Initials Pattern (Count of Transportation in col2) With Changes

with subset as
(
select descr 
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
		 or col2 like '%SQ *DOUBLE%' 
		 or col2 like '%ASPEN%' 
		 or col2 like '%MAIN TERM S%'
		 or col2 like '%ENTERPRISE%' 
		 or col2 like '%UNITED%' 
		 or col2 like '%TRAVELODGE%'
		 or col2 like '%DELTA%'
		 or col2 like '%SOUTHWES%' 
		 or col2 like '%INTERNATION%' 
		 or col2 like '%AIRPORT%'
		 or col2 like '%AMERICAN%' 
		 or col2 like '%DOUBLETREE%' 
		 or col2 like '%THE GRAND H%'
		 or col2 like '%RED LION%' 
		 or col2 like '%JETBLUE%' 
		 or col2 like '%MARRIOTT%'
		 or col2 like '%HILTON HOTE%' 
		 or col2 like '%HILTON PORT%' 
		 or col2 like '%HILTON BUEN%'
		 or col2 like '%HILTON GARD%' 
		 or col2 like '%HILTON WAIK%' 
		 or col2 like '%HILTON OAK%' 
		 or col2 like '%HILTON ADVA%'
		 or col2 like '%HILTON ELAR%' 
		 or col2 like '%HILTON PARK%' 
		 or col2 like '%HILTON MIX%' 
		 or col2 like '%HILTON PARC%' 
		 or col2 like '%HILTON TROP%' 
		 or col2 like '%HILTON EUGE%' 
		 or col2 like '%HILTON WOOD%'   
		 or col2 like '% INN%'  
		 or col2 like '%EMBASSY SUI%' 
		 or col2 like '%HERTZ%' 
		 or col2 like '%HOTEL%' 
		 or col2 like '%BEST WESTER%'
		 or col2 like '%TRAVEL INSU%'  
		 or col2 like '%LA QUINTA%'  
		 or col2 like '%ORBITZ%'
		 or col2 like '%RADISSO%'
		 or col2 like '%AIRBNB%' 
		 or col2 like '%RESIDENCE%' 
		 or col2 like '%TAXI CAB%'  
		 or col2 like '%YELLOW CAB%' 
		 or col2 like '%ORANGE CAB%'
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
		 or col2 like '%7-ELEVEN%'
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
		 or col2 like '%FLIGHT%'
		 or col2 like '%ATLANTIC%' 
		 or col2 like '%ATLANTA%' 
		 or col2 like '%GOGOAIR%' 
		 or col2 like '%HOTWIRE%' 
		 or col2 like '%PASSPORT%' 
		 or col2 like '%LIMOS.COM%' 
		 or col2 like '%JR EAST HOT%' 
		 or col2 like '%HENRYS PDX%'
		 or col2 like '%CITY OF POR%' 
		 or col2 like '%PDXPKG THRI%' 
		 or col2 like '%BRITISH A 1%'
		 or col2 like '%BOSIE AIRPO%'
		 or col2 like '%BEACHES RES%'
		 or col2 like '%AVIS.COM PR%'
		 or col2 like '%USAIRWAY 0%'
		 or col2 like '%THEODORE FR%' 
		 or col2 like '%PSU PDX.EDU%'
		 or col2 like '%HOMEWOOD SU%'
		 or col2 like '%CTRIP SH HU%'
		 or col2 like '%CROWNE PLAZ%' 
		 or col2 like '%CHEAPOAIR.C%'
		 or col2 like '%SWA INFLIGH%'
		 or col2 like '%PRINCE HOTE%' 
		 or col2 like '%PDX LAURELW%'
		 or col2 like '%DISNEY RESO%'
		 or col2 like '%ALAMO%'
		 or col2 like '%PLN*PRICELI%'
		 and not col2 like '%SPARK%' 
		 and not col2 like '%PROPARK%'
		 then 'Travel, Lodging, and Transportation'
		 else null end as travelandlodging
from subset_split 
)
select subset_case 
	, count(*)
from subset_case
where not travelandlodging is null
group by subset_case 

-- According to this query, Travel, Lodging, and Transportation accounts for 5297 locations. 


-- Deep Dive on Initials Pattern (Count of Network in col2) 

with subset as
(
select descr 
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
	case when col2 like '%COMCAST%' 
		or col2 like '%THOMSON WES%' 
		or col2 like '%DISH NETWOR%'
		or col2 like '%GOOGLE%'
		or col2 like '%BOOMERANG F%'
		or col2 like '%MICROSOFT%'
		or col2 like '%LINKEDIN%'
		or col2 like '%VZWRLSS%'
		then 'Network'
		else null end as network 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not network is null
group by subset_case 

--258 rows

-- Deep Dive on Initials Pattern (Count of Academic in col2) 

with subset as
(
select descr 
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
	case when col2 like '%OREGON STAT%' 
		or col2 like '%HAR*HARVARD%'
		or col2 like '%OETC TECHHE%'
		or col2 like '%WEST ACADEM%'
		or col2 like '%AAC AND U%'
		or col2 like '%NAFSA ASSOC%'
		or col2 like '%FAIRMONT NE%'
		or col2 like '%PNACAC%'
		or col2 like '%AACRAO%'
		or col2 like '%BRILL ACADE%'
		or col2 like '%SCHOLASTICA%'
		or col2 like '%TAYLOR & FR%'
		or col2 like '%U OREGON ON%'
		or col2 like '%ACPA%' 
		or col2 like '%AGB%'
		or col2 like '%CAROLINA AC%'
		or col2 like '%ETHICSGAME%'
		or col2 like '%ETS*TOEFL S%'
		or col2 like '%MODERN LANG%'
		or col2 like '%OXFORD UNIV%' 
		or col2 like '%MPACE%'
		or col2 like '%ACADEMIC IM%'
		or col2 like '%PSU%' 
		or col2 like '%AMERICAN BA%'
		or col2 like '%NASPA-AUTHO%' 
		or col2 like '%YOUTH WITH%'
		or col2 like '%NTL COUNCL%'
		or col2 like '%MPACE%'
		then 'Academic'
		else null end as academic 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not academic is null
group by subset_case  

-- 339 rows 

-- Deep Dive on Initials Pattern (Count of Other Services in col2) 

with subset as
(
select descr 
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
	case when col2 like '%REPUBLIC SE%' 
		or col2 like '%LIBRARY%' 
		or col2 like '%PP*AMANDAST%'
		or col2 like '%TLF OLSON F%'
		or col2 like '%WF4WASBASSO%' 
		or col2 like '%SOCIAL ENTE%' 
		or col2 like '%SOCIETY OF%' 
		or col2 like '%TEMPORARY D%' 
		or col2 like '%DYNAMIC MED%'
		or col2 like '%IN *FRONT R%'
		or col2 like '%JCB CO LTD %'
		or col2 like '%NALP -- AMS%'
		or col2 like '%ANTON MAD A%'
		or col2 like '%PCI*PATTERS%'
		or col2 like '%TFS*FISHERS%'
		or col2 like '%CTC*CONSTAN%' 
		or col2 like '%THE AMERICA%' 
		or col2 like '%AFFORDABLE%'  
		or col2 like '%CASTLE BRAN%'
		or col2 like '%NOR*NORTHER%'
		or col2 like '%PLI*PRCTISN%'
		or col2 like '%418-SMAC SA%'
		or col2 like '%WILLIAM S H%' 
		or col2 like '%GAN*1074STA%'
		or col2 like '%XEROX%'
		or col2 like '%SHRED-IT%'
		or col2 like '%SIGMA ALDRI%'
		or col2 like '%ANDERSON MC%'
		or col2 like '%CARL B KLEA%'
		or col2 like '%PHOTOVISION%'
		or col2 like '%COASTWIDE L%'
		or col2 like '%CAROLINA BI%'
		or col2 like '%GREEN THUMB%'
		or col2 like '%SONITROL PA%'
		or col2 like '%U-HAUL%'
		or col2 like '%DEMCO%' 
		or col2 like '%PAINT%'
		or col2 like '%SEDCOR%'
		or col2 like '%STAGE SPOT%'
		or col2 like '%THE UPS STO%'
		or col2 like '%USPS 407397%'
		or col2 like '%ADY*SPOTIFY%'
		or col2 like '%BANDON DUNE%'
		or col2 like '%FURNITURE%' 
		or col2 like '%HOLLINGER%'
		or col2 like '%OREGON LIBR%'
		or col2 like '%PRODUCTION%'
		or col2 like '%SALEM BLUE%'
		or col2 like '%USPS%'
		or col2 like '%VARIDESK%'
		or col2 like '%VISTAPR*VIS%'
		or col2 like '%CASE PARTS %'
		or col2 like '%DUNIWAY STO%'
		or col2 like '%GALLUP INC %'
		or col2 like '%HAY GROUP I%' 
		or col2 like '%KENTEK CORP%'
		or col2 like '%PODS #51%'
		or col2 like '%TED PELLA I%'
		or col2 like '%THE SHUTTER%'
		or col2 like '%COMMERCIAL%'
		or col2 like '%B&H PHOTO%'
		or col2 like '%GRADUATE MG%' 
		or col2 like '%APL*APPLEON%'
		then 'Other Services'
		else null end as other_services 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not other_services is null
group by subset_case 

--1544 rows 

-- Deep Dive on Initials Pattern (Count of City in col2) 

with subset as
(
select descr 
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
	case when col2 like '%SOUTH SALEM%'
		or col2 like '%WEST SALEM %'
		or col2 like '%SALEM PERMI%'
		or col2 like '%CITY OF EUG%'
		or col2 like '%GHB - SALEM%'
		or col2 like '%SALEM SPLAS%'
		or col2 like '%WSBA%'
		or col2 like '%GG *OREGON %'
		or col2 like '%LOS ANGELES%'
		or col2 like '%PORTLAND, O%'
		then 'City'
		else null end as city 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not city is null
group by subset_case   

--133 rows

-- Deep Dive on Initials Pattern (Count of Software in col2) 

with subset as
(
select descr 
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
	case when col2 like '%ADOBE *CREA%' 
		or col2 like '%ADOBE *EXPO%'
		or col2 like '%SURVEYMONKE%'
		or col2 like '%SURVEYGIZMO%'
		or col2 like '%WWW.5PMWEB.%'
		then 'Software'
		else null end as software 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not software is null
group by subset_case   

--159 rows 

-- Deep Dive on Initials Pattern (Count of Online Resources in col2) 

with subset as
(
select descr 
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
	case when col2 like '%LYNDA.COM%' 
		or col2 like '%QUARTZY.COM%'
		or col2 like '%EMA*EMMA EM%'
		or col2 like '%OJD OJIN ON%'
		or col2 like '%TCD*TTA-RES%'
		or col2 like '%CDW GOVERNM%'
		or col2 like '%ETS*GRE SEA%'
		or col2 like '%INREACH LLC%'
		or col2 like '%MAVENLINK %'
		or col2 like '%HIGHEREDJOB%'
		or col2 like '%LEX*LEXIS N%'	
		then 'Online Resources'
		else null end as online_resources 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not online_resources is null
group by subset_case   

-- 201 rows 

-- Deep Dive on Initials Pattern (Count of Newspaper in col2) 

with subset as
(
select descr 
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
	case when col2 like '%REGISTER GU%' 
		or col2 like '%THE CHRONIC%'
		or col2 like '%GAN*STATESM%'
		or col2 like '%OREGONIAN P%'
		or col2 like '%THE OREGONI%'
		or col2 like '%D J*WALL ST%'
		or col2 like '%HUDSONNEWS %'
		then 'Newspaper'
		else null end as newspaper 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not newspaper is null
group by subset_case  

--99 rows 

-- Deep Dive on Initials Pattern (Count of Payments in col2) 

with subset as
(
select descr 
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
	case when col2 like '%AGNT FEE 8%'
		or col2 like '%AGENT FEE 8%'
		or col2 like '%BUDGET RENT%'
		or col2 like '%REI*PAYMENT%'
		or col2 like '%*FINANCE CH%'
		or col2 like '%AUTOPAY/DIS%'
		or col2 like '%PAYPAL *ORE%'
		or col2 like '%SQ *GOSQ.CO%'
		or col2 like '%INSURANCE P%'
		or col2 like '%REI*MATTHEW%' 
		or col2 like '%ASSOCIATION%' 
		or col2 like '%FRAUD CREDI%'
		then 'Payments'
		else null end as payments 
from subset_split 
)
select subset_case
	, count (*)
from subset_case 
where not payments is null
group by subset_case  

--378 rows







