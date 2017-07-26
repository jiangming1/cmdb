package com.laicunba.ops.constant;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class GloabConstant {
	static {
		// 加载log4j配置文件
		PropertyConfigurator.configure(System.getProperty("user.home") + File.separator + "laicunba-ops.properties");

	}
	private static final Logger LOG = Logger.getLogger(GloabConstant.class);
	private static Properties config = new Properties();
	static {
		String configFile = System.getProperty("user.home") + File.separator + "laicunba-ops.properties";
		if (LOG.isInfoEnabled()) {
			LOG.info("加载全局配置文件   " + configFile);
		}
		try {
			config.load(new FileInputStream(configFile));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static final String WEB_PATH = config.getProperty("web.path", "").trim();
	public static final String PIC_PATH = config.getProperty("pic.path", "").trim();
	public static final String PIC_ROOT = config.getProperty("pic.root", "").trim();
	public static final String PIC_TMP = config.getProperty("pic.tmp", "").trim();

	public static final String STATIC_PATH = config.getProperty("static.path", "").trim();
	public static final boolean DEBUG = "true".equalsIgnoreCase(config.getProperty("debug", "").trim());
	/**
	 * ROOT的用户名,ID都一样
	 */
	public static final String ROOT_USER_ID_AND_NAME = "root";
	public static final String REDIS_HOST = config.getProperty("redis.host", "").trim();
	public static final String REDIS_PORT = config.getProperty("redis.port", "").trim();
	public static final String REDIS_PWD = config.getProperty("redis.pwd", "").trim();


	public static final String REQ_IP = config.getProperty("req.listener.ip", "").trim();
	/**
	 * 富友
	 */
	public static final String FUIOU_MCHNTCD = config.getProperty("fuiou.mchntcd", "").trim();
	public static final String FUIOU_MCHNT_KEY = config.getProperty("fuiou.mchnt_key", "").trim();
	public static final String FUIOU_URL_PREFIX = config.getProperty("fuiou.url.prefix", "").trim();

	public static final String GAODA_DOMAIN = config.getProperty("gaoda.domain", "").trim();
	public static final boolean GAODA_LOGIN_MOCK = "true".equalsIgnoreCase(config.getProperty("gaoda.login.mock", "").trim());
	public static final String DEFAULT_FINANCINGTARGET_DESCRIPTION = "资金需求方为杭州融创金融服务外包有限公司。公司基于金融服务设计完整交易闭环，深挖票据金融服务，以票据资产做抵押。融创金融对银行票据产品的销售回款有比较完善的流程及基于互联网大数据分析的风控措施。项目资金用于银行票据质押放款,专款专用。";
	public static final String DEFAULT_FINANCINGTARGET_PICS_DESCRIPTION = "汇票信息<hr><div>①汇票出票金额:130万元</div><div>②付款银行全称:兴业银行南平支行</div><br></br><table style='width: 100%;'><tr><td>风险等级</td><td align='right' style='color: #eea236'>0级</td></tr></table><hr><div>该项目风险等级为0级,为低风险.本息保障是来存吧为保护平台全体投资人的共同权益而建立的保障机制,该项目的理财资金安全由恒丰银行承诺兑付,项目的收益与风险成正比,请您合理分配理财资金,理性理财.</div>";
}
