{{config(materialized='incremental',unique_key='trip_id')}}

{% set cols=['customer_id','trip_id','vehicle_id','driver_id','trip_start_time','trip_end_time','last_updated_timestamp','distance_km','fare_amount']%}

SELECT
    {%for col in cols%}
        {{col}}
        {%if not loop.last%}
            ,
        {%endif%}
    {% endfor %}
from {{source('source_bronze','trips')}}

{% if is_incremental() %}
WHERE
    last_updated_timestamp> (SELECT coalesce(max(last_updated_timestamp),'1900-01-01') FROM {{this}})
{% endif %}