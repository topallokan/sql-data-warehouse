# 📌 Project Foundation

## 🎯 1. Project Vision
The purpose of this project is to design and implement a scalable, reliable, and analytics-ready Data Warehouse using the AdventureWorks dataset.  
This solution aims to centralize operational data, enable efficient reporting, and demonstrate best practices in data engineering, ETL/ELT processing, and dimensional modeling.

The vision is to build a production-like, portfolio-quality DWH environment that highlights strong architectural thinking and hands-on SQL development skills.

---

## 🏆 2. Success Criteria
This project will be considered successful when the following measurable outcomes are achieved:

- A fully designed **Dimensional Data Model** (Star Schema) for Sales, Products, Customers, and Geography domains.
- Automated **ETL/ELT pipelines** that extract, transform, and load data from the OLTP source into the DWH.
- Clean, conformed, and analytics-ready datasets.
- A query-optimized warehouse supporting fast aggregations and reporting workloads.
- Clear documentation including ERDs, pipeline architecture, and folder structure.
- A fully reproducible setup using SQL scripts and structured version control.

---

## 👥 3. Stakeholders & Data Consumers

### **Primary Stakeholders**
- **Business Analysts** – Require accurate, aggregated KPIs for reporting.
- **Data Engineers** – Own pipeline development and DWH maintenance.
- **Data Scientists** – Use curated datasets for advanced analytics.
- **Management & Leadership** – Depend on reliable insights for decisions.

### **Secondary Stakeholders**
- BI Developers  
- Reporting Teams  
- Technical Auditors  

---

## 🛠️ 4. Tooling & Environment Strategy

### **Development Environment**
- Microsoft SQL Server (OLTP + DWH)
- SQL Server Management Studio (SSMS)
- Azure Data Studio (optional)

### **Version Control**
- GitHub repository with organized folder structure
- SQL scripts versioned under a dedicated `/src` directory

### **Data Integration (ETL/ELT)**
- SQL-based ETL (Stored Procedures, Views, and Batch Jobs)
- Optional orchestration using Azure Data Factory or Apache Airflow

### **Modeling & Diagrams**
- dbdiagram.io / Draw.io for ERD and star schema designs

---

## ⚠️ 5. Constraints & Assumptions

### **Assumptions**
- AdventureWorks OLTP database is available and successfully restored.
- Dimensional modeling will follow Kimball methodology.
- Data volumes remain moderate and suitable for SQL Server processing.
- Batch processing (not streaming) is sufficient for project goals.

### **Constraints**
- Limited compute resources (local environment).
- Source dataset structure cannot be altered.
- Scope focuses on core Sales domain to maintain feasibility.
- No real-time or near-real-time ingestion.

---

