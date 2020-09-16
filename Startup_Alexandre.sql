-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Empresa 

begin;
create schema Startup_Alexandre; -- inclua seu nome
-- O comando 'create database' é semelhante ao comando 'create schema'
use Startup_Alexandre;

-- Criando as tabelas
create table STARTUP(
	id_startup INT NOT NULL,
	nome_startup VARCHAR(45),
	PRIMARY KEY(id_startup));  -- Aplicando a restrição de chave primária (PK)
create table LINGUAGEM_PROGRAMACAO(
	id_linguagem INT NOT NULL,
	linguagem VARCHAR(30),
	PRIMARY KEY (id_linguagem));
create table PROGRAMADOR(
	id_programador INT NOT NULL,
	id_startup INT NOT NULL,
    nome_programador VARCHAR(45),
	PRIMARY KEY (id_programador));
create table PROGRAMADOR_LINGUAGEM(
	id_programador INT NOT NULL,
	id_linguagem INT NOT NULL);

-- populando/carregando as tabelas do banco de dados
insert into STARTUP values
	(1,'Startup1'),
	(2,'Startup2'),
    (3,'Startup3'),
    (4,'Startup4'),
    (5,'Startup5'),
    (6,'Startup6');	
 insert into LINGUAGEM_PROGRAMACAO values
	(1,'Python'),
    (2,'PHP'),
    (3,'Java'),
    (4,'Swift'),
    (5,'C#'),
    (6,'JavaScript');
insert into PROGRAMADOR values
	(1,1,'João'),
	(2,2,'Paula'),
    (3,3,'Renata'),
    (4,4,'Felipe'),
    (5,5,'Ana'),
    (6,6,'Alexandre');
insert into PROGRAMADOR_LINGUAGEM values
	(1,1),
	(1,2),
    (2,3),
    (3,4),
    (3,5),
    (4,5);
-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table PROGRAMADOR	ADD FOREIGN KEY(id_startup) REFERENCES STARTUP(id_startup);
alter table PROGRAMADOR_LINGUAGEM ADD FOREIGN KEY(id_programador) REFERENCES PROGRAMADOR(id_programador);
alter table PROGRAMADOR_LINGUAGEM ADD FOREIGN KEY(id_linguagem) REFERENCES LINGUAGEM_PROGRAMACAO(id_linguagem);

commit;