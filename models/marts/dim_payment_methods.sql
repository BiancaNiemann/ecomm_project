{{ config(materialized='table') }}

select distinct
    payment_method_id,
    payment_method
from {{ ref('int_unioned_orders') }}