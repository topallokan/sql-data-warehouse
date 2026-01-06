USE AdventureWorks_DWH
GO

CREATE TABLE Bronze.SalesOrderHeader (
    SalesOrderID               INT               NOT NULL,
    RevisionNumber             TINYINT           NOT NULL,
    OrderDate                  DATETIME          NOT NULL,
    DueDate                    DATETIME          NOT NULL,
    ShipDate                   DATETIME          NULL,
    Status                     TINYINT           NOT NULL,
    OnlineOrderFlag            BIT               NOT NULL,
    SalesOrderNumber            NVARCHAR(50)     NOT NULL,
    PurchaseOrderNumber         NVARCHAR(50)     NULL,
    AccountNumber               NVARCHAR(30)     NULL,
    CustomerID                  INT              NOT NULL,
    SalesPersonID               INT              NULL,
    TerritoryID                 INT              NULL,
    BillToAddressID             INT              NOT NULL,
    ShipToAddressID             INT              NOT NULL,
    ShipMethodID                INT              NOT NULL,
    CreditCardID                INT              NULL,
    CreditCardApprovalCode      VARCHAR(15)      NULL,
    CurrencyRateID              INT              NULL,
    SubTotal                    DECIMAL(19,4)    NOT NULL,
    TaxAmt                      DECIMAL(19,4)    NOT NULL,
    Freight                     DECIMAL(19,4)    NOT NULL,
    TotalDue                    DECIMAL(19,4)    NOT NULL,
    Comment                     NVARCHAR(256)    NULL,
    RowGuid                     UNIQUEIDENTIFIER NOT NULL,
    ModifiedDate                DATETIME         NOT NULL,
    BRZ_LoadDatetime            DATETIME2(3)     NOT NULL DEFAULT GETDATE(),
    BRZ_AuditId                 INT              NOT NULL
)
GO