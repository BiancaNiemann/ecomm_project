select 
    'ORDW' || transaction_id as order_id,
    'CUSTW' || customer_id as customer_id,
    product_name,
    CASE 
        WHEN product_name = 'Fridge' THEN 'Appliances'
        WHEN product_name = 'Headphones' THEN 'Electronics'
        WHEN product_name = 'Camera' THEN 'Electronics'
        WHEN product_name = 'Smartphone' THEN 'Electronics'
        WHEN product_name = 'TV' THEN 'Electronics'
        WHEN product_name = 'Tablet' THEN 'Computers'       
        WHEN product_name = 'Laptop' THEN 'Computers'
        WHEN product_name = 'Washing Machine' THEN 'Appliances'
    END AS category,
    quantity_sold,
    cast(unit_price as numeric) as unit_price,
    date(transaction_date) as order_date,
    'STORW' || store_id as store_id,
    store_location,
    'USA' as country,
    'SUPPW' || supplier_id as supplier_id,
    case
        when customer_age < 19 then 'Teenagers'
        when customer_age between 19 and 59 then 'Adults'
        when customer_age > 59 then 'Senior'
    end as age_group,
    customer_gender,
    payment_method,
    'In_Shop' as order_status
from {{ source('raw_wallmart', 'raw_wallmart')}}
