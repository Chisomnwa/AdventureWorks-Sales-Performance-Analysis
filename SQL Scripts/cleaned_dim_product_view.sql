DROP VIEW IF EXISTS dim_products_view;

GO

CREATE VIEW dim_products_view AS

-- Cleansed DIM_Products Table --
SELECT TOP 100 PERCENT
  p.[ProductKey] 
  ,p.[ProductAlternateKey] AS SKU 
  ,p.[EnglishProductName] AS Product 
  ,P.StandardCost AS [Standard Cost]
  ,p.[Color] AS [Product Color] 
  ,p.ListPrice AS [List Price]
  ,p.[ModelName] AS Model 
  ,ps.EnglishProductSubcategoryName AS SubCategory -- Joined in from Sub Category Table
  ,pc.EnglishProductCategoryName AS Category -- Joined in from Category Table 
  ,p.[EnglishDescription] AS [Product Description]
  ,P.LargePhoto AS [Product Photo]
  ,ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  DimProduct as p
  LEFT JOIN DimProductSubcategory AS ps ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN DimProductCategory AS pc ON ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc
