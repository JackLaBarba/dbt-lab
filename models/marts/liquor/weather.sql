with ghcnd_iowa_geo_averages as (

    select * from {{ ref('ghcnd_iowa_geo_averages') }}

),


final as (

    select
        date,
        avg_prcp as mm_precipitation,
        avg_tmax / 10 as tmax_celcius,
        avg_tmin / 10 as tmin_celcius,
        avg_tavg / 10 as tavg_celcius

    from ghcnd_iowa_geo_averages

)

select * from final