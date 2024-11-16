-- models/fact_tables.sql
WITH processed_data AS (
    SELECT 
        country_name,
        official_name,
        currency_code,
        population,
        area,
        region,
        sub_region,
        continents,
        EXTRACT(YEAR FROM NOW()) - independence_year AS years_independent
    FROM {{ ref('processed_countries_data') }}
)

SELECT
    country_name,
    official_name,
    currency_code,
    population,
    area,
    region,
    sub_region,
    continents,
    years_independent,
    population / NULLIF(area, 0) AS population_density
FROM processed_data;
