-- exercicio 1
SELECT titulo FROM livros;

-- exercício 2
select NOME from autores
WHERE nascimento < '1900-01-01';

-- exercício 3
SELECT titulo 
from livros 
inner join autores on autor_id=autores.id
where NOME = 'J.K. Rowling';
