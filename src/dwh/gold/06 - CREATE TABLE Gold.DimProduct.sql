USE AdventureWorks_DWH
GO

CREATE TABLE Gold.DimProduct (
    ProductKey                  INT IDENTITY(1,1)   NOT NULL,
    ProductID                   INT                 NOT NULL,
    ProductName                 NVARCHAR(100)       NOT NULL,
    ProductNumber               NVARCHAR(50)        NOT NULL,
    Color                       NVARCHAR(30)        NULL,
    StandardCost                DECIMAL(18,2)       NOT NULL,
    ListPrice                   DECIMAL(18,2)       NOT NULL,
    Size                        NVARCHAR(10)        NULL,
    Weight                      DECIMAL(18,2)       NULL,
    ProductLine                 NCHAR(2)            NULL,
    Class                       NCHAR(2)            NULL,
    Style                       NCHAR(2)            NULL,
    SellStartDate               DATE                NOT NULL,
    SellEndDate                 DATE                NULL,
    ValidFrom                   DATETIME2(0)        NOT NULL,
    ValidTo                     DATETIME2(0)        NULL,
    IsCurrent                   BIT                 NOT NULL DEFAULT 1,
    DWH_LoadDatetime            DATETIME2(0)        NOT NULL,
    DWH_AuditId                 INT                 NOT NULL,
    CONSTRAINT PK_Gold_DimProduct PRIMARY KEY (ProductKey)
);
GO