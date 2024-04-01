create database sprint2;
use sprint2;

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
responsavel varchar(45));

insert into empresa values
(default, 'STEFANINI', 'DANIELA'),
(default, 'C6BANK', 'VANESSA');

select * from empresa;
create table aluno(
	ra char(8) primary key,
    nome varchar(45),
    bairro varchar(45),
    fkEmpresa int,
    constraint fkAlunoEmpresa foreign key (fkEmpresa)
		references empresa(idEmpresa));

/* alter table aluno add column fkEmpresa int not null,
	add constraint fkAlunoEmpresa foreign key (fkEmpresa)
		references empresa(idEmpresa);
*/

alter table aluno modify column fkEmpresa int not null;

insert into aluno values
('01241999', 'WILL', 'CONSOLAÇÃO', 1),
('01241998', 'WALL', 'TRIANON MASP', 1),
('01241997', 'WELL', 'PARAÍSO', 2);

select * from aluno;

-- Exibir as empresas e seus interessados
select * from empresa join aluno on idEmpresa = fkEmpresa;

select responsavel, bairro from empresa join aluno on idEmpresa = fkEmpresa;

select responsavel, bairro from empresa join aluno on idEmpresa = fkEmpresa where bairro = 'paraíso';

select empresa.nome, aluno.nome from empresa join aluno on idEmpresa = fkEmpresa;

select e.nome as NomeEmpresa, a.nome as NomeAluno from empresa as e join aluno as a on e.idEmpresa = a.fkEmpresa;