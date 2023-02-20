DROP VIEW IF EXISTS date_view;

GO

CREATE VIEW dim_date_view

AS

-- Cleansed DIM_Date Table --
SELECT 
  [DateKey]
  ,[FullDateAlternateKey] AS Date 
  ,[EnglishDayNameOfWeek] AS Day 
  ,[EnglishMonthName] AS Month 
  ,Left([EnglishMonthName], 3) AS MonthShort,   -- Useful for front end date navigation and front end graphs. 
  [MonthNumberOfYear] AS MonthNo
  ,DATEFROMPARTS(CalendarYear, MonthNumberOfYear, 1) AS [Year-Month]
  ,CONCAT(Left([EnglishMonthName], 3), ' ', CalendarYear) AS [Year_Month_Eng]
  ,[CalendarQuarter] AS Quarter 
  ,CONCAT('Q', CalendarQuarter,'-', CalendarYear) AS [Quarter-Year]
  ,[CalendarYear] AS Year --[CalendarSemester] 
FROM 
 [AdventureWorksDW2019].[dbo].[DimDate]
WHERE 
  CalendarYear >= YEAR(GETDATE())-3
