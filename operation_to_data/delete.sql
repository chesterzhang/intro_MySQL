# 删除数据  

# 删除10部门中, 工龄超过20年的员工记录
DELETE FROM t_emp 
WHERE deptno=10 AND DATEDIFF(NOW(),hiredate)/365>=20;

# 删除20部门中, 工资最高的员工记录
DELETE FROM t_emp
WHERE deptno=20 
ORDER BY sal+IFNULL(comm,0) DESC
LIMIT 1;
 

# 删除SALES部门和该部门的全部员工记录
DELETE e,d
FROM t_emp e JOIN t_dept d ON e.deptno=d.deptno
WHERE d.dname="SALES";

# 删除每个低于部门平均底薪的员工记录
DELETE 
FROM t_emp e1 JOIN (SELECT empno,AVG(sal) as avg FROM t_emp GROUP BY deptno ) e2 
ON e1.empno=e2.empno AND e1.sal<e2.avg;

#删除KING员工和他的直接下属, 用DELETE + JOIN 实现
DELETE 
e
FROM t_emp e JOIN (SELECT empno FROM t_emp WHERE ename="KING") t
ON e.mgr=t.empno OR e.empno=t.empno;

# 删除SALES部门的员工, 以及没有部门的员工
DELETE
e
FROM t_emp e  LEFT JOIN t_dept d ON e.deptno=d.deptno 
WHERE d.dname="SALES" OR e.deptno IS NULL; 

# DROP TABLE 删除表
DROP TABLE t_bonus

# TRUNCATE TABLE 非事务机制删除表
TRUNCATE TABLE t_emp;

