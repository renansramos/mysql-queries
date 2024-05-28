
-- Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa. 
	CREATE DATABASE db_servicos_rh ;


-- USANDO DB_SERVICOS_RH
	USE db_servicos_rh;

-- Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste RH.
	CREATE TABLE tb_colaboradores(
		id BIGINT AUTO_INCREMENT,
        nome_colaborador VARCHAR(255) NOT NULL,
		cargo VARCHAR(255) NOT NULL,
		idade INT NOT NULL,
        salario DECIMAL(6,2) NOT NULL,
        PRIMARY KEY (id)
    );

-- EXIBINDO TABELA tb_colaboradores
	SELECT * FROM tb_colaboradores;

-- Insira nesta tabela no mínimo 5 dados (registros).
	INSERT INTO tb_colaboradores (nome_colaborador, cargo, idade, salario) VALUES
	('Ana Silva', 'Gerente de Vendas', 35, 5000.00),
	('Pedro Santos', 'Analista de Marketing', 28, 3500.00),
	('Maria Oliveira', 'Desenvolvedora Sênior', 40, 6000.00),
	('João Souza', 'Assistente Administrativo', 25, 2500.00),
	('Carla Mendes', 'Designer Gráfico', 30, 4000.00);


-- Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.

	SELECT * FROM tb_colaboradores WHERE salario > 2000.00;

-- Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.
	SELECT * FROM tb_colaboradores WHERE salario < 2000.00;


-- Ao término atualize um registro desta tabela através de uma query de atualização.

	UPDATE tb_colaboradores
	SET salario = 2700.00
	WHERE nome_colaborador = 'João Souza';


















