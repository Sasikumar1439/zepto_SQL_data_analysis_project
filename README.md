# zepto_SQL_data_analysis_project
SQL-based data analysis project on Zepto grocery dataset using MySQL. Includes data cleaning, EDA, inventory analysis, revenue insights, discount analysis, and business-focused SQL queries.
# Zepto SQL Data Analysis Project

## Overview

This project focuses on analyzing Zepto grocery product data using MySQL.
The goal of this project is to perform data cleaning, exploration, and business analysis using SQL queries to generate meaningful retail insights.

The project demonstrates practical SQL skills used in real-world data analytics workflows, including:

* Data cleaning
* Exploratory Data Analysis (EDA)
* Revenue analysis
* Inventory analysis
* Discount analysis
* Product categorization

---

# Dataset Information

The dataset contains grocery product information such as:

* Product Name
* Category
* MRP
* Discount Percentage
* Discounted Selling Price
* Product Weight
* Available Quantity
* Stock Availability

Dataset used:

* `"C:\Users\Vinay\Downloads\archive (2)\zepto_v2.csv"`

---

# Tools & Technologies Used

* MySQL
* MySQL Workbench


---

# Project Workflow

## 1. Database Creation

Created a dedicated SQL database for the project.

```sql
CREATE DATABASE zepto_SQL_project;
USE zepto_SQL_project;
```

---

## 2. Data Import

Imported CSV dataset into MySQL table using MySQL Workbench Import Wizard.

---

## 3. Data Cleaning

Performed multiple cleaning operations such as:

* Adding `sku_id` primary key
* Checking NULL values
* Removing invalid price records
* Converting paise values into rupees

Example:

```sql
ALTER TABLE zepto
ADD COLUMN sku_id INT AUTO_INCREMENT PRIMARY KEY FIRST;
```

---

## 4. Exploratory Data Analysis (EDA)

Performed:

* Row count analysis
* Duplicate product checks
* Product category exploration
* Stock availability analysis

Example:

```sql
SELECT DISTINCT category
FROM zepto
ORDER BY category;
```

---

# Business Problems Solved

## 1. Top Discounted Products

Identified products with the highest discount percentages.

## 2. High MRP Out-of-Stock Products

Analyzed premium products currently unavailable.

## 3. Estimated Revenue by Category

Calculated category-wise revenue potential.

## 4. Premium Products with Low Discounts

Found expensive products receiving minimal discounts.

## 5. Categories with Highest Average Discounts

Compared discount trends across categories.

## 6. Price Per Gram Analysis

Evaluated best-value products based on product weight.

## 7. Product Weight Categorization

Grouped products into:

* Low
* Medium
* Bulk

## 8. Inventory Weight Analysis

Calculated total inventory weight per category.

---

# Sample SQL Query

```sql
SELECT category,
ROUND(SUM(availableQuantity * discountedSellingPrice),2) AS estimated_revenue
FROM zepto
GROUP BY category
ORDER BY estimated_revenue DESC;
```

---

# Key SQL Concepts Used

* SELECT Statements
* WHERE Clause
* GROUP BY
* ORDER BY
* Aggregate Functions
* CASE Statements
* DISTINCT
* AUTO_INCREMENT
* Data Cleaning Queries
* NULL Handling

---

# Project Outcomes

This project helped in understanding:

* Real-world retail data analysis
* SQL-based business problem solving
* Inventory and pricing analytics
* Data cleaning workflows
* Database management concepts

---

# Future Improvements

Possible future enhancements:

* Build interactive dashboard using Microsoft Power BI
* Perform advanced sales forecasting
* Add customer segmentation analysis
* Create stored procedures and views

---

# Author

K sasi Kumar

Aspiring Data Analyst passionate about SQL, Data Analytics, and Business Intelligence.
