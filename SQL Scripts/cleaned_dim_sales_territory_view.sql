DROP VIEW IF EXISTS dim_sales_territory_view;

GO

CREATE VIEW dim_sales_territory_view AS

SELECT 
	[SalesTerritoryKey]
    ,[SalesTerritoryRegion] AS Region
    ,[SalesTerritoryCountry] AS Country
    ,[SalesTerritoryGroup] AS [Group]
  FROM [AdventureWorksDW2019].[dbo].[DimSalesTerritory]
  WHERE SalesTerritoryCountry <> 'NA';