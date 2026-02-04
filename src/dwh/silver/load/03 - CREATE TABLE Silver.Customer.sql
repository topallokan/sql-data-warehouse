USE AdventureWorks_DWH
GO

CREATE TABLE Silver.Customer (
    CustomerID      INT              NOT NULL,
    PersonID        INT              NULL,
    StoreID         INT              NULL,
    TerritoryID     INT              NULL,
    AccountNumber   VARCHAR(10)      NOT NULL,
    ModifiedDate    DATETIME         NOT NULL,
    DWH_LoadDatetime DATETIME2(7)    NOT NULL DEFAULT GETDATE(),
    DWH_AuditId      INT             NOT NULL,
    CONSTRAINT PK_Silver_Customer PRIMARY KEY (CustomerID)
);
GO