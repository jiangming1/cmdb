package com.laicunba.ops.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.laicunba.ops.constant.GloabConstant;

@Controller
@RequestMapping(value = "/console")
public class RequestListenerController extends BaseController {

	private static Thread thread = null;

	private final static Queue<String> tmpBuffer = new LinkedList<String>();

	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/get_request.htm")
	public String getRequest() {

		if (thread == null) {
			thread = new Thread(new Runnable() {

				@Override
				public void run() {
					Socket socket = null;
					try {
						socket = new Socket(GloabConstant.REQ_IP, 10005);
						BufferedReader reader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
						String line = null;
						while (true) {
							tmpBuffer.add(reader.readLine());
							System.out.println("读完一行");
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							socket.close();
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			});
			thread.start();
		}

		List list = new ArrayList();
		String str = null;
		while (true) {
			str = tmpBuffer.poll();
			if (str == null) {
				break;
			}
			list.add(str);
		}
		return toJsonArray(list);
	}
}
