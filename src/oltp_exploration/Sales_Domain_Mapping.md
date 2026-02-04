## Sales Domain Mapping (OLTP to DWH)

| DWH Role | DWH Table Name | OLTP Source Schema | OLTP Source Table | Primary Keys (OLTP) | Key Foreign Keys (OLTP) | Key Features / Measures to Extract |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Fact** | **FactSales** | `Sales` | `SalesOrderHeader` | `SalesOrderID` | `CustomerID`, `BillToAddressID`, `ShipToAddressID`, `SalesPersonID`, `CurrencyRateID` | `OrderDate`, `DueDate`, `ShipDate`, `SubTotal`, `TaxAmt`, `Freight`, `TotalDue` |
| **Fact Lines** | *(Joined to FactSales)* | `Sales` | `SalesOrderDetail` | `SalesOrderID`, `SalesOrderDetailID` | `ProductID`, `SpecialOfferID` | `OrderQty`, `UnitPrice`, `UnitPriceDiscount`, `LineTotal` |
| **Dimension** | **DimCustomer** | `Sales` | `Customer` | `CustomerID` | `PersonID`, `StoreID`, `TerritoryID` | `AccountNumber`, `EmailPromotion` |
| **Dimension** | **DimPerson** | `Person` | `Person` | `BusinessEntityID` | N/A | `FirstName`, `LastName`, `MiddleName`, `PersonType` |
| **Dimension** | **DimProduct** | `Production` | `Product` | `ProductID` | `ProductSubcategoryID`, `ProductModelID` | `Name`, `ProductNumber`, `Color`, `ListPrice`, `StandardCost` |
| **Dimension** | **DimGeography** | `Person` | `Address` | `AddressID` | `StateProvinceID` | `AddressLine1`, `City`, `PostalCode` |
| **Dimension** | **DimSalesPerson** | `Sales` | `SalesPerson` | `BusinessEntityID` | `TerritoryID` | `SalesQuota`, `Bonus`, `CommissionPct`, `SalesYTD` |