# Blinkit-Data-Analysis
End-to-end SQL data analysis on Blinkit e-commerce dat
## Overview
This project presents an end-to-end data analysis of Blinkit-style e-commerce data using SQL.
The goal of the analysis is to understand business performance, customer behavior, and delivery efficiency,
and to provide clear recommendations for business improvement.

## Dataset Description
The analysis is based on four datasets:

- **customer** – customer details and city information
- **orders** – order details, delivery time, and payment mode
- **order_items** – products and quantities per order
- **products** – product category and pricing information

All orders in the dataset are completed (delivered).

## Project Workflow

### 1. Data Quality Checks
- Verified uniqueness of primary keys
- Checked for missing or invalid values
- Validated relationships between tables
 
### 2. Exploratory Data Analysis (EDA)
- Analyzed dataset size and coverage
- Studied customer distribution by city
- Examined order trends over time
- Analyzed delivery time distribution

### 3. Key Performance Indicators (KPIs)
- Total Revenue (GMV)
- Average Order Value (AOV)
- Delivery Delay Percentage (On-time threshold: 20 minutes)
- Repeat Customer Rate

### 4. Customer Analysis
- Identified high-value customers
- Analyzed repeat customer behavior
- Evaluated customer contribution to revenue

### 5. Product & Category Analysis
- Identified top-performing categories
- Analyzed product contribution to total revenue
- Assessed business dependency on key categories

### 6. Delivery Performance Analysis
- Classified orders as on-time or delayed
- Identified delivery efficiency risks
- Evaluated impact on customer experience

---

## Key Insights
- Most of our revenue comes from small number of product categories
- Repeat customers contribute significantly higher revenue
- Delivery delays exist, especially in high-demand areas
- Increasing order value can meaningfully improve overall revenue
- 
## Recommendations
- Improve delivery capacity in cities with higher delays
- Focus on retaining repeat customers through loyalty programs
- Ensure consistent availability of high-performing product categories(must not go out of stock)
- Encourage higher cart value through bundles and promotions
- 
## Conclusion
The analysis shows that Blinkit’s growth is driven by repeat customers and a few high-performing categories.
Improving delivery time and customer retention can undoubtedly enhance revenue and customer satisfaction.

## Tools Used
- PostgreSQL
- pgAdmin
- SQL

