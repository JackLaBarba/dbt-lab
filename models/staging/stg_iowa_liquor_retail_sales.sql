with source as (
    
    select * from {{ source('iowa_liquor_sales', 'sales') }}
    
)

select * from source