create database asha
use asha
select * from [dbo].[Superstore];
select Profit from [dbo].[Superstore] where 
TRY_CONVERT(decimal(18,2),Profit) is null and Profit is not null;
alter table [dbo].[Superstore]
alter column Profit decimal(18,2);

/*Checking the Superstore dataset
This section checks for NULL values
in the Row ID column*/

select Row_ID from [dbo].[Superstore] where Row_ID is null;
select Order_ID from [dbo].[Superstore] where Order_ID is null;
select Order_Date from [dbo].[Superstore] where Order_Date is null;
select Ship_Date from [dbo].[Superstore] where Ship_Date is null;
select Ship_Mode from [dbo].[Superstore] where Ship_Mode is null;
select Customer_ID from [dbo].[Superstore] where Customer_ID is null;
select Customer_Name from [dbo].[Superstore] where Customer_Name is null;
select Segment from [dbo].[Superstore] where Segment is null;
select Country from [dbo].[Superstore] where Country is null;
select City from [dbo].[Superstore] where City is null;
select State from [dbo].[Superstore] where State is null;
select Postal_Code from [dbo].[Superstore] where Postal_Code is null;
select Region from [dbo].[Superstore] where Region is null;
select Product_ID from [dbo].[Superstore] where Product_ID is null;
select Category from [dbo].[Superstore] where Category is null;
select Sub_Category from [dbo].[Superstore] where Sub_Category is null;
select Product_Name from [dbo].[Superstore] where Product_Name is null;
select Sales from [dbo].[Superstore] where Sales is null;
select Quantity from [dbo].[Superstore] where Quantity is null;
select Discount from [dbo].[Superstore] where Discount is null;
select Profit from [dbo].[Superstore] where Profit is null;

--null values checked
--checked all columns individually
--no null values were found

select Row_ID, count(*) from [dbo].[Superstore] 
group by Row_ID having count(*)>1;
select Order_ID, count(*) as Count from [dbo].[Superstore] 
group by Order_ID having count(*)>1;
select Order_Date, count(*) as Count from [dbo].[Superstore] 
group by Order_Date having count(*)>1;
select Ship_Date, count(*) as Count from [dbo].[Superstore] 
group by Ship_Date having count(*)>1;
select Ship_Mode, count(*) as Count from [dbo].[Superstore] 
group by Ship_Mode having count(*)>1;
select Customer_ID, count(*) as Count from [dbo].[Superstore] 
group by Customer_ID having count(*)>1;
select Customer_Name, count(*) as Count from [dbo].[Superstore] 
group by Customer_Name having count(*)>1;
select Segment, count(*) as Count from [dbo].[Superstore] 
group by Segment having count(*)>1;
select Country, count(*) as Count from [dbo].[Superstore] 
group by Country having count(*)>1;
select City, count(*) as Count from [dbo].[Superstore] 
group by City having count(*)>1;

select State, count(*) as Count from [dbo].[Superstore] 
group by State having count(*)>1;

select Postal_Code, count(*) as Count from [dbo].[Superstore] 
group by Postal_code having count(*)>1;
select Region, count(*) as Count from [dbo].[Superstore] 
group by Region having count(*)>1;
select Product_ID, count(*) as Count from [dbo].[Superstore] 
group by Product_ID having count(*)>1;
select Category, count(*) as Count from [dbo].[Superstore] 
group by Category having count(*)>1;
select Sub_Category, count(*) as Count from [dbo].[Superstore] 
group by Sub_Category having count(*)>1;
select Product_Name, count(*) as Count from [dbo].[Superstore] 
group by Product_Name having count(*)>1;
select Sales, count(*) as Count from [dbo].[Superstore] 
group by Sales having count(*)>1;
select Quantity, count(*) as Count from [dbo].[Superstore] 
group by Quantity having count(*)>1;
select Discount, count(*) as Count from [dbo].[Superstore] 
group by Discount having count(*)>1;
select Profit, count(*) as Count from [dbo].[Superstore] 
group by Profit having count(*)>1;

/*Repeated  order ids and customer ids were retained 
because the dataset is transaction level, 
where a customer/order can legitimately have multiple records.*/
select * from [dbo].[Superstore];

SELECT
    [Order_ID],
    [Customer_Name],
	[Product_Name],
    [Product_ID],
	[Sub_category],
	[Profit],
    [Sales],
    COUNT(*)
FROM [dbo].[Superstore]
GROUP BY
    [Order_ID],
    [Customer_Name],
	[Product_Name],
    [Product_ID],
	[Sub_category],
	[Profit],
    [Sales]
HAVING COUNT(*) > 1;

select * from [dbo].[Superstore] where Customer_Name='Laurel Beltran' and Order_ID='US-2014-150119' 
and Product_ID='FUR-CH-10002965' and Sub_category='Chairs' and Profit=-12.06;

-- found one duplicate 3406 and 3407 Row Ids had all the same information so deleted one
delete from [dbo].[Superstore] where Row_ID=3407;
--
select * from [dbo].[Superstore];
--yearly sales of each year
select Year(Order_Date) as OrderYear,
Sum(Sales) as Total_Sales from [dbo].[Superstore]
group by Year(Order_Date)
order by Year(Order_Date);
--monthly sales for each and every year
select Year(Order_Date) as OrderYear,
Month(Order_Date) as Ordermonth,
Sum(Sales) as Total_Sales from [dbo].[Superstore]
group by 
Year(Order_Date),
Month(Order_Date)
order by OrderYear,Ordermonth;
--quarterly sales per year
select Year(Order_Date) as OrderYear,
Datepart(Quarter, Order_Date) As Quarter,
Sum(Sales) as Total_Sales from [dbo].[Superstore]
group by 
Year(Order_Date),
Datepart(Quarter, Order_Date)
order by OrderYear,Quarter;
--top 10 product with the highest sales
select top 10 Product_Name, sum(Sales) as Total_sales from [dbo].[Superstore]
group by Product_Name order by Total_sales desc;
--bottom 10 product with the highest sales
select top 10 Product_Name, sum(Sales) as Total_sales from [dbo].[Superstore]
group by Product_Name order by Total_sales;
--region wise sales
select Region, sum(Sales) as Total_sales from [dbo].[Superstore]
group by Region order by Region;
--state wise sales
select State, sum(Sales) as Total_sales from [dbo].[Superstore]
group by State order by State;
--Category wise total sales
select Category, sum(Sales) as Total_sales from [dbo].[Superstore]
group by Category order by Category desc;
-- Technology being the category sold most followed by Office Supplies and then Furniture
select * from [dbo].[Superstore];
--Sub_category sales ;- TABLES are the highest selling products
select Category,Sub_Category, sum(Sales) as Total_sales from [dbo].[Superstore]
group by Sub_Category,Category order by Sub_Category desc;
--
--TOTAL REVENUE
select round(sum(Sales),2) as Total_Revenue from [dbo].[Superstore];
--TOTAL PROFIT
select round(sum(Profit),2) as Total_Profit from [dbo].[Superstore];
-- For growth rate 
With YearlySales as (
select year(Order_Date) as OrderYear,
sum(Sales) as TotalSales,
lag(sum(sales)) Over(order by year(Order_Date)) as Previousyearsales
from [dbo].[Superstore] group by year(Order_Date))
select OrderYear, round(TotalSales,2) as TotalSales,
round(Previousyearsales,2) as Previousyearsales,
round(
((TotalSales - Previousyearsales)/Previousyearsales)*100,2) as Growth_Rate 
from YearlySales order by OrderYear

























