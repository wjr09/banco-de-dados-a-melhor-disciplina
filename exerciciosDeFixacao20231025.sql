-- exercicio 1

CREATE TRIGGER insere_cliente 
AFTER INSERT ON clientes
FOR EACH ROW
INSERT INTO auditoria (mensagem) VALUES('novo cliente');

-- exercicio 2

CREATE TRIGGER excluir_cliente 
BEFORE INSERT ON clientes
FOR EACH ROW
INSERT INTO auditoria (mensagem) VALUES('tentativa de excluir');

-- exercicio 3

CREATE TRIGGER atualiza_nome
AFTER UPDATE ON clientes
FOR EACH ROW
    IF OLD.nome != NEW.nome THEN
        INSERT INTO auditoria (mensagem) VALUES('nome atualizado');
    END IF;

-- exercicio 4
