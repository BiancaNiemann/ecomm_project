{{ config(materialized='table') }}

select distinct
    order_status_id,
    order_status
from {{ ref('int_unioned_orders') }}