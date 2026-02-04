USE [AdventureWorks_STG]
GO

CREATE TABLE Etl.AuditInfo
(
    AuditId      BIGINT IDENTITY(1,1) NOT NULL,
    PackageName  VARCHAR(100) NOT NULL,
    StartTime    DATETIME2(0) NOT NULL,
    EndTime      DATETIME2(0) NULL,
    Status        VARCHAR(20) NOT NULL,
    Error_Message VARCHAR(4000) NULL,

    CONSTRAINT PK_AuditInfo
        PRIMARY KEY CLUSTERED (audit_id)
)

