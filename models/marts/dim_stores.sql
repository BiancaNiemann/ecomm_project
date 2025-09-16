{{ config(materialized='table') }}

select distinct
    store_id,
    store_location
from {{ ref('int_unioned_orders') }}