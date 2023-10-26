-- exercicio 1

CREATE TRIGGER insere_cliente 
AFTER INSERT ON clientes
FOR EACH ROW
INSERT INTO auditoria (mensagem) VALUES('novo cliente');
