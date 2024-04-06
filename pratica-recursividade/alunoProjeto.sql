create database alunoProjeto;
use alunoProjeto;

-- Criar as tabelas equivalentes à modelagem
create table projeto (
idProjeto int primary key auto_increment,
nome varchar(45),
descricao varchar(80)
);

create table aluno(
ra char(8) primary key,
nome varchar(45),
telefone varchar(20),
fkProjeto int,
constraint fkAlunoProjeto foreign key (fkProjeto)
	references projeto(idProjeto),
fkRepresentante char(8),
constraint fkAlunoRepresentante foreign key (fkRepresentante)
	references aluno(ra)
);

-- Inserir dados nas tabelas
insert into projeto values
(default, 'Aquaponix', 'Monitoramento de sistemas aquaponicos'),
(default, 'MkTech', 'Monitoramento do fluxo de pessoas em setores de mercados'),
(default, '3GO', 'Monitoramento de trigo');

insert into aluno (ra, nome,telefone, fkProjeto) values
('01241014', 'Mário', '(84) 3112-7731', 2),
('01241040', 'Ronielli', '(49) 2453-3993', 1),
('01241275', 'Geraldo', '(21) 3613-6170', 3),
('01241323', 'Ronaldo', '(48)2201-4835', 1),
('01241455', 'Maria', '(91) 3246-8321', 3),
('01241632', 'José', '(74) 3392-8673', 2);

update aluno set fkRepresentante = '01241040' where ra in('01241323', '01241455');
update aluno set  fkRepresentante = '01241632' where  ra in('01241014', '01241275');

-- Exibir todos os dados de cada tabela criada, separadamente
select * from projeto;
select * from aluno;

-- Exibir os dados dos alunos e dos projetos correspondentes
select a.ra as raAluno, a.nome as NomeDoAluno, a.telefone as TelefoneDoAluno, a.fkProjeto as ProjetoDoAluno, a.fkRepresentante as RepresentanteDoAluno,
p.idProjeto as idProjetoDoAluno, p.nome as NomeDoProjeto, p.descricao as DescricaoDoProjeto
from aluno as a join projeto as p on fkProjeto = idProjeto;

-- Exibir os dados dos alunos e dos seus representantes
select a.ra as raAluno, a.nome as NomeDoAluno, a.telefone as TelefoneDoAluno, a.fkProjeto as ProjetoDoAluno,
r.ra as raRepresentante, r.nome as NomeDoRepresentante, r.telefone as TelefoneDoRepresentante, r.fkProjeto as ProjetoDoRepresentante
from aluno as a join aluno as r on a.fkRepresentante = r.ra;

-- Exibir os dados dos alunos e dos projetos correspondentes, mas somente de um determinado projeto (indicar o nome do projeto na consulta)
select a.ra as raAluno, a.nome as NomeDoAluno, a.telefone as TelefoneDoAluno, a.fkProjeto as ProjetoDoAluno, a.fkRepresentante as RepresentanteDoAluno,
p.idProjeto as idProjetoDoAluno, p.nome as NomeDoProjeto, p.descricao as DescricaoDoProjeto
from aluno as a join projeto as p on fkProjeto = idProjeto where p.nome = 'Aquaponix';


