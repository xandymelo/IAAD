-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Empresa 

begin;
create schema biblioteca_Alexandre; -- inclua seu nome
-- O comando 'create database' é semelhante ao comando 'create schema'
use biblioteca_Alexandre;

-- Criando as tabelas
create table LIVRO(
	Cod_livro CHAR(11) NOT NULL,
	Titulo CHAR (45),
	Nome_editora VARCHAR (45) NOT NULL,
	PRIMARY KEY(Cod_livro),
    UNIQUE(Cod_livro)); -- Aplicando a restrição de chave primária (PK)
create table LIVRO_AUTOR(
	Cod_livro CHAR(11) NOT NULL,
	Nome_autor CHAR(45)  NOT NULL,
	PRIMARY KEY (Nome_autor));
create table EDITORA(
	Nome CHAR(45) NOT NULL,
	Endereço CHAR(45) NOT NULL,
	Telefone CHAR(11) NOT NULL,
    PRIMARY KEY (Nome));
create table LIVRO_COPIAS(
	Cod_livro CHAR(11) NOT NULL,
	Cod_unidade CHAR(11) NOT NULL,
	Qtd_copia INT NOT NULL);
create table LIVRO_EMPRESTIMO(
	Cod_livro CHAR(11) NOT NULL,
	Cod_unidade CHAR(11) NOT NULL,
	Nr_cartao CHAR(10),
	Data_emprestimo DATE,
    Data_devolucao DATE);
create table UNIDADE_BIBLIOTECA(
	Cod_unidade CHAR(11) NOT NULL,
	Nome_unidade CHAR(11) NOT NULL,
	Endereço CHAR(45),
    PRIMARY KEY (Cod_unidade));
    
create table USUARIO(
	Num_cartao CHAR(10) NOT NULL,
	Nome CHAR(40) NOT NULL,
	Endereco CHAR(40),
	Telefone CHAR(11),
    PRIMARY KEY (Num_cartao));
-- populando/carregando as tabelas do banco de dados
insert into LIVRO values
	('11111','Homodeus','Pearson'),
	('11112','Harry Potter','Pearson'),
    ('11113','História de Robôs','Rob');
 insert into LIVRO_AUTOR values
	('11111','Autor1' ),
    ('11112','Jk Rowling'),
    ('11113', 'Autor3');		
insert into EDITORA values
	('Pearson','Ed1','99999999'),
    ('Rob','Ed2','88888888');
insert into LIVRO_COPIAS values
	('11111','001',10),
	('11112','001',50),
    ('11113','002',15);
insert into LIVRO_EMPRESTIMO values
	('11111','001','12','2020-03-01','2020-03-05'),
    ('11112','002','13','2020-03-02','2020-03-06');
insert into UNIDADE_BIBLIOTECA values
	('001','Unid. Lumos','Rua10'),
    ('002','Unid. Pai', 'Rua15');
insert into USUARIO values
	('12','Alexandre','Rua30', 'yyyyyyyy'),
    ('13','Roberta','Rua40', 'cccccccc');

-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table LIVRO_AUTOR ADD FOREIGN KEY(Cod_livro) REFERENCES LIVRO(Cod_livro);
alter table LIVRO ADD FOREIGN KEY(Nome_editora) REFERENCES EDITORA(Nome);
alter table LIVRO_COPIAS ADD FOREIGN KEY(Cod_unidade) REFERENCES UNIDADE_BIBLIOTECA(Cod_unidade);	
alter table LIVRO_EMPRESTIMO ADD FOREIGN KEY(Nr_cartao) REFERENCES USUARIO(Num_cartao);
commit;
