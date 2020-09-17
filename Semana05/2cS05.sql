SELECT *
FROM linguagem_programacao AS lp LEFT JOIN PROGRAMADOR_LINGUAGEM as pl ON lp.id_linguagem = pl.id_linguagem
UNION
SELECT *
FROM linguagem_programacao AS lp RIGHT JOIN PROGRAMADOR_LINGUAGEM as pl ON lp.id_linguagem = pl.id_linguagem
