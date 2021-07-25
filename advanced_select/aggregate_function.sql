USE demo

#聚合函数只能出现在SELECT里面,不能在WHERE里面
#聚合函数是在WHERE限制的范围里面进行统计,而如果放在WHERE里面就没有办法确定范围了

# 聚合函数 AVG 求平均工资
SELECT AVG(sal + IFNULL(comm,0)) AS avg FROM t_emp;

# 聚合函数 SUM 求总工资
SELECT SUM(sal + IFNULL(comm,0)) sum_salary FROM t_emp;

# 聚合函数 MAX 求最高工资
SELECT MAX(sal + IFNULL(comm,0)) AS max_salary FROM t_emp;

# 聚合函数 MAX 求最长姓名的员工
SELECT MAX(LENGTH(ename)) AS longest_name_len FROM t_emp;


# 聚合函数 COUNT(某一列) 统计某一列的非空项的数量
SELECT COUNT(comm) as num_comm FROM t_emp;

# 聚合函数 COUNT(*) 统计表的行数数量
# 查询部门为10,20 底薪大于2000, 工龄超过10年的员工个数
SELECT 
COUNT(*)
FROM t_emp
WHERE deptno IN (10,20) AND sal>=2000 AND DATEDIFF(NOW(), hiredate)/365 >=10;

