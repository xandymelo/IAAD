SELECT Num_dept, Media_sal
FROM (SELECT Dnr as 'Num_dept', COUNT(*) as 'Num_func', SUM(Salario) as 'Total_sal', AVG(Salario) as 'Media_sal'
FROM Funcionario
GROUP BY Dnr) R
WHERE Num_func > ( SELECT Num_func 
FROM (SELECT Dnr as 'Num_dept', COUNT(*) as 'Num_func', SUM(Salario) as 'Total_sal', AVG(Salario) as 'Media_sal'
FROM Funcionario
GROUP BY Dnr) R
WHERE Num_dept=4)
