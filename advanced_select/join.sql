USE demo

#连表查询

# 查询每名员工的部门信息
SELECT 
e.empno, e.ename, d.dname
FROM t_emp e JOIN t_dept d ON e.deptno=d.deptno;

# 也可以把 ON  换成 WHERE, 但是不推荐, 容易引起混淆
SELECT 
e.empno, e.ename, d.dname
FROM t_emp e JOIN t_dept d WHERE e.deptno=d.deptno;

#查询每个员工的工号 姓名 部门名称 底薪 工资等级
SELECT
e.empno, e.ename, d.dname, e.sal, s.grade
FROM t_emp e JOIN t_dept d ON e.deptno=d.deptno
JOIN t_salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

# 查询和SCOTT相同部门的人
SELECT 
ename
FROM t_emp WHERE deptno=
(SELECT deptno FROM t_emp WHERE ename="SCOTT")
AND ename!="SCOTT";
# 上面这种写法需要重复执行(SELECT deptno FROM t_emp WHERE ename="SCOTT")效率低下

# 可以用连表查询, 表自己和自己连接
SELECT
E2.ename
FROM   t_emp E1 JOIN  t_emp e2 ON e1.deptno=e2.deptno
WHERE e1.ename="SCOTT" AND  e2.ename!="SCOTT";


#查询底薪超过公司平均底薪的员工信息
-- SELECT
-- e1.ename, e1.sal
-- FROM t_emp e1 JOIN t_emp e2 WHERE e1.sal > AVG(e2.sal);
# 上面这一句话是有问题的,AVG 不能放在 WHERE 里面

SELECT 
e1.ename, e1.sal
FROM t_emp e1 JOIN
(SELECT AVG(sal) avg FROM t_emp) t
WHERE e1.sal>=t.avg;


#查询RESEARCH部门的人数, 最高底薪,最低底薪,平均底薪,平均工龄
SELECT
COUNT(*), MAX(e1.sal),MIN(e1.sal), AVG(e1.sal), AVG(DATEDIFF(NOW(),e1.hiredate)/365)
FROM t_emp e1 JOIN t_dept d1 ON e1.deptno=d1.deptno WHERE d1.dname="RESEARCH";
# 当有JOIN 后面又有WHERE时,JOIN 必须和 ON 连用


# CEIL FLOOR 方法
SELECT CEIL(1.1)
SELECT FLOOR(1.1)


# 查询每种职业的最高工资, 最低工资, 平均工资, 最高工资等级和最低工资等级
SELECT
e.job, MAX(e.sal), MIN(e.sal), AVG(e.sal), MAX(s.grade), MIN(s.grade)
FROM t_emp e JOIN t_salgrade s
ON (e.sal+IFNULL(e.comm,0)) BETWEEN s.losal AND s.hisal
GROUP BY e.job ;


# 查询每个底薪超过部门平均底薪的员工信息
SELECT
e1.ename, e1.sal
FROM  t_emp e1 JOIN (SELECT deptno, AVG(sal) avg FROM t_emp  GROUP BY deptno) s
ON e1.deptno=s.deptno
WHERE e1.sal>=s.avg;

