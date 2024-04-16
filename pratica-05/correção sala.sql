create table treinador(
idTreinador int primary key auto_increment,
nome varchar(45),
telefoneCelular varchar(45),
telefoneFixo varchar(45),
fkExperiente int,
constraint fkNovatoExperiente foreign key (fkExperiente)
	references treinador (idTreinador)
) auto_increment = 10;

-- treinador experiente = fk vai ser nula
insert into treinador values 
(default, 'Toninho', '11987574778', null, null);
    
select * from treinador;
    
-- treinador sem vínculo com o nadador = pk dele nao vai ser usada em nenhum nadador
insert into treinador values
(default, 'Tonico', null, '1345678498', 10);

-- inserindo nadador
insert into treinador values
(default, 'Taninha', null, null, 10);

-- entidade fraca = pk composta
create table nadador(
idNadador int,
fkTreinador int,
constraint pkComposta primary key (idNadador, fkTreinador),
nome varchar(45),
apelido varchar(45), -- apelido + dominio = atributo composto
dominio varchar(45),
constraint fkNadadorTreinador foreign key (fkTreinador)
	references treinador (idTreinador)
);

alter table nadador modify column idNadador int auto_increment;
alter table nadador auto_increment = 100;

insert into nadador values 
(default, 10, 'Tinoco', 'tinoquinho', 'gmail.com'),
(default, 12, 'Tina', 'tininha', 'hotmail.com');

select * from nadador;

select novato.nome as NomeNovato, experiente.nome as NomeExperiente, nadador.nome as NomeNadador from treinador as novato join treinador as experiente
on novato.fkExperiente = experiente.idTreinador
join nadador on novato.idTreinador = nadador.fkTreinador;
 
 
select * from nadador join treinador on idTreinador = fkTreinador;

select nadador.nome as Nadador, 
treinador.nome as Treinador from nadador join treinador on idTreinador = fkTreinador;

select nadador.nome as Nadador, 
treinador.nome as Treinador from nadador right join treinador on idTreinador = fkTreinador;

select nadador.nome as Nadador, 
treinador.nome as Treinador from nadador right join treinador on idTreinador = fkTreinador where idNadador is null;

select ifnull(nadador.nome, 'Treinador Disponível') as Nadador, 
treinador.nome as Treinador from nadador right join treinador on idTreinador = fkTreinador;
