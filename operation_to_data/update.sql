# 更新数据

# 把每个员工的编号和上司的编号+1
UPDATE t_emp SET empno=empno+1, mgr=mgr+1;


# 把月收入前3的员工底薪减去100, 用LIMIT子句完成
UPDATE t_emp
SET sal=sal-100
ORDER BY sal+IFNULL(comm,0) DESC
LIMIT 3;


# 把ALLEN调往RESEARCH部门, 职务调整为ANALYST	
UPDATE t_emp e, t_dept d
SET e.deptno=d.deptno, e.job="ANALYST"
WHERE e.ename="ALLEN" AND d.dname="RESEARCH";


# UPDATE 和 JOIN 一起 

# 把底薪低于公司平均底薪的员工,底薪增加150
UPDATE t_emp e JOIN (SELECT AVG(sal) AS avg FROM t_emp) t 
ON e.sal < t.avg
SET e.sal=e.sal+150; 


# UPDATE 和 LEFT JOIN 一起
# 把没有部门的员工, 或者SALES部门低于2000元底薪的员工,都掉往20部门
UPDATE t_emp e LEFT JOIN t_dept d
ON e.deptno=d.deptno
SET e.deptno=20
WHERE ISNULL(e.deptno) OR (d.dname="SALES" AND e.sal<2000);


