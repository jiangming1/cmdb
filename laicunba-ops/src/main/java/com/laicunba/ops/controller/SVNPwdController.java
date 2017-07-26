package com.laicunba.ops.controller;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/console")
public class SVNPwdController extends BaseController {

	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/svnpwd.htm")
	public String svnpwd(String username, String oldpwd, String newpwd) {
		JSONObject json = new JSONObject();

		if (!(newpwd.length() > 6 && (" " + newpwd.toLowerCase() + " ").split("[a-z]+").length > 1
				&& (" " + newpwd.toLowerCase() + " ").split("[0-9]+").length > 1)) {

			json.put("code", "newpwd_toosimple");
			return json.toJSONString();
		}

		String data = username + " " + oldpwd + " " + newpwd;
		DatagramSocket datagramSocket = null;

		byte[] returnData = new byte[1024];
		DatagramPacket returnPacket = new DatagramPacket(returnData, returnData.length);
		try {
			// 实例化套接字，并指定发送端口
			datagramSocket = new DatagramSocket();
			// 指定数据目的地的地址，以及目标端口
			InetAddress destination = InetAddress.getByName("10.45.55.72");
			DatagramPacket datagramPacket = new DatagramPacket(data.getBytes(), data.getBytes().length, destination,
					10003);
			// 发送数据
			datagramSocket.send(datagramPacket);

			datagramSocket.receive(returnPacket);
			returnData = new byte[returnPacket.getLength()];
			System.arraycopy(returnPacket.getData(), 0, returnData, 0, returnPacket.getLength());
			String rsTxt = new String(returnData);
			json.put("code", rsTxt);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			datagramSocket.close();
		}

		return json.toJSONString();
	}

}
