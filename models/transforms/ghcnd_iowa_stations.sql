with ghcnd_stations as (

    select *
    from {{ ref('stg_ghcnd_stations') }}

),

final as (

    select
        *

    from ghcnd_stations

    where ghcnd_stations.state = "IA"

)

select * from final