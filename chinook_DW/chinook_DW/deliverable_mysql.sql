Use chinook_dw;

# show and count tables
show tables;
SELECT count(*) AS NumOfTables FROM INFORMATION_SCHEMA.TABLES where table_schema = 'chinook_dw';

# top 20 rows
select * from fact_sales order by SalesAmount desc limit 20;