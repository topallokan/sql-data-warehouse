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
    LoadDatetime DATETIME2(3) NOT NULL,
    AuditId      INT          NOT NULL

) 
GO