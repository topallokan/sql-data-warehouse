USE AdventureWorks_DWH
GO

CREATE TABLE Gold.FactSalesOrderHeader (
    SalesOrderKey          INT IDENTITY(1,1)   NOT NULL,
    SalesOrderID           INT                 NOT NULL,
    RevisionNumber         TINYINT             NOT NULL,
    OrderDate              DATE                NOT NULL,
    DueDate                DATE                NOT NULL,
    ShipDate               DATE                NULL,
    Status                 TINYINT             NOT NULL,
    OnlineOrderFlag        BIT                 NOT NULL,
    SalesOrderNumber       NVARCHAR(50)        NOT NULL,
    PurchaseOrderNumber    NVARCHAR(50)        NULL,
    AccountNumber          NVARCHAR(30)        NULL,
    CustomerID             INT                 NOT NULL,
    SalesPersonID          INT                 NULL,
    TerritoryID            INT                 NULL,
    BillToAddressID        INT                 NOT NULL,
    ShipToAddressID        INT                 NOT NULL,
    ShipMethodID           INT                 NOT NULL,
    CreditCardID           INT                 NULL,
    SubTotal               DECIMAL(18,2)       NOT NULL,
    TaxAmount              DECIMAL(18,2)       NOT NULL,
    Freight                DECIMAL(18,2)       NOT NULL,
    TotalDue               DECIMAL(18,2)       NOT NULL,
    DWH_LoadDatetime       DATETIME2(0)        NOT NULL,
    DWH_AuditId            INT                 NOT NULL,
    CONSTRAINT PK_Gold_FactSalesOrderHeader PRIMARY KEY (SalesOrderKey)
);
GO