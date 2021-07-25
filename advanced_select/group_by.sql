# GROUP BY 某一列
#按照某一列进行分组,然后在各个组内进行数据汇总
#求各个部门的平均工资
SELECT deptno, ROUND(AVG(sal)) FROM t_emp
GROUP BY deptno;


# 逐级分组
# 统计不同部门的不同岗位的平均底薪和人数
SELECT deptno,job, ROUND(AVG(sal)),COUNT(*) FROM t_emp
GROUP BY deptno,job ORDER BY deptno;


# WITH ROLLUP 对汇总出来的数据再次汇总
# 如下面这条SQL语句统计各个部门的的平均底薪和人数
# 并且在最后一行追加一条各个部门平均底薪的平均和所有部门的人数
SELECT deptno,  ROUND(AVG(sal)), COUNT(*) FROM t_emp
GROUP BY deptno WITH ROLLUP;
 

# GROUP_CONCAT(某一列) 把分组中的某一列的所有数据拼接成一个字符串,以逗号分隔
# 如统计每个部门底薪超过2000的人数和姓名
SELECT
deptno, GROUP_CONCAT(ename),COUNT(*)
FROM t_emp WHERE sal>=2000 GROUP BY deptno;

#FROM -> WHERE -> GROUP BY -> SELECT -> ORDER BY -> LIMIT

