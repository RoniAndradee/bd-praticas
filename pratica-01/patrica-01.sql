-- pratica 01 tabela atleta

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
    (9, 'Paulo', 'Natacao', 8);
    
insert into atleta values (10, 'Luisa', 'Basquete', 9);

-- Exibir todos os dados da tabela.
select * from atleta;

--  Exibir apenas os nomes e quantidade de medalhas dos atletas.
select nome, qtdMedalha from atleta;

-- Exibir apenas os dados dos atletas de uma determinada modalidade.
select * from atleta where modalidade = 'basquete';

-- Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
select * from atleta where nome like '%s%';

-- Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
select * from atleta where nome like 'm%';

--  Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
select * from atleta where nome like '%o';

-- Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
select * from atleta where nome like '%r_';



-- pratica 01 tabela musica

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


-- a) Exibir todos os dados da tabela.
select * from musica;

-- b) Exibir apenas os títulos e os artistas das músicas.
select titulo, artista from musica;

-- c) Exibir apenas os dados das músicas de um determinado gênero.
select * from musica where genero = 'funk';

-- d) Exibir apenas os dados das músicas de um determinado artista.
select * from musica where artista = 'evoney fernandes';

-- e) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.
select * from musica where titulo like 'v%';

-- f) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.
select * from musica where artista like '%r';

-- g) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma determinada letra.
select * from musica where genero like '_e%';

-- h) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma determinada letra.
select * from musica where titulo like '%o_';


