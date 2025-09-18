select 
    f.order_id
from {{ ref('fact_orders') }} f
left join {{ ref('dim_customers') }} c
    on f.customer_id = c.customer_id
where c.customer_id is null
