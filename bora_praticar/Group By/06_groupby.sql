-- Qual dia da semana tem mais pedidos em 2025?

SELECT 
       strftime('%w', substr(DtCriacao,1,10)) AS diaSemana,
       count(*) AS qtdetransacao,
       count(DISTINCT IdTransacao) AS qtdetransacao2,
       count(IdTransacao) AS qtdetransacao3

FROM transacoes

WHERE substr(DtCriacao,1,4) = '2025'

GROUP BY 1
ORDER BY 4 DESC