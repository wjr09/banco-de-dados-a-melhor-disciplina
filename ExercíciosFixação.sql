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
    ('Produto1', ROUND(19.9999, 2), 10),
    ('Produto2', ROUND(20.999, 2), 5),
    ('Produto3', ROUND(5.59, 2), 20);

-- c) Use a função ABS() para exibir o valor absoluto das quantidades.
SELECT produto, preco, ABS(quantidade) AS quantidade_absoluta FROM produtos;

-- d) Calcule a média dos preços dos produtos utilizando a função AVG().
SELECT AVG(preco) AS mediaPrecos FROM produtos;
