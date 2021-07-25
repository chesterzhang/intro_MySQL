# HAVING 子句, 解决了在分组 中使用聚合函数的问题

# 查询部门平均底薪超过2000元的部门编号
# 下面这一句是错的,因为WHERE> GROUP BY ,
# 需要GROUP BY 确定范围,才能进行AVG统计
-- SELECT deptno FROM t_emp
-- WHERE AVG(sal)>=2000 
-- GROUP BY deptno;
 

SELECT deptno FROM t_emp
GROUP BY deptno HAVING AVG(sal)>=2000 ;

# 查询每个部门中, 入职在1982年以后的员工超过2个的 部门编号
SELECT deptno FROM t_emp
WHERE hiredate>"1982-01-01"
GROUP BY deptno HAVING COUNT(*)>=2;