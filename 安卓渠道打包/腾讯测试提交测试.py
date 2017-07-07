#!/usr/bin/python
# coding: UTF-8
#作者 蒋明
#作用 定点登陆修改密码
#日期 2016-06-20
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import paramiko,re,time,platform,sys, getopt
url = "test.laicunba.com"
if platform.system()=="Linux":
  d = webdriver.PhantomJS()
else:
  d = webdriver.Firefox()
d.implicitly_wait(20)
url="https://cas.utest.qq.com/qqlogin?service=http%3A%2F%2Futest.qq.com%2Fuser%2Flogin&from=utest"
d.set_window_size(1024, 768)
d.get(url)
d.find_element_by_id("switcher_plogin").click()
time.sleep(10)
d.get("http://auto.utest.qq.com/auto/v2/web/taskstart/index.html?uid=806560bf5041410f941cbcce2ecae863")
d.get("http://auto.utest.qq.com/auto/v2/web/taskstart/config?uid=806560bf5041410f941cbcce2ecae863")
d.find_element_by_id("btnGetVerfityCode").click()
