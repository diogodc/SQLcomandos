USE Northwind
GO

/*select sum(quantity) as QuantidadeTotalItens, avg(quantity) as Media, MAX(quantity) as MaiorVenda, 
MIN (quantity) as MenorVenda
from [Order Details];*/


-- select COUNT(OrderID) as qtdRegistros  from [Order Details];


/* Select SUM(quantity) as TotalItens, productID as Produto
from [Order Details]
GROUP BY productID order by 1;*/

/*Select TOP 1 SUM(quantity) as TotalItens, productID as Produto
from [Order Details]
GROUP BY productID order by 1;*/

-- nome do produto que mais vendeu:
/* select TOP 1 sum(OD.Quantity) as totalItem, P.ProductName AS NomeProduto
from [Order Details] OD, Products P
where OD.ProductID = P. ProductID
group by P.ProductName order by 1 desc; */

-- nome e categoria do que mais vendeu:
/*select TOP 1 sum(OD.Quantity) as totalItem, P.ProductName AS NomeProduto, c.CategoryName
from [Order Details] OD, Products P, Categories C
where OD.ProductID = P. ProductID and P.CategoryID = C.CategoryID
group by P.ProductName, C.CategoryName 
order by 1 desc; */


-- 2) listar a quantidade total e a média de itens vendidos, por cliente(nome)m desde que o cliente resida nos 'USA';
/* select sum(OD.Quantity) as TotalItens, avg(OD.Quantity) as MediaITens, C.CompanyName as NomeCliente
from Customers C, Orders O, [Order Details] OD
where C.CustomerID = O.CustomerID and O.OrderID = OD.OrderID and C.Country = 'USA'
group by C.CompanyName
order by 3; */

-- 3) Lista os 10 maiores compradores no ano de 1997 (valor compra e nome).
select TOP 10 sum(OD.UnitPrice * OD.Quantity) as ValorCompra, C.ContactName as Nomecliente
from Customers C, Orders O, [Order Details] OD
where C.CustomerID = O.CustomerID and O.OrderID = OD.OrderID and year(O.OrderDate) = 1997
group by C.ContactName
order by 1 desc;  -- decrescente, pois o valor maior fica em baixo.

-- 4) Lista os 5 maiores compradores da categoria 'sea food' , cujas compras tenham ocorrido entra 1996 e 1997.
