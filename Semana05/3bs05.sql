select count(b.Cpf) as 'Número de Funcionarios que ganham mais que 30 mil', Dnr as 'Departamento'
from funcionario b
where (b.Sexo = 'M' and b.Salario > 30000)
GROUP BY Dnr