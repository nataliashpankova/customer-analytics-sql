# 📊 Customer Segmentation Analysis using SQL

## 📌 Objective

The goal of this project is to analyze customer behavior and segment users based on their purchasing patterns and engagement metrics.
The analysis focuses on identifying high-value customers, understanding behavioral trends, and providing actionable business insights.

---

## 📊 Dataset

Customer analytics dataset including demographic, behavioral, and transactional features such as:

* Age, income, and activity duration
* Monthly spending and purchase frequency
* Return rates and support interactions
* Payment methods and geographic regions

---

## 🔧 Tools & Technologies

* SQL (MySQL)
* DBeaver
* Data cleaning & transformation
* Analytical SQL (CTE, CASE, Window Functions)

---

## 🧹 Data Cleaning

The dataset was cleaned and prepared before analysis:

* Removed or handled missing values
* Ensured correct data types (DECIMAL for financial metrics)
* Validated consistency between CSV and SQL schema

---

## 🔍 Analysis Performed

### 1. Customer Segmentation

Customers were segmented based on spending and behavior:

* VIP (high spend + high frequency)
* High Value
* Medium Value
* Low Value

### 2. Behavioral Analysis

* Purchase frequency vs spending
* Customer engagement patterns
* Support interactions and return behavior

### 3. Customer Scoring

A custom score was created using:

* Spending
* Purchase frequency
* Return rate

### 4. Risk Analysis

Customers were classified based on:

* High return rates
* High support interactions

### 5. Revenue Estimation

Estimated annual customer value based on monthly spending.

---

## 📈 Key Insights

* VIP customers represent the highest revenue potential
* Purchase frequency strongly impacts customer value
* A segment of customers shows high risk due to returns and support usage
* Medium-value customers present strong growth opportunities

---

## 💡 Business Recommendations

* Develop loyalty programs for high-value and VIP customers
* Reduce return rates through better targeting and product recommendations
* Focus marketing efforts on medium-value customers to increase revenue
* Monitor high-risk customers to prevent churn

---

## 🧠 Skills Demonstrated

* SQL querying (JOIN, GROUP BY, CASE, CTE)
* Window functions (RANK)
* Data cleaning and preprocessing
* Business analysis and insight generation
* Customer segmentation logic

---

## 📂 Project Structure

* `data/` → dataset
* `sql/analysis.sql` → SQL queries
* `insights.md` → key findings
* `README.md` → project documentation

---

## 🚀 Conclusion

This project demonstrates how SQL can be used not only for data extraction but also for advanced analytics and business decision-making support.

---
