# Data Loading & Transformation 
This directory contains SQL scripts responsible for transforming and loading data from the raw_data 
schema into the corresponding tables in the clean_data schema.

## Purpose
To prepare raw data for business analysis by applying necessary transformations, handling data 
inconsistencies, standardizing values, and loading the results into structured analytical tables.

## Scripts Included
| Script | Description |
|---|---|
| currencyexchange.sql | Loads currency exchange data into the analytical table. |
| customer.sql | Standardizes customer information, handles missing values, and performs date quality checks. |
| date.sql | Loads calendar and date dimension data. |
| orderrows.sql | Loads order-level product details, including quantities, prices, and costs. |
| orders.sql | Loads order information, including customer, store, and order dates. |
| product.sql | Loads product information and handles duplicate records. |
| sales.sql | Loads sales transaction data with associated order, customer, store, product, and exchange rate information. |
| store.sql | Loads store information, including geographical details, opening dates, and store size. |

## Data Flow

raw_data → SQL Transformations → clean_data

Each script handles the preparation and loading of its respective table.
