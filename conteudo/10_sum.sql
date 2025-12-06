SELECT 
       sum(QtdePontos),

       sum(CASE 
            WHEN qtdePontos > 0 THEN qtdePontos
        END) AS QtdePontosPositivos,

        sum(CASE
            WHEN QtdePontos < 0 THEN qtdePontos
        END) AS QtdePontosNegativos

FROM transacoes

WHERE DtCriacao >= '2025-07-01'
AND DtCriacao < '2025-08-01'

ORDER BY  QtdePontos