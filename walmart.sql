-- 1)Total Revenue
SELECT sum(Final_Amount) as "Total Revenue" from walmart_data

-- 2) Average Transaction Value
SELECT avg(Final_Amount) as "Average Transaction value" from walmart_data

-- 3)Revenue by category
SELECT Category,sum(Final_Amount) as "revenue" from walmart_data GROUP by Category order by "revenue"

-- 4)Top 10 product by revenue
SELECT Product ,round(sum(Final_Amount)) as "revenue" from walmart_data GROUP BY Product ORDER by revenue DESC limit 10

-- 5)Revenue by city
SELECT city ,round(SUM(Final_Amount)) "revenue" FROM walmart_data GROUP by City order by revenue DESC 

-- 6)top 3 product in each city
SELEcT * from(SELECT city,Product,sum(Final_Amount) as "revenue" ,rank() over(PARTITION by city order by sum(Final_Amount) desc) as rn from walmart_data GROUP by city ,product ) as t where t.rn<=3 ORDER by city,revenue DESC

-- 7)monthly revenue trends
SELECT date_format(`Date`,"%y-%M") as month,round(SUM(Final_Amount)) as "revenue" from walmart_data GROUP BY month ORDER by year(`Date`),revenue DESC

-- 8)highest sales on which dates
SELECT `Date` ,round(sum(Final_Amount)) as revenue from walmart_data GROUP by 	`Date` order by revenue desc


-- 9)sales by hours
SELECT hour(`Time`) as hour ,round(sum(Final_Amount)) as "revenue" from walmart_data GROUP by hour order by revenue DESC

-- 10)revenue by season
SELECT case WHEN month(`Date`) BETWEEN 3 and 6 then "Summer"
            when month(`Date`) BETWEEN 7 and 9 then "Monson" 
            else "winter" END as  Season,round(SUM(Final_Amount)) as revenue 
            FROM walmart_data GROUP by season order by revenue desc

-- 11)Average discount given per category
SELECT Category,avg(`Discount(%)`) as "average_discount" FROM walmart_data  GROUP by Category order by average_discount DESC

-- 12)revenue by payment method
SELECT Payment_Method,round(SUM(Final_Amount)) as revenue from walmart_data GROUP BY Payment_Method


-- 13)most sold product by quantity
SELECT Product ,sum(Quantity) total_quantity from walmart_data GROUP BY Product

-- 14)top selling product by season
SELECT * from (SELECT case WHEN month(`Date`) BETWEEN 3 and 6 then "Summer"
            when month(`Date`) BETWEEN 7 and 9 then "Monson" 
            else "Winter" END as  Season,product,round(SUM(Final_Amount)) as revenue ,sum(Quantity) ,rank() over(PARTITION by Season order by sum(Quantity)) as rn  FROM walmart_data GROUP by Season,Product) as t where t.rn<=3

-- 15) cATEGORY CONTRIBUTION % wise
SELECT Category,
       ROUND(SUM(Final_Amount) * 100.0 / (SELECT SUM(Final_Amount) FROM walmart_data), 2) AS contribution_percent
FROM walmart_data
GROUP BY Category;

-- 16) Peak Shopping Hour by City
SELECT * FROM (    SELECT City, HOUR(Time) as hour_of_day, SUM(Final_Amount) as total_sales, RANK() OVER (PARTITION BY City ORDER BY SUM(Final_Amount) DESC) as rn  FROM walmart_data GROUP BY City, HOUR(Time)) AS ranked_hours
WHERE rn = 1;

-- 17)Outlier High-revenue days
SELECT `Date`, daily_sales FROM 
	(  SELECT `Date`, SUM(Final_Amount) AS daily_sales  FROM walmart_data  GROUP BY Date) AS o WHERE daily_sales > ( SELECT AVG(daily_total) + 2 * STDDEV(daily_total) FROM ( SELECT SUM(Final_Amount) AS daily_total  FROM walmart_data GROUP BY Date) AS m) ORDER BY daily_sales DESC;
-- 18)Most discounted but underperforming Products
SELECT *FROM (
    SELECT Product, ROUND(AVG(`Discount(%)`), 2) AS avg_discount, SUM(Final_Amount) AS total_sales FROM walmart_data GROUP BY Product) AS discount_performance WERE avg_discount > 10.2 AND total_sales < 50000 ORDER BY avg_discount DESC;

-- 19)Most Popular Product for Each Hour of the Day
SELECT *FROM (
	SELECT HOUR(Time) AS hour_of_day, Product, SUM(Final_Amount) AS total_sales, RANK() OVER (PARTITION BY HOUR(Time) ORDER BY SUM(Final_Amount) DESC) AS rn FROM walmart_data  GROUP BY HOUR(Time), Product) AS ranked_hourly_products WHERE rn = 1 ORDER BY hour_of_day;





