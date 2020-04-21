with source as (
    
    select * from {{ source('ghcn_d', 'ghcnd_stations') }}
    
)

select * from source