DROP VIEW IF EXISTS dm_v01_sales_monthly;
CREATE VIEW dm_v01_sales_monthly AS
SELECT purchase_month                                          AS month,
       purchase_year                                           AS year,
       region,
       customer_state                                          AS state,
       COUNT(DISTINCT order_id)                                AS orders,
       ROUND(SUM(order_value), 2)                              AS gmv,
       SUM(items_cnt)                                          AS items,
       COUNT(DISTINCT customer_unique_id)                      AS customers
FROM core_order
WHERE order_status = 'delivered'
  AND purchase_month BETWEEN '2017-01-01' AND '2018-08-01'
GROUP BY purchase_month, purchase_year, region, customer_state
ORDER BY purchase_month, customer_state;
