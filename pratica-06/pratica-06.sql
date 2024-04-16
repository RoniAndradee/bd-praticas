-- Exercício 01 
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
tipoRelacao varchar(45),
constraint fkAcompanhanteAluno foreign key (fkAluno)
	references aluno (ra)
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

-- Exercício 02

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
constraint pkCampanhaOrganizador primary key (idCampanha, fkOrganizador),
categoriaDoacao varchar(45),
instituicao1 varchar(45),
instituicao2 varchar(45),
dtFinal date,
constraint fkCampanhaOrganizador foreign key (fkOrganizador)
	references organizador (idOrganizador)
);

-- Inserir dados nas tabelas, de forma que exista mais de uma campanha para algum organizador, e mais de um organizador novato sendo orientado por algum organizador mais experiente
insert into organizador values 
(default, 'Miguel', 'Rua Pelicano', 'Padre Ulrico', 'miguel2022@gmail.com', null),
(default, 'Ivan', 'Rua Major Gavínio Viana', 'Cidade Nova', 'ivanbixao@provedor.com', null),
(default, 'Jasmin', 'Rua Juscelino Kubitschek', 'Ponto Novo','jasmincrazy@taligado.com', 30),
(default, 'Chico', 'Rua Cristóvão Coelho', 'Mecejana','chicao@gmail.com', 30),
(default, 'Suellen', 'Rua Arthur Bernardes', 'São Geraldo','suellen-atrasos@gmail.com', 31),
(default, 'Adriano', 'Rua José Alberto Nunes', 'São João','adrizinho@gmail.com', 31);

insert into campanha values 
(1, 30, 'alimento', 'AACD', 'CAPS', '2023-12-15'),
(1, 31, 'produto de higiene', 'Associação Peter Pan', null, '2024-02-12'),
(1, 32,'racao', 'Lar TinTin', null, '2024-01-26'),
(1, 33, 'medicamento', 'ABRACE', null, '2023-08-02'),
(1, 34, 'alimento', 'APAE', 'CAPS', '2022-10-18'),
(1, 35, 'produto de limpeza', 'Casa do Zezinho', 'Cruz Vermelha', '2024-03-29'),
(2, 30, 'roupa', 'criança esperança', null, '2023-08-15'),
(2, 31,'material de pintura', 'ICA', null, '2022-05-02');

-- Exibir todos os dados de cada tabela criada, separadamente.
select * from organizador;
select * from campanha;

-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas.
select * from organizador join campanha on fkOrganizador = idOrganizador;

-- Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas.
select * from organizador join campanha on fkOrganizador = idOrganizador where organizador.nome = 'Ivan';

-- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores.
select * from organizador as novato join organizador as orientador on novato.fkOrientador = orientador.idOrganizador;

/*Exibir os dados dos organizadores novatos e os dados dos respectivos
organizadores orientadores, porém somente de um determinado organizador
orientador (informar o nome do organizador orientador na consulta).*/
select * from organizador as novato join organizador as orientador on novato.fkOrientador = orientador.idOrganizador where orientador.nome = 'Miguel';

-- Exibir os dados dos organizadores novatos, os dados das respectivas campanhas organizadas e os dados dos respectivos organizadores orientadores.
select * from organizador as novato join campanha on campanha.fkOrganizador = novato.idOrganizador join organizador as orientador on novato.fkOrientador = orientador.idOrganizador;

/*Exibir os dados de um organizador novato (informar o seu nome na consulta),
os dados das respectivas campanhas em que trabalha e os dados do seu
organizador orientador.*/
select * from organizador as novato join campanha on campanha.fkOrganizador = novato.idOrganizador 
join organizador as orientador on novato.fkOrientador = orientador.idOrganizador where novato.nome = 'Chico';