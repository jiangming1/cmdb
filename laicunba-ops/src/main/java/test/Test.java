package test;

import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;

public class Test {

	public static void main(String[] args) {

		String pwd = "123456a";
		System.out.println(pwd.toLowerCase().split("[a-z]+")[0]);
		System.out.println(pwd.length() > 6 & (" " + pwd.toLowerCase() + " ").split("[a-z]+").length > 1
				& (" " + pwd.toLowerCase() + " ").split("[0-9]+").length > 1);

		/*
		 * String data = "hello this is test message"; DatagramSocket
		 * datagramSocket = null; byte[] d = new byte[1024]; DatagramPacket dp =
		 * new DatagramPacket(d, d.length); try { // 实例化套接字，并指定发送端口
		 * datagramSocket = new DatagramSocket(); // 指定数据目的地的地址，以及目标端口
		 * InetAddress destination = InetAddress.getByName("127.0.0.1");
		 * DatagramPacket datagramPacket = new DatagramPacket(data.getBytes(),
		 * data.getBytes().length, destination, 10003); // 发送数据
		 * datagramSocket.send(datagramPacket); datagramSocket.receive(dp); byte
		 * rs[] = new byte[dp.getLength()]; System.arraycopy(dp.getData(), 0,
		 * rs, 0, dp.getLength()); System.out.println(new String(rs)); } catch
		 * (Exception e) { e.printStackTrace(); } finally {
		 * datagramSocket.close(); }
		 */

	}

}
