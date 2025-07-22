select * from airline limit 10; 

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN ebit_usd IS NULL THEN 1 ELSE 0 END) AS null_count,
    ROUND(CAST(SUM(CASE WHEN ebit_usd IS NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS DECIMAL), 2) AS null_percentage
FROM airline;


