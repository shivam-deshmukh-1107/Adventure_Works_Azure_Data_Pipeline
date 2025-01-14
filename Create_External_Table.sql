
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Shiva@#786'

CREATE DATABASE SCOPED CREDENTIAL cred_shivam
WITH
    IDENTITY = 'Managed Identity'

CREATE EXTERNAL DATA SOURCE source_silver
WITH
(
    LOCATION = 'https://awdatalake11.blob.core.windows.net/silver',
    CREDENTIAL = cred_shivam
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH
(
    LOCATION = 'https://awdatalake11.blob.core.windows.net/gold',
    CREDENTIAL = cred_shivam
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)
-- --------------------------------------------------------------------------------
-- Create External Table ext_sales
CREATE EXTERNAL TABLE gold.ext_sales
WITH
(
    LOCATION = 'ext_sales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.sales

SELECT * FROM gold.ext_sales

-- --------------------------------------------------------------------------------
-- Create External Table ext_calender
CREATE EXTERNAL TABLE gold.ext_calender
WITH
(
    LOCATION = 'ext_calender',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.calender

SELECT * FROM gold.ext_calender

-- --------------------------------------------------------------------------------
-- Create External Table ext_customers
CREATE EXTERNAL TABLE gold.ext_customers
WITH
(
    LOCATION = 'ext_customers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customers

SELECT * FROM gold.ext_customers

-- --------------------------------------------------------------------------------
-- Create External Table ext_product_subcategories
CREATE EXTERNAL TABLE gold.ext_product_subcategories
WITH
(
    LOCATION = 'ext_product_subcategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.product_subcategories

SELECT * FROM gold.ext_product_subcategories

-- --------------------------------------------------------------------------------
-- Create External Table ext_products
CREATE EXTERNAL TABLE gold.ext_products
WITH
(
    LOCATION = 'ext_products',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.products

SELECT * FROM gold.ext_products

-- --------------------------------------------------------------------------------
-- Create External Table ext_returns
CREATE EXTERNAL TABLE gold.ext_returns
WITH
(
    LOCATION = 'ext_returns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.returns

SELECT * FROM gold.ext_returns

-- --------------------------------------------------------------------------------
-- Create External Table ext_territories
CREATE EXTERNAL TABLE gold.ext_territories
WITH
(
    LOCATION = 'ext_territories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.territories

SELECT * FROM gold.ext_territories
