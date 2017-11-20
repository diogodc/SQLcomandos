-- BASE
select vw.CodigoCliente,COUNT(vw.CodigoCliente) AS Qtd_compras from 
(SELECT C.CustomerID AS CodigoCliente,
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
						  INNER JOIN Suppliers SU ON SU.SupplierID = P.SupplierID
GROUP BY C.CustomerID,
       C.ContactName,
	   P.ProductID,
	   CA.CategoryName,
	   O.OrderDate
) as vw
	   GROUP BY vw.CodigoCliente
	   order by 2 desc

-- DIM_PRODUTO
SELECT P.ProductID AS CodProduto,
	   P.ProductName,
	   CA.CategoryName AS Categoria,
	   SU.Country,
	   SU.CompanyName
FROM Customers C INNER JOIN Orders O ON C.CustomerID = O.CustomerID
                          INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
						  INNER JOIN Products P ON OD.ProductID = P.ProductID
						  INNER JOIN Categories CA ON P.CategoryID = CA.CategoryID
						  INNER JOIN Suppliers SU ON SU.SupplierID = P.SupplierID
GROUP BY C.CustomerID,
       P.ProductName,
       C.ContactName,
	   P.ProductID,
	   CA.CategoryName,
	   SU.Country,
	   SU.CompanyName;

-- DIM_CLIENTE
select vw.CodigoCliente,vw.NomeCliente,vw.ValorCompraItem,
CASE   
      WHEN vw.ValorCompraItem > 10000 THEN 'RICO'   
      WHEN vw.ValorCompraItem >= 5000 AND vw.ValorCompraItem <= 10000 THEN 'MEDIA' 
	  WHEN vw.ValorCompraItem < 5000 THEN 'POBRE'    
   END   
 from 
(SELECT C.CustomerID AS CodigoCliente,
       C.ContactName AS NomeCliente,
	   SUM(OD.UnitPrice * od.Quantity) AS ValorCompraItem
FROM Customers C INNER JOIN Orders O ON C.CustomerID = O.CustomerID
                          INNER JOIN [Order Details] OD ON O.OrderID = OD.OrderID
						  INNER JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY C.CustomerID,
       C.ContactName,
	   P.ProductID
	   ) as vw
	   GROUP BY vw.CodigoCliente,
	   vw.NomeCliente,
	   vw.ValorCompraItem
	   order by 1




