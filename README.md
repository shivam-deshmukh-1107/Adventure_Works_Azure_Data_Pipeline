# Adventure Works Azure Project

## Project Overview

The Adventure Works Azure Project is a comprehensive end-to-end Azure data engineering solution leveraging cutting-edge cloud technologies. The project follows the Medallion Architecture to transform raw data into actionable insights and visualizations. This architecture incorporates three data layers:

1. **Bronze (Raw Layer)**: Stores raw, unprocessed data directly ingested from the source.
2. **Silver (Transformation Layer)**: Processes and transforms data into a refined state.
3. **Gold (Serving Layer)**: Provides data ready for analytical querying and visualization.

The project leverages Azure Data Factory for data ingestion, Azure Databricks for data transformation, Azure Synapse Analytics for warehousing, and Tableau for visualization, creating a complete data pipeline solution.

---

## Project Objectives

1. Implement automated, dynamic pipelines for scalable data ingestion.
2. Transform and process large-scale data using Spark in Azure Databricks.
3. Establish a data warehouse in Azure Synapse Analytics for efficient querying.
4. Deliver actionable insights through advanced Tableau dashboards.
5. Demonstrate proficiency in handling real-world data engineering challenges.

---

## Project Flow

### Step 1: Resource Initialization
1. **Resource Group Setup:**
   - Created a resource group to organize and manage all project-related Azure resources effectively.

2. **Storage Account Creation:**
   - Configured Azure Data Lake Storage Gen2.
   - Enabled the hierarchical namespace for structured folder management.
   - Selected Locally Redundant Storage (LRS) for data replication within the same region.

### Step 2: Data Ingestion via Azure Data Factory
1. **Static Pipeline Design:**
   - Used Azure Data Factory to set up pipelines that ingest raw data from GitHub via HTTP connections.
   - Saved ingested data in the Bronze layer of Azure Data Lake Storage Gen2.

2. **Dynamic Pipeline Implementation:**
   - Designed pipelines with parameters to handle multiple datasets dynamically.
   - Created a JSON configuration file (`git.json`) to manage metadata, including file paths, names, and sink locations.
   - Used ForEach activity to iterate over the dataset and automate the Copy Data activity for every file.

### Step 3: Data Transformation in Azure Databricks
1. **Cluster Configuration:**
   - Set up a Databricks workspace and configured a cluster with the following specifications:
     - **Node Type:** Standard_DS3_v2 (14GB memory, 4 cores).
     - **Runtime:** Long-Term Support (LTS) version 14.3.
     - **Termination Policy:** Cluster auto-terminates after 20 minutes of inactivity.

2. **Transformation Process:**
   - Loaded data from the Bronze layer.
   - Applied data cleaning, filtering, and enrichment transformations using PySpark.
   - Stored the processed data in the Silver layer of Azure Data Lake Gen2.

3. **Secure Data Access:**
   - Registered a service-level application in Microsoft Entra ID for secure data access.
   - Created and managed client secrets to authenticate Databricks with Azure Data Lake.
   - Assigned the application the "Storage Blob Data Contributor" role.

### Step 4: Data Warehousing in Azure Synapse Analytics
1. **Synapse Workspace Creation:**
   - Configured a Synapse Analytics workspace.
   - Established a serverless SQL database for querying data from the Silver layer.

2. **View and Table Creation:**
   - Created views using SQL scripts with the OPENROWSET function to query data stored in Parquet format.
   - Built external tables in the Gold layer using the CETAS (Create External Table As Select) method.
   - Implemented a CREATE CREDENTIAL mechanism for secure access to data stored in Azure Data Lake.

3. **Unified Platform Advantage:**
   - Integrated Data Factory, PySpark, and Synapse Analytics for a seamless and unified data platform.

### Step 5: Data Visualization in Tableau
1. **Connection Setup:**
   - Connected Tableau to the Synapse SQL endpoint using serverless credentials.

2. **Dashboard Creation:**
   - Designed interactive dashboards displaying key insights, including:
     - Sales trends over multiple years.
     - Customer demographics and purchasing behavior.
     - Performance metrics for product categories and subcategories.

---

## Tools and Technologies

- **Azure Data Factory**: For data orchestration and pipeline automation.
- **Azure Data Lake Storage Gen2**: For scalable and hierarchical data storage.
- **Azure Databricks**: For scalable big data transformation.
- **Azure Synapse Analytics**: For creating a unified data warehouse and to serve data for querying and analytics.
- **Tableau**: For creating interactive data visualizations.

---

## Dataset Details

The Adventure Works dataset consists of the following components:

1. **Calendar Data**: Provides date and time-related dimensions.
2. **Customer Information**: Captures customer demographics.
3. **Product Data**: Includes product categories, subcategories, and details.
4. **Sales Data (2015-2017)**: Tracks transaction details across years.
5. **Territory Data**: Represents regional sales data.
6. **Returns Data**: Logs product returns and related metrics.

All datasets were sourced from GitHub, with configurations managed in `git.json`.

---

## Unique Features and Highlights

1. **Dynamic Pipeline Design:**
   - Supports scalability by accommodating new datasets without requiring significant rework.
2. **Hierarchical Data Processing:**
   - Implements the Medallion Architecture for systematic data refinement.
3. **Comprehensive Security:**
   - Uses Microsoft Entra ID and role-based access controls for secure resource access.
4. **End-to-End Integration:**
   - Combines ingestion, transformation, warehousing, and visualization into a unified workflow.

---

## Common Interview Questions

1. **What is the Medallion Architecture?**
   - A data organization strategy using Bronze, Silver, and Gold layers.
2. **Difference Between Blob Storage and Data Lake Storage?**
   - Blob Storage lacks hierarchical folder structures; Data Lake allows for them.
3. **Why Use Synapse Analytics?**
   - Combines data factory, big data transformation (PySpark), and data warehousing in a unified platform.

---

## Conclusion

The Adventure Works Azure Project illustrates the implementation of advanced data engineering practices using Azure’s ecosystem. Its robust architecture, dynamic scalability, and comprehensive approach to data processing make it an ideal solution for modern enterprise needs. Mastering this project equips one with essential skills for a Data Engineer role.
