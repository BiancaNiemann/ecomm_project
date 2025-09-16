{{ config(materialized='table') }}

select DISTINCT
    product_id,
    product_name,
    md5(category) AS category_id,
    category
from {{ ref('int_unioned_orders') }}