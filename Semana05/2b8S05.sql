SELECT  nome_startup
FROM STARTUP
WHERE startup.id_startup NOT IN (SELECT id_startup FROM programador)