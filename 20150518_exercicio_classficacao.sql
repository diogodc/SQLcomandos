--alter table Customers
--add  Classificacao varchar(30)

/*
create proc spu_Classificacao (@dataInicial date, @dataFinal date) as
begin

update Customers	set Classificacao = 'nao avaliado'
where Customers.CustomerID not in (
	select C.CustomerID
	from Customers C inner join Orders O on C.CustomerID = O.CustomerID
	inner join [Order Details] OD on O.OrderID = OD.OrderID
	where O.OrderDate between @dataInicial and @dataFinal	);


update Customers set Classificacao = 'prata'
where Customers.CustomerID in (
	select C.CustomerID
	from Customers C	inner join Orders O on C.CustomerID = O.CustomerID
	inner join [Order Details] OD on O.OrderID = OD.OrderID
	where O.OrderDate between @dataInicial and @dataFinal
	group by C.CustomerID
	having avg(OD.Quantity * OD.UnitPrice) < 100	);


update Customers set Classificacao = 'ouro'
where Customers.CustomerID in (
	select C.CustomerID
	from Customers C	inner join Orders O on C.CustomerID = O.CustomerID
		inner join [Order Details] OD on O.OrderID = OD.OrderID
	where O.OrderDate between @dataInicial and @dataFinal
	group by C.CustomerID
	having avg(OD.Quantity * OD.UnitPrice) <= 400
	and avg(OD.Quantity * OD.UnitPrice) >= 100	);
	
	
update Customers  set Classificacao = 'Diamante'
where Customers.CustomerID in (	
	select C.CustomerID
	from Customers C	inner join Orders O on C.CustomerID = O.CustomerID
		inner join [Order Details] OD on O.OrderID = OD.OrderID
	where O.OrderDate between @dataInicial and @dataFinal
	group by C.CustomerID
	having avg(OD.Quantity * OD.UnitPrice) > 400	);




end
*/

-- exec spu_Classificacao '1996-01-01', '1996-12-31'