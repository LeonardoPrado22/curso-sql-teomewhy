SELECT idCliente,
       QtdePontos,
       CASE
            WHEN QtdePontos <= 500 THEN 'Ponei'
            WHEN QtdePontos BETWEEN 501 AND 1000 THEN 'Ponei Aprendiz'
            WHEN QtdePontos BETWEEN 1001 AND 5000 THEN 'Mago Aprendiz'
            WHEN QtdePontos BETWEEN 1001 AND 5000 THEN 'Mago Mestre'
            WHEN QtdePontos BETWEEN 5001 AND 10000 THEN 'Mago Mestre'
            ELSE 'Mago Supremo'
       END AS NomeGrupo,

       CASE
            WHEN qtdePontos <= 1000 THEN 1
            ELSE 0
       END AS FlPonei,

       CASE
            WHEN qtdePontos > 1000 THEN 1
            ELSE 0
       END AS FlMago

FROM clientes

WHERE flMago = 1

ORDER BY qtdePontos DESC
