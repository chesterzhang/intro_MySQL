# 字符函数

SELECT LOWER("ABC");

SELECT UPPER("abc");

SELECT LENGTH("horse");

SELECT CONCAT("100", "$");

SELECT INSTR("WALLMART","A");

SELECT INSERT("你好",1,0,"猪头"); -- 1 表示起始位置, 0 表示插入 而不是替换

SELECT REPLACE("你好先生","先生","女士");

SELECT SUBSTR("你好猪头",3,4); -- 3 表示起始位置, 4表示终止位置

SELECT SUBSTRING("你好猪头",3,4);

SELECT LPAD("Hello",10,"*"); -- 10 表示整个字符串长度

SELECT RPAD("Hello",10,"*"); -- 10 表示整个字符串长度

SELECT TRIM(" 欢迎光临 "); -- 去除首位空格


