-- Qual o produto com mais pontos transacionado?
SELECT IdProduto,
       sum(vlProduto * QtdeProduto)

FROM transacao_produto

GROUP BY IdProduto
ORDER BY sum(vlProduto) DESC

LIMIT 1