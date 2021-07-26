#INSERT 插入数据

# 向部门表中加入一个新部门
INSERT INTO t_dept(deptno,dname,loc)
VALUES(50, "采购部", "北京"), (60,"安保部","北京"); 
 
# INSERT IGNORE, 若主键冲突,则跳过这一行 
INSERT IGNORE INTO t_dept(deptno,dname,loc)
VALUES(50, "人事部", "北京"), (70,"餐饮部","北京"); 
