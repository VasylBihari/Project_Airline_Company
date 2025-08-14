# Airline Metrics Analysis  ✈️

 This repository contains a project for analyzing key airline metrics, including comparisons between low-cost and non-low-cost carriers, as well as regional differences. 
 The dataset for analysis is airline_data.csv and airline_dataset_metadata. The project is designed to support business intelligence in the aviation industry.    

**Business Context:**
Airline companies want to understand how low-cost carriers compare to traditional carriers in terms of profitability and efficiency.
The airline industry is regionally diverse, and profitability can vary significantly by region. As an analyst, you’re tasked with helping leadership identify which regions are operating most efficiently and profitably.    

**Project description:**
- Data cleaning was performed in SQL (checking for missing data, duplicates, incorrect data, missing data for each indicator was filled with average values of the indicator of the corresponding company type (sql scripts in the file Data_Exploration_06082025).
- Data aggregation was performed in SQL (sql scripts in the file Data_Processing_06082025).
- The resulting data was saved in the data_csv folder.
- Visualization: performed in Looker Studio.

The project helps visualize comparisons, for example, profitability by region (Middle East leads with ~1.8 billion USD EBIT), the effectiveness of low-cost models and others.    

**Repository structure:**
- data/: Source datasets ([airline_data.csv](https://github.com/VasylBihari/Project_Airline_Company/blob/main/airline_data.csv), [airline_dataset_metadata](https://github.com/VasylBihari/Project_Airline_Company/blob/main/airline_dataset_metadata.csv)).
- sql/: SQL scripts ([Data_Exploration_06082025.sql](https://github.com/VasylBihari/Project_Airline_Company/blob/main/sql/Data_Exploration_06082025.sql), [Data_Processing_06082025.sql](https://github.com/VasylBihari/Project_Airline_Company/blob/main/sql/Data_Processing_06082025.sql)).
- data_csv/: Processed data after SQL aggregation ([CSV files with aggregated metrics](https://github.com/VasylBihari/Project_Airline_Company/tree/main/data_csv)).
- docs/: PDF with graphs ([Airline.pdf](https://github.com/VasylBihari/Project_Airline_Company/blob/main/Dashboard_Airline.pdf)).

