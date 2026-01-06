USE AdventureWorks_DWH
GO

CREATE TABLE Bronze.SalesPerson (
    BusinessEntityID   INT                 NOT NULL,
    TerritoryID        INT                 NULL,
    SalesQuota         MONEY               NULL,
    Bonus              MONEY               NOT NULL,
    CommissionPct      SMALLMONEY          NOT NULL,
    SalesYTD           MONEY               NOT NULL,
    SalesLastYear      MONEY               NOT NULL,
    Rowguid            UNIQUEIDENTIFIER    NOT NULL,
    ModifiedDate       DATETIME            NOT NULL,
    BRZ_LoadDatetime   DATETIME2(3)        NOT NULL DEFAULT GETDATE(),
    BRZ_AuditId        INT                 NOT NULL
) 
GO