-- Funções de String:

-- a) Crie uma tabela nomes com uma coluna nome contendo os seguintes nomes:
CREATE TABLE nomes (
    nome VARCHAR(255)
);
INSERT INTO nomes (nome) VALUES
    ('Roberta'),
    ('Roberto'),
    ('Maria Clara'),
    ('João');

-- b) Utilize a função UPPER() para converter todos os nomes para maiúsculas.
SELECT UPPER(nome) FROM nomes;

-- c) Use a função LENGTH() para determinar o tamanho de cada nome.
SELECT nome, LENGTH(nome) AS tamanho FROM nomes;

-- 2.Funções Numéricas:

-- a) Crie uma tabela produtos com as colunas produto, preco e quantidade.
CREATE TABLE produtos (
    produto VARCHAR(255),
    preco DECIMAL(10, 2),
    quantidade INT
);

-- b) Utilize a função ROUND() para arredondar os preços para 2 casas decimais.
INSERT INTO produtos (produto, preco, quantidade)
VALUES
    ('Produto1', ROUND(19.99, 2), 10),
    ('Produto2', ROUND(20.99, 2), 5),
    ('Produto3', ROUND(5.59, 2), 20);

-- c) Use a função ABS() para exibir o valor absoluto das quantidades.
SELECT produto, preco, ABS(quantidade) AS quantidade_absoluta FROM produtos;

-- d) Calcule a média dos preços dos produtos utilizando a função AVG().
SELECT AVG(preco) AS mediaPrecos FROM produtos;

-- 3. Funções de Data:

-- a) Crie uma tabela eventos com uma coluna data_evento contendo algumas datas.
CREATE TABLE eventos (
    data_evento DATE
);

INSERT INTO eventos (data_evento) VALUES
    ('2024-6-05'),
    ('2024-7-10'),
    ('2024-8-15');

-- b) Utilize a função NOW() para inserir a data e hora atual em uma nova linha.
INSERT INTO eventos (data_evento) VALUES (NOW());

-- c) Use a função DATEDIFF() para calcular o número de dias entre duas datas.
SELECT
    data_evento,
    DATEDIFF(data_evento, '2024-5-05') AS calcular_datas
FROM eventos;

-- d) Utilize a função DAYNAME() para exibir o nome do dia da semana de cada evento.
SELECT
    data_evento,
    DAYNAME(data_evento) AS nome_da_semana
FROM eventos;

-- 4. Funções de Controle de Fluxo

-- a) Em sua tabela produtos, use a função IF() para determinar se um produto está "Em estoque" ou "Fora de estoque" baseado na quantidade (e.g., se a quantidade for 0, está "Fora de estoque").
SELECT
    produto,
    IF(quantidade > 0, 'Em estoque', 'Fora de estoque') AS quantidade_estoque
FROM produtos;

-- b) Use a função CASE para classificar os produtos em categorias de preço: "Barato", "Médio" e "Caro".
SELECT
    produto,
    CASE
        WHEN preco < 15.0 THEN 'Barato'
        WHEN preco >= 15.0 AND preco < 20.0 THEN 'Médio'
        ELSE 'Caro'
    END AS categoria_preco
FROM produtos;

-- 7. Criando funções

-- a) Crie uma função que retorno o Fatorial de um número. Ex.: 5! = 5.4.2.1
DELIMITER //
CREATE PROCEDURE calculo_fatorial(IN numero, OUT resultado)
BEGIN
  DECLARE i DEFAULT 1;
  DECLARE fatorial DEFAULT 1;
  WHILE i <= numero DO
    SET fatorial = fatorial * i;
    SET i = i + 1;
  END WHILE;
  SET resultado = fatorial;
END;
//
DELIMITER;

-- b) Crie uma função que qualcule o exponencial de um número. Ex.: f_exponencial(2, 3) = 2³ = 8
CREATE FUNCTION f_exponencial(base NUMERIC, expoente NUMERIC)
RETURNS NUMERIC AS
BEGIN
  RETURN POWER(base, expoente);
END;
