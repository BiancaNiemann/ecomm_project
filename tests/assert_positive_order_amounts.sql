select order_id, total_price
from {{ ref('fact_orders') }}
where total_price < 0