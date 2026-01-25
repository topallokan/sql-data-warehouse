USE AdventureWorks_DWH
GO

CREATE TABLE Silver.SalesOrderDetail (
    SalesOrderID            INT              NOT NULL,
    SalesOrderDetailID      INT              NOT NULL,
    CarrierTrackingNumber   NVARCHAR(50)     NULL,
    OrderQty                SMALLINT         NOT NULL,
    ProductID               INT              NOT NULL,
    SpecialOfferID          INT              NOT NULL,
    UnitPrice               DECIMAL(18,2)    NOT NULL,
    UnitPriceDiscount       DECIMAL(18,2)    NOT NULL,
    LineTotal               DECIMAL(18,2)    NOT NULL,
    ModifiedDate            DATETIME         NOT NULL,
    DWH_LoadDatetime        DATETIME2(0)     NOT NULL DEFAULT GETDATE(),
    DWH_AuditId             INT              NOT NULL,
    CONSTRAINT PK_Silver_SalesOrderDetail PRIMARY KEY (SalesOrderID, SalesOrderDetailID)
);
GO