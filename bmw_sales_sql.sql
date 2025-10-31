SELECT *
FROM bmw_s;

--What are the model, year, and price of all BMWs that use Electric fuel?
SELECT model, year, price_usd
FROM bmw_s
WHERE fuel_type = 'Electric';

--What is the average mileage and the maximum price for the X3 model?
SELECT AVG(mileage_km) AS Avg_Mil_X3, MAX(price_usd) AS Max_Price_X3
FROM bmw_s
WHERE model = 'X3';

--Which Top 5 BMW Models generated the highest total revenue over the entire period, and what was their total revenue and average selling price?
SELECT model, SUM(price_usd * sales_volume) AS Total_Revenue, AVG(price_usd)
FROM bmw_s
GROUP BY model
ORDER BY Total_Revenue DESC
LIMIT 5;

--What is the total sales volume broken down by vehicle age?
SELECT car_age, SUM(sales_volume) AS Total_Sales_Volume
FROM bmw_s
GROUP BY car_age
ORDER BY car_age ASC;

--Which Region has the highest total sales volume exclusively for Hybrid or Electric vehicles?
SELECT region, SUM(sales_volume) AS Total_Sales_Volume
FROM bmw_s
WHERE fuel_type IN ('Electric','Hybrid')
GROUP BY region
ORDER BY Total_Sales_Volume DESC
LIMIT 5;

--What is the average sales volume for cars based on two price tiers: 'Budget' (Price under $50,000) and 'Premium' (Price $50,000 and over)?
SELECT
    CASE
        WHEN price_usd < 50000 THEN 'Budget (<$50k)'
        ELSE 'Premium (>$50k)'
    END AS Price_Tier,
    AVG(sales_volume) AS Avg_Sales_Volume
FROM bmw_s
GROUP BY price_tier
ORDER BY avg_sales_volume DESC;