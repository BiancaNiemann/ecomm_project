select
    order_id,
    customer_id,
    product_id,
    product_name,
    category,
    quantity AS quantity_sold,
    CAST(unit_price AS numeric) AS unit_price,
    order_date,
    'online_001' AS store_id,
    'Online' AS store_location,
    country,
    'Unknown' AS supplier_id,
    age_group,
    gender AS customer_gender,
    payment_method,
    order_status
from {{ source('raw_ecomm', 'raw_ecomm') }}