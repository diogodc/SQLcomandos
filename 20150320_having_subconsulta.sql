Select C.ContactName AS NomeCliente, SUM (OD.Quantity * OD.UnitPrice) as soma,
(select AVG(OD.Quantity * OD.UnitPrice) from [Order Details] OD) as media
from  Customers C, Orders O, [Order Details] OD
where C.CustomerID = O.CustomerID and O.OrderID = OD.OrderID
and C.Country = 'USA'
group by C.ContactName;
having AVG (OD.Quantity * OD.UnitPrice)

