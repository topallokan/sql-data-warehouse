# Naming Standards

This document defines the official naming conventions for the **Data Warehouse / Data Engineering project**.
These standards are mandatory across all layers to ensure consistency, clarity, scalability, and long-term maintainability.

> **Design Decisions**
>
> * Staging (STG) mirrors source systems
> * Data Warehouse (DWH) follows **Kimball-compatible modeling**
> * **Domain-based schemas** are used in the DWH
> * Dimension and Fact tables are explicitly identified via prefixes

---

## 1. General Principles

* `snake_case` is mandatory (except STG raw mirror columns)
* English only
* Table names are **singular**
* Avoid unnecessary abbreviations
* Naming must clearly reflect **layer, domain, and business meaning**

---

## 2. Database & Schema Naming

### 2.1 Databases

| Database             | Purpose                                |
| -------------------- | -------------------------------------- |
| `AdventureWorks_STG` | Raw staging layer (source mirror)      |
| `AdventureWorks_DWH` | Data Warehouse (Kimball, domain-based) |

---

### 2.2 Schema Naming by Layer

#### 🔹 STAGING DATABASE (`AdventureWorks_STG`)

* Schemas **mirror source schemas**

Examples:

```
Sales
Person
Production
```

> No `stg_` prefix is used at table level because **layer and source are already expressed by database + schema**.

---

#### 🔹 DATA WAREHOUSE DATABASE (`AdventureWorks_DWH`)

Schemas represent **business domains**:

| Schema     | Description                                |
| ---------- | ------------------------------------------ |
| `sales`    | Sales domain                               |
| `product`  | Product domain                             |
| `customer` | Customer-related entities                  |
| `shared`   | Conformed dimensions shared across domains |
| `dq`       | Data quality checks and audit logs         |
| `cfg`      | Configuration & metadata                   |

---

## 3. Table Naming

### 3.1 Staging Tables (STG)

* Tables **keep original OLTP names**
* No prefixes
* Case and column naming may follow source system

Pattern:

```
<schema>.<source_table>
```

Example:

```
AdventureWorks_STG.Sales.SalesPerson
```

---

### 3.2 Dimension Tables (DWH)

Pattern:

```
<domain_schema>.dim_<entity>
```

Examples:

```
AdventureWorks_DWH.sales.dim_salesperson
AdventureWorks_DWH.product.dim_product
AdventureWorks_DWH.shared.dim_date
```

Rules:

* All dimensions use `dim_` prefix
* **Conformed dimensions exist only once physically**

---

### 3.3 Fact Tables (DWH)

Pattern:

```
<domain_schema>.fact_<business_process>
```

Examples:

```
AdventureWorks_DWH.sales.fact_sales
```

Rules:

* Fact tables represent a **business process**
* Grain must be explicitly defined

---

## 4. Column Naming

### 4.1 Keys

| Type          | Pattern        | Example        |
| ------------- | -------------- | -------------- |
| Surrogate Key | `<entity>_key` | `customer_key` |
| Business Key  | `<entity>_id`  | `customer_id`  |

---

### 4.2 Date Columns

Pattern:

```
<event>_dt
```

Examples:

```
order_dt
ship_dt
```

---

### 4.3 Flags

Pattern:

```
is_<condition>
```

Example:

```
is_current
is_active
```

---

### 4.4 Measures

| Type       | Suffix | Example        |
| ---------- | ------ | -------------- |
| Amount     | `_amt` | `sales_amt`    |
| Quantity   | `_qty` | `order_qty`    |
| Percentage | `_pct` | `discount_pct` |

---

## 5. SCD (Slowly Changing Dimension) Columns

Mandatory for SCD Type 2 dimensions:

```
effective_start_dt
effective_end_dt
is_current
```

---

## 6. Stored Procedures

Pattern:

```
usp_<layer>_<action>_<entity>
```

Examples:

```
usp_stg_load_salesperson
usp_dwh_load_dim_customer
usp_dwh_load_fact_sales
```

---

## 7. Views

Pattern:

```
vw_<layer>_<purpose>
```

Examples:

```
vw_dwh_sales_analysis
vw_mart_sales_summary
```

---

## 8. Indexes

Pattern:

```
ix_<table>_<column>
```

Example:

```
ix_dim_customer_customer_id
```

---

## 9. Constraints

| Type        | Pattern                            |
| ----------- | ---------------------------------- |
| Primary Key | `pk_<table_name>`                  |
| Foreign Key | `fk_<table_name>_<ref_table_name>` |

---

## 10. File Naming

SQL and pipeline files must follow numeric ordering:

```
00_create_schemas.sql
01_create_tables.sql
02_load_staging.sql
03_load_dimensions.sql
04_load_facts.sql
```

---

## 11. Enforcement

* All new objects **must follow this standard**
* Violations must be corrected before merge
* Exceptions require explicit documentation and approval

---

**Status:** Approved (Domain Schema + Kimball-Compatible)
