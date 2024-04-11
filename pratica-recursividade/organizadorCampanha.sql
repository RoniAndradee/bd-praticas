create database campanha;
use campanha;

-- Criar as tabelas correspondentes à sua modelagem
create table organizador (
idOrganizador int primary key auto_increment,
nome varchar(45),
rua varchar(50),
bairro varchar(50),
email varchar(50),
fkOrientador int,
constraint fkOrganizadorOrientador foreign key (fkOrientador)
	references organizador(idOrganizador)
);

alter table organizador auto_increment = 30;

create table campanha (
idCampanha int primary key auto_increment,
categoria varchar(45),
instituicao varchar(45),
instituicao2 varchar(45),
dtFinal date,
fkOrganizador int,
constraint campanhaOrganizador foreign key (fkOrganizador)
	references organizador(idOrganizador)
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

update organizador set fkOrientador = 30 where idOrganizador in(32, 33);
update organizador set fkOrientador = 31 where idOrganizador in(34, 35);

-- Exibir todos os dados de cada tabela criada, separadamente
select * from organizador;
select * from campanha;

-- select feito em aula

-- Exibir os dados dos organizadores e os dados de suas respectivas campanhas
select o.idOrganizador as idOrganizador, o.nome as NomeDoOrganizador, o.rua as RuaDoOrganizador, o.bairro as BairroDoOrganizador, o.email as EmailDoOrganizador, o.fkOrientador as OrientadorDoOrganizador,
c.idCampanha as idCampanha, c.categoria as CategoriaDaCampanha, c.instituicao as InstituicaoDaCampanha, c.instituicao2 as SegundaInstituicaoDaCampanha, c.dtFinal as DataFinalDaCampanha, c.fkOrganizador as OrganizadorDaCampanha
 from organizador as o join campanha as c on o.idOrganizador = c.fkOrganizador;

-- Exibir os dados de um determinado organizador (informar o nome do organizador na consulta) e os dados de suas respectivas campanhas.
select o.idOrganizador as idOrganizador, o.nome as NomeDoOrganizador, o.rua as RuaDoOrganizador, o.bairro as BairroDoOrganizador, o.email as EmailDoOrganizador, o.fkOrientador as OrientadorDoOrganizador,
c.idCampanha as idCampanha, c.categoria as CategoriaDaCampanha, c.instituicao as InstituicaoDaCampanha, c.instituicao2 as SegundaInstituicaoDaCampanha, c.dtFinal as DataFinalDaCampanha, c.fkOrganizador as OrganizadorDaCampanha
 from organizador as o join campanha as c on o.idOrganizador = c.fkOrganizador where o.nome = 'Ivan';
 
 -- Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores
 select novato.idOrganizador as idNovato, novato.nome as NomeDoNovato, novato.rua as RuaDoNovato, novato.bairro as BairroDoNovato, novato.email as EmailDoNovato,
 orientador.idOrganizador as idOrientador, orientador.nome as NomeDoOrientador, orientador.rua as RuaDoOrientador, orientador.bairro as bairroDoOrientador, orientador.email as EmailDoOrientador
 from organizador as novato join organizador as orientador on novato.fkOrientador = orientador.idOrganizador;
 
 /* Exibir os dados dos organizadores novatos e os dados dos respectivos organizadores orientadores, porém somente de um determinado organizador orientador
(informar o nome do organizador orientador na consulta). */
select novato.idOrganizador as idNovato, novato.nome as NomeDoNovato, novato.rua as RuaDoNovato, novato.bairro as BairroDoNovato, novato.email as EmailDoNovato,
 orientador.idOrganizador as idOrientador, orientador.nome as NomeDoOrientador, orientador.rua as RuaDoOrientador, orientador.bairro as bairroDoOrientador, orientador.email as EmailDoOrientador
 from organizador as novato join organizador as orientador on novato.fkOrientador = orientador.idOrganizador where orientador.nome = 'Miguel';
 
-- Exibir os dados de um organizador novato (informar o seu nome na consulta), os dados das respectivas campanhas em que trabalha e os dados do seu organizador orientador
select novato.idOrganizador as idNovato, novato.nome as NomeDoNovato, novato.rua as RuaDoNovato, novato.bairro as BairroDoNovato, novato.email as EmailDoNovato,
campanha.idCampanha as idCampanha, campanha.categoria as CategoriaDaCampanha, campanha.instituicao as InstituicaoDaCampanha, campanha.instituicao2 as SegundaInstituicaoDaCampanha, campanha.dtFinal as DataFinalDaCampanha,
orientador.idOrganizador as idOrientador, orientador.nome as NomeDoOrientador, orientador.rua as RuaDoOrientador, orientador.bairro as bairroDoOrientador, orientador.email as EmailDoOrientador 
from organizador as novato join organizador as orientador on novato.fkOrientador = orientador.idOrganizador
join campanha as campanha on novato.idOrganizador = campanha.fkOrganizador where novato.nome = 'Suellen';