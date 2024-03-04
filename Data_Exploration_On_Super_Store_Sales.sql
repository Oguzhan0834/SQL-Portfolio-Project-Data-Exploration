
-- DATA EXPLORATÝON ON SUPER STORE SALES DATASET


select product_id,product_name,category,
segment,Country,ship_date,Sales
from SuperStoreOrders$
where Country = 'Turkey'
and category = 'Technology'


select Order_Priority,Sum(sales)
as Total_Sales_By_Priority
from SuperStoreOrders$
group by order_priority
order by Total_Sales_By_Priority asc

select category,Sum(Sales) as Total_Sales_By_Categories
from SuperStoreOrders$
group by category
order by Total_Sales_By_Categories asc


select sub_category,Sum(Sales) 
as Total_Sales_By_Sub_Categories 
from SuperStoreOrders$
group by sub_category
order by Total_Sales_By_Sub_Categories asc


select segment,Sum(Sales) 
as Total_Sales_By_Segments  
from SuperStoreOrders$
group by segment
order by Total_Sales_By_Segments asc


select country,sum(Sales) 
as Total_Sales_By_Countries
from SuperStoreOrders$
group by country
order by Total_Sales_By_Countries asc 


select market,Sum(Sales) as Average_Sales_By_Markets
from SuperStoreOrders$
group by market
having Avg(Sales) > 120 
order by Average_Sales_By_Markets


select Region,Sum(Profit) Average_Profit_By_Regions
from SuperStoreOrders$
group by region
having Avg(Profit) >50000
order by Average_Profit_By_Regions


select year,Sum(Sales)
as Total_Sales_By_years
from SuperStoreOrders$
group by year
order by Total_Sales_By_years asc


select Ship_Date,sum(Sales) 
as Total_Sales_By_Ship_Dates 
from SuperStoreOrders$
group by ship_date
order by Total_Sales_By_Ship_Dates asc


select customer_name,product_id,product_name,category,sub_category,segment,country,
sum(sales) over (partition by Customer_Name order by Category asc )
as Total_Sales_By_Customer_Name,
Avg(Sales) over (Partition by Customer_Name order by Category asc)
as Average_Sales_By_Customer_Name 
from SuperStoreOrders$
Select * from SuperStoreOrders$

select Product_Name,category,sub_category,segment,country,region,market,
sum(Sales) over (partition by Product_name order by Category asc)
as Total_Sales_By_Product_Name,
Avg(Sales) over (Partition by Product_name order by Category asc)
as Average_Sales_By_Product_Name
from SuperStoreOrders$


select country,Market,Region,Category,
sum(Sales) over (partition by Country order by Country asc)
as Total_Sales_By_Countries,
Sum(Sales) over (Partition by Market order by Market asc)
as Total_Sales_By_Markets,
sum(Sales) over (partition by Region order by Region asc)
as Total_Sales_By_Regions 
from SuperStoreOrders$


select country,Market,Region,category,
avg(Sales) over (partition by Country order by Country asc)
as Average_Sales_By_Countries,
avg(Sales) over (Partition by Market order by Market asc)
as Average_Sales_By_Markets,
avg(Sales) over (partition by Region order by Region asc)
as Average_Sales_By_Regions 
from SuperStoreOrders$

select country,State,market,region,Category,Sales,
sum(Sales) over (Partition by Category order by Country asc)
as Total_Sales_By_Category_in_Some_Developed_Countries,
Avg(Sales) over (partition by Category order by Country asc)
as Average_Sales_By_Category_in_Some_Developed_Countries 
from SuperStoreOrders$ 
where Country 
in ('United States','Germany','United Kingdom','France','Sweden','Finland','Norway','South Korea','Japan')


select country,State,Market,region,category,Sales,
sum(Sales) over (partition by Category order by Country  asc)
as Total_Sales_By_Category_In_Some_Developing_Countries,
Sum(sales) over (partition by Category order by Country asc)
as Average_Sales_By_Category_In_Some_Developing_Countries 
from SuperStoreOrders$
where country  in ('Brazil','Russia','China','Turkey','South Africa','Indonesia','Malaysia','Mexico','Poland')


select country,State,Market,region,category,Sales,
sum(Sales) over (partition by Category order by Country  asc)
as Total_Sales_By_Category_In_Some_Least_Developed_Countries,
Sum(Sales) over (partition by Category order by Country asc)
as Average_Sales_By_Category_In_Some_Least_Developed_Countries 
from SuperStoreOrders$
where country  in ('Afghanistan','Myanmar','Rwanda','Cambodia','Angola','Ethihopia','Senegal','Uganda','Niger')

with Comparing_Sales_CTE 
as 
(
select country,sum(Sales) 
as Total_Sales_By_Countries
from SuperStoreOrders$
group by country
)
select *,Case
    when Total_Sales_By_Countries < 10000 then 'Low Sales'
	when Total_Sales_By_Countries > 10000 then 'Medium Sales'
	when Total_Sales_By_Countries > 30000 then 'High Sales'
	when Total_Sales_By_Countries >100000 then 'Extreme Sales'
	END
	as Rating_Of_Sales
	from Comparing_Sales_CTE
	order by country asc





with SalesInfo_Cte 
as
(
select country,Market,Region,Category,
sum(Sales) over (partition by Country order by Country asc)
as Total_Sales_By_Countries,
Sum(Sales) over (Partition by Market order by Market asc)
as Total_Sales_By_Markets,
sum(Sales) over (partition by Region order by Region asc)
as Total_Sales_By_Regions
from SuperStoreOrders$
)

select Country,Market,Region, (Total_Sales_By_Countries/Total_Sales_By_Markets) * 100 
as Percentage_Of_Total_Sales_To_Markets,
(Total_Sales_By_Countries/Total_Sales_By_Regions) * 100 
as  Percentage_Of_Total_Sales_To_Regions
from SalesInfo_Cte






