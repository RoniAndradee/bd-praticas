use sprint2;
-- prática 04 tabelas professor & disciplina

-- criação tabela professor
create table professor (
idProfessor int primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40));

-- inserindo dados na tabela professor
insert into professor values
(default, 'Vivan', 'Silva', 'Banco de dados', 'Química'),
(default, 'João', 'Pedro', 'algoritmos', 'Matemática'),
(default, 'Marise', 'Machine', 'arq. comp', 'História'),
(default, 'Kaline', 'Socio', 'socioemocional', 'Física'),
(default, 'Fernanda', 'Caramico', 'pi', 'Português'),
(default, 'Rayssa', 'Socio', 'socioemocional', 'Biologia');

-- criação da tabela disciplina
create table disciplina(
idDisc int primary key auto_increment,
nomeDisc varchar(45),
fkProfessor int not null,
constraint fkProfessorDisc foreign key (fkProfessor)
references professor(idProfessor));

-- inserindo dados na tabela disciplina
insert into disciplina values 
(default, 'Biologia', 6),
(default, 'Matemática', 2),
(default, 'Química', 1),
(default, 'Física', 4),
(default, 'Português', 5),
(default, 'História', 3);

-- exibir os professores e suas respectivas disciplinas
select * from professor join disciplina on fkProfessor = idProfessor;

-- Exibir apenas o nome da disciplina e o nome do respectivo professor
select d.nomeDisc, p.nome from disciplina as d join professor as p on d.fkProfessor = p.idProfessor;

-- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome
select * from professor join disciplina on fkProfessor = idProfessor where sobrenome = 'Silva';

-- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado professor, ordenado de forma crescente pela especialidade1
select especialidade1, nomeDisc from professor join disciplina on fkProfessor = idProfessor where nome = 'Rayssa' order by especialidade1;

-- prática 04 tabelas curso & aluno

-- criação da tabela curso
create table curso(
idCurso int primary key auto_increment,
nome varchar(50),
sigla char(3),
coordenador varchar(45));

-- inserindo dados na tabela curso
insert into curso values
(default, 'Ánalise e Desenvolvimento de Sistemas', 'ADS', 'Gerson'),
(default, 'Ciência da Computação', 'CCO', 'Marise'),
(default, 'Sistemas de Informação', 'SIS', 'Alex');


-- criação da tabela alunos
create table aluno (
idAluno int primary key auto_increment,
nome varchar(45),
email varchar(50),
semestre char(2),
fkCurso int not null,
constraint fkCursoAluno foreign key (fkCurso)
references curso (idCurso));

-- inserindo dados na tabela aluno
insert into aluno values
(default, 'Mário', 'mario@sptech.school', '1º', 1),
(default, 'Moscardo', 'moscardo@sptech.school', '3º', 3),
(default, 'Roger', 'roger@sptech.school', '4º', 2);

-- Faça um JOIN entre as duas tabelas
select a.nome as 'Nome do Aluno', c.nome as 'Cursando' from aluno as a join curso as c on fkCurso = idCurso;

-- Faça um JOIN com WHERE entre as duas tabelas
select * from aluno join curso on fkCurso = idCurso where sigla = 'ADS';

-- Crie um campo com a restrição (constraint) de CHECK
alter table curso add column tipo varchar(11),
add constraint chkTipoGraduacao check (tipo in('Tecnólogo', 'Bacharelado'));

-- atualizando o tipo dos cursos
update curso set tipo = 'Tecnólogo' where idCurso = 1;
update curso set tipo = 'Bacharelado' where idCurso in(2,3);