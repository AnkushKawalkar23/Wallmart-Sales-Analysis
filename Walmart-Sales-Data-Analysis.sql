create database walmart;

use walmart; 

drop table tbl_walmart_sales; 

select count(*) from tbl_walmart_sales;

DESCRIBE tbl_walmart_sales;

-- Exploratory Data Analysis (EDA) --
### Generic Question
-- How many distinct cities are present in the dataset?
select * from tbl_walmart_sales; 
select distinct(city) from tbl_walmart_sales; 

-- In which city is each branch situated?
select branch, city from tbl_walmart_sales order by branch; 

### Product Analysis
-- How many distinct product lines are there in the dataset?
select distinct(`Product line`) from tbl_walmart_sales; 

-- What is the most common payment method?
select distinct(payment) from tbl_walmart_sales; 

-- What is the most selling product line?
select * from tbl_walmart_sales; 
SELECT `Product line`, SUM(Quantity) AS Total_Quantity FROM tbl_walmart_sales GROUP BY `Product line` ORDER BY Total_Quantity DESC LIMIT 1;

-- What is the total revenue by month?
select sum(total), month(str_to_date(date, '%d-%m-%Y')) as Month from tbl_walmart_sales group by month order by month asc;

-- Which month recorded the highest Cost of Goods Sold (COGS)?
select max(cogs), month(str_to_date(date,'%d-%m-%Y')) as Month from tbl_walmart_sales group by month order by month;

-- Which product line generated the highest revenue?
select * from tbl_walmart_sales; 
select `product line`, sum(total) as Revenue from tbl_walmart_sales group by `product line` order by Revenue desc limit 1; 

-- Which city has the highest revenue?
select city, sum(total) as Highest_Revenue from tbl_walmart_sales group by city order by Highest_revenue desc limit 1;

-- Which product line incurred the highest VAT?
select `product line`, sum(`tax 5%`) as VAT from tbl_walmart_sales group by `product line` order by VAT desc limit 1; 

-- Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,' based on whether its sales are above the average.
SELECT 
    `Product line`, 
    SUM(Total) AS Total_Sales,
    CASE
        WHEN SUM(Total) > (
            SELECT AVG(Total_Sales) 
            FROM (
                SELECT SUM(Total) AS Total_Sales
                FROM tbl_walmart_sales
                GROUP BY `Product line`
            ) AS t
        )
        THEN 'Good'
        ELSE 'Bad'
    END AS product_category
FROM tbl_walmart_sales
GROUP BY `Product line`;

-- Which branch sold more products than average product sold?
select branch, sum(Quantity) from tbl_walmart_sales group by branch having sum(quantity) >(select sum(quantity)/ count(distinct(branch)) from tbl_walmart_sales);

-- What is the most common product line by gender?
select * from tbl_walmart_sales ; 
select `product line`, gender, count(*) from tbl_walmart_sales group by gender, `product line` order by gender desc; 

-- What is the average rating of each product line?
select avg(rating) as Average_rating, `product line` from tbl_walmart_sales group by `product line` order by Average_rating; 

### Sales Analysis
-- Number of sales made in each time of the day per weekday
SELECT 
    DAYNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS Weekday,
    CASE 
        WHEN HOUR(Time) < 12 THEN 'Morning'
        WHEN HOUR(Time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Time_of_day,
    COUNT(*) AS Number_of_sales
FROM tbl_walmart_sales
GROUP BY Weekday, Time_of_day
ORDER BY Weekday, Time_of_day;

-- Identify the customer type that generates the highest revenue.
select `customer type`, sum(total) as Revenue from tbl_walmart_sales group by `customer type` order by Revenue; 

-- Which city has the largest tax percent/ VAT (Value Added Tax)?
select city, max(`tax 5%`) as Largest_Tax from tbl_walmart_sales group by city order by Largest_tax desc; 

-- Which customer type pays the most VAT?
select `customer type`, sum(`tax 5%`) as VAT from tbl_walmart_sales group by `customer type` order by VAT desc limit 1; 

### Customer Analysis
-- How many unique customer types does the data have?
select distinct(`customer type`) from tbl_walmart_sales; 
select * from tbl_walmart_sales; 

-- How many unique payment methods does the data have?
select distinct(payment) from tbl_walmart_sales; 

-- Which is the most common customer type?
select `customer type`, count(*) as Customer_type from tbl_walmart_sales group by `customer type` order by Customer_type desc; 

-- Which customer type buys the most?
select `customer type`, sum(quantity) as Quantity from tbl_walmart_sales group by `customer type` order by quantity desc; 

-- What is the gender of most of the customers?
select gender, count(gender)  from tbl_walmart_sales group by gender; 

-- What is the gender distribution per branch?
select Branch, gender, count(*) as Gender_count from tbl_walmart_sales group by branch, gender order by branch, gender_count desc;

-- Which time of the day do customers give most ratings?
 select case
			when hour(time) < 12 then 'Morning'
            when hour(time) between 12 and 17 then 'Afternoon'
            else 'Evening'
		end as Time_of_day, count(rating) as Total_Ratings from tbl_walmart_sales group by Time_of_day order by total_ratings desc; 
        
-- Which time of the day do customers give most ratings per branch?
SELECT 
    Branch,
    CASE 
        WHEN HOUR(Time) < 12 THEN 'Morning'
        WHEN HOUR(Time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS Time_of_day,
    COUNT(Rating) AS Total_Ratings
FROM tbl_walmart_sales
GROUP BY Branch, Time_of_day
ORDER BY Branch, Total_Ratings DESC;

-- Which day of the week has the best average ratings?
SELECT 
    DAYNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS Day_of_Week,
    AVG(Rating) AS Avg_Rating
FROM tbl_walmart_sales
GROUP BY Day_of_Week
ORDER BY Avg_Rating DESC
LIMIT 1;

-- Which day of the week has the best average ratings per branch?
SELECT 
    Branch,
    DAYNAME(STR_TO_DATE(Date, '%d-%m-%Y')) AS Day_of_Week,
    AVG(Rating) AS Avg_Rating
FROM tbl_walmart_sales
GROUP BY Branch, Day_of_Week
ORDER BY Branch, Avg_Rating DESC;