CREATE DATABASE "Trabalho3";
CREATE DOMAIN dominio_descricao VARCHAR(50);
--Tabela Cidade
CREATE TABLE Cidade(
 id_cidade SERIAL NOT NULL UNIQUE,
 nome_cidade dominio_descricao,
 uf_cidade CHAR(2),
	PRIMARY KEY(id_cidade)
);
--Inserindo Cidades
INSERT INTO Cidade(nome_cidade, uf_cidade) VALUES('Natal', 'RN');
INSERT INTO Cidade(nome_cidade, uf_cidade) VALUES('Joao Pessoa', 'PB');
INSERT INTO Cidade(nome_cidade, uf_cidade) VALUES('Mossoro', 'RN');
INSERT INTO Cidade(nome_cidade, uf_cidade) VALUES('Fortaleza','CE');
INSERT INTO Cidade(nome_cidade, uf_cidade) VALUES('Salvador', 'BA');
--Tabela Caminhao
CREATE TABLE Caminhao(
    id_caminhao SERIAL NOT NULL UNIQUE,
	placa_caminhao CHAR(7),
	ano_caminhao INTEGER,
	marca_caminhao VARCHAR(15),
	carga_max INTEGER,
	PRIMARY KEY(id_caminhao)
);
--Inserindo Caminhoes
INSERT INTO Caminhao(id_caminhao, placa_caminhao, ano_caminhao, marca_caminhao, carga_max)
VALUES (1,'AXT6359', 2012, 'VOLVO', 20);
INSERT INTO Caminhao(id_caminhao, placa_caminhao, ano_caminhao, marca_caminhao, carga_max)
VALUES (2,'DEM4567', 2010, 'MERCEDES', 20);
INSERT INTO Caminhao(id_caminhao, placa_caminhao, ano_caminhao, marca_caminhao, carga_max)
VALUES (3,'EPF7895', 2008, 'FORD', 25);
INSERT INTO Caminhao(id_caminhao, placa_caminhao, ano_caminhao, marca_caminhao, carga_max)
VALUES (4,'AXT6350', 2013, 'VOLVO', 30);
INSERT INTO Caminhao(id_caminhao, placa_caminhao, ano_caminhao, marca_caminhao, carga_max)
VALUES (5,'AHB9632', 2014, 'SCANIA', 40);
--Tabela Clientes
CREATE TABLE Cliente(
	id_cliente SERIAL NOT NULL UNIQUE,
	nome_cliente dominio_descricao,
	end_cliente dominio_descricao,
	telefone CHAR(12),
	cpf_cliente CHAR(14) UNIQUE,
	cidade_id INTEGER,
	PRIMARY KEY(id_cliente),
	FOREIGN KEY(cidade_id) REFERENCES Cidade(id_cidade)
);
--Inserindo Clientes
INSERT INTO Cliente(nome_cliente, end_cliente, telefone, cpf_cliente, cidade_id)
VALUES ('Arnaldo Cesar', 'Rua Sao Carlos, 12', 84987583652, '01236547896', 1);
INSERT INTO Cliente(nome_cliente, end_cliente, telefone, cpf_cliente, cidade_id)
VALUES ('Julio Arantes', 'Avenida Imirantes, 192', 8499584712, '36985214769', 3);
INSERT INTO Cliente(nome_cliente, end_cliente, telefone, cpf_cliente, cidade_id)
VALUES ('Ana Amelia', 'Rua Cristal Rubro, 5698', 8899584712, '56874123654', 2);
INSERT INTO Cliente(nome_cliente, end_cliente, telefone, cpf_cliente, cidade_id)
VALUES ('Maria do Carmo', 'Avenida Criaras, 365A', 89985697412, '78945126548', 4);
INSERT INTO Cliente(nome_cliente, end_cliente, telefone, cpf_cliente, cidade_id)
VALUES ('Marcos Almeida', 'Rua Senador Augusto Morais, 54', 9899582515, '69852314475', 5);
--Tabela Pagamento
CREATE TABLE Pagamento(
	id_pagamento SERIAL NOT NULL UNIQUE,
	valor_pagar FLOAT,
	frete_pagar INTEGER,
	PRIMARY KEY(id_pagamento),
	FOREIGN KEY(frete_pagar) REFERENCES Frete(id_frete)
);
--Inserindo Pagamentos
INSERT INTO Pagamento(valor_pagar, frete_pagar) VALUES (1550.30, 5);
INSERT INTO Pagamento(valor_pagar, frete_pagar) VALUES (650.65, 6);
INSERT INTO Pagamento(valor_pagar, frete_pagar) VALUES (903.69, 7);
INSERT INTO Pagamento(valor_pagar, frete_pagar) VALUES (3000, 8);
INSERT INTO Pagamento(valor_pagar, frete_pagar) VALUES (1254.14, 9);
--Tabela Motorista
CREATE TABLE Motorista(
	id_motorista SERIAL NOT NULL UNIQUE,
	nome_motorista dominio_descricao,
	endereco_motorista dominio_descricao,
	fone_motorista CHAR(12),
	sexo_motorista CHAR(1),
	CONSTRAINT sx_moto CHECK(sexo_motorista = 'M' OR sexo_motorista = 'F'),
	PRIMARY KEY(id_motorista)
);
--Inserindo Motoristas
INSERT INTO Motorista(nome_motorista, endereco_motorista, fone_motorista, sexo_motorista)
VALUES ('Moacir Abreu', 'Travessa Nunes Alberto, 654', 84996584123, 'M');
INSERT INTO Motorista(nome_motorista, endereco_motorista, fone_motorista, sexo_motorista)
VALUES ('Juliana Rocha', 'Rua do Motor, 43', 84988874521, 'F');
INSERT INTO Motorista(nome_motorista, endereco_motorista, fone_motorista, sexo_motorista)
VALUES ('Serena Souza', 'Rua dos Tororos, 13', 84999568214, 'F');
INSERT INTO Motorista(nome_motorista, endereco_motorista, fone_motorista, sexo_motorista)
VALUES ('Eric Aliz', 'Rua dos Torpedos, 4', 8498147985, 'M');
INSERT INTO Motorista(nome_motorista, endereco_motorista, fone_motorista, sexo_motorista)
VALUES ('Igor Pazu', 'Rua Irmao jota, 56', 84963258417, 'M');
--Tabela Despesas
CREATE TABLE Despesas(
	id_despesas SERIAL NOT NULL UNIQUE,
	descricao_despesas dominio_descricao,
	despesas_valor FLOAT,
	PRIMARY KEY(id_despesas)
);
--Inserindo Despesas
INSERT INTO Despesas(descricao_despesas, despesas_valor) VALUES ('Pedagio', 100.00);
INSERT INTO Despesas(descricao_despesas, despesas_valor) VALUES ('Manutencao',350.00);
INSERT INTO Despesas(descricao_despesas, despesas_valor) VALUES ('Hospedagem', 120.00);
INSERT INTO Despesas(descricao_despesas, despesas_valor) VALUES ('Combustivel', 220.50);
INSERT INTO Despesas(descricao_despesas, despesas_valor) VALUES ('Refeicoes', 80.00);


--Tabela Frete
CREATE TABLE Frete(
	id_frete SERIAL NOT NULL UNIQUE,
	data_saida VARCHAR(10),
	data_entrega VARCHAR(10),
	frete_valor FLOAT,
	frete_caminhao INTEGER,
	frete_motorista INTEGER,
	frete_cliente INTEGER,
	frete_cidade INTEGER,
	PRIMARY KEY(id_frete),
	FOREIGN KEY (frete_caminhao) REFERENCES Caminhao(id_caminhao),
	FOREIGN KEY (frete_motorista) REFERENCES Motorista(id_motorista),
	FOREIGN KEY (frete_cliente) REFERENCES Cliente(id_cliente),
	FOREIGN KEY (frete_cidade) REFERENCES Cidade(id_cidade)
);
--Inserindo Fretes
INSERT INTO Frete(data_saida, data_entrega, frete_valor, frete_caminhao, frete_motorista, frete_cliente,
frete_cidade) VALUES ('2021-04-11', '2021-04-30', 1000.60, 1, 3, 5, 2);
INSERT INTO Frete(data_saida, data_entrega, frete_valor, frete_caminhao, frete_motorista, frete_cliente,
frete_cidade) VALUES ('2021-04-08', '2021-04-09', 200.96, 2, 4, 2, 1);
INSERT INTO Frete(data_saida, data_entrega, frete_valor, frete_caminhao, frete_motorista, frete_cliente,
frete_cidade) VALUES ('2021-04-11', '2021-04-30', 440.96, 3, 2, 1, 5);
INSERT INTO Frete(data_saida, data_entrega, frete_valor, frete_caminhao, frete_motorista, frete_cliente,
frete_cidade) VALUES ('2021-04-11', '2021-04-30', 2000.80, 4, 1, 3, 4);
INSERT INTO Frete(data_saida, data_entrega, frete_valor, frete_caminhao, frete_motorista, frete_cliente,
frete_cidade) VALUES ('2021-04-11', '2021-04-30', 895.70, 5, 5, 4, 3);
--Tabela Viagens
CREATE TABLE Viagem(
	id_viagem SERIAL NOT NULL UNIQUE,
	valor_viagem FLOAT,
	despesas_viagem INTEGER,
	frete_custo INTEGER,
	PRIMARY KEY(id_viagem),
	FOREIGN KEY(despesas_viagem) REFERENCES Despesas(id_despesas),
	FOREIGN KEY(frete_custo) REFERENCES Frete(id_frete)
);
--Inserindo Viagens
INSERT INTO Viagem(valor_viagem, despesas_viagem, frete_custo) VALUES (519.63, 1, 8);
INSERT INTO Viagem(valor_viagem, despesas_viagem, frete_custo) VALUES (299.52, 3, 5);
INSERT INTO Viagem(valor_viagem, despesas_viagem, frete_custo) VALUES (463.02, 5, 9);
INSERT INTO Viagem(valor_viagem, despesas_viagem, frete_custo) VALUES (125.45, 4, 7);
INSERT INTO Viagem(valor_viagem, despesas_viagem, frete_custo) VALUES (60.06, 2, 6);
-- Tabela Orçamentos
CREATE TABLE Orcamento(
	id_orcamento SERIAL NOT NULL UNIQUE,
	valor_orcamento FLOAT,
	endereco_cliente dominio_descricao,
	endereco_carga dominio_descricao,
	cliente_orcamento INTEGER,
	FOREIGN KEY(cliente_orcamento) REFERENCES cliente(id_cliente)
);
--inserindo Orçamentos
INSERT INTO Orcamento(valor_orcamento, endereco_cliente, endereco_carga, cliente_orcamento)
VALUES (1563.45, (SELECT end_cliente FROM Cliente WHERE id_cliente = 1), 'Rua dos Navegantes, 580', 1);
INSERT INTO Orcamento(valor_orcamento, endereco_cliente, endereco_carga, cliente_orcamento)
VALUES (750.00, (SELECT end_cliente FROM Cliente WHERE id_cliente = 2), 'Avenida meia oito, 458A', 2);
INSERT INTO Orcamento(valor_orcamento, endereco_cliente, endereco_carga, cliente_orcamento)
VALUES (1020.03, (SELECT end_cliente FROM Cliente WHERE id_cliente = 3), 'Rua Alba Cris, 5', 3);

--Consultas

--
--Mostrando valores do frete de cada clientes(sua chave correspondente) 
-- por ordem crescente de preço
SELECT frete_valor, frete_cliente FROM Frete WHERE frete_cliente IN 
(SELECT id_cliente FROM Cliente ORDER BY id_cliente);
--Pesquisando mostorista por comparação em sequência de caracteres
SELECT nome_motorista, fone_motorista FROM Motorista WHERE nome_motorista LIKE '%eri%';
--Encontrando clientes que residem no 'RN'
SELECT nome_cliente, cpf_cliente, cidade_id FROM Cliente WHERE cidade_id in
(SELECT id_cidade FROM Cidade WHERE uf_cidade = 'RN');
--Agrupando fretes por valor e data
SELECT data_saida, data_entrega, frete_valor FROM Frete WHERE
frete_valor BETWEEN 0 and 3000 GROUP BY frete_valor, data_entrega, data_saida;
--Selecionando orçamentos já feitos
SELECT * FROM orcamento;






