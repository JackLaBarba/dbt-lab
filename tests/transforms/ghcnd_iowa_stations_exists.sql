with cardinality as (
  
    select 
        count(*) as n 
    
    from {{ ref('ghcnd_iowa_stations') }}
  
),

validation as (

    select *
    from cardinality
    where cardinality.n = 0

)

select * from validation