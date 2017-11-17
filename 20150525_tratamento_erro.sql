/* Criar um stored proceduto que receba como parâmetros o nome da uma tabela e a identificação do flag
de exlusão do ultimo registro dessa tabela (1-exlcuir; 0-lista).
Faça um tratamento de erros através da clausula try/catch em uma transação (delete ou select). */

CREATE PROCEDURE usp_tramento_DML_tabela_existente
@tipo int, @tabela varchar (30), @coluna varchar (30)
AS 
BEGIN 

if not exists ( select 1 from sys.objects O
				where O.name like @tabela)
	print 'tabela inexistente'			

else

BEGIN TRY 
	BEGIN TRAN 
		select @coluna = name
			from sys.columns C
			where object_id = (select T.
			 Object_id = Object_id ('+@tabela+')  )


	COMMIT TRAN  [nome da transação opcional]
END TRY 

BEGIN CATCH 

	ROLLBACK TRAN 
	SELECT ERROR_MESSAGE() AS Retorno 

END CATCH 
END