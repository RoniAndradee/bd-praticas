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
RA char(8),
fkGrupo int,
nome varchar(45),
email varchar(45),
primary key (RA, fkGrupo),
foreign key (fkGrupo) 
	references grupo (idGrupo)
);

create table sprint (
idSprint int auto_increment,
fkProfessor int,
fkGrupo int,
dtInicio datetime default current_timestamp,
nota decimal(4,2),
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
('01241014', 2, 'Mário', 'mario@sptech.school'),
('01241040', 1, 'Ronielli', 'ronielli@sptech.school'),
('01241275', 3, 'Geraldo', 'geraldo@sptech.school'),
('01241323', 1, 'Ronaldo', 'ronaldo@sptech.school'),
('01241455', 2, 'Maria', 'maria@sptech.school'),
('01241632', 3, 'José', 'jose@sptech.school');

insert into sprint values 
(1, 10000, 1, '2023-05-15 09:30:00', 6.20),
(1, 10002, 1, '2023-05-15 09:30:00', 6.20),
(2, 10001, 2, '2024-04-20 10:15:00', 7.30),
(2, 10000, 2, '2024-04-20 10:15:00', 7.50),
(3, 10002, 3, '2024-03-12 13:45:00', 8.50),
(3, 10001, 3, '2023-03-12 13:45:00', 9.00);

-- selects 
select * from professor;
select * from grupo;
select * from aluno;
select * from sprint;

select * from grupo
join aluno on aluno.fkGrupo = grupo.idGrupo;

select * from grupo
join aluno on aluno.fkGrupo = grupo.idGrupo 
where grupo.idGrupo = 1;

select avg(nota) from sprint;

select min(nota) as 'Menor Nota' from sprint;
select max(nota) as 'Maior Nota' from sprint;
select sum(nota) as 'Soma das notas' from sprint;

select p.idProfessor, p.nome, p.disciplina, g.idGrupo, g.nome, g.descricao, s.dtInicio from professor as p
join sprint as s on s.fkProfessor = p.idProfessor
join grupo as g on s.fkGrupo = g.idGrupo;

select p.idProfessor, p.nome, p.disciplina, g.idGrupo, g.nome, g.descricao, s.dtInicio from professor as p
join sprint as s on s.fkProfessor = p.idProfessor
join grupo as g on s.fkGrupo = g.idGrupo where s.fkGrupo = 2;

select g.nome from grupo as g
join sprint as s on s.fkGrupo = g.idGrupo
join professor as p on s.fkProfessor = p.idProfessor where idProfessor = 10000;

select g.idGrupo, g.nome, g.descricao, a.RA, a.fkGrupo, a.nome, a.email, p.idProfessor, p.nome, p.disciplina, s.dtInicio from grupo as g
join aluno as a on a.fkGrupo = g.idGrupo 
join sprint as s on s.fkGrupo = g.idGrupo
join professor as p on s.fkProfessor = p.idProfessor;

select count(distinct(nota)) from sprint;

select p.nome as 'Nome do Professor', truncate(avg(s.nota),2) as 'Média das Notas', sum(s.nota) as 'Soma das Notas' from professor as p
join sprint as s on s.fkProfessor = p.idProfessor group by p.nome;

select g.nome as 'Nome do Grupo', truncate(avg(s.nota),2) as 'Média das Notas', sum(s.nota) as 'Soma das Notas' from grupo as g
join sprint as s on s.fkGrupo = g.idGrupo group by g.nome;

select p.nome, min(s.nota) as 'Menor Nota Dada', max(s.nota) as 'Maior Nota Dada' from professor as p
join sprint as s on s.fkProfessor = p.idProfessor group by p.nome;

select g.nome as 'Nome do Grupo', min(s.nota) as 'Menor Nota Recebida', max(s.nota) as 'Maior Nota Recebida' from grupo as g
join sprint as s on s.fkGrupo = g.idGrupo group by g.nome;
