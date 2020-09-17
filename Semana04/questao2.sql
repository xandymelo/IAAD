-- Introdução ao Armazenamento e Análise de Dados (IAAD) - BSI/UFRPE
-- Script do Banco de Dados Empresa 

begin;
create schema questao2_Alexandre; -- inclua seu nome
-- O comando 'create database' é semelhante ao comando 'create schema'
use questao2_Alexandre;

-- Criando as tabelas
create table Cliente(
	CodCli CHAR(11) NOT NULL,
	Nome CHAR (45),
	Email CHAR (45),
    Telefone CHAR(12),
	PRIMARY KEY(CodCli)); -- Aplicando a restrição de chave primária (PK)
create table Produto(
	CodProd CHAR(11) NOT NULL,
	Descrição VARCHAR(45)  NOT NULL,
	PRIMARY KEY (CodProd));
create table Pedido(
	NumPedido CHAR(45) NOT NULL,
	CodCli CHAR(11) NOT NULL,
	DataPedido DATE NOT NULL,
    PRIMARY KEY (NumPedido));
create table ItemPedido(
	NumPedido CHAR(45) NOT NULL,
	NumItem CHAR(11) NOT NULL,
	CodProd CHAR(11) NOT NULL,
    Quantidade INT NOT NULL,
    PreçoUnitário INT,
    PRIMARY KEY (NumPedido,NumItem));

insert into Cliente values
	('11111','Alexandre','xandy@.com','xxxxxxxx'),
    ('11112','Eliza','eliza@.com','yyyyyyyy');
insert into Produto values
	('22222','Controle remoto universal'),
    ('33333','Celular Motog12');
insert into Pedido values
	('01','11111','2020-03-30'),
    ('02','11112','2020-04-12');
insert into ItemPedido values
	('01','99','22222',2,30),
    ('02','89','33333',3,40);

    

-- populando/carregando as tabelas do banco de dados


-- Aplicando a restrição de integridade referencial (chaves estrangeiras - FK)
alter table Pedido ADD FOREIGN KEY(CodCli) REFERENCES CLIENTE(CodCli);
alter table ItemPedido ADD FOREIGN KEY(CodProd) REFERENCES PRODUTO(CodProd) ON UPDATE CASCADE;
alter table ItemPedido ADD FOREIGN KEY(NumPedido) REFERENCES PEDIDO(NumPedido) ON DELETE CASCADE;
commit;
