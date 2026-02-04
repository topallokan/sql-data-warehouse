# Dimensions & Facts Scope Document

This document defines the final analytical scope of the data warehouse
by explicitly listing the attributes and measures included in the
fact and dimension tables. The purpose of this document is to freeze
the analytical model before physical implementation.

---

## Fact Table Scope

### FactSalesOrderLine

**Grain:**  
One record represents one product sold within a single customer order
at a specific point in time.

### Included Measures
- Order Quantity
- Unit Price
- Unit Price Discount
- Line Total
- Tax Amount *(derived from SalesOrderHeader)*
- Freight Amount *(allocated from SalesOrderHeader)*

### Excluded Measures
- Order Subtotal *(derivable from line totals)*
- Total Due *(derivable at order level)*

---

## Dimension Scope

### DimCustomer

**Business Meaning:**  
Represents the customer placing the sales order.

**Included Attributes:**
- Customer Identifier
- Customer Type (Individual / Store)
- Account Number
- Person / Store Indicator

**Excluded Attributes:**
- Credit Card Information
- Internal System Flags

**SCD Strategy:**  
Type 2 – customer attribute changes must be historically tracked.

---

### DimProduct

**Business Meaning:**  
Represents the product being sold.

**Included Attributes:**
- Product Identifier
- Product Name
- Product Category
- Product Subcategory
- Product Color
- Standard Cost
- List Price

**Excluded Attributes:**
- Product Image
- Long Text Descriptions

**SCD Strategy:**  
Type 2 – changes to product attributes must be historically tracked.

---

### DimDate

**Business Meaning:**  
Represents the calendar date of the transaction.

**Included Attributes:**
- Date
- Year
- Quarter
- Month
- Day of Month
- Day of Week

**Excluded Attributes:**
- Fiscal Calendar Attributes

**SCD Strategy:**  
Type 0 – static reference dimension.

---

### DimGeography

**Business Meaning:**  
Represents the geographic location of the customer.

**Included Attributes:**
- Address
- City
- State / Province
- Country
- Postal Code

**Excluded Attributes:**
- Latitude and Longitude

**SCD Strategy:**  
Type 2 – geographic changes must be historically tracked.

---

### DimSalesPerson

**Business Meaning:**  
Represents the salesperson responsible for the sale.

**Included Attributes:**
- Salesperson Identifier
- Sales Territory
- Sales Quota
- Bonus
- Commission Percentage

**Excluded Attributes:**
- Internal HR Attributes

**SCD Strategy:**  
Type 2 – salesperson attributes must be historically tracked.

---

## Design Constraints & Assumptions

- The model is designed for analytical reporting and dashboarding.
- Fact tables are maintained at the lowest possible grain.
- Dimensions are conformed and reusable across future data marts.
- Physical implementation details are intentionally excluded.
