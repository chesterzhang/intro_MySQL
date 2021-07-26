# ALL, ANY

# 查询比FORD 和 MARTIN底薪都高的员工信息
SELECT 
ename
FROM t_emp
WHERE sal > ALL(SELECT sal FROM t_emp WHERE ename IN ("FORD","MARTIN"));

SELECT 
ename
FROM t_emp e JOIN  ( SELECT MAX(sal) as min_sal FROM t_emp  WHERE ename IN ("FORD","MARTIN") )  s
WHERE e.sal >  s.min_sal;

# 查询比FORD 和 MARTIN 其中一个底薪都高的员工信息
SELECT 
ename
FROM t_emp 
WHERE sal > ANY(SELECT sal FROM t_emp WHERE ename IN ("FORD","MARTIN"));

