USE AdventureWorks_DWH
GO

CREATE TABLE Bronze.Product (
    ProductID                   INT                 NOT NULL,
    Name                        NVARCHAR(100)       NOT NULL,
    ProductNumber               NVARCHAR(50)        NOT NULL,
    MakeFlag                    BIT                 NOT NULL,
    FinishedGoodsFlag           BIT                 NOT NULL,
    Color                       NVARCHAR(30)        NULL,
    SafetyStockLevel            SMALLINT            NOT NULL,
    ReorderPoint                SMALLINT            NOT NULL,
    StandardCost                DECIMAL(19,4)       NOT NULL,
    ListPrice                   DECIMAL(19,4)       NOT NULL,
    Size                        NVARCHAR(10)        NULL,
    SizeUnitMeasureCode         NCHAR(3)            NULL,
    WeightUnitMeasureCode       NCHAR(3)            NULL,
    Weight                      DECIMAL(8,2)        NULL,
    DaysToManufacture           INT                 NOT NULL,
    ProductLine                 NCHAR(2)            NULL,
    Class                       NCHAR(2)            NULL,
    Style                       NCHAR(2)            NULL,
    ProductSubcategoryID        INT                 NULL,
    ProductModelID              INT                 NULL,
    SellStartDate               DATETIME            NOT NULL,
    SellEndDate                 DATETIME            NULL,
    DiscontinuedDate            DATETIME            NULL,
    LoadDatetime DATETIME2(3) NOT NULL,
    AuditId      INT          NOT NULL
)
GO