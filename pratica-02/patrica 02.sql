-- Prática 02 tabela atleta

create table atleta(
	idAtleta int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

insert into atleta values
	(1, 'Henrique', 'Futebol', 7),
    (2, 'Luiz', 'Futebol', 3),
    (3, 'Kaique', 'Futebol', 5 ),
    (4, 'Gustavo', 'Basquete', 10),
    (5, 'Luan', 'Basquete', 6),
    (6, 'Maria', 'Basquete', 7),
    (7, 'João', 'Natacao', 5),
    (8, 'Pedro', 'Natacao', 3),
    (9, 'Paulo', 'Natacao', 8),
    (10, 'Luisa', 'Basquete', 9);

-- Exibir todos os dados da tabela.
select * from atleta;

-- Atualizar a quantidade de medalhas do atleta com id=1
update atleta set qtdMedalha = 12 where idAtleta = 1;

-- Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3
update atleta set qtdMedalha = 16 where idAtleta in (2, 3);

-- Atualizar o nome do atleta com o id=4 
update atleta set nome = 'Yuri Alberto' where idAtleta = 4;

-- Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;
alter table atleta add column dtNasc date;

-- Atualizar a data de nascimento de todos os atletas;
update atleta set dtNasc = '1993-10-07' where idAtleta between 7 and 11;

update atleta set dtNasc = '1978-08-22' where idAtleta = 4;

update atleta set dtNasc = '1984-03-02' where idAtleta in (1,3);

update atleta set dtNasc = '1999-09-08' where idAtleta in (2, 5, 6);

-- Excluir o atleta com o id=5
delete from atleta where idAtleta = 5;

-- Exibir os atletas onde a modalidade é diferente de natação 
select * from atleta where modalidade != 'natacao';

-- Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3
select * from atleta where qtdMedalha >= 3;

-- Modificar o campo modalidade do tamanho 40 para o tamanho 60
alter table atleta modify column modalidade varchar(80);

-- Descrever os campos da tabela mostrando a atualização do campo modalidade
describe atleta;

-- Limpar os dados da tabela
truncate table atleta;


-- prática 02 tabela musica

create table musica(
	idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

insert into musica values 
(1, 'Beco sem saida', 'Charlie brown jr', 'Rock brasileiro'),
(2, 'Cheia de vida', 'Charlie brown jr', 'Rock brasileiro'),
(3, 'O nosso blues', 'Charlie brown jr', 'Rock brasileiro'), 
(4, 'Poderosa', 'MC IG', 'Funk'),
(5, '400k', 'MC IG', 'Funk'),
(6, 'Retrovisor', 'Evoney Fernandes', 'Seresta'),
(7, 'Amor de rapariga', 'Evoney Fernandes', 'Seresta'),
(8, 'Vendedora de amor', 'Evoney Fernandes', 'Seresta');

insert into musica values 
(9, 'Tantos Planos', 'Brocasito', 'Plug', 32134),
(10, 'Atirador Fresstyle', 'Brocasito', 'Plug', 123123),
(11, 'Opp Stoppa', 'Brocasito', 'Plug', 321345);

-- Exibir todos os dados da tabela
select * from musica;

-- Adicionar o campo curtidas do tipo int na tabela;
alter table musica add column curtidas int;

-- Atualizar o campo curtidas de todas as músicas inseridas;
update musica set curtidas = 121543 where idMusica = 1;

update musica set curtidas = 52322 where idMusica = 2;

update musica set curtidas = 42343 where idMusica = 3;

update musica set curtidas = 24522 where idMusica in (4,5);

update musica set curtidas = 666666 where idMusica between 6 and 8;

-- Modificar o campo artista do tamanho 40 para o tamanho 80
alter table musica modify column artista varchar(80);

-- Atualizar a quantidade de curtidas da música com id=1
update musica set curtidas = 177354 where idMusica = 1;

-- Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3
update musica set curtidas = 355833 where idMusica in (2, 3);

-- Atualizar o nome da música com o id=5
update musica set titulo = 'Medley 2020' where idMusica = 5;

-- Excluir a música com o id=4
delete from musica where idMusica = 4;

-- Exibir as músicas onde o gênero é diferente de funk
select * from musica where genero != 'Funk';

-- Exibir os dados das músicas que tem curtidas maior ou igual a 20
select * from musica where curtidas >= 20;

-- Descrever os campos da tabela mostrando a atualização do campo artista
describe musica;

-- Limpar os dados da tabela
truncate table musica;


-- pratica 02 tabela filme 

create table filme(
idFilme int auto_increment primary key,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);

insert into filme values
(default, 'Velozes e Furiosos', 'Ação', 'Justin Lin'),
(default, 'Velozes e Furiosos Desafio em Tokyo', 'Ação', 'Justin Lin'),
(default, 'Em ritmo de fuga', 'Ação', 'Eduardo Silva'),
(default, 'A freira', 'Terror', 'Eduardo Silva'),
(default, 'Anabelle', 'Terror', 'José Antonio'),
(default, 'A orfã 2', 'Teror', 'José Antonio'),
(default, 'Caçador de medos', 'Teror', 'Zezin Almeida'),
(default, 'Ford vs Ferrari', 'Corrida', 'Zezin Almeida'),
(null, 'Carros 2', 'Corrida', 'Wellington Rato'),
(null, 'Bugatti Medrosa', 'Corrida', 'Wellington Rato');

-- Exibir todos os dados da tabela
select * from filme;

-- Adicionar o campo protagonista do tipo varchar(50) na tabela
alter table filme add column protagonista varchar(50);

-- Atualizar o campo protagonista de todas os filmes inseridos
update filme set protagonista = 'Toretto' where idFilme = 1;

update filme set protagonista = 'Han' where idFilme = 2;

update filme set protagonista = 'Nego do borel' where idFilme = 3;

update filme set protagonista = 'Mano Brown' where idFilme in (4,6);

update filme set protagonista = 'Baianinho de Mauá' where idFilme between 7 and 10;

update filme set protagonista = 'Nego Drama' where idFilme = 5;

-- Modificar o campo diretor do tamanho 40 para o tamanho 150
alter table filme modify column diretor varchar(150);

-- Atualizar o diretor do filme com id=5
update filme set diretor = 'Nego Drama' where idFilme = 5;

-- Atualizar o diretor dos filmes com id=2 e com o id=7;
update filme set diretor = 'Nego Drama' where idFilme in (2,7);

-- Atualizar o título do filme com o id=6
update filme set titulo = 'Filmao' where idFilme = 6;

-- Excluir o filme com o id=3 
delete from filme where idFilme = 3;

-- Exibir os filmes em que o gênero é diferente de drama
select * from filme where genero != 'drama';

-- Exibir os dados dos filmes que o gênero é igual ‘suspense’
select * from filme where genero = 'suspense';

-- Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor
describe filme;

-- Limpar os dados da tabela
truncate table filme;

-- pratica 02 tabela professor

create table professor(
idProfessor int auto_increment primary key,
nome varchar(50),
especialidade varchar(40),
dtNasc date);

insert into professor values
(default, 'Jota Pê', 'Algoritmo', '1991-12-23'),
(default, 'Xande', 'Algoritmo', '1983-03-05'),
(default, 'Alex', 'Arq. Comp', '1999-04-09'),
(default, 'Marise', 'Arq. Comp', '1985-05-23'),
(default, 'Rayssa', 'Socioemocional', '2000-08-10'),
(default, 'Kaline', 'Socioemocional', '1994-11-28');

-- Exibir todos os dados da tabela
select * from professor;

-- Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’, ‘assistente’ ou ‘titular'
alter table professor add column funcao varchar(50);
alter table professor add constraint chkFuncao check (funcao in ('monitor', 'assistente', 'titular'));

-- Atualizar os professores inseridos e suas respectivas funções
update professor set funcao = 'titular' where idProfessor in (2,5);

update professor set funcao = 'assistente' where idProfessor in (1,3,4);

update professor set funcao = 'monitor' where idProfessor = 6;

-- Inserir um novo professor
insert into professor values
(default, 'Joaquim', 'Banco de dados', '2002-04-09', 'Monitor');

-- Excluir o professor onde o idProfessor é igual a 5
delete from professor where idProfessor = 5;

-- Exibir apenas os nomes dos professores titulares
select * from professor where funcao = 'titular';

-- Exibir apenas as especialidades e as datas de nascimento dos professores monitores
select especialidade, dtNasc from professor where funcao = 'monitor';

-- Atualizar a data de nascimento do idProfessor igual a 3
update professor set dtNasc = '1996-10-28' where idProfessor = 3;

-- Limpar a tabela Professor
truncate table professor;


-- pratica 02 tabela curso

create table curso (
	idCurso int auto_increment primary key,
    nome varchar(50),
    sigla char(3),
    coordenador varchar(50)
);

insert into curso values
(default, 'Ciência da Computação', 'CCO', 'Marise Miranda'),
(default, 'Sistemas de Informação', 'SIS', 'Alex Barreira'),
(default, 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Gerson Santos');

-- Exibir todos os dados da tabela
select * from curso;

-- Exibir apenas os coordenadores dos cursos
select coordenador from curso;

-- Exibir apenas os dados dos cursos de uma determinada sigla.
select * from curso where sigla = 'ADS';

-- Exibir os dados da tabela ordenados pelo nome do curso.
select * from curso order by nome;

-- Exibir os dados da tabela ordenados pelo nome do coordenador em ordem decrescente.
select * from curso order by coordenador desc;

-- Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.
select * from curso where nome like 'a%';

-- Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.
select * from curso where nome like '%o';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma determinada letra.
select * from curso where nome like '_i%';

-- Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma determinada letra
select * from curso where nome like '%a_';

-- Elimine a tabela
drop table curso;


-- pratica 02 tabela revista

create table revista(
idRevista int primary key,
nome varchar(40),
categoria varchar(30)
);

alter table revista modify column idRevista int auto_increment;
alter table revista auto_increment = 1;

insert into revista values
(default, 'Quatro Rodas', null),
(default, 'Veja', null),
(default, 'Recreio', null),
(default, 'Vista', null);

-- Exibir todos os dados da tabela.
select * from revista;

-- Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela novamente para verificar se atualizou corretamente.
update revista set categoria = 'Automobilismo' where idRevista = 1;

update revista set categoria = 'Noticias' where idRevista in (2,4);

update revista set categoria = 'Infantil' where idRevista = 3;

select * from revista;

-- Insira mais 3 registros completos.
insert into revista values 
(default, 'Fórmula 1', 'Automobilismo'),
(default, 'Música em foco', 'Musica'),
(default, 'Democracia total', 'Política');

-- Exibir novamente os dados da tabela.
select * from revista;

-- Exibir a descrição da estrutura da tabela.
describe revista;

-- Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.
alter table revista modify column categoria varchar(40);

-- Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna categoria
describe revista;

-- Acrescentar a coluna periodicidade à tabela, que é varchar(15).
alter table revista add column periodicidade varchar(15);

-- Exibir os dados da tabela
select * from revista;

-- Excluir a coluna periodicidade da tabela.
alter table revista drop column periodicidade;







