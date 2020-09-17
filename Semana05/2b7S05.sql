SELECT  nome_startup, nome_programador
FROM STARTUP LEFT JOIN PROGRAMADOR ON STARTUP.nome_startup OR startup.id_startup = programador.id_startup