USE AdventureWorks_DWH
GO

CREATE TABLE Silver.SalesPerson (
    BusinessEntityID   INT                 NOT NULL,
    TerritoryID        INT                 NULL,
    SalesQuota         DECIMAL(18,2)       NULL,
    Bonus              DECIMAL(18,2)       NOT NULL,
    CommissionPct      DECIMAL(18,4)       NOT NULL,
    SalesYTD           DECIMAL(18,2)       NOT NULL,
    SalesLastYear      DECIMAL(18,2)       NOT NULL,
    ModifiedDate       DATETIME            NOT NULL,
    DWH_LoadDatetime   DATETIME2(7)        NOT NULL DEFAULT GETDATE(),
    DWH_AuditId        INT                 NOT NULL,
    CONSTRAINT PK_Silver_SalesPerson PRIMARY KEY (BusinessEntityID)
)
GO