select
    -- ids
    id as product_id,
    cost,
    retail_price,
    department

from {{source('thelook_ecommerce','products')}}