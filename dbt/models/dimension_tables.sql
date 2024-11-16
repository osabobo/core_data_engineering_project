-- models/dimension_tables.sql
-- Currency Dimension Table
WITH currency_data AS (
    SELECT 
        DISTINCT currency_code,
        currency_name,
        currency_symbol
    FROM {{ ref('processed_countries_data') }}
)

SELECT 
    currency_code,
    currency_name,
    currency_symbol
FROM currency_data;

-- Language Dimension Table
WITH language_data AS (
    SELECT 
        country_name,
        UNNEST(STRING_TO_ARRAY(languages, ', ')) AS language
    FROM {{ ref('processed_countries_data') }}
)

SELECT 
    country_name,
    language
FROM language_data;
