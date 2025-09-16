{{ config(materialized='table') }}

select distinct
    customer_id,
    customer_country,
        case
        when (select count(distinct customer_gender) from {{ ref('int_unioned_orders') }} ) = 1 then age_group
        else 'Unknown'
    end as age_group,
    case
        when (select count(distinct customer_gender) from {{ ref('int_unioned_orders') }} ) = 1 then customer_gender
        else 'Unknown'
    end as customer_gender
from {{ ref('int_unioned_orders') }}
