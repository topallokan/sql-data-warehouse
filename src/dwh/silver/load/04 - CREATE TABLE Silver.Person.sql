USE AdventureWorks_DWH
GO

CREATE TABLE Silver.Person (
    BusinessEntityID        INT                 NOT NULL,
    PersonType              NCHAR(2)            NOT NULL,
    NameStyle               BIT                 NOT NULL,
    Title                   NVARCHAR(16)        NULL,
    FirstName               NVARCHAR(100)       NOT NULL,
    MiddleName              NVARCHAR(100)       NULL,
    LastName                NVARCHAR(100)       NOT NULL,
    Suffix                  NVARCHAR(20)        NULL,
    EmailPromotion          INT                 NOT NULL,
    ModifiedDate            DATETIME            NOT NULL,
    DWH_LoadDatetime        DATETIME2(0)        NOT NULL DEFAULT GETDATE(),
    DWH_AuditId             INT                 NOT NULL,
    CONSTRAINT PK_Silver_Person PRIMARY KEY (BusinessEntityID)
);
GO