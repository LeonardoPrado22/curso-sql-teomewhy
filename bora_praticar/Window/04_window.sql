-- Saldo de pontos acumulado de cada usuário

WITH tb_cliente_dia AS (

    SELECT idCliente,
        substr(DtCriacao,1,10) AS dtDia,
        sum(QtdePontos) AS totalPontos,
        sum(CASE WHEN QtdePontos > 0 THEN qtdePontos ELSE 0 END) AS pontosPositivos

    FROM transacoes

    GROUP BY idCliente, dtDia
)

SELECT *,
       sum(totalpontos) OVER (PARTITION BY idCliente ORDER BY dtDia) AS saldoPontos

FROM tb_cliente_dia