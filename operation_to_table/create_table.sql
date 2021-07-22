USE test;

CREATE TABLE t_student (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	gender ENUM("男","女") DEFAULT "男",
	birthday DATE NOT NULL,
	tel CHAR(11)
) ;

CREATE TABLE t_dept(
	deptno INT UNSIGNED PRIMARY KEY,
	deptname VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE t_emp(
	deptno INT UNSIGNED PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	FOREIGN KEY (deptno) REFERENCES t_dept (deptno)
);

INSERT INTO t_student VALUES(1,"张三","男","1995-06-01","12345678900" );

INSERT INTO t_student (name,gender,birthday,tel) VALUES("李四","男","1998-02-11","01234567890" );

DESC t_student;

SHOW TABLES;

DROP TABLE t_student;
