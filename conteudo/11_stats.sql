SELECT round(avg(qtdePontos), 2) AS mediaCarteira,
       1. * sum(qtdePontos) / count (IdCliente) AS mediaCarteirasRoots,
       min(QtdePontos) AS minCarteira,
       max(QtdePontos) AS maxCarteira,
       sum(flTwitch),
       sum(flEmail)

FROM clientes