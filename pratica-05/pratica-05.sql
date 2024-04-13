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

-- Exercicio 02
create database pessoaGasto;
use pessoaGasto;

create table pessoa(
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc date,
profissao varchar(45));

create table gasto(
idGasto int,
fkPessoa int,
constraint pkGastoPessoa primary key (idGasto, fkPessoa),
dtGasto date,
valor decimal(7,2),
descricao varchar(45),
constraint fkPessoaGasto foreign key(fkPessoa)
	references pessoa(idPessoa));

-- Insira dados nas tabelas
insert into pessoa values
(default, 'Carlos', '1990-01-17', 'Policial'),
(default, 'Mag', '1985-06-09', 'Funileiro'),
(default, 'Charles', '1978-12-31', 'Mestre de Obras'),
(default, 'Zezo', '2000-01-24', 'Borracheiro');

insert into gasto values
(1, 1, '2017-11-17', 120.30, 'Mercado do zé'),
(1, 2, '2019-05-21', 2106.00, 'Nike'),
(1, 3, '2020-02-10', 200.75, 'Shopping'),
(1, 4, '2024-01-09', 10.00, 'Pinga'),
(2, 4, '2021-02-13', 129.75, 'Gasolina');

-- Exiba os dados de cada tabela individualmente
select * from pessoa;
select * from gasto;

-- Exiba somente os dados de cada tabela, mas filtrando por algum dado da tabela (por exemplo, as pessoas de alguma profissão, etc).
select * from pessoa where profissao = 'borracheiro';
select * from gasto where descricao = 'nike';

-- Exiba os dados das pessoas e dos seus gastos correspondentes
select * from pessoa join gasto on gasto.fkPessoa = pessoa.idPessoa; 

-- Exiba os dados de uma determinada pessoa e dos seus gastos correspondentes
select * from pessoa join gasto on fkPessoa = idPessoa where pessoa.nome = 'zezo';

-- Atualize valores já inseridos na tabela
update pessoa set profissao = 'Caminhoneiro' where idPessoa = 4;
update gasto set descricao = 'Shopis Centis' where fkPessoa = 3;

-- Exclua um ou mais registros de alguma tabela
delete from gasto where fKPessoa = 1;
delete from pessoa where idPessoa = 1;

-- Exercicio 03

-- Criar um banco de dados chamado PraticaFuncionario
create database praticaFuncionario;

-- Selecionar esse banco de dados
use praticaFuncionario;

-- Criar as tabelas correspondentes à sua modelagem
create table setor(
idSetor int primary key auto_increment,
nome varchar(45),
andar varchar(10));

create table funcionario(
idFuncionario int primary key auto_increment,
nome varchar(45),
telefone varchar(20),
salario decimal (7,2),
constraint chkSalario check(salario > 0),
fkSetor int,
constraint fkFuncionarioSetor foreign key (fkSetor)
	references setor(idSetor));

create table acompanhante(
idAcompanhante int,
fkFuncionario int,
constraint pkAcompanhanteFuncionario primary key (idAcompanhante, fkFuncionario),
nome varchar(45),
tipoRelacao varchar(45),
dtNasc date,
constraint fkFuncionarioAcompanhante foreign key (fkFuncionario)
	references funcionario(idFuncionario));

-- Inserir dados nas tabelas, de forma que exista mais de um funcionário em cada setor cadastrado
insert into setor values
(default, 'RH', '15'),
(default, 'Montagem', '0');

insert into funcionario values
(default, 'Trena da Silva', '11-977348547', 4800.00, 2),
(default, 'Tim Santos', '11-922847583', 7000.00, 1),
(default, 'Paula Mlk', '11-926893034', 2000.00, 1),
(default, 'Paolo Guerrero', '11-43761864', 6700.00, 2);

insert into acompanhante values
(1, 1, 'Santana da Silva', 'Irmão', '2001-09-09'),
(2, 1, 'Vinicius Oliveira', 'Casca de Bala', '2002-09-23'),
(1, 2, 'Jão Vitin', 'Primo', '1999-02-25'),
(1, 3, 'Pereba Vinte', 'Tio', '1982-01-02');

-- Exibir todos os dados de cada tabela criada, separadamente
select * from acompanhante;
select * from setor;
select * from funcionario;

-- Exibir os dados dos setores e dos seus respectivos funcionários
select * from setor join funcionario on fkSetor = idSetor;

-- Exibir os dados de um determinado setor (informar o nome do setor na consulta) e dos seus respectivos funcionários.
select * from setor join funcionario on fksetor = idsetor where setor.nome = 'Montagem';

-- Exibir os dados dos funcionários e de seus acompanhantes
select * from funcionario join acompanhante on fkFuncionario = idFuncionario;

-- Exibir os dados de apenas um funcionário (informar o nome do funcionário) e os dados de seus acompanhantes.
select * from funcionario join acompanhante on fkFuncionario = idFuncionario where funcionario.nome = 'Trena da Silva';

-- Exibir os dados dos funcionários, dos setores em que trabalham e dos seus acompanhantes.
select * from funcionario join setor on fkSetor = idSetor join acompanhante on fkFuncionario = idFuncionario;

-- Exercicio 04

-- Criar um banco de dados chamado Treinador
create database treinador;

-- Selecionar esse banco de dados
use treinador;

-- Criar as tabelas correspondentes à sua modelagem
create table treinador (
idTreinador int primary key auto_increment,
nome varchar(45),
telefone varchar(20),
email varchar(45),
fkOrientador int,
constraint fkTreinadorOrientador foreign key (fkOrientador)
	references treinador (idTreinador))auto_increment = 10;
    
create table nadador(
idNadador int primary key auto_increment,
nome varchar(45),
estadoOrigem varchar(45),
dtNasc date,
fkTreinador int,
constraint fkNadadorTreinador foreign key (fkTreinador)
	references treinador (idTreinador))auto_increment = 100;
    
/* Inserir dados nas tabelas, de forma que exista mais de um nadador para algum
treinador, e mais de um treinador sendo orientado por algum treinador mais
experiente. */
insert into treinador values 
(default, 'Marquin', '11-977348547', 'marquin@treinador.com', null),
(default, 'Junio', '11-922847583', 'junio@treinador.com', null),
(default, 'Ceza', '11-43761864', 'ceza@treinador.com', 10),
(default, 'Jao', '11-927339155', 'jao@treinador.com', 11),
(default, 'Macarrao', '11-98823711', 'macarrao@treinador.com', 11);

insert into nadador values
(default, 'Jhoson', 'São Paulo', '2004-02-20', 10),
(default, 'Baianin', 'Bahia', '2001-07-21', 10), 
(default, 'Yurin', 'Ceara', '1984-02-19', 11), 
(default, 'Coisin', 'Sergipe', '2002-01-30', 12), 
(default, 'Aparei', 'Maracá', '2000-01-30', 13), 
(default, 'Cezinha', 'Guarujá', '1992-12-23', 14);

--  Exibir todos os dados de cada tabela criada, separadamente
select * from treinador;
select * from nadador;

-- Exibir os dados dos treinadores e os dados de seus respectivos nadadores
select * from treinador join nadador on fkTreinador = idTreinador;

-- Exibir os dados de um determinado treinador (informar o nome do treinador na consulta) e os dados de seus respectivos nadadores
select * from treinador join nadador on fkTreinador = idTreinador where treinador.nome = 'Marquin';

-- Exibir os dados dos treinadores e os dados dos respectivos treinadores orientadores
select * from treinador join treinador as orientador on treinador.fkOrientador = orientador.idTreinador;

/*Exibir os dados dos treinadores e os dados dos respectivos treinadores
orientadores, porém somente de um determinado treinador orientador (informar o
nome do treinador na consulta).*/
select * from treinador join treinador as orientador on treinador.fkOrientador = orientador.idTreinador where orientador.nome = 'Junio';

-- Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados dos respectivos treinadores orientadores.
select * from treinador right join nadador on nadador.fkTreinador = treinador.idTreinador
left join treinador as orientador on treinador.fkOrientador = orientador.idTreinador;

-- Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos respectivos nadadores e os dados do seu treinador orientador
select * from treinador right join nadador on nadador.fkTreinador = treinador.idTreinador
left join treinador as orientador on treinador.fkOrientador = orientador.idTreinador where treinador.nome = 'Macarrao';

