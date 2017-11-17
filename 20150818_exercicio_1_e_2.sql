use Northwind
go

-- Criar uma tabela no DB Northwind chamada HistoricoVendas (DescricaoProduto,
-- ValorMedioVenda, qtdItensVendidos, NomeCategoria, NomeFornecedor)

--create table HistoricoVendas (
--	DescricaoProduto varchar(50),
--	ValorMedioVenda money,
--	qtdItensVendidos integer,
--	NomeCategoria varchar(50),
--);




-- Criar um SP chamado SPAlimentaHistorico que recebe como parâmetro uma
-- data inicial e uma data final de pedidos. Caso o valor médio de cada item
-- vendido neste período seja superior a 30 reais, inserir esta venda na tabela
-- HistoricoVendas

--create proc SPAlimentaHistorico(@dataInicial date, @dataFinal date) as
--insert into HistoricoVendas 
--	select	P.ProductName,
--			avg(OD.Quantity * OD.UnitPrice),
--			sum(OD.Quantity),
--			CA.CategoryName

--	from Orders O	inner join [Order Details] OD on O.OrderID = OD.OrderID
--					inner join Products P on OD.ProductID = P.ProductID
--					inner join Categories CA on P.CategoryID = CA.CategoryID

--	where O.OrderDate between @dataInicial and @dataFinal

--	group by	P.ProductName,
--				CA.CategoryName

--	having avg(OD.Quantity * OD.UnitPrice) > 30;




-- exec SPAlimentaHistorico '01-01-1996', '12-31-1998'


