# E-commerce_Sales_and_Customer_Insights_Dashboard
SQL-based project analyzing e-commerce sales and customer data to uncover actionable insights. The analysis identifies top-selling product categories, high-spending customers and regions, and segments customers by purchasing power (High, Medium, and Low Value).

## What was the Scenario of the project?
I have been hired as a Data Analyst for MegaMart Online, a global e-commerce platform. My task was to analyze customer behavior, sales trends, and product performance to provide actionable insights for the marketing and operations teams. 

## About the  dataset:
* customers — Information about registered customers. 
* orders — Records of orders placed. 
* products — Information about the items sold. 
* sales_reps — List of sales representatives managing certain customers

## Project Questions:
* Which product categories generate the most revenue?
* Who are the highest-spending customers and which regions manage them?
* How can customers be segmented based on purchasing power?

## Project Questions and Insights

### 1. Top-Selling Categories

Analysis shows that Accessories and Clothing stand out as the key categories due to the large amount of revenue generated.
* Accessories dominate in terms of sales volume, making them the strongest revenue driver.
* Clothing and Sports products also contributed significantly, reinforcing their importance in overall sales performance.
  
### 2. Using INNER JOIN to Find Top-Grossing Products

I applied an INNER JOIN to connect the products table with orders, customers, and sales_reps. 
* This allowed me to not only identify the highest-grossing products but also see which customers purchased them and which sales reps managed those customers, giving a complete view of product performance and customer reach.
  
### 3. High-Spending Customers & Regions

Using the CASE STATEMENT, I was able to identify the top-spending customers and the regions that manage them.
* Insight: The East Region consistently handles higher-value customers according to the top 5 high value customers in our company, suggesting either stronger customer relationships or greater purchasing power in that region.

### Customer Segmentation (Based on Purchasing Power)
  
I categorized customers into three groups, which are the High Value, Medium Value, and Low Value,  based on their total spending.
* This segmentation allows the company to design targeted strategies such as discounts, loyalty rewards, or subscription plans for different customer groups.
* Notably, the analysis revealed that the company has a relatively large proportion of high-value customers, which is a strong indicator of customer loyalty and spending potential.


 
* I grouped customers into different categories to differentiate
