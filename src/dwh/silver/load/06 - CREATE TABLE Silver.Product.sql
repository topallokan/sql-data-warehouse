USE AdventureWorks_DWH
GO

CREATE TABLE Silver.Product (
    ProductID                   INT                 NOT NULL,
    ProductName                 NVARCHAR(100)       NOT NULL,
    ProductNumber               NVARCHAR(50)        NOT NULL,
    MakeFlag                    BIT                 NOT NULL,
    FinishedGoodsFlag           BIT                 NOT NULL,
    Color                       NVARCHAR(30)        NULL,
    SafetyStockLevel            SMALLINT            NOT NULL,
    ReorderPoint                SMALLINT            NOT NULL,
    StandardCost                DECIMAL(18,2)       NOT NULL,
    ListPrice                   DECIMAL(18,2)       NOT NULL,
    Size                        NVARCHAR(10)        NULL,
    SizeUnitMeasureCode         NCHAR(3)            NULL,
    WeightUnitMeasureCode       NCHAR(3)            NULL,
    Weight                      DECIMAL(18,2)       NULL,
    DaysToManufacture           INT                 NOT NULL,
    ProductLine                 NCHAR(2)            NULL,
    Class                       NCHAR(2)            NULL,
    Style                       NCHAR(2)            NULL,
    ProductSubcategoryID        INT                 NULL,
    ProductModelID              INT                 NULL,
    SellStartDate               DATE                NOT NULL,
    SellEndDate                 DATE                NULL,
    DiscontinuedDate            DATE                NULL,
    ModifiedDate                DATETIME            NOT NULL,
    DWH_LoadDatetime            DATETIME2(7)        NOT NULL DEFAULT GETDATE(),
    DWH_AuditId                 INT                 NOT NULL,
    CONSTRAINT PK_Silver_Product PRIMARY KEY (ProductID)
)
GO