with source as (
    
    select * from {{ source('covid19_usafacts', 'confirmed_cases') }}
    
)

select * from source