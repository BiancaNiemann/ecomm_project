with base as (
    select * from {{ ref('stg_wallmart') }}
    union all
    select * from {{ ref('stg_ecomm') }}
)
select 
    order_id,
    customer_id,
    md5(product_name) AS product_id,
    product_name,
    category,
    quantity_sold,
    unit_price,
    cast(format_date('%Y%m%d', order_date) as int64) as order_date_id,
    order_date,
    md5(store_location) AS store_id,
    store_location,
    country AS customer_country,
    age_group,
    customer_gender,
    md5(payment_method) AS payment_method_id,
    payment_method,
    md5(order_status) AS order_status_id,
    order_status
from base