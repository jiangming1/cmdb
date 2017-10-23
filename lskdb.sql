-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: rm-bp1gusb41cog0v8hm.mysql.rds.aliyuncs.com    Database: lskdb
-- ------------------------------------------------------
-- Server version	5.6.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_appv`
--

DROP TABLE IF EXISTS `t_appv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_appv` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vnum` varchar(50) DEFAULT NULL,
  `vdesc` varchar(500) DEFAULT NULL,
  `downurl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_appv`
--

LOCK TABLES `t_appv` WRITE;
/*!40000 ALTER TABLE `t_appv` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_appv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bids`
--

DROP TABLE IF EXISTS `t_bids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bids` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bidorder` varchar(20) DEFAULT NULL COMMENT '订单号',
  `user_id` bigint(20) DEFAULT '-1' COMMENT '用户id',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增借款记录时间',
  `amount` double(10,2) DEFAULT '0.00' COMMENT '借款金额',
  `period_unit` int(2) DEFAULT '1' COMMENT '1日；2月；3年',
  `period` int(4) DEFAULT '7' COMMENT '借款期限',
  `mobile` varchar(50) DEFAULT NULL COMMENT '用户账号',
  `relname` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `renewtag` smallint(6) DEFAULT NULL COMMENT '续借标志 0否1是',
  `status` smallint(6) DEFAULT '0' COMMENT '借款标审核状态：\r\n0资料完善中\r\n1资料初步完善\r\n2初审中（资料已完善）\r\n-21资料未通过的修改资料\r\n-22拒贷的可以恢复审核\r\n-23拒贷风险名单不再操作\r\n3终审中\r\n-32拒贷的可以恢复审核\r\n-33拒贷风险名单不再操作\r\n4确认打款中\r\n5待放款\r\n-51放款失败\r\n6还款中\r\n61续期中\r\n-61续期失败\r\n62已续期\r\n63逾期中\r\n64部分坏款\r\n65逾期续期中\r\n-65逾期续期失败\r\n66已逾期续期\r\n7已还款\r\n71逾期已还款\r\n-3坏账\r\n-5订单已撤销\r\n67逾期超限\r\n-67委外催收\r\n',
  `rollovers_num` int(11) DEFAULT NULL COMMENT '续期总次数',
  `rollovers_interest` double(11,2) DEFAULT NULL COMMENT '续期总利息',
  `overdue_num` int(11) DEFAULT NULL COMMENT '逾期总次数',
  `overdue_money` double(11,2) DEFAULT NULL COMMENT '逾期总金额',
  `overdue_days` int(11) DEFAULT NULL COMMENT '逾期总天数',
  `overdue_move` smallint(4) DEFAULT '0' COMMENT '1(0-2),2(3-10),3(11-20),4(21-30),5(31-60),6(60+)',
  `late_overdue_time` datetime DEFAULT NULL COMMENT '最近逾期开始时间',
  `late_overdue_days` int(11) DEFAULT NULL COMMENT '最近逾期天数',
  `late_overdue_money` double(11,2) DEFAULT NULL COMMENT '最近逾期金额',
  `loan_date` datetime DEFAULT NULL COMMENT '放款时间',
  `due_date` datetime DEFAULT NULL COMMENT '到期还款日',
  `repayment_money` double(11,2) DEFAULT NULL COMMENT '应还金额',
  `loan_amount` double(11,2) DEFAULT NULL COMMENT '放款金额',
  `auditor_id` bigint(20) DEFAULT NULL COMMENT '审核人员ID',
  `auditor_name` varchar(50) DEFAULT NULL COMMENT '审核人员姓名',
  `auditor_time` datetime DEFAULT NULL COMMENT '审核时间',
  `repayment_time` datetime DEFAULT NULL COMMENT '还款时间',
  `mark_bad_time` datetime DEFAULT NULL COMMENT '坏账标记时间',
  `rollovers_apply_time` datetime DEFAULT NULL COMMENT '续期申请时间',
  `late_rollovers_time` datetime DEFAULT NULL COMMENT '最近续期开始时间',
  `late_rollovers_days` int(11) DEFAULT NULL COMMENT '最近续期天数',
  `late_rollovers_money` double(11,2) DEFAULT NULL COMMENT '最近续期金额',
  `late_status` smallint(255) DEFAULT NULL COMMENT '最近状态',
  `late_status_time` datetime DEFAULT NULL COMMENT '最近状态时间',
  `real_repayment_money` double(11,2) DEFAULT NULL COMMENT '实际应还金额',
  `real_paid_money` double(11,2) DEFAULT NULL COMMENT '实际已还金额(最后总的实际还款金额，包含逾期费)',
  `real_paid_overdue_cost` double(11,2) DEFAULT NULL COMMENT '实际已还逾期费用',
  `df01` varchar(200) DEFAULT NULL,
  `df02` varchar(200) DEFAULT NULL,
  `df03` varchar(200) DEFAULT NULL COMMENT '预留3',
  `df04` varchar(200) DEFAULT NULL COMMENT '预留4',
  `df05` varchar(200) DEFAULT '0' COMMENT '没扣头息标志 1： 没扣头息 新系统 0:扣头息 老系统 ',
  `mark_job` smallint(4) DEFAULT '0' COMMENT '账单处理情况\r\n0、未处理\r\n1、已处理',
  `mark_keep_job` smallint(4) DEFAULT '0' COMMENT '申请保留跟踪账单\r\n1、申请保留\r\n0、未申请',
  `add_risk_time` datetime DEFAULT NULL COMMENT '加入风险名单时间',
  `auditor_sucess_time` datetime DEFAULT NULL COMMENT '终审审核时间',
  `auditor_sucess_id` bigint(20) DEFAULT NULL COMMENT '终审审核员id',
  `auditor_sucess_name` varchar(50) DEFAULT NULL COMMENT '终审审核员姓名',
  `reserved_amount` double(11,2) DEFAULT NULL COMMENT '保留金额',
  `curstattime` datetime DEFAULT NULL COMMENT '当前状态时间',
  PRIMARY KEY (`id`),
  KEY `index_status` (`status`) USING BTREE,
  KEY `i_user_id` (`user_id`) USING BTREE,
  KEY `i_curstime` (`curstattime`) USING BTREE,
  KEY `i_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bids`
--

LOCK TABLES `t_bids` WRITE;
/*!40000 ALTER TABLE `t_bids` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_bids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_bills`
--

DROP TABLE IF EXISTS `t_bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_bills` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '返款id',
  `bid_id` bigint(20) DEFAULT '0' COMMENT '标的id',
  `periods` smallint(6) DEFAULT NULL COMMENT '账单期数',
  `repayment_time` datetime DEFAULT NULL COMMENT '还款日',
  `repayment_corpus` double(20,2) DEFAULT '0.00' COMMENT '应还本金',
  `repayment_interest` double(20,2) DEFAULT NULL COMMENT '应还利息',
  `status` smallint(4) DEFAULT '0' COMMENT '还款状态:\r\n-1未还款-2 本金垫付还款-3 逾期还款0 正常还款',
  `real_repayment_time` datetime DEFAULT NULL COMMENT '实际还款时间',
  `real_repayment_corpus` double(20,2) DEFAULT '0.00' COMMENT '实际还款本金',
  `real_repayment_interest` double(20,2) DEFAULT NULL COMMENT '实际还款利息',
  `overdue_mark` smallint(4) DEFAULT '0' COMMENT '逾期标记：-1 系统标记逾期-2 标记逾期-3 标记坏账0 未标记逾期',
  `mark_overdue_time` datetime DEFAULT NULL COMMENT '逾期标记时间',
  `overdue_fine` double(20,2) DEFAULT '0.00' COMMENT '逾期罚款',
  `mark_bad_time` datetime DEFAULT NULL COMMENT '坏账标记时间',
  `notice_count_message` int(11) DEFAULT '0' COMMENT '发送站内信次数',
  `notice_count_mail` int(11) DEFAULT '0' COMMENT '发送邮件次数',
  `notice_count_telphone` int(11) DEFAULT '0' COMMENT '电话通知次数',
  PRIMARY KEY (`id`),
  KEY `index_bill_id` (`id`) USING BTREE,
  KEY `index_bill_bid_id` (`bid_id`) USING BTREE,
  KEY `index_bill_bid_id_periods` (`bid_id`,`periods`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款融资账单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_bills`
--

LOCK TABLES `t_bills` WRITE;
/*!40000 ALTER TABLE `t_bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dict_address`
--

DROP TABLE IF EXISTS `t_dict_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dict_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '  是指省市区县行政区划  id',
  `code` varchar(200) DEFAULT NULL COMMENT '是指省市区县行政区划         代码',
  `name` varchar(200) DEFAULT NULL COMMENT ' 是指省市区县行政区划        名称',
  `foreign_key` bigint(20) DEFAULT NULL COMMENT '外键',
  `grade` varchar(200) DEFAULT NULL COMMENT '等级',
  `sort` varchar(200) DEFAULT NULL COMMENT '是指     排序',
  `spell` varchar(200) DEFAULT NULL COMMENT '是指省市区县行政区划    拼音',
  `simple_spell` varchar(200) DEFAULT NULL COMMENT ' 是指省市区县行政区划    简拼',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dict_address`
--

LOCK TABLES `t_dict_address` WRITE;
/*!40000 ALTER TABLE `t_dict_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dict_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dict_audit_items`
--

DROP TABLE IF EXISTS `t_dict_audit_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dict_audit_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `name` varchar(100) DEFAULT NULL COMMENT '审核材料名称',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `type` smallint(6) DEFAULT '1' COMMENT '审核材料类型：\r\n1 图片文件\r\n2 文本文件\r\n3 视频文件\r\n4 音频文件\r\n5 表格文件',
  `period` int(11) DEFAULT '1' COMMENT '有效期（月份）',
  `description` varchar(200) DEFAULT NULL COMMENT '资料提交要求描述',
  `credit_score` decimal(20,2) DEFAULT '0.00' COMMENT '此项的信用积分分值',
  `audit_cycle` int(11) DEFAULT '0' COMMENT '审核周期(天)',
  `audit_fee` decimal(20,2) DEFAULT '0.00' COMMENT '审核费用',
  `is_use` smallint(6) DEFAULT '1' COMMENT '0.不启用；1.启用',
  `pass_rate` decimal(6,2) DEFAULT '0.00' COMMENT '通过率',
  `mark` varchar(100) DEFAULT NULL COMMENT '唯一标示',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_un_name` (`name`) USING BTREE,
  KEY `index_audit_item_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='资料审核信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dict_audit_items`
--

LOCK TABLES `t_dict_audit_items` WRITE;
/*!40000 ALTER TABLE `t_dict_audit_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dict_audit_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dict_banks_col`
--

DROP TABLE IF EXISTS `t_dict_banks_col`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dict_banks_col` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_code` int(7) DEFAULT NULL COMMENT '开户行代码',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户行名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dict_banks_col`
--

LOCK TABLES `t_dict_banks_col` WRITE;
/*!40000 ALTER TABLE `t_dict_banks_col` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dict_banks_col` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dict_banks_data`
--

DROP TABLE IF EXISTS `t_dict_banks_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dict_banks_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank_number` bigint(20) DEFAULT '0' COMMENT '银行的联行号',
  `bank_code` int(5) DEFAULT '0' COMMENT '支行号前3位数字，代表该支行所属的母行分类',
  `bank_name_parent` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行支行名称',
  `county_code` int(4) DEFAULT '0' COMMENT '县城code',
  `county_name` varchar(100) DEFAULT NULL COMMENT '县城名称',
  `city_code` int(4) DEFAULT '0' COMMENT '市 code',
  `city_name` varchar(50) DEFAULT NULL COMMENT '市 name',
  `province_code` int(4) DEFAULT '0' COMMENT '省份 code',
  `province_name` varchar(50) DEFAULT NULL COMMENT '省份 name',
  PRIMARY KEY (`id`),
  KEY `index_bank_number` (`bank_number`) USING BTREE,
  KEY `index_city_code` (`city_code`) USING BTREE,
  KEY `index_bank_code` (`bank_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dict_banks_data`
--

LOCK TABLES `t_dict_banks_data` WRITE;
/*!40000 ALTER TABLE `t_dict_banks_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dict_banks_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dict_basic_data`
--

DROP TABLE IF EXISTS `t_dict_basic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dict_basic_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '系统id值',
  `type_code` varchar(200) DEFAULT NULL COMMENT '类型代码',
  `type_name` varchar(200) DEFAULT NULL COMMENT '类型名称',
  `code_value1` varchar(200) DEFAULT NULL COMMENT '代码值1',
  `code_value2` varchar(200) DEFAULT NULL COMMENT '代码值2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dict_basic_data`
--

LOCK TABLES `t_dict_basic_data` WRITE;
/*!40000 ALTER TABLE `t_dict_basic_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_dict_basic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_extension`
--

DROP TABLE IF EXISTS `t_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_extension` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) DEFAULT NULL COMMENT '推广专属地址',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status` int(2) DEFAULT '0' COMMENT '0为停用，1为启用',
  `companyname` varchar(100) DEFAULT NULL COMMENT '推广方名称',
  `amount_register` double(20,2) DEFAULT '0.00' COMMENT '单个注册奖励金',
  `reward_type` int(2) DEFAULT '0' COMMENT '放款奖励方式 1、放款金额百分比 2、单个计价 3、单价+百分比',
  `amount_lender` double(20,2) DEFAULT '0.00' COMMENT '单个放款奖励金金额',
  `percentage_lender` double(8,3) DEFAULT '0.000' COMMENT '单个放款奖励金百分比',
  `amount_addinfo` double(20,2) DEFAULT '0.00' COMMENT '单个资料完善奖励金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_extension`
--

LOCK TABLES `t_extension` WRITE;
/*!40000 ALTER TABLE `t_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_extension_statements`
--

DROP TABLE IF EXISTS `t_extension_statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_extension_statements` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) DEFAULT NULL COMMENT '推广方id',
  `starttime` timestamp NULL DEFAULT NULL COMMENT '结算开始时间',
  `endtime` timestamp NULL DEFAULT NULL COMMENT '结算结束时间',
  `amount_register` double(20,2) DEFAULT NULL,
  `reward_type` int(2) DEFAULT NULL,
  `amount_lender` double(20,2) DEFAULT NULL COMMENT '0.00',
  `percentage_lender` double(8,3) DEFAULT '0.000',
  `amount_addinfo` double(20,2) DEFAULT '0.00',
  `amount` double(20,2) DEFAULT '0.00',
  `number_register` int(20) DEFAULT '0' COMMENT '注册量',
  `number_addinfo` int(20) DEFAULT '0' COMMENT '完善资料数',
  `number_renew` int(20) DEFAULT '0' COMMENT '续借笔数',
  `number_lender` int(20) DEFAULT '0' COMMENT '放款笔数',
  `amount_renewbid` double(20,2) DEFAULT '0.00' COMMENT '续借金额',
  `amount_lenderbid` double(20,2) DEFAULT '0.00' COMMENT '放款总金额',
  `cost` double(20,3) DEFAULT '0.000' COMMENT '单个成本',
  `type` int(20) DEFAULT '0' COMMENT '是否已结算 0 未结算，1已结算',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_extension_statements`
--

LOCK TABLES `t_extension_statements` WRITE;
/*!40000 ALTER TABLE `t_extension_statements` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_extension_statements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_financial_cycle`
--

DROP TABLE IF EXISTS `t_financial_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_financial_cycle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统id值',
  `fctime` datetime DEFAULT NULL COMMENT '统计日期',
  `statistics_type` smallint(6) DEFAULT NULL COMMENT '统计类型',
  `year` int(11) DEFAULT NULL COMMENT '年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `day` int(11) DEFAULT NULL COMMENT '日',
  `week` int(11) DEFAULT NULL COMMENT '周',
  `quarter` int(11) DEFAULT NULL COMMENT '季度',
  `bids_num` int(11) DEFAULT NULL COMMENT '借条总笔数',
  `bids_amount` double(11,2) DEFAULT NULL COMMENT '借条总金额',
  `loan_num` int(11) DEFAULT NULL COMMENT '放款总笔数',
  `loan_amount` double(11,2) DEFAULT NULL COMMENT '放款总金额',
  `renew_num` int(11) DEFAULT NULL COMMENT '续借借条笔数',
  `renew_amount` double(11,2) DEFAULT NULL COMMENT '续借借条金额',
  `rollover_num` int(11) DEFAULT NULL COMMENT '续期借条笔数',
  `rollover_amount` double(11,2) DEFAULT NULL COMMENT '续期借条金额',
  `rollover_interest` double(11,2) DEFAULT NULL COMMENT '续期借条利息',
  `overdue_num` int(11) DEFAULT NULL COMMENT '逾期借条笔数',
  `overdue_amount` double(11,2) DEFAULT NULL COMMENT '逾期借条金额',
  `overdue_receivable_money` double(11,2) DEFAULT NULL COMMENT '逾期应收费用',
  `overdue_received_money` double(11,2) DEFAULT NULL COMMENT '逾期已收费用',
  `overdue_rollover_num` int(11) DEFAULT NULL COMMENT '逾期续期笔数',
  `overdue_rollover_money` double(11,2) DEFAULT NULL COMMENT '逾期续期费用',
  `repayment_num` int(11) DEFAULT NULL COMMENT '已还款笔数',
  `repayment_money` double(11,2) DEFAULT NULL COMMENT '已还款金额',
  `rollover_repayment_num` int(11) DEFAULT NULL COMMENT '续期还款笔数',
  `rollover_repayment_money` double(11,2) DEFAULT NULL COMMENT '续期还款金额',
  `overdue_repayment_num` int(11) DEFAULT NULL COMMENT '逾期还款笔数',
  `overdue_repayment_amount` double(11,2) DEFAULT NULL COMMENT '逾期还款金额',
  `overdue_repayment_money` double(11,2) DEFAULT NULL COMMENT '逾期还款费用',
  `overdue_repayment_interest` double(11,2) DEFAULT NULL COMMENT '逾期还款利息',
  `overdue_rollover_repayment_num` int(11) DEFAULT NULL COMMENT '逾期续期还款笔数',
  `overdue_rollover_repayment_amount` double(11,2) DEFAULT NULL COMMENT '逾期续期还款金额',
  `overdue_rollover_repayment_money` double(11,2) DEFAULT NULL COMMENT '逾期续期还款费用',
  `overdue_rollover_repayment_interest` double(11,2) DEFAULT NULL COMMENT '逾期续期还款利息',
  `renew_repayment_num` int(11) DEFAULT NULL COMMENT '续借还款笔数',
  `renew_repayment_amount` double(11,2) DEFAULT NULL COMMENT '续借还款金额',
  `amount_sum` double(11,2) DEFAULT NULL COMMENT '总金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_financial_cycle`
--

LOCK TABLES `t_financial_cycle` WRITE;
/*!40000 ALTER TABLE `t_financial_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_financial_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_financial_summary`
--

DROP TABLE IF EXISTS `t_financial_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_financial_summary` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统id值',
  `fstime` datetime DEFAULT NULL COMMENT '统计日期',
  `statistics_type` smallint(6) DEFAULT NULL COMMENT '统计类型',
  `year` int(11) DEFAULT NULL COMMENT '年',
  `month` int(11) DEFAULT NULL COMMENT '月',
  `day` int(11) DEFAULT NULL COMMENT '日',
  `week` int(11) DEFAULT NULL COMMENT '周',
  `quarter` int(11) DEFAULT NULL COMMENT '季度',
  `bids_num` int(11) DEFAULT NULL COMMENT '借条总笔数',
  `bids_amount` double(11,2) DEFAULT NULL COMMENT '借条总金额',
  `loan_num` int(11) DEFAULT NULL COMMENT '放款总笔数',
  `loan_amount` double(11,2) DEFAULT NULL COMMENT '放款总金额',
  `renew_num` int(11) DEFAULT NULL COMMENT '续借借条笔数',
  `renew_amount` double(11,2) DEFAULT NULL COMMENT '续借借条金额',
  `rollover_num` int(11) DEFAULT NULL COMMENT '续期借条笔数',
  `rollover_amount` double(11,2) DEFAULT NULL COMMENT '续期借条金额',
  `rollover_interest` double(11,2) DEFAULT NULL COMMENT '续期借条利息',
  `overdue_num` int(11) DEFAULT NULL COMMENT '逾期借条笔数',
  `overdue_amount` double(11,2) DEFAULT NULL COMMENT '逾期借条金额',
  `overdue_receivable_money` double(11,2) DEFAULT NULL COMMENT '逾期应收费用',
  `overdue_received_money` double(11,2) DEFAULT NULL COMMENT '逾期已收费用',
  `overdue_rollover_num` int(11) DEFAULT NULL COMMENT '逾期续期笔数',
  `overdue_rollover_money` double(11,2) DEFAULT '0.00' COMMENT '逾期续期费用',
  `repayment_num` int(11) DEFAULT NULL COMMENT '已还款笔数',
  `repayment_money` double(11,2) DEFAULT NULL COMMENT '已还款金额',
  `rollover_repayment_num` int(11) DEFAULT NULL COMMENT '续期还款笔数',
  `rollover_repayment_money` double(11,2) DEFAULT NULL COMMENT '续期还款金额',
  `overdue_repayment_num` int(11) DEFAULT NULL COMMENT '逾期还款笔数',
  `overdue_repayment_amount` double(11,2) DEFAULT NULL COMMENT '逾期还款金额',
  `overdue_repayment_money` double(11,2) DEFAULT NULL COMMENT '逾期还款费用',
  `overdue_repayment_interest` double(11,2) DEFAULT NULL COMMENT '逾期还款利息',
  `overdue_rollover_repayment_num` int(11) DEFAULT NULL COMMENT '逾期续期还款笔数',
  `overdue_rollover_repayment_amount` double(11,2) DEFAULT NULL COMMENT '逾期续期还款金额',
  `overdue_rollover_repayment_money` double(11,2) DEFAULT NULL COMMENT '逾期续期还款费用',
  `overdue_rollover_repayment_interest` double(11,2) DEFAULT NULL COMMENT '逾期续期还款利息',
  `renew_repayment_num` int(11) DEFAULT NULL COMMENT '续借还款笔数',
  `renew_repayment_amount` double(11,2) DEFAULT NULL COMMENT '续借还款金额',
  `amount_sum` double(11,2) DEFAULT NULL COMMENT '总金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_financial_summary`
--

LOCK TABLES `t_financial_summary` WRITE;
/*!40000 ALTER TABLE `t_financial_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_financial_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_lm_yxtoken`
--

DROP TABLE IF EXISTS `t_lm_yxtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_lm_yxtoken` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mobile` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_lm_yxtoken`
--

LOCK TABLES `t_lm_yxtoken` WRITE;
/*!40000 ALTER TABLE `t_lm_yxtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_lm_yxtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_menu`
--

DROP TABLE IF EXISTS `t_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父类菜单id',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_menu`
--

LOCK TABLES `t_menu` WRITE;
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_right`
--

DROP TABLE IF EXISTS `t_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_right` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '所属菜单id',
  `name` varchar(100) DEFAULT NULL COMMENT '权限名称',
  `url` varchar(200) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_right`
--

LOCK TABLES `t_right` WRITE;
/*!40000 ALTER TABLE `t_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_risk_control_parameters`
--

DROP TABLE IF EXISTS `t_risk_control_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_risk_control_parameters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `first_value` varchar(100) DEFAULT NULL COMMENT '值1',
  `second_value` varchar(100) DEFAULT NULL COMMENT '值2',
  `description` varchar(800) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_risk_control_parameters`
--

LOCK TABLES `t_risk_control_parameters` WRITE;
/*!40000 ALTER TABLE `t_risk_control_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_risk_control_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_risk_list`
--

DROP TABLE IF EXISTS `t_risk_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_risk_list` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `risk_level` smallint(6) DEFAULT NULL COMMENT '风险等级  分3级',
  `supervisor_id` bigint(20) DEFAULT NULL COMMENT '加入人id',
  `supervisor` varchar(50) DEFAULT NULL COMMENT '加入人账号',
  `time` datetime DEFAULT NULL COMMENT '加入时间',
  `description` varchar(800) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_risk_list`
--

LOCK TABLES `t_risk_list` WRITE;
/*!40000 ALTER TABLE `t_risk_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_risk_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_risk_phone`
--

DROP TABLE IF EXISTS `t_risk_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_risk_phone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `mobile` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `concern_extent` smallint(6) DEFAULT NULL COMMENT '关注程度',
  `supervisor_id` bigint(20) DEFAULT NULL COMMENT '加入人id',
  `supervisor` varchar(50) DEFAULT NULL COMMENT '加入人账号',
  `time` datetime DEFAULT NULL COMMENT '加入时间',
  `description` varchar(800) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_risk_phone`
--

LOCK TABLES `t_risk_phone` WRITE;
/*!40000 ALTER TABLE `t_risk_phone` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_risk_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_role`
--

DROP TABLE IF EXISTS `t_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '角色代码',
  `name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `right_id` varchar(400) DEFAULT NULL COMMENT '所属权限',
  `right_name` varchar(1000) DEFAULT NULL COMMENT '对应权限名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_role`
--

LOCK TABLES `t_role` WRITE;
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_statistics_day`
--

DROP TABLE IF EXISTS `t_statistics_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_statistics_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime DEFAULT NULL COMMENT '数据生成时间',
  `year` int(8) DEFAULT '0' COMMENT '年',
  `month` int(8) DEFAULT '0' COMMENT '月',
  `day` int(8) DEFAULT '0' COMMENT '日',
  `week` int(8) DEFAULT '0' COMMENT '周',
  `quarter` int(8) DEFAULT '0' COMMENT '季度',
  `auditor_id` bigint(20) DEFAULT '0' COMMENT '审核人id',
  `auditor_name` varchar(255) DEFAULT '' COMMENT '审核人姓名',
  `type` smallint(4) DEFAULT '1' COMMENT '统计的业务类型:1用户；2借款标；3催收；4财务；5风险名单',
  `assign_num` int(8) DEFAULT '0' COMMENT '分配数量',
  `rollover_num` int(8) DEFAULT '0' COMMENT '续期单数',
  `rollover_amount` double(8,2) DEFAULT '0.00' COMMENT '续期金额',
  `repay_amount` double(8,2) DEFAULT '0.00' COMMENT '还款金额',
  `repay_num` int(8) DEFAULT '0' COMMENT '还款数量',
  `add_risk_num` int(8) DEFAULT '0' COMMENT '加入风险名单数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_statistics_day`
--

LOCK TABLES `t_statistics_day` WRITE;
/*!40000 ALTER TABLE `t_statistics_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_statistics_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_supervisor_audit_events`
--

DROP TABLE IF EXISTS `t_supervisor_audit_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_supervisor_audit_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `supervisor_id` bigint(20) DEFAULT '-1',
  `bid_id` bigint(20) DEFAULT '-1' COMMENT '标id',
  `bid_status` int(4) DEFAULT '-1' COMMENT '标状态',
  `suggest` varchar(200) DEFAULT NULL COMMENT '建议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_supervisor_audit_events`
--

LOCK TABLES `t_supervisor_audit_events` WRITE;
/*!40000 ALTER TABLE `t_supervisor_audit_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_supervisor_audit_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_supervisors`
--

DROP TABLE IF EXISTS `t_supervisors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_supervisors` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `reality_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(50) DEFAULT NULL COMMENT '录登密码',
  `password_continuous_errors` int(11) DEFAULT '0' COMMENT '密码连续错误次数',
  `is_password_error_locked` smallint(6) DEFAULT '1' COMMENT '密码连续错误被锁定',
  `password_error_locked_time` datetime DEFAULT NULL COMMENT '密码连续错误被锁定时间',
  `is_allow_login` smallint(6) DEFAULT '1' COMMENT '是否允许登录',
  `login_count` bigint(20) DEFAULT '0' COMMENT '登录次数',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_login_ip` varchar(50) DEFAULT NULL COMMENT '上次登录ip',
  `last_logout_time` datetime DEFAULT NULL COMMENT '上次退出时间',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `sex` smallint(6) DEFAULT '3' COMMENT '1 男 2 女 3 未知',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `level` smallint(6) DEFAULT '0' COMMENT '0普通管理员，1超级管理员',
  `is_erased` smallint(6) DEFAULT '0' COMMENT '0 = 正常状态; 1 = 已擦除状态;',
  `creater_id` bigint(20) DEFAULT '0',
  `creater_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `role_id` bigint(20) DEFAULT NULL COMMENT '所属角色id',
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_index` (`name`) USING BTREE,
  KEY `creater_id` (`creater_id`) USING BTREE,
  KEY `index_super_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='管理员账户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_supervisors`
--

LOCK TABLES `t_supervisors` WRITE;
/*!40000 ALTER TABLE `t_supervisors` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_supervisors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_audit_items`
--

DROP TABLE IF EXISTS `t_user_audit_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_audit_items` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户ID',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `audit_item_id` int(11) DEFAULT '0' COMMENT '审核项目ID\r\n1、手持照\r\n2、身份证正面',
  `image_file_name` varchar(200) DEFAULT 'null' COMMENT '图片文件名称',
  PRIMARY KEY (`id`),
  KEY `index_uai_id` (`id`) USING BTREE,
  KEY `index_uai_usr_id` (`user_id`) USING BTREE,
  KEY `index_audit_item_id` (`audit_item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户上传的审核资料信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_audit_items`
--

LOCK TABLES `t_user_audit_items` WRITE;
/*!40000 ALTER TABLE `t_user_audit_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_audit_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_bank_accounts`
--

DROP TABLE IF EXISTS `t_user_bank_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_bank_accounts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bank_name` varchar(100) DEFAULT NULL COMMENT '银行名称',
  `bank_code` int(11) DEFAULT '0' COMMENT '开户行code',
  `account` varchar(50) DEFAULT NULL COMMENT '账号或卡号',
  `account_name` varchar(50) DEFAULT NULL COMMENT '户名',
  `verified` smallint(6) DEFAULT '0' COMMENT '是否已校验',
  `verify_time` datetime DEFAULT NULL COMMENT '校验时间',
  `verify_supervisor_id` bigint(20) DEFAULT NULL COMMENT '审核员',
  `branch_bank_name` varchar(100) DEFAULT '' COMMENT '支行名称',
  `province` varchar(50) DEFAULT '' COMMENT '支行所在省',
  `province_code` int(11) DEFAULT '0' COMMENT '省code',
  `city` varchar(50) DEFAULT '' COMMENT '支行所在市',
  `city_code` int(11) DEFAULT '0' COMMENT '市code',
  `mobile` varchar(50) DEFAULT NULL COMMENT '预留手机号',
  `id_number` varchar(50) DEFAULT NULL COMMENT '账号预留身份证号码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_index` (`account`) USING BTREE,
  UNIQUE KEY `index_uba_usr_id` (`user_id`) USING BTREE,
  KEY `index_uba_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户银行账户信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_bank_accounts`
--

LOCK TABLES `t_user_bank_accounts` WRITE;
/*!40000 ALTER TABLE `t_user_bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_bank_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_event_types`
--

DROP TABLE IF EXISTS `t_user_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_event_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `name` varchar(50) DEFAULT NULL COMMENT '事件名称',
  `code` varchar(50) DEFAULT NULL COMMENT '代码',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  `is_use` smallint(6) DEFAULT '1' COMMENT '是否使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `des_index` (`description`) USING BTREE,
  KEY `is_use` (`is_use`) USING BTREE,
  KEY `index_uet_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户事件类型';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_event_types`
--

LOCK TABLES `t_user_event_types` WRITE;
/*!40000 ALTER TABLE `t_user_event_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_events`
--

DROP TABLE IF EXISTS `t_user_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `ip` varchar(50) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '事件类型id',
  `descrption` text,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `index_ue_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户事件信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_events`
--

LOCK TABLES `t_user_events` WRITE;
/*!40000 ALTER TABLE `t_user_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_info`
--

DROP TABLE IF EXISTS `t_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '创建时间',
  `pay_password` varchar(50) DEFAULT NULL COMMENT '支付密码',
  `is_email_verified` smallint(6) DEFAULT '0' COMMENT '箱邮是否已经验证通过',
  `sex` smallint(6) DEFAULT '3' COMMENT '1 男 2 女 3 未知',
  `birthday` datetime DEFAULT NULL,
  `city_id` varchar(50) DEFAULT NULL COMMENT '城市Id',
  `qq` varchar(50) DEFAULT '' COMMENT 'QQ',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `education_id` varchar(50) DEFAULT '' COMMENT '教育情况ID',
  `marital_id` varchar(50) DEFAULT '' COMMENT '婚姻状况ID',
  `children_id` varchar(50) DEFAULT '' COMMENT '孩子个数 0无子女 1、一个子女 2、两个子女 3、三个及以上子女',
  `address` varchar(200) DEFAULT '' COMMENT '现居地',
  `addresstime_id` varchar(50) DEFAULT '' COMMENT '居住时长',
  `job` varchar(50) DEFAULT '' COMMENT '职业',
  `income` varchar(50) DEFAULT '' COMMENT '收入 1、不固定 2、小于 1000 3、小于2000 4、小于4000 5、小于6000  7、小于10000 8、大于10000',
  `company` varchar(100) DEFAULT '' COMMENT '公司',
  `company_city` varchar(50) DEFAULT '' COMMENT '公司城市编号',
  `company_address` varchar(100) DEFAULT '' COMMENT '公司详细地址',
  `company_tel` varchar(50) DEFAULT '' COMMENT '公司电话',
  `is_add_base_info` smallint(6) DEFAULT '0' COMMENT '是否编辑了基本信息 0 否 1 是',
  `score` int(11) DEFAULT '0' COMMENT '积分',
  `credit_line` decimal(20,2) DEFAULT '0.00' COMMENT '信用额度',
  `last_credit_line` decimal(20,2) DEFAULT '0.00' COMMENT '注册时的信用额度',
  `is_active` smallint(6) DEFAULT '0' COMMENT '是否是有效会员 0 否 1 是',
  `sign1` varchar(200) DEFAULT NULL COMMENT '用户表资金改动标记',
  `family` varchar(50) DEFAULT '' COMMENT '家属  1、父母 2、配偶 3、兄弟姐妹',
  `family_name` varchar(50) DEFAULT '' COMMENT '家庭联系人姓名',
  `family_tel` varchar(50) DEFAULT '',
  `relation` varchar(50) DEFAULT '' COMMENT '关系 1、同学 2、同事 3、朋友',
  `relation_name` varchar(50) DEFAULT '' COMMENT '社会联系人姓名',
  `relation_tel` varchar(50) DEFAULT '' COMMENT '关系人联系方式',
  `imagefname1` varchar(200) DEFAULT '' COMMENT '身份证正面照片',
  `Imagefname2` varchar(200) DEFAULT '' COMMENT '持证拍照照片',
  `df01` varchar(200) DEFAULT NULL,
  `df02` varchar(200) DEFAULT NULL COMMENT '预留2',
  `df03` varchar(200) DEFAULT NULL COMMENT '预留3',
  `df04` varchar(200) DEFAULT NULL COMMENT '预留4',
  `df05` varchar(200) DEFAULT NULL COMMENT '预留5',
  PRIMARY KEY (`id`),
  KEY `index_usr_id` (`id`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `index_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_info`
--

LOCK TABLES `t_user_info` WRITE;
/*!40000 ALTER TABLE `t_user_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_limu_tokens`
--

DROP TABLE IF EXISTS `t_user_limu_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_limu_tokens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `ctime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mobile` varchar(40) DEFAULT NULL,
  `credit` varchar(40) DEFAULT NULL,
  `jd` varchar(40) DEFAULT NULL,
  `taobao` varchar(40) DEFAULT NULL,
  `housefund` varchar(40) DEFAULT NULL COMMENT '公积金',
  `socialsecurity` varchar(40) DEFAULT NULL COMMENT '社保',
  `education` varchar(40) DEFAULT NULL,
  `maimai` varchar(40) DEFAULT NULL,
  `linkedin` varchar(40) DEFAULT NULL,
  `bill` varchar(40) DEFAULT NULL,
  `ebank` varchar(40) DEFAULT NULL,
  `shixin` varchar(40) DEFAULT NULL,
  `autoinsurance` varchar(40) DEFAULT NULL,
  `ctrip` varchar(40) DEFAULT NULL,
  `diditaxi` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_limu_tokens`
--

LOCK TABLES `t_user_limu_tokens` WRITE;
/*!40000 ALTER TABLE `t_user_limu_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_limu_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_lm_new`
--

DROP TABLE IF EXISTS `t_user_lm_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_lm_new` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tid` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ctime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mobile` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i_user_id` (`user_id`) USING BTREE,
  KEY `i_tmu` (`user_id`,`mobile`,`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_lm_new`
--

LOCK TABLES `t_user_lm_new` WRITE;
/*!40000 ALTER TABLE `t_user_lm_new` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_lm_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_notepad`
--

DROP TABLE IF EXISTS `t_user_notepad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_notepad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '0' COMMENT '用户id',
  `bid_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT '0',
  `supervisor_name` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) DEFAULT '0' COMMENT '状态，1会员记事，2会员审核，3催收记事，4催收审核',
  `typemsg` varchar(50) DEFAULT NULL COMMENT '类型说明',
  `descrption` varchar(500) DEFAULT NULL COMMENT '描述',
  `status` int(11) DEFAULT '-1' COMMENT '当前状态',
  `next_status` int(11) DEFAULT '-1' COMMENT '下一状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_notepad`
--

LOCK TABLES `t_user_notepad` WRITE;
/*!40000 ALTER TABLE `t_user_notepad` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_notepad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_recharge_details`
--

DROP TABLE IF EXISTS `t_user_recharge_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_recharge_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号ID',
  `user_id` bigint(20) DEFAULT NULL COMMENT '商户平台用户ID',
  `bids_id` bigint(20) DEFAULT NULL COMMENT '借款标id',
  `user_reality_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `user_mobile` varchar(50) DEFAULT NULL COMMENT '用户手机号',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易时间',
  `payment_gateway_id` smallint(6) DEFAULT '2' COMMENT '支付网关编号 1：连连支付  2 一码支付',
  `pay_info` varchar(200) DEFAULT NULL COMMENT '支付详细信息',
  `amount` double(20,2) DEFAULT NULL COMMENT '充值总金额',
  `is_completed` smallint(6) DEFAULT '0' COMMENT '是否已经完成  0否 1是',
  `completed_time` datetime DEFAULT NULL COMMENT '完成时间',
  `order_no` varchar(50) DEFAULT NULL COMMENT '订单号',
  `type` smallint(6) DEFAULT '1' COMMENT '支付用途，1 还款  2续期',
  `client` smallint(6) DEFAULT '1' COMMENT '充值入口：1 \r\n\r\npc 2 app 3 wechat 4 other',
  `overdue_money` double(20,2) DEFAULT '0.00' COMMENT '逾期金额',
  `bid_status` smallint(6) DEFAULT NULL COMMENT '订单状态',
  `rollovers_days` int(11) DEFAULT NULL COMMENT '续期天数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_urd_id` (`id`) USING BTREE,
  UNIQUE KEY `order_index` (`order_no`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户充值记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_recharge_details`
--

LOCK TABLES `t_user_recharge_details` WRITE;
/*!40000 ALTER TABLE `t_user_recharge_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_recharge_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user_rollovers`
--

DROP TABLE IF EXISTS `t_user_rollovers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user_rollovers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '-1',
  `bid_id` bigint(20) DEFAULT '-1',
  `ctime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `over_date` int(4) DEFAULT '0' COMMENT '续期天数',
  `over_balance` double(11,0) DEFAULT '0' COMMENT '续期金额',
  `status` smallint(4) DEFAULT '1' COMMENT '1 申请中，2审核不通过 3 审核通过',
  `bids_status` smallint(4) DEFAULT NULL COMMENT '标的状态',
  `overdue_amount` double(11,0) DEFAULT NULL COMMENT '逾期金额',
  `supervisor_id` bigint(20) DEFAULT '-1' COMMENT '审核员',
  `supervisor_name` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `relname` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `auditor_time` datetime DEFAULT NULL COMMENT '续期开始时间',
  `amount` double(11,0) DEFAULT NULL COMMENT '借款金额',
  `real_paid_overdue_money` double(11,0) DEFAULT NULL COMMENT '实交逾期金额',
  `reserved_amount` double(11,0) DEFAULT NULL COMMENT '保留金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user_rollovers`
--

LOCK TABLES `t_user_rollovers` WRITE;
/*!40000 ALTER TABLE `t_user_rollovers` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user_rollovers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_users`
--

DROP TABLE IF EXISTS `t_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
  `client` int(10) DEFAULT '1' COMMENT '注册入口：1 pc 2 app 3 wechat 4 other',
  `reality_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(50) DEFAULT NULL COMMENT '录登密码',
  `is_allow_login` smallint(6) DEFAULT '1' COMMENT '是否允许登录(锁定) 0 否(可以登录) 1 是',
  `lastlogtime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `lastlogip` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `locktime` datetime DEFAULT NULL COMMENT '锁定时间',
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号码',
  `id_number` varchar(50) DEFAULT NULL COMMENT '身份证号吗',
  `is_add_base_info` smallint(6) DEFAULT '0' COMMENT '是否编辑了基本信息 \r\n0、三项都未填\r\n1、基本信息已完善\r\n2、职业信息已完善\r\n4、社会关系信息已完善\r\n3（1、2）\r\n5（1、4）\r\n6（2、4）\r\n7（1、2、4）\r\n9、信息已完善',
  `is_erased` smallint(6) DEFAULT '0' COMMENT '有效用户，0 = 正常状态; 1 = 已擦除状态; ',
  `recommend_user_id` bigint(20) DEFAULT '0' COMMENT '推荐者user_id',
  `recommend_name` varchar(100) DEFAULT NULL COMMENT '推荐者名称',
  `open_id` varchar(100) DEFAULT NULL COMMENT '微信绑定id',
  `idcardstatus` int(4) DEFAULT '0' COMMENT '身份证实名认证标识 0：未认证、1：认证失败1次、2认证失败（2次）、9：认证成功',
  `bankcardstatus` int(4) DEFAULT '0' COMMENT '银行卡实名认证标识 0：未认证、-1：认证失败、9：认证成功',
  `idcardimg` int(4) DEFAULT '0' COMMENT '身份证照片提交情况0.未提交 ;\r\n1.审核中;\r\n9.已通过审核 ;\r\n3.过期失效 ;\r\n-1.未通过审核',
  `creditline` int(11) DEFAULT '1000' COMMENT '信用额度',
  `mcstat` smallint(6) DEFAULT '0' COMMENT '手机认证状态\r\n0未认证\r\n-1认证失败\r\n9认证成功\r\n',
  `mctime` datetime DEFAULT NULL COMMENT '手机认证时间',
  `mcref` smallint(6) DEFAULT NULL COMMENT '手机认证渠道\r\n1.立木征信\r\n2.app\r\n3.其他\r\n',
  `userstat` smallint(6) DEFAULT '0' COMMENT '会员状态\r\n0资料完善中\r\n1资料初步完善\r\n2初审中（资料已完善）\r\n-21资料未通过的修改资料\r\n-22拒贷的可以恢复审核\r\n-23拒贷风险名单不再操作\r\n3终审中\r\n-32拒贷的可以恢复审核\r\n-33拒贷风险名单不再操作\r\n4认证已完成\r\n\r\n',
  `supname` varchar(50) DEFAULT NULL COMMENT '会员审核人员',
  `suptime` datetime DEFAULT NULL COMMENT '会员审核时间',
  `risklevel` smallint(6) DEFAULT NULL COMMENT '风险等级',
  `finishnums` int(11) DEFAULT '0' COMMENT '完成借款次数',
  `lastftime` datetime DEFAULT NULL COMMENT '最近完成时间',
  `lastbid` bigint(20) DEFAULT NULL COMMENT '最近借款ID',
  `lastbstat` smallint(6) DEFAULT NULL COMMENT '最近借款状态',
  `lastbtime` datetime DEFAULT NULL COMMENT '最近借款时间',
  `lastbamount` double(10,0) DEFAULT '0' COMMENT '最近借款金额',
  `finish_info_time` datetime DEFAULT NULL COMMENT '用户信息填写完成时间',
  `finish_bank_time` datetime DEFAULT NULL COMMENT '银行卡完成认证时间',
  `df04` varchar(200) DEFAULT NULL COMMENT '预留4',
  `df05` varchar(200) DEFAULT '0' COMMENT '预留5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `id_number` (`id_number`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `creater_id` (`recommend_user_id`) USING BTREE,
  KEY `index_usr_id` (`id`) USING BTREE,
  KEY `idcardstatus` (`idcardstatus`) USING BTREE,
  KEY `bankcardstatus` (`bankcardstatus`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_users`
--

LOCK TABLES `t_users` WRITE;
/*!40000 ALTER TABLE `t_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_yysrz_rec`
--

DROP TABLE IF EXISTS `t_yysrz_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_yysrz_rec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `bid_id` bigint(20) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL COMMENT '手机号',
  `relname` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `mcstat` smallint(6) DEFAULT NULL COMMENT '手机认证状态\r\n0未认证\r\n-1认证失败\r\n9认证成功\r\n\r\n',
  `mctime` datetime DEFAULT NULL COMMENT '手机认证时间',
  `mcref` smallint(6) DEFAULT NULL COMMENT '手机认证渠道\r\n1.立木征信\r\n2.app\r\n3.融360\r\n7.其它\r\n',
  `trcount` smallint(6) DEFAULT NULL COMMENT '扫描次数',
  `trtime` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '扫描时间',
  `trres` smallint(6) DEFAULT '0' COMMENT '扫描结果(\r\n0.未扫描\r\n9.处理成功\r\n-9.处理失败\r\n1.重新扫描）\r\n',
  PRIMARY KEY (`id`),
  KEY `i_id` (`id`) USING BTREE,
  KEY `i_mobile` (`mobile`) USING BTREE,
  KEY `i_user_id` (`user_id`) USING BTREE,
  KEY `i_trres` (`trres`) USING BTREE,
  KEY `i_mcstat` (`mcstat`) USING BTREE,
  KEY `i_refcount` (`mcref`,`trcount`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_yysrz_rec`
--

LOCK TABLES `t_yysrz_rec` WRITE;
/*!40000 ALTER TABLE `t_yysrz_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_yysrz_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usert`
--

DROP TABLE IF EXISTS `usert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) DEFAULT NULL,
  `passwd` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usert`
--

LOCK TABLES `usert` WRITE;
/*!40000 ALTER TABLE `usert` DISABLE KEYS */;
/*!40000 ALTER TABLE `usert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `v_role_right`
--

DROP TABLE IF EXISTS `v_role_right`;
/*!50001 DROP VIEW IF EXISTS `v_role_right`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `v_role_right` (
 `id` tinyint NOT NULL,
  `menu_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `url` tinyint NOT NULL,
  `m1id` tinyint NOT NULL,
  `m2name` tinyint NOT NULL,
  `m1name` tinyint NOT NULL,
  `roleid` tinyint NOT NULL,
  `m0id` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_role_right`
--

/*!50001 DROP TABLE IF EXISTS `v_role_right`*/;
/*!50001 DROP VIEW IF EXISTS `v_role_right`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`kingfu`@`%` SQL SECURITY INVOKER */
/*!50001 VIEW `v_role_right` AS select `r`.`id` AS `id`,`r`.`menu_id` AS `menu_id`,`r`.`name` AS `name`,`r`.`url` AS `url`,`m`.`parent_id` AS `m1id`,`m`.`name` AS `m2name`,`pm`.`name` AS `m1name`,`j`.`id` AS `roleid`,`pm`.`parent_id` AS `m0id` from (((`t_right` `r` join `t_menu` `m`) join `t_menu` `pm`) join `t_role` `j`) where ((`m`.`parent_id` = `pm`.`id`) and (`r`.`menu_id` = `m`.`id`) and find_in_set(`r`.`id`,`j`.`right_id`)) order by `j`.`id`,`pm`.`id`,`m`.`id`,`r`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-23 11:08:28
