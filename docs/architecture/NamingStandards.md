# Naming Standards

This document defines the official naming conventions for the Data Warehouse / Data Engineering project.  
These standards are mandatory across all layers to ensure consistency, clarity, and maintainability.

---

## 1. General Principles
- snake_case is mandatory  
- English only  
- Table names are singular  
- Avoid unnecessary abbreviations  
- Naming must clearly reflect layer and business meaning  

---

## 2. Schema Naming

| Layer | Schema | Description |
|------|--------|-------------|
| Staging | stg | Raw data landed from source systems |
| Bronze | brz | Raw but structured data |
| Silver | slv | Cleaned, normalized data |
| Gold | gld | Business-ready dimensional models |
| Data Quality | dq | Data quality checks and logs |
| Config | cfg | Configuration and metadata |

---

## 3. Table Naming

### 3.1 Staging Tables
Pattern:
```
stg_<source>_<entity>
```
Example:
```
stg_erp_salesorderheader
```

### 3.2 Bronze Tables
Pattern:
```
brz_<entity>
```
Example:
```
brz_salesorderheader
```

### 3.3 Silver Tables
Pattern:
```
slv_<entity>
```
Example:
```
slv_customer
```

### 3.4 Dimension Tables
Pattern:
```
dim_<entity>
```
Example:
```
dim_product
```

### 3.5 Fact Tables
Pattern:
```
fact_<business_process>
```
Example:
```
fact_sales
```

---

## 4. Column Naming

### 4.1 Keys

| Type | Pattern | Example |
|----|--------|--------|
| Surrogate Key | `<entity>_key` | customer_key |
| Business Key | `<entity>_id` | customer_id |

### 4.2 Date Columns
Pattern:
```
<event>_dt
```
Example:
```
order_dt
```

### 4.3 Flags
Pattern:
```
is_<condition>
```
Example:
```
is_active
```

### 4.4 Measures

| Type | Suffix |
|----|--------|
| Amount | _amt |
| Quantity | _qty |
| Percentage | _pct |

Example:
```
sales_amt
order_qty
```

---

## 5. SCD (Slowly Changing Dimension) Columns
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
Example:
```
usp_stg_load_salesorder
usp_slv_transform_customer
```

---

## 7. Views
Pattern:
```
vw_<layer>_<purpose>
```
Example:
```
vw_gld_sales_summary
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

| Type | Pattern |
|------|---------|
| Primary Key | `pk_<table_name>` |
| Foreign Key | `fk_<table_name>_<ref_table_name>` |

---

## 10. File Naming

SQL and pipeline files must follow numeric ordering:

- `00_create_schemas.sql`
- `01_create_tables.sql`
- `02_load_staging.sql`
- `03_transform_silver.sql`

---

## 11. Enforcement

- All new objects must follow this standard  
- Violations must be corrected before merge  
- Exceptions require documentation  

---

**Status:** Approved

