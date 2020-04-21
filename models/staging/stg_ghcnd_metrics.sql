{%- set years = range(2012, 2021) -%}

with source as (
    
    {%- for year in years %}

    select * from 
    `bigquery-public-data`.ghcn_d.ghcnd_{{ year }}
    {%- if not loop.last %}
    
    union all
    
    {%- endif %} 
    
    {%- endfor %}
)

select * from source