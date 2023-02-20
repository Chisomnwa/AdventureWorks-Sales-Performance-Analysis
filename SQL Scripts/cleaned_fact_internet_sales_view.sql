DROP VIEW IF EXISTS fact_internet_sales_view

GO

CREATE VIEW fact_internet_sales_view AS


-- Cleansed FACT_InternetSales Table --
SELECT TOP 100 PERCENT
  CONCAT(RIGHT(salesordernumber,5),'00',salesorderlinenumber) AS SalesOrderLineKey 
  ,[OrderDateKey] 
  ,[DueDateKey] 
  ,[ShipDateKey] 
  ,[CustomerKey] 
  ,[ProductKey]
  ,[SalesTerritoryKey]
  ,[SalesOrderNumber] 
  ,[OrderQuantity] AS [Order Quantity]
  ,[UnitPrice] AS [Unit Price] 
  ,[ExtendedAmount] AS [Extended Amount] 
  ,[ProductStandardCost] AS [Product Standard Cost]
  ,[TotalProductCost] AS [Total Product Cost] 
  ,[SalesAmount] AS [Sales Amount]
  ,[SalesAmount] - [TotalProductCost] AS Profit
FROM 
  FactInternetSales
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) -3 -- Ensures we only bring 3 years of data from today's date.
ORDER BY
  OrderDateKey ASC