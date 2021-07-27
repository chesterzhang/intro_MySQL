# 时间函数

# 查询当前时间 
SELECT NOW(), CURDATE(), CURTIME();

 
# 日期格式化函数
SELECT DATE_FORMAT(NOW(), "%Y"); -- 提取年份, 还可以提取月份,日,星期, 时, 分, 秒, 一年第几天等等

# 查询1981年上半年入职的员工有多少人
SELECT
COUNT(*)
FROM t_emp 
WHERE DATE_FORMAT(hiredate, "%Y") =1981 AND DATE_FORMAT(hiredate, "%m") <=6;

# DATE_ADD 时间偏移函数
SELECT DATE_ADD(NOW(),INTERVAL 10 DAY);
SELECT DATE_ADD(NOW(),INTERVAL -200 MINUTE);

