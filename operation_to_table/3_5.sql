CREATE TABLE t_message(

	id INT UNSIGNED PRIMARY KEY,
	content VARCHAR(200) NOT NULL,
	type ENUM("ERRO","WARM","INFO") NOT NULL,
	create_time TIMESTAMP NOT NULL,
	INDEX idx_type (type)  # 为type 字段创造一个索引进行查找加速(底层是二叉树)

);


#删除索引
DROP INDEX idx_type ON t_message;

#增加索引
CREATE INDEX idx_type ON t_message(type);

#查看索引
  
