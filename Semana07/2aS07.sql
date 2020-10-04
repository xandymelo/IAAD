-- pi_{T1,T2}(T)
SELECT T1, T2
FROM T;

-- T(junção)_{t1>v3}V

SELECT T1,T2,T3,V1,V2,V3
FROM T INNER JOIN V ON
T1>v3;

-- pi_{t1,t2}(T(junção)_{t1>v3}V)
SELECT T1,T2
FROM (SELECT T1,T2,T3,V1,V2,V3
FROM T INNER JOIN V ON
T1>v3);

-- pi_{T1,T2}(T) - pi_{t1,t2}(T(junção)_{t1>v3}V)

SELECT T1,T2
FROM T
where (t1, t2) not in (SELECT T1,T2
FROM (SELECT T1,T2,T3,V1,V2,V3
FROM T INNER JOIN V ON
T1>v3))
