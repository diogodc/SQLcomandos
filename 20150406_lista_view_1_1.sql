-- 1-  criar uma view para mostrar o total	de vendas (US$) para cada categoria de produtos
-- durante o ano de 1997.
-- utilizar como referência na soma uma outra view, que calcula o
-- total de vendas, por categoria, no ano de 1997.

create view vw_vendas_categoria_1997 as
select o.OrderDate as dataPedido, od.ProductID as produto,
SUM(od.Quantity*od.UnitPrice) as totalVendas, c.CategoryName as Categoria
from Orders O inner join [Order Details] OD on (o.OrderID = OD.OrderID)
inner join Products P on (od.ProductID = P.ProductID) 
inner join Categories C on (p.CategoryID = c.CategoryID)
where DATEPART(year, o.OrderDate) = 1997
group by o.OrderDate,od.ProductID,c.CategoryName;


create view vw_total_vendas_categoria_1997 as
select distinct Categoria, SUM(totalVendas) as total
from vw_vendas_categoria_1997
group by Categoria;


select * from vw_vendas_categoria_1997 where produto = 1;
