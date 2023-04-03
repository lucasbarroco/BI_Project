CREATE OR ALTER VIEW RESULTADOS_ADW AS 
SELECT
	fis.SalesOrderNumber AS 'N do Pedido',
	fis.OrderDate AS 'DATA PEDIDO',
	dpc.EnglishProductCategoryName AS 'CATEGORIA PRODUTO',
	fis.customerkey AS 'ID CLIENTE',
	dc.FirstName + ' ' + dc.LastName AS 'NOME CLIENTE',
	REPLACE(REPLACE(dc.Gender, 'M', 'MASCULINO'), 'F', 'Feminino')AS 'GENERO',
	dg.EnglishCountryRegionName AS 'PAIS',
	fis.OrderQuantity AS 'QTD. VENDIDA',
	fis.SalesAmount AS 'RECEITA VENDA',
	fis.TotalProductCost AS 'CUSTO VENDA',
	fis.SalesAmount - fis.TotalproductCost AS 'LUCRO VENDA'
FROM
	FactInternetSales fis
INNER JOIN DimProduct dp ON fis.ProductKey = dp.ProductKey
	INNER JOIN DimProductSubcategory dps ON dps.ProductSubcategoryKey = dps.ProductSubcategoryKey
		INNER JOIN DimProductCategory dpc ON dps.ProductCategoryKey = dpc.ProductCategoryKey
INNER JOIN DimCustomer dc ON fis.CustomerKey = dc.CustomerKey
	INNER JOIN DimGeography dg ON dc.GeographyKey = dg.GeographyKey