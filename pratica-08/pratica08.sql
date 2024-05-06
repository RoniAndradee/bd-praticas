-- a) Criar um banco de dados chamado Venda.
create database venda;

-- b) Selecionar esse banco de dados.
use venda;

-- c) Criar as tabelas correspondentes à sua modelagem.
create table cliente(
    idCliente int primary key auto_increment,
    nome varchar(45),
    email varchar(45),
    cep varchar(45),
    numero varchar(45),
    complemento varchar(45),
    fkIndicador int,
    foreign key (fkIndicador)
    references cliente(idCliente)
);
    
create table venda (
    idVenda int primary key auto_increment,
    valorTotal decimal(5,2),
    dtVenda datetime,
    fkCliente int,
    foreign key (fkCliente)
    references cliente(idCliente)
);

create table produto (
    idProduto int primary key auto_increment,
    nome varchar(45),
    descricao varchar(45),
    preco decimal(5,2)
);


create table produtosVenda (
    
);