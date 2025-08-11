-- Retrieves the first 10 records from the airline table to preview the dataset
SELECT * FROM airline LIMIT 10;

-- Count the number of low-cost and non-low-cost airlines
SELECT
	low_cost_carrier,
	COUNT(low_cost_carrier) 
FROM airline
GROUP BY low_cost_carrier

--Compare the average values of the EBIT in USD (ebit_usd) between low-cost and non-low-cost carriers
SELECT
	low_cost_carrier,
	ROUND(AVG(ebit_usd)) AS average_ebit
FROM airline
GROUP BY low_cost_carrier

--Compare the average values of the load factor
SELECT
	low_cost_carrier,
	ROUND(AVG(load_factor),3) AS average_load_factor
FROM airline
GROUP BY low_cost_carrier

-- Compare the average values of the Number of Routes
SELECT
	low_cost_carrier,
	ROUND(AVG(num_routes)) AS average_num_routes
FROM airline
GROUP BY low_cost_carrier

-- Compare the average values of the Passenger Yield
SELECT
	low_cost_carrier,
	ROUND(AVG(passenger_yield),3) AS average_passenger_yield
FROM airline
GROUP BY low_cost_carrier

-- Compare the average values of the Average Fleet Age
SELECT
	low_cost_carrier,
	ROUND(AVG(avg_fleet_age),1) AS average_avg_fleet_age
FROM airline
GROUP BY low_cost_carrier

-- Compare analysis across regions on Average EBIT (USD)
SELECT
	region,
	ROUND(AVG (ebit_usd)) AS avg_ebit_region
FROM airline
GROUP BY region
ORDER BY avg_ebit_region DESC

-- Compare analysis across regions on Average Load Factor
SELECT
	region,
	ROUND(AVG (load_factor),3) AS avg_load_factor_region
FROM airline
GROUP BY region
ORDER BY avg_load_factor_region DESC
	
-- Compare analysis across regions on Average Passenger Yield
SELECT
	region,
	ROUND(AVG (passenger_yield),3) AS avg_passenger_yield
FROM airline
GROUP BY region
ORDER BY avg_passenger_yield DESC

-- Compare analysis across regions on Average Airline Age
SELECT
	region,
	ROUND(AVG (airline_age)) AS avg_airline_age
FROM airline
GROUP BY region
ORDER BY avg_airline_age DESC

-- Count of low-cost carriers per region
SELECT
	region,
	COUNT(*) AS count_per_region
from airline
WHERE low_cost_carrier = 'Y'
GROUP BY region
ORDER BY count_per_region DESC

-- Calculate fleet utilization proxy (ASK per aircraft) by region
SELECT 
    region,
    ROUND(AVG(ask / NULLIF(fleet_size, 0))) AS avg_fleet_utilization
FROM airline
GROUP BY region
ORDER BY avg_fleet_utilization DESC;



