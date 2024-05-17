create database pratica_09;
use pratica_09;

-- Criacao das tabelas 
create table professor(
idProfessor int primary key auto_increment,
nome varchar(45),
disciplina varchar(45)
) auto_increment = 10000;

create table grupo(
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(55) 
);
create table aluno (
RA int,
fkGrupo int,
nome varchar(45),
email varchar(45),
primary key (RA, fkGrupo),
foreign key (fkGrupo) 
	references grupo (idGrupo)
);

create table sprint (
idSprint int,
fkProfessor int,
fkGrupo int,
dtInicio datetime default current_timestamp,
nota decimal(3,2),
primary key (idSprint, fkProfessor, fkGrupo),
foreign key (fkProfessor)
	references professor(idProfessor),
foreign key (fkGrupo)
	references grupo(idGrupo)
);

-- inserindo dados nas tabelas
insert into professor (nome, disciplina) values
('Fernanda Caramico', 'PI'),
('Fernando Brandão', 'PI'),
('Cláudio Frizzarini', 'PI');

insert into grupo (nome, descricao) values
('Aquaponix', 'Monitoramento de sistemas aquaponicos'),
('MkTech', 'Monitoramento de mercado'),
('Aquatech', 'Monitoramento de aquario');

insert into aluno values
('01241014', 'Mário', '(84) 3112-7731', 2),
('01241040', 'Ronielli', '(49) 2453-3993', 1),
('01241275', 'Geraldo', '(21) 3613-6170', 3),
('01241323', 'Ronaldo', '(48)2201-4835', 1),
('01241455', 'Maria', '(91) 3246-8321', 3),
('01241632', 'José', '(74) 3392-8673', 2);