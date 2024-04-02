create database recursividade;
use recursividade;

-- criação da tabela dono
create table dono (
idDono int primary key auto_increment,
nome varchar(45),
bairro varchar(50),
telefone varchar(20));

-- criação da tabela pet
create table pet(
idPet int primary key auto_increment,
nome varchar(45),
pedigree varchar(45),
constraint chkPedigree check (pedigree in('sim', 'nao')),
raca varchar(45),
fkPai int,
 constraint fkPaiPet foreign key (fkPai)
	references pet(idPet),
fkMae int, 
constraint fkMaePet foreign key (fkMae)
	references pet(idPet),
fkDono int not null, 
 constraint fkPetDono foreign key (fkDono)
	references dono(idDono)
);

-- inserindo dados na tabela dono
insert into dono values 
(default, 'Roni', 'Taipas', '11977336964'),
(default, 'Maria', 'Pirituba', '11955886425');

-- inserindo dados na tabela pet
insert into pet (idPet, nome, pedigree, raca, fkDono) values
(default, 'Juninho', 'nao', 'siamês', 1),
(default, 'NegoWhite', 'sim', 'siamês', 1),
(default, 'Tereza', 'sim', 'persa', 2);

-- atualizando os pais dos pets
update pet set fkPai = 2 where idPet = 1;
update pet set fkMae = 3 where idPet = 1;

-- selecionando o nome do pet, o nome do seu pai o nome de sua mãe, o nome do seu dono e o telefone do dono
select filho.nome as PetFilho,
pai.nome as PetPai,
mae.nome as petMae,
dono.nome as nomeDono,
dono.telefone as TelefoneDoDono
from pet as filho
join pet as pai on filho.fkPai = pai.idPet
join pet as mae on filho.fkMae = mae.idPet
join dono on filho.fkDono = dono.idDono;

-- tabela motorista e carro
-- criação da tabela carro
create table carro(
idCarro int primary key auto_increment,
nome varchar(45),
placa varchar(8),
marca varchar(45));

-- criação da tabela motorista
create table motorista(
idMotorista int primary key auto_increment,
nome varchar(45),
cnh char(9),
dtValidade date,
fkMotoristaReserva int,
constraint fkReservaMotorista foreign key (fkMotoristaReserva)
	references motorista (idMotorista),
fkCarro int, 
constraint fkMotoristaCarro foreign key (fkCarro)
	references carro(idCarro)
); 

-- inserindo dados na tabela carro
insert into carro values
(default, 'Civic', 'DYB-2777', 'Honda'),
(default, 'I30', 'KIR-8H21', 'Hyundai'),
(default, 'Chevette', 'EIY-4593', 'Chevrolet');

-- inserindo dados na tabela motorista
insert into motorista (idMotorista, nome, cnh, dtValidade) values
(default, 'Ronielli', '109458328', '2025-04-12'),
(default, 'Ezequiel', '187594687', '2027-07-25'),
(default, 'Hamilton', '183285368', '2028-08-30');

-- atualizando o motorista reserva de cada motorista
update motorista set fkMotoristaReserva = 2 where idMotorista = 1;
update motorista set fkMotoristaReserva = 1 where idMotorista = 3;
update motorista set fkMotoristaReserva = 3 where idMotorista = 2;

-- atualizando o carro de cada motorista
update motorista set fkCarro = 1 where idMotorista = 1;
update motorista set fkCarro = 3 where idMotorista = 2;
update motorista set fkCarro = 2 where idMotorista = 3;

-- selecionando o nome do motorista, o nome do seu carro, a marca do seu carro, o nome do seu motorista reserva
select motorista.nome as NomeDoMotorista, 
carro.nome as CarroDoMotorista, carro.marca as MarcaDoCarro,
reserva.nome as NomeDoReserva
from motorista
join motorista as reserva on motorista.fkMotoristaReserva = reserva.idMotorista
join carro on motorista.fkCarro = carro.idCarro;

-- tabelas empresa e funcionário
-- criação da tablea empresa 
create table empresa(
idEmp int primary key auto_increment,
nome varchar(45),
cnpj char(14),
fkMatriz int, 
constraint fkEmpresaMatriz foreign key (fkMatriz)
references empresa (idEmp));

-- criação da tabela funcionario
create table funcionario(
idFunc int primary key auto_increment,
nome varchar(45),
area varchar(45),
salario decimal(8,2),
fkSupervisor int,
constraint fkFuncionarioSupervisor foreign key (fkSupervisor)
	references funcionario(idFunc));
    
-- criando chave estrangeira da empresa do funcionario
alter table funcionario add column fkEmpresa int,
add constraint fkFuncionarioEmpresa foreign key (fkEmpresa)
	references empresa(idEmp);

-- inserindo dados na tabela empresa
insert into empresa (idEmp, nome, cnpj) values
(default, 'Honda São Paulo', '93248654838284'),
(default, 'Honda Japão', '25648654812354'),
(default, 'Honda Bahia', '1267707397145');

-- atualizando a matriz de cada empresa 
update empresa set fkMatriz = 2 where idEmp = 1;
update empresa set fkMatriz = 1 where idEmp = 3;
update empresa set fkMatriz = 2 where idEmp = 2;

-- inserindo dados na tabela funcionario
insert into funcionario (idFunc, nome, area, salario) values
(default, 'Fernando', 'Borracharia', 4550.00),
(default, 'Kalleb', 'Borracharia', 6800.00),
(default, 'Zézinho', 'Elétrica', 4200.00),
(default, 'Zezão', 'Elétrica', 6100.00),
(default, 'Homem Pedra', 'Marketing', 5800.00),
(default, 'Pardinho', 'Marketing', 7800.00);

-- atualizando o supervisor de cada funcionario
update funcionario set fkSupervisor = 2 where idFunc = 1;
update funcionario set fkSupervisor = 4 where idFunc = 3;
update funcionario set fkSupervisor = 6 where idFunc = 5;

-- atualizando a empresa de cada funcionario
update funcionario set fkEmpresa = 1 where idFunc in(1,2);
update funcionario set fkEmpresa = 2 where idFunc in(3,4);
update funcionario set fkEmpresa = 3 where idFunc in(5,6);

-- selecionando o nome do funcionario, seu salário, nome do seu supervisor, seu salário, a empresa em que ele trabalha e a matriz da empresa que ele trabalha
select funcionario.idFunc, funcionario.nome as NomeDoFuncionario, funcionario.salario as SalarioDoFuncionario,
supervisor.nome as NomeDoSupervisor, supervisor.salario as SalarioDoSupervisor,
empresa.nome as EmpresaQueTrabalha, matriz.nome as MatrizDaEmpresa
 from funcionario
join funcionario as supervisor on funcionario.fkSupervisor = supervisor.idFunc
join empresa as empresa on funcionario.fkEmpresa = empresa.idEmp
join empresa as matriz on empresa.fkMatriz = matriz.idEmp;

/*
selecionando o nome do funcionario, a area que ele trabalha, o salario dele, o nome do supervisor dele, a area que o supervisor trabalha,
o salario do supervisor e a empresa que eles tabalham e a matriz dessa empresa
*/
select funcionario.nome as NomeFunc, funcionario.area as Area, funcionario.salario as SalarioFunc,
supervisor.nome as NomeSupervisor, supervisor.area as Area, supervisor.salario as SalarioSupervisor,
empresa.nome as nomeDaEmpresa, 
matriz.nome as MatrizDaEmpresa
from funcionario
join funcionario as supervisor on funcionario.fkSupervisor = supervisor.idFunc
join empresa as empresa on funcionario.fkEmpresa = empresa.idEmp
join empresa as matriz on empresa.fkMatriz = matriz.idEmp;

-- selecionando o nome da empresa e a sua matriz 
select empresa.nome,
matriz.nome 
from empresa 
join empresa as matriz on empresa.fkMatriz = matriz.idEmp;