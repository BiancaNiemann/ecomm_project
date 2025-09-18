{{ config(materialized='table') }}

select
    order_id,
    customer_id,
    product_id,
    quantity_sold,
    unit_price,
    {{ calculate_revenue('unit_price', 'quantity_sold') }} AS total_price,
    order_date_id,
    store_id,
    order_status_id,
    payment_method_id
from {{ ref('int_unioned_orders') }}