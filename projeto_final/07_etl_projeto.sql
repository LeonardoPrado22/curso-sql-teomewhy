-- Pontos acumulados negativos (vida, D7, D14, D28, D56)

WITH tb_transacoes AS (
    SELECT IdTransacao,
           idCliente,
           QtdePontos,
           datetime(substr(DtCriacao,1,19)) AS DtCriacao,
           julianday('now') - julianday(substr(DtCriacao,1,10)) AS diffDate
    FROM transacoes
),

tb_cliente AS (
    SELECT IdCliente,
           datetime(substr(DtCriacao,1,19)) AS DtCriacao,
           julianday('now') - julianday(substr(DtCriacao,1,10)) AS idadeBase
    FROM clientes
),

tb_sumario_transacoes AS (

    SELECT idCliente,
        count(IdTransacao) AS qtdeTransacoesVida,
        count(CASE WHEN diffDate <=56 THEN IdTransacao END) AS qtdeTransacao56,
        count(CASE WHEN diffDate <=28 THEN IdTransacao END) AS qtdeTransacao28,
        count(CASE WHEN diffDate <=14 THEN IdTransacao END) AS qtdeTransacao14,
        count(CASE WHEN diffDate <=7 THEN IdTransacao END) AS qtdeTransacao7,
        min(diffDate) AS diasUltimaInteracao,
        sum(qtdePontos) AS saldoPontos,
        
        sum(CASE WHEN qtdePontos > 0 THEN qtdePontos ELSE 0 END) AS qtdePontosPosVida,
        sum(CASE WHEN qtdePontos > 0 AND diffDate <= 56 THEN qtdePontos END) AS qtdePontosPos56,
        sum(CASE WHEN qtdePontos > 0 AND diffDate <= 28 THEN qtdePontos END) AS qtdePontosPos28,
        sum(CASE WHEN qtdePontos > 0 AND diffDate <= 14 THEN qtdePontos END) AS qtdePontosPos14,
        sum(CASE WHEN qtdePontos > 0 AND diffDate <= 7 THEN qtdePontos END) AS qtdePontosPos7,

        sum(CASE WHEN qtdePontos < 0 THEN qtdePontos ELSE 0 END) AS qtdePontosNegVida,
        sum(CASE WHEN qtdePontos < 0 AND diffDate <= 56 THEN qtdePontos END) AS qtdePontosNeg56,
        sum(CASE WHEN qtdePontos < 0 AND diffDate <= 28 THEN qtdePontos END) AS qtdePontosNeg28,
        sum(CASE WHEN qtdePontos < 0 AND diffDate <= 14 THEN qtdePontos END) AS qtdePontosNeg14,
        sum(CASE WHEN qtdePontos < 0 AND diffDate <= 7 THEN qtdePontos END) AS qtdePontosNeg7


    FROM tb_transacoes
    GROUP BY idCliente
)

SELECT t1.*,
       t2.idadeBase
FROM tb_sumario_transacoes AS t1
LEFT JOIN tb_cliente AS t2
ON t1.idCliente = t2.idCliente