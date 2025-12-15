\# Naming Standards



This document defines the official naming conventions for the Data Warehouse / Data Engineering project.

These standards are mandatory across all layers to ensure consistency, clarity, and maintainability.



---



\## 1. General Principles

\- snake\_case is mandatory

\- English only

\- Table names are singular

\- Avoid unnecessary abbreviations

\- Naming must clearly reflect layer and business meaning



---



\## 2. Schema Naming



| Layer | Schema | Description |

|------|--------|-------------|

| Staging | stg | Raw data landed from source systems |

| Bronze | brz | Raw but structured data |

| Silver | slv | Cleaned, normalized data |

| Gold | gld | Business-ready dimensional models |

| Data Quality | dq | Data quality checks and logs |

| Config | cfg | Configuration and metadata |



---



\## 3. Table Naming



\### 3.1 Staging Tables

Pattern:

```

stg\_<source>\_<entity>

```

Example:

```

stg\_erp\_salesorderheader

```



\### 3.2 Bronze Tables

Pattern:

```

brz\_<entity>

```

Example:

```

brz\_salesorderheader

```



\### 3.3 Silver Tables

Pattern:

```

slv\_<entity>

```

Example:

```

slv\_customer

```



\### 3.4 Dimension Tables

Pattern:

```

dim\_<entity>

```

Example:

```

dim\_product

```



\### 3.5 Fact Tables

Pattern:

```

fact\_<business\_process>

```

Example:

```

fact\_sales

```



---



\## 4. Column Naming



\### 4.1 Keys



| Type | Pattern | Example |

|----|--------|--------|

| Surrogate Key | <entity>\_key | customer\_key |

| Business Key | <entity>\_id | customer\_id |



\### 4.2 Date Columns

Pattern:

```

<event>\_dt

```

Example:

```

order\_dt

```



\### 4.3 Flags

Pattern:

```

is\_<condition>

```

Example:

```

is\_active

```



\### 4.4 Measures



| Type | Suffix |

|----|--------|

| Amount | \_amt |

| Quantity | \_qty |

| Percentage | \_pct |



Example:

```

sales\_amt

order\_qty

```



---



\## 5. SCD (Slowly Changing Dimension) Columns

```

effective\_start\_dt

effective\_end\_dt

is\_current

```



---



\## 6. Stored Procedures

Pattern:

```

usp\_<layer>\_<action>\_<entity>

```

Example:

```

usp\_stg\_load\_salesorder

usp\_slv\_transform\_customer

```



---



\## 7. Views

Pattern:

```

vw\_<layer>\_<purpose>

```

Example:

```

vw\_gld\_sales\_summary

```



---



\## 8. Indexes

Pattern:

```

ix\_<table>\_<column>

```

Example:

```

ix\_dim\_customer\_customer\_id

```



---



\## 9. Constraints



| Type | Pattern |

|----|--------|

| Primary Key | pk\_<table> |

| Foreign Key | fk\_<table>\_<ref\_table> |



---



\## 10. File Naming



SQL and pipeline files must follow numeric ordering:

```

00\_create\_schemas.sql

01\_create\_tables.sql

02\_load\_staging.sql

03\_transform\_silver.sql

```



---



\## 11. Enforcement

\- All new objects must follow this standard

\- Violations must be corrected before merge

\- Exceptions require documentation



---



Status: Approved



