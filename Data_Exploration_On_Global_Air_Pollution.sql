

--  DATA EXPLORATION  ON GLOBAL AIR POLLUTÝON 



--Showing AQI value in the spesific location

select Country,City,[AQI Value],[AQI Category]
from [global air pollution dataset] where 
Country = 'Turkey' And [AQI Value] <50 

--Showing a spesific location that is over 50 AQI 

select Country,City,[AQI Value],[AQI Category]
from [global air pollution dataset]
where [AQI Value] > 50 And Country like '%States%'

-- Showing AQI  in a  number of location

select Country,City,[AQI Value],[AQI Category]
from [global air pollution dataset]
where Country in ('Sweden''Norway','Finland','Denmark','Iceland')

-- Showing AQI in a frequency

select Country,City,[AQI Value],[AQI Category] 
from [global air pollution dataset]
where [AQI Value] Between 30 And 60

-- Showing CO AQI in  a spesific location that is over 1 

select Country,City,[CO AQI Value],[CO AQI Category]
from [global air pollution dataset]
where Country = 'Turkey' and [CO AQI Value] >1

-- Showing Locations whose CO AQI is  over 1 

select Country,City,[CO AQI Value],[CO AQI Category]
from [global air pollution dataset]
where [CO AQI Value] > 10

-- Showing CO AQI in a number of locations 

select Country,City,[CO AQI Value],[CO AQI Category]
from [global air pollution dataset]
where Country in ('Sweden''Norway','Finland','Denmark','Iceland')

-- Showing spesific location whose CO AQI is over 4 

select Country,City,[CO AQI Value],[CO AQI Category]
from [global air pollution dataset]
where [CO AQI Value] > 4 And Country like '%States%'

-- Showing ozone AQI in a  spesific Location whose ozone AQI is over 100

select Country,City,[Ozone AQI Value],[Ozone AQI Category]
from [global air pollution dataset]
where  [Ozone AQI Value] > 100 and Country = 'China'

-- Showing an ozone AQI category 

select Country,City,[Ozone AQI Value],[Ozone AQI Category]
from [global air pollution dataset]
where [Ozone AQI Category] = 'Unhealthy for Sensitive Groups'

-- Showing an ozone AQI category

select Country,City,[Ozone AQI Value],[Ozone AQI Category]
from [global air pollution dataset]
where [Ozone AQI Category] = 'Very Unhealthy'

-- Showing ozone AQI category in a number of locations

select Country,City,[Ozone AQI Value],[Ozone AQI Category]
from [global air pollution dataset]
where  Country in ('Sweden''Norway','Finland','Denmark','Iceland')

-- Showing highest AQI 

select country,max([AQI Value]) as highest_AQI_Value
from [global air pollution dataset]
group by Country
order by highest_AQI_Value asc

-- Showing lowest AQI 

select Country,min([AQI Value]) as lowest_AQI_Value
from [global air pollution dataset]
group by Country
order by lowest_AQI_Value asc

-- Showing highest CO AQI 

select Country,max([CO AQI Value]) as highest_CO_AQI_Value
from [global air pollution dataset]
group by Country 
order by highest_CO_AQI_Value asc 

--  Shoeing lowest CO AQI 

select Country,min([CO AQI Value]) as lowest_CO_AQI_Value
from [global air pollution dataset]
group by Country
order by lowest_CO_AQI_Value asc 

--Showing highest ozone AQI

select Country ,max([Ozone AQI Value]) as highest_Ozone_AQI_Value
from [global air pollution dataset]
group by Country
order  by highest_Ozone_AQI_Value asc 

-- Showing lowest ozone AQI 

select Country,min([Ozone AQI Value]) as lowest_Ozone_AQI_Value
from [global air pollution dataset]
group by Country
order by lowest_Ozone_AQI_Value  asc 

-- Showing average AQI that is over 50 

Select Country,AVG([AQI Value]) as Average_AQI_Value
from [global air pollution dataset] 
group by Country
having avg([AQI Value]) > 50

-- Showing Average AQI that is below 50 

Select Country,AVG([AQI Value]) as Average_AQI_Value
from [global air pollution dataset] 
group by Country
having avg([AQI Value]) < 50

-- Showing Average AQI that is over 150 in cities

select City,AVG([AQI Value]) as Average_AQI_Value
from [global air pollution dataset]
group by City 
having avg([AQI Value]) > 150

-- Showing Average AQI that is below 20 in cities

select City,AVG([AQI Value]) as Average_AQI_Value
from [global air pollution dataset]
group by City 
having avg([AQI Value]) < 20

-- Showing Average CO AQI that  is over 1 

select Country,AVG([CO AQI Value]) as Average_CO_AQI_Value
from [global air pollution dataset]
group by Country 
having avg([CO AQI Value]) > 1

-- Showing Average  CO AQI that is below 1 

select Country,AVG([CO AQI Value]) as Average_CO_AQI_Value
from [global air pollution dataset]
group by Country 
having avg([CO AQI Value]) < 1

-- Showing Average  CO AQI that is over 5 in cities 

select City,AVG([CO AQI Value]) as Average_CO_AQI_Value
from [global air pollution dataset]
group by City 
having avg([CO AQI Value]) > 5

-- Showing Average CO AQI that is below 2

select City,AVG([CO AQI Value]) as Average_CO_AQI_Value
from [global air pollution dataset]
group by City 
having avg([CO AQI Value]) < 2

-- Showing Average ozone AQI that is over 50 

select Country,AVG([Ozone AQI Value]) as Average_Ozone_AQI_Value
from [global air pollution dataset]
group by Country 
having avg([Ozone AQI Value]) > 50

-- Showing Average ozone AQI  that is below 50 

select Country,AVG([Ozone AQI Value]) as Average_Ozone_AQI_Value
from [global air pollution dataset]
group by Country 
having avg([Ozone AQI Value]) < 50

-- Showing Average ozone AQI that is over 150

select City,AVG([Ozone AQI Value]) as Average_Ozone_AQI_Value
from [global air pollution dataset]
group by City 
having avg([Ozone AQI Value]) > 150

-- Showing Average ozone AQI that is below 10 

select City,AVG([Ozone AQI Value]) as Average_Ozone_AQI_Value
from [global air pollution dataset]
group by City 
having avg([Ozone AQI Value]) < 10

-- Showing  the comparison of Average AQI in CTE

with  AirPollution_CTE
as
(
select Country,avg([AQI Value]) as Average_AQI_Value
from [global air pollution dataset]
group by  Country
)

select * , Case
          when   Average_AQI_Value < 100 then 'Good Air Quality'
		  when   Average_AQI_Value > 100 then 'Unhealty Air Quality'
		  end
		  as Quality_Category
from AirPollution_CTE        
