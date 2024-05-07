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

create table VendasProdutos(
	fkProduto int,
    fkVenda int,
    primary key (fkProduto, fkVenda),
    qtdVendido int,
    desconto decimal(5,2)
);

-- d) Inserir dados nas tabelas, de forma que exista mais de uma venda para cada cliente, e mais de um cliente sendo indicado por outro cliente.
insert into cliente values
(default, 'Mário', 'mario@sptech.school', '93230-150', '190', 'Casa verde', null),
(default, 'Moscardo', 'moscardo@sptech.school', '02932-149', '201', 'Apto. 109', 1),
(default, 'Roger', 'roger@sptech.school', '20301-104', '391', 'Bar azul', 1);

insert into venda values
(default, 121.02, '2024-03-09', 1),
(default, 155.77, '2023-12-12', 1),
(default, 10.99, '2021-03-21', 2),
(default, 100.29, '2024-02-04', 2),
(default, 411.51, '2023-03-16', 3),
(default, 61.58, '2023-07-21', 3);

insert into produto values
(default, '212 VIP', 'Perfume importado', 77.00),
(default, 'Clear men CR7', 'Shampoo Anti-Caspa', 25.00),
(default, 'The Blend Cardamon', 'Perfume amadeirado', 40.00),
(default, 'Skala Babosa', 'Creme hidratante para cabelo', 7.00);

insert into VendasProdutos values
(1, 1, 2, 25.88),
(2, 1, 1, 4.99),
(4, 2, 2, 2.00),
(2, 2, 1, 8.00),
(3, 3, 2, 15.00),
(1, 3, 1, 21.00),
(3, 4, 2, 12.00),
(2, 4, 1, 5.00),
(1, 5, 2, 32.00),
(4, 5, 3, 14.00),
(1, 6, 1, 11.00),
(2, 6, 1, 1.00);

-- e) Exibir todos os dados de cada tabela criada, separadamente.
select * from cliente;

select * from venda;

select * from produto;

select * from VendasProdutos;

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from cliente join venda on fkCliente = idCliente;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) e os dados de suas respectivas vendas.
select * from cliente join venda on fkCliente = idCliente where cliente.nome = 'Roger';

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
select * from cliente left join cliente as indicador on cliente.fkIndicador = indicador.idCliente;

/*j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes
indicadores, porém somente de um determinado cliente indicador (informar o nome
do cliente que indicou na consulta).*/
select * from cliente join cliente as indicador on cliente.fkIndicador = indicador.idCliente where indicador.nome = 'Mário';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os dados das respectivas vendas e dos produtos.
select * from cliente left join cliente as indicador on cliente.fkIndicador = indicador.idCliente
left join venda on venda.fkCliente = cliente.idCliente 
left join VendasProdutos as vp on vp.fkVenda = venda.idVenda 
left join produto on vp.fkProduto = produto.idProduto;

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto numa determinada venda.
select venda.dtVenda, produto.nome, vp.qtdVendido from venda
join VendasProdutos as vp on vp.fkVenda = venda.idVenda
join produto on vp.fkProduto = produto.idProduto
where venda.idVenda = 5;

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de produtos vendidos agrupados pelo nome do produto
select produto.nome as 'Nome do Produto', produto.preco as 'Preço do Produto', sum(vp.qtdVendido) as 'Soma dos produtos vendidos' from produto
join VendasProdutos as vp on vp.fkProduto = produto.idProduto
group by produto.nome, produto.preco;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas vendas, e os clientes que não realizaram nenhuma venda.
insert into cliente values 
(default, 'Maria', 'maria0126@icloud.com', '29841-159', '103', 'Praça', 2);

select * from cliente left join venda on fkCliente = idCliente;

select * from cliente left join venda on fkCliente = idCliente where idVenda is null;

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
select min(preco) as 'Valor Mínimo', max(preco) as 'Valor Máximo' from produto;

-- q) Exibir a soma e a média dos preços dos produtos;
select sum(preco) as 'Soma dos Preços', avg(preco) as 'Média dos Preços' from produto;

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;
select count(preco) as 'Quantidade de preços acima da média' from produto where preco > (select avg(preco) from produto);

-- s) Exibir a soma dos preços distintos dos produtos;
select sum(distinct(preco)) as 'Soma dos precos distintos' from produto;

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
select sum(preco) as 'Soma dos precos dos produtos' from produto
join VendasProdutos as vp on vp.fkProduto = produto.idProduto
join venda on vp.fkVenda = venda.idVenda
where venda.idVenda = 5
group by venda.idVenda;
