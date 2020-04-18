{{ config(materialized='table') }}
{% set day = '_4_17_20' %}

with confirmed_cases as (

    select *
    from {{ ref('stg_confirmed_cases') }}

),

census_acs as (

    select * from {{ ref('stg_census_county_acs_2018') }}
),

final as (

    select
        census_acs.geo_id,
        confirmed_cases.county_name,
        confirmed_cases.state,
        confirmed_cases.{{ day }} as current_confirmed_cases,
        census_acs.total_pop,
        census_acs.pop_in_labor_force,

        confirmed_cases.{{ day }} * 10000 
        / census_acs.total_pop as confirmed_cases_per_ten_thousand

    from confirmed_cases
    inner join census_acs
        on census_acs.geo_id = confirmed_cases.county_fips_code

)

select * from final