SELECT Dnr, COUNT(*), SUM(Salario), AVG(Salario)
FROM Funcionario
GROUP BY Dnr;
