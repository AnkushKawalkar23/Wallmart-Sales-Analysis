# 🛒 Walmart Retail Sales SQL Project
Comprehensive Exploratory Data Analysis Using SQL
## 📌 Project Overview

This project is designed to demonstrate end-to-end SQL-based data analysis through an in-depth exploration of Walmart retail sales data. The analysis focuses on understanding sales performance, customer behavior, product trends, branch efficiency, revenue distribution, and customer satisfaction across multiple locations.

Using structured and optimized SQL queries, this project answers a wide range of real-world business questions, moving from basic descriptive analysis to more advanced logic involving subqueries, conditional statements, and time-based analysis.

## 🎯 Project Objectives

The key objectives of this project are to:

- Perform Exploratory Data Analysis (EDA) using SQL

- Analyze sales volume, revenue, VAT, and COGS

- Understand customer demographics and buying behavior

- Identify top-performing product lines, cities, and branches

- Study time-based trends in sales and customer ratings

- Apply business logic to classify and evaluate performance

- Showcase advanced SQL querying skills

## 🗂️ Dataset Overview

The dataset consists of Walmart sales transactions collected from multiple branches operating in different cities. Each row represents a single transaction and contains both sales data and customer metadata.

## 📄 Dataset Characteristics

Type: Transactional retail sales data

Granularity: One row per sale

Coverage: Multiple cities and branches

Use Case: Sales analysis, customer analysis, and operational insights

## 🛠️ Tools & Technologies Used

- Database: MySQL

- Query Language: SQL

- SQL Concepts Demonstrated

- Aggregate functions (SUM, AVG, COUNT, MAX)

- GROUP BY and HAVING

- Subqueries and nested queries

- CASE statements for business logic

- Date and time functions

- Sorting and filtering

- Analytical problem solving

## 🏗️ Database Setup
CREATE DATABASE walmart;
USE walmart;

DROP TABLE tbl_walmart_sales;

## 🔍 Exploratory Data Analysis (EDA)

The analysis is divided into four structured sections, progressing from high-level understanding to deeper analytical insights.

## 1️⃣ Generic Analysis

This section focuses on understanding the basic structure and coverage of the dataset.

- Business Questions Answered

- How many total records are present?

- How many distinct cities are represented?

- Which branch operates in which city?

Purpose

- Validate data completeness

- Understand geographical distribution

- Identify branch-to-city relationships

## 2️⃣ Product Analysis

This section evaluates product performance and contribution to overall sales.

- Business Questions Answered

- How many distinct product lines exist?

- Which product line sells the highest quantity?

- Which product line generates the highest revenue?

- Which product line contributes the highest VAT?

- How do product lines perform relative to each other?

Advanced Logic

- Each product line is classified into:

- Good: Sales above average product-line sales

- Bad: Sales below average

This classification is implemented using nested subqueries and aggregate functions.

- Business Value

- Helps identify top and underperforming product categories

- Supports inventory planning and promotional strategies

## 3️⃣ Sales Analysis

This section focuses on revenue trends, operational efficiency, and time-based insights.

- Business Questions Answered

- What is the total revenue generated each month?

- Which month recorded the highest COGS?

- Which city generates the highest revenue?

- How are sales distributed across weekdays?

- How do sales vary by time of day?

- Which customer type generates the most revenue?

- Which city and customer type contribute the most VAT?

- Business Value

- Identifies peak sales periods

- Supports staffing and operational planning

- Highlights high-revenue customer segments

## 4️⃣ Customer Analysis

This section analyzes customer demographics, purchasing behavior, and satisfaction.

- Business Questions Answered

- How many unique customer types exist?

- How many payment methods are used?

- Which customer type is most common?

- Which customer type buys the most products?

- What is the overall gender distribution?

- How does gender distribution vary by branch?

- At which time of day do customers give the most ratings?

- Which day of the week has the highest average rating?

- Which day has the best ratings per branch?

- Business Value

- Improves understanding of customer preferences

- Helps optimize customer experience

- Reveals satisfaction trends across time and location

## 📊 Key Insights & Findings

- A small number of product lines drive a large portion of revenue

- Evening hours receive the highest customer engagement and ratings

- Member customers contribute more revenue and quantity sold

- Sales performance varies significantly by branch and city

- Customer satisfaction fluctuates by weekday and time of day

## 📁 Project Structure
📦 Walmart-Retail-Sales-SQL
 ┣ 📜 walmart_sales.sql
 ┣ 📜 README.md

## 🚀 How to Run the Project

- Clone the repository

- Import the dataset into MySQL

- Create the database and table

- Execute the SQL queries in sequence

- Review results and interpret insights

## 🧠 Skills Demonstrated

- SQL-based Exploratory Data Analysis

- Business-driven analytical thinking

- Writing complex and optimized queries

- Subqueries and conditional logic

- Time-series and categorical analysis

- Translating raw data into actionable insights

## 🔮 Future Enhancements

- Data visualization using Power BI / Tableau

- Query optimization using indexing

- Creation of views and stored procedures

- Integration with Python for advanced analytics

- Interactive dashboards for stakeholders

## 📌 Conclusion

This project demonstrates how SQL can be effectively used to analyze retail sales data at scale, uncover meaningful patterns, and support business decision-making.
It serves as a portfolio-ready SQL project that highlights both technical proficiency and analytical reasoning.
