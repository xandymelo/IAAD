SELECT D.Dnumero, COUNT(F.Cpf)  as 'Numero de funcionarios'
FROM FUNCIONARIO F
INNER JOIN  DEPARTAMENTO D
ON F.Dnr = D.Dnumero
GROUP BY D.Dnumero
HAVING avg(F.Salario) > 30000