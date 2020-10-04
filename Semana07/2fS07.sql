-- P <- T junção_{t1=v3} V
SELECT *
FROM T JOIN V 
ON T1=V3;

-- U <- SELECT_{T1 > 5}(P)
SELECT *
FROM (SELECT *
FROM T JOIN V 
ON T1=V3) P
WHERE T1 > 5;

-- M <- select_{t1,t3}(U)
select t1,t3
from (SELECT *
FROM (SELECT *
FROM T JOIN V 
ON T1=V3) P
WHERE T1 > 5) U;

-- Y <- select_{t2<8}(T)
select *
from T
where t2 < 8;

-- H <- select_{t1,t3}(Y)
select t1,t3
from (select *
from T
where t2 < 8) Y;

-- M - H
select t1,t3
from (SELECT *
FROM (SELECT *
FROM T JOIN V 
ON T1=V3) P
WHERE T1 > 5) U
where (t1,t3) not in (select t1,t3
from (select *
from T
where t2 < 8) Y);


