-- SELECT * FROM uber_cata.bronze.trips (Querying data from databricks)

-- SELECT * FROM {{ source("source_bronze",'trips')}} querying data from internal object,
--  the source we created in source.yml