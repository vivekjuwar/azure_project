End-to-End Data Engineering Pipeline on Azure
This project demonstrates an end-to-end data engineering pipeline built on Microsoft Azure, using the Medallion Architecture (Bronze, Silver, Gold layers). The raw data is sourced directly from a public GitHub repository using HTTPS and ingested into Azure Data Lake Storage via Azure Data Factory. Once the data lands in the Bronze layer, Azure Databricks is used for cleaning, transformation, and processing, after which the refined data is moved to the Silver layer. The connection between Databricks and Azure Blob Storage is secured using an access token. From there, Azure Synapse Analytics (serverless SQL) is used to create Gold layer views, applying business logic and modeling the data for analytics. These Gold views are then connected to Power BI, enabling interactive dashboards and visual reports for business users and analysts. The project includes Databricks notebooks, SQL scripts, and sample visualizations to showcase the full data journey from ingestion to insight.

🧱 Architecture Overview
Architecture Diagram

🔧 Tools & Technologies Used
Azure Data Factory (ADF)
Azure Blob Storage (Bronze, Silver, Gold layers)
Azure Databricks (Pyspark)
Azure Synapse Analytics (Serverless SQL)
Power BI
📂 Data Flow
🔗 Data Source: Raw data is fetched from a GitHub repo using HTTPS.
📥 Bronze Layer: ADF ingests and stores data into Azure Blob (bronze container).
⚙️ Data Transformation: Azure Databricks cleans and transforms the data.
📤 Silver Layer: Transformed data is stored in the silver container.
🧠 Semantic Layer: Azure Synapse creates SQL views and runs queries.
📊 Visualization: Power BI connects to Synapse and visualizes the data.
