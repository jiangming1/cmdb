#!/usr/bin/python
# coding: UTF-8
#作者 蒋明
#作用 自动测试
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
 #dialog = win32gui.FindWindow('#32770', u'文件上传')  # 对话框
 dialog = win32gui.FindWindow('#32770', u'打开')  # 对话框
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
 d.find_element_by_css_selector("#TPL_username_1").send_keys("99806761@qq.com")
 d.find_element_by_css_selector("#TPL_password_1").send_keys("810830.")
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


 
 
def zidonghuaios(apptestfilename):
 url="http://mqc.yunos.com/iosFuncPub.htm?spm=a2c0i.7764369.1999348069.11.sTveJq"
 d.get(url)
 time.sleep(4)
 d.find_element_by_css_selector("#chooseScript > div:nth-child(1) > label:nth-child(2) > span:nth-child(2)").click()
 d.find_element_by_css_selector("#upload-script > div > div.input-group > span > button").click()
 time.sleep(1)
 load(apptestfilename)
 time.sleep(1)
 
 d.find_element_by_css_selector("#chooseApp > div.radio-tab > label:nth-child(2) > span").click()
 time.sleep(1)
 
 d.find_element_by_css_selector("#download-chooseApp > div > div.input-group > input").click()
 time.sleep(1)
 load(appname)
 time.sleep(1)
 d.find_element_by_css_selector("#Step-two-next").click()
 
def zidonghuaios():
 url="https://mqc.aliyun.com/iosFuncPub.htm?spm=0.0.0.0.9rNExc"
 d.get(url)
 time.sleep(4)
 d.find_element_by_css_selector("#upload-chooseApp > div > div.input-group > input").click()
 time.sleep(4)
 load("c:\\test.ipa")
 time.sleep(1)
 d.find_element_by_css_selector("#upload-script > div > div.input-group > input").click()
 time.sleep(4)
 load("c:\\iosscript.zip")

 #d.find_element_by_css_selector("#multi-userList").send_keys("18999999999 123456")
 time.sleep(2)
 d.find_element_by_css_selector("#Step-two-next").click()
 time.sleep(2)
 d.find_element_by_css_selector("#device-tab-box-wrapper > div:nth-child(1) > h3").click()
 time.sleep(30)
 d.find_element_by_css_selector("#Submit-test").click()
 time.sleep(2)




if platform.system()=="Linux":
  d = webdriver.PhantomJS()
else:
  d = webdriver.Chrome()
  d.implicitly_wait(30)

sys.stdout = io.TextIOWrapper(sys.stdout.buffer,encoding='gb18030') #改变标准输出的默认编码
res=urllib.request.urlopen('http://www.baidu.com')
htmlBytes=res.read()
login()
a=d.find_element_by_css_selector("body").text
print (a)

zidonghuaios()
zidonghua("c:\\Users\\a\\Downloads\\laicunba-denglu.zip")
retcode = subprocess.call("F:\360jiagubao_windows_32\360 laicunba.exe E:\nginx\html\r5330_20170623_1133\r5330_laicunba_360sz_20204_2.2.4.apk",shell=True)
#d.quit()
#zidonghua("c:\\Users\\a\\Downloads\\laicunba-denglu.zip")
