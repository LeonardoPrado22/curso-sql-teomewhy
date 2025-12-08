-- Quantos clientes tem email cadastrado?
SELECT sum(flEmail)

FROM clientes;

-- Outro modo

SELECT count(*)

FROM clientes

WHERE flEmail = 1;