package com.laicunba.ops.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/console")
public class WebTopIPListController {

	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/webtopiplist.htm")
	public String WebTopIP(Integer ip) {
		JSONObject json = new JSONObject();
		String allline = "";
		String data = "ssh root@10.47.101.10 netstat -an |grep ^tcp.*:80|egrep -v 'LISTEN|127.0.0.1'|awk -F'[ ]+|[:]' '{print $6}'|sort|uniq -c|sort -rn";
		//String data ="dir ";
		System.out.println(data);
		try{
		//Process p = Runtime.getRuntime().exec(new String[]{"/bin/sh","-c",data});
		//Process p = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c",data});
	     Process proc = Runtime.getRuntime().exec(new String[]{"/bin/sh","-c",data});
		 
		  // 采用字符流读取缓冲池内容，腾出空间
		  BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream(), "gbk"));
		  String line = null;
		  while ((line = reader.readLine()) != null){
			  allline=allline+line+"\r\n";
		     System.out.println(line);
		  }
        
		}catch(Exception e){
		System.out.println("Error!");
		}
		
		json.put("code", allline);
		return json.toJSONString();
	}

	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/addblockip.htm")
	public String addblockip(String ip) {
		JSONObject json = new JSONObject();
		String allline = "";
    	String regex = "(2[5][0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})";
        if (ip.matches(regex)==false){
			json.put("code", "no ip");
			return json.toJSONString();       	
        }
    	if (ip.indexOf("/")>-1) {
			json.put("code", "拒绝");
			return json.toJSONString();
		}
		if (ip.indexOf("|")>-1) {
			json.put("code", "拒绝");
			return json.toJSONString();
		}
		if (ip.indexOf(";")>-1) {
			json.put("code", "拒绝");
			return json.toJSONString();
		}
		if (ip.equals("0.0.0.0")==true) {
			json.put("code", "拒绝");
			return json.toJSONString();
		}
		String data ="ssh root@10.47.101.10 ufw deny from "+ip+" to any";
		//iptables -I INPUT -s 114.32.207.47 -j DROP
		System.out.println(data);
		try{
		  Process proc = Runtime.getRuntime().exec(new String[]{"/bin/sh","-c",data});
		  BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream(), "gbk"));
		  String line = null;
		  while ((line = reader.readLine()) != null){
			  allline=allline+line+"\r\n";
		     System.out.println(line);
		  }
		}catch(Exception e){
		System.out.println("Error!");
		}
		json.put("code", "ok");
		return json.toJSONString();
	}
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/delblockip.htm")
	public String delblockip(String ip) {
		JSONObject json = new JSONObject();
		String allline = "";
    	String regex = "(2[5][0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})\\.(25[0-5]|2[0-4]\\d|1\\d{2}|\\d{1,2})";
        if (ip.matches(regex)==false){
			json.put("code", "no ip");
			return json.toJSONString();       	
        }
    	if (ip.indexOf("/")>-1) {
			json.put("code", "拒绝");
			return json.toJSONString();
		}
		if (ip.indexOf("|")>-1) {
			json.put("code", "拒绝");
			return json.toJSONString();
		}
		if (ip.indexOf(";")>-1) {
			json.put("code", "拒绝");
			return json.toJSONString();
		}
		if (ip.equals("0.0.0.0")==true) {
			json.put("code", "拒绝");
			return json.toJSONString();
		}
		//String data ="sudo ufw deny from "+ip+" to any";
		//ssh root@10.47.101.10 ls -l|grep a
		//String data ="ssh root@10.47.101.10 iptables -D INPUT -s "+ip+" -j DROP";
		String data ="ssh root@10.47.101.10 ufw allow from "+ip+" to any";
		//iptables -I INPUT -s 114.32.207.47 -j DROP
		//iptables -D INPUT -s ***.***.***.*** -j DROP
		//解除屏蔽
		System.out.println(data);
		try{
          Process proc = Runtime.getRuntime().exec(new String[]{"/bin/sh","-c",data});
		  BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream(), "gbk"));
		  String line = null;
		  while ((line = reader.readLine()) != null){
			  allline=allline+line+"\r\n";
		     System.out.println(line);
		  }
		}catch(Exception e){
		System.out.println("Error!");
		}
		json.put("code", "ok");
		return json.toJSONString();
	}
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/blockiplist.htm")
	public String blockiplist(String ip) {
		JSONObject json = new JSONObject();
		String allline = "";
		String data ="ssh root@10.47.101.10 'iptables -nvL --line-number |grep DROP'";
		//iptables -I INPUT -s 114.32.207.47 
		System.out.println(data);
		try{
		 Process proc = Runtime.getRuntime().exec(new String[]{"/bin/sh","-c",data});
		 //Process proc =  Runtime.getRuntime().exec(data); // 假设该操作为造成大量内容输出
		  BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream(), "gbk"));
		  String line = "";
		  while ((line = reader.readLine()) != null){
			  allline=allline+line+"\r\n";
		     System.out.println(line);
		  }
		}catch(Exception e){
		System.out.println("Error!");
		}
		json.put("code", allline);
		return json.toJSONString();
	}
}
