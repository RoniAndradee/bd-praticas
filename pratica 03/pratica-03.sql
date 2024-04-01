create database sprint2;
use sprint2;

-- prática 03 tabelas Atleta e Pais

-- Criação tabela atleta
create table atleta(
	idAtleta int primary key auto_increment,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

-- inserindo dados na tabela atleta
insert into atleta values
    (default, 'Louis', 'Futebol', 8),
    (default, 'Kaique', 'Futebol', 5 ),
    (default, 'Gustavo', 'Basquete', 10),
    (default, 'Luan', 'Basquete', 6),
    (default, 'Maria', 'Basquete', 7),
    (default, 'João', 'Natacao', 5),
    (default, 'Pedro', 'Natacao', 3),
    (default, 'Paulo', 'Natacao', 8),
    (default, 'Luisa', 'Basquete', 9);

-- criação da tabela pais
create table pais (
	idPais int primary key auto_increment,
    nome varchar(30),
    capital varchar(40));
    
-- inserindo dados na tabela pais
insert into pais values
(default, 'Brasil', 'Brasilia'),
(default, 'República Tcheca', 'Praga'),
(default, 'Japão', 'Tóquio'),
(default, 'Holanda', 'Amsterdam'),
(default, 'Itália', 'Roma');

-- criar chave estrangeira na tabela atleta
alter table atleta add column fkPais int,
add constraint fkPaisAtleta foreign key (fkPais)
references pais(idPais);
        
-- atualizar o país de todos os atletas
update atleta set fkPais = 1 where idAtleta = 1;
update atleta set fkPais = 4 where idAtleta in(2,4);
update atleta set fkPais = 2 where idAtleta = 3;
update atleta set fkPais = 5 where idAtleta = 5;
update atleta set fkPais = 3 where idAtleta between 7 and 9;
update atleta set fkPais = 2 where idAtleta = 6;

-- Exibir os atletas e seu respectivo país
select * from atleta join pais on idPais = fkPais;

-- Exibir apenas o nome do atleta e o nome do respectivo país
select atleta.nome, pais.nome from atleta join pais on idPais = fkPais;

-- Exibir os dados dos atletas, seus respectivos países, de uma determinada capital;
select * from atleta join pais on idPais = fkPais where pais.capital = 'Praga';

-- prática 04 tabelas musica e album

-- Criação da tabela música
create table musica(
	idMusica int primary key auto_increment,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40));

-- inserindo dados na tabela música
insert into musica values 
(default, 'Tantos Planos', 'Brocasito', 'Plug'),
(default, 'Atirador Fresstyle', 'Brocasito', 'Plug'),
(default, 'Opp Stoppa', 'Brocasito', 'Plug'),
(default, 'Bilu Bilu', 'Pablo', 'Arrocha'),
(default, 'Desculpe Aí', 'Pablo', 'Arrocha'),
(default, 'Gênio da Latinha', 'Pablo', 'Arrocha'),
(default, 'Saudades de Rosa', 'Evoney Fernandes', 'Seresta'),
(default, 'Amor de rapariga', 'Evoney Fernandes', 'Seresta'),
(default, 'Vendedora de amor', 'Evoney Fernandes', 'Seresta');

-- criação da tabela album
create table album (
	idAlbum int primary key auto_increment not null,
    nome varchar(45),
    tipo varchar(7),
    constraint chkTipo check (tipo in('digital', 'fisico')),
    dtLancamento date);

-- inserindo dados na tabela album
insert into album values
(default, 'Êee...Paixão!', 'digital', '2013-10-19'),
(default, 'Todo mundo odeia o IG', 'digital', '2024-03-22'),
(default, 'Imunidade Musical', 'fisico', '2005-08-23');

-- exibir todos os dados das tabelas separadamente
select * from musica;
select * from album;

-- criar chave estrangeira na tabela de acordo com a regra de negócio
alter table musica add column fkAlbum int,
add constraint fkAlbumMusica foreign key (fkAlbum)
references album (idAlbum);

-- atualiar os álbuns de cada música
update musica set fkAlbum = 1 where idMusica between 4 and 6;
update musica set fkAlbum = 3 where idMusica in(1,7,9);
update musica set fkAlbum = 2 where idMusica in (2,3,8);

alter table musica modify column fkAlbum int not null;

-- exibir as músicas e seus respectivos álbuns
select * from musica join album on idAlbum = fkAlbum;

-- exibir somente o título da música e o nome do seu respectivo álbum
select m.titulo, a.nome from musica as m join album as a on a.idAlbum = m.fkAlbum;

-- exibir os dados das músicas e seu respectivo album, de um determinado tipo
select * from musica join album on idAlbum = fkAlbum where tipo = 'fisico';
