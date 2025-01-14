------------------------
-- CREATE VIEW CALENDAR
------------------------
CREATE VIEW gold.calender AS
SELECT * 
FROM OPENROWSET
    (
        BULK 'https://awdatalake11.dfs.core.windows.net/silver/AdventureWorks_Calender/',
        FORMAT = 'PARQUET'
    ) as QUER1

GO

------------------------
-- CREATE VIEW CUSTOMERS
------------------------
CREATE VIEW gold.customers AS
SELECT * 
FROM OPENROWSET
    (
        BULK 'https://awdatalake11.blob.core.windows.net/silver/AdventureWorks_Customers/',
        FORMAT = 'PARQUET'
    ) as QUER1

GO

------------------------
-- CREATE VIEW PRODUCTS
------------------------
CREATE VIEW gold.products AS
SELECT * 
FROM OPENROWSET
    (
        BULK 'https://awdatalake11.blob.core.windows.net/silver/AdventureWorks_Products/',
        FORMAT = 'PARQUET'
    ) as QUER1

GO

------------------------
-- CREATE VIEW RETURNS
------------------------
CREATE VIEW gold.returns AS
SELECT * 
FROM OPENROWSET
    (
        BULK 'https://awdatalake11.blob.core.windows.net/silver/AdventureWorks_Returns/',
        FORMAT = 'PARQUET'
    ) as QUER1

GO

------------------------
-- CREATE VIEW SALES
------------------------
CREATE VIEW gold.sales AS
SELECT * 
FROM OPENROWSET
    (
        BULK 'https://awdatalake11.blob.core.windows.net/silver/AdventureWorks_Sales/',
        FORMAT = 'PARQUET'
    ) as QUER1

GO

------------------------
-- CREATE VIEW SUBCAT
------------------------
CREATE VIEW gold.product_subcategories AS
SELECT * 
FROM OPENROWSET
    (
        BULK 'https://awdatalake11.blob.core.windows.net/silver/AdventureWorks_Product_Subcategories/',
        FORMAT = 'PARQUET'
    ) as QUER1

GO

------------------------
-- CREATE VIEW TERRITORIES
------------------------
CREATE VIEW gold.territories AS
SELECT * 
FROM OPENROWSET
    (
        BULK 'https://awdatalake11.blob.core.windows.net/silver/AdventureWorks_Territories/',
        FORMAT = 'PARQUET'
    ) as QUER1

GO
