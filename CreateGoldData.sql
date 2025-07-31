-- ========================================
-- 🌐 External Data Access Setup (Gold/Silver)
-- ========================================

-- 🔐 Scoped Credential (Using Managed Identity)
-- NOTE: Don't expose actual identity/keys in public repositories
CREATE DATABASE SCOPED CREDENTIAL [your_credential_name]
WITH
    IDENTITY = 'Managed Identity';

-- 📁 External Data Sources
CREATE EXTERNAL DATA SOURCE [source_silver]
WITH (
    LOCATION = 'https://vdatastorage.blob.core.windows.net/silver/',
    CREDENTIAL = [your_credential_name]
);

CREATE EXTERNAL DATA SOURCE [source_gold]
WITH (
    LOCATION = 'https://vdatastorage.blob.core.windows.net/gold/',
    CREDENTIAL = [your_credential_name]
);

-- 📦 External File Format (Parquet + Snappy)
CREATE EXTERNAL FILE FORMAT [format_parquet]
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);

-- ========================================
-- 📊 External Tables (Gold Layer)
-- ========================================

-- 🛍️ Sales
CREATE EXTERNAL TABLE gold.ext_sales
WITH (
    LOCATION = 'extsales',
    DATA_SOURCE = [source_gold],
    FILE_FORMAT = [format_parquet]
)
AS SELECT * FROM gold.Sales;

-- 👥 Customers
CREATE EXTERNAL TABLE gold.ext_customers
WITH (
    LOCATION = 'extcustomers',
    DATA_SOURCE = [source_gold],
    FILE_FORMAT = [format_parquet]
)
AS SELECT * FROM gold.Customers;

-- 📦 Product
CREATE EXTERNAL TABLE gold.ext_product
WITH (
    LOCATION = 'extproduct',
    DATA_SOURCE = [source_gold],
    FILE_FORMAT = [format_parquet]
)
AS SELECT * FROM gold.Product;

-- 🗂️ Product Categories
CREATE EXTERNAL TABLE gold.ext_product_categories
WITH (
    LOCATION = 'extproductcategories',
    DATA_SOURCE = [source_gold],
    FILE_FORMAT = [format_parquet]
)
AS SELECT * FROM gold.ProductCategories;

-- ↩️ Returns
CREATE EXTERNAL TABLE gold.ext_returns
WITH (
    LOCATION = 'extreturns',
    DATA_SOURCE = [source_gold],
    FILE_FORMAT = [format_parquet]
)
AS SELECT * FROM gold.Returns;

-- 📅 Calendar
CREATE EXTERNAL TABLE gold.ext_calendar
WITH (
    LOCATION = 'extcalendar',
    DATA_SOURCE = [source_gold],
    FILE_FORMAT = [format_parquet]
)
AS SELECT * FROM gold.Calendar;

-- 🌍 Territories
CREATE EXTERNAL TABLE gold.ext_territories
WITH (
    LOCATION = 'extterritories',
    DATA_SOURCE = [source_gold],
    FILE_FORMAT = [format_parquet]
)
AS SELECT * FROM gold.Territories;
