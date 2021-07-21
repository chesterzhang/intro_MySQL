# 增加表的列数
ALTER TABLE student
ADD address VARCHAR(200) NOT NULL,
ADD home_tel CHAR(11) NOT NULL;


# 该表表某一列的数据类型
ALTER TABLE student
MODIFY home_tel VARCHAR(20) NOT NULL;

# 改变表某一列字段的名称和约束
ALTER TABLE student
CHANGE address home_addr VARCHAR(200) NOT NULL;

# 删除表的某一列
ALTER TABLE student
DROP home_tel;

DESC student;
