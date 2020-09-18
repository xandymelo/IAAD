SELECT Num_dept, Num_func
FROM (SELECT Dnr as 'Num_dept', COUNT(*) as 'Num_func', SUM(Salario) as 'Total_sal', AVG(Salario)
FROM Funcionario
GROUP BY Dnr) H
WHERE H.Total_sal > 100000;
