
标签
# PostgreSQL , cube , imgsmlr , 相似人群 , 人群扩选 , 精准营销 , 人群画像 , 推荐系统

背景
PostgreSQL 相似插件非常多，插件的功能以及用法如下：

《PostgreSQL 相似搜索插件介绍大汇总 (cube,rum,pg_trgm,smlar,imgsmlr,pg_similarity) (rum,gin,gist)》

相似人群分析在精准营销，推荐系统中的需求很多。

人的属性可以使用向量来表达，每个值代表一个属性的权重值，通过向量相似，可以得到一群相似的人群。

例如

create table tt (  
  uid int8 primary key,  
  att1 float4,  -- 属性1 的权重值   
  att2 float4,  -- 属性2 的权重值  
  att3 float4,  -- 属性3 的权重值  
  ...  
  attn float4   -- 属性n 的权重值  
);  
使用cube表示属性

create table tt (  
  uid int8 primary key,  
  att cube  -- 属性  
);  
使用cube或imgsmlr可以达到类似的目的。

a <-> b	float8	Euclidean distance between a and b.  
a <#> b	float8	Taxicab (L-1 metric) distance between a and b.  
a <=> b	float8	Chebyshev (L-inf metric) distance between a and b.  
但是如果向量很大(比如属性很多)，建议使用一些方法抽象出典型的特征值，压缩向量。 类似图层，图片压缩。实际上imgsmlr就是这么做的：

pic

例如256*256的像素，压缩成4*4的像素，存储为特征值。

例子
1、创建插件

create extension cube;  
2、创建测试表

create table tt (id int , c1 cube);  
3、创建GIST索引

create index idx_tt_1 on tt using gist(c1);  
4、创建生成随机CUBE的函数

create or replace function gen_rand_cube(int,int) returns cube as $$  
  select ('('||string_agg((random()*$2)::text, ',')||')')::cube from generate_series(1,$1);  
$$ language sql strict;  
5、CUBE最多存100个维度

postgres=# \set VERBOSITY verbose  
  
postgres=# select gen_rand_cube(1000,10);  
  
ERROR:  22P02: invalid input syntax for cube  
DETAIL:  A cube cannot have more than 100 dimensions.  
CONTEXT:  SQL function "gen_rand_cube" statement 1  
LOCATION:  cube_yyparse, cubeparse.y:111  
6、写入测试数据

insert into tt select id, gen_rand_cube(16, 10) from generate_series(1,10000) t(id);  
7、通过单个特征值CUBE查询相似人群，以点搜群

select * from tt order by c1 <-> '(1,2,3,4,5,6,7)' limit x;  -- 个体搜群体  
8、通过多个特征值CUBE查询相似人群，以群搜群

select * from tt order by c1 <-> '[(1,2,3,4,5,6,7),(1,3,4,5,6,71,3), ...]' limit x; -- 群体搜群体  
postgres=# explain select * from tt order by c1 <-> '[(1,2,3),(2,3,4)]' limit 1;  
                                QUERY PLAN                                  
--------------------------------------------------------------------------  
 Limit  (cost=0.11..0.14 rows=1 width=44)  
   ->  Index Scan using idx_tt_1 on tt  (cost=0.11..0.16 rows=2 width=44)  
         Order By: (c1 <-> '(1, 2, 3),(2, 3, 4)'::cube)  
(3 rows)  
9、如果需要再计算压缩前的特征值的相似性，可以使用原始值再计算一遍。

《PostgreSQL 遗传学应用 - 矩阵相似距离计算 (欧式距离,...XX距离)》

select *,   
  c1 <-> ?1,   -- c1表示压缩后的特征值浮点数向量，比如（4*4）  
  distance_udf(detail_c1,?2)   -- deatil_c1 表示原始特征值浮点数向量(比如128*128)    
from tt order by c1 <-> ?1 limit xx;  
参考

# README 
# dba报告

PostgreSQL AWR报告(for 阿里云ApsaraDB PgSQL)
作者
digoal

日期
2016-11-23

标签
PostgreSQL , AWR , Oracle , 数据库诊断 , 性能报告 , snapshot , 快照

背景
熟悉Oracle的童鞋一定对AWR不陌生，通常要分析一个数据库在某个时间段的性能，可以从数据库的动态视图等统计信息记录中生成一份该时段的统计分析报告。

里面包含了常见的等待事件分析，TOP SQL, TOP event等。

PostgreSQL是一个功能和Oracle几乎可以媲美的开源产品，分析报告的工具也非常多，例如pgstatsinfo, pgsnap, pgtop, pgfouine, ..... 非常的多。

我不想介绍这么多的工具，而是自己根据对PG的经验写了一个非常简单易用的，不需要安装一堆的插件，周期性的打快照即可。 用法和AWR非常类似。

本文主要是将之前写的一个比较完整的巡检脚本转换成SQL接口的AWR，易用性更强，不需要登陆数据库主机，即可获得报告。

将来PG加入新的统计信息表，我会继续追加到这个简单的工具中。

希望大家一起来使用和改进，有问题可以发给我。

一、用法
1. 创建插件

create extension pg_awr;  
2. 打快照(全局)

select __rds_pg_stats__.snap_global();    --  给全局打快照（注意包含的是全局信息，并不是每个库的快照信息）。  
3. 打快照(库级)

select __rds_pg_stats__.snap_database();  --  给当前数据库打快照。  
4. 查看快照清单

select * from __rds_pg_stats__.snap_list;  
5. 指定快照起始ID，生成全局报告(text模式)

select * from __rds_pg_stats__.snap_report_global($begin_snap_id, $end_snap_id);  
6. 指定快照起始ID，生成库级报告(text模式)

select * from __rds_pg_stats__.snap_report_database($begin_snap_id, $end_snap_id);  
7. 指定快照起始ID，生成全局报告(md模式)

psql --pset=pager=off -q -h xxx.xxx.xxx.xxx -p xxxx -U superuser -d dbname -c "select * from __rds_pg_stats__.snap_report_global(1,1)" > /tmp/global.md  
8. 指定快照起始ID，生成库级报告(md模式)

psql --pset=pager=off -q -h xxx.xxx.xxx.xxx -p xxxx -U superuser -d dbname -c "select * from __rds_pg_stats__.snap_report_database(2,10)" > /tmp/db.md  
9. 解读报告(略, 报告内自带推荐建议)

10. 清除历史快照

10.1 删除指定snap_ID以前的快照。

select __rds_pg_stats__.snap_delete(10::int8);               -- 删除指定SNAP ID以前的快照  
10.2 删除指定时间以前的快照。

select __rds_pg_stats__.snap_delete('2016-11-23 12:00:00');  -- 删除指定时间前的快照。  
10.3 保留最近的几个快照，其他删除。

select __rds_pg_stats__.snap_delete(10::int4);                -- 保留最近的10个快照，其他删除。    
二、接口介绍
1. 快照列表

其实就是快照的清单，每打一个快照，就会新增一条记录。

postgres=# select * from __rds_pg_stats__.snap_list;  
 id |          snap_ts           | snap_level   
----+----------------------------+------------  
  1 | 2016-11-23 19:59:10.321282 | database  
  3 | 2016-11-23 22:29:55.139357 | global  
  4 | 2016-11-23 22:30:42.602292 | database  
  5 | 2016-11-23 22:30:42.602292 | database  
  6 | 2016-11-23 22:30:42.602292 | database  
  7 | 2016-11-23 22:29:55.139357 | global  
  8 | 2016-11-23 22:29:55.139357 | global  
  9 | 2016-11-23 22:29:55.139357 | global  
 10 | 2016-11-23 23:00:31.796333 | global  
 11 | 2016-11-23 22:29:55.139357 | global  
 12 | 2016-11-23 23:02:36.590308 | database  
 13 | 2016-11-23 23:03:51.727333 | global  
 14 | 2016-11-23 23:03:51.727333 | global  
 15 | 2016-11-23 23:03:51.727333 | global  
 16 | 2016-11-23 23:03:51.727333 | global  
 17 | 2016-11-23 23:03:51.727333 | global  
 18 | 2016-11-23 23:03:51.727333 | global  
 19 | 2016-11-23 23:03:51.727333 | global  
 20 | 2016-11-23 23:03:51.727333 | global  
 21 | 2016-11-23 23:02:36.590308 | database  
 22 | 2016-11-23 23:08:50.900675 | global  
 23 | 2016-11-23 23:08:53.153526 | global  
 24 | 2016-11-23 23:08:55.816379 | global  
 25 | 2016-11-23 23:09:11.242692 | database  
 26 | 2016-11-23 23:09:32.270733 | database  
(25 rows)  
2. 快照历史数据表

打快照时，会将系统的统计信息记录到这些历史表，后面根据时间段生成诊断报告就用到这里的数据。

postgres=# \dt __rds_pg_stats__.snap_*  
                      List of relations  
    Schema    |            Name            | Type  |  Owner     
--------------+----------------------------+-------+----------  
 __rds_pg_stats__ | snap_list                  | table | postgres  
 __rds_pg_stats__ | snap_pg_conn_stats         | table | postgres  
 __rds_pg_stats__ | snap_pg_cputime_topsql     | table | postgres  
 __rds_pg_stats__ | snap_pg_database_age       | table | postgres  
 __rds_pg_stats__ | snap_pg_db_conn_limit      | table | postgres  
 __rds_pg_stats__ | snap_pg_db_rel_size        | table | postgres  
 __rds_pg_stats__ | snap_pg_db_role_setting    | table | postgres  
 __rds_pg_stats__ | snap_pg_db_size            | table | postgres  
 __rds_pg_stats__ | snap_pg_dead_tup           | table | postgres  
 __rds_pg_stats__ | snap_pg_hash_idx           | table | postgres  
 __rds_pg_stats__ | snap_pg_index_bloat        | table | postgres  
 __rds_pg_stats__ | snap_pg_long_2pc           | table | postgres  
 __rds_pg_stats__ | snap_pg_long_xact          | table | postgres  
 __rds_pg_stats__ | snap_pg_many_indexes_rel   | table | postgres  
 __rds_pg_stats__ | snap_pg_notused_indexes    | table | postgres  
 __rds_pg_stats__ | snap_pg_rel_age            | table | postgres  
 __rds_pg_stats__ | snap_pg_rel_space_bucket   | table | postgres  
 __rds_pg_stats__ | snap_pg_role_conn_limit    | table | postgres  
 __rds_pg_stats__ | snap_pg_seq_deadline       | table | postgres  
 __rds_pg_stats__ | snap_pg_stat_activity      | table | postgres  
 __rds_pg_stats__ | snap_pg_stat_archiver      | table | postgres  
 __rds_pg_stats__ | snap_pg_stat_bgwriter      | table | postgres  
 __rds_pg_stats__ | snap_pg_stat_database      | table | postgres  
 __rds_pg_stats__ | snap_pg_stat_statements    | table | postgres  
 __rds_pg_stats__ | snap_pg_statio_all_indexes | table | postgres  
 __rds_pg_stats__ | snap_pg_statio_all_tables  | table | postgres  
 __rds_pg_stats__ | snap_pg_table_bloat        | table | postgres  
 __rds_pg_stats__ | snap_pg_tbs_size           | table | postgres  
 __rds_pg_stats__ | snap_pg_unlogged_table     | table | postgres  
 __rds_pg_stats__ | snap_pg_user_deadline      | table | postgres  
 __rds_pg_stats__ | snap_pg_vacuumlo           | table | postgres  
 __rds_pg_stats__ | snap_pg_waiting            | table | postgres  
(32 rows)  
3. 创建快照

顾名思义，就是创建快照，我这里分为两种快照，一种是全局的，一种是库级的。

全局的在哪里创建(首先创建extension pg_awr;)都可以，但是只需要创建一次就够了，而库级的需要连接到需要分析库去创建快照。

select __rds_pg_stats__.snap_database();  -- 库级快照  
  
select __rds_pg_stats__.snap_global();    -- 全局快照  
三、部署快照功能(非RDS，自己部署的话)
1 修改配置文件
需要用到pg_stat_statements插件，统计TOP SQL。

$ vi postgresql.conf   
  
shared_preload_libraries='pg_stat_statements'   
  
$ pg_ctl restart -m fast   
2 初始化
在需要打快照的库都装上这个SQL，里面包含了(创建打快照的function, 创建清理快照的function, 创建生成报告的function)。

init.sql

四、其他
目前还不支持从日志文件生成统计报告，这部分可以修改源码后实现，当然，如果你能访问数据库主机，那一切都简单了。

我写本文的目的是，只要能连数据库，就能生成诊断报告。

echo "|+++++++++++++++++++++++++++++++++++++++++++++++++++++++++|"  
echo "|                   数据库错误日志分析                    |"  
echo "|+++++++++++++++++++++++++++++++++++++++++++++++++++++++++|"  
echo ""  
  
echo "----->>>---->>>  获取错误日志信息: "  
cat *.csv | grep -E "^[0-9]" | grep -E "WARNING|ERROR|FATAL|PANIC" | awk -F "," '{print $12" , "$13" , "$14}'|sort|uniq -c|sort -rn  
echo "建议: "  
echo "    参考 http://www.postgresql.org/docs/current/static/errcodes-appendix.html ."  
echo -e "\n"  
  
echo "----->>>---->>>  获取连接请求情况: "  
find . -name "*.csv" -type f -mtime -28 -exec grep "connection authorized" {} +|awk -F "," '{print $2,$3,$5}'|sed 's/\:[0-9]*//g'|sort|uniq -c|sort -n -r  
echo "建议: "  
echo "    连接请求非常多时, 请考虑应用层使用连接池, 或者使用pgbouncer连接池. "  
echo -e "\n"  
  
echo "----->>>---->>>  获取认证失败情况: "  
find . -name "*.csv" -type f -mtime -28 -exec grep "password authentication failed" {} +|awk -F "," '{print $2,$3,$5}'|sed 's/\:[0-9]*//g'|sort|uniq -c|sort -n -r  
echo "建议: "  
echo "    认证失败次数很多时, 可能是有用户在暴力破解, 建议使用auth_delay插件防止暴力破解. "  
echo -e "\n"  
  
echo "|+++++++++++++++++++++++++++++++++++++++++++++++++++++++++|"  
echo "|                   数据库慢SQL日志分析                   |"  
echo "|+++++++++++++++++++++++++++++++++++++++++++++++++++++++++|"  
echo ""  
  
echo "----->>>---->>>  慢查询统计: "  
cat *.csv|awk -F "," '{print $1" "$2" "$3" "$8" "$14}' |grep "duration:"|grep -v "plan:"|awk '{print $1" "$4" "$5" "$6}'|sort|uniq -c|sort -rn  
echo "建议: "  
echo "    输出格式(条数,日期,用户,数据库,QUERY,耗时ms). "  
echo "    慢查询反映执行时间超过log_min_duration_statement的SQL, 可以根据实际情况分析数据库或SQL语句是否有优化空间. "  
echo ""  
echo "----->>>---->>>  慢查询分布头10条的执行时间, ms: "  
cat *.csv|awk -F "," '{print $1" "$2" "$3" "$8" "$14}' |grep "duration:"|grep -v "plan:"|awk '{print $1" "$4" "$5" "$6" "$7" "$8}'|sort -k 6 -n|head -n 10  
echo ""  
echo "----->>>---->>>  慢查询分布尾10条的执行时间, ms: "  
cat *.csv|awk -F "," '{print $1" "$2" "$3" "$8" "$14}' |grep "duration:"|grep -v "plan:"|awk '{print $1" "$4" "$5" "$6" "$7" "$8}'|sort -k 6 -n|tail -n 10  
echo -e "\n"  
  
echo "----->>>---->>>  auto_explain 分析统计: "  
cat *.csv|awk -F "," '{print $1" "$2" "$3" "$8" "$14}' |grep "plan:"|grep "duration:"|awk '{print $1" "$4" "$5" "$6}'|sort|uniq -c|sort -rn  
echo "建议: "  
echo "    输出格式(条数,日期,用户,数据库,QUERY). "  
echo "    慢查询反映执行时间超过auto_explain.log_min_duration的SQL, 可以根据实际情况分析数据库或SQL语句是否有优化空间, 分析csvlog中auto_explain的输出可以了解语句超时时的执行计划详情. "  
echo -e "\n"  
修改源码要达到的目的，支持rotate table日志记录

将审计日志，慢SQL，auto_explain日志，错误日志记录特殊的数据表

该表不记录redo，使用APPEND ONLY方式，

该表保持一定记录条数，或大小限制，可以通过GUC配置记录数和SIZE.

好处，方便用户查询，方便生成诊断报告。

# 主从同步那个机器更费?
是从服务器

# PostgreSQL bgwriter,walwriter,backend process 写磁盘的实时监控
日志写耗费磁盘
sql写耗费磁盘.


# PostgreSQL , DBA , 日常

背景
1、AWR 数据库健康报告，

《PostgreSQL AWR报告(for 阿里云ApsaraDB PgSQL)》

《如何生成和阅读EnterpriseDB (PPAS(Oracle 兼容版)) AWR诊断报告》

2、查看TOP SQL，以及SQL优化方法

《PostgreSQL 如何查找TOP SQL (例如IO消耗最高的SQL) (包含SQL优化内容) - 珍藏级》

3、监控指标

《PostgreSQL 实时健康监控 大屏 - 低频指标 - 珍藏级》

《PostgreSQL 实时健康监控 大屏 - 高频指标(服务器) - 珍藏级》

《PostgreSQL 实时健康监控 大屏 - 高频指标 - 珍藏级》

4、排查FREEZE引入的IO和CPU飙升，

《PostgreSQL Freeze 风暴预测续 - 珍藏级SQL》

《PostgreSQL freeze 风暴导致的IOPS飙升 - 事后追溯》

5、查看当前慢SQL，长事务，长2PC事务，

例如执行时间超过5秒的QUERY

select pid,state,query_start,xact_start,now()-query_start,wait_event_type,wait_event,query 
from pg_stat_activity where now()-query_start > '5 s' order by query_start;  
select * from pg_prepared_xacts ;  
6、根据PID杀会话或QUERY，

查询当前系统在执行的SQL，PID。（普通用户无法查看其它用户执行的QUERY）

select pid,state,query_start,xact_start,now()-query_start,wait_event_type,wait_event,query from pg_stat_activity order by query_start;  
KILL QUERY

select pg_cancel_backend(pid);  
KILL 会话

select pg_terminate_backend(pid);  
7、查看膨胀的表和索引，截取自bucardo开源的check_postgres

《如何检测、清理膨胀、垃圾(含修改分布键) - 阿里云HybridDB for PG最佳实践》

8、不堵塞DML的并行建索引方法，

加索引时，可以使用CONCURRENTLY语法，不堵塞DML操作。

Command:     CREATE INDEX     
Description: define a new index     
Syntax:     
CREATE [ UNIQUE ] INDEX [ CONCURRENTLY ] [ [ IF NOT EXISTS ] name ] ON table_name [ USING method ]     
    ( { column_name | ( expression ) } [ COLLATE collation ] [ opclass ] [ ASC | DESC ] [ NULLS { FIRST | LAST } ] [, ...] )     
    [ WITH ( storage_parameter = value [, ... ] ) ]     
    [ TABLESPACE tablespace_name ]     
    [ WHERE predicate ]     
9、索引自动推荐

《PostgreSQL 商用版本EPAS(阿里云ppas(Oracle 兼容版)) 索引推荐功能使用》

《PostgreSQL SQL自动优化案例 - 极简，自动推荐索引》

10、系统瓶颈或数据库代码瓶颈

《PostgreSQL 源码性能诊断(perf profiling)指南 - 珍藏级》

《PostgreSQL 代码性能诊断之 - OProfile & Systemtap》

11、锁等待排查

如果你发现数据库CPU,IO都不高，但是性能不行，或者连接打满，或者SQL执行HANG死的情况，通常是锁等待造成。

《PostgreSQL 锁等待监控 珍藏级SQL - 谁堵塞了谁》

12、防雪崩方法

设置语句超时，锁等待超级可解，特别是对于DDL语句，一定要设置锁等待超时，否则业务高峰期，如果有高并发的其他QUERY访问DDL的表可能会导致雪崩。

《PostgreSQL 设置单条SQL的执行超时 - 防雪崩》

《如何防止数据库雪崩(泛洪 flood)》

13、GIN索引pending页，直接导致GIN索引查询效率变差

《PostgreSQL pageinspect 诊断与优化GIN (倒排) 索引合并延迟导致的查询性能下降问题》

通常可能是大量并发写入数据，AUTOVACUUM WORKER来不及合并GIN PENDING LIST造成。

14、曾经的慢SQL为什么慢

历史慢SQL，通过auto_explain可以记录慢SQL的整个执行计划，包括执行计划里面每一个步骤花费的时间，消耗的IO时间，IO命中率等。

《PostgreSQL 函数调试、诊断、优化 & auto_explain & plprofiler》

# PostgreSQL , 实时轨迹 , IoT , 车联网 , GIS

背景
车联网，IoT场景中，终端为传感器，采集各个指标的数据（同时包括时间、GIS位置信息，速度，油耗，温度，EDU采集指标），在运动过程中，通过GPS准实时上报到服务端。

服务端则通常根据设备（比如车辆）、时间范围，查询指定设备在某个时间区间的行程。

例如：

1、设备轨迹点表

create table tbl (  
  id int primary key,  -- 主键  
  sid int,  -- 传感器（车辆）ID  
  xxx int,  -- 行程ID  
  geo geometry,  -- 位置  
  att jsonb,  -- 属性  
  crt_time timestamp  -- 时间  
);  
2、查询

select * from tbl where sid=? and crt_time between x and y;  
这种方法的问题（一个点一条记录）：

1、查询性能问题，有IO放大（因为传感器都活跃），一个行程的每个点都落在不同的BLOCK里面，查询有IO放大。

2、空间占用，一个点一条记录，压缩比低。

3、行程运算，行程的所有点没有合并，运算效率差。

行程合并问题
为了解决以上问题，可以新建行程表，并将点的数据合并到行程。

create table tbl_agg (  
  xxx int,  -- 行程ID  
  geo 轨迹类型, -- 轨迹  
  agg jsonb[]  -- 其他属性聚合  
)  
例如，每隔N秒，将点表的数据，按行程ID为主键更新到行程表。

insert into tbl_agg on conflict (geo) do ?   
select xxx,geo_agg(geo),jsonb_agg(jsonb) from tbl where crt_time between ? and ?;  
这种做法有性能问题：

1、锁

如果并发聚合的话，很显然可能多个会话中会出现同样的xxx行程ID字段，所以会有锁冲突。

2、IO放大

如果要解决锁的问题，我们可以用HASH，每个会话算其中的一个HASH value，但是这样就会导致扫描时IO放大，例如8个并行，则有效数据仅八分之一。相当于IO多扫描了7次。

3、CPU只能用一核

为了解决第一个问题，也可以使用串行方法，串行就只能用一核。

4、GAP，由于时间差的问题（例如INSERT到达的数据有错乱，那么可能导致中间出现GAP，聚合的行程缺少一些点）

5、实时性，异步合并到行程表，显然，查询行程表时，可能还有一些POINT没有合并进来，那么就会导致即刻查询行程缺少最近没有合并的点（延迟）。

行程合并优化
为了解决前面提到的5个问题。行程合并的流程可以优化。

1、点表分区，对点表进行分区。按行程ID HASH。

create table tbl (like old_tbl including defaults) partition by list (abs(mod(hashtext(行程字段),16)));   
  
do language plpgsql $$  
declare  
begin  
  for i in 0..15 loop  
    execute 'create table tbl_'||i||' partition of tbl for values in ('||i||')';  
    execute 'create index idx_tbl_'||i||'_1 on tbl_'||i||' (id)';  
    execute 'create index idx_tbl_'||i||'_2 on tbl_'||i||' (crt_time)';  
  end loop;  
end;  
$$;  
2、由于点表分区了，而且行程ID HASH分区，每个分区一个行程合并处理进程（没有锁的问题），总共就可以开多个并行来提高合并行程的处理并行度。提高整体合并行程的性能。

3、行程表，分区。解决行程表垃圾回收的问题。

行程是UPDATE（APPEND POINT到行程类型中）的形式，所以UPDATE会很多，会经常需要对行程表进行VACUUM。

如果行程表不分区，行程表就会很大，目前PG的VACUUM，对于单个表来说，同一时间只能一个核来进行垃圾回收，还没有支持单表并行VACUUM。

所以行程表如果很大，并且需要频繁垃圾回收时，为了避免垃圾回收速度赶不上垃圾产生速度，同样也可以使用分区。

与点表分区类似，最好使用一样的分区键。 




# 根据索引对表进行聚类

 

cluster指示postgresql根据index_name指定的索引对table_name指定的表进行集群。表上必须已经有索引。

当表被cluster时，它将根据索引信息进行物理重新排序。cluster是一次性操作：当表随后被更新时，更新不会被cluster。也就是说，不尝试根据新行或更新行的索引顺序存储新行或更新行。如果愿意，可以通过再次发出命令来定期重新调整。此外，将表的填满因子存储参数设置为小于100%有助于在更新期间保留群集顺序，因为如果有足够的空间，更新的行将保留在同一页上。）

当一个表被cluster 时，PostgreSQL会记住它被cluster 的索引。表单cluster table_name使用与以前相同的索引重新排序表。您还可以使用 cluster 或set without cluster form of alter table来设置将来cluster 操作要使用的索引，或者清除任何以前的设置。

不带任何参数的CLUSTER将重新对调用用户拥有的当前数据库中以前的所有聚集表进行排序，或者对超级用户调用的所有此类表进行排序。这种形式的集群不能在事务块内执行。

当一个表被cluster 时，它会获得一个访问排它锁。这将防止在集群完成之前对表进行任何其他数据库操作（读和写）。

 

执行参数：

table_name: 表名

index_name: 索引名。

berbose: 在每个表都聚集时打印进度报告。

 

在随机访问表中的单行的情况下，表中数据的实际顺序并不重要。但是，如果倾向于比其他人更多地访问一些数据，并且有一个索引将这些数据分组在一起，那么将从使用cluster中获益。如果从一个表中请求一个索引值范围，或者一个索引值有多个匹配的行，那么cluster将有所帮助，因为一旦索引为第一个匹配的行标识了表页，那么所有其他匹配的行可能已经在同一个表页上，因此可以保存磁盘访问并加快查询速度。

cluster 可以使用对指定索引的索引扫描，或者（如果索引是B树）顺序扫描，然后进行排序，对表进行重新排序。它将根据计划成本参数和可用的统计信息，尝试选择更快的方法。

使用索引扫描时，将创建一个临时表副本，其中包含按索引顺序排列的表数据。还将创建表上每个索引的临时副本。因此，您需要磁盘上的可用空间至少等于表大小和索引大小之和。

当使用顺序扫描和排序时，也会创建一个临时排序文件，以便峰值临时空间需求是表大小的两倍，加上索引大小。此方法通常比索引扫描方法快，但如果磁盘空间要求不可容忍，则可以通过暂时将“enable_sort”设置为“off”来禁用此选项。

建议在cluster 之前将 maintenance_work_mem 设置为一个相当大的值（但不超过您可以专门用于集群操作的RAM数量）。

因为计划器记录有关表顺序的统计信息，所以建议对新cluster 的表运行分析。否则，计划者可能会对查询计划做出错误的选择。

因为cluster 记住了哪些索引是cluster 的，所以可以对第一次需要手动cluster 的表进行cluster ，然后设置一个周期性维护脚本，在不使用任何参数的情况下执行集群，以便周期性地重新集群所需的表。

 

===========================================================================================

 

-- 实验环境：CentOS 7 + PG 11.1
-- 说明：实验SQL是根据 digoal 的实验，自己亲手做的。感谢德哥！！！
-- 创建实验表，索引
create table test (id int, val numeric);
create index on test(id);
create index on test(val);
 
-- 插入实验数据
insert into test select generate_series(1,10000000),random();
 
-- 表信息
\d test
                Table "public.test"
 Column |  Type   | Collation | Nullable | Default
--------+---------+-----------+----------+---------
 id     | integer |           |          |
 val    | numeric |           |          |
Indexes:
    "test_id_idx" btree (id)
    "test_val_idx" btree (val)
 
-- 表文件
select pg_relation_filepath('test'::regclass);
 pg_relation_filepath
----------------------
 base/16385/64278
(1 row)
-- 索引文件
select pg_relation_filepath('test_id_idx'::regclass);
 pg_relation_filepath
----------------------
 base/16385/64280
(1 row)
-- 索引文件
select pg_relation_filepath('test_val_idx'::regclass);
 pg_relation_filepath
----------------------
 base/16385/64281
(1 row)
 
 
-- 查看列的离散程度，值越接近0，表示越离散，越接近1，表示存储比较有顺序
-- 说明目前表是根据 id 有序存储的。
select correlation from pg_stats where tablename='test' and attname='id';
 correlation
-------------
           1
 
select correlation from pg_stats where tablename='test' and attname='val';
 correlation
-------------
  0.00781794
(1 row)
 
-- 收缩表，分析表，收集统计信息。
vacuum analyze test;
 
-- 最小的ID的存储位置
select ctid,id,val from test where id=(select min(id) from test);
 ctid  | id |        val
-------+----+-------------------
 (0,1) |  1 | 0.419486843980849
(1 row)
 
-- 最小的 VAL 的存储位置
select ctid,id,val from test where val=(select min(val) from test);
    ctid    |   id   |          val
------------+--------+------------------------
 (4361,127) | 806540 | 0.00000218348577618599
(1 row)
 
 
-- 根据 val 列上的索引。做cluster。
cluster test USING test_val_idx;
 
-- 查看最小 id 的存储
select ctid,id,val from test where id=(select min(id) from test);
   ctid   | id |        val
----------+----+-------------------
 (3192,7) |  1 | 0.589303761254996
(1 row)
 
-- 查看最小 val 的存储
select ctid,id,val from test where val=(select min(val) from test);
 ctid  |   id   |          val
-------+--------+------------------------
 (0,1) | 806540 | 0.00000218348577618599
(1 row)
 
-- 收缩表，分析表，收集统计信息。
vacuum analyze test;
 
-- 查看列的离散程度，值越接近0，表示越离散，越接近1，表示存储比较有顺序
-- 说明目前表是根据 val 有序存储的。
select correlation from pg_stats where tablename='test' and attname='val';
 correlation
-------------
           1
(1 row)
 
select correlation from pg_stats where tablename='test' and attname='id';
 correlation
-------------
  0.00133778
(1 row)
 
-- 查询表，索引文件，都变了。说明cluster重建表和索引。
select pg_relation_filepath('test'::regclass);
 pg_relation_filepath
----------------------
 base/16385/64283
(1 row)
 
select pg_relation_filepath('test_id_idx'::regclass);
 pg_relation_filepath
----------------------
 base/16385/64289
(1 row)
 
select pg_relation_filepath('test_val_idx'::regclass);
 pg_relation_filepath
----------------------
 base/16385/64290
(1 row)
 
-- 表锁
-- session 1
mytest=# begin;
BEGIN
mytest=# cluster test USING test_id_idx ;
CLUSTER
 
-- session 2
mytest=# select * from test limit 1;
等待......
 
-- session 3
select pid,locktype,database,relation,granted,mode,b.relname from pg_locks a,pg_class b where a.relation=b.oid;
  pid  | locktype | database | relation | granted |        mode         |              relname
-------+----------+----------+----------+---------+---------------------+-----------------------------------
 22891 | relation |    16385 |     3455 | t       | AccessShareLock     | pg_class_tblspc_relfilenode_index
 22891 | relation |    16385 |     2663 | t       | AccessShareLock     | pg_class_relname_nsp_index
 22891 | relation |    16385 |     2662 | t       | AccessShareLock     | pg_class_oid_index
 22891 | relation |    16385 |     1259 | t       | AccessShareLock     | pg_class
 22891 | relation |    16385 |    11645 | t       | AccessShareLock     | pg_locks
 21609 | relation |    16385 |     2679 | t       | AccessShareLock     | pg_index_indexrelid_index
 21609 | relation |    16385 |     2678 | t       | AccessShareLock     | pg_index_indrelid_index
 21609 | relation |    16385 |     2610 | t       | AccessShareLock     | pg_index
 21609 | relation |    16385 |     3455 | t       | AccessShareLock     | pg_class_tblspc_relfilenode_index
 21609 | relation |    16385 |     2663 | t       | AccessShareLock     | pg_class_relname_nsp_index
 21609 | relation |    16385 |     2662 | t       | AccessShareLock     | pg_class_oid_index
 21609 | relation |    16385 |     2685 | t       | AccessShareLock     | pg_namespace_oid_index
 21609 | relation |    16385 |     2684 | t       | AccessShareLock     | pg_namespace_nspname_index
 21609 | relation |    16385 |     2615 | t       | AccessShareLock     | pg_namespace
 21609 | relation |    16385 |     1259 | t       | AccessShareLock     | pg_class
 21609 | relation |    16385 |    64276 | t       | AccessShareLock     | test_val_idx
 21609 | relation |    16385 |    64276 | t       | AccessExclusiveLock | test_val_idx
 21609 | relation |    16385 |    64272 | t       | AccessExclusiveLock | pg_toast_64269
 21609 | relation |    16385 |    64275 | t       | AccessShareLock     | test_id_idx
 21609 | relation |    16385 |    64275 | t       | AccessExclusiveLock | test_id_idx
 21609 | relation |    16385 |    64269 | t       | ShareLock           | test
 21609 | relation |    16385 |    64269 | t       | AccessExclusiveLock | test
 22829 | relation |    16385 |    64269 | f       | AccessShareLock     | test
(23 rows)
 
————————————————
版权声明：本文为CSDN博主「Chuck_Chen1222」的原创文章，遵循 CC 4.0 BY-SA 版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/chuckchen1222/article/details/85630528
# PostgreSQL , 资源 , 性能 , 抖动 , 评估 , 稳定性


背景
在数据库压测过程中，经常会遇到抖动的问题。为什么数据库会出现抖动呢？

持续高水位压测（把资源用个精光）会抖，数据库后台进程要做检查点，垃圾回收，刷脏，操作系统也有回收脏页的操作。

由于压测时把所有资源都用光了，当后台需要进行刷脏，做检查点，垃圾回收等动作时，就会出现资源抢占，当然会导致性能的抖动。

如何看待抖动
关于数据库负载，长时间高水位运转带来的抖动问题，实际上就是资源用太多的问题。

为了评估一个比较合理的硬件资源，应该考虑高峰期业务持续时间，预留一定的资源配比。

留给谁用呢？

freeze, 备份，standby，系统进程(后台进程要做检查点，垃圾回收，刷脏，操作系统也有回收脏页)。

短暂的高水位运转可以接受的，如果业务持续高水位运作，就需要考虑加资源或者拆分了。


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* 您需要在mac的电脑上安装好打包用的证书.nginx 服务器.然后把ipa的文件共享出来提供给测试提交服务器下载.

* 安卓打包服务器192.168.199.254 安装有nginx提供apk python3 autoit程序

* ios打包服务器192.168.199.231 安装有nginx提供ipa

* 测试服务器192.168.199.254 提交各个代码到各大云平台去测试 并提供h5接口的自动化测试

* 测试服务器192.168.199.125 安装网易mumu模拟器 提供安卓 和h5的自动化测试

* 数据抓取服务器173 安装python3 autoit 抓取友盟 aso100等数据

* 日志抓取采用elk服务器146 编写各种规则 最后提交到本数据库

* 本数据库对各项服务进行整合。并展现报表

* mqc上测试去编写测试用例

* 本软件提供的功能 安卓 ios自动打包分享测试。自动脚本的执行

* 脚本的计划任务和基本配置 采用蓝鲸平台

* elk服务器执行和展现图标

![数据展示图](img/1.png)

![数据展示图](img/shujufenxi.png)
export PGPASSWORD=112233
pg_dump --host 10.154.24 --port 1921 --username laicunba_web -d laicunba> laicunba_20160123_1217.dmp

从从服务器备份数据
export PGPASSWORD=112233
psql -U postgres -p 5433 laicunba_test < laicunba_20160123_1217.dmp 

从服务器上导入数据

CREATE TABLE films_recent AS SELECT usr.mobile,usr.channel,sum_amount from(SELECT usr.mobile,sum(tt.amount)as sum_amount from(SELECT bid_user_id as user_id,SUM (lcb_financing_target_bid.buy_amount - COALESCE (lcb_financing_target_bid.withdraw_principal,0)) as amount FROM lcb_financing_target_bid WHERE lcb_financing_target_bid.pay AND (lcb_financing_target_bid.pay_mark IN ('DEMAND_2_FIX','FIX_BID_2_DEMAND','自动购买' )OR lcb_financing_target_bid.bank_card_no IS NOT NULL)  AND lcb_financing_target_bid.buy_amount > lcb_financing_target_bid.withdraw_principal GROUP BY bid_user_id UNION ALL select user_id, sum(COALESCE(lcb_withdraw_financing_target_bid_item.withdraw_principal,0)) as amount from lcb_withdraw_financing_target_bid_item LEFT JOIN lcb_withdraw on lcb_withdraw_financing_target_bid_item.withdraw_id=lcb_withdraw.id where lcb_withdraw.TYPE = 'SCB' AND lcb_withdraw.status = 'apply' GROUP BY user_id  UNION ALL SELECT id as user_id, COALESCE (lcb_user.remain_profit, 0)as amount FROM lcb_user UNION ALL select id as user_id,balance as amount from lcb_current_account UNION ALL select user_id,COALESCE(sum(withdraw_principal),0)as amount from lcb_withdraw  where type='CA' and status='apply' GROUP BY user_id) as tt LEFT JOIN lcb_user usr ON usr.id=tt.user_id GROUP BY usr.mobile) as foo LEFT JOIN lcb_user usr ON usr.mobile=foo.mobile ORDER BY usr.channel

数据先生成临时表

#!/bin/bash


#curl -XDELETE 'http://:9200/chaxuncunliangzijin'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
bin=${DIR}/../bin
lib=${DIR}/../lib

echo '{
    "type" : "jdbc",
        "jdbc" : {
                "url" : "jdbc:postgresql://localhost:5/laicunba_test?loglevel=0",
                "user" : "po",
                "password" : "a",
                "sql" : "SELECT * from films_recent",

                "elasticsearch" : {
                         "cluster" : "elasticsearch",
                         "host" : "10.47.66.53",
                         "port" : 9300
                },
                "index" : "chaxuncunliangzijin",
                "type" : "mytype",
                "index_settings" : {
                        "index" : {
                                "number_of_shards" : 1
                        }
                },
                "type_mapping": {
                        "mytype" : {
                                "properties" : {
                                        "polygon" : {
                                                "type" : "geo_shape",
                                                "tree" : "quadtree"
                                        }
                                }
                        }
                }
        }

}
' | java \
    -cp "${lib}/*" \
    -Dlog4j.configurationFile=${bin}/log4j2.xml \
    org.xbib.tools.Runner \
    org.xbib.tools.JDBCImporter

临时表导入到es数据库.最后在kibana上通过鼠标点击的方式生成图表


测试首先需要打包.打包和测试是一个比较繁琐的任务.之前我们持续集成中这些代码都是人工打包的.现在做成代码进行持续集成.持续集成能大大提高程序开发的速度.在bug发现和处理方面解决人力支出的部分.推动公司开发的速度.现在一个程序员薪水就是几万. 本次代码替代了ios程序员和安卓程序员 测试工程师.手工测试的部分.实乃杀价越活的必备良器.
这段代码是windows下的打包程序
用批处理语言写的
set /a TODAY=%date:~0,4%%date:~5,2%%date:~8,2% 
set _TIME=%time:~0,8% 
set CURRENTTIME=%_time::=% 
set CURRENTTIME=%CURRENTTIME: =0% 
set MYDIR=%TODAY%_%CURRENTTIME% 
echo %MYDIR%
d:

cd /laicunba_android_studio
rd /q/s D:\laicunba_android_studio\app\build\outputs\apk

copy /y d:\bijiao1.txt d:\bijiao2.txt
svn cleanup

svn update>d:\bijiao1.txt
sed -i 's/minifyEnabled true/minifyEnabled false/g' D:\laicunba_android_studio\app\build.gradle
#sed -i 's/minifyEnabled false/minifyEnabled true/g' D:\laicunba_android_studio\app\build.gradle
svn log -v -l1 d:\laicunba_android_studio| grep  " 1 " |cut -d "|" -f 1|sed s/[[:space:]]//g>version.txt

for /f "delims=" %%a in (version.txt) do (
set version=%%a
echo !version!
)
set MYDIR=%version%_%TODAY%_%CURRENTTIME%
set MYNAME="%version%_Laicunba_insider_%TODAY%_%CURRENTTIME%.apk"

fc /b d:\bijiao1.txt d:\bijiao2.txt &&echo 相同||gradle clean&&gradle assembleRelease&&mkdir E:\nginx\html\%MYDIR%&&cd D:\laicunba_android_studio\app\build\outputs\apk&&dir /b *_2*.apk > xsxxb.tmp&&for /f "eol=| delims=|" %%i in (xsxxb.tmp) do (set MYNAME=%version%_%%i&&copy "%%i" E:\nginx\html\%MYDIR%\%version%_%%i)



rem gradle :app:assembleLaicunba_insiderRelease&&cd D:\laicunba_android_studio\app\build\outputs\apk&&dir /b laicunba*.apk > xsxxb.tmp&&for /f "eol=| delims=|" %%i in (xsxxb.tmp) do (copy /y "%%i" E:\nginx\html\%version%_%%i&&copy /y "%%i" C:\Users\a\Downloads\r4650_laicunba_insider_20107_2.1.7.apk&&curl -F "file=@C:/Users/a/Downloads/r4650_laicunba_insider_20107_2.1.7.apk" -F "_api_key=c98d013b1a2cdf30410f7bbdbb2f6bfe" -F "uKey=123fe965b6f7a7a90cb2e88e5a2571a6" http://www.pgyer.com/apiv1/app/upload)
rem C:\Users\a\Downloads\r4650_laicunba_insider_20107_2.1.7.apk
rem copy /y D:\laicunba_android_studio\app\build\outputs\apk\app-laicunba_insider-release-unaligned.apk  E:\nginx\html\%MYNAME%
if errorlevel 1 exit
forfiles /p E:\nginx\html\ /m *.apk -d -60 /c "cmd /c del /f @path"

ios的自动化打包代码
cd /Users/mingjiang/Desktop/ComeSave1.22
rm ../ver2
mv ../ver1 ../ver2
svn update > ../ver1
diff ../ver1 ../ver2
if [ $? == 0 ]; then
   exit 0;
fi
xcodebuild -workspace ComeSave.xcworkspace -scheme ComeSave -configuration Release -sdk iphoneos10.0 clean
xcodebuild -workspace ComeSave.xcworkspace -scheme ComeSave -configuration Release -sdk iphoneos10.0 build
xcrun -sdk iphoneos packageapplication -v /Users/mingjiang/
