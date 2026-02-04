USE AdventureWorks_DWH
GO

CREATE TABLE Gold.FactSales (
    SalesSK                    INT IDENTITY(1,1) NOT NULL,
    SalesOrderID               INT               NOT NULL,
    SalesOrderDetailID         INT               NOT NULL,
    CustomerID                 INT               NOT NULL,
    ProductID                  INT               NOT NULL,
    SalesPersonID              INT               NULL,
    TerritoryID                INT               NULL,
    SpecialOfferID             INT               NOT NULL,
    OrderDate                  DATE              NOT NULL,
    DueDate                    DATE              NOT NULL,
    ShipDate                   DATE              NULL,
    Status                     TINYINT           NOT NULL,
    SalesOrderNumber           NVARCHAR(50)      NOT NULL,
    PurchaseOrderNumber        NVARCHAR(50)      NULL,
    AccountNumber              NVARCHAR(30)      NULL,
    CarrierTrackingNumber      NVARCHAR(50)      NULL,
    OrderQty                   SMALLINT          NOT NULL,
    UnitPrice                  DECIMAL(18,2)     NOT NULL,
    UnitPriceDiscount          DECIMAL(18,2)     NOT NULL,
    LineTotal                  DECIMAL(18,2)     NOT NULL,
    SubTotal                   DECIMAL(18,2)     NOT NULL,
    TaxAmount                  DECIMAL(18,2)     NOT NULL,
    Freight                    DECIMAL(18,2)     NOT NULL,
    TotalDue                   DECIMAL(18,2)     NOT NULL,
    DWH_LoadDatetime           DATETIME2(7)      NOT NULL DEFAULT GETDATE(),
    DWH_ExecutionDate          DATE              NOT NULL,
    CONSTRAINT PK_Gold_FactSales PRIMARY KEY (SalesSK)
);
GO

-- Performance index for date-based filtering and Power BI connectivity
CREATE INDEX IX_Gold_FactSales_OrderDate ON Gold.FactSales (OrderDate);
GO