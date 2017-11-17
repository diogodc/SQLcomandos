use vendas
go
--alter table Produto add IdFornecedor int;

/*create table Fornecedor(
IdFornecedor int primary key not null,
nomeFornecedor varchar (100) not null,
estado char(2) not null)*/

-- alter table Produto add foreign key (IdFornecedor) references Fornecedor(IdFornecedor);

-- alter table Fornecedor add sexo char(1), check (sexo in ('M','F') );

-- Inserir:
-- insert into Fornecedor (IdFornecedor,nomeFornecedor,estado) values (1,'Nome1','ES');
-- insert into Cliente (nomeCliente,dataNascimento,endereco) values ('Nome1','1989/08/10','rua');
-- insert into Produto values ('produto1','1');
