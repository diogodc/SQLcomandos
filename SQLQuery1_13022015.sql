-- create database vendas
use vendas
go
/*
create table Cliente (
IdCliente int identity primary key not null,
nomeCliente varchar (80) not null,
dataNascimento date not null,
endereco varchar (200) not null,
constraint ck_vendas_cliente check (dataNascimento >= '1900/01/01')
)*/

/* create table Pedido (
IdPedido int identity primary key not null,
dataPedido date not null,
valorTotal money not null, 
qtdItens smallint not null,
IdCliente int not null, -- fk
constraint check_money check (valorTotal > 0)
--foreign key (IdCliente) references Cliente(IdCliente)
) */

/* create table ItemPedido (
IdProduto int not null,   -- fk
qtdItem smallint not null,
valorTotalItem money not null,
IdPedido int not null,  --fk
constraint check_money2 check (valorTotalItem > 0),
primary key (IdProduto, IDPedido)
)*/

/*create table Produto (
IdProduto int identity primary key not null,
descProduto varchar(80) not null
)*/