-- exercicio 1
DELIMITER //
CREATE PROCEDURE sp_ListarAutores()
BEGIN
    SELECT * FROM Autor;
END;
//
-- exercicio 2
CREATE PROCEDURE sp_LivrosPorCategoria(IN categoria_nome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID
    WHERE Categoria.Nome = categoria_nome;
END;
//
-- exercicio 3
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoria_nome VARCHAR(100), OUT total_livros INT)
BEGIN
    SELECT COUNT(*) INTO total_livros
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;
END;
//
-- exercicio 4
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoria_nome VARCHAR(100), OUT categoria_tem_livros BOOLEAN)
BEGIN
    DECLARE total_livros INT;
    SELECT COUNT(*) INTO total_livros
    FROM Livro
    INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;
    IF total_livros > 0 THEN
        SET categoria_tem_livros = TRUE;
    ELSE
        SET categoria_tem_livros = FALSE;
    END IF;
END;
//
-- exercicio 5
CREATE PROCEDURE sp_LivrosAteAno(IN ano_fornecido INT)
BEGIN
    SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome, Livro.Ano_Publicacao
    FROM Livro
    INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID
-- exercicio 6
CREATE PROCEDURE sp_TitulosPorCategoria(IN categoria_nome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoria_nome;
END;
//
-- exercicio 8
CREATE PROCEDURE sp_AutorMaisAntigo(OUT autor_mais_antigo VARCHAR(255))
BEGIN
    SELECT CONCAT(Nome, Sobrenome) INTO autor_mais_antigo
    FROM Autor
    WHERE Data_Nascimento = (
        SELECT MIN(Data_Nascimento) FROM Autor
    );
END;
//
-- exercicio 10
CREATE PROCEDURE sp_LivrosESeusAutores()
BEGIN
    SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome
    FROM Livro
    INNER JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
    INNER JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID;
END; 
//

DELIMITER ;
