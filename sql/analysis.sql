-- =========================================
-- CUSTOMER SEGMENTATION ANALYSIS (SQL)
-- =========================================

-- =========================================
-- 1. DATA OVERVIEW
-- =========================================

-- Total number of customers
SELECT COUNT(*) AS total_customers
FROM ecommerce;

-- Average income and spending
SELECT
    AVG(annual_income)      AS avg_income,
    AVG(avg_monthly_spend)  AS avg_spending
FROM ecommerce;

-- =========================================
-- 2. BASIC CUSTOMER ANALYSIS
-- =========================================

-- Identify high-value customers
SELECT
    customer_id,
    annual_income,
    avg_monthly_spend
FROM ecommerce
WHERE avg_monthly_spend > 500
ORDER BY avg_monthly_spend DESC;

-- =========================================
-- 3. CUSTOMER SEGMENTATION
-- =========================================

-- Segment customers based on behavior
SELECT
    customer_id,
    avg_monthly_spend,
    purchase_frequency,
    CASE
        WHEN avg_monthly_spend > 500 AND purchase_frequency > 10 THEN 'VIP'
        WHEN avg_monthly_spend > 300 THEN 'High Value'
        WHEN avg_monthly_spend BETWEEN 150 AND 300 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM ecommerce;

-- Count customers per segment
SELECT
    CASE
        WHEN avg_monthly_spend > 500 AND purchase_frequency > 10 THEN 'VIP'
        WHEN avg_monthly_spend > 300 THEN 'High Value'
        WHEN avg_monthly_spend BETWEEN 150 AND 300 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS segment,
    COUNT(*) AS total_customers
FROM ecommerce
GROUP BY segment
ORDER BY total_customers DESC;

-- =========================================
-- 4. ADVANCED ANALYSIS (CTE)
-- =========================================

WITH customer_segments AS (
    SELECT
        customer_id,
        avg_monthly_spend,
        annual_income,
        CASE
            WHEN avg_monthly_spend > 500 AND purchase_frequency > 10 THEN 'VIP'
            WHEN avg_monthly_spend > 300 THEN 'High Value'
            WHEN avg_monthly_spend BETWEEN 150 AND 300 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS segment
    FROM ecommerce
)

SELECT
    segment,
    COUNT(*)               AS customers,
    AVG(avg_monthly_spend) AS avg_spend,
    AVG(annual_income)     AS avg_income
FROM customer_segments
GROUP BY segment
ORDER BY avg_spend DESC;

-- =========================================
-- 5. CUSTOMER BEHAVIOR ANALYSIS
-- =========================================

SELECT
    purchase_frequency,
    AVG(avg_monthly_spend) AS avg_spend
FROM ecommerce
GROUP BY purchase_frequency
ORDER BY purchase_frequency;

-- =========================================
-- 6. CUSTOMER SCORING
-- =========================================

SELECT
    customer_id,
    avg_monthly_spend,
    purchase_frequency,
    return_rate,
    (
        avg_monthly_spend * 0.5 +
        purchase_frequency * 10 -
        return_rate * 100
    ) AS customer_score
FROM ecommerce
ORDER BY customer_score DESC;

-- =========================================
-- 7. WINDOW FUNCTION (RANKING)
-- =========================================

SELECT
    customer_id,
    avg_monthly_spend,
    RANK() OVER (ORDER BY avg_monthly_spend DESC) AS spending_rank
FROM ecommerce;

-- =========================================
-- 8. RISK ANALYSIS
-- =========================================

SELECT
    customer_id,
    return_rate,
    support_interactions,
    CASE
        WHEN return_rate > 0.5 OR support_interactions > 5 THEN 'High Risk'
        ELSE 'Low Risk'
    END AS risk_level
FROM ecommerce;

-- =========================================
-- 9. REVENUE ESTIMATION
-- =========================================

SELECT
    customer_id,
    avg_monthly_spend * 12 AS estimated_annual_value
FROM ecommerce
ORDER BY estimated_annual_value DESC;

-- =========================================
-- END OF ANALYSIS
