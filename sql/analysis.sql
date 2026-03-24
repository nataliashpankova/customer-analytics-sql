-- =========================================
-- CUSTOMER SEGMENTATION ANALYSIS
-- =========================================

-- 1️ Overview dataset
-- Totale clienti
SELECT COUNT(*) AS total_customers
FROM ecommerce;

-- Età media e reddito medio
SELECT 
    AVG(age) AS avg_age,
    AVG(annual_income) AS avg_income,
    AVG(avg_monthly_spend) AS avg_spending
FROM ecommerce;

-- 2️ High Value Customers
-- Identifica clienti con spesa mensile > 500
SELECT 
    customer_id,
    annual_income,
    avg_monthly_spend
FROM ecommerce
WHERE avg_monthly_spend > 500
ORDER BY avg_monthly_spend DESC;

-- 3️ Customer Segmentation
-- Segmentazione clienti
SELECT 
    customer_id,
    avg_monthly_spend,
    CASE 
        WHEN avg_monthly_spend > 500 THEN 'High Value'
        WHEN avg_monthly_spend BETWEEN 200 AND 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM ecommerce;

-- 4️ Segment distribution
-- Quanti clienti per segmento
SELECT 
    CASE 
        WHEN avg_monthly_spend > 500 THEN 'High Value'
        WHEN avg_monthly_spend BETWEEN 200 AND 500 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(avg_monthly_spend),2) AS avg_spend
FROM ecommerce
GROUP BY segment;

-- 5️ Behavioral analysis
-- Analisi frequenza acquisti vs spesa
SELECT 
    purchase_frequency,
    ROUND(AVG(avg_monthly_spend),2) AS avg_spend
FROM ecommerce
GROUP BY purchase_frequency
ORDER BY purchase_frequency;

-- 6️ Advanced CTE for segmentation
WITH customer_segments AS (
    SELECT 
        customer_id,
        avg_monthly_spend,
        CASE 
            WHEN avg_monthly_spend > 500 THEN 'High Value'
            WHEN avg_monthly_spend BETWEEN 200 AND 500 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS segment
    FROM ecommerce
)
SELECT 
    segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(avg_monthly_spend),2) AS avg_spend
FROM customer_segments
GROUP BY segment;

-- 7️ Window Function: Rank clienti per spesa mensile
SELECT 
    customer_id,
    avg_monthly_spend,
    RANK() OVER (ORDER BY avg_monthly_spend DESC) AS spending_rank
FROM ecommerce;

-- 8️ Top 10 clienti per valore assoluto
SELECT 
    customer_id,
    avg_monthly_spend,
    annual_income
FROM ecommerce
ORDER BY avg_monthly_spend DESC
LIMIT 10;

-- 9️ Analisi ritorno sconti / interazioni supporto
SELECT 
    discount_usage_rate,
    return_rate,
    AVG(avg_monthly_spend) AS avg_spend,
    AVG(support_interactions) AS avg_support
FROM ecommerce
GROUP BY discount_usage_rate, return_rate
ORDER BY avg_spend DESC;
