# Staging Data Lineage – AdventureWorks

This document shows the data lineage from **OLTP source tables** to **Staging (STG) tables** for the AdventureWorks project. It includes column mappings and any basic transformations applied during the ETL process.

---

## 1. Sales.SalesPerson

- `[OLTP: Sales.SalesPerson]` → `[STG: Sales.SalesPerson]`
  - `BusinessEntityID` → `BusinessEntityID`
  - `SalesQuota` → `SalesQuota`
  - `Bonus` → `Bonus`
  - `CommissionPct` → `CommissionPct`
  - `HireDate` → `HireDate`
  - `ModifiedDate` → `ModifiedDate`

---

## 2. Sales.SalesOrderHeader

- `[OLTP: Sales.SalesOrderHeader]` → `[STG: Sales.SalesOrderHeader]`
  - `SalesOrderID` → `SalesOrderID`
  - `CustomerID` → `CustomerID`
  - `OrderDate` → `OrderDate`
  - `ShipDate` → `ShipDate`
  - `Status` → `Status`
  - `TotalDue` → `TotalDue`
  - `ModifiedDate` → `ModifiedDate`

---

## 3. Sales.SalesOrderDetail

- `[OLTP: Sales.SalesOrderDetail]` → `[STG: Sales.SalesOrderDetail]`
  - `SalesOrderID` → `SalesOrderID`
  - `SalesOrderDetailID` → `SalesOrderDetailID`
  - `ProductID` → `ProductID`
  - `OrderQty` → `OrderQty`
  - `UnitPrice` → `UnitPrice`
  - `LineTotal` → `LineTotal`
  - `ModifiedDate` → `ModifiedDate`

---

## 4. Sales.Customer

- `[OLTP: Sales.Customer]` → `[STG: Sales.Customer]`
  - `CustomerID` → `CustomerID`
  - `PersonID` → `PersonID`
  - `StoreID` → `StoreID`
  - `TerritoryID` → `TerritoryID`
  - `AccountNumber` → `AccountNumber`
  - `ModifiedDate` → `ModifiedDate`

---

## 5. Production.Product

- `[OLTP: Production.Product]` → `[STG: Production.Product]`
  - `ProductID` → `ProductID`
  - `Name` → `Name`
  - `ProductNumber` → `ProductNumber`
  - `StandardCost` → `StandardCost`
  - `ListPrice` → `ListPrice`
  - `ModifiedDate` → `ModifiedDate`

---

## 6. Person.Person

- `[OLTP: Person.Person]` → `[STG: Person.Person]`
  - `BusinessEntityID` → `BusinessEntityID`
  - `FirstName` → `FirstName`
  - `LastName` → `LastName`
  - `MiddleName` → `MiddleName`
  - `EmailAddress` → `EmailAddress`
  - `ModifiedDate` → `ModifiedDate`

---

## 7. Person.Address

- `[OLTP: Person.Address]` → `[STG: Person.Address]`
  - `AddressID` → `AddressID`
  - `AddressLine1` → `AddressLine1`
  - `AddressLine2` → `AddressLine2`
  - `City` → `City`
  - `StateProvinceID` → `StateProvinceID`
  - `PostalCode` → `PostalCode`
  - `ModifiedDate` → `ModifiedDate`

---

> **Note:** This document represents a simplified column-level lineage. All staging tables retain the same data structure as the source OLTP tables, with minimal transformations applied (if any).
