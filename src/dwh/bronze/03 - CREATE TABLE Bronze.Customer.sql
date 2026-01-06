USE AdventureWorks_DWH
GO

CREATE TABLE Bronze.Customer (
    CustomerID      INT              NOT NULL,
    PersonID        INT              NULL,
    StoreID         INT              NULL,
    TerritoryID     INT              NULL,
    AccountNumber   VARCHAR(10)      NOT NULL,
    RowGuid         UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate    DATETIME          NOT NULL,
    BRZ_LoadDatetime DATETIME2(3)     NOT NULL DEFAULT GETDATE(),
    BRZ_AuditId      INT              NOT NULL
)
GO