-- Lista de clientes com 100 a 200 pontos (inclusives ambos)

SELECT idCliente,
       QtdePontos

FROM clientes

WHERE QtdePontos BETWEEN 100 AND 200