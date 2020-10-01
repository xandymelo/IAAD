SELECT Pnome
FROM funcionario f, trabalha_em t
where f.dnr = 4 AND f.Cpf = t.Fcpf AND T.Horas > 15 AND t.Pnr = 10