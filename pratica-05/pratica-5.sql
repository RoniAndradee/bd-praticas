-- Exercicio 01
create database pet;
use Pet;

-- Criar as tabelas equivalentes à modelagem. 
create table cliente(
idCliente int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
telefoneCelular varchar(20),
telefoneFixo varchar(20),
cep char (9),
bairro varchar(45),
rua varchar(45),
numero varchar(8),
complemento varchar(45));

create table pet(
idPet int primary key auto_increment,
tipo varchar(45),
nome varchar(45),
raca varchar(45),
dtNasc date,
fkCliente int,
constraint fkPetCliente foreign key (fkCliente)
	references cliente(idCliente))auto_increment = 101;
 
/* Inserir dados nas tabelas, de forma que exista mais de um tipo de animal diferente,
e que exista algum cliente com mais de um pet cadastrado. Procure inserir pelo
menos 2 clientes diferentes que tenham o mesmo sobrenome */
insert into cliente values
(default, 'Ronielli', 'Santos', '11-977376265', '(83) 3591-7405', '12345-678', 'Centro', 'Rua Principal', '123', 'Ap 101'),
(default, 'Maria', 'Santos', '11-927339155', '(51) 2231-1771', '98765-432', 'Vila Nova', 'Rua Secundária', '456', 'Casa 202'),
(default, 'Pedro', 'Ferreira', '11-937371972', null, '13579-024', 'Bairro Alto', 'Avenida Central', '789', 'Fundos');

insert into pet values
(default, 'Cachorro', 'Alê', 'Labrador', '2019-05-10', 1),
(default, 'Gato', 'Junin', 'Siames', '2020-02-15', 2),
(default, 'Cachorro', 'Bolinha', 'Vira-lata', '2018-08-20', 3),
(default, 'Pássaro', 'Piu', 'Canário', '2017-10-05', 1);

-- Exibir todos os dados de cada tabela criada, separadamente
select * from pet;
select * from cliente;

-- Altere o tamanho da coluna nome do cliente
alter table cliente modify column nome varchar(55);

-- Exibir os dados de todos os pets que são de um determinado tipo (por exemplo: cachorro
select * from pet where tipo = 'gato';

-- Exibir apenas os nomes e as datas de nascimento dos pets
select nome as NomeDoPet, dtNasc as DataNascimento from pet;

-- Exibir os dados dos pets ordenados em ordem crescente pelo nome
select * from pet order by nome;

-- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro
select * from cliente order by bairro desc;

-- Exibir os dados dos pets cujo nome comece com uma determinada letra
select * from pet where nome like 'j%';

-- Exibir os dados dos clientes que têm o mesmo sobrenome
select * from cliente where sobrenome = 'santos';

-- Alterar o telefone de um determinado cliente
update cliente set telefoneFixo = '(54) 3452-9381' where idCliente = 3;

-- Exibir os dados dos clientes para verificar se alterou
select * from cliente;

-- Exibir os dados dos pets e dos seus respectivos donos
select * from pet join cliente as dono on pet.fkCliente = dono.idCliente;

-- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.
select * from pet join cliente as dono on pet.fkCliente = dono.idCliente where dono.nome = 'Maria';

-- Excluir algum pet
delete from pet where idPet = 103;

-- Exibir os dados dos pets para verificar se excluiu
select * from pet;

-- Excluir as tabelas
drop tables cliente, pet; 
