
--- DATA EXPLORATION ON NVIDIA DATASET

---  Showing Total Units Sales

select Sum(Units_Sold) as Total_Units_Sold 
from nvidia_market_analytics

--- Products with Highest Unit Sales

select Product_Name ,Units_Sold from nvidia_market_analytics 
where Units_Sold = (select max(Units_Sold) 
from nvidia_market_analytics )

--- Products With Lowest Unit Sales 

select Product_Name , units_Sold from nvidia_market_analytics
where Units_Sold = (select min(Units_Sold)
from nvidia_market_analytics)

--- Total Unit Sales By Categories

select Product_Category,sum(Units_Sold) as Total_Sales_By_Categories
from nvidia_market_analytics
group by Product_Category
order by 2 desc

--- Showing Total Marketing Expenditures 

select Sum(Marketing_Spend_USD) as Total_Marketing_Expeditures
from nvidia_market_analytics

---  Products With Highest Marketing Expenditures 

select Product_Name, Marketing_Spend_USD  from nvidia_market_analytics
where Marketing_Spend_USD = (select max(Marketing_Spend_USD) 
from nvidia_market_analytics)

---  Products With Highest Marketing Expenditures 

select Product_Name, Marketing_Spend_USD  from nvidia_market_analytics
where Marketing_Spend_USD = (select min(Marketing_Spend_USD) 
from nvidia_market_analytics)

--- Total Marketing Expenditures By Categories

select Product_Category , Sum(Marketing_Spend_USD)
as Total_Marketing_Expenditures_By_Categories
from nvidia_market_analytics
group by Product_Category
order by 2 desc

--- Total Sales Revenues

select Sum(Sales_Revenue_USD) as Total_Revenue_From_Sales
from nvidia_market_analytics 

--- Products With Highest Sales Revenues

select Product_Name, Sales_Revenue_USD from nvidia_market_analytics
where Sales_Revenue_USD = (select max(Sales_Revenue_USD)
from nvidia_market_analytics) 

--- Products With Lowest Sales Revenues

select Product_Name , Sales_Revenue_USD from nvidia_market_analytics
where Sales_Revenue_USD = (select min(Sales_Revenue_USD)
from nvidia_market_analytics)

--- Sales Revenues By Categories 

select Product_Category ,Sum(Sales_Revenue_USD)
as Total_Revenue_From_Sales_By_Categories from nvidia_market_analytics
group by Product_Category 
order by 2 desc 

--- Market Shares By Categories 

select Product_Category ,avg(Market_Share)
as Average_Market_Share_By_Categories from nvidia_market_analytics
group by Product_Category
order by 2 desc

--- Std of Market Shares of The Categories

select Product_Category ,STDEV(Market_Share) Std_By_Categories
from nvidia_market_analytics
group by Product_Category
order by 2 desc

--- Average Return Rates By Categories

select Product_Category , avg(Return_Rate)
as Average_Return_Rate_By_Categories from nvidia_market_analytics
group by Product_Category
order by 2 desc

--- Std Of Return Rates Of The Categories 

select Product_Category , STDEV(Return_Rate)
as  Std_For_Return_Rate_By_Categories from nvidia_market_analytics
group by Product_Category
order by 2 desc

--- Regions With Highest Sales Revenues 

select Region , Sales_Revenue_USD  from nvidia_market_analytics
where Sales_Revenue_USD = (select max(Sales_Revenue_USD) 
from nvidia_market_analytics)

---Regions With Lowest Sales Revenues 

select Region , Sales_Revenue_USD  from nvidia_market_analytics
where Sales_Revenue_USD = (select min(Sales_Revenue_USD) 
from nvidia_market_analytics)

--- Total Sales Revenues By Categories 

select Region , Sum(Sales_Revenue_USD) as Total_Revenue_By_Regions
from  nvidia_market_analytics 
group by Region 
order by 2 desc


