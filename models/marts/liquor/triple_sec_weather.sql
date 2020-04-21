with sales as (

    select * from {{ ref('stg_iowa_liquor_retail_sales') }}

),

ghcnd_iowa_geo_averages as (

    select * from {{ ref('ghcnd_iowa_geo_averages') }}

),

weather as (

    select
        date,
        avg_prcp as mm_precipitation,
        avg_tmax / 10 as tmax_celcius,
        avg_tmin / 10 as tmin_celcius,
        avg_tavg / 10 as tavg_celcius

    from ghcnd_iowa_geo_averages

),

ts_volume as (

    select
        date,
        ROUND(SUM(volume_sold_gallons),2) AS gallons_sold

    from sales

    where category_name = "Triple Sec"

    group by date

),

joined as (

    select
        *
    from ts_volume
    inner join weather using(date)
    order by date

)


select * from joined