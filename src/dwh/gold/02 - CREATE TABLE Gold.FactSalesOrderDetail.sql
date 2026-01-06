USE AdventureWorks_DWH
GO

CREATE TABLE Gold.FactSalesOrderDetail (
    SalesOrderDetailKey     INT IDENTITY(1,1)   NOT NULL,
    SalesOrderID            INT                 NOT NULL,
    SalesOrderDetailID      INT                 NOT NULL,
    ProductKey              INT                 NOT NULL,
    CarrierTrackingNumber   NVARCHAR(50)        NULL,
    OrderQty                SMALLINT            NOT NULL,
    ProductID               INT                 NOT NULL,
    SpecialOfferID          INT                 NOT NULL,
    UnitPrice               DECIMAL(18,2)       NOT NULL,
    UnitPriceDiscount       DECIMAL(18,2)       NOT NULL,
    LineTotal               DECIMAL(18,2)       NOT NULL,
    DWH_LoadDatetime        DATETIME2(0)        NOT NULL,
    DWH_AuditId             INT                 NOT NULL,
    CONSTRAINT PK_Gold_FactSalesOrderDetail PRIMARY KEY (SalesOrderDetailKey)
);
GO