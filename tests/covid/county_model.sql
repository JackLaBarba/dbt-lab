with data as (
  
    select * from {{ ref('county_model') }}
  
),

validation as (

    select *
    from data
    where confirmed_cases_per_ten_thousand < 0 
        or confirmed_cases_per_ten_thousand > 10000

)

select * from validation