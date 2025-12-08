# 🧪 Data Quality Rules — Sales Domain (OLTP → DWH)

This document defines the complete **Data Quality (DQ) rules** for the AdventureWorks Sales Domain within the Data Warehouse environment.  
The rules cover fact tables, dimension tables, relationships, business validations, and referential checks.

---

# 📌 1. Data Quality Framework

Data Quality rules are categorized into the following control types:

- **Null Check**
- **Primary Key Uniqueness Check**
- **Foreign Key Integrity Check**
- **Domain Check**
- **Pattern / Format Check**
- **Range / Threshold Check**
- **Business Rule Check**
- **Transformation Validation**
- **Duplicate Check**

---

# 📦 2. Fact Table DQ Rules

## 2.1 FactSales (SalesOrderHeader)

### 🔑 Primary Key Rules
| Field | Rule |
|-------|------|
| SalesOrderID | Must not be NULL |
| SalesOrderID | Must be unique |

### 🔗 Foreign Key Integrity
| Field | Target Table | Rule |
|-------|--------------|------|
| CustomerID | DimCustomer | Must exist |
| SalesPersonID | DimSalesPerson | Must exist |
| BillToAddressID | DimGeography | Must exist |
| ShipToAddressID | DimGeography | Must exist |
| CurrencyRateID | DimCurrencyRate (if applicable) | Must exist or be NULL |

### 📅 Date Validations
| Field | Validation |
|-------|------------|
| OrderDate | Must not be NULL |
| DueDate | Must be >= OrderDate |
| ShipDate | Must be >= OrderDate |

### 💰 Financial Integrity Rules
| Measure | Rule |
|---------|------|
| SubTotal | >= 0 |
| TaxAmt | >= 0 |
| Freight | >= 0 |
| TotalDue | Must equal `SubTotal + TaxAmt + Freight` |

### ⚠ Additional Controls
- Outlier detection on SubTotal / Freight / TaxAmt  
- Null CurrencyRateID flagged as informational  
- Negative total amounts are not allowed  

---

## 2.2 FactSalesOrderDetail (SalesOrderDetail)

### 🔑 Primary Key Rules
| Field | Rule |
|--------|------|
| (SalesOrderID + SalesOrderDetailID) | Must be unique |
| Composite PK fields | Must not be NULL |

### 🔗 Foreign Key Rules
| Field | Target Table | Rule |
|--------|--------------|------|
| SalesOrderID | FactSales | Must exist |
| ProductID | DimProduct | Must exist |
| SpecialOfferID | DimSpecialOffer | Must exist |

### 📏 Measure Validations
| Field | Rule |
|--------|------|
| OrderQty | Must be > 0 |
| UnitPrice | Must be >= 0 |
| UnitPriceDiscount | Must be between 0 and 1 |
| LineTotal | Must equal `(UnitPrice * OrderQty) * (1 - UnitPriceDiscount)` |

---

# 🧱 3. Dimension Table DQ Rules

---

## 3.1 DimCustomer

### 🔑 PK Rules
- CustomerID must be unique and not NULL

### 🔗 FK Rules
| Field | Target | Rule |
|--------|--------|------|
| PersonID | DimPerson | Must exist |
| StoreID | DimStore | Must exist or be NULL |
| TerritoryID | DimSalesTerritory | Must exist |

### 📝 Attribute Rules
| Field | Rule |
|--------|------|
| AccountNumber | Must not be NULL and must follow the pattern `AW########` |
| EmailPromotion | Domain check: {0, 1, 2} |

---

## 3.2 DimPerson

### 🔑 PK Rules
- BusinessEntityID must be unique and not NULL

### 📝 Attribute Rules
| Field | Rule |
|--------|------|
| FirstName | Must not be NULL |
| LastName | Must not be NULL |
| PersonType | Must match domain {SC, IN, EM, SP, VC} |
| FirstName / LastName | Should contain alphabetic characters only |

---

## 3.3 DimProduct

### 🔑 PK Rules
- ProductID must be unique and not NULL

### 🔗 FK Rules
| Field | Rule |
|--------|------|
| ProductSubcategoryID | Must exist in DimProductSubcategory |
| ProductModelID | Must exist in DimProductModel |

### 📝 Attribute & Business Rules
| Field | Rule |
|--------|------|
| ListPrice | >= 0 |
| StandardCost | >= 0 |
| StandardCost | Must be <= ListPrice |
| Color | Must match valid domain values |
| ProductNumber | Must follow pattern `AA-0000` |

---

## 3.4 DimGeography

### 🔑 PK Rules
- AddressID must be unique

### 🔗 FK Rules
| Field | Target | Rule |
|--------|--------|------|
| StateProvinceID | DimStateProvince | Must exist |

### 📝 Attribute Rules
| Field | Rule |
|--------|------|
| AddressLine1 | Must not be NULL |
| City | Alphabetic validation |
| PostalCode | Must match postal code regex |

---

## 3.5 DimSalesPerson

### 🔑 PK Rules
- BusinessEntityID must be unique

### 🔗 FK Rules
| Field | Rule |
|--------|------|
| TerritoryID | Must exist in DimSalesTerritory |

### 📝 Numeric Rules
| Field | Rule |
|--------|------|
| SalesQuota | >= 0 |
| Bonus | >= 0 |
| CommissionPct | Between 0 and 1 |
| SalesYTD | >= 0 |

---

# 🛠 4. Data Quality Error Handling

Recommended structure:

### **DQ Error Tables**
- `DQ_FactSales_Errors`
- `DQ_SalesDetail_Errors`
- `DQ_DimCustomer_Errors`
- `DQ_DimProduct_Errors`
- …

### **Common Error Types**
- NULL value violations  
- Foreign key not found  
- Out-of-range values  
- Business rule mismatch  
- Pattern mismatch  
- Duplicate keys  

---

# 📁 5. Execution Sequence (Recommended)

1. Run **dimension table DQ** checks  
2. Run **fact table DQ** checks  
3. Run **cross-table FK** validations  
4. Validate business rules  
5. Log failures  
6. Generate optional **DQ Score**  

---

# ✅ 6. Summary

This document defines all required Data Quality rules for the Sales Domain during the OLTP → DWH ETL process.  
Applying these checks ensures high data accuracy, reliability, and compliance within the Data Warehouse environment.

