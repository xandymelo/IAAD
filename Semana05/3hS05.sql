SELECT Projnome as 'Nome do projeto', Dnome as 'Nome do departamento', H.countresult as 'Número de Funcionarios' , H.hor as 'Horas trabalhadas'
FROM PROJETO P ,DEPARTAMENTO  D, (SELECT count(Fcpf) as 'countresult', Pnr, sum(Horas) as 'hor' FROM TRABALHA_EM TE GROUP BY Pnr) H
WHERE P.Dnum = D.Dnumero AND P.Projnumero = H.Pnr