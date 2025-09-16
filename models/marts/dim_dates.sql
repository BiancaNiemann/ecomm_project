{{ config(materialized='table') }}

select distinct
    order_date_id,
    date(order_date) as order_date,
    extract(day from order_date) as order_day,
    extract(week from order_date) as order_week,
    extract(month from order_date) as order_month,
    extract(quarter from order_date) as order_quarter,
    extract(year from order_date) as order_year,
    case
        when extract(month from order_date) in (12, 1, 2) then 'Winter'
        when extract(month from order_date) in (3, 4, 5) then 'Spring'
        when extract(month from order_date) in (6, 7, 8) then 'Summer'
        when extract(month from order_date) in (9, 10, 11) then 'Fall'
    end as order_season,
    case
        when extract(dayofweek from order_date) in (1, 5) then 'Weekend'
        else 'Weekday'
    end as order_day_type,
    case
        when extract(dayofweek from order_date) = 1 then 'Monday'
        when extract(dayofweek from order_date) = 2 then 'Tuesday'
        when extract(dayofweek from order_date) = 3 then 'Wednesday'
        when extract(dayofweek from order_date) = 4 then 'Thursday'
        when extract(dayofweek from order_date) = 5 then 'Friday'
        when extract(dayofweek from order_date) = 6 then 'Saturday'
        when extract(dayofweek from order_date) = 7 then 'Sunday'
    end as order_day_name
from {{ ref('int_unioned_orders') }}