USE AdventureWorks_DWH
GO

CREATE TABLE Silver.Address (
    AddressID           INT                 NOT NULL,
    AddressLine1        NVARCHAR(120)       NOT NULL,
    AddressLine2        NVARCHAR(120)       NULL,
    City                NVARCHAR(60)        NOT NULL,
    StateProvinceID     INT                 NOT NULL,
    PostalCode          NVARCHAR(30)        NOT NULL,
    ModifiedDate        DATETIME            NOT NULL,
    DWH_LoadDatetime    DATETIME2(7)        NOT NULL DEFAULT GETDATE(),
    DWH_AuditId         INT                 NOT NULL,
    CONSTRAINT PK_Silver_Address PRIMARY KEY (AddressID)
);
GO