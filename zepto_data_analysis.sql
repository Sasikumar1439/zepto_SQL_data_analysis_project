create database zepto_SQL_project;
use zepto_SQL_project;
select * from zepto;
ALTER TABLE zepto
ADD COLUMN sku_id INT AUTO_INCREMENT PRIMARY KEY FIRST;
-- data exploration

-- count of rows
select count(*) from zepto;

-- sample data
SELECT * FROM zepto
LIMIT 10;

-- null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

-- different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id) as stock
FROM zepto
GROUP BY outOfStock;

-- product names present multiple times
SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

-- products with price = 0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

-- convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;

-- data analysis
select * from zepto;
-- Q1. Find the top 10 best-value products based on the discount percentage.
select name, mrp, discountPercent
from zepto
order by discountPercent desc
limit 10;

-- Q2.What are the Products with High MRP but Out of Stock
select distinct name, mrp from zepto 
where outOfStock='true'  and mrp>300
order by mrp desc
;
-- Q3.Calculate Estimated Revenue for each category
 select category, sum(availableQuantity*discountedSellingPrice) as estimated_revenue 
 from zepto
 group by category 
 order by estimated_revenue ;

-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
select name, mrp, discountPercent from zepto 
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
select category, Round(avg(discountPercent),2) as avg_discount_Percent
from zepto 
group by category
order by avg_discount_Percent desc
limit 5;

-- Q6. Find the price per gram for products above 100g and sort by best value.
select distinct name, weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto 
where weightInGms >= 100
order by price_per_gram;

-- Q7.Group the products into categories like Low, Medium, Bulk.
select distinct name,
case
    when weightInGms < 1000 then "LOW"
    when weightInGms < 5000 then "MEDIUM"
    else "BULK"
    end as weight_category
from zepto;    

-- Q8.What is the Total Inventory Weight Per Category
select category,  sum(weightInGms*availableQuantity) as total_weight
from zepto
group by category
order by total_weight desc;



