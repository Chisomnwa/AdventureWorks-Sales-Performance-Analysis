DROP VIEW IF EXISTS dim_customers_view;

GO

CREATE VIEW dim_customers_view AS

-- Cleansed DIM_Customers Table --
SELECT TOP 100 PERCENT 
  c.customerkey AS CustomerKey  
  ,c.firstname + ' ' + lastname AS [Full Name] 
  ,CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender
  ,c.datefirstpurchase AS DateFirstPurchase
  ,g.city AS [City] -- Joined in Customer City from Geography Table
  ,g.stateprovincename AS [State-Province]
  ,g.englishcountryregionName AS Country
  ,st.SalesTerritoryRegion AS Region
  ,g.postalcode AS [Postal Code]
FROM 
  DimCustomer as c
  LEFT JOIN DimGeography AS g ON g.geographykey = c.geographykey 
  LEFT JOIN DimSalesTerritory AS st ON g.SalesTerritoryKey = st.SalesTerritoryKey
ORDER BY 
  CustomerKey ASC -- Ordered List by CustomerKey
