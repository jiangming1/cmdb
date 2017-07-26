package com.laicunba.ops.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.MalformedURLException;
import java.net.Proxy;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jms.*;
import org.apache.activemq.ActiveMQConnectionFactory;
import java.util.Date;

@Controller
@RequestMapping(value = "/console")
public class WebTimeListController {
	
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/releasejmx.htm")
	public String releasejmx(String t) throws JMSException {
      JSONObject json = new JSONObject();
	  String allline = "";
	  final long TIMEOUT = 1000;

      // ConnectionFactory ：连接工厂，JMS 用它创建连接  
      ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("failover:(tcp://120.27.145.189:10002,tcp://120.27.137.214:10002)");  
      // JMS 客户端到JMS Provider 的连接  
      Connection connection = connectionFactory.createConnection("lcbext001","X2PpFli8fCfAnq91p1nyESvMJ6N3f1");  
      connection.start();  
      // Session： 一个发送或接收消息的线程  
      // 创建一个Topic  
      Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE); 
      Destination destinationTopic = session.createTopic("lcb.core.>");
      Destination destinationTopicCreate = session.createTopic("lcb.core.usr.create");
      Destination destinationTopicLogin = session.createTopic("lcb.core.usr.login");
      Destination destinationTopicPaySucess = session.createTopic("lcb.core.usr.pay.success");
      //用户银行卡付款成功,活转定成功

      Destination destinationTopicPayout = session.createTopic("lcb.core.d.payout.post.success");
      //定期回款提交成功
      Destination destinationTopicFirendBuy = session.createTopic("lcb.core.firend.buy");
      //好友购买
      Destination destinationTopicHProfitCount = session.createTopic("lcb.core.h.current.profit.count");
      //完成复利活期利息计算
      
      Destination destinationTopicHPayout = session.createTopic("lcb.core.h.payout.post.success");
      //活期回款提交成功
      Destination destinationTopicD2HSuccess = session.createTopic("lcb.core.job.d2h.success");
      //完成定转活
      Destination destinationTopicH2DFail = session.createTopic("lcb.core.usr.h2d.fail");
      //活转定
      MessageConsumer consumer= session.createConsumer(destinationTopic);

      MessageConsumer consumerPaySucess = session.createConsumer(destinationTopicPaySucess);
      MessageConsumer consumerCreate = session.createConsumer(destinationTopicCreate);
      MessageConsumer consumerLogin = session.createConsumer(destinationTopicLogin);
      MessageConsumer consumerPayout = session.createConsumer(destinationTopicPayout);
      MessageConsumer consumerFirendBuy = session.createConsumer(destinationTopicFirendBuy);
      MessageConsumer consumerHProfitCount = session.createConsumer(destinationTopicHProfitCount);
      MessageConsumer consumerHPayout = session.createConsumer(destinationTopicHPayout);
      MessageConsumer consumerD2HSuccess = session.createConsumer(destinationTopicD2HSuccess);
      MessageConsumer consumerH2DFail = session.createConsumer(destinationTopicH2DFail);


      int i = 0;
      while (true) {
          Message message = consumer.receive(TIMEOUT);
          message = consumerPaySucess.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on Sucess: " + text);
                  allline=allline+text+"用户银行卡付款成功<p>";;
              }
          }
          
          
          
          
          message = consumerLogin.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on consumerLogin: " + text);
                  allline=allline+text+"用户登录成功<p>";
              }
          } 
          
          
          message = consumerCreate.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on consumerCreate: " + text);
                  allline=allline+text+"用户创建成功<p>";
              }
          } 
          
          message = consumerPayout.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on consumerPayout: " + text);
                  allline=allline+text+"用户付款成功<p>";
              }
          }
          message = consumerFirendBuy.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on consumerFirendBuy: " + text);
                  allline=allline+text+"用户朋友购买成功<p>";
              }
          }
          message = consumerHProfitCount.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on HProfitCount: " + text);
                  allline=allline+text+"活期收益计算成功<p>";
              }
          }
          message = consumerHPayout.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on HPayout: " + text);
                  allline=allline+text+"活期回款成功<p>";
              }
          }
          message = consumerD2HSuccess.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on D2HSuccess: " + text);
                  allline=allline+text+"活期转定期成功<p>";;
              }
          }
          message = consumerH2DFail.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on H2DFail: " + text);
                  allline=allline+text+"活转定失败<p>";;
              }
          } else {
              break;
          }

        
      }


      session.close();  
      connection.close();  
		json.put("code", allline);
		return json.toJSONString();
	  }
	
	
	
	
	
	
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/testjmx.htm")
	public String testjmx(String t) throws JMSException {
      JSONObject json = new JSONObject();
	  String allline = "";
	  final long TIMEOUT = 1000;

      // ConnectionFactory ：连接工厂，JMS 用它创建连接  
      ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://120.27.145.175:61616");  
      // JMS 客户端到JMS Provider 的连接  
      Connection connection = connectionFactory.createConnection("lcbweb","MBdOTC3ylde4XAPjKz22");  
      connection.start();  
      // Session： 一个发送或接收消息的线程  
      // 创建一个Topic  
      Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE); 
      Destination destinationTopic = session.createTopic("lcb.core.>");
      Destination destinationTopicCreate = session.createTopic("lcb.core.usr.create");
      Destination destinationTopicLogin = session.createTopic("lcb.core.usr.login");
      Destination destinationTopicPaySucess = session.createTopic("lcb.core.usr.pay.success");
      //用户银行卡付款成功,活转定成功

      Destination destinationTopicPayout = session.createTopic("lcb.core.d.payout.post.success");
      //定期回款提交成功
      Destination destinationTopicFirendBuy = session.createTopic("lcb.core.firend.buy");
      //好友购买
      Destination destinationTopicHProfitCount = session.createTopic("lcb.core.h.current.profit.count");
      //完成复利活期利息计算
      
      Destination destinationTopicHPayout = session.createTopic("lcb.core.h.payout.post.success");
      //活期回款提交成功
      Destination destinationTopicD2HSuccess = session.createTopic("lcb.core.job.d2h.success");
      //完成定转活
      Destination destinationTopicH2DFail = session.createTopic("lcb.core.usr.h2d.fail");
      //活转定
      MessageConsumer consumer= session.createConsumer(destinationTopic);

      MessageConsumer consumerPaySucess = session.createConsumer(destinationTopicPaySucess);
      MessageConsumer consumerCreate = session.createConsumer(destinationTopicCreate);
      MessageConsumer consumerLogin = session.createConsumer(destinationTopicLogin);
      MessageConsumer consumerPayout = session.createConsumer(destinationTopicPayout);
      MessageConsumer consumerFirendBuy = session.createConsumer(destinationTopicFirendBuy);
      MessageConsumer consumerHProfitCount = session.createConsumer(destinationTopicHProfitCount);
      MessageConsumer consumerHPayout = session.createConsumer(destinationTopicHPayout);
      MessageConsumer consumerD2HSuccess = session.createConsumer(destinationTopicD2HSuccess);
      MessageConsumer consumerH2DFail = session.createConsumer(destinationTopicH2DFail);


      int i = 0;
      while (true) {
          Message message = consumer.receive(TIMEOUT);
          message = consumerPaySucess.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on Sucess: " + text);
                  allline=allline+text+"用户银行卡付款成功<p>";;
              }
          }
          
          
          
          
          message = consumerLogin.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on consumerLogin: " + text);
                  allline=allline+text+"用户登录成功<p>";
              }
          } 
          
          
          message = consumerCreate.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on consumerCreate: " + text);
                  allline=allline+text+"用户创建成功<p>";
              }
          } 
          
          message = consumerPayout.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on consumerPayout: " + text);
                  allline=allline+text+"用户付款成功<p>";
              }
          }
          message = consumerFirendBuy.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on consumerFirendBuy: " + text);
                  allline=allline+text+"用户朋友购买成功<p>";
              }
          }
          message = consumerHProfitCount.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on HProfitCount: " + text);
                  allline=allline+text+"活期收益计算成功<p>";
              }
          }
          message = consumerHPayout.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on HPayout: " + text);
                  allline=allline+text+"活期回款成功<p>";
              }
          }
          message = consumerD2HSuccess.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on D2HSuccess: " + text);
                  allline=allline+text+"活期转定期成功<p>";;
              }
          }
          message = consumerH2DFail.receive(TIMEOUT);

          if (message != null) {
              if (message instanceof TextMessage) {
                  String text = ((TextMessage) message).getText();
                  System.out.println("Got " + i++ + ". message on H2DFail: " + text);
                  allline=allline+text+"活转定失败<p>";;
              }
          } else {
              break;
          }

        
      }


      session.close();  
      connection.close();  
		json.put("code", allline);
		return json.toJSONString();
	  }
	
	
	
	
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/changebackdate.htm")

	
	public String changeBackDate(String t) {
		JSONObject json = new JSONObject();
		String allline = "";
		String data = "ssh root@localhost 'ntpdate 10.143.33.50;/opt/jetty-9.2.14_standalone/bin/jetty.sh restart;kill -9 $$;'";
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
	@RequestMapping(value = "/changedate.htm")
	public String changeDate(String t) {
		JSONObject json = new JSONObject();
		String allline = "";
		String data = "ssh root@localhost 'date -s \""+t+"\";/opt/jetty-9.2.14_standalone/bin/jetty.sh restart;kill -9 $$;'";
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
	@RequestMapping(value = "/deleteTestData.htm")
	public String deleteTestData(String t) {
		JSONObject json = new JSONObject();
		String allline = "";
		String data = "ssh root@localhost 'curl -XDELETE \'http://10.47.66.53:9200/packetbeattest*\''";
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
	@RequestMapping(value = "/btnCreate.htm")
	public String btnCreate(String t) {
		JSONObject json = new JSONObject();
		String allline = "";
		String data = "ssh a@119.29.242.173 'cmd /c c:/auto.bat'";
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
	@RequestMapping(value = "/testselfcheck.htm")
	public String testSelfCheck(String t) {
		JSONObject json = new JSONObject();
		String allline = "";
		String data = "ssh root@114.55.36.146 'bash checktesttest.sh'";
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
	@RequestMapping(value = "/dev2test.htm")
	public String dev2test(String t) {
		JSONObject json = new JSONObject();
		//重启
		String data = "ssh root@localhost '/opt/jetty-9.2.14_web.ext.beta/bin/jetty.sh stop;rsync -vzrtopg --progress --delete -e ssh /var/lib/jenkins/workspace/laicunba-web.ext/target/laicunba-web.ext /opt/web.ext_tmp;rsync -vzrtopg --progress --delete -e ssh /var/lib/jenkins/workspace/laicunba-web.ext/target/laicunba-web.ext /opt/jetty-9.2.14_web.ext.beta/webapps/;/opt/jetty-9.2.14_web.ext.beta/bin/jetty.sh start;/opt/jetty-9.2.14_web/bin/jetty.sh stop;rsync -vzrtopg --progress --delete -e ssh /var/lib/jenkins/workspace/laicunba-web/target/laicunba-web /opt/web_tmp;rsync -vzrtopg --progress --delete -e ssh /var/lib/jenkins/workspace/laicunba-web/target/laicunba-web /opt/jetty-9.2.14_web/webapps/;/opt/jetty-9.2.14_web/bin/jetty.sh start'";
		System.out.println(data);
		try{
			
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
	
	
	
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/webtimelist.htm")
	public String WebTimeList(Integer ip) {
		JSONObject json = new JSONObject();
		String data="";
		data=data+"研发1:"+getResponseText("http://8.laicunba.com/time.htm","120.27.145.175")+"<p>";
		data=data+"测试1:"+getResponseText("http://8.laicunba.com/time.htm","114.55.36.146")+"<p>";
		data=data+"预发1:"+getResponseText("http://8.laicunba.com/time.htm","139.224.70.178")+"<p>";
		data=data+"正式1:"+getResponseText("http://8.laicunba.com/time.htm","120.27.145.189")+"<p>";
		data=data+"dock1:"+getResponseText("http://8.laicunba.com/time.htm","114.55.108.4")+"<p>";
		json.put("code",data);
		System.out.println(data);
		return json.toJSONString();
	}
	
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/webversionlist.htm")
	public String WebVersionList(Integer ip) {
		JSONObject json = new JSONObject();
		String data="";
		data=data+"研发1:"+getVersionText("http://8.laicunba.com/version.html","120.27.145.175")+"<p>";
		data=data+"测试1:"+getVersionText("http://8.laicunba.com/version.html","114.55.36.146")+"<p>";
		data=data+"预发1:"+getVersionText("http://8.laicunba.com/version.html","139.224.70.178")+"<p>";
		data=data+"正式1:"+getVersionText("http://8.laicunba.com/jiangmingh5version.html","120.27.145.189")+"<p>";
		data=data+"正式2:"+getVersionText("http://8.laicunba.com/jiangmingh5version.html","114.55.108.4")+"<p>";
		json.put("code",data);
		//System.out.println(data);
		return json.toJSONString();
	}
	
	@ResponseBody
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/webextversionlist.htm")
	public String WebExtVersionList(Integer ip) {
		JSONObject json = new JSONObject();
		String data="";
		data=data+"研发1:"+getVersionText("http://8.laicunba.com/h5/ext/version.html","120.27.145.175")+"<p>";
		data=data+"测试1:"+getVersionText("http://8.laicunba.com/h5/ext/version.html","114.55.36.146")+"<p>";
		data=data+"预发1:"+getVersionText("http://8.laicunba.com/h5/ext/version.html","139.224.70.178")+"<p>";
		data=data+"正式1:"+getVersionText("http://8.laicunba.com/h5/ext/jiangmingextversion.html","120.27.145.189")+"<p>";
		data=data+"dock1:"+getVersionText("http://8.laicunba.com/h5/ext/jiangmingextversion.html","114.55.108.4")+"<p>";
		json.put("code",data);
		//System.out.println(data);
		return json.toJSONString();
	}
    /** 
     * 根据绑定去查询绑定地址的url html,HttpUrlConnection调用方式 
     *  
     * @param url 
     *            查询的url 
     * @param host 
     *            需要绑定的host 
     * @param ip 
     *            对应host绑定的ip 
     * @throws IOException 
     */  
    public static String getResponseText(String queryUrl,String ip) {  
        InputStream is = null;  
        BufferedReader br = null;  
        StringBuffer res = new StringBuffer();  
        try {  
            HttpURLConnection httpUrlConn = null;  
            URL url = new URL(queryUrl);  
            if(ip!=null){  
                String str[] = ip.split("\\.");  
                byte[] b =new byte[str.length];  
                for(int i=0,len=str.length;i<len;i++){  
                    b[i] = (byte)(Integer.parseInt(str[i],10));  
                }  
                Proxy proxy = new Proxy(Proxy.Type.HTTP,  
                new InetSocketAddress(InetAddress.getByAddress(b), 80));  
                httpUrlConn = (HttpURLConnection) url  
                .openConnection(proxy);  
            }else{  
                httpUrlConn = (HttpURLConnection) url  
                        .openConnection();  
            }  
            httpUrlConn.setRequestMethod("GET");  
            httpUrlConn.setDoOutput(true);  
            httpUrlConn.setConnectTimeout(4000);  
            httpUrlConn.setReadTimeout(4000);  
            httpUrlConn.setDefaultUseCaches(false);  
            httpUrlConn.setUseCaches(false);  
  
            is = httpUrlConn.getInputStream();  
  
            int responseCode = httpUrlConn.getResponseCode();  
            // 如果返回的结果是400以上，那么就说明出问题了  
            if (responseCode > 400) {  
                System.out.println("getResponseText for queryurl:" + queryUrl + " got responseCode :" + responseCode);  
                return "getResponseText for queryurl:" + queryUrl + " got responseCode :" + responseCode;  
            }  
            // 需要自动识别页面的编码，通过从context-type中解析得到，默认为UTF-8  
            String encoding = "UTF-8";  
           // String contextType = httpUrlConn.getContentType();  
           // if (contextType=="") {  
            //    int pos = contextType.lastIndexOf("=");  
             //   if (pos > -1) {  
              //      encoding = contextType.substring(pos + 1);  
               // }  
           // }  
            // System.out.println(encoding);  
  
            br = new BufferedReader(new InputStreamReader(is, encoding));  
  
            String data = null;  
            while ((data = br.readLine()) != null) {  
                res.append(data + "\n");  
            }  
            //return res.toString();
    		System.out.println(res.toString());
    		Long time=Long.parseLong(res.toString().trim()) ;
            //String date = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date());
            String date = new java.text.SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(new java.util.Date( time));
            return date;
  
        } catch (IOException e) {  
            return "failed: " + e.getMessage();  
        } catch (Exception e) {  
            return "failed: " + e.getMessage();  
        } finally {  
            if (br != null) {  
                try {  
                    br.close();  
                } catch (IOException e) {  
                    res.append(e.getMessage());  
                }  
            }  
        }  
    }  
    /** 
     * 根据绑定去查询绑定地址的url html,HttpUrlConnection调用版本号
     *  
     * @param url 
     *            查询的url 
     * @param host 
     *            需要绑定的host 
     * @param ip 
     *            对应host绑定的ip 
     * @throws IOException 
     */  
    public static String getVersionText(String queryUrl,String ip) {  
        InputStream is = null;  
        BufferedReader br = null;  
        StringBuffer res = new StringBuffer();  
        try {  
            HttpURLConnection httpUrlConn = null;  
            URL url = new URL(queryUrl);  
            if(ip!=null){  
                String str[] = ip.split("\\.");  
                byte[] b =new byte[str.length];  
                for(int i=0,len=str.length;i<len;i++){  
                    b[i] = (byte)(Integer.parseInt(str[i],10));  
                }  
                Proxy proxy = new Proxy(Proxy.Type.HTTP,  
                new InetSocketAddress(InetAddress.getByAddress(b), 80));  
                httpUrlConn = (HttpURLConnection) url  
                .openConnection(proxy);  
            }else{  
                httpUrlConn = (HttpURLConnection) url  
                        .openConnection();  
            }  
            httpUrlConn.setRequestMethod("GET");  
            httpUrlConn.setDoOutput(true);  
            httpUrlConn.setConnectTimeout(4000);  
            httpUrlConn.setReadTimeout(4000);  
            httpUrlConn.setDefaultUseCaches(false);  
            httpUrlConn.setUseCaches(false);  
  
            is = httpUrlConn.getInputStream();  
  
            int responseCode = httpUrlConn.getResponseCode();  
            // 如果返回的结果是400以上，那么就说明出问题了  
            if (responseCode > 400) {  
                System.out.println("getResponseText for queryurl:" + queryUrl + " got responseCode :" + responseCode);  
                return "getResponseText for queryurl:" + queryUrl + " got responseCode :" + responseCode;  
            }  
            // 需要自动识别页面的编码，通过从context-type中解析得到，默认为UTF-8  
            String encoding = "UTF-8";  
           // String contextType = httpUrlConn.getContentType();  
           // if (contextType=="") {  
            //    int pos = contextType.lastIndexOf("=");  
             //   if (pos > -1) {  
              //      encoding = contextType.substring(pos + 1);  
               // }  
           // }  
            // System.out.println(encoding);  
  
            br = new BufferedReader(new InputStreamReader(is, encoding));  
  
            String data = "";  
            data = br.readLine().trim();
           // while ((data = br.readLine()) != null) {  
           //     res.append(data + "\n");  
           // }  
            //return res.toString();
    		//System.out.println(data);
            
            return data.replaceAll("<pre>|\n", "");
  
        } catch (IOException e) {  
            return "failed: " + e.getMessage();  
        } catch (Exception e) {  
            return "failed: " + e.getMessage();  
        } finally {  
            if (br != null) {  
                try {  
                    br.close();  
                } catch (IOException e) {  
                    res.append(e.getMessage());  
                }  
            }  
        }  
    } 
	String getToDoList (String url1)
	{ 
	  String allLine="";
	  try
	  {
	    URL                url; 
	    URLConnection      urlConn; 
	    DataInputStream    dis;
	    url = new URL(url1);
	    urlConn = url.openConnection(); 
	    urlConn.setDoInput(true); 
	    urlConn.setUseCaches(false);
	    dis = new DataInputStream(urlConn.getInputStream()); 
	    String s;

	    while ((s = dis.readLine()) != null)
	    { 
	      allLine=allLine+s; 
	    };
	    dis.close(); 
	  }
	    catch (MalformedURLException mue) {} 
	    catch (IOException ioe) {} 
	  return allLine;
	}
}
