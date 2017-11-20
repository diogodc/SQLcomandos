
CREATE VIEW vcPedidosPorClienteProduto
AS
SELECT C.CustomerID AS CodigoCliente,
       C.ContactName AS NomeCliente,
	   P.ProductID AS CodProduto,
	   CA.CategoryName AS Categoria,
	   CAST(O.OrderDate AS DATE) AS DataCompra,
	   SUM(OD.Quantity) AS QtdeItens,
	   SUM(OD.UnitPrice * od.Quantity) AS ValorCompraItem
FROM Customers C INNER JOIN Orders O ON C.CustomerID = O.CustomerID
                          INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
						  INNER JOIN Products P ON OD.ProductID = P.ProductID
						  INNER JOIN Categories CA ON P.CategoryID = CA.CategoryID
GROUP BY C.CustomerID,
       C.ContactName,
	   P.ProductID,
	   CA.CategoryName,
	   O.OrderDate
