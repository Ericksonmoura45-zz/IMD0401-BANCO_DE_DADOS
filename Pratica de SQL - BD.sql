-- Pratica de SQL

CREATE DATABASE empresa
  WITH OWNER = Erickson
  ENCODING = 'UTF8'
  CONNECTION LIMIT = -1;

-- Tabelas
-- TODO: auto increment keys
CREATE TABLE Produto (
    idProduto SERIAL NOT NULL,
    idTrabalhador INTEGER NOT NULL,
    descricaoProduto VARCHAR(45) NULL,
    areaPlantada FLOAT,
    
    CONSTRAINT produto_key PRIMARY KEY(idProduto),
    CONSTRAINT trabalhador_fkey FOREIGN KEY(idTrabalhador) REFERENCES Trabalhador(idTrabalhador) 
    MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
CREATE TABLE Trabalhador (
    idTrabalhador SERIAL NOT NULL,
    nomeTrabalhador VARCHAR(40) NULL,
    dataNascimento DATE,
    especialidade VARCHAR(10) CHECK (especialidade = 'Jardineiro' or especialidade = 'Agronomo' or especialidade = 'Hortelao'),

    CONSTRAINT trabalhador_key PRIMARY KEY(idTrabalhador)
);
CREATE TABLE Venda (
    idVenda SERIAL NOT NULL,
    idComprador INTEGER NOT NULL,
    idProduto INTEGER NOT NULL,
    dataVenda DATE,
    quantidadeProdutos INTEGER NULL,
    valorVenda FLOAT,
    dataRecebimento DATE,
    
    CONSTRAINT venda_key PRIMARY KEY(idVenda),

    CONSTRAINT comprador_fkey FOREIGN KEY(idComprador) REFERENCES Comprador(idComprador)
    MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION,

    CONSTRAINT produto_fkey FOREIGN KEY(idProduto) REFERENCES Produto(idProduto)
    MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
    
CREATE TABLE Comprador (
    idComprador SERIAL NOT NULL,
    idTrabalhador INTEGER NOT NULL,
    nomeComprador VARCHAR(40) NULL,
    cidadeComprador VARCHAR(20) NULL,
    
    CONSTRAINT comprador_key PRIMARY KEY(idComprador),

    CONSTRAINT trabalhador_fkey FOREIGN KEY(idTrabalhador) REFERENCES Trabalhador(idTrabalhador)
    MATCH SIMPLE ON UPDATE NO ACTION ON DELETE NO ACTION
);
-- Inserindo Dados 
INSERT into Produto(descricaoProduto, areaPlantada) values ('Batata Doce', '5.14');
INSERT into Produto(descricaoProduto, areaPlantada) values ('Acerola', '10.14');
INSERT into Produto(descricaoProduto, areaPlantada) values ('Arroz', '20');
INSERT into Produto(descricaoProduto, areaPlantada) values ('Cenoura', '6.5');
INSERT into Produto(descricaoProduto, areaPlantada) values ('Abobora', '2.3');

INSERT into Trabalhador(nomeTrabalhador, dataNascimento, especialidade) values ('Joaquim Ferreira','19/01/1980', 'Hortelao');
INSERT into Trabalhador(nomeTrabalhador, dataNascimento, especialidade) values ('Mauricio Nunes','14/04/1987', 'Agronomo');
INSERT into Trabalhador(nomeTrabalhador, dataNascimento, especialidade) values ('Ana Maria','01/12/1990', 'Jardineiro');

INSERT into Comprador(nomeTrabalhador, cidadeComprador) values ('Marcio','Natal');
INSERT into Comprador(nomeTrabalhador, cidadeComprador) values ('Erickson','Natal');
INSERT into Comprador(nomeTrabalhador, cidadeComprador) values ('Denis','Sao Gonçalo');
INSERT into Comprador(nomeTrabalhador, cidadeComprador) values ('Pedro','Lajes');

