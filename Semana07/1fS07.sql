select d.Dnome as 'Nome do departamento', f.Pnome as 'Nome do gerente', f.Endereco as 'Endereço do gerente', f.Datanasc as 'Data de nascimento do gerente'
from FUNCIONARIO F, DEPARTAMENTO D, PROJETO P
WHERE P.projlocal = "São Paulo" AND P.Dnum = D.Dnumero AND D.CPF_GERENTE = F.CPF 