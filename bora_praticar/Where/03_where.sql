-- Selecione todos os clientes com mais de 500 pontos

SELECT idCliente, 
       QtdePontos

FROM clientes

WHERE QtdePontos > 500