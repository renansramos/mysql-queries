
-- Criando DB
	CREATE DATABASE db_generation_game_online;
    
-- Crie a tabela tb_classes e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar os personagens do Game Online.
    CREATE TABLE tb_classes (
		class_id INT AUTO_INCREMENT PRIMARY KEY,
		class_name VARCHAR(50) NOT NULL,
		description TEXT
    );

-- Crie a tabela tb_personagens e determine 4 atributos, além da Chave Primária, relevantes aos personagens do Game Online.
    CREATE TABLE tb_personagens (
		character_id INT AUTO_INCREMENT PRIMARY KEY,
		character_name VARCHAR(50) NOT NULL,
		level INT DEFAULT 1,
		class_id INT,
		FOREIGN KEY (class_id) REFERENCES tb_classes(class_id)
    );
    

    
-- Insira 5 registros na tabela tb_classes

INSERT INTO tb_classes (class_name, description) VALUES
	('Guerreiro', 'Especialista em combate corpo a corpo, com alta resistência e força.'),
	('Mago', 'Usuário de magias poderosas, com alto poder de ataque à distância.'),
	('Arqueiro', 'Especialista em combate à distância com uso de arco e flechas.'),
	('Ladino', 'Ágil e furtivo, especialista em ataques rápidos e críticos.'),
	('Clérigo', 'Curandeiro e suporte, capaz de curar aliados e lançar feitiços de proteção.');

-- Insira 8 registros na tabela tb_personagens, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_classes.
INSERT INTO tb_personagens (character_name, level, class_id) VALUES
	('Arthas', 10, 1),  -- Guerreiro
	('Jaina', 15, 2),   -- Mago
	('Sylvanas', 20, 3),-- Arqueiro
	('Valeera', 12, 4), -- Ladino
	('Uther', 18, 5),   -- Clérigo
	('Thrall', 22, 1),  -- Guerreiro
	('Medivh', 25, 2),  -- Mago
	('Tyrande', 30, 3); -- Arqueiro
    
-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000

-- Adicionar a coluna attack_power na tabela tb_personagens
ALTER TABLE tb_personagens ADD COLUMN attack_power INT;

-- Atualizar registros na tabela tb_personagens com valores de attack_power
UPDATE tb_personagens SET attack_power = 2500 WHERE character_name = 'Arthas';
UPDATE tb_personagens SET attack_power = 1800 WHERE character_name = 'Jaina';
UPDATE tb_personagens SET attack_power = 3000 WHERE character_name = 'Sylvanas';
UPDATE tb_personagens SET attack_power = 2100 WHERE character_name = 'Valeera';
UPDATE tb_personagens SET attack_power = 1700 WHERE character_name = 'Uther';
UPDATE tb_personagens SET attack_power = 2600 WHERE character_name = 'Thrall';
UPDATE tb_personagens SET attack_power = 1500 WHERE character_name = 'Medivh';
UPDATE tb_personagens SET attack_power = 2800 WHERE character_name = 'Tyrande';

-- Selecionar personagens com attack_power maior que 2000
SELECT character_id, character_name, level, attack_power, class_id FROM tb_personagens WHERE attack_power > 2000;

-- Adicionar a coluna defense_power na tabela tb_personagens
ALTER TABLE tb_personagens
ADD COLUMN defense_power INT;

-- Atualizar registros na tabela tb_personagens com valores de defense_power
UPDATE tb_personagens SET defense_power = 1500 WHERE character_name = 'Arthas';
UPDATE tb_personagens SET defense_power = 1100 WHERE character_name = 'Jaina';
UPDATE tb_personagens SET defense_power = 2500 WHERE character_name = 'Sylvanas';
UPDATE tb_personagens SET defense_power = 1700 WHERE character_name = 'Valeera';
UPDATE tb_personagens SET defense_power = 900 WHERE character_name = 'Uther';
UPDATE tb_personagens SET defense_power = 2000 WHERE character_name = 'Thrall';
UPDATE tb_personagens SET defense_power = 1300 WHERE character_name = 'Medivh';
UPDATE tb_personagens SET defense_power = 1800 WHERE character_name = 'Tyrande';

-- Selecionar personagens com defense_power no intervalo de 1000 a 2000
SELECT character_id, character_name, level, defense_power, class_id FROM tb_personagens WHERE defense_power BETWEEN 1000 AND 2000;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.

SELECT character_id, character_name, level, attack_power, defense_power, class_id FROM tb_personagens WHERE character_name LIKE '%C%';

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.

SELECT 
    p.character_id, 
    p.character_name, 
    p.level, 
    p.attack_power, 
    p.defense_power, 
    c.class_id, 
    c.class_name, 
    c.description
FROM 
    tb_personagens p
INNER JOIN 
    tb_classes c
ON 
    p.class_id = c.class_id;
    
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
SELECT 
    p.character_id, 
    p.character_name, 
    p.level, 
    p.attack_power, 
    p.defense_power, 
    c.class_id, 
    c.class_name, 
    c.description
FROM 
    tb_personagens p
INNER JOIN 
    tb_classes c
ON 
    p.class_id = c.class_id
WHERE 
    c.class_name = 'Arqueiro';
    
