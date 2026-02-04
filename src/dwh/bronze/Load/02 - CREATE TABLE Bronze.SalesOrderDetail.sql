USE AdventureWorks_DWH
GO

CREATE TABLE Bronze.SalesOrderDetail (
    SalesOrderID            INT              NOT NULL,
    SalesOrderDetailID      INT              NOT NULL,
    CarrierTrackingNumber   NVARCHAR(50)     NULL,
    OrderQty                SMALLINT         NOT NULL,
    ProductID               INT              NOT NULL,
    SpecialOfferID          INT              NOT NULL,
    UnitPrice               DECIMAL(19,4)    NOT NULL,
    UnitPriceDiscount       DECIMAL(19,4)    NOT NULL,
    LineTotal               DECIMAL(38,6)    NOT NULL,
    RowGuid                 UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate            DATETIME         NOT NULL,
    LoadDatetime DATETIME2(3) NOT NULL,
    AuditId      INT          NOT NULL

)
GO