# 📌 AdventureWorks Data Warehouse Project

This project demonstrates the design and implementation of an **end-to-end, production-style Data Warehouse** using the AdventureWorks OLTP dataset.

The goal is to build a **scalable, analytics-ready DWH** that centralizes operational data, enables efficient reporting, and reflects real-world data engineering and dimensional modeling practices.

The project focuses on **architectural clarity, SQL-based ETL development, and clean analytical modeling**, making it suitable as a portfolio-quality implementation.

---

## 🎯 Project Objectives

The project is considered successful when the following outcomes are achieved:

- **Dimensional Data Model:** A fully defined **Star Schema** covering Sales, Products, Customers, and Geography domains.
- **Data Pipeline:** Reliable **OLTP → Staging → DWH → Mart** data flow.
- **Data Quality:** Clean, conformed, and analytics-ready datasets.
- **Performance:** Query-optimized warehouse design supporting reporting and aggregations.
- **Documentation:** Clear technical documentation including **ERDs, star schema diagrams, and data lineage**.
- **Reproducibility:** A fully reproducible setup using **version-controlled SQL scripts**.

---

## 🏗️ Architecture Overview

The solution follows a layered warehouse architecture:

1. **OLTP Source:** AdventureWorks transactional database.
2. **Staging Layer:** Raw data ingestion with separated extraction and loading logic.
3. **Data Warehouse (DWH):**
    - **Bronze:** Minimally transformed raw data.
    - **Silver:** Cleaned, standardized, and conformed data.
    - **Gold:** Dimensional models (facts & dimensions).
4. **Data Marts & Analytics:** Business-focused analytical views and Power BI datasets.

> **Note:** Extraction queries are executed on the OLTP source system, but they are owned and versioned under the staging layer as part of the ETL responsibility.

---

## 📂 Repository Structure

> ├── config/  
> │   ├── mappings/ # Mapping files between source and DWH  
> │   ├── environments/ # Environment-specific configs  
> │   └── dq_rules/ # Data quality rules and definitions  
> ├── docs/  
> │   ├── architecture/ # ERDs, star schema diagrams  
> │   ├── modeling/ # Dimensional modeling docs  
> │   └── dq_reports/ # Data profiling and quality reports  
> ├── src/  
> │   ├── infrastructure/ # Database & schema setup scripts  
> │   ├── oltp_exploration/ # Source system analysis & profiling  
> │   ├── staging/  
> │   │   ├── extract/ # OLTP source extraction logic  
> │   │   └── load/ # Staging table definitions and load scripts  
> │   ├── dwh/  
> │   │   ├── bronze/ # Minimally transformed raw data  
> │   │   ├── silver/ # Cleaned, standardized, conformed data  
> │   │   └── gold/ # Dimensional models (facts & dimensions)  
> │   ├── dq/ # Data quality stored procedures / checks  
> │   ├── pipelines/ # Orchestration placeholders (ADF / Airflow)  
> │   └── test/ # Validation, unit, integration, regression tests  
> └── README.md

---

## 🛠️ Tooling & Technologies

- **Database:** Microsoft SQL Server
- **ETL / ELT:** SQL-based pipelines (Stored Procedures, Views, Batch Jobs)
- **Modeling:** Kimball Dimensional Modeling (Star Schema)
- **BI & Analytics:** Power BI
- **Version Control:** Git & GitHub
- **Documentation:** Markdown, Mermaid.js, profiling reports

---

## ⚠️ Constraints & Assumptions

### Assumptions
- AdventureWorks OLTP database is available and restored.
- Batch processing is sufficient (no streaming requirements).
- Data volumes remain within SQL Server processing limits.

### Constraints
- Local development environment.
- Source system structure cannot be modified.
- Scope intentionally focuses on the **Sales domain** to maintain clarity and depth.

---

## 📘 Additional Documentation

- Detailed step-by-step project planning, design decisions, and implementation notes are maintained in **Notion** and referenced where applicable.

---

**Final Note:** This project is designed to reflect **real-world data warehouse development practices**, emphasizing **clarity, maintainability, and architectural discipline**.