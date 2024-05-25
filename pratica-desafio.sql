-- Criar um banco de dados chamado Exercicio11.
create database exercicio11;

-- Selecionar esse banco de dados.
use exercicio11;

-- Criar a tabela chamada Departamento para conter os campos: idDepto, nomeDepto, fkGerente, dataInicioGer (tipo date).
create table departamento (
idDepto int primary key,
nomeDepto varchar(45),
fkGerente int,
dataInicioGer date
);

-- Criar a tabela chamada Funcionario para conter os campos: idFunc, nomeFunc (tamanho 30), salario, sexo, fkSupervisor, dataNasc (tipo date), fkDepto
create table funcionario (
idFunc int primary key,
nomeFunc varchar(30),
salario decimal(6,2),
sexo char(1),
fkSupervisor int,
dataNasc date,
fkDepto int,
foreign key (fkDepto)
	references departamento (idDepto)
);

-- Criar a tabela chamada Projeto para conter os dados: idProj, nomeProj, localProj, fkDepto.
create table projeto (
idProj int primary key,
nomeProj varchar(45),
localProj varchar(45),
fkDepto int,
foreign key (fkDepto)
	references departamento (idDepto)
);

-- Criar a tabela FuncProj para conter os dados: fkFunc, fkProj, horas (tipo decimal(3,1)).
create table funcProj (
fkFunc int,
fkProj int,
primary key (fkFunc, fkProj),
horas decimal(3,1),
foreign key (fkFunc)
	references funcionario (idFunc),
foreign key (fkProj)
	references projeto (idProj)
);

-- Inserir dados nas tabelas
insert into departamento (idDepto, nomeDepto, dataInicioGer) values
(105, 'Pesquisa', '2008-05-22'),
(104, 'Administração', '2015-01-01'),
(101, 'Matriz', '2001-06-19');

alter table departamento add foreign key (fkGerente) references funcionario (idFunc);

insert into funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) values
(1, 'Joao Silva', 3500.00, 'm', 2, '1985-01-09', 105),
(2, 'Fernando Wong', 4500.00, 'm', 8, '1975-12-08', 105),
(3, 'Alice Sousa', 2500.00, 'f', 7, '1988-01-19', 104),
(4, 'Janice Morais', 4300.00, 'f', 8, '1970-06-20', 104),
(5, 'Ronaldo Lima', 3800.00, 'm', 1, '1982-09-15', 105),
(6, 'Joice Leite', 2500.00, 'f', 1, '1992-07-31', 105),
(7, 'Antonio Pereira', 2500.00, 'm', 4, '1989-03-29', 104),
(8, 'Juliano Brito', 5500.00, 'm', null, '1957-11-10', 101);

alter table funcionario add foreign key (fkSupervisor) references funcionario (idFunc);

update departamento set fkGerente = 2 where idDepto = 105;
update departamento set fkGerente = 7 where idDepto = 104;
update departamento set fkGerente = 8 where idDepto = 101;

insert into projeto (idProj, nomeProj, localProj, fkDepto) values
(1, 'Produto X', 'Santo André', 105),
(2, 'Produto Y', 'Itu', 105),
(3, 'Produto Z', 'São Paulo', 105),
(10, 'Informatização', 'Mauá', 104),
(20, 'Reorganização', 'São Paulo', 101),
(30, 'Benefícios', 'Mauá', 104);

insert into funcProj (fkFunc, fkProj, horas) values
(1, 1, 32.5),
(1, 2, 7.5),
(5, 3, 40.0),
(6, 1, 20.0),
(6, 2, 20.0),
(2, 2, 10.0),
(2, 3, 10.0),
(2, 10, 10.0),
(2, 20, 10.0),
(3, 30, 30.0),
(3, 10, 10.0),
(7, 10, 35.0),
(7, 30, 5.0),
(4, 30, 20.0),
(4, 20, 15.0),
(8, 20, null);

-- Após criar as tabelas e inserir todos os dados, executar os comandos para:

-- Exibir os dados de cada tabela separadamente (confira se os dados foram inseridos corretamente).
select * from departamento;
select * from funcionario;
select * from projeto;
select * from funcProj;

-- Inserir mais o seguinte funcionário na tabela Funcionario:
-- idFunc: null, nomeFunc: Cecília Ribeiro, salario: 2800, sexo: f, fkSupervisor: null, dataNasc: 1980-04-05, fkDepto: 104
insert into funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) values
(null, 'Cecília Ribeiro', 2800.00, 'f', null, '1980-04-05', 104);

-- Conseguiu inserir? Por que?
/* Não consegui inserir pois a chave primária de uma tabela não pode ser nula,
e nesse caso está. Então não irá funcionar enquanto não adicionar uma chave primária válida */

/* Inserir mais o seguinte funcionário na tabela Funcionario:
idFunc: 3, nomeFunc: Alice Sousa, salario: 2800, sexo: f, fkSupervisor: 4, dataNasc: 1980-04-05, fkDepto: 104 */
insert into funcionario (idFunc, nomeFunc, salario, sexo, fkSupervisor, dataNasc, fkDepto) values
(3, 'Alice Sousa', 2800.00, 'f', 4, '1980-04-05', 104);

/* Conseguiu inserir? Por que?  
Não consegui inserir pois a chave primária de uma tabela não pode se repetir,
e nesse caso */