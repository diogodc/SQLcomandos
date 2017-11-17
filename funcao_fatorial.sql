
CREATE FUNCTION dbo.fun_fatorial (@num int)
RETURNS int
AS
begin 
	declare @retorno int
	
	if (@num <= 1) 
		set @retorno = 1
	else
	set @retorno = @num * dbo.fun_fatorial (@num - 1)
RETURN @retorno

END

print dbo.fun_fatorial (5)