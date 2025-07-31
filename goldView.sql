-- ========================================
-- ✅ Create Views in Gold Layer (Synapse)
-- ========================================

-- 📅 Calendar View
CREATE VIEW gold.Calendar AS
SELECT *
FROM OPENROWSET(
    BULK 'https://vdatastorage.blob.core.windows.net/silver/Calendar/',
    FORMAT = 'PARQUET'
) AS [data];

-- 👥 Customers View
CREATE VIEW gold.Customers AS
SELECT *
FROM OPENROWSET(
    BULK 'https://vdatastorage.blob.core.windows.net/silver/Customers/',
    FORMAT = 'PARQUET'
) AS [data];

-- 📦 Product View
CREATE VIEW gold.Product AS
SELECT *
FROM OPENROWSET(
    BULK 'https://vdatastorage.blob.core.windows.net/silver/Product/',
    FORMAT = 'PARQUET'
) AS [data];

-- 🗂️ Product Categories View
CREATE VIEW gold.ProductCategories AS
SELECT *
FROM OPENROWSET(
    BULK 'https://vdatastorage.blob.core.windows.net/silver/ProductCategories/',
    FORMAT = 'PARQUET'
) AS [data];

-- ↩️ Returns View
CREATE VIEW gold.Returns AS
SELECT *
FROM OPENROWSET(
    BULK 'https://vdatastorage.blob.core.windows.net/silver/Returns/',
    FORMAT = 'PARQUET'
) AS [data];

-- 💰 Sales View
CREATE VIEW gold.Sales AS
SELECT *
FROM OPENROWSET(
    BULK 'https://vdatastorage.blob.core.windows.net/silver/Sales/',
    FORMAT = 'PARQUET'
) AS [data];

-- 🌍 Territories View
CREATE VIEW gold.Territories AS
SELECT *
FROM OPENROWSET(
    BULK 'https://vdatastorage.blob.core.windows.net/silver/Territories/',
    FORMAT = 'PARQUET'
) AS [data];
