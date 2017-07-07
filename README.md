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