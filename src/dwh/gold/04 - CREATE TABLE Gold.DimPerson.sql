USE AdventureWorks_DWH
GO

CREATE TABLE Gold.DimPerson (
    PersonKey           INT IDENTITY(1,1)   NOT NULL,
    BusinessEntityID    INT                 NOT NULL,
    PersonType          NCHAR(2)            NOT NULL,
    Title               NVARCHAR(16)        NULL,
    FirstName           NVARCHAR(100)       NOT NULL,
    MiddleName          NVARCHAR(100)       NULL,
    LastName            NVARCHAR(100)       NOT NULL,
    Suffix              NVARCHAR(20)        NULL,
    EmailPromotion      INT                 NOT NULL,
    DWH_LoadDatetime    DATETIME2(0)        NOT NULL,
    DWH_AuditId         INT                 NOT NULL,
    CONSTRAINT PK_Gold_DimPerson PRIMARY KEY (PersonKey)
);
GO