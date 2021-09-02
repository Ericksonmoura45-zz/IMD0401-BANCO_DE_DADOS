CREATE DATABASE TrabalhoUN2;
--1)exemplo utilizando SQL (comandos DQL) explicando 
--como cada comando da álgebra relacional 
--(seleção, projeção, produto cartesiano, renomeação e funções agregadas) 
--pode ser expresso em SQL. Exemplo:
--Select id FROM Cliente as Novos_Clientes WHERE id GROUP BY id HAVING id >=5
--
-- 'SELECT' = PROJEÇÃO, 'FROM' = PRODUTO CARTESIANO, 'WHERE' = SELEÇÃO
-- 'AS NOVOS_CLIENTE' = RENOMEAÇÃO, 'id GROUP BY id HAVING id >=5' = FUNÇÕES AGRAGADAS 

-- Tabelas:

CREATE TABLE Cliente (
     idCliente SERIAL PRIMARY KEY NOT NULL,
     nomeCliente VARCHAR(30),
     cpf VARCHAR(11) UNIQUE,
     email VARCHAR(25)
     
);
CREATE TABLE Orcamento (
    idOrcamento SERIAL PRIMARY KEY NOT NULL,
    idCliente_Or INT NOT NULL,
    descricaoProblema VARCHAR(200),
    situacao VARCHAR(15),
    dataInicio DATE,
    dataFim DATE,
    totalValor FLOAT,
    totalHoras INTEGER,
	
	FOREIGN KEY(idCliente_Or) REFERENCES Cliente(idCliente),

    CONSTRAINT check_situacao CHECK(situacao = 'Aberto' or situacao ='Aprovado'
    or situacao = 'Finalizado')

);
CREATE TABLE SERVICO(
    idServico SERIAL PRIMARY KEY NOT NULL,
    descricaoServico VARCHAR(50),
    valorServico FLOAT,
    horaServico INT

);


CREATE TABLE Itens (
    idItens SERIAL PRIMARY KEY NOT NULL,
    idServico_Itens INT NOT NULL,
    idOrcamentos_Itens INT NOT NULL,
    situacaoServico VARCHAR(10),
	
	FOREIGN KEY(idServicos_Itens) REFERENCES SERVICO(idServico),
	FOREIGN KEY(idOrcamentos_Itens) REFERENCES Orcamento(idOrcamento),

     CONSTRAINT check_situacaoo CHECK(situacaoServico = 'Aberto' or situacaoServico ='Aprovado'
    or situacaoServico = 'Finalizado')
	--Embora não pedido no problema, resolvi colocar um 'check' no situação de 'Itens'

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

Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(1,'Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(2,'Conserto de Fogão','Aprovado',07/02/2021,08/02/2021,120.00,3);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(3,'Liquidificador com problemas da helice','Aberto',01/02/2021,02/02/2021,30.00,1);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(4,'Batedeira com Geladeira','Aberto',26/02/2021,27/02/2021,70.00,5);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(5,'Batedeira com Liquidificador','Finalizado',05/01/2021,30/02/2021,120.00,6);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(6,'Airfryer não funciona','Finalizado',08/02/2021,22/02/2021,100.00,2);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(7,'Torradeira não funciona','Finalizado',13/02/2021,14/02/2021,30.00,1);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(8,'Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(9,'Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);
Insert into Orcamento(idCliente_Or,descricaoProblema, situacao, dataInicio, dataFim, totalValor, totalHoras)
VALUES(10,'Batedeira com problemas','Finalizado',13/02/2021,14/02/2021,70.00,5);

--Inserção na Tabela de Itens:
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(1,'Finalizado');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(2,'Aprovado');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(3,'Aberto');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(4,'Aberto');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(5,'Aberto');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(6,'Finalizado');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(7,'Finalizado');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(8,'Aprovado');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(9,'Aberto');
INSERT into Itens(idServico_Itens,situacaoServico) VALUES(10,'Finalizado');

--Inserção na Tabela Servico:

INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Conserto', 200.00,1);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Vistoria', 120.00,2);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Avaliacao', 70.00,3);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Consultoria', 70.00,4);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Montagem', 130.00,5);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Emissão de Laudo Técnico', 33.00,6);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Simulação', 20.00,7);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Ajuste Fino', 150.00,8);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Regulagem', 300.00,9);
INSERT into SERVICOS(descricaoServico, valorServico, horaServico)
VALUES ('Revisao completa', 500.00,10);

--Consultas
--a)
SELECT all descricaoServico FROM SERVICO;
--b)
SELECT idServico FROM SERVICO WHERE MAX(valorServico);
--c)
SELECT all nomeCliente FROM Cliente WHERE situacao IN (SELECT situacao FROM Orcamento WHERE situacao = 'Aberto');
--d)
SELECT nomeCliente, email FROM Cliente WHERE idCliente_Or IN (SELECT ALL idCliente_Or FROM Orcamento WHERE idServico
IN (SELECT all idServico FROM SERVICO WHERE idServico = '2'));
--e)
SELECT nomeCliente, cpf FROM Cliente WHERE EXISTS(
SELECT descricaoProblema, situacao FROM Orcamento WHERE situacao = 'Aprovado' AND situacaoServico IN 
(SELECT situacaoServico FROM Itens WHERE situacaoServico = 'Aprovado'));
--f)
--SELECT all cpf FROM Cliente WHERE;
--5)
SELECT descricaoServico ||' - Indisponivel'||, horaServico as indisponiveis 
FROM SERVICO GROUP BY descricaoServico HAVING horaServico > 2;
--6)
DELETE FROM SERVICO WHERE idServico = '5'; 
-- Os Serviços e Orçamentos que faziam uso dessa tabela ficam com o campo 'Serviço' em Branco, fazendo-se necessário o uso
-- das transações para excluí-los juntos.
--7)
--Para remover todos os itens relacionados a uma chave de "SERVICO", iremos alterar a tabela e usar o comando "delete" em cascata:
ALTER TABLE SERVICO ADD CONSTRAINT idServicofk
    FOREIGN KEY (idServicofk) REFERENCES Itens(idItens)
        ON DELETE CASCADE ON UPDATE CASCADE;
--Assim, todo os atributos relacionados a chave serviço deletada serão deletados.

--9)
CREATE VIEW servicoRapido as
SELECT a.valorServico, a.descricaoServico, a.horaServico FROM Servico a
WHERE a.horaServico BETWEEN 1 and 3 ORDER BY a.valorServico, a.horaServico;

SELECT * FROM servicoRapido;

--10) Podemos inserir um gatilho, para, por exemplo, quando for alterado o serviço, adicionamos
-- o valor de uma multa(tava adicional) no valor do novo serviço:
--CREATE TRIGGER multa AFTER UPDATE ON Servico FOR EACH ROW 
--BEGIN
--UPDATE Servico SET valorServico = NEW.valorServico + 35.00 --multa
--WHERE idServico = NEW.idServico;
--END;
--DELIMITER;















