#增加表的列数
ALTER TABLE t_student
ADD home_tel CHAR(11) NOT NULL;

#改变表某一列的数据类型
ALTER TABLE t_student MODIFY home_tel VARCHAR(20) NOT NULL;


#改变表某一列的名称和约束
ALTER TABLE student
CHANGE home_tel tel VARCHAR(20) ;

# 删除表的某一列
ALTER TABLE student
DROP tel;
