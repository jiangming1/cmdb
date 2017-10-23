#!/usr/bin/python
# coding: UTF-8
#作者 蒋明
#作用 python 提交android发版工具
#pip install pywinauto
#P6 - Time Series Forecasting
#http://www.youtubecomtomp3.com/zh/YouTube-to-MP4.php
#日期 2016-12-16





from datetime import *  
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
#import win32gui
import io
from selenium.webdriver.support.ui import Select
import getpass, poplib
#import win32con
import time,platform,sys, getopt,paramiko,random,re
#import socks  
#import socket 
#import requests
import os
import re,time,platform,sys, getopt
import codecs

import subprocess

def md5str(str): #md5加密字符串
		m=hashlib.md5(str.encode(encoding = "utf-8"))
		return m.hexdigest()
		
def md5(byte): #md5加密byte
		return hashlib.md5(byte).hexdigest()
		
class DamatuApi():
	
	ID = '40838'
	KEY = 'ca9507e17e8d5ddf7c57cd18d8d33010'
	HOST = 'http://api.dama2.com:7766/app/'
	
	
	def __init__(self,username,password):
		self.username=username
		self.password=password
		
	def getSign(self,param=b''):
		return (md5(bytes(self.KEY, encoding = "utf8") + bytes(self.username, encoding = "utf8") + param))[:8]
		
	def getPwd(self):
		return md5str(self.KEY +md5str(md5str(self.username) + md5str(self.password)))
		
	def post(self,path,params={}):
		data = urllib.parse.urlencode(params).encode('utf-8')
		url = self.HOST + path
		response = urllib.request.Request(url,data)
		return urllib.request.urlopen(response).read()
	
	#查询余额 return 是正数为余额 如果为负数 则为错误码
	def getBalance(self):
		data={'appID':self.ID,
			'user':self.username,
			'pwd':dmt.getPwd(),
			'sign':dmt.getSign()
		}
		res = self.post('d2Balance',data)
		res = str(res, encoding = "utf-8")
		jres = json.loads(res)
		if jres['ret'] == 0:
			return jres['balance']
		else:
			return jres['ret']
    
	#上传验证码 参数filePath 验证码图片路径 如d:/1.jpg type是类型，查看http://wiki.dama2.com/index.php?n=ApiDoc.Pricedesc  return 是答案为成功 如果为负数 则为错误码
	def decode(self,filePath,type):
		f=open(filePath,'rb')
		fdata=f.read()
		filedata=base64.b64encode(fdata)
		f.close()
		data={'appID':self.ID,
			'user':self.username,
			'pwd':dmt.getPwd(),
			'type':type,
			'fileDataBase64':filedata,
			'sign':dmt.getSign(fdata)
		}		
		res = self.post('d2File',data)
		res = str(res, encoding = "utf-8")
		jres = json.loads(res)
		if jres['ret'] == 0:
			#注意这个json里面有ret，id，result，cookie，根据自己的需要获取
			return(jres['result'])
		else:
			return jres['ret']
		
	#url地址打码 参数 url地址  type是类型(类型查看http://wiki.dama2.com/index.php?n=ApiDoc.Pricedesc) return 是答案为成功 如果为负数 则为错误码
	def decodeUrl(self,url,type):
		data={'appID':self.ID,
			'user':self.username,
			'pwd':dmt.getPwd(),
			'type':type,
			'url':urllib.parse.quote(url),
			'sign':dmt.getSign(url.encode(encoding = "utf-8"))
		}
		res = self.post('d2Url',data)
		res = str(res, encoding = "utf-8")
		jres = json.loads(res)
		if jres['ret'] == 0:
			#注意这个json里面有ret，id，result，cookie，根据自己的需要获取
			return(jres['result'])
		else:
			return jres['ret']
	
	#报错 参数id(string类型)由上传打码函数的结果获得 return 0为成功 其他见错误码
	def reportError(self,id):
		#f=open('0349.bmp','rb')
		#fdata=f.read()
		#print(md5(fdata))
		data={'appID':self.ID,
			'user':self.username,
			'pwd':dmt.getPwd(),
			'id':id,
			'sign':dmt.getSign(id.encode(encoding = "utf-8"))
		}	
		res = self.post('d2ReportError',data)
		res = str(res, encoding = "utf-8")
		jres = json.loads(res)
		return jres['ret']

    

		






import sys  
  
reload(sys)  
sys.setdefaultencoding('utf8')  


#back=socket.socket
#socks.set_default_proxy(socks.SOCKS5, "127.0.0.1",1080)
#print(requests.get('http://ifconfig.me/ip').text)



url=""
run=""
argv=sys.argv[1:]
try:
  opts, args = getopt.getopt(argv,"i:s:")
except getopt.GetoptError:
  print ('test.py -i <name> -s <canshu>')
  sys.exit(2)
for opt, arg in opts:
  if opt in ("-i","--invite"):
    url = arg
    print (url)
  if opt in ("-s","--invite"):
    run = arg
#update("360sz_20202")
def fy(danci):
  d.get("http://cn.bing.com/search?q="+danci)
  try:
    name=d.find_element_by_css_selector("#sp_requery > a > strong").text.strip()
  except:
    name=danci
  return name
  
def fileopen(danci):
  f=codecs.open(danci,"r","utf-8")
  lines=""
  while True: 
    line=f.readline() 
    if len(line)==0: # Zero length indicates EOF 
      break
    lines=lines+line
  f.close() 
  return lines
def filewrite(danci,lines):
  fo=codecs.open(danci,"w","utf-8")
  fo.writelines(lines)
  fo.close() 
  return lines
def findstr(str,biaodashi):
  matchObj = re.search( biaodashi,str, re.M|re.I)
  return (matchObj.group(1))
def zhaodaodanci(danci):
  lines=fileopen("/Users/jim/cmdb/app/controllers/"+danci+"s_controller.rb")
  danci=findstr(lines,r'\.permit\((.+?)\)')
  danci=danci.replace(":","")
  return danci.split(", ");
def fanyi(danci,filename):
  lines=fileopen("/Users/jim/cmdb/app/views/"+danci+"s/"+filename)
  #lines=fileopen("/Users/jim/cmdb/app//views//sousuos//index.html.erb")
  caidanzhongwen=fy(danci)
  lines=re.sub(r'(?i)<h1>'+danci+"s","<h1>"+caidanzhongwen, lines)
  lines=re.sub(r'(?i)New '+danci,"新建"+caidanzhongwen, lines)
  lines=re.sub(r'(?i)Create '+danci,"新建"+caidanzhongwen, lines)
  lines=re.sub(r'(?i)Editing '+danci,"编辑"+caidanzhongwen, lines)

  strarray=(zhaodaodanci(danci))
  for key in sorted(dictionary.keys()):
    lines=re.sub(r'(?i)<th>'+key,"<th>"+dictionary[key], lines)
    lines=re.sub(r'(?i)<strong>'+key,"<strong>"+dictionary[key], lines)
    lines=re.sub(r'(?i)<%= f.label :'+key+" %>",""+dictionary[key], lines)
    lines=re.sub(r'(?i)f.input :'+key,"f.input :"+key+" ,label:'"+dictionary[key]+"'%>",lines)
#lines=lines.replace(key,dictionary[key])
  lines=filewrite("/Users/jim/cmdb/app/views/"+danci+"s/"+filename,lines)
  return lines;
def fanyis(danci):
  print (fanyi(danci,"show.html.erb"))
  print (fanyi(danci,"index.html.erb"))
  print (fanyi(danci,"_form.html.erb"))
  print (fanyi(danci,"new.html.erb"))
  print (fanyi(danci,"show.html.erb"))
  print (fanyi(danci,"edit.html.erb"))
print("rails g scaffold "+url+" "+run)
retcode = subprocess.call("rails g scaffold "+url+" "+run,shell=True)
retcode = subprocess.call("rake db:migrate ",shell=True)

d = webdriver.Chrome()
d.implicitly_wait(3)
strarray=(zhaodaodanci(url))
dictionary = {}
for iterating_var in strarray:
  dictionary[str(iterating_var)] = str(fy(iterating_var))  # 添加字典
fanyis(url)
d.quit()
