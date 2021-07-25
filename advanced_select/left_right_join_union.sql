# 外连接查询

# 左外连 LEFT JOIN
# 当 左边表中的元素和右边表中的元素没有 匹配的时候, 保留左边表中的元素

# 如emp表中张三是一个零时工, deptno为NULL, 我们希望保留NULL
# 查询所有员工和其对应的部门名称
SELECT
e.ename, d.dname
FROM t_emp e LEFT JOIN t_dept d ON e.deptno=d.deptno; 

# 也可以交换JOIN表格的顺序,换成 右外连接 效果相同
SELECT
e.ename, d.dname
FROM t_dept d  RIGHT JOIN t_emp e ON e.deptno=d.deptno; 


# 查询每个部门的名称和人数, 有个部门OPERATIONS，编号40, 没有人，我们也希望显示
SELECT
d.dname , COUNT(e.deptno)
FROM t_emp e RIGHT JOIN t_dept d
ON e.deptno=d.deptno 
GROUP BY d.deptno;


# UNION
# 查询每个部门的名称和部门的人数
# 如果没有部门的员工,部门名称用NULL代替(t_emp LEFT JOIN t_dept)
# 如果部门没有人也希望显示出来，人数为0(t_emp RIGHT JOIN t_dept)
(SELECT
d.dname , COUNT(*)
FROM t_emp e LEFT JOIN t_dept d
ON e.deptno=d.deptno 
GROUP BY d.deptno)
UNION
(
SELECT
d.dname , COUNT(*)
FROM t_emp e RIGHT JOIN t_dept d
ON e.deptno=d.deptno 
GROUP BY d.deptno
); 





