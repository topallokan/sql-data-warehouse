# 📦 AdventureWorks Sales ERD Diagram

A visual representation of the Sales schema and its relationships.

---

```mermaid
erDiagram
    Sales_SalesOrderHeader ||--o{ Sales_SalesOrderDetail : "contains"
    Sales_SalesOrderHeader }|--|| Sales_Customer : "placed_by"
    Sales_SalesOrderHeader }|--|| Sales_SalesPerson : "managed_by"
    Sales_SalesOrderHeader }|--o{ Person_Address : "shipped_to"
    Sales_SalesOrderHeader }|--o{ Person_Address : "billed_to"
    Sales_SalesOrderDetail }|--|| Production_Product : "references"
    Sales_Customer }|--|| Person_Person : "is_related_to"

    Sales_SalesOrderHeader {
        int SalesOrderID PK
        int CustomerID FK
        int SalesPersonID FK
        int ShipToAddressID FK
        int BillToAddressID FK
        date OrderDate
        decimal TotalDue
    }

    Sales_SalesOrderDetail {
        int SalesOrderID PK, FK
        int SalesOrderDetailID PK
        int ProductID FK
        int OrderQty
        decimal LineTotal
    }

    Sales_Customer {
        int CustomerID PK
        int PersonID FK
        int TerritoryID FK
        string AccountNumber
    }

    Production_Product {
        int ProductID PK
        string Name
        decimal ListPrice
    }

    Sales_SalesPerson {
        int BusinessEntityID PK
        string SalesYTD
    }

    Person_Address {
        int AddressID PK
        string AddressLine1
        string City
    }

    Person_Person {
        int BusinessEntityID PK
        string FirstName
        string LastName
    }
