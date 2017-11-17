-- sp2
-- QUESTAO 1
--1 – CRIAR UM SP PARA MOSTRAR O TOTAL DE PEDIDOS (ORDERS)
--REALIZADOS ENTRE UMA DATA INICIAL E UMA DATA FINAL DE PEDIDO, DESDE
--QUE O VALOR DE COMPRA (ORDERS DETAILS) SEJA MAIOR QUE R$ 50,00.

CREATE PROC spuTotalPedidosPorData @DataInicio DATE, @DataFim DATE, @ValorReferencia DECIMAL(8,2)
AS
BEGIN
     DECLARE @QuantidadePedidos INT
     
     SET @QuantidadePedidos = (SELECT COUNT(O.OrderID)
             				   FROM Orders O INNER JOIN [Order Details] OD
			   								 ON O.OrderID = OD.OrderID
							   WHERE O.OrderDate BETWEEN @DataInicio AND @DataFim)
     IF @QuantidadePedidos = 0
        PRINT 'Nao existem pedidos para este periodo'    
       
     ELSE
          SELECT sum(OD.Quantity * OD.UnitPrice) AS ValorTotal,
                 replace(convert(NVARCHAR, O.OrderDate, 103), ' ', '/') AS Data
           FROM Orders O INNER JOIN [Order Details] OD
                                 ON O.OrderID = OD.OrderID
                                 
           WHERE O.OrderDate BETWEEN @DataInicio AND @DataFim
           GROUP BY O.OrderDate
           HAVING sum(OD.Quantity * OD.UnitPrice) > @ValorReferencia
           
END

-- execucao do SP
EXEC spuTotalPedidosPorData '01/01/1997','01/30/1997',50.00

