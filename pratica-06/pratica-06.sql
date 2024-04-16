-- exercício 01 

create database pratica06;
use pratica06;

-- Criar as tabelas equivalentes à modelagem.
create table projeto(
idProjeto int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
);

create table aluno(
ra char(8) primary key,
nome varchar(45),
telefoneCelular varchar(45),
telefoneFixo varchar(45),
fkProjeto int, 
constraint alunoProjeto foreign key (fkProjeto)
	references projeto(idProjeto),
fkRepresentante char(8),
constraint alunoRepresentante foreign key (fkRepresentante)
	references aluno(ra)
);

create table acompanhante(
idAcompanhante int,
fkAluno char(8),
constraint pkAcompanhanteAluno primary key (idAcompanhante, fkAluno),
nome varchar(45),
tipoRelacao varchar(45)
);

-- Inserir dados nas tabelas.
insert into projeto values
(default, 'Aquaponix', 'Monitoramento de sistemas aquaponicos'),
(default, 'MKTech', 'Monitoramento de mercado'),
(default, 'Projetinho', 'Monitoramento de marombas');

insert into aluno values
('01241040', 'zé', '11975838281', null, 1, null),
('01241041', 'zézão', null, '8458-5158', 2, null),
('01241042', 'zezinho', '11989542578', null, 3, '01241040'),
('01241043', 'zezo', null, '8415-8945', 1, '01241041');

insert into acompanhante values
(1, '01241040', 'Ceza', 'Tio'),
(1, '01241041', 'Marks', 'Irmão'),
(1, '01241042', 'Junin', 'Pai'),
(2, '01241040', 'Cleito', 'Casca de bala');

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from projeto;
select * from aluno;
select * from acompanhante;

-- Exibir os dados dos alunos e dos projetos correspondentes.
select * from aluno join projeto on fkProjeto = idProjeto;

-- Exibir os dados dos alunos e dos seus acompanhantes.
select * from aluno left join acompanhante on fkAluno = ra;

-- Exibir os dados dos alunos e dos seus representantes.
select * from aluno left join aluno as representante on aluno.fkRepresentante = representante.ra;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta).
select * from aluno join projeto on fkProjeto = idProjeto where projeto.nome = 'Aquaponix';

-- Exibir os dados dos alunos, dos projetos correspondentes e dos seus acompanhantes.
select * from aluno join projeto on fkProjeto = idProjeto left join acompanhante on fkAluno = ra;

-- exercicio 02

-- Criar um banco de dados chamado Campanha.
create database campanha;

-- Selecionar esse banco de dados.
use campanha;

-- Criar as tabelas correspondentes à sua modelagem
create table organizador(
idOrganizador int primary key auto_increment,
nome varchar(45),
logradouro varchar(45),
bairro varchar(45),
email varchar(45),
fkOrientador int,
constraint fkOrganizadorOrientador foreign key (fkOrientador)
	references organizador(idOrganizador)
) auto_increment = 30;

create table campanha(
idCampanha int,
fkOrganizador int,

categoria varchar(45),
instituicao varchar(45),
instituicao2 varchar(45),
dtFinal date
);

alter table campanha auto_increment = 500;

-- Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente
insert into organizador (idOrganizador, nome, rua, bairro, email) values 
(default, 'Miguel', 'Rua Pelicano', 'Padre Ulrico', 'miguel2022@gmail.com'),
(default, 'Ivan', 'Rua Major Gavínio Viana', 'Cidade Nova', 'ivanbixao@provedor.com'),
(default, 'Jasmin', 'Rua Juscelino Kubitschek', 'Ponto Novo','jasmincrazy@taligado.com'),
(default, 'Chico', 'Rua Cristóvão Coelho', 'Mecejana','chicao@gmail.com'),
(default, 'Suellen', 'Rua Arthur Bernardes', 'São Geraldo','suellen-atrasos@gmail.com'),
(default, 'Adriano', 'Rua José Alberto Nunes', 'São João','adrizinho@gmail.com');

insert into campanha values 
(default, 'alimento', 'AACD', 'CAPS', '2023-12-15', 30),
(default, 'produto de higiene', 'Associação Peter Pan', null, '2024-02-12', 31),
(default, 'racao', 'Lar TinTin', null, '2024-01-26', 32),
(default, 'medicamento', 'ABRACE', null, '2023-08-02', 33),
(default, 'alimento', 'APAE', 'CAPS', '2022-10-18', 34),
(default, 'produto de limpeza', 'Casa do Zezinho', 'Cruz Vermelha', '2024-03-29', 35),
(default, 'roupa', 'criança esperança', null, '2023-08-15', 30),
(default, 'material de pintura', 'ICA', null, '2022-05-02', 31);
