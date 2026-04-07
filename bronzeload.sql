use DataWarehouse;
GO
CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
DECLARE @start_time DATETIME, @end_time DATETIME;
BEGIN TRY

	PRINT '==============================';
	PRINT 'loading Bronze Layer';
	PRINT '==============================';

	PRINT'-----------------';
	PRINT'Loading crm Tables';
	PRINT'-----------------';

	SET @start_time=GETDATE();

	
	print'________________'
	print 'Truncating table';
	print'________________';

	TRUNCATE TABLE bronze.crm_cust_info;
	print'//////////////////////////';
	PRINT'INSERTING DATA TO TABLE';
	print'//////////////////////////';

	BULK INSERT bronze.crm_cust_info
	from 'C:\Users\sh\Downloads\Sql ultimate course\Warehouseproject\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	--SELECT  * FROM bronze.crm_cust_info
	--SELECT COUNT(*) FROM bronze.crm_cust_info

	SET @end_time=GETDATE();
	print'>> Load duaration:'+cast(DATEDIFF(second,@start_time,@end_time) As NVARCHAR )+'seconds';

	print'________________';
	print 'Truncating table';
	print'________________';


	TRUNCATE TABLE bronze.crm_prd_info;
	print'//////////////////////////';
	PRINT'INSERTING DATA TO TABLE';
	print'//////////////////////////';
	BULK INSERT bronze.crm_prd_info
	from 'C:\Users\sh\Downloads\Sql ultimate course\Warehouseproject\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	--SELECT *FROM bronze.crm_prd_info;
	--SELECT COUNT (*)FROM bronze.crm_prd_info;

	print'________________';
	print 'Truncating table';
	print'________________';

	TRUNCATE TABLE bronze.crm_sales_details;
	print'//////////////////////////';
	PRINT'INSERTING DATA TO TABLE';
	print'//////////////////////////';
	BULK INSERT bronze.crm_sales_details
	from 'C:\Users\sh\Downloads\Sql ultimate course\Warehouseproject\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	--SELECT * FROM bronze.crm_sales_details
	--SELECT COUNT(*) FROM bronze.crm_sales_details--

	PRINT'-----------------';
	PRINT'Loading ERP Tables';
	PRINT'-----------------';

	print'________________';
	print 'Truncating table';
	print'________________';


	TRUNCATE TABLE bronze.erp_cust_az12;
	print'//////////////////////////';
	PRINT'INSERTING DATA TO TABLE';
	print'//////////////////////////';
	BULK INSERT bronze.erp_cust_az12
	from 'C:\Users\sh\Downloads\Sql ultimate course\Warehouseproject\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
	with (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	--SELECT * FROM bronze.erp_cust_az12
	--SELECT COUNT(*) FROM bronze.erp_cust_az12--
	print'________________';
	print 'Truncating table';
	print'________________';


	TRUNCATE TABLE bronze.erp_loc_a101;
	print'//////////////////////////';
	PRINT'INSERTING DATA TO TABLE';
	print'//////////////////////////';
	BULK INSERT bronze.erp_loc_a101
	from 'C:\Users\sh\Downloads\Sql ultimate course\Warehouseproject\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
	with (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	--SELECT COUNT(*) FROM bronze.erp_loc_a101
	print'________________';
	print 'Truncating table';
	print'________________';
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	print'//////////////////////////';
	PRINT'INSERTING DATA TO TABLE';
	print'//////////////////////////';
	BULK INSERT bronze.erp_px_cat_g1v2
	from 'C:\Users\sh\Downloads\Sql ultimate course\Warehouseproject\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
	with (
	FIRSTROW=2,
	FIELDTERMINATOR=',',
	TABLOCK
	);
	--SELECT * FROM bronze.erp_px_cat_g1v2
	--SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2--
	END try
	BEGIN CATCH 
		PRINT'................................';
		PRINT'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT'ERROR MESSAGE'+ERROR_MESSAGE();
		PRINT'ERROR MESSAGE'+CASERROR_NUMBER();
		PRINT'.................................';
	END CATCH
END