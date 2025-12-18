/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE 
        @start_time DATETIME,
        @end_time DATETIME,
        @batch_start_time DATETIME,
        @batch_end_time DATETIME;

    BEGIN TRY
        BEGIN TRAN; 

        SET @batch_start_time = GETDATE();

        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';

        ---------------- CRM ----------------
        PRINT 'Loading CRM Tables';

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_cust_info;

        BULK INSERT bronze.crm_cust_info
        FROM 'D:\DATA ENGINEER\SQL\data-warehouse-project\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0d0a',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'crm_cust_info loaded in ' 
              + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_prd_info;

        BULK INSERT bronze.crm_prd_info
        FROM 'D:\DATA ENGINEER\SQL\data-warehouse-project\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0d0a',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'crm_prd_info loaded in ' 
              + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' sec';

        ------------------------------------------------

        SET @start_time = GETDATE();
        TRUNCATE TABLE bronze.crm_sales_details;

        BULK INSERT bronze.crm_sales_details
        FROM 'D:\DATA ENGINEER\SQL\data-warehouse-project\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0d0a',
            TABLOCK
        );

        SET @end_time = GETDATE();
        PRINT 'crm_sales_details loaded in ' 
              + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' sec';

        ---------------- ERP ----------------
        PRINT 'Loading ERP Tables';

        TRUNCATE TABLE bronze.erp_loc_a101;
        BULK INSERT bronze.erp_loc_a101
        FROM 'D:\DATA ENGINEER\SQL\data-warehouse-project\datasets\source_erp\loc_a101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0d0a',
            TABLOCK
        );

        TRUNCATE TABLE bronze.erp_cust_az12;
        BULK INSERT bronze.erp_cust_az12
        FROM 'D:\DATA ENGINEER\SQL\data-warehouse-project\datasets\source_erp\cust_az12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0d0a',
            TABLOCK
        );

        TRUNCATE TABLE bronze.erp_px_cat_g1v2;
        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'D:\DATA ENGINEER\SQL\data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '0x0d0a',
            TABLOCK
        );

        COMMIT TRAN;  -- ⭐

        SET @batch_end_time = GETDATE();
        PRINT '==========================================';
        PRINT 'Bronze Load Completed Successfully';
        PRINT 'Total Duration: ' 
              + CAST(DATEDIFF(SECOND, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' sec';
        PRINT '==========================================';

    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;  -- ⭐

        PRINT '==========================================';
        PRINT 'BRONZE LOAD FAILED';
        PRINT ERROR_MESSAGE();
        PRINT 'Error Number: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State : ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '==========================================';

        THROW; -- ⭐ để pipeline / caller biết fail
    END CATCH
END;

SELECT * FROM bronze.crm_cust_info;
