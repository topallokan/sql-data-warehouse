USE AdventureWorks_DWH
GO

CREATE TABLE Bronze.Address (
    AddressID           INT                 NOT NULL,
    AddressLine1        NVARCHAR(120)       NOT NULL,
    AddressLine2        NVARCHAR(120)       NULL,
    City                NVARCHAR(60)        NOT NULL,
    StateProvinceID     INT                 NOT NULL,
    PostalCode          NVARCHAR(30)        NOT NULL,
    SpatialLocation     GEOGRAPHY           NULL,
    RowGuid             UNIQUEIDENTIFIER    NOT NULL,
    ModifiedDate        DATETIME            NOT NULL,
    BRZ_LoadDatetime    DATETIME2(3)        NOT NULL DEFAULT GETDATE(),
    BRZ_AuditId         INT                 NOT NULL
)
GO