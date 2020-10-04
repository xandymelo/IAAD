-- select_{t1>15}(T)

SELECT *
FROM T
WHERE T1>15;

-- select_{v2 = 'x' or v2 = 'y'}(V)
SELECT *
FROM V
WHERE V2 = 'y' OR V2 = 'y';

-- P <- select_{t1>15}(T) JOIN_{T2>v1} select_{v2 = 'x' or v2 = 'y'}(V)

SELECT *
FROM (SELECT *
FROM T
WHERE T1>15) A JOIN (SELECT *
FROM V
WHERE V2 = 'y' OR V2 = 'y') B 
ON  T2 > V1;

-- select_{t1,v1}(P)

SELECT T1,V1
FROM (SELECT *
FROM (SELECT *
FROM T
WHERE T1>15) A JOIN (SELECT *
FROM V
WHERE V2 = 'y' OR V2 = 'y') B 
ON  T2 > V1);