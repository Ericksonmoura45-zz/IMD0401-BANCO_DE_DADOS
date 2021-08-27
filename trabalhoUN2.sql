CREATE DATABASE TrabalhoUN2;

-- Tabelas:

CREATE TABLE Cliente (
     idCliente INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
     nomeCliente VARCHAR(30),
     cpf VARCHAR(11) UNIQUE,
     email VARCHAR(25),
     
);
CREATE TABLE Orcamento (
    idOrcamento INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    idCliente_Or INT FOREIGN KEY 
    REFERENCES Cliente(idCliente),
    descricaoProblema VARCHAR(200),
    situacao VARCHAR(15),
    dataInicio DATE,
    dataFim DATE,
    totalValor FLOAT,
    totalHoras INTEGER,

    CONSTRAINT check_situacao CHECK(situacao = 'Aberto' or situacao ='Aprovado'
    or situacao = 'Finalizado'),

);
CREATE TABLE SERVICO(
    idServico INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    descricaoProdutos VARCHAR(50),
    valorServico FLOAT,
    horaServico INT,

);


CREATE TABLE Itens (
    idItens INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    idServico_Itens INT FOREIGN KEY
    REFERENCES SERVICO(idServico),
    idOrcamentos_Itens INT FOREIGN KEY
    REFERENCES Orcamento(idOrcamento),
    situacaoServico VARCHAR(10),

);

--inserções na tabela de Clientes:

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Walter Souza','04488596674','Walter@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Rubens Silva','04488596675','Rubens@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Maria Oliveira','04488596676','Maria@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Denilson Costa','04488596677','Denilson@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Pericles Amado','04488596678','Amado@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Daniele Lima','04488596679','Daniele@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Kennedy Silvestre','04488596670','Kennedy@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Augusto Lira','04488596671','A95@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Pedro Paulo','04488596672','PP@gmail.com');

INSERT into Cliente(nomeCliente, cpf, email) 
VALUES('Paulo Amarante','04488596673','Amarante@gmail.com');

--Inserções na Tabela de Orcamentos:
--Como ficam as foreign key? Declara?
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Conserto de Fogão','Aprovado',07/02/2021,08/02/2021,120.00,3);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Liquidificador com problemas da helice','Aberto',01/02/2021,02/02/2021,30.00,1);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES('Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);

--Inserção na Tabela de Itens:
INSERT into Itens(situacaoServico) VALUES('Finalizado');
INSERT into Itens(situacaoServico) VALUES('Aprovado');
INSERT into Itens(situacaoServico) VALUES('Aberto');
INSERT into Itens(situacaoServico) VALUES('Em andamento');
INSERT into Itens(situacaoServico) VALUES('Cliente Desistiu');
INSERT into Itens(situacaoServico) VALUES('Não Aprovado');
INSERT into Itens(situacaoServico) VALUES('Aberto');
INSERT into Itens(situacaoServico) VALUES('Finalizado');
INSERT into Itens(situacaoServico) VALUES('Finalizado');
INSERT into Itens(situacaoServico) VALUES('Finalizado');

--Inserção na Tabela Servico:

INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);
INSERT into Servico(descricaoProdutos, valorServico, horaServico)
VALUES ('Consertado', 70.00,5);



