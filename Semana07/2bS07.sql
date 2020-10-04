-- pi_{T1,T2}(T)
SELECT T1, T2
FROM T;

-- pi_{v3,v1}(v)
SELECT V3,V1
FROM V;

-- P <- pi_{T1,T2}(T) U pi_{v3,v1}(v)

SELECT (T1, T2)
FROM T, v
UNION
SELECT V3,V1
FROM V;

-- R <- Select_{t1=20}(P)

SELECT *
FROM (SELECT (T1, T2)
FROM T, v
UNION
SELECT V3,V1
FROM V) p
WHERE P.T1 = 20




