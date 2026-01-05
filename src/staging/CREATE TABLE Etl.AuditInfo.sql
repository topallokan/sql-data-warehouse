USE [AdventureWorks_STG]
GO

CREATE TABLE Etl.AuditInfo
(
    audit_id      BIGINT IDENTITY(1,1) NOT NULL,
    package_name  VARCHAR(100) NOT NULL,
    start_time    DATETIME2(0) NOT NULL,
    end_time      DATETIME2(0) NULL,
    status        VARCHAR(20) NOT NULL,
    error_message VARCHAR(4000) NULL,

    CONSTRAINT PK_AuditInfo
        PRIMARY KEY CLUSTERED (audit_id)
)

