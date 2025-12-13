-- Quem iniciou o curso no primeiro dia, em média assistiu quantas aulas? 

-- Quem participou da primeira aula
WITH tb_prim_dia AS (
    SELECT *
    FROM transacoes
    WHERE substr(DtCriacao,1,10) = '2025-08-25'
),

-- quem participou do curso inteiro
tb_dias_curso AS (

    SELECT DISTINCT
            IdCliente, 
            substr(DtCriacao,1,10) AS presenteDia
    FROM transacoes
    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    ORDER BY idCliente, presenteDia
),

-- Contando quantas vezes quem participou do primeiro dia, voltou
tb_cliente_dias AS (

    SELECT t1.idCliente,
        count( DISTINCT t2.presenteDia) AS qtdeDias

    FROM tb_prim_dia AS t1

    LEFT JOIN tb_dias_curso AS t2
    ON t1.idCliente = t2.idCliente

    GROUP BY t1.idCliente
)

-- Calcula a média
SELECT avg(qtdeDias) 
FROM tb_cliente_dias