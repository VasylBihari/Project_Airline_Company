-- Retrieves the first 10 records from the airline table to preview the dataset
SELECT * FROM airline LIMIT 10;

-- Counts the total number of records in the airline table to assess dataset size.
SELECT COUNT(*) AS total_records FROM airline;

-- Retrieves unique destination values to understand the range of flight destinations.
SELECT DISTINCT iata_code FROM airline;

-- Checks for duplicate IATA codes to ensure uniqueness of airline identifiers.
SELECT iata_code, COUNT(*) AS code_count
FROM airline
GROUP BY iata_code
HAVING COUNT(*) > 1;

-- Counts NULL values in columns to identify missing data.
SELECT 
    SUM(CASE WHEN iata_code IS NULL THEN 1 ELSE 0 END) AS null_iata_code,
    SUM(CASE WHEN airline_name IS NULL THEN 1 ELSE 0 END) AS null_airline_name,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS null_region,
	SUM(CASE WHEN functional_currency IS NULL THEN 1 ELSE 0 END) AS null_functional_currency,
	SUM(CASE WHEN ebit_usd IS NULL THEN 1 ELSE 0 END) AS null_ebit_usd,
	SUM(CASE WHEN load_factor IS NULL THEN 1 ELSE 0 END) AS null_load_factor,
	SUM(CASE WHEN low_cost_carrier IS NULL THEN 1 ELSE 0 END) AS null_low_cost_carrier,
	SUM(CASE WHEN airline_age IS NULL THEN 1 ELSE 0 END) AS null_airline_age,
	SUM(CASE WHEN num_routes IS NULL THEN 1 ELSE 0 END) AS null_num_routes,
	SUM(CASE WHEN passenger_yield IS NULL THEN 1 ELSE 0 END) AS null_passenger_yield,
	SUM(CASE WHEN ask IS NULL THEN 1 ELSE 0 END) AS null_ask,
	SUM(CASE WHEN avg_fleet_age IS NULL THEN 1 ELSE 0 END) AS null_avg_fleet_age,
	SUM(CASE WHEN fleet_size IS NULL THEN 1 ELSE 0 END) AS null_fleet_size,
	SUM(CASE WHEN aircraft_utilisation IS NULL THEN 1 ELSE 0 END) AS null_aircraft_utilisation
FROM airline;

-- Calculates basic statistics for key numerical columns to understand their ranges and distributions.
SELECT 
    COUNT(*) AS total_airlines,
    AVG(ebit_usd) AS avg_ebit_usd,
    MIN(ebit_usd) AS min_ebit_usd,
    MAX(ebit_usd) AS max_ebit_usd,
    AVG(load_factor) AS avg_load_factor,
    MIN(load_factor) AS min_load_factor,
    MAX(load_factor) AS max_load_factor,
    AVG(airline_age) AS avg_airline_age,
	MIN(airline_age) AS min_airline_age,
    MAX(airline_age) AS max_airline_age,
    AVG(num_routes) AS avg_num_routes,
	MIN(num_routes) AS min_num_routes,
    MAX(num_routes) AS max_num_routes,
    AVG(passenger_yield) AS avg_passenger_yield,
    AVG(ask) AS avg_ask,
    AVG(avg_fleet_age) AS avg_fleet_age,
    AVG(fleet_size) AS avg_fleet_size,
	MIN(fleet_size) AS min_fleet_size,
    MAX(fleet_size) AS max_fleet_size,
    AVG(aircraft_utilisation) AS avg_aircraft_utilisation,
	MIN(aircraft_utilisation) AS min_aircraft_utilisation,
    MAX(aircraft_utilisation) AS max_aircraft_utilisation
FROM airline;

-- Retrieves unique regions to understand geographical coverage.
SELECT DISTINCT region
FROM airline
ORDER BY region;

-- Retrieves unique functional currencies to assess financial reporting diversity.
SELECT DISTINCT functional_currency
FROM airline
ORDER BY functional_currency;

-- Counts unique values in low_cost_carrier to verify valid entries.
SELECT low_cost_carrier, COUNT(*) AS count
FROM airline
GROUP BY low_cost_carrier;

-- Sets NULL ebit_usd to rounded average for low-cost carriers
WITH avg_ebit_table AS (
SELECT
	ROUND(AVG(ebit_usd)) AS avg_ebit_lowcost
FROM airline
WHERE low_cost_carrier = 'Y'
)
UPDATE airline
SET ebit_usd = avg_ebit_table.avg_ebit_lowcost
FROM avg_ebit_table
WHERE ebit_usd IS NULL
AND low_cost_carrier = 'Y'

-- Sets NULL ebit_usd to rounded average for not low-cost carriers
WITH avg_ebit_table_n AS (
SELECT
	ROUND(AVG(ebit_usd)) AS avg_ebit_not_lowcost
FROM airline
WHERE low_cost_carrier = 'N'
)
UPDATE airline
SET ebit_usd = avg_ebit_table_n.avg_ebit_not_lowcost
FROM avg_ebit_table_n
WHERE ebit_usd IS NULL
AND low_cost_carrier = 'N'

-- Sets NULL load_factor to rounded average for low-cost carriers
WITH avg_low_cost AS (
SELECT
	ROUND(AVG(load_factor),3) AS avg_load_factor_lowcost
FROM airline
WHERE low_cost_carrier = 'Y'
)
UPDATE airline
SET load_factor = avg_low_cost.avg_load_factor_lowcost
FROM avg_low_cost
WHERE load_factor IS NULL
AND low_cost_carrier = 'Y'

-- Sets NULL load_factor to rounded average for NOT low-cost carriers
WITH avg_low_cost AS (
SELECT
	ROUND(AVG(load_factor),3) AS avg_load_factor_not_lowcost
FROM airline
WHERE low_cost_carrier = 'N'
)
UPDATE airline
SET load_factor = avg_low_cost.avg_load_factor_not_lowcost
FROM avg_low_cost
WHERE load_factor IS NULL
AND low_cost_carrier = 'N'

-- Sets NULL airline_age to rounded average for low-cost carriers
WITH avg_low_cost AS (
SELECT
	ROUND(AVG(airline_age)) AS avg_age_y
FROM airline
WHERE low_cost_carrier = 'Y'
)
UPDATE airline
SET airline_age = avg_low_cost.avg_age_y
FROM avg_low_cost
WHERE airline_age IS NULL
AND low_cost_carrier = 'Y'

-- Sets NULL airline_age to rounded average for NOT low-cost carriers
WITH avg_low_cost AS (
SELECT
	ROUND(AVG(airline_age)) AS avg_age_n
FROM airline
WHERE low_cost_carrier = 'N'
)
UPDATE airline
SET airline_age = avg_low_cost.avg_age_n
FROM avg_low_cost
WHERE airline_age IS NULL
AND low_cost_carrier = 'N'

-- Sets NULL num_routes to rounded average for low-cost carriers
WITH avg_low_cost AS (
SELECT
	ROUND(AVG(num_routes)) AS avg_nums_y
FROM airline
WHERE low_cost_carrier = 'Y'
)
UPDATE airline
SET num_routes = avg_low_cost.avg_nums_y
FROM avg_low_cost
WHERE num_routes IS NULL
AND low_cost_carrier = 'Y'

-- Sets NULL num_routes to rounded average for NOT low-cost carriers
WITH avg_low_cost AS (
SELECT
	ROUND(AVG(num_routes)) AS avg_nums_n
FROM airline
WHERE low_cost_carrier = 'N'
)
UPDATE airline
SET num_routes = avg_low_cost.avg_nums_n
FROM avg_low_cost
WHERE num_routes IS NULL
AND low_cost_carrier = 'N'
