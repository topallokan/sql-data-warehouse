USE AdventureWorks_DWH
GO

CREATE TABLE Gold.DimAddress (
    AddressKey          INT IDENTITY(1,1)   NOT NULL,
    AddressID           INT                 NOT NULL,
    AddressLine1        NVARCHAR(120)       NOT NULL,
    AddressLine2        NVARCHAR(120)       NULL,
    City                NVARCHAR(60)        NOT NULL,
    StateProvinceID     INT                 NOT NULL,
    PostalCode          NVARCHAR(30)        NOT NULL,
    DWH_LoadDatetime    DATETIME2(0)        NOT NULL,
    DWH_AuditId         INT                 NOT NULL,
    CONSTRAINT PK_Gold_DimAddress PRIMARY KEY (AddressKey)
);
GO