# 📌 AdventureWorks Data Warehouse Project

This project demonstrates the design and implementation of an end-to-end, production-style Data Warehouse using the AdventureWorks OLTP dataset.

The goal is to build a scalable, analytics-ready DWH that centralizes operational data, enables efficient reporting, and reflects real-world data engineering and dimensional modeling practices.

The project focuses on architectural clarity, SQL-based ETL development, and clean analytical modeling, making it suitable as a portfolio-quality implementation.

## 🎯 Project Objectives

The project is considered successful when the following outcomes are achieved:

- **Dimensional Data Model:** A fully defined Star Schema covering Sales, Products, Customers, and Geography domains.  
- **Data Pipeline:** Reliable OLTP → Staging → DWH → Mart data flow.  
- **Data Quality:** Clean, conformed, and analytics-ready datasets.  
- **Performance:** Query-optimized warehouse design supporting reporting and aggregations.  
- **Documentation:** Clear technical documentation including ERDs, star schema diagrams, and data lineage.  
- **Reproducibility:** A fully reproducible setup using version-controlled SQL scripts.  

## 🏗️ Architecture Overview

The solution follows a layered warehouse architecture:

- **OLTP Source:** AdventureWorks transactional database.  
- **Staging Layer:** Raw data ingestion with separated extraction and loading logic.  
- **Data Warehouse (DWH):**  
  - Bronze: Minimally transformed raw data.  
  - Silver: Cleaned, standardized, and conformed data.  
  - Gold: Dimensional models (facts & dimensions).  
- **Data Marts & Analytics:** Business-focused analytical views and Power BI datasets.  

> Note: Extraction queries are executed on the OLTP source system, but they are owned and versioned under the staging layer as part of the ETL responsibility.

## 🛠️ Tooling & Technologies

- **Database:** Microsoft SQL Server  
- **ETL / ELT:** SQL-based pipelines (Stored Procedures, Views, Batch Jobs)  
- **Modeling:** Kimball Dimensional Modeling (Star Schema)  
- **BI & Analytics:** Power BI  
- **Version Control:** Git & GitHub  
- **Documentation:** Markdown, Mermaid.js, profiling reports  

## ⚠️ Constraints & Assumptions

**Assumptions:**  
- AdventureWorks OLTP database is available and restored.  
- Batch processing is sufficient (no streaming requirements).  
- Data volumes remain within SQL Server processing limits.  

**Constraints:**  
- Local development environment.  
- Source system structure cannot be modified.  
- Scope intentionally focuses on the Sales domain to maintain clarity and depth.



## 📂 Project Repository

```text 
└───sql-data-warehouse
    │   LICENSE
    │   README.md
    │
    ├───config
    │       dq_rules.txt
    │       environments.txt
    │       mappings.txt
    │       settings.txt
    │       tables.txt
    │
    ├───docs
    │   ├───architecture
    │   │       .gitkeep
    │   │       NamingStandards.md
    │   │
    │   ├───dq
    │   │       .gitkeep
    │   │       DataQuality_Rules.md
    │   │       SalesOrderHeader_Profile.md
    │   │       SalesOrderHeader_Profile.xlsx
    │   │
    │   ├───modeling
    │   │       .gitkeep
    │   │       dimensions and fact scope.md
    │   │       Logical_Star_Schema.md
    │   │
    │   ├───project-overview
    │   │       Business_Entities_and_Domains.md
    │   │
    │   └───source-analysis
    │           .gitkeep
    │           load-strategy.md
    │           Source System Profiling.pbix
    │           Source System Profiling.png
    │
    ├───src
    │   ├───dq
    │   │       .gitkeep
    │   │       dq.usp_ProfileTable.sql
    │   │
    │   ├───dwh
    │   │   │   .gitkeep
    │   │   │
    │   │   ├───bronze
    │   │   │       .gitkeep
    │   │   │
    │   │   ├───gold
    │   │   │       .gitkeep
    │   │   │
    │   │   └───silver
    │   │           .gitkeep
    │   │
    │   ├───etl_jobs
    │   │       .gitkeep
    │   │
    │   ├───infrastructure
    │   │       00_create_databases.sql
    │   │       01_create_schemas.sql
    │   │
    │   ├───oltp_exploration
    │   │       .gitkeep
    │   │       ERD.md
    │   │       RowCount Growth.sql
    │   │       Sales_Domain_Mapping.md
    │   │       Schema_Discovery_Query.sql
    │   │       top_15_table_sizes.sql
    │   │
    │   ├───pipelines
    │   │       .gitkeep
    │   │
    │   └───staging
    │       │   .gitkeep
    │       │
    │       ├───extract
    │       │       usp_oltp_extract_salesperson.sql
    │       │
    │       └───load
    │               01 - CREATE TABLE Sales.SalesOrderHeader.sql
    │               02 - CREATE TABLE Sales.SalesOrderDetail.sql
    │               03 - CREATE TABLE Sales.Customer.sql
    │               04 - CREATE TABLE Person.Person.sql
    │               05 - CREATE TABLE Person.Address.sql
    │               06 - CREATE TABLE Production.Product.sql
    │               07 - CREATE TABLE Sales.SalesPerson.sql
    │
    └───test
            .gitkeep 

```

## 📘 Additional Documentation

Detailed step-by-step project planning, design decisions, and implementation notes are maintained in Notion and referenced where applicable.  

**Final Note:** This project is designed to reflect real-world data warehouse development practices, emphasizing clarity, maintainability, and architectural discipline.
