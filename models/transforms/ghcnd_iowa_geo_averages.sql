with ghcnd_iowa_stations as (

    select * from {{ ref('ghcnd_iowa_stations') }}

),

ghcnd_metrics as (

    select * from {{ ref('stg_ghcnd_metrics') }}

),

joined as (
    select *
    from ghcnd_metrics
    inner join ghcnd_iowa_stations using(id)
    where qflag IS NULL
),

{%- set element_list = ["TMIN", "TAVG","WDF2", "SNOW", "WDF5", "WT08", "SNWD"
    , "WSF2", "WSFG", "TOBS", "WESD","MDPR", "DAPR", "AWND", "WT01", "WESF"
    , "TMAX", "PGTM", "PRCP", "WSF5"] %}

agged as (

    select
       joined.date
        {%- for element in element_list %}
        , avg(
            if(
                joined.element = '{{ element }}'
                , joined.value
                , null
            )
        ) as avg_{{ element }}
        {%- endfor %}

    from joined
    group by date

)

select * from agged