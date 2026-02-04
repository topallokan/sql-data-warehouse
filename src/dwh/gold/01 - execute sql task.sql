USE AdventureWorks_DWH
GO

CREATE PROCEDURE Gold.usp_PrepareFactSales
    @TargetDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    /* Ensures idempotency by removing existing records for the target date 
       before the SSIS Data Flow starts the insertion.
    */
    DELETE FROM Gold.FactSales 
    WHERE DWH_ExecutionDate = @TargetDate;
END
GO