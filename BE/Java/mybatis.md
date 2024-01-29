https://www.cnblogs.com/caizhaokai/p/10982727.html

https://mybatis.org/mybatis-3/zh/java-api.html

#### 简单 sql

##### 2.1 传入参数

(1) 可以传入一个 JavaBean

```java
int insertUser(User bean);
```

(2) 可以传入一个 Map

```java
int insertUserByMap(Map<String, Object> map);
```

(3) 可以传入多个参数，需使用@Param("ParamName") 修饰参数

```java
int insertUserByParam(@Param("id") String id, @Param("name") String name, @Param("age") int age);
```

##### 2.2 Insert，Update，Delete 返回值

接口方法返回值可以使用 void 或 int，int 返回值代表影响行数

##### 　 2.3 Select

- sql 中 as 改名

* 使用@Results 处理映射

@Result(property = "provinceId", column = "province_id")

```java
    @Select("SELECT * FROM city where city_name = #{cityName}")
    // 返回 Map 结果集
    @Results({@Result(property = "id", column = "id"),
            @Result(property = "provinceId", column = "province_id"),
            @Result(property = "cityName", column = "city_name"),
            @Result(property = "description", column = "description")})
    City findByName(@Param("cityName") String cityName);
```

对于 resultMap 可以给与一个 id，其他方法可以根据该 id 来重复使用这个 resultMap

@Results(id="userResults", value={})

@ResultMap("userResults")

```java
 @Results(id="userResults", value={
            @Result(property="id",   column="t_id"),
            @Result(property="age",  column="t_age"),
            @Result(property="name", column="t_name"),
    })
　　 User selectUserById(@Param("id") String id);

 @Select("select t_id, t_age, t_name  "
            + "from sys_user             "
            + "where t_name = #{name}        ")
    @ResultMap("userResults")
　　 User selectUserByName(@Param("name") String name);
```

#### 动态 sql

##### if

```mysql
x
```

```java
   + "<if test='achieveStatus == &quot;yes&quot;.toString()'>and c.achievedate IS NOT NULL </if>"
            + "<if test='achieveStatus == &quot;no&quot;.toString()'>and c.achievedate IS NULL </if>" + "</if>"
            + "<if test='achieveStart != null and achieveStart != &quot;&quot; and achieveEnd != null and achieveEnd != &quot;&quot;'>and date(c.achievedate) between #{achieveStart} and #{achieveEnd} </if>"
```

