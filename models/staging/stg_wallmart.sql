select 
    transaction_id AS order_id,
    customer_id,
    product_id,
    product_name,
    md5(category) AS category_id,
    category,
    quantity_sold,
    unit_price,
    transaction_date AS order_date,
    store_id,
    store_location,
    'USA' AS country,
    supplier_id,
    CASE
        WHEN customer_age < 19 THEN 'Teenagers'
        WHEN customer_age BETWEEN 19 AND 59 THEN 'Adults'
        WHEN customer_age > 59 THEN 'Senior'
    END AS age_group,
    customer_gender,
    payment_method,
    weekday,
    'In_Shop' AS order_status
from {{ source('raw_wallmart', 'raw_wallmart')}}
