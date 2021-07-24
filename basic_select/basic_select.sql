USE demo;
 
SELECT *FROM t_emp;
 
SELECT empno, ename FROM t_emp;
 
#对字段使用别名, 比如字段是月薪,月薪*12叫做年薪
SELECT empno, sal*12 AS "annual income"
FROM t_emp;

#对数据进行分段,使用LIMIT start_idx, bias
SELECT empno, ename FROM t_emp LIMIT 5,5;
 
#按照某一字段的顺序进行提取,使用ORDER BY
SELECT  ename, sal FROM t_emp ORDER BY sal ASC;
SELECT  ename, sal FROM t_emp ORDER BY sal DESC;

# 优先按照 sal 降序排序, 若sal相等, 则按照 hiredate 升序排序
SELECT  ename, sal ,hiredate FROM t_emp ORDER BY sal DESC, hiredate ASC;

# ORDER BY 可以和 LIMIT 联合使用,找出工资排名前五的员工
SELECT  
	ename, sal 
FROM t_emp ORDER BY sal DESC LIMIT 0, 5;

# 优先级是 FROM > SELECT > ORDER BY > LIMIT

# 使用DISTINCT对某一列提取出来的内容去重,DISTINCT 只能对某一列起作用
SELECT DISTINCT job FROM t_emp;

# 条件查询,使用 WHERE 语句
# 如查询部门为10或20,月薪大于2000的员工
SELECT empno,ename sal FROM t_emp
WHERE (deptno=10 OR deptno=20) AND sal>=2000;

# 查询部门为10 且年薪大于15000,工龄大于20年的员工,年薪等于月薪*12+佣金
# 有的人佣金为NULL, 需要用IFNULL(NULL,0)返回0进行计算
# 使用DATEDIFF(NOW(),hiredate)/365计算工龄
SELECT 
empno, ename, hiredate
FROM t_emp 
WHERE deptno=10 AND 12*sal+IFNULL(comm,0)>=15000 AND DATEDIFF(NOW(),hiredate)/365>=20 ;

#查询 部门为10, 20, 30 且职务不为"SALESMAN" 的员工信息
# 使用IN
SELECT
empno, ename, deptno
FROM t_emp 
WHERE deptno IN(10,20,30) AND job!="SALESMAN";

#查询部门不为10,20的员工
# 使用NOT
SELECT
empno, ename ,deptno
FROM t_emp 
WHERE NOT deptno IN (10,20);

#查询月薪1000-2000的员工
#使用 BETWEEN
SELECT
empno, ename 
FROM t_emp 
WHERE  sal BETWEEN 1000 AND 2000;

#查询佣金 为NULL 的员工
SELECT
 ename 
FROM t_emp 
WHERE  comm IS NULL;

#查询名字以A打头的员工
#使用 LIKE %
SELECT
empno, ename 
FROM t_emp 
WHERE ename LIKE "A%";

#查询名字中含有A的员工
#使用 LIKE %
SELECT
empno, ename 
FROM t_emp 
WHERE ename LIKE "%A%";

#查询名字为_LAKE的员工
#使用 LIKE %
SELECT
empno, ename 
FROM t_emp 
WHERE ename LIKE "_LAKE";


#查询中文名字的员工
# 使用REGEXP
SELECT
empno, ename 
FROM t_emp 
WHERE ename REGEXP "^[\\u4e00-\\u9f15]{2,4}$";






#FROM > WHERE > SELECT > ORDER BY > LIMIT
 
#WHERE 语句执行顺序是从左到右, 应该把带索引的列, 筛选后较少的条件写在左边
