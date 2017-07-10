# README

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