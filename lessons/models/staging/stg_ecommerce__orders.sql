--alternative to using config to materialize
{{
    config(
        materialized = 'table'
    )
}}

with source as (

    select * from {{ source('thelook_ecommerce', 'orders') }}

),

renamed as (

    select
        order_id,
        user_id,
        status,
        gender,
        created_at,
        returned_at,
        shipped_at,
        delivered_at,
        num_of_item as num_items_ordered

    from source

)

select * from renamed