USE AdventureWorks_DWH
GO

CREATE TABLE Silver.SalesOrderHeader (
    SalesOrderID               INT               NOT NULL,
    RevisionNumber             TINYINT           NOT NULL,
    OrderDate                  DATE              NOT NULL,
    DueDate                    DATE              NOT NULL,
    ShipDate                   DATE              NULL,
    Status                     TINYINT           NOT NULL,
    OnlineOrderFlag            BIT               NOT NULL,
    SalesOrderNumber           NVARCHAR(50)      NOT NULL,
    PurchaseOrderNumber        NVARCHAR(50)      NULL,
    AccountNumber              NVARCHAR(30)      NULL,
    CustomerID                 INT               NOT NULL,
    SalesPersonID              INT               NULL,
    TerritoryID                INT               NULL,
    BillToAddressID            INT               NOT NULL,
    ShipToAddressID            INT               NOT NULL,
    ShipMethodID               INT               NOT NULL,
    CreditCardID               INT               NULL,
    CreditCardApprovalCode     VARCHAR(15)       NULL,
    CurrencyRateID              INT               NULL,
    SubTotal                   DECIMAL(18,2)     NOT NULL,
    TaxAmount                  DECIMAL(18,2)     NOT NULL,
    Freight                    DECIMAL(18,2)     NOT NULL,
    TotalDue                   DECIMAL(18,2)     NOT NULL,
    Comment                    NVARCHAR(256)     NULL,
    ModifiedDate               DATETIME          NOT NULL,
    DWH_LoadDatetime           DATETIME2(7)      NOT NULL DEFAULT GETDATE(),
    DWH_AuditId                INT               NOT NULL,
    CONSTRAINT PK_Silver_SalesOrderHeader PRIMARY KEY (SalesOrderID)
);
GO