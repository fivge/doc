#### database

#### table

```mysql
Truncate table Person
```

##### `SELECT`

```mysql
-- OR
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 25000000;

-- UNION
SELECT name, population, area FROM world
WHERE area > 3000000
UNION
SELECT name, population, area FROM world
WHERE population > 25000000;

-- AND
SELECT * FROM cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;

-- https://github.com/CyC2018/CS-Notes/blob/master/notes/Leetcode-Database%20%E9%A2%98%E8%A7%A3.md#178-rank-scores
SELECT a.Score AS score,
    (SELECT count(DISTINCT b.Score)
        FROM Scores b
        WHERE b.Score >= a.Score
    ) AS rank
FROM Scores a
ORDER BY Score DESC;
-- INNER JOIN
SELECT
    S1.score 'Score',
    COUNT( DISTINCT S2.score ) 'Rank'
FROM
    Scores S1
    INNER JOIN Scores S2
    ON S1.score <= S2.score
GROUP BY
    S1.id, S1.score
ORDER BY
    S1.score DESC;
```

##### `INSERT`

```mysql

```



##### `UPDATE`

```mysql
-- CASE WHEN
UPDATE salary
SET
    sex = CASE sex
        WHEN 'm' THEN 'f'
        WHEN 'f' THEN 'm'
        ELSE 'x'
    END;

-- IF
UPDATE salary
SET
    sex = IF(sex = 'm', 'f', 'm');

-- char
UPDATE salary
SET
    sex = char(ascii('m') + ascii('f') - ascii(sex));
```

##### `IN` `NOT`

```mysql
-- IN

-- https://leetcode-cn.com/problems/department-highest-salary/
SELECT
    d.Name Department,
    e.Name Employee,
    e.Salary Salary
FROM
    Employee e
    JOIN Department d ON e.DepartmentId = d.Id
WHERE
    (e.Salary, e.DepartmentId) IN (
        SELECT
            Max(Salary),
            DepartmentId
        FROM
            Employee
        GROUP BY
            DepartmentId
    );
```

##### `between and`…

```mysql
select * from product where date(add_time) between '2013-01-01' and '2013-01-31'
```

##### `GROUP BY` `ORDER BY`

```mysql
-- https://leetcode-cn.com/problems/classes-more-than-5-students/comments/

#最朴实的写法，共三层查询，先利用 DISTINCT 去掉重复记录得到表 A，再利用 GROUP BY 为 CLASS 分组，然
#后用 COUNT() 统计每组个数得到表 B，最后在最外层限定数量 >=5 查到结果
SELECT b.class FROM
    ( SELECT a.class, count(a.class) c FROM
            ( SELECT DISTINCT * FROM courses ) a
        GROUP BY a.class
    ) b
WHERE b.c >= 5;

# HAVING
SELECT b.class, count(b.class) FROM
    ( SELECT DISTINCT a.student, a.class FROM courses a ) b
GROUP BY b.class
HAVING count(b.class) >= 5;

# 对 class 列进行分组之后，再使用 count 汇总函数统计数量，统计之后使用 having 进行过滤
SELECT class FROM courses
GROUP BY class
HAVING count( DISTINCT student ) >= 5;
```

```mysql
# GROUP BY 自动按分组字段进行排序，ORDER BY 也可以按汇总字段来进行排序。
SELECT col, COUNT(*) AS num
FROM mytable
GROUP BY col
ORDER BY num;

# WHERE 过滤行，HAVING 过滤分组，行过滤应当先于分组过滤。
SELECT col, COUNT(*) AS num
FROM mytable
WHERE col > 2
GROUP BY col
HAVING num >= 2;
```

分组规定：

- GROUP BY 子句出现在 WHERE 子句之后，ORDER BY 子句之前；
- 除了汇总字段外，SELECT 语句中的每一字段都必须在 GROUP BY 子句中给出；
- NULL 的行会单独分为一组；
- 大多数 SQL 实现不支持 GROUP BY 列具有可变长度的数据类型。



##### `function()`

`Max()`

```mysql
-- Second Highest Salary
SELECT
    Max(e1.Salary) SecondHighestSalary
FROM
    Employee e1,
    (
        SELECT
            Max(Salary) Salary
        FROM
            employee
    ) e2
WHERE
    e1.Salary != e2.Salary
ORDER BY
    e1.Salary DESC;
```

```mysql
-- ORDER BY & LIMIT
SELECT
    (
        SELECT
            DISTINCT salary
        FROM
            Employee
        ORDER BY
            salary DESC
        LIMIT
            1, 1
    ) AS SecondHighestSalary;

-- 第N高
CREATE FUNCTION getNthHighestSalary (N INT) RETURNS INT BEGIN
SET
    N = N - 1;

RETURN (
    SELECT
        (
            SELECT
                DISTINCT Salary
            FROM
                Employee
            ORDER BY
                Salary DESC
            LIMIT
                N, 1
        )
);

END;

SELECT
    getNthHighestSalary(3);
```

##### `DELETE`

```mysql
-- 连接
DELETE p1
FROM
    person p1,
    person p2
WHERE
    p1.email = p2.email
    AND p1.id > p2.id

-- 子查询
DELETE
FROM
    Person
WHERE
    id NOT IN ( SELECT id FROM ( SELECT min( id ) AS id FROM Person GROUP BY email ) AS m );
```

##### `JOIN`

> JOIN ON

内连接 自连接 `INNER JOIN`

自然连接 `NATURAL JOIN`

外连接： 左外连接，右外连接以及全外连接 `LEFT OUTER JOIN`  `RIGHT OUTER JOIN`  `FULL JOIN` 

```mysql
-- INNER JOIN
SELECT
    a.Name Employee
FROM
    Employee a
    JOIN Employee b ON a.ManagerId = b.Id
WHERE
    a.Salary > b.Salary;
    

    
-- LEFT JOIN
SELECT
    p.firstname,
    p.lastname,
    a.city,
    a.state
FROM
    person AS p
    LEFT JOIN address AS a ON p.personId = a.personId;
    
SELECT
    c.Name Customers
FROM
    Customers c
    LEFT JOIN Orders o ON c.Id = o.CustomerId
WHERE
    o.id IS NULL;
```



















































---

### tmp

```bash
mycli -uroot -p1234
```

```mysql
Create table If Not Exists Logs (Id int, Num int);
Truncate table Logs
insert into Logs (Id, Num) values ('1', '1'),('2', '1'),('3', '1'),('4', '2'),('5', '1'),('6', '2'),('7', '2');
```

```mysql
select * from 
(select * from
logs l1 join logs l2
on l1.num = l2.num AND l2.id = l1.id + 1) lt join logs l3
on l1.num = l3.num AND l3.id = l2.id + 1;

select DISTINCT l3.num  `ConsecutiveNums` from 
(select l1.id id1,l1.num num1,l2.id id2,l2.num num2 from
logs l1 join logs l2
on l1.num = l2.num AND l2.id = l1.id + 1) lt join logs l3
on lt.num1 = l3.num AND l3.id = lt.id2 + 1;

SELECT DISTINCT Num ConsecutiveNums FROM
  (SELECT Num,(RowNo - ROW_NUMBER() OVER (PARTITION BY Num ORDER BY RowNo)) Rank FROM 
	(SELECT Num,ROW_NUMBER() OVER (ORDER BY Id) RowNo FROM Logs) A ) B
GROUP BY Num,Rank
HAVING COUNT(1) >=3;
```



https://leetcode-cn.com/problems/rank-scores/

 [https://github.com/CyC2018/CS-Notes/blob/master/notes/Leetcode-Database%20%E9%A2%98%E8%A7%A3.md#178-rank-scores](https://github.com/CyC2018/CS-Notes/blob/master/notes/Leetcode-Database 题解.md#178-rank-scores) 

https://github.com/Peefy/JavaInVSCode
