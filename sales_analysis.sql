CREATE DATABASE sales_analysis;
USE sales_analysis;

CREATE TABLE online_sales (
    order_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    product_id INT
);

INSERT INTO online_sales 
(order_id, order_date, amount, product_id)
VALUES
(1, '2025-01-05', 500, 101),
(2, '2025-01-10', 750, 102),
(3, '2025-01-15', 1200, 103),
(4, '2025-02-03', 900, 101),
(5, '2025-02-12', 650, 104),
(6, '2025-02-20', 1100, 102),
(7, '2025-03-01', 1500, 105),
(8, '2025-03-15', 800, 101),
(9, '2025-03-25', 950, 103),
(10, '2025-04-05', 1300, 104),
(11, '2025-04-18', 700, 102),
(12, '2025-05-02', 2000, 105);

SELECT * FROM online_sales;

-- Main Sales Trend Analysis
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;

-- Top 3 Months by Sales
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY monthly_revenue DESC
LIMIT 3;

-- Sales for a Specific Time Period
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2025-01-01' AND '2025-03-31'
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;