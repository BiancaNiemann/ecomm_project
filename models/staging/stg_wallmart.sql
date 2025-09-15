select 
    CONCAT('ORDW',transaction_id) AS order_id,
    CONCAT('CUSTW',customer_id) AS customer_id,
    CONCAT('PRODW',product_id) AS product_id,
    product_name,
    category,
    quantity_sold,
    CAST(unit_price as numeric) AS unit_price,
    DATE(transaction_date) AS order_date,
    CONCAT('STORW',store_id) AS store_id,
    store_location,
    'USA' AS country,
    CONCAT('SUPPW',supplier_id) AS supplier_id,
    CASE
        WHEN customer_age < 19 THEN 'Teenagers'
        WHEN customer_age BETWEEN 19 AND 59 THEN 'Adults'
        WHEN customer_age > 59 THEN 'Senior'
    END AS age_group,
    customer_gender,
    payment_method,
    'In_Shop' AS order_status
from {{ source('raw_wallmart', 'raw_wallmart')}}
