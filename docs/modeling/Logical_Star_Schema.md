# Logical Star Schema Model

This document defines the logical star schema model derived from the
business entities and domains identified in previous steps.
The model is technology-agnostic and serves as the foundation for
physical data warehouse implementation.

---

## Core Fact Table

### Fact: Sales Order Line

The Sales Order Line fact represents product-level sales transactions
and serves as the central fact table of the analytical model.

**Grain:**  
One record represents one product sold within a single customer order
at a specific point in time.

---

## Measures

The following measures are available at the sales order line grain:

- Order Quantity
- Unit Price
- Unit Price Discount
- Line Total
- Tax Amount *(derived from order header)*
- Freight Amount *(allocated from order header, if required)*

All measures are additive unless otherwise stated.

---

## Dimensions

### DimCustomer
Describes the customer placing the order.

Key attributes:
- Customer Identifier
- Customer Type (Individual / Store)
- Account Number
- Person / Store Indicator

---

### DimProduct
Describes the product being sold.

Key attributes:
- Product Identifier
- Product Name
- Product Category
- Product Subcategory
- Product Color
- Standard Cost
- List Price

---

### DimDate
Describes the date on which the transaction occurred.

Key attributes:
- Date
- Year
- Quarter
- Month
- Day of Month
- Day of Week

---

### DimGeography
Describes the geographic location associated with the customer.

Key attributes:
- Address
- City
- State / Province
- Country
- Postal Code

---

### DimSalesPerson
Describes the salesperson responsible for the sale.

Key attributes:
- Salesperson Identifier
- Sales Territory
- Sales Quota
- Bonus
- Commission Percentage

---

## Fact to Dimension Relationships

The Sales Order Line fact table is related to the following dimensions:

- FactSalesOrderLine → DimCustomer
- FactSalesOrderLine → DimProduct
- FactSalesOrderLine → DimDate
- FactSalesOrderLine → DimGeography
- FactSalesOrderLine → DimSalesPerson

Each relationship represents a many-to-one relationship from the fact
table to the corresponding dimension.

---

## Design Notes

- The star schema is centered on a single, line-level sales fact to maximize analytical flexibility.
- Sales order header data is treated as a supporting source and is integrated into the fact table where analytically relevant.
- Physical design considerations such as surrogate keys, indexing, partitioning, and slowly changing dimensions are intentionally excluded from this document and will be addressed in later phases.
