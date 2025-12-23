USE AdventureWorks_STG
GO

CREATE TABLE Person.Person (
    BusinessEntityID        INT                 NOT NULL,
    PersonType              NCHAR(2)             NOT NULL,
    NameStyle               BIT                 NOT NULL,
    Title                   NVARCHAR(16)         NULL,
    FirstName               NVARCHAR(100)        NOT NULL,
    MiddleName              NVARCHAR(100)        NULL,
    LastName                NVARCHAR(100)        NOT NULL,
    Suffix                  NVARCHAR(20)         NULL,
    EmailPromotion          INT                 NOT NULL,
    AdditionalContactInfo   XML                 NULL,
    Demographics            XML                 NULL,
    RowGuid                 UNIQUEIDENTIFIER    NOT NULL,
    ModifiedDate            DATETIME            NOT NULL,
    LoadDatetime DATETIME2(3) NOT NULL,
    AuditId      INT          NOT NULL
)
