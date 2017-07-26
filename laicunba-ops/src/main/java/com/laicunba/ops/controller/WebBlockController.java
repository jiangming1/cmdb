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
public class WebBlockController {

	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/webblock.htm")
	public String webblock(Integer count) {
		JSONObject json = new JSONObject();
		if (count < 100) {
			json.put("code", "dayu 100");
			return json.toJSONString();
		}

		String data = "ssh root@10.47.101.10 kill -9 `ps aux|grep webblock.sh|grep -v grep |awk '{print $2}'`;nohup ./webblock.sh "+count+"&";
		System.out.println(data);
		try{
			//先杀原先的进程后启动进程 比如自带100单ip限制
		//runtime.exec(data);
		//Process p = Runtime.getRuntime().exec(data);
	    Process p = Runtime.getRuntime().exec(new String[]{"/bin/sh","-c",data});
		BufferedInputStream in = new BufferedInputStream(p.getInputStream());
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		String str = br.readLine();
		System.out.println(str);
		
		}catch(Exception e){
		System.out.println("Error!");
		}
		
     	json.put("code", "ok");
		return json.toJSONString();
	}
}
