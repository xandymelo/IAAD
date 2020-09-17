SELECT DISTINCT nome_programador
FROM PROGRAMADOR, programador_linguagem
WHERE programador.id_programador NOT IN (SELECT id_programador FROM programador_linguagem)