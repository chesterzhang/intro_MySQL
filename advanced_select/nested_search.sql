# 子查询, 在查询语句中嵌套SELECT子句

#查询底薪超过公司平均底薪的员工信息

# 解法一, WHERE 子查询 不推荐, 因为要重复计算 (SELECT AVG(sal) FROM t_emp)
SELECT
 empno,ename,sal
FROM t_emp
WHERE sal>= (SELECT AVG(sal) FROM t_emp);

# 解法二, FROM 子查询 推荐
-- SELECT
--   e1.empno,e1.ename,e1.sal
-- FROM t_emp e1 JOIN t_emp e2 ON e1.sal > AVG(e2.sal) ;
# 上面这句SQL是有问题的,AVG是聚合函数 不能直接放到 WHERE/ON 里面去

SELECT
  e1.empno,e1.ename,e1.sal
FROM t_emp e1 JOIN (SELECT AVG(e2.sal) avg FROM t_emp e2  ) s
 ON e1.sal > s.avg  ;


# 查询FORD 和 MARTIN 两个人的同事
SELECT 
	ename
FROM t_emp 
WHERE deptno IN (SELECT deptno FROM t_emp WHERE ename IN ("FORD","MARTIN")) 
AND ename NOT IN ("FORD","MARTIN");

 