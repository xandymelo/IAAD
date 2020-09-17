SELECT nome_programador, linguagem 
FROM programador 
LEFT JOIN (linguagem_programacao as a left JOIN programador_linguagem as b ON a.id_linguagem = b.id_linguagem)
 ON PROGRAMADOR.nome_programador OR PROGRAMADOR.id_programador = b.id_programador