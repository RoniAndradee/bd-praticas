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
instituicao1 varchar(45),
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
(default, 'alimento', 'AACD', 'CAPS', '2023-12-15', 31),
(default, 'produto de higiene', 'Associação Peter Pan', null, '2024-02-12', 32),
(default, 'racao', 'Lar TinTin', null, '2024-01-26', 33),
(default, 'medicamento', 'ABRACE', null, '2023-08-02', 34),
(default, 'alimento', 'APAE', 'CAPS', '2022-10-18', 35),
(default, 'produto de limpeza', 'Casa do Zezinho', 'Cruz Vermelha', '2024-03-29', 36),
(default, 'roupa', 'criança esperança', null, '2023-08-15', 31),
(default, 'material de pintura', 'ICA', null, '2022-05-02', 32);










