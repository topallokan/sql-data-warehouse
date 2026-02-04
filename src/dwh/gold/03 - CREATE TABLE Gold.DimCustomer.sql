USE AdventureWorks_DWH
GO

CREATE TABLE Gold.DimCustomer (
    CustomerKey         INT IDENTITY(1,1)   NOT NULL,
    CustomerID          INT                 NOT NULL,
    PersonID            INT                 NULL,
    StoreID             INT                 NULL,
    TerritoryID         INT                 NULL,
    AccountNumber       VARCHAR(10)         NOT NULL,
    DWH_LoadDatetime    DATETIME2(0)        NOT NULL,
    DWH_AuditId         INT                 NOT NULL,
    CONSTRAINT PK_Gold_DimCustomer PRIMARY KEY (CustomerKey)
);
GO