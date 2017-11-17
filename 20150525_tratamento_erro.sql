/* Criar um stored proceduto que receba como par�metros o nome da uma tabela e a identifica��o do flag
de exlus�o do ultimo registro dessa tabela (1-exlcuir; 0-lista).
Fa�a um tratamento de erros atrav�s da clausula try/catch em uma transa��o (delete ou select). */

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


	COMMIT TRAN  [nome da transa��o opcional]
END TRY 

BEGIN CATCH 

	ROLLBACK TRAN 
	SELECT ERROR_MESSAGE() AS Retorno 

END CATCH 
END