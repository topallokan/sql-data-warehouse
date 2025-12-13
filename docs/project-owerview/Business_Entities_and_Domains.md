\# Business Entities \& Domains



This document defines the core business entities and business domains derived

from the AdventureWorks OLTP system.  

The purpose of this step is to translate technical source tables into

business-understandable concepts before dimensional modeling.



---



\## Business Domains



The following business domains are identified based on the core sales

process of the organization:



\- Sales

\- Customer

\- Product

\- Geography

\- Time



---



\## Business Entities by Domain



\### Sales

\- Sales Order  

\- Sales Order Line  



\### Customer

\- Customer  

\- Person  



\### Product

\- Product  

\- Product Category  

\- Product Subcategory  



\### Geography

\- Address  

\- State / Province  

\- Country  



---



\## OLTP to Business Entity Mapping



| OLTP Schema | OLTP Table | Business Entity | Domain |

|------------|------------|-----------------|--------|

| Sales | SalesOrderHeader | Sales Order | Sales |

| Sales | SalesOrderDetail | Sales Order Line | Sales |

| Sales | Customer | Customer | Customer |

| Person | Person | Person | Customer |

| Production | Product | Product | Product |

| Person | Address | Address | Geography |



---



\## Business Entity Classification



Each business entity is classified based on its role within the analytical

model. This classification will guide fact and dimension design in later steps.



| Business Entity | Entity Type |

|-----------------|-------------|

| Sales Order | Transactional |

| Sales Order Line | Transactional |

| Customer | Descriptive |

| Person | Descriptive |

| Product | Descriptive |

| Address | Reference |



---



\## Transactional Entity Granularity



The grain of each transactional entity is defined to ensure clarity and

consistency before fact table design.



\### Sales Order

One record represents a single customer order placed at a specific point in time.



\### Sales Order Line

One record represents one product sold within a single customer order at a

specific point in time.



---



\## Notes



\- This document intentionally avoids physical table design, KPIs, or BI-specific concepts.

\- Fact and dimension tables will be defined in subsequent modeling phases.

\- Business entities defined here represent stable, business-level concepts.



