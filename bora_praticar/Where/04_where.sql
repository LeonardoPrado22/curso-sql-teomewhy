-- Selecione produtos que contêm 'churn' no nome

SELECT *

FROM produtos

-- Jeito iniciante
-- WHERE DescNomeProduto = 'Churn_10pp'
-- OR DescNomeProduto = 'Churn_2pp'
-- OR DescNomeProduto = 'Churn_5pp'

-- Criando uma lista
-- WHERE DescNomeProduto IN ('Churn_10pp', 'Churn_2pp', 'Churn_5pp')

-- Jeito avançado
WHERE DescNomeProduto LIKE '%Churn%'