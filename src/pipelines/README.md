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
|   .gitkeep
|   LICENSE
|   README.md
|
+---config
|       .gitkeep
|
+---docs
|   +---architecture
|   |       .gitkeep
|   |       NamingStandards.md
|   |
|   +---dq
|   |       .gitkeep
|   |       DataQuality_Rules.md
|   |       SalesOrderHeader_Profile.md
|   |       SalesOrderHeader_Profile.xlsx
|   |
|   +---modeling
|   |       .gitkeep
|   |       dimensions and fact scope.md
|   |       Logical_Star_Schema.md
|   |
|   +---project-overview
|   |       Business_Entities_and_Domains.md
|   |
|   \---source-analysis
|           .gitkeep
|           load-strategy.md
|           Source System Profiling.pbix
|           Source System Profiling.png
|           Staging_Data_Lineage.md
|
+---src
|   +---dq
|   |       .gitkeep
|   |       dq.usp_ProfileTable.sql
|   |       rowcount_validation.sql
|   |
|   +---dwh
|   |   |   .gitkeep
|   |   |   CREATE TABLE Etl.AuditInfo.sql
|   |   |
|   |   +---bronze
|   |   |   |   .gitkeep
|   |   |   |
|   |   |   +---Extract
|   |   |   |       01 - usp_stg_extract_Sales.Bronzesalesorderheader.sql
|   |   |   |       02 - usp_stg_extract_Sales.Bronzesalesorderdetail.sql
|   |   |   |       03 - usp_stg_extract_Sales.BronzeCustomer.sql
|   |   |   |       04 - usp_stg_extract_Person.BronzePerson.sql
|   |   |   |       05 - usp_stg_extract_Person.BronzeAddress.sql
|   |   |   |       06 - usp_stg_extract_Product.BronzeProduct.sql
|   |   |   |       07 - usp_stg_extract_Sales.BronzeSalesPerson.sql
|   |   |   |
|   |   |   \---Load
|   |   |           01 - CREATE TABLE Bronze.SalesOrderHeader.sql
|   |   |           02 - CREATE TABLE Bronze.SalesOrderDetail.sql
|   |   |           03 - CREATE TABLE Bronze.Customer.sql
|   |   |           04 - CREATE TABLE Bronze.Person.sql
|   |   |           05 - CREATE TABLE Bronze.Address.sql
|   |   |           06 - CREATE TABLE Bronze.Product.sql
|   |   |           07 - CREATE TABLE Bronze.SalesPerson.sql
|   |   |
|   |   +---gold
|   |   |   |   .gitkeep
|   |   |   |   01 - execute sql task.sql
|   |   |   |
|   |   |   +---Extract
|   |   |   |       01 - Silver.usp_Extract_Gold_FactSales.sql
|   |   |   |
|   |   |   \---Load
|   |   |           01 - CREATE TABLE Gold.FactSales.sql
|   |   |
|   |   \---silver
|   |       |   .gitkeep
|   |       |
|   |       +---Extract
|   |       |       01 - Bronze.usp_Extract_Silver_SalesOrderHeader.sql
|   |       |       02 - Bronze.usp_Extract_Silver_SalesOrderDetail.sql
|   |       |       03 - Bronze.usp_Extract_Silver_Customer.sql
|   |       |       04 - Bronze.usp_Extract_Silver_Person.sql
|   |       |       05 - Bronze.usp_Extract_Silver_Address.sql
|   |       |       06 - Bronze.usp_Extract_Silver_Product.sql
|   |       |       07 - Bronze.usp_Extract_Silver_SalesPerson.sql
|   |       |
|   |       \---load
|   |               01 - CREATE TABLE Silver.SalesOrderHeader.sql
|   |               02 - CREATE TABLE Silver.SalesOrderDetail.sql
|   |               03 - CREATE TABLE Silver.Customer.sql
|   |               04 - CREATE TABLE Silver.Person.sql
|   |               05 - CREATE TABLE Silver.Address.sql
|   |               06 - CREATE TABLE Silver.Product.sql
|   |               07 - CREATE TABLE Silver.SalesPerson.sql
|   |
|   +---etl_jobs
|   |       .gitkeep
|   |
|   +---infrastructure
|   |       00_create_databases.sql
|   |       01_create_schemas.sql
|   |
|   +---oltp_exploration
|   |       .gitkeep
|   |       ERD.md
|   |       RowCount Growth.sql
|   |       Sales_Domain_Mapping.md
|   |       Schema_Discovery_Query.sql
|   |       top_15_table_sizes.sql
|   |
|   +---pipelines
|   |   |   .gitignore
|   |   |   .gitkeep
|   |   |   AdventureWorksETL.sln
|   |   |   LICENSE
|   |   |   README.md
|   |   |
|   |   \---AdventureWorks
|   |       |   AdventureWorks.database
|   |       |   AdventureWorks.dtproj
|   |       |   AdventureWorks.dtproj.user
|   |       |   BRONZEtoSILVERAddress.dtsx
|   |       |   BRONZEtoSILVERCustomer.dtsx
|   |       |   BRONZEtoSILVERPerson.dtsx
|   |       |   BRONZEtoSILVERProduct.dtsx
|   |       |   BRONZEtoSILVERSalesOrderDetail.dtsx
|   |       |   BRONZEtoSILVERSalesOrderHeader.dtsx
|   |       |   BRONZEtoSILVERSalesPerson.dtsx
|   |       |   OLTPtoSTGPersonAddress.dtsx
|   |       |   OLTPtoSTGPersonPerson.dtsx
|   |       |   OLTPtoSTGProductionProduct.dtsx
|   |       |   OLTPtoSTGSalesSalesCustomer.dtsx
|   |       |   OLTPtoSTGSalesSalesOrderDetail.dtsx
|   |       |   OLTPtoSTGSalesSalesOrderHeader.dtsx
|   |       |   OLTPtoSTGSalesSalesPerson.dtsx
|   |       |   Project.params
|   |       |   STGtoDWHBronzeAddress.dtsx
|   |       |   STGtoDWHBronzeCustomer.dtsx
|   |       |   STGtoDWHBronzePerson.dtsx
|   |       |   STGtoDWHBronzeProduct.dtsx
|   |       |   STGtoDWHBronzeSalesOrderDetail.dtsx
|   |       |   STGtoDWHBronzeSalesOrderHeader.dtsx
|   |       |   STGtoDWHBronzeSalesOrderHeaderdtsx
|   |       |   STGtoDWHBronzeSalesPerson.dtsx
|   |       |
|   |       +---bin
|   |       |   \---Development
|   |       |           AdventureWorks.ispac
|   |       |
|   |       \---obj
|   |           \---Development
|   |                   AdventureWorks.dtproj
|   |                   BRONZEtoSILVERAddress.dtsx
|   |                   BRONZEtoSILVERCustomer.dtsx
|   |                   BRONZEtoSILVERPerson.dtsx
|   |                   BRONZEtoSILVERProduct.dtsx
|   |                   BRONZEtoSILVERSalesOrderDetail.dtsx
|   |                   BRONZEtoSILVERSalesOrderHeader.dtsx
|   |                   BRONZEtoSILVERSalesPerson.dtsx
|   |                   BuildLog.xml
|   |                   OLTPtoSTGPersonAddress.dtsx
|   |                   OLTPtoSTGPersonPerson.dtsx
|   |                   OLTPtoSTGProductionProduct.dtsx
|   |                   OLTPtoSTGSalesCustomer.dtsx
|   |                   OLTPtoSTGSalesCustomer_.dtsx
|   |                   OLTPtoSTGSalesSalesCustomer.dtsx
|   |                   OLTPtoSTGSalesSalesOrderDetail.dtsx
|   |                   OLTPtoSTGSalesSalesOrderHeader.dtsx
|   |                   OLTPtoSTGSalesSalesPerson 2.dtsx
|   |                   OLTPtoSTGSalesSalesPerson 3.dtsx
|   |                   OLTPtoSTGSalesSalesPerson 4.dtsx
|   |                   OLTPtoSTGSalesSalesPerson 5.dtsx
|   |                   OLTPtoSTGSalesSalesPerson 6.dtsx
|   |                   OLTPtoSTGSalesSalesPerson.dtsx
|   |                   Project.params
|   |                   STGtoDWHBronzeAddress.dtsx
|   |                   STGtoDWHBronzeCustomer.dtsx
|   |                   STGtoDWHBronzePerson.dtsx
|   |                   STGtoDWHBronzeProduct.dtsx
|   |                   STGtoDWHBronzeSalesOrderDetail.dtsx
|   |                   STGtoDWHBronzeSalesOrderHeader.dtsx
|   |                   STGtoDWHBronzeSalesPerson.dtsx
|   |
|   \---staging
|       |   .gitkeep
|       |   CREATE TABLE Etl.AuditInfo.sql
|       |
|       +---extract
|       |       01 - usp_oltp_extract_sales.salesorderheader.sql
|       |       02 - usp_oltp_extract_sales.salesorderdetail.sql
|       |       03 - usp_oltp_extract_sales.customer.sql
|       |       04 - usp_oltp_extract_sales.salesperson.sql
|       |       05 - usp_oltp_extract_person.address.sql
|       |       06 - usp_oltp_extract_production.product.sql
|       |       07 - usp_oltp_extract_person.person.sql
|       |
|       \---load
|               01 - CREATE TABLE Sales.SalesOrderHeader.sql
|               02 - CREATE TABLE Sales.SalesOrderDetail.sql
|               03 - CREATE TABLE Sales.Customer.sql
|               04 - CREATE TABLE Person.Person.sql
|               05 - CREATE TABLE Person.Address.sql
|               06 - CREATE TABLE Production.Product.sql
|               07 - CREATE TABLE Sales.SalesPerson.sql
|
\---test
        .gitkeep

```

## 📘 Additional Documentation

Detailed step-by-step project planning, design decisions, and implementation notes are maintained in Notion and referenced where applicable.  

**Final Note:** This project is designed to reflect real-world data warehouse development practices, emphasizing clarity, maintainability, and architectural discipline.
