USE AdventureWorks_DWH
GO

CREATE TABLE Gold.DimSalesPerson (
    SalesPersonKey      INT IDENTITY(1,1)   NOT NULL,
    BusinessEntityID    INT                 NOT NULL,
    TerritoryID         INT                 NULL,
    SalesQuota          DECIMAL(18,2)       NULL,
    Bonus               DECIMAL(18,2)       NOT NULL,
    CommissionPct       DECIMAL(18,4)       NOT NULL,
    SalesYTD            DECIMAL(18,2)       NOT NULL,
    SalesLastYear       DECIMAL(18,2)       NOT NULL,
    ValidFrom           DATETIME2(0)        NOT NULL,
    ValidTo             DATETIME2(0)        NULL,
    IsCurrent           BIT                 NOT NULL DEFAULT 1,
    DWH_LoadDatetime    DATETIME2(0)        NOT NULL,
    DWH_AuditId         INT                 NOT NULL,
    CONSTRAINT PK_Gold_DimSalesPerson PRIMARY KEY (SalesPersonKey)
);
GO