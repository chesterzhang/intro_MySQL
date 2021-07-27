# 条件语句

# IF 语句
# SALES 部门发礼品A, 其余部门发礼品B, 打印每名员工获得的礼品
SELECT
e.ename, IF(d.dname="SALES","礼品A","礼品B") AS gift
FROM t_emp e  LEFT JOIN t_dept d ON e.deptno=d.deptno ;


# CASE WHEN 语句
# SALES 部门去P1, ACCOUNTING 部门去P2, RESEARCH部门去P3
SELECT
e.ename,

CASE 
	WHEN d.dname="SALES" THEN "P1"
	WHEN d.dname="ACCOUNTING" THEN "P2"
	WHEN d.dname="RESEARCH" THEN "P3"
END AS place

FROM t_emp e  LEFT JOIN t_dept d ON e.deptno=d.deptno ;

