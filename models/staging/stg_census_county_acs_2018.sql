with source as (
    
    select * from {{ source('census_bureau_acs', 'county_2018_1yr') }}
    
)

select * from source