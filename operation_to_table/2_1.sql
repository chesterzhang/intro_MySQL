USE test;

CREATE TABLE student (
	
	id INT UNSIGNED PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	gender CHAR(1) NOT NULL,
	birthday DATE NOT NULL,
	tel CHAR(11) NOT NULL,
	remark VARCHAR(200)

) ;

INSERT INTO student VALUES(1,"张三","男","1995-06-01","12345678900",NULL );

SHOW tables;

DESC student;

SHOW CREATE TABLE student;

#DROP TABLE student;
