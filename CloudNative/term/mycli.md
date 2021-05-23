---
title: mycli
date: 2018-08-22 17:42:17
tags:
categories:
---

https://www.mycli.net/

```vbscript
MasterDb.global.properties= "ip=172.22.38.141,  port=3306,dbName=dev, dbType=mysql ,dbStatus=RW"
MasterDb.app.properties= "userName=market ,checkValidConnectionSQL=select 1,minPoolSize=5 , maxPoolSize=10 , idleTimeout=1000 , blockingTimeout=100000,preparedStatementCacheSize=15 ,connectionProperties=connectTimeout=1000&autoReconnect=true&socketTimeout=12000&characterEncoding=utf-8&rewriteBatchedStatements=true"
MasterDb.passwd.properties= "encPasswd=market"
```

```bash
$ mycli -h localhost -u root app_db
$ mycli mysql://amjith@localhost:3306/django_poll


mycli mysql://market@172.22.38.141:3306/dev

mycli -h 172.22.38.141 -u market dev
```

```mysql
SELECT COUNT(g)  FROM  WHERE `status`="上架" AND ztlx IS NOT NULL GROUP BY ztlx;

goods_supplier

province

supplier_id

SELECT COUNT(supplier_id) FROM goods_supplier;


//查询 传 json
SELECT province,COUNT(supplier_id) num FROM goods_supplier GROUP BY province;
```

### 查询供应商省份信息

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.inspur.manage.Mapper.IndexsMapper">
    <select id="selectuser" resultType="map">
	select count(nickname) as total,FROM_UNIXTIME(create_time,'%Y-%m-%d') as create_time
		from user group BY FROM_UNIXTIME(create_time,'%Y-%m-%d');
</select>
    <select id="selectAmaker" resultType="map">
	select count(name) as total,FROM_UNIXTIME(add_time,'%Y-%m-%d') as add_time
		from amaker group BY FROM_UNIXTIME(add_time,'%Y-%m-%d');
</select>
    <select id="selectBmaker" resultType="map">
		select count(name) as total,FROM_UNIXTIME(add_time,'%Y-%m-%d') as add_time
		from bmaker group BY FROM_UNIXTIME(add_time,'%Y-%m-%d');
</select>
    <select id="OpendataSum" resultType="String" parameterType="map">
    SELECT sum(total_price) as sales FROM order_build WHERE pay_status = 'paid' AND pay_time BETWEEN #{sdate} AND #{edate};
</select>
    <select id="DatasqSum" resultType="String" parameterType="map">
    SELECT count(*) FROM order_build WHERE create_time BETWEEN #{sdate} AND #{edate};
</select>
    <select id="DemandSum" resultType="String" parameterType="map">
    SELECT count(*) FROM goods_supplier WHERE create_time BETWEEN #{sdate} AND #{edate};
</select>
    <select id="OrderSum" resultType="String" parameterType="map">
    SELECT count(*) FROM goods_info WHERE is_shelved = '已上架' AND shelved_time BETWEEN #{sdate} AND #{edate};
</select>
    <select id="selectcategory" resultType="map">
	SELECT COUNT(goods_id) num,ztlx FROM opendata WHERE `status`="上架" AND ztlx IS NOT NULL GROUP BY ztlx;
</select>
    <select id="selectcitytop" resultType="map">
	SELECT COUNT(*) num,t1.area,t2.dq_mc FROM opendata t1 INNER JOIN code_table_area t2 ON t1.area=t2.dq_dm GROUP BY t1.area ORDER BY num DESC LIMIT 5;
</select>
    <select id="selectareahot" resultType="map">
	select COUNT(*) num,t1.area,t2.dq_mc,substring(t1.area,1,2) ea FROM opendata t1 INNER JOIN code_table_area t2 ON substring(t1.area,1,2)=t2.dq_dm GROUP BY substring(t1.area,1,2);
</select>
</mapper>

```

### 添加供应商

```xml
     <insert id="addSuppliers" parameterType="map" >
       insert into goods_supplier(supplier_name,province,short_name,supplier_img,description,supplier_url,state,supplier_index,key_name,supplier_tab,supplier_key,customerservice,workinghours,email,link_flag,link_key,key_ctime)
       values (
        #{supplierName},#{supplierProvince},#{shortName},#{imgUrl},#{content},#{supplierUrl},'1',#{score},#{key_name},
        #{supplier_tab},#{supplier_key},#{customerservice},#{workinghours},#{email},#{link_flag},
        #{link_key},#{key_ctime})

    </insert>
```

`all.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.inspur.manage.Mapper.SuppliersMapper">
	<select id="findSuppliers" parameterType="map" resultType="map">
    	SELECT
    		supplier_id AS id,
    		supplier_id AS supplier_id,
    		supplier_name AS suppliername,
    		short_name AS shortname,
    		supplier_index AS score,
    		customerservice,
    		workinghours,
    		email,
    		IFNULL(liaison_name,'') AS liaison_name,
    		IFNULL(liaison_phone,'') AS liaison_phone,
    		IFNULL(liaison_email,'') AS liaison_email,
			CASE
				WHEN state ='0' THEN '隐藏'
				WHEN state = '1' THEN '显示'
			END status
		FROM goods_supplier
    	WHERE 1=1
    	<if test="supplierName != null and supplierName !=''">
			AND supplier_name LIKE '%${supplierName}%'
		</if>

		<if test="status != null and status !='' ">
			AND state = #{status}
		</if>
			ORDER BY supplier_id ASC
    </select>
    <select id="loadSuppliers" resultType="map">



    </select>

	<insert id="addSuppliers" parameterType="map" >
       insert into goods_supplier(supplier_name,province,short_name,supplier_img,description,supplier_url,state,supplier_index,key_name,supplier_tab,supplier_key,customerservice,workinghours,email,link_flag,link_key,key_ctime)
       values (
        #{supplierName},#{supplierProvince},#{shortName},#{imgUrl},#{content},#{supplierUrl},'1',#{score},#{key_name},
        #{supplier_tab},#{supplier_key},#{customerservice},#{workinghours},#{email},#{link_flag},
        #{link_key},#{key_ctime})
    </insert>

	<select id="searchInfo"  resultType="map">
     	select * from goods_supplier where supplier_id = #{id}
	</select>


    <update id="updateSuppliers" parameterType="map" >
        update goods_supplier set supplier_name = #{supplierName},short_name = #{shortName},customerservice = #{customerservice},workinghours = #{workinghours},email = #{email},
        supplier_img = #{imgUrl},key_name = #{key_name},supplier_key=#{supplier_key},supplier_tab=#{supplier_tab},
        description = #{content},supplier_url = #{supplierUrl},supplier_index = #{score},link_flag=#{link_flag},link_key=#{link_key},key_ctime=#{key_ctime}
        where supplier_id = #{id}

   	</update>
   	<update id="updateStatus" parameterType="map" >
        update goods_supplier set state = #{status}
        where supplier_id = #{id}

   	</update>

   	<select id="searchImgPath"  resultType="String">
		select supplier_img from goods_supplier where supplier_id = #{id}
	</select>
	<select id="searchContent"  resultType="String">
		select description from goods_supplier where supplier_id = #{id}
	</select>
	<delete id = "deleteData">
		delete from goods_supplier where supplier_id = #{id}
	</delete>

	<select id="getMaxId"  resultType="int">
		select max(supplier_id) from goods_supplier

	</select>
</mapper>
```

```xml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.inspur.manage.Mapper.SuppliersMapper">
  <select id="findSuppliers" parameterType="map" resultType="map">SELECT supplier_id AS id, supplier_id AS supplier_id, supplier_name AS suppliername, short_name AS shortname, supplier_index AS score, customerservice, workinghours, email, IFNULL(liaison_name,'') AS liaison_name, IFNULL(liaison_phone,'') AS liaison_phone, IFNULL(liaison_email,'') AS liaison_email, CASE WHEN state ='0' THEN '隐藏' WHEN state = '1' THEN '显示' END status FROM goods_supplier WHERE 1=1
    <if test="supplierName != null and supplierName !=''">AND supplier_name LIKE '%${supplierName}%'</if>
    <if test="status != null and status !='' ">AND state = #{status}</if> ORDER BY supplier_id ASC
  </select>
  <select id="loadSuppliers" resultType="map"></select>
  <insert id="addSuppliers" parameterType="map">insert into goods_supplier(supplier_name,province,short_name,supplier_img,description,supplier_url,state,supplier_index,key_name,supplier_tab,supplier_key,customerservice,workinghours,email,link_flag,link_key,key_ctime) values ( #{supplierName},#{supplierProvince},#{shortName},#{imgUrl},#{content},#{supplierUrl},'1',#{score},#{key_name}, #{supplier_tab},#{supplier_key},#{customerservice},#{workinghours},#{email},#{link_flag}, #{link_key},#{key_ctime})</insert>
  <select id="searchInfo" resultType="map">select * from goods_supplier where supplier_id = #{id}</select>
  <update id="updateSuppliers" parameterType="map">update goods_supplier set supplier_name = #{supplierName},short_name = #{shortName},customerservice = #{customerservice},workinghours = #{workinghours},email = #{email}, supplier_img = #{imgUrl},key_name = #{key_name},supplier_key=#{supplier_key},supplier_tab=#{supplier_tab}, description = #{content},supplier_url = #{supplierUrl},supplier_index = #{score},link_flag=#{link_flag},link_key=#{link_key},key_ctime=#{key_ctime} where supplier_id = #{id}</update>
  <update id="updateStatus" parameterType="map">update goods_supplier set state = #{status} where supplier_id = #{id}</update>
  <select id="searchImgPath" resultType="String">select supplier_img from goods_supplier where supplier_id = #{id}</select>
  <select id="searchContent" resultType="String">select description from goods_supplier where supplier_id = #{id}</select>
  <delete id="deleteData">delete from goods_supplier where supplier_id = #{id}</delete>
  <select id="getMaxId" resultType="int">select max(supplier_id) from goods_supplier</select>
</mapper>

```
