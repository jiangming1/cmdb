#!/usr/bin/python
# coding: UTF-8
#作者 蒋明
#作用 自动测试
#pip install pywinauto
#日期 2016-12-16
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import win32gui
import win32con
import re,time,platform,sys, getopt

import io
import sys
import urllib.request


apptestname=""
appname="c:\\Users\\a\\Downloads\\r4650_laicunba_insider_20107_2.1.7.apk"


def load(filename):
 # win32gui
 dialog = win32gui.FindWindow('#32770', u'文件上传')  # 对话框
 #dialog = win32gui.FindWindow('#32770', u'打开')  # 对话框
 ComboBoxEx32 = win32gui.FindWindowEx(dialog, 0, 'ComboBoxEx32', None) 
 ComboBox = win32gui.FindWindowEx(ComboBoxEx32, 0, 'ComboBox', None)
 Edit = win32gui.FindWindowEx(ComboBox, 0, 'Edit', None)  # 上面三句依次寻找对象，直到找到输入框Edit对象的句柄
 button = win32gui.FindWindowEx(dialog, 0, 'Button', None)  # 确定按钮Button
 win32gui.SendMessage(Edit, win32con.WM_SETTEXT, None, filename)  # 往输入框输入绝对地址
 win32gui.SendMessage(dialog, win32con.WM_COMMAND, 1, button)  # 按button
 time.sleep(10)
def login():
 url="https://login.taobao.com/member/login.jhtml?redirectURL=https%3A%2F%2Flogin.taobao.com%2Fjump%3Ftarget%3Dhttp%253A%252F%252Fmqc.yunos.com%252FtestManager.htm"
 d.set_window_size(1024, 768)
 d.get(url)
 time.sleep(1)
 d.find_element_by_css_selector("#J_Quick2Static").click()
 d.find_element_by_css_selector("#TPL_username_1").send_keys("99761@qq.com")
 d.find_element_by_css_selector("#TPL_password_1").send_keys("81.")
 d.find_element_by_css_selector("#J_SubmitStatic").click()
 time.sleep(5)
def xingneng():
 url="http://mqc.yunos.com/performance.htm?spm=0.0.0.0.Eu5mDe"
 d.get(url)
 d.find_element_by_css_selector("#chooseApp > div:nth-child(2) > button:nth-child(4)").click()
 time.sleep(1)
 load(appname)
 d.find_element_by_css_selector("#Step-two-next").click()
 time.sleep(1)

def jianrong():
 url="http://mqc.yunos.com/compatibility.htm?spm=a2c0i.8742162.1999348069.4.4k2MMH"
 d.get(url)
 d.find_element_by_css_selector("#chooseApp > div:nth-child(2) > input:nth-child(1)").click()
 time.sleep(1)
 load(appname)
 d.find_element_by_css_selector("#Step-two-next").click()
 time.sleep(1)
 d.find_element_by_css_selector("div.device-tab-box:nth-child(1) > h3:nth-child(1)").click()
 time.sleep(15)
 d.find_element_by_id("Submit-test").click()
 time.sleep(5)
 d.find_element_by_id("Submit-test").click()
 time.sleep(5)
def anquan():
 url="http://mqc.yunos.com/security.htm?spm=0.0.0.0.8V43DV"
 d.get(url)
 d.find_element_by_css_selector("#submitInputFile").click()
 time.sleep(1)
 load(appname)
 time.sleep(1)
 d.find_element_by_css_selector("#Step-two-next").click()
 time.sleep(10)
def wending():
 url="http://mqc.yunos.com/stability.htm?spm=0.0.0.0.TSRijd"
 d.get(url)
 d.find_element_by_css_selector("#appFileText").click()
 time.sleep(1)
 load(appname)
 time.sleep(10)
 d.find_element_by_css_selector("#Step-two-next").click()
 time.sleep(1)
 d.find_element_by_css_selector('#EmulatorTable > li:nth-child(1) > dl').click()
 d.find_element_by_css_selector('#EmulatorTable > li:nth-child(2) > dl').click()
 d.find_element_by_css_selector('#EmulatorTable > li:nth-child(3) > dl').click()
 d.find_element_by_css_selector('#EmulatorTable > li:nth-child(4) > dl').click()
 d.find_element_by_css_selector('#EmulatorTable > li:nth-child(5) > dl').click()
 d.find_element_by_css_selector('#EmulatorTable > li:nth-child(6) > dl').click()
 time.sleep(5)
 d.find_element_by_id("Submit-test").click()
 time.sleep(5)
def zidonghua(apptestfilename):
 url="http://mqc.yunos.com/function.htm?spm=0.0.0.0.S2x35H"
 d.get(url)
 time.sleep(4)
 d.find_element_by_css_selector("#chooseScript > div:nth-child(1) > label:nth-child(2) > span:nth-child(2)").click()
 d.find_element_by_css_selector("#chooseScriptUpload > div:nth-child(1) > div:nth-child(1) > span:nth-child(2) > button:nth-child(1)").click()
 time.sleep(1)
 load(apptestfilename)
 time.sleep(1)
 d.find_element_by_css_selector("#upload-chooseApp > div:nth-child(1) > div:nth-child(1) > input:nth-child(1)").click()
 time.sleep(1)
 load(appname)
 time.sleep(1)
 d.find_element_by_css_selector("#Step-two-next").click()
 time.sleep(1)
 d.find_element_by_css_selector("div.device-tab-box:nth-child(1) > h3:nth-child(1)").click()
 time.sleep(15)
 d.find_element_by_css_selector("#Submit-test").click()
 time.sleep(15)
 d.find_element_by_css_selector("#Submit-test").click()
 time.sleep(15)


def ioswending():
 url="http://mqc.yunos.com/iosMonkey.htm?spm=0.0.0.0.lSSQbh"
 d.get(url)
 d.find_element_by_css_selector("#RadioDownloadApk").click()
 d.find_element_by_css_selector("#chooseApp > div:nth-child(2) > input:nth-child(1)").send_keys("http://aontimer.jios.org:8181/test.ipa")
 time.sleep(1)
 d.find_element_by_css_selector("#chooseApp > div:nth-child(2) > button:nth-child(4)").click()
 d.find_element_by_css_selector("#userList").send_keys("18999999999 123456")
 time.sleep(20)
 d.find_element_by_css_selector("#Step-two-next").click()
 time.sleep(2)
#输入用户账号和密码
 d.find_element_by_css_selector("div.device-tab-box:nth-child(1) > h3:nth-child(1)").click()
 time.sleep(1)
 d.find_element_by_css_selector("div.device-tab-box:nth-child(1) > div:nth-child(2) > div:nth-child(1)").click()
 time.sleep(1)
 d.find_element_by_css_selector("#Submit-test").click()
 time.sleep(1)

if platform.system()=="Linux":
  d = webdriver.PhantomJS()
else:
  d = webdriver.Firefox()
  d.implicitly_wait(30)

sys.stdout = io.TextIOWrapper(sys.stdout.buffer,encoding='gb18030') #改变标准输出的默认编码
res=urllib.request.urlopen('http://www.baidu.com')
htmlBytes=res.read()
login()
a=d.find_element_by_css_selector("body").text
print (a)

zidonghua("c:\\Users\\a\\Downloads\\laicunba-denglu.zip")
#d.quit()
#zidonghua("c:\\Users\\a\\Downloads\\laicunba-denglu.zip")
