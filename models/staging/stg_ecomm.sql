select
    order_id,
    customer_id,
    product_name,
    category,
    quantity as quantity_sold,
    cast(unit_price as numeric) as unit_price,
    order_date,
    'online_001' as store_id,
    'Online' as store_location,
    country,
    'Unknown' as supplier_id,
    age_group,
    gender as customer_gender,
    payment_method,
    order_status
from {{ source('raw_ecomm', 'raw_ecomm') }}