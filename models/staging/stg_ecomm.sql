select
    order_id,
    customer_id,
    product_id,
    product_name,
    md5(category) AS category_id,
    category,
    quantity AS quantity_sold,
    unit_price,
    order_date,
    'online_001' AS store_id,
    'Online' AS store_location,
    country,
    'Unknown' AS supplier_id,
    age_group,
    gender AS customer_gender,
    payment_method,
    CASE extract(dayofweek from order_date)
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
        WHEN 7 THEN 'Sunday'
    END AS weekday,
    order_status
from {{ source('raw_ecomm', 'raw_ecomm') }}