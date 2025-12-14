-- Quantidade de transações históricas (vida, D7, D14, D28, D56)

WITH tb_transacoes AS (
    SELECT IdTransacao,
           idCliente,
           QtdePontos,
           datetime(substr(DtCriacao,1,19)) AS DtCriacao,
           julianday('now') - julianday(substr(DtCriacao,1,10)) AS diffDate
    FROM transacoes
)

SELECT idCliente,
       count(IdTransacao) AS qtdeTransacoesVida,
       count(CASE WHEN diffDate <=56 THEN IdTransacao END) AS qtdeTransacao56,
       count(CASE WHEN diffDate <=28 THEN IdTransacao END) AS qtdeTransacao28,
       count(CASE WHEN diffDate <=14 THEN IdTransacao END) AS qtdeTransacao14,
       count(CASE WHEN diffDate <=7 THEN IdTransacao END) AS qtdeTransacao7

FROM tb_transacoes
GROUP BY idCliente