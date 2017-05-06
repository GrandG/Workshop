/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : 127.0.0.1:3306
Source Database       : ids

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-04-05 09:22:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_env
-- ----------------------------
DROP TABLE IF EXISTS `c_env`;
CREATE TABLE `c_env` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENV` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '环境分类',
  `Description` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '环境描述',
  `Temp_Low` float DEFAULT NULL COMMENT '最低温度',
  `Temp_Up` float DEFAULT NULL COMMENT '最高温度',
  `Gas` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '气体腐蚀',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='环境因素|EDITLEVEL=1';

-- ----------------------------
-- Records of c_env
-- ----------------------------
INSERT INTO `c_env` VALUES ('1', 'A', '1.温湿度完全可控的安装环境；覆盖《环境规划设计规范》中“室内温控”和“室外完全可控” 2.正常的生活以及工作场所，办公室，商店，电子产品装配车间，通信中心，贵重以及敏感产品的存储房间（有加热和制冷能力设备来控制环境温度）', '5', '40', '满足GR63 R4-84要求-10天的抗腐蚀气体要求-北美');
INSERT INTO `c_env` VALUES ('2', 'B', '室内部分温控环境，建筑物的入口及楼梯，车库，地下室，一些厂房，工厂，以及工业车间的建筑物；无人值守的设备局；一些通信中心，普通的存储房间和农场建筑物', '-5', '45', '满足GR63 R4-84要求-10天的抗腐蚀气体要求-北美');
INSERT INTO `c_env` VALUES ('3', 'C', '有防护部分可控环境；符合GR487的室外型机房；提供同等环境和保护的室外机房或机柜的内部空间，客户指定的没有环境控制的住处或大楼；如阁楼，仓库，车库这些比完全可控环境严酷的多的热环境', '-25', '55', '满足GR63 R4-84要求-10天的抗腐蚀气体要求-北美');
INSERT INTO `c_env` VALUES ('4', 'D', '室外防护无温控环境；电线分配转换箱内部，底座高出地面的机房，客户指定的更为严酷的环境，如锅炉房（热、湿）、熔炉（热/干）、开放式车库（高度污染和拈污）', '-40', '65', '满足GR63 R4-84要求-10天的抗腐蚀气体要求-北美');
INSERT INTO `c_env` VALUES ('5', 'E', '室外无防护环境；高温装置，抱杆安装，悬吊安装，附在建筑物的墙上', '-40', '70', 'IEC 68-2-52，盐雾2h+湿热 20-22h，10个循环--欧盟/中国 ASTM B117指定中性盐雾，30天北美');

-- ----------------------------
-- Table structure for c_taskroledef
-- ----------------------------
DROP TABLE IF EXISTS `c_taskroledef`;
CREATE TABLE `c_taskroledef` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `Code` int(4) DEFAULT NULL COMMENT '编码',
  `Role` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '功能',
  `RoleDescription` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '职责描述',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='子任务定义|EDITLEVEL=2';

-- ----------------------------
-- Records of c_taskroledef
-- ----------------------------
INSERT INTO `c_taskroledef` VALUES ('1', '1', 'INPUT', '信息输入');
INSERT INTO `c_taskroledef` VALUES ('2', '2', 'DFR', 'DFR分析');
INSERT INTO `c_taskroledef` VALUES ('4', '7', 'REPORT', '总结报告整理');
INSERT INTO `c_taskroledef` VALUES ('5', '3', 'FMEARATING', 'FMEA评分');
INSERT INTO `c_taskroledef` VALUES ('6', '4', 'FMEAAPPROVE', 'FMEA方案评审');
INSERT INTO `c_taskroledef` VALUES ('7', '8', 'REPORTAPPROVE', '总结报告评审');
INSERT INTO `c_taskroledef` VALUES ('8', '5', 'FMEAREVISED', 'FMEA方案修改');
INSERT INTO `c_taskroledef` VALUES ('9', '6', 'FMEARESULT', 'FMEA结果');

-- ----------------------------
-- Table structure for dfr_baseline
-- ----------------------------
DROP TABLE IF EXISTS `dfr_baseline`;
CREATE TABLE `dfr_baseline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建',
  `Code` int(4) DEFAULT NULL COMMENT '编码',
  `RuleContent` varchar(2056) CHARACTER SET utf8 DEFAULT NULL COMMENT '设计规则描述',
  `Function` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '功能（保留）',
  `TrigCond` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '触发条件（查询语句）',
  `Product` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '适用产品',
  `Class` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '部位大类',
  `FMEA_Effect` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA失效的潜在影响',
  `FMEA_Mode` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA潜在失效模式',
  `FMEA_Reason` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA失效的潜在原因',
  `FMEA_ProposalGroup` varchar(200) DEFAULT NULL,
  `FMEA_Proposal` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA建议行动',
  `Tool` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Env` varchar(50) DEFAULT NULL COMMENT '典型产品环境',
  `MatchInput` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '输入匹配',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='设计基线库|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_baseline
-- ----------------------------
INSERT INTO `dfr_baseline` VALUES ('1', '1001', '单板表面的相对湿度要控制在RH60％以下', '', null, '通用', '环境', '', '', '', null, '', null, null, null);
INSERT INTO `dfr_baseline` VALUES ('2', '1002', '单板上有较重的插装器件（如电池等），需要考虑有机械固定措施', '', null, '通用', '器件', '', '', '', null, '', null, null, null);
INSERT INTO `dfr_baseline` VALUES ('3', '1003', '单板上质量大的组件或结构件（如重量超过200g模块和散热器等），其重量不能由PCB单独承担，必须由铁板、拉手条或其他加固件支撑', '', null, '通用', '结构件', '', '', '', null, '', null, null, null);
INSERT INTO `dfr_baseline` VALUES ('4', '1004', '对于较大较重的PCBA（如1.5Kg），压接连接器要确保与单板保持力满足最小规格要求，避免承受振动冲击等载荷时脱落', '', null, '通用', '连接器', '', '', '', null, '', null, null, null);
INSERT INTO `dfr_baseline` VALUES ('5', '1005', 'BGA器件远离单板与加强板（铁板）的螺钉位置，大于30mm', '', null, '通用', 'BGA器件', '', '', '', null, '', null, null, null);
INSERT INTO `dfr_baseline` VALUES ('6', '1006', 'BGA散热器推荐机械固持（非胶粘）', '', null, '通用', '散热器', '', '', '', null, '', null, null, null);
INSERT INTO `dfr_baseline` VALUES ('7', '1007', '带有大散热器（重量大于200g）的BGA器件，在PCB背面投影区域建议设计金属托架，对PCB进行加强', '', null, '通用', 'BGA器件', '', '', '', null, '', null, null, null);
INSERT INTO `dfr_baseline` VALUES ('8', '1008', 'BGA载板不推荐选用ENIG表面处理，使用前需经过工艺评审同意', '', null, '通用', '载板', '', '', '', null, '', null, null, null);
INSERT INTO `dfr_baseline` VALUES ('9', '1009', '在新产品设计中，为防止pad crater，BGA角落焊点焊盘与走线的设计可尽量多采用“增粗与焊盘相连走线”、“SMD焊盘”、“无功能的盲孔”等优化措施', '', null, '通用', 'BGA器件', '', '', '', null, '', null, null, null);

-- ----------------------------
-- Table structure for dfr_designrule
-- ----------------------------
DROP TABLE IF EXISTS `dfr_designrule`;
CREATE TABLE `dfr_designrule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建）',
  `Code` int(4) DEFAULT NULL COMMENT '编码',
  `RuleContent` varchar(2056) CHARACTER SET utf8 DEFAULT NULL COMMENT '设计规则描述',
  `Function` varchar(200) DEFAULT NULL COMMENT '功能（保留）',
  `TrigCond` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '触发条件（查询语句）',
  `Product` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '适用产品',
  `Class` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '部位大类',
  `FMEA_Effect` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA失效的潜在影响',
  `FMEA_Mode` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA潜在失效模式',
  `FMEA_Reason` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA失效的潜在原因',
  `FMEA_ProposalGroup` varchar(200) DEFAULT NULL,
  `FMEA_Proposal` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA建议行动',
  `Tool` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '工具',
  `ENV` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '环境',
  `MatchInput` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '输入匹配',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1 COMMENT='设计规则库|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_designrule
-- ----------------------------
INSERT INTO `dfr_designrule` VALUES ('5', '2001', '2001', 'RA_R2001', '((Layer_Thickness<5) or (Layer_Thickness>15)) and (Layer_Type=\'DIELECTRIC\')', '通用', 'PCB', null, null, null, null, null, null, 'A/B/C/D/E', null);
INSERT INTO `dfr_designrule` VALUES ('30', '2002', '2002', 'RA_R2002', '((Layer_Thickness<0.69) and (Layer_SubClass=\'TOP\' or Layer_SubClass=\'BOTTOM\')) or ((Layer_Thickness<1.38) and (Layer_SubClass<>\'TOP\' and Layer_SubClass<>\'BOTTOM\')) or (CheckEqualCore=0)', '通用', 'PCB', null, null, null, null, null, null, 'A/B/C/D/E', null);
INSERT INTO `dfr_designrule` VALUES ('31', '2003', '2003', 'RA_R2003', '(EntType=\'OUTER\' and radius<120) or  (EntType=\'INNER\' and radius<30)', '通用', 'PCB', '', '', '', '', '', '', 'A/B/C/D/E', '');
INSERT INTO `dfr_designrule` VALUES ('32', '2004', '2004', '', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('33', '2005', '2005', 'RA_R2005', '(DIST<425) and ((DIA>124) and (DIA<826))', '通用', 'PCB', '', '', '', '', '', '', 'A/B/C/D/E', '');
INSERT INTO `dfr_designrule` VALUES ('34', '2006', '2006', '', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('35', '2007', '2007', 'RA_R2007', 'DIST<400', '通用', 'PCB', '', '', '', '', '', '', 'A/B/C/D/E', '');
INSERT INTO `dfr_designrule` VALUES ('36', '2008', '2008', 'RA_R2008', '(NUM=2 and DIST<400) or (NUM=3 and DIST<800)', '通用', 'PCB', '', '', '', '', '', '', 'A/B/C/D/E', '');
INSERT INTO `dfr_designrule` VALUES ('37', '2009', '2009', 'RA_R2009', 'SYM_NAME like \'%WAVE%', '通用', 'PCB', '', '', '', '', '', '', 'A/B/C/D/E', '');
INSERT INTO `dfr_designrule` VALUES ('38', '2010', '2010', '', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('39', '2011', '2011', 'RA_R2011', '(TVIANO<2000 and (not FINISH like \'%OSP%\')) or (IsBeiBan=1 and  (not FINISH like \'%OSP%\'))', '通用', 'PCB', '', '', '', '', '', '', 'A/B/C/D/E', '');
INSERT INTO `dfr_designrule` VALUES ('40', '2012', '2012', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('41', '2013', '2013', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('42', '2014', '2014', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('43', '2015', '2015', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('44', '2016', '2016', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('45', '2017', '2017', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('46', '2018', '2018', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('47', '2019', '2019', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('48', '2020', '2020', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('49', '2021', '2021', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('50', '2022', '2022', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('51', '2023', '2023', 'RA_R2023', '(SYM_NAME like \'CAPC%\') and (REFROTATE>30)', '通用', 'PCB', '', '', '', '', '', '', 'A/B/C/D/E', '');
INSERT INTO `dfr_designrule` VALUES ('52', '2024', '2024', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `dfr_designrule` VALUES ('53', '2025', '2025', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for dfr_failmode
-- ----------------------------
DROP TABLE IF EXISTS `dfr_failmode`;
CREATE TABLE `dfr_failmode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建',
  `Code` int(4) DEFAULT NULL COMMENT '编码',
  `RuleContent` varchar(2056) CHARACTER SET utf8 DEFAULT NULL COMMENT '设计规则描述',
  `Function` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '功能（保留）',
  `TrigCond` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '触发条件（查询语句）',
  `Product` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '适用产品',
  `Class` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '部位大类',
  `FMEA_Effect` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA失效的潜在影响',
  `FMEA_Mode` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA潜在失效模式',
  `FMEA_Reason` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA失效的潜在原因',
  `FMEA_ProposalGroup` varchar(200) DEFAULT NULL,
  `FMEA_Proposal` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA建议行动',
  `Tool` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '工具',
  `Env` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '环境',
  `MatchInput` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '输入匹配',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='失效模式库|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_failmode
-- ----------------------------

-- ----------------------------
-- Table structure for dfr_inputfact
-- ----------------------------
DROP TABLE IF EXISTS `dfr_inputfact`;
CREATE TABLE `dfr_inputfact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建）',
  `Code` int(4) DEFAULT NULL COMMENT '编码',
  `InputType` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `InputDescription` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `InputMethod` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '输入方法',
  `InputOption` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '输入选项',
  `TrigCond` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '触发条件（查询语句）',
  `Class` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COMMENT='输入事实|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_inputfact
-- ----------------------------
INSERT INTO `dfr_inputfact` VALUES ('13', '1', '单板相关', '单板拼板', 'SEL', '1/0', '1', '通用');
INSERT INTO `dfr_inputfact` VALUES ('14', '2', '单板相关', '插框类单板', 'SEL', '1/0', '1', '通用');
INSERT INTO `dfr_inputfact` VALUES ('15', '3', '单板相关', '过板方向明确要求', 'SEL', '1/0', '1', '通用');
INSERT INTO `dfr_inputfact` VALUES ('16', '4', '单板相关', null, 'SEL', '1/0', '1', '通用');

-- ----------------------------
-- Table structure for dfr_newrisk
-- ----------------------------
DROP TABLE IF EXISTS `dfr_newrisk`;
CREATE TABLE `dfr_newrisk` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建',
  `Code` int(4) DEFAULT NULL COMMENT '编码',
  `RuleContent` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '设计规则描述',
  `RuleType` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '规则分类',
  `Keyword` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '规则关键词',
  `InputDescription` varchar(255) DEFAULT NULL COMMENT '输入描述',
  `InputSource` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '输入来源',
  `InputMethod` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '输入方法',
  `InputOption` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '输入选项',
  `TrigCond` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '触发条件（查询语句）',
  `Function` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '功能（保留）',
  `Product` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '适用产品',
  `Level` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品层级',
  `Class` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '部位大类',
  `SubClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '部位小类',
  `Process` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '工艺过程',
  `Env` varchar(50) DEFAULT NULL COMMENT '典型产品环境',
  `VeriPlan` varchar(20) DEFAULT NULL COMMENT '验证方案',
  `FailCaseID` int(4) DEFAULT NULL COMMENT '失效案例ID',
  `FMEA_Det` int(4) DEFAULT NULL COMMENT '可检测性',
  `FMEA_Occ` int(4) DEFAULT NULL COMMENT '发生几率',
  `FMEA_Sev` int(4) DEFAULT NULL COMMENT '严重性',
  `FMEA_Effect` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA失效的潜在影响',
  `FMEA_Mode` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA潜在失效模式',
  `FMEA_Mechanism` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA潜在的失效机理',
  `FMEA_Reason` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA失效的潜在原因',
  `FMEA_Proposal` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA建议行动',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Code` (`Code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='新风险库|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_newrisk
-- ----------------------------
INSERT INTO `dfr_newrisk` VALUES ('1', '1001', '单板表面的相对湿度要控制在RH60％以下', 'PCB', '单板表面的相对湿度(单位%)', null, 'MANUAL', 'VAL', '', 'Package like \"%BGA%\"\r\n', '', '', '单板', '环境', '湿度', null, null, null, null, '3', '4', '3', 'new', 'new', 'new', 'new', 'new');
INSERT INTO `dfr_newrisk` VALUES ('2', '1002', '单板上有较重的插装器件（如电池等），需要考虑有机械固定措施', 'PCB', '单板上是否有较重的插装器件（如电池等）', null, 'MANUAL', 'SEL', '有/无', '有', '', null, '单板', '器件', '插装', null, null, null, null, '4', '4', '2', 'new', 'new', 'new', 'new', 'new');
INSERT INTO `dfr_newrisk` VALUES ('3', '1003', '单板上质量大的组件或结构件（如重量超过200g模块和散热器等），其重量不能由PCB单独承担，必须由铁板、拉手条或其他加固件支撑', 'PCB', '单板上是否有质量大的组件或结构件（如重量超过200g模块和散热器等）', null, 'MANUAL', 'SEL', '有/无', '有', '', null, '单板', '结构件', '结构件', null, null, null, null, '3', '6', '5', 'new', 'new', 'new', 'new', 'new');
INSERT INTO `dfr_newrisk` VALUES ('4', '1004', '对于较大较重的PCBA（如1.5Kg），压接连接器要确保与单板保持力满足最小规格要求，避免承受振动冲击等载荷时脱落', 'PCB', 'PCBA是否较大较重（如>1.5Kg）', null, 'MANUAL', 'SEL', '是/否', '是', '', null, '单板', '连接器', '压接连接器', null, null, null, null, '5', '3', '4', 'new', 'new', 'new', 'new', 'new');
INSERT INTO `dfr_newrisk` VALUES ('5', '1005', 'BGA器件远离单板与加强板（铁板）的螺钉位置，大于30mm', 'PCB', 'BGA器件是否远离单板与加强板（铁板）的螺钉位置(大于30mm)', null, 'MANUAL', 'SEL', '是/否', '否', '', null, '单板', 'BGA器件', '螺钉孔', null, null, null, null, '6', '2', '3', 'new', 'new', 'new', 'new', 'new');
INSERT INTO `dfr_newrisk` VALUES ('6', '1006', 'BGA散热器推荐机械固持（非胶粘）', 'PCB', 'BGA散热器是否机械固定', null, 'MANUAL', 'SEL', '是/否', '否', '', null, '单板', '散热器', '固定方式', null, null, null, null, '5', '3', '3', 'new', 'new', 'new', 'new', 'new');
INSERT INTO `dfr_newrisk` VALUES ('7', '1007', '带有大散热器（重量大于200g）的BGA器件，在PCB背面投影区域建议设计金属托架，对PCB进行加强', 'PCB', 'BGA器件带有大散热器（重量大于200g）', null, 'MANUAL', 'SEL', '有/无', '有', '', null, '单板', 'BGA器件', '散热器', null, null, null, null, '4', '2', '4', 'new', 'new', 'new', 'new', 'new');
INSERT INTO `dfr_newrisk` VALUES ('8', '1008', 'BGA载板不推荐选用ENIG表面处理，使用前需经过工艺评审同意', 'PCB', 'BGA载板用ENIG表面处理', null, 'MANUAL', 'SEL', '是/否', '是', '', null, '单板', '载板', '表面处理', null, null, null, null, '3', '5', '2', 'new', 'new', 'new', 'new', 'new');
INSERT INTO `dfr_newrisk` VALUES ('9', '1009', '在新产品设计中，为防止pad crater，BGA角落焊点焊盘与走线的设计可尽量多采用“增粗与焊盘相连走线”、“SMD焊盘”、“无功能的盲孔”等优化措施', 'PCB', 'BGA角落焊点焊盘与走线的设计方式', null, 'MANUAL', 'SEL', '增粗与焊盘相连走线/SMD焊盘/无功能的盲孔/未采用', '未采用', '', null, '单板', 'BGA器件', '焊点焊盘', null, null, null, null, '4', '3', '6', 'new', 'new', 'new', 'new', 'new');

-- ----------------------------
-- Table structure for dfr_productline
-- ----------------------------
DROP TABLE IF EXISTS `dfr_productline`;
CREATE TABLE `dfr_productline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Class` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类',
  `ProcessClass` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '工艺分类',
  `DRB_Leader` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'DFR主任',
  `ProductClass` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品分类',
  `ProductFamily` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品族',
  `special` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '特殊描述',
  `TypicalProduct` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '典型产品',
  `Env` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '应用环境分类',
  `PCBDesignLife` float DEFAULT NULL COMMENT '单板设计寿命',
  `FailRate` float DEFAULT NULL COMMENT '失效率',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COMMENT='产品线定义|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_productline
-- ----------------------------
INSERT INTO `dfr_productline` VALUES ('1', '无线', '无线网络工艺', '李松林', 'MARP', 'FDD RRU/RFU', null, 'SRRU', 'E', '10', '0.001');
INSERT INTO `dfr_productline` VALUES ('2', '无线', '无线网络工艺', '李松林', 'MARP', 'TDD RRU', null, null, 'E', '10', '0.001');
INSERT INTO `dfr_productline` VALUES ('3', '无线', '无线网络工艺', '李松林', 'MARP', 'BBU', null, 'BBU', 'C', '15', '0.0075');
INSERT INTO `dfr_productline` VALUES ('4', '无线', '无线网络工艺', '李松林', 'PARC', '小站', null, 'AP/PARC', 'C', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('5', '无线', '无线网络工艺', '李松林', '天线', '天线', null, '', 'E', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('6', '无线', '无线网络工艺', '李松林', '天线', 'AAS', '', null, 'E', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('7', '无线', '无线网络工艺', '李松林', '微波', '核心制造', '', null, 'E', '10', '0.001');
INSERT INTO `dfr_productline` VALUES ('8', '无线', '无线网络工艺', '李松林', '微波', 'ODU(微波)', '', null, 'E', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('9', '网络', 'IP网络工艺', '黄春光', '运营商IP', '核心路由器', null, null, 'A', '10', '0.002');
INSERT INTO `dfr_productline` VALUES ('10', '网络', 'IP网络工艺', '黄春光', '运营商IP', '数据中心', null, null, 'A', '7', '0.005');
INSERT INTO `dfr_productline` VALUES ('11', '网络', 'IP网络工艺', '黄春光', '运营商IP', '交换机', null, null, 'B', '10', '0.005');
INSERT INTO `dfr_productline` VALUES ('12', '网络', 'IP网络工艺', '黄春光', '运营商IP', 'PTN', null, null, 'C', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('13', '网络', 'IP网络工艺', '黄春光', '企业网', '边缘路由器', null, null, 'B', '10', '0.005');
INSERT INTO `dfr_productline` VALUES ('14', '网络', 'IP网络工艺', '黄春光', '企业网', 'WLAN&AR路由器', null, null, 'D', '5', '0.01');
INSERT INTO `dfr_productline` VALUES ('15', '网络', 'IP网络工艺', '黄春光', '企业网', '视频及监控设备', null, null, 'E', '5', '0.01');
INSERT INTO `dfr_productline` VALUES ('16', '网络', '固定网络工艺', '李亮', '传送网', '传送', null, null, 'A', '10', '0.005');
INSERT INTO `dfr_productline` VALUES ('17', '网络', '固定网络工艺', '李亮', '传送网', '微波', null, null, 'E', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('18', '网络', '固定网络工艺', '李亮', '接入网', '接入', null, null, 'D', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('19', '网络', '固定网络工艺', '李亮', '接入网', '光电', null, null, 'D', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('20', '网络', '固定网络工艺', '李亮', '接入网', '光猫/iODN', null, null, 'B', '5', '0.01');
INSERT INTO `dfr_productline` VALUES ('21', '网络', '平台综合网络工艺', '杨曦晨', '企业IT', 'IT(服务器&存储&安全等)', null, null, 'A', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('22', '网络', '平台综合网络工艺', '杨曦晨', '企业IT', '中研(OSTA/mTCA等)', null, null, 'A', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('23', '能源', '平台综合网络工艺', '葛翔', '网络能源', '一次电源', '', null, 'E', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('24', '能源', '平台综合网络工艺', '葛翔', '网络能源', '二次电源(BMP)', null, null, 'E', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('25', '能源', '平台综合网络工艺', '葛翔', '网络能源', '三次电源(POL)', null, null, 'E', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('26', '能源', '平台综合网络工艺', '葛翔', '新能源', 'UPS', null, null, 'D', '10', '0.01');
INSERT INTO `dfr_productline` VALUES ('28', '能源', '平台综合网络工艺', '葛翔', '新能源', '太阳能', null, null, 'D', '20', '0.01');

-- ----------------------------
-- Table structure for dfr_report
-- ----------------------------
DROP TABLE IF EXISTS `dfr_report`;
CREATE TABLE `dfr_report` (
  `ID` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建)',
  `DocID` int(4) DEFAULT NULL COMMENT '文档编号',
  `DocName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '文档名称',
  `Type` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '文档类型(仿真/实验)',
  `Keyword` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '关键词',
  `DocAttached` blob COMMENT '文档附件',
  `DocLinkedPath` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '文档路径',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='报告归档库|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_report
-- ----------------------------

-- ----------------------------
-- Table structure for dfr_r_pcb_pin
-- ----------------------------
DROP TABLE IF EXISTS `dfr_r_pcb_pin`;
CREATE TABLE `dfr_r_pcb_pin` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统内建(编号)',
  `BOMTYPECODE` varchar(10) DEFAULT NULL COMMENT 'BOM编码',
  `PCBThick` float DEFAULT NULL COMMENT 'PCB厚度',
  `Pin_MinLen` float DEFAULT NULL COMMENT '压接刃最小长度',
  `Pin_RMinLen` float DEFAULT NULL COMMENT '压接刃推荐最小长度',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='PCB与压接刃关系表|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_r_pcb_pin
-- ----------------------------
INSERT INTO `dfr_r_pcb_pin` VALUES ('1', '1402', '100', '120', null);
INSERT INTO `dfr_r_pcb_pin` VALUES ('2', '1402', '120', '240', null);
INSERT INTO `dfr_r_pcb_pin` VALUES ('3', '1402', '140', '360', null);

-- ----------------------------
-- Table structure for dfr_r_rule_input
-- ----------------------------
DROP TABLE IF EXISTS `dfr_r_rule_input`;
CREATE TABLE `dfr_r_rule_input` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `InputID` int(11) DEFAULT NULL COMMENT '输入编号',
  `RuleID` int(11) DEFAULT NULL COMMENT '规则编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1 COMMENT='规则信息输入对应表|EDITLEVEL=1';

-- ----------------------------
-- Records of dfr_r_rule_input
-- ----------------------------
INSERT INTO `dfr_r_rule_input` VALUES ('97', '1', '2001');
INSERT INTO `dfr_r_rule_input` VALUES ('98', '2', '2006');
INSERT INTO `dfr_r_rule_input` VALUES ('99', '3', '2009');

-- ----------------------------
-- Table structure for fielddatatype
-- ----------------------------
DROP TABLE IF EXISTS `fielddatatype`;
CREATE TABLE `fielddatatype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `fielddatatype` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '字段类型',
  `fielddatatypecaption` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '字段类型描述',
  `fieldformat` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '字段格式',
  `fieldsize` int(11) DEFAULT NULL COMMENT '字段长度',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `fieldcaption` (`fielddatatypecaption`),
  KEY `fieldname` (`fielddatatype`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='字段信息描述|EDITLEVEL=2';

-- ----------------------------
-- Records of fielddatatype
-- ----------------------------
INSERT INTO `fielddatatype` VALUES ('4', 'int', '标准整数', '(_TL_) DEFAULT NULL COMMENT', '4');
INSERT INTO `fielddatatype` VALUES ('10', 'double', '浮点数 ', '(_TL_,2) DEFAULT NULL COMMENT', '8');
INSERT INTO `fielddatatype` VALUES ('14', 'varchar', '字符串 ', '(_TL_)  CHARACTER SET utf8 DEFAULT NULL COMMENT', '255');
INSERT INTO `fielddatatype` VALUES ('15', 'date', '日期', ' DEFAULT NULL COMMENT', '3');
INSERT INTO `fielddatatype` VALUES ('16', 'time', '时间', ' DEFAULT NULL COMMENT', '3');
INSERT INTO `fielddatatype` VALUES ('19', 'datetime', '日期时间', ' DEFAULT NULL COMMENT', '8');

-- ----------------------------
-- Table structure for fmea_proposal
-- ----------------------------
DROP TABLE IF EXISTS `fmea_proposal`;
CREATE TABLE `fmea_proposal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分组名',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '建议',
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `toolname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '工具',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of fmea_proposal
-- ----------------------------
INSERT INTO `fmea_proposal` VALUES ('1', '仿真分析', '导热垫装配应力', '', 'Call_PadStress.tcl');
INSERT INTO `fmea_proposal` VALUES ('2', '仿真分析', '单板模态', null, 'Call_PCBFreq.tcl');
INSERT INTO `fmea_proposal` VALUES ('3', '仿真分析', 'ICT测试', null, 'Call_PCBICT.tcl');
INSERT INTO `fmea_proposal` VALUES ('4', '仿真分析', '单板跌落冲击', null, 'Call_PCBImpact.tcl');
INSERT INTO `fmea_proposal` VALUES ('5', '仿真分析', '单板插拔', '', 'Call_PCBInsert.tcl');
INSERT INTO `fmea_proposal` VALUES ('6', '仿真分析', '单板随机振动', null, 'Call_PCBRV.tcl');
INSERT INTO `fmea_proposal` VALUES ('7', '仿真分析', '扣板插拔', null, 'Call_PDPI.tcl');
INSERT INTO `fmea_proposal` VALUES ('8', '仿真分析', '单板周转(手持板)', null, 'Call_PHM.tcl');
INSERT INTO `fmea_proposal` VALUES ('9', '仿真分析', '金属铝衬底热回流变形', null, 'Call_PHTR.tcl');
INSERT INTO `fmea_proposal` VALUES ('10', '仿真分析', '引脚成型', null, 'Call_PinBend.tcl');
INSERT INTO `fmea_proposal` VALUES ('11', '仿真分析', '单板包装跌落', null, 'Call_PkgDrop.tcl');
INSERT INTO `fmea_proposal` VALUES ('12', '仿真分析', '单板公差装配', null, 'Call_PTAS.tcl');
INSERT INTO `fmea_proposal` VALUES ('13', '仿真分析', '插框单板跌落冲击', null, 'Call_PWFImpact.tcl');
INSERT INTO `fmea_proposal` VALUES ('14', '仿真分析', '单板热应力-焊点热疲劳', null, 'Call_SolderFatigue.tcl');
INSERT INTO `fmea_proposal` VALUES ('15', '仿真分析', '子模型技术', null, 'Call_SubModel.tcl');
INSERT INTO `fmea_proposal` VALUES ('16', '理论计算', '弯曲计算公式', null, 'BendingFormula');
INSERT INTO `fmea_proposal` VALUES ('17', '实验测试', '测试标准', null, 'Test.xls');
INSERT INTO `fmea_proposal` VALUES ('18', '理论计算', '弯曲计算公式XLS', '', 'Test.xls');

-- ----------------------------
-- Table structure for fmea_rate
-- ----------------------------
DROP TABLE IF EXISTS `fmea_rate`;
CREATE TABLE `fmea_rate` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Rate` int(11) DEFAULT NULL COMMENT '分值',
  `Definition` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '分值定义',
  `Description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '分值描述',
  `Type` varchar(20) DEFAULT NULL COMMENT '类型(严重性S/发生几率O/可检测性D)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COMMENT='RPN分值定义|EDITLEVEL=1';

-- ----------------------------
-- Records of fmea_rate
-- ----------------------------
INSERT INTO `fmea_rate` VALUES ('1', '0', 'sev', 'sss', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('2', '1', 'ddd', 'dfdfd', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('3', '2', 'sdfdsds', 'sdfds', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('4', '3', 'sdfs', 'sdfds', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('5', '4', 'sdfsd', 'sdfds', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('6', '5', 'sev', 'dsfds', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('7', '6', 'sev', 'sdfddf', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('8', '7', 'ss', 'sss', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('9', '8', 'ddd', 'dfdfd', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('10', '9', 'sdfdsds', 'sdfds', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('11', '10', 'sdfs', 'sdfds', 'FMEA_SEV');
INSERT INTO `fmea_rate` VALUES ('12', '0', 'occ', 'sdfds', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('13', '1', 'sdfds', 'dsfds', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('14', '2', 'sfd', 'sdfddf', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('15', '3', 'ss', 'sss', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('16', '4', 'ddd', 'dfdfd', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('17', '5', 'sdfdsds', 'sdfds', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('18', '6', 'sdfs', 'sdfds', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('19', '7', 'sdfsd', 'sdfds', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('20', '8', 'sdfds', 'dsfds', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('21', '9', 'sfd', 'sdfddf', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('22', '10', 'ss', 'sss', 'FMEA_OCC');
INSERT INTO `fmea_rate` VALUES ('23', '0', 'det', 'dfdfd', 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('24', '1', 'sdfdsds', 'sdfds', 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('25', '2', 'sdfs', 'sdfds', 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('26', '3', 'sdfsd', 'sdfds', 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('27', '4', 'sdfds', 'dsfds', 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('28', '5', 'sfd', 'sdfddf', 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('29', '6', null, null, 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('30', '7', null, null, 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('31', '8', null, null, 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('32', '9', null, null, 'FMEA_DET');
INSERT INTO `fmea_rate` VALUES ('33', '10', null, null, 'FMEA_DET');

-- ----------------------------
-- Table structure for general_info
-- ----------------------------
DROP TABLE IF EXISTS `general_info`;
CREATE TABLE `general_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建)',
  `code` int(11) DEFAULT NULL COMMENT '编码',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题(说明)',
  `type` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '分类(所有常用关联)',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COMMENT='基础信息定义|EDITLEVEL=2';

-- ----------------------------
-- Records of general_info
-- ----------------------------
INSERT INTO `general_info` VALUES ('1', null, '基础工艺', 'U_RIGHT');
INSERT INTO `general_info` VALUES ('2', null, '单板首席', 'U_RIGHT');
INSERT INTO `general_info` VALUES ('3', null, '项目主管', 'U_RIGHT');
INSERT INTO `general_info` VALUES ('4', null, '数据管理员', 'U_RIGHT');
INSERT INTO `general_info` VALUES ('5', null, '主设计师', 'U_RIGHT');
INSERT INTO `general_info` VALUES ('6', null, 'PARC', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('7', null, '边缘路由器', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('8', null, '交换机', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('9', null, 'PTN', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('10', null, 'WlAN&AR路由器', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('11', null, '视频及监控设备', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('12', null, '接入', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('13', null, '光猫/iODN', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('14', null, '电源', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('15', null, '新能源', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('16', null, 'BBU', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('17', null, 'PARC', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('18', null, 'dfr_baseline', 'S_DFRLIB');
INSERT INTO `general_info` VALUES ('19', null, 'dfr_designrule', 'S_DFRLIB');
INSERT INTO `general_info` VALUES ('20', null, 'dfr_failmode', 'S_DFRLIB');
INSERT INTO `general_info` VALUES ('21', null, '理论计算', 'FMEASOLUTION');
INSERT INTO `general_info` VALUES ('22', null, '仿真分析', 'FMEASOLUTION');
INSERT INTO `general_info` VALUES ('23', null, '实验测试', 'FMEASOLUTION');
INSERT INTO `general_info` VALUES ('24', null, '专家意见', 'FMEASOLUTION');
INSERT INTO `general_info` VALUES ('25', null, '未启动', 'STATUS');
INSERT INTO `general_info` VALUES ('26', null, '进度中', 'STATUS');
INSERT INTO `general_info` VALUES ('27', null, '已完成', 'STATUS');
INSERT INTO `general_info` VALUES ('28', null, '工艺部', 'DEPARTMENT');
INSERT INTO `general_info` VALUES ('29', null, '工艺二部', 'DEPARTMENT');
INSERT INTO `general_info` VALUES ('30', null, '无线', 'U_PRODUCTTYPE');
INSERT INTO `general_info` VALUES ('31', null, '装配', 'U_RISKTYPE');
INSERT INTO `general_info` VALUES ('32', null, '可靠性', 'U_RISKTYPE');
INSERT INTO `general_info` VALUES ('33', null, '组装', 'U_RISKTYPE');
INSERT INTO `general_info` VALUES ('34', null, '可制造性', 'U_RISKTYPE');

-- ----------------------------
-- Table structure for m_fealog
-- ----------------------------
DROP TABLE IF EXISTS `m_fealog`;
CREATE TABLE `m_fealog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logtime` datetime DEFAULT NULL COMMENT '登陆时间',
  `loginfo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `user` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户',
  `computer` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '计算机',
  `domainname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '域用户',
  `version` int(11) DEFAULT NULL COMMENT '程序版本',
  `ModuleName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '模块名称',
  `PCBName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '单板名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_fealog
-- ----------------------------
INSERT INTO `m_fealog` VALUES ('1', '2015-06-15 21:52:29', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'E:/PCB010203.hm');
INSERT INTO `m_fealog` VALUES ('2', '2015-06-15 21:52:58', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'E:/PCB010203.hm');
INSERT INTO `m_fealog` VALUES ('3', '2015-06-15 21:54:20', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'E:/PCB010203.hm');
INSERT INTO `m_fealog` VALUES ('4', '2015-06-15 21:54:39', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '扣板插拔', 'E:/PCB010203.hm');
INSERT INTO `m_fealog` VALUES ('5', '2015-06-15 21:58:05', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板ICT测试', 'PCB010203');
INSERT INTO `m_fealog` VALUES ('6', '2015-06-15 22:04:26', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'PCB010203');
INSERT INTO `m_fealog` VALUES ('7', '2015-06-15 22:10:36', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'PCB010203');
INSERT INTO `m_fealog` VALUES ('8', '2015-06-16 17:05:22', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('9', '2015-06-16 17:06:49', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('10', '2015-06-16 17:07:43', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('11', '2015-06-16 17:08:18', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('12', '2015-06-16 17:18:59', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('13', '2015-06-16 17:19:18', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('14', '2015-06-16 17:20:18', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('15', '2015-06-16 17:20:37', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('16', '2015-06-16 17:20:57', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('17', '2015-06-16 21:13:03', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09_Simplified');
INSERT INTO `m_fealog` VALUES ('18', '2015-06-16 21:13:37', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', '0611_09_Simplified');
INSERT INTO `m_fealog` VALUES ('19', '2015-06-16 21:15:40', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', '0611_09_Simplified');
INSERT INTO `m_fealog` VALUES ('20', '2015-06-16 21:17:07', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '引脚成型', '0611_09_Simplified');
INSERT INTO `m_fealog` VALUES ('21', '2015-06-16 21:19:36', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', '0611_09_Simplified');
INSERT INTO `m_fealog` VALUES ('22', '2015-06-16 21:19:49', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09_Simplified');
INSERT INTO `m_fealog` VALUES ('23', '2015-06-16 21:21:51', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09_Simplified');
INSERT INTO `m_fealog` VALUES ('24', '2015-06-16 21:53:36', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('25', '2015-06-16 22:26:39', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('26', '2015-06-16 22:28:09', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('27', '2015-06-16 22:31:45', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('28', '2015-06-16 22:36:12', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('29', '2015-06-16 22:36:29', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('30', '2015-06-16 22:37:55', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('31', '2015-06-16 23:33:10', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('32', '2015-06-16 23:35:52', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '单板插拔', 'test');
INSERT INTO `m_fealog` VALUES ('33', '2015-06-16 23:39:43', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('34', '2015-06-16 23:51:51', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('35', '2015-06-16 23:52:05', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('36', '2015-06-16 23:59:07', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('37', '2015-06-17 00:01:34', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('38', '2015-06-17 00:05:38', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', 'test');
INSERT INTO `m_fealog` VALUES ('39', '2015-06-17 00:11:21', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('40', '2015-06-17 00:18:07', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('41', '2015-06-17 00:23:24', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('42', '2015-06-17 00:24:18', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('43', '2015-06-17 00:25:25', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('44', '2015-06-17 00:27:00', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('45', '2015-06-17 00:49:30', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('46', '2015-06-17 00:50:53', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');
INSERT INTO `m_fealog` VALUES ('47', '2015-06-17 00:53:36', '登陆', 'tommy', 'TOMMY-PC', 'tommy', null, '导热垫装配应力', '0611_09');

-- ----------------------------
-- Table structure for m_log
-- ----------------------------
DROP TABLE IF EXISTS `m_log`;
CREATE TABLE `m_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logtime` datetime DEFAULT NULL COMMENT '登陆时间',
  `loginfo` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `user` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户',
  `computer` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '计算机',
  `domainname` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '域用户',
  `version` int(11) DEFAULT NULL COMMENT '程序版本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_log
-- ----------------------------

-- ----------------------------
-- Table structure for m_update
-- ----------------------------
DROP TABLE IF EXISTS `m_update`;
CREATE TABLE `m_update` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FileName` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '文件名',
  `Version` int(4) DEFAULT NULL COMMENT '版本',
  `path` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '路径',
  `attachment` longblob COMMENT '附件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_update
-- ----------------------------

-- ----------------------------
-- Table structure for systemparams
-- ----------------------------
DROP TABLE IF EXISTS `systemparams`;
CREATE TABLE `systemparams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `Value` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='系统信息定义|EDITLEVEL=2';

-- ----------------------------
-- Records of systemparams
-- ----------------------------
INSERT INTO `systemparams` VALUES ('1', 'SMTPHost', 'smtp.qq.com');
INSERT INTO `systemparams` VALUES ('2', 'SMTPPort', '25');
INSERT INTO `systemparams` VALUES ('3', 'ServerDocPath', 'd:\\DFRTest\\');
INSERT INTO `systemparams` VALUES ('5', 'SMDPackageType', '(STC*)^(SR*)^(SPM*)^(SPL*)^(SOT*)^(SMD*)^(SL*)^(SID*)^(SDI*)^(SC*)^(JBGA*)^(MLF*)');
INSERT INTO `systemparams` VALUES ('6', 'PTHPackageType', '(SIP*)^(SCOX*)^(SCAP*)^(PWC*)^(PAM*)');
INSERT INTO `systemparams` VALUES ('7', 'SecondaryPower', 'PW');
INSERT INTO `systemparams` VALUES ('8', 'ServerSharePath', 'd:\\DFRTest\\');

-- ----------------------------
-- Table structure for t_mat
-- ----------------------------
DROP TABLE IF EXISTS `t_mat`;
CREATE TABLE `t_mat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建)',
  `MatName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '材料名称',
  `Description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '材料描述',
  `YoungModulus` double(4,0) DEFAULT NULL COMMENT '弹性模量',
  `PRation` double(4,0) DEFAULT NULL COMMENT '泊松比',
  `Yield` double(4,0) DEFAULT NULL COMMENT '屈服强度',
  `Strain_Stress` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '应力应变曲线',
  `CTE` double DEFAULT NULL COMMENT '热膨胀系数',
  `Creep` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '蠕变数据',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='材料数据|EDITLEVEL=1';

-- ----------------------------
-- Records of t_mat
-- ----------------------------
INSERT INTO `t_mat` VALUES ('1', '22', '22', '22', '22', '22', '22', '22', '22');

-- ----------------------------
-- Table structure for u_feauser
-- ----------------------------
DROP TABLE IF EXISTS `u_feauser`;
CREATE TABLE `u_feauser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `enabled` bit(1) DEFAULT NULL COMMENT '权限',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of u_feauser
-- ----------------------------
INSERT INTO `u_feauser` VALUES ('1', 'tommy', '');
INSERT INTO `u_feauser` VALUES ('2', 'test', '\0');

-- ----------------------------
-- Table structure for u_fmeaapprove
-- ----------------------------
DROP TABLE IF EXISTS `u_fmeaapprove`;
CREATE TABLE `u_fmeaapprove` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TaskName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务名',
  `subTaskName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '子任务名',
  `Owner` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审专家',
  `Status` varchar(20) CHARACTER SET utf8 DEFAULT 'NotStarted' COMMENT '状态',
  `Comment` longtext CHARACTER SET utf8 COMMENT '评审意见',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='FMEA专家评审|EDITLEVEL=1';

-- ----------------------------
-- Records of u_fmeaapprove
-- ----------------------------
INSERT INTO `u_fmeaapprove` VALUES ('1', 'Debug_V01R01C01', 'FMEAAPPROVE', 'Tommy', '已完成', 'OK,meiyoujijian');
INSERT INTO `u_fmeaapprove` VALUES ('2', 'Test12_V01R01C01', 'FMEAAPPROVE', 'Slingy', '已完成', 'ok,没有意见');
INSERT INTO `u_fmeaapprove` VALUES ('3', 'test013_V01R01C01', 'FMEAAPPROVE', 'Slingy', '已完成', 'OK,没有意见');
INSERT INTO `u_fmeaapprove` VALUES ('4', 'Test014_V01R01C01', 'FMEAAPPROVE', 'Slingy', '已完成', 'OK,没有意见');
INSERT INTO `u_fmeaapprove` VALUES ('5', 'Test02_V01R01C01', 'FMEAAPPROVE', 'Slingy', '已完成', 'sfdsdf dfdfdf');

-- ----------------------------
-- Table structure for u_fmeadetail
-- ----------------------------
DROP TABLE IF EXISTS `u_fmeadetail`;
CREATE TABLE `u_fmeadetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建)',
  `TaskName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务名称',
  `SubTaskName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '子任务名称',
  `Type` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '风险来源',
  `Code` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '编号',
  `Product` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'PCB编码',
  `Class` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '风险大类',
  `FMEA_Sev` int(4) DEFAULT '1' COMMENT '严重性',
  `FMEA_Occ` int(4) DEFAULT '1' COMMENT '发生几率 ',
  `FMEA_Det` int(4) DEFAULT '1' COMMENT '可检测性',
  `FMEA_Effect` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '潜在影响 ',
  `FMEA_Mode` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '失效模式 ',
  `FMEA_Reason` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '潜在原因',
  `FMEA_ProposalGroup` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '建议行动分组',
  `FMEA_Proposal` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '建议行动 ',
  `FMEAItemOwner` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '责任人',
  `FMEAItemApprover` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '责任专家',
  `FMEAItemStartDate` date DEFAULT NULL COMMENT '起始日期',
  `FMEAItemEndDate` date DEFAULT NULL COMMENT '子任务终止日期',
  `FMEAItemRealDate` date DEFAULT NULL COMMENT '实际完成日期',
  `FMEAItemStatus` varchar(50) CHARACTER SET utf8 DEFAULT 'OPEN' COMMENT '状态',
  `FMEAItemDescription` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '相关说明',
  `FMEAItemResult` longblob COMMENT '数据结果',
  `FMEAItemDoc` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '输出文档名',
  `FMEAItemConclusion` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA结论',
  `Filtered` bit(1) DEFAULT b'1' COMMENT '标识',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=198 DEFAULT CHARSET=latin1 COMMENT='FMEA细项|EDITLEVEL=1';

-- ----------------------------
-- Records of u_fmeadetail
-- ----------------------------
INSERT INTO `u_fmeadetail` VALUES ('1', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2004', '12345', '装配', '1', '3', '0', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '仿真分析', '单板跌落冲击', '申工  1111111', null, null, null, '2015-06-08', 'OPEN', null, null, '1_ICEPAK软件基础知识介绍.pdf', 'OPEN', '');
INSERT INTO `u_fmeadetail` VALUES ('2', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2002', '12345', '可靠性', '1', '3', '0', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '仿真分析', '单板跌落冲击', '李冬  2222222', null, null, null, null, 'OPEN', null, null, '2_公司Word模板.doc', null, '');
INSERT INTO `u_fmeadetail` VALUES ('3', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2014', '12345', '组装', '1', '4', '0', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '仿真分析', 'ICT测试', '彭胜勇  3333333', null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('4', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2027', '12345', '可靠性', '1', '5', '0', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '理论计算', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('5', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2030', '12345', '可靠性', '1', '4', '0', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '理论计算', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('6', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2035', '12345', '可靠性', '2', '5', '0', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('7', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2036', '12345', '可靠性', '2', '6', '0', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('8', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2043', '12345', '装配', '0', '4', '0', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '', '散热器装配后BGA应力风险具体评估', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('9', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2044', '12345', 'PCB', '0', '4', '0', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('10', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2045', '12345', '装配', '0', '5', '0', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('11', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2049', '12345', '组装', '0', '0', '0', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', '', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('12', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2050', '12345', '组装', '0', '0', '0', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('13', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2053', '12345', '组装', '0', '0', '0', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('14', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2059', '12345', '组装', '0', '0', '0', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('15', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2060', '12345', '组装', '0', '0', '0', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '仿真分析', '引脚成型', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('16', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2061', '12345', '可靠性', '0', '0', '0', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '理论计算', '', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('17', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2062', '12345', 'PCB', '0', '0', '0', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '仿真分析', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('18', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2063', '12345', 'PCB', '0', '0', '0', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('19', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2064', '12345', 'PCB', '0', '0', '0', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('20', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2065', '12345', 'PCB', '0', '0', '0', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('21', 'Debug_V01R01C01', 'FMEA', '自动识别风险', 'Debug_V01R01C01_2053', '12345', '', '0', '0', '0', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('22', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2004', '123456', '装配', '1', '7', '6', '二次电源模块XXXXXXXXXXXXX，防止分层', '二次电源模XXXXXXX止分层', 'XXXXXXX止分层', '专家意见', '11111', '李冬  2222222', null, null, null, '2015-06-08', 'CLOSED', null, null, '22_Flotherm软件基础知识介绍.pdf', 'fdsfs', '');
INSERT INTO `u_fmeadetail` VALUES ('23', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2002', '123456', '可制造性', '2', '7', '6', '使用压接型连接器时，要去PCB厚度>=XXXXXXXXXXXXX', 'XXXXXXX压接仞长度', 'XXXXXXX仞长度', '实验测试', '222', '彭胜勇  3333333', null, null, null, '2015-06-08', 'CLOSED', null, null, '23_修改岸边集装箱起重机集成开发分析平台技术合作项?', 'sdfds', '');
INSERT INTO `u_fmeadetail` VALUES ('24', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2023', '123456', '组装', '3', '7', '6', '导热垫的单边尺寸不能XXXXXXXXXXXXX散热器的有效', 'XXXXXXX者散热器的有效', 'XXXXXXX有效', '专家意见', '3333', '李冬  2222222', null, null, null, '2015-06-15', 'CLOSED', null, null, null, 'sdfds', '');
INSERT INTO `u_fmeadetail` VALUES ('25', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2027', '123456', '可靠性', '4', '7', '6', '板厚>=XXXXXXXXXXXXX单边禁止使用封装尺寸>=XXXXXXXXXXXXX器件和尺寸大于XXXXXXXXXXXXX陶瓷LGA器件。', 'XXXXXXX陶瓷LGA器件。', 'XXXXXXX陶瓷LGA器件。', '仿真分析', '单板跌落冲击', '申工  1111111', null, null, null, '2015-06-22', 'CLOSED', null, null, null, 'sdfds', '');
INSERT INTO `u_fmeadetail` VALUES ('26', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2030', '123456', '可靠性', '5', '7', '6', '不推荐使用尺寸大于XXXXXXXXXXXXXXXXX;边长>XXXXXXXXXXXXXQFN和XXXXXXXXXXXXXQFN,要求引脚焊点在50um以上', 'XXXXXXX引脚焊点在50um以上', 'XXXXXXX引脚焊点在XXXXXXX', '仿真分析', '单板模态', '李冬  2222222', null, null, null, '2015-06-23', 'CLOSED', null, null, null, 'ssdfds', '');
INSERT INTO `u_fmeadetail` VALUES ('27', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2035', '123456', '装配', '6', '5', '6', '光器件引脚成型要求【1】弯点距离器件本体>=XXXXXXX  【2】弯折半径R应满足要求', 'XXXXXXX弯折半径R应满足要求', 'XXXXXXX应满足要求', '仿真分析', 'ICT测试', '李冬  2222222', null, null, null, '2015-06-24', 'CLOSED', null, null, null, 'sdfdsefs', '');
INSERT INTO `u_fmeadetail` VALUES ('28', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2036', '123456', '可靠性', '6', '5', '6', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀XXXXXXX', 'XXXXXXX如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', 'XXXXXXX贴回流工艺的射频同轴连接器，功率等焊镀金器XXXXXXX', '理论计算', '55555', '申工  1111111', null, null, null, '2015-06-30', 'CLOSED', null, null, null, 'vsvv', '');
INSERT INTO `u_fmeadetail` VALUES ('29', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2039', '123456', 'PCB', '0', '5', '6', '对于联体散热器的安装安全距离要求：散热器跟周围器件的最小XXXXXXX', 'XXXXXXX20mm,散热器底面（包括散热）', 'XXXXXXX体散热器XXXXXXX（包括散热）', '实验测试', '对于联体散热器的安装安全距离要求：散热器跟周围器件的最小距离d2》20mm,散热器底面（包括散热）', '申工  1111111', null, null, null, '2015-06-25', 'CLOSED', null, null, null, 'efsfsd', '');
INSERT INTO `u_fmeadetail` VALUES ('30', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2040', '123456', 'PCB', '0', '0', '0', '对于联体散热器装配： 【1】 XXXXXXXXXXXXXX》支柱+导热联体散热器》XXXXXXX器                                                                           ', 'XXXXXXX弹簧浮动散热器》平板弹簧螺柱散热器                                                                           ', 'XXXXXXX簧螺柱散热器                                                                           ', '实验测试', '对于联体散热器装配： 【1】 对于联体散热器，在保证满足散热要求前提下，BGA散热器的优选顺序如下：支柱+导热疑胶联体散热器》支柱+导热联体散热器》主芯片弹簧浮动散热器》平板弹簧螺柱散热器                                                                                  【2】打楼灯过程中螺钉连接底部有支撑工装的情况下，由于螺钉装配过程电批、气批振动及压力对陶瓷电容。', '申工  1111111', null, null, null, '2015-06-29', 'CLOSED', null, null, null, 'sfevsfd', '');
INSERT INTO `u_fmeadetail` VALUES ('31', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2042', '123456', 'PCB', '0', '0', '0', '111', '33', '55', '', '多个芯片共用散热器场景使用导热疑胶，共用散热器需采用螺钉紧固方式，推荐采用台设计，螺柱限高方式', '申工  1111111', null, null, null, '2015-06-28', 'CLOSED', null, null, null, 'ereefe', '');
INSERT INTO `u_fmeadetail` VALUES ('32', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2043', '123456', 'PCB', '0', '0', '0', '222', '44', '66', '', '散热器装配后BGA应力风险具体评估', null, null, null, null, '2015-06-17', 'CLOSED', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('33', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2044', '123456', 'PCB', '0', '0', '0', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', null, null, null, null, null, 'CLOSED', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('34', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2045', '123456', 'PCB', '0', '0', '0', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', null, null, null, null, null, 'CLOSED', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('35', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2049', '123456', 'PCB', '0', '0', '0', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', '', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('36', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2050', '123456', 'PCB', '0', '0', '0', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('37', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2052', '123456', 'PCB', '0', '0', '0', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('38', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2053', '123456', 'PCB', '0', '0', '0', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('39', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2059', '123456', 'PCB', '0', '0', '0', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('40', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2060', '123456', '装配', '0', '0', '0', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('41', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2061', '123456', '可靠性', '0', '0', '0', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('42', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2062', '123456', '装配', '0', '0', '0', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('43', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2063', '123456', '可靠性', '0', '0', '0', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('44', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2064', '123456', '装配', '0', '0', '0', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('45', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2065', '123456', '可靠性', '0', '0', '0', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('46', 'Test12_V01R01C01', 'FMEA', '自动识别风险', 'Test12_V01R01C01_2053', '123456', '可靠性', '0', '0', '0', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('47', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2004', '123', 'PCB', '1', '1', '4', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '仿真分析', '单板模态', null, null, null, null, null, 'OPEN', null, null, '47_Flotherm软件基础知识介绍.pdf', 'CLOSED', '');
INSERT INTO `u_fmeadetail` VALUES ('48', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2002', '123', 'PCB', '2', '2', '5', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '仿真分析', '单板模态', null, null, null, null, null, 'OPEN', null, null, '48_公司Word模板.doc', null, '');
INSERT INTO `u_fmeadetail` VALUES ('49', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2023', '123', 'PCB', '4', '3', '5', '导热垫的单边尺寸不能超过芯片或者散热器的有效', '导热垫的单边尺寸不能超过芯片或者散热器的有效', '导热垫的单边尺寸不能超过芯片或者散热器的有效', '理论计算', '导热垫的单边尺寸不能超过芯片或者散热器的有效', null, null, null, null, null, 'OPEN', null, null, '49_公司管理架构.ppt', null, '');
INSERT INTO `u_fmeadetail` VALUES ('50', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2027', '123', 'PCB', '3', '0', '0', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '理论计算', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('51', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2030', '123', 'PCB', '0', '0', '0', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '仿真分析', 'ICT测试', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('52', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2035', '123', 'PCB', '0', '0', '0', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('53', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2036', '123', 'PCB', '0', '0', '0', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('54', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2043', '123', 'PCB', '0', '0', '0', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '', '散热器装配后BGA应力风险具体评估', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('55', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2044', '123', 'PCB', '0', '0', '0', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('56', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2045', '123', 'PCB', '0', '0', '0', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('57', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2046', '123', 'PCB', '0', '0', '0', '扣板与大板采用螺柱相连或者类似情景；螺柱和螺柱之间的陶瓷电容；磁珠等器件布局需要符合如下要求：【1】MLCC的轴向与螺钉孔连线垂直 【2】以螺钉孔中心为圆心的直接8.6mm区域禁步。【3】PCB和结构公差之和大于等于1mm时，螺柱中间高应力禁步参考下表', '扣板与大板采用螺柱相连或者类似情景；螺柱和螺柱之间的陶瓷电容；磁珠等器件布局需要符合如下要求：【1】MLCC的轴向与螺钉孔连线垂直 【2】以螺钉孔中心为圆心的直接8.6mm区域禁步。【3】PCB和结构公差之和大于等于1mm时，螺柱中间高应力禁步参考下表', '扣板与大板采用螺柱相连或者类似情景；螺柱和螺柱之间的陶瓷电容；磁珠等器件布局需要符合如下要求：【1】MLCC的轴向与螺钉孔连线垂直 【2】以螺钉孔中心为圆心的直接8.6mm区域禁步。【3】PCB和结构公差之和大于等于1mm时，螺柱中间高应力禁步参考下表', '', '扣板与大板采用螺柱相连或者类似情景；螺柱和螺柱之间的陶瓷电容；磁珠等器件布局需要符合如下要求：【1】MLCC的轴向与螺钉孔连线垂直 【2】以螺钉孔中心为圆心的直接8.6mm区域禁步。【3】PCB和结构公差之和大于等于1mm时，螺柱中间高应力禁步参考下表', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('58', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2049', '123', 'PCB', '0', '0', '0', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', '', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('59', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2050', '123', 'PCB', '0', '0', '0', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('60', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2052', '123', 'PCB', '0', '0', '0', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('61', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2053', '123', 'PCB', '0', '0', '0', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('62', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2056', '123', 'PCB', '0', '0', '0', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('63', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2057', '123', 'PCB', '0', '0', '0', '扣板插拔力较大连接器，丝印表面', '扣板插拔力较大连接器，丝印表面', '扣板插拔力较大连接器，丝印表面', '', '扣板插拔力较大连接器，丝印表面', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('64', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2058', '123', 'PCB', '0', '0', '0', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('65', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2059', '123', 'PCB', '0', '0', '0', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('66', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2060', '123', 'PCB', '0', '0', '0', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('67', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2061', '123', 'PCB', '0', '0', '0', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('68', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2062', '123', 'PCB', '0', '0', '0', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('69', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2063', '123', 'PCB', '0', '0', '0', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('70', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2064', '123', 'PCB', '0', '0', '0', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('71', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2065', '123', 'PCB', '0', '0', '0', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('72', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2053', '123', '', '0', '0', '0', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('73', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2004', '456', 'PCB', '0', '0', '0', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '', '二次电源模块内层残铜面积大于70%，防止分层', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('74', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2002', '456', 'PCB', '0', '0', '0', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('75', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2014', '456', 'PCB', '0', '0', '0', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('76', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2027', '456', 'PCB', '0', '0', '0', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('77', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2030', '456', 'PCB', '0', '0', '0', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('78', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2035', '456', 'PCB', '0', '0', '0', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('79', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2036', '456', 'PCB', '0', '0', '0', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('80', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2039', '456', 'PCB', '0', '0', '0', '对于联体散热器的安装安全距离要求：散热器跟周围器件的最小距离d2》20mm,散热器底面（包括散热）', '对于联体散热器的安装安全距离要求：散热器跟周围器件的最小距离d2》20mm,散热器底面（包括散热）', '对于联体散热器的安装安全距离要求：散热器跟周围器件的最小距离d2》20mm,散热器底面（包括散热）', '', '对于联体散热器的安装安全距离要求：散热器跟周围器件的最小距离d2》20mm,散热器底面（包括散热）', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('81', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2040', '456', 'PCB', '0', '0', '0', '对于联体散热器装配： 【1】 对于联体散热器，在保证满足散热要求前提下，BGA散热器的优选顺序如下：支柱+导热疑胶联体散热器》支柱+导热联体散热器》主芯片弹簧浮动散热器》平板弹簧螺柱散热器                                                                                  【2】打楼灯过程中螺钉连接底部有支撑工装的情况下，由于螺钉装配过程电批、气批振动及压力对陶瓷电容。', '对于联体散热器装配： 【1】 对于联体散热器，在保证满足散热要求前提下，BGA散热器的优选顺序如下：支柱+导热疑胶联体散热器》支柱+导热联体散热器》主芯片弹簧浮动散热器》平板弹簧螺柱散热器                                                                                  【2】打楼灯过程中螺钉连接底部有支撑工装的情况下，由于螺钉装配过程电批、气批振动及压力对陶瓷电容。', '对于联体散热器装配： 【1】 对于联体散热器，在保证满足散热要求前提下，BGA散热器的优选顺序如下：支柱+导热疑胶联体散热器》支柱+导热联体散热器》主芯片弹簧浮动散热器》平板弹簧螺柱散热器                                                                                  【2】打楼灯过程中螺钉连接底部有支撑工装的情况下，由于螺钉装配过程电批、气批振动及压力对陶瓷电容。', '', '对于联体散热器装配： 【1】 对于联体散热器，在保证满足散热要求前提下，BGA散热器的优选顺序如下：支柱+导热疑胶联体散热器》支柱+导热联体散热器》主芯片弹簧浮动散热器》平板弹簧螺柱散热器                                                                                  【2】打楼灯过程中螺钉连接底部有支撑工装的情况下，由于螺钉装配过程电批、气批振动及压力对陶瓷电容。', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('82', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2042', '456', 'PCB', '0', '0', '0', '多个芯片共用散热器场景使用导热疑胶，共用散热器需采用螺钉紧固方式，推荐采用台设计，螺柱限高方式', '多个芯片共用散热器场景使用导热疑胶，共用散热器需采用螺钉紧固方式，推荐采用台设计，螺柱限高方式', '多个芯片共用散热器场景使用导热疑胶，共用散热器需采用螺钉紧固方式，推荐采用台设计，螺柱限高方式', '', '多个芯片共用散热器场景使用导热疑胶，共用散热器需采用螺钉紧固方式，推荐采用台设计，螺柱限高方式', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('83', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2043', '456', 'PCB', '0', '0', '0', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '', '散热器装配后BGA应力风险具体评估', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('84', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2044', '456', 'PCB', '0', '0', '0', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('85', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2045', '456', 'PCB', '0', '0', '0', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('86', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2049', '456', 'PCB', '0', '0', '0', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', '', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('87', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2050', '456', 'PCB', '0', '0', '0', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('88', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2053', '456', 'PCB', '0', '0', '0', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('89', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2059', '456', 'PCB', '0', '0', '0', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('90', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2060', '456', '装配', '0', '0', '0', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('91', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2061', '456', '组装', '0', '0', '0', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('92', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2062', '456', '组装', '0', '0', '0', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('93', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2063', '456', '组装', '0', '0', '0', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('94', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2064', '456', '可制造性', '0', '0', '0', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('95', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2065', '456', '组装', '0', '0', '0', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('96', 'test013_V01R01C01', 'FMEA', '自动识别风险', 'test013_V01R01C01_2053', '456', '可靠性', '0', '0', '0', 'dfd', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('97', 'test013_V01R01C01', 'FMEA', '手动添加', null, '456', '可靠性', '0', '0', '0', 'dfd', 'dfd', 'dfd', null, null, null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('98', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2004', '12345', '装配', '1', '2', '3', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '', '二次电源模块内层残铜面积大于70%，防止分层', '申工  1111111', null, null, null, '2015-06-16', 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('99', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2002', '12345', '可靠性', '4', '3', '4', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '仿真分析', 'ICT测试', '李冬  2222222', null, null, null, '2015-06-25', 'OPEN', null, null, '99_Flotherm软件基础知识介绍.pdf', '水电费发送', '');
INSERT INTO `u_fmeadetail` VALUES ('100', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2023', '12345', '组装', '2', '4', '3', '导热垫的单边尺寸不能超过芯片或者散热器的有效', '导热垫的单边尺寸不能超过芯片或者散热器的有效', '导热垫的单边尺寸不能超过芯片或者散热器的有效', '理论计算', '导热垫的单边尺寸不能超过芯片或者散热器的有效', '彭胜勇  3333333', null, null, null, '2015-06-16', 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('101', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2027', '12345', '可靠性', '3', '4', '5', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '仿真分析', '导热垫装配应力', null, null, null, null, null, 'OPEN', null, null, '101_Thermal simulation Report for SHSS_V1.ppt', null, '');
INSERT INTO `u_fmeadetail` VALUES ('102', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2030', '12345', '组装', '5', '6', '7', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '仿真分析', '导热垫装配应力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('103', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2035', '12345', '组装', '0', '0', '0', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('104', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2036', '12345', '可靠性', '0', '0', '0', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('105', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2043', '12345', 'PCB', '0', '0', '0', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '', '散热器装配后BGA应力风险具体评估', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('106', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2044', '12345', 'PCB', '0', '0', '0', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('107', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2045', '12345', 'PCB', '0', '0', '0', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('108', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2046', '12345', 'PCB', '0', '0', '0', '扣板与大板采用螺柱相连或者类似情景；螺柱和螺柱之间的陶瓷电容；磁珠等器件布局需要符合如下要求：【1】MLCC的轴向与螺钉孔连线垂直 【2】以螺钉孔中心为圆心的直接8.6mm区域禁步。【3】PCB和结构公差之和大于等于1mm时，螺柱中间高应力禁步参考下表', '扣板与大板采用螺柱相连或者类似情景；螺柱和螺柱之间的陶瓷电容；磁珠等器件布局需要符合如下要求：【1】MLCC的轴向与螺钉孔连线垂直 【2】以螺钉孔中心为圆心的直接8.6mm区域禁步。【3】PCB和结构公差之和大于等于1mm时，螺柱中间高应力禁步参考下表', '扣板与大板采用螺柱相连或者类似情景；螺柱和螺柱之间的陶瓷电容；磁珠等器件布局需要符合如下要求：【1】MLCC的轴向与螺钉孔连线垂直 【2】以螺钉孔中心为圆心的直接8.6mm区域禁步。【3】PCB和结构公差之和大于等于1mm时，螺柱中间高应力禁步参考下表', '', '扣板与大板采用螺柱相连或者类似情景；螺柱和螺柱之间的陶瓷电容；磁珠等器件布局需要符合如下要求：【1】MLCC的轴向与螺钉孔连线垂直 【2】以螺钉孔中心为圆心的直接8.6mm区域禁步。【3】PCB和结构公差之和大于等于1mm时，螺柱中间高应力禁步参考下表', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('109', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2049', '12345', 'PCB', '0', '0', '0', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', '', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('110', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2050', '12345', 'PCB', '0', '0', '0', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('111', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2052', '12345', 'PCB', '0', '0', '0', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', '', '单板和结构件采用双面粘性导热垫黏结，返修时需要考虑单板与防火墙散热壳等结构件拆卸应力过大导致MICC、BGA陶瓷载板的晶振 磁珠  陶瓷功率电阻等应力敏感器件损坏风险', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('112', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2053', '12345', 'PCB', '0', '0', '0', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('113', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2056', '12345', 'PCB', '0', '0', '0', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('114', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2057', '12345', 'PCB', '0', '0', '0', '扣板插拔力较大连接器，丝印表面', '扣板插拔力较大连接器，丝印表面', '扣板插拔力较大连接器，丝印表面', '', '扣板插拔力较大连接器，丝印表面', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('115', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2058', '12345', 'PCB', '0', '0', '0', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', '', '扣板配合用300pin BGA连接器在一块扣板区域不能超过2个', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('116', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2059', '12345', 'PCB', '0', '0', '0', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('117', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2060', '12345', 'PCB', '0', '0', '0', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('118', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2061', '12345', 'PCB', '0', '0', '0', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('119', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2062', '12345', 'PCB', '0', '0', '0', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('120', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2063', '12345', 'PCB', '0', '0', '0', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('121', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2064', '12345', 'PCB', '0', '0', '0', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('122', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2065', '12345', 'PCB', '0', '0', '0', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('123', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2053', '12345', '', '0', '0', '0', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('124', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2004', '23456', 'PCB', '0', '0', '0', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '二次电源模块内层残铜面积大于70%，防止分层', '', '二次电源模块内层残铜面积大于70%，防止分层', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('125', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2002', '23456', 'PCB', '0', '0', '0', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('126', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2014', '23456', 'PCB', '0', '0', '0', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', '', '315胶使用要求：（1）不推荐用于裸芯片外露的器件散热装配；（2）芯片尺寸小于18*18mm，不推荐使用315胶粘接固定散热器，禁止不使用钢网手工刷胶（3）315导热胶只适用于室内产品，且要满足下面的条件：器件长期工作温度在负20度到120度的场景，器件短期工作温度小于125度', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('127', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2027', '23456', 'PCB', '0', '0', '0', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', '', '板厚>=20mm的系统类单边禁止使用封装尺寸>=18*18的LGA器件和尺寸大于7*7mm的陶瓷LGA器件。', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('128', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2030', '23456', 'PCB', '0', '0', '0', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', '', '不推荐使用尺寸大于10mm的塑封QFN;边长>=6mm的塑封QFN和5mm陶瓷QFN,要求引脚焊点在50um以上', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('129', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2034', '23456', 'PCB', '0', '0', '0', '裸硅片', '裸硅片', '裸硅片', '', '裸硅片', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('130', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2035', '23456', 'PCB', '0', '0', '0', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('131', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2036', '23456', 'PCB', '0', '0', '0', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('132', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2043', '23456', 'PCB', '0', '0', '0', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '', '散热器装配后BGA应力风险具体评估', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('133', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2044', '23456', 'PCB', '0', '0', '0', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('134', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2045', '23456', 'PCB', '0', '0', '0', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('135', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2049', '23456', 'PCB', '0', '0', '0', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', '', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('136', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2050', '23456', 'PCB', '0', '0', '0', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('137', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2051', '23456', 'PCB', '0', '0', '0', '裸硅片在封装体上方，如选用导热硅脂作为界面材料，不允许非对称安装散热器', '裸硅片在封装体上方，如选用导热硅脂作为界面材料，不允许非对称安装散热器', '裸硅片在封装体上方，如选用导热硅脂作为界面材料，不允许非对称安装散热器', '', '裸硅片在封装体上方，如选用导热硅脂作为界面材料，不允许非对称安装散热器', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('138', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2053', '23456', 'PCB', '0', '0', '0', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('139', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2059', '23456', 'PCB', '0', '0', '0', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('140', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2060', '23456', 'PCB', '0', '0', '0', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', null, null, null, null, null, 'OPEN', null, null, null, null, '\0');
INSERT INTO `u_fmeadetail` VALUES ('141', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2061', '23456', 'PCB', '0', '0', '0', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', null, null, null, null, null, 'OPEN', null, null, null, null, '\0');
INSERT INTO `u_fmeadetail` VALUES ('142', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2062', '23456', 'PCB', '0', '0', '0', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', null, null, null, null, null, 'OPEN', null, null, null, null, '\0');
INSERT INTO `u_fmeadetail` VALUES ('143', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2063', '23456', 'PCB', '0', '0', '0', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', null, null, null, null, null, 'OPEN', null, null, null, null, '\0');
INSERT INTO `u_fmeadetail` VALUES ('144', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2064', '23456', 'PCB', '0', '0', '0', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', null, null, null, null, null, 'OPEN', null, null, null, null, '\0');
INSERT INTO `u_fmeadetail` VALUES ('145', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2065', '23456', 'PCB', '0', '0', '0', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', null, null, null, null, null, 'OPEN', null, null, null, null, '\0');
INSERT INTO `u_fmeadetail` VALUES ('146', 'Test014_V01R01C01', 'FMEA', '自动识别风险', 'Test014_V01R01C01_2053', '23456', '', '0', '0', '0', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', null, null, null, null, null, 'OPEN', null, null, null, null, '\0');
INSERT INTO `u_fmeadetail` VALUES ('181', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2002', '11111', 'PCB', '1', '2', '3', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '使用压接型连接器时，要去PCB厚度>=连接器压接仞长度', '仿真分析', '导热垫装配应力', null, null, null, null, null, 'OPEN', null, null, '181_排风系统设计说明书.docx', null, '');
INSERT INTO `u_fmeadetail` VALUES ('182', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2035', '11111', 'PCB', '2', '2', '3', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', '理论计算', '光器件引脚成型要求【1】弯点距离器件本体>=0.8mm  【2】弯折半径R应满足要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('183', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2036', '11111', 'PCB', '1', '2', '3', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '焊点中金含量不高于4%重量比，避免焊点金翠风险；对应表贴回流工艺的射频同轴连接器，功率等焊镀金器件如果铜网开口设计1:1；要求Au镀层厚度<=1.5um', '实验测试', '测试标准', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('184', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2043', '11111', 'PCB', '2', '2', '3', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '散热器装配后BGA应力风险具体评估', '理论计算', '散热器装配后BGA应力风险具体评估', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('185', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2044', '11111', 'PCB', '1', '2', '3', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', '', '对应不同的应力敏感器件（陶瓷电容，磁珠，晶振或BGA焊点），布局时应远距离压接连接器，降低压接过程中带来的应力风险。具体进步去请参考下表：【1】采用手板压接机，Tox压接机，万能底模生产条件的单板', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('186', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2045', '11111', 'PCB', '1', '2', '3', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', '', '陶瓷电容不要布局在PCB刚性强弱过渡区，以防止此版不当发生过应力失效', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('187', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2049', '11111', 'PCB', '2', '2', '3', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', '', 'PCB上表贴磁芯，（PCB开槽实现磁芯下沉），禁止底部有导热垫等让焊点受力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('188', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2050', '11111', 'PCB', '1', '2', '3', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', '', '对盒式以及带防火板等结构复杂的单板，单板几何外形的边中心，角，面中心都应加螺钉紧固连接到结构件上。重器件周围至少用3个固定点与结构件连接。中器件处于3个固定点定义的面积内', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('189', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2053', '11111', 'PCB', '2', '2', '3', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', '', '对于压敏电阻传感器，电池等插件器件；参考附件Excel表格判断其在随机振动中引脚断裂风险，若计算结果为“危险”点胶等固贴措施；飞线或径向装电容，立装线等不稳固   器件焊接后需要辅助固定', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('190', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2059', '11111', 'PCB', '1', '2', '3', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', '', '对于G652，G657光纤，进行盘纤时，最小盘半径满足其寿命要求，推荐最小弯曲半径大于15mm。光纤弯曲直径--寿命计算公式', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('191', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2060', '11111', 'PCB', '2', '2', '3', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', '', '双单板或者大铁板装载单板入滑槽场景： 【1】6U单板在平行于连接器水平方向布置大于等于2个螺柱，9U单板在平行于连接器水平方向均匀布置大于等于3个螺柱，尽量在一条直线上', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('192', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2061', '11111', 'PCB', '1', '2', '3', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', '', '双单板间通过螺柱固定再插入背板时，推荐在上下两个单板增加导套以加强背板插波的导向能力', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('193', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2062', '11111', 'PCB', '2', '2', '3', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', '', '插框式单板板与背板连接的连接器长度总和（L1+L2-Ln）占板边长度L比例超过90%，BGA器件边缘与连接器之间的距离d必须满足相应要求', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('194', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2063', '11111', 'PCB', '2', '2', '3', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', '', '单板设计时，焊点有过压风险，需采用焊点变形工具进行计算，确保焊点承压规格需满足单面寿命设计要求。同时固定方式的选择需要保证芯片周围PCB的应变小于6000；避免出现树脂裂痕', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('195', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2064', '11111', 'PCB', '2', '2', '3', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', '', '单板上螺钉布局及质量保证单板整体刚度分布均匀，避免BGA四角刚度分布不均造成BGA焊球应力集中', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('196', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2065', '11111', 'PCB', '2', '2', '3', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', '', '对于与背板连接插在机框的单板结构，需要保证连接的位置足够，刚度分布均匀。为了避免应力集中，对于插在背板的单板，导槽应采用全导槽，对于《9U的单板建议在背板连接位置和拉手条位置至少各在两角连接拉手位置，设置两个到校。对于>=9U单板，建议拉手条两角及边中心连接三个位置，在背板的两角及中心至至少设置三个导销', null, null, null, null, null, 'OPEN', null, null, null, null, '');
INSERT INTO `u_fmeadetail` VALUES ('197', 'Test02_V01R01C01', 'FMEA', '自动识别风险', 'Test02_V01R01C01_2053', '11111', '', '2', '2', '3', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', '', '框式产品，单板不能互换槽位，产品设计不能避免插错槽位;防误插针或插块或扣板', null, null, null, null, null, 'OPEN', null, null, null, null, '');

-- ----------------------------
-- Table structure for u_fmearating
-- ----------------------------
DROP TABLE IF EXISTS `u_fmearating`;
CREATE TABLE `u_fmearating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `TaskName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品名称',
  `subTaskName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '子任务名',
  `Code` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT 'FMEA编码',
  `Owner` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '评分专家',
  `Status` varchar(20) CHARACTER SET utf8 DEFAULT 'NotStarted' COMMENT '状态',
  `FMEA_SEV` int(4) DEFAULT '0' COMMENT '严重性',
  `FMEA_OCC` int(4) DEFAULT '0' COMMENT '发生几率',
  `FMEA_DET` int(4) DEFAULT '0' COMMENT '可检测性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=latin1 COMMENT='FMEA打分|EDITLEVEL=1';

-- ----------------------------
-- Records of u_fmearating
-- ----------------------------
INSERT INTO `u_fmearating` VALUES ('1', 'Debug_V01R01C01', 'FMEA', '1', 'Tommy', '已完成', '1', '3', '0');
INSERT INTO `u_fmearating` VALUES ('2', 'Debug_V01R01C01', 'FMEA', '2', 'Tommy', '已完成', '1', '3', '0');
INSERT INTO `u_fmearating` VALUES ('3', 'Debug_V01R01C01', 'FMEA', '3', 'Tommy', '已完成', '1', '4', '0');
INSERT INTO `u_fmearating` VALUES ('4', 'Debug_V01R01C01', 'FMEA', '4', 'Tommy', '已完成', '1', '5', '0');
INSERT INTO `u_fmearating` VALUES ('5', 'Debug_V01R01C01', 'FMEA', '5', 'Tommy', '已完成', '1', '4', '0');
INSERT INTO `u_fmearating` VALUES ('6', 'Debug_V01R01C01', 'FMEA', '6', 'Tommy', '已完成', '2', '5', '0');
INSERT INTO `u_fmearating` VALUES ('7', 'Debug_V01R01C01', 'FMEA', '7', 'Tommy', '已完成', '2', '6', '0');
INSERT INTO `u_fmearating` VALUES ('8', 'Debug_V01R01C01', 'FMEA', '8', 'Tommy', '已完成', '0', '4', '0');
INSERT INTO `u_fmearating` VALUES ('9', 'Debug_V01R01C01', 'FMEA', '9', 'Tommy', '已完成', '0', '4', '0');
INSERT INTO `u_fmearating` VALUES ('10', 'Debug_V01R01C01', 'FMEA', '10', 'Tommy', '已完成', '0', '5', '0');
INSERT INTO `u_fmearating` VALUES ('11', 'Debug_V01R01C01', 'FMEA', '11', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('12', 'Debug_V01R01C01', 'FMEA', '12', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('13', 'Debug_V01R01C01', 'FMEA', '13', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('14', 'Debug_V01R01C01', 'FMEA', '14', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('15', 'Debug_V01R01C01', 'FMEA', '15', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('16', 'Debug_V01R01C01', 'FMEA', '16', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('17', 'Debug_V01R01C01', 'FMEA', '17', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('18', 'Debug_V01R01C01', 'FMEA', '18', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('19', 'Debug_V01R01C01', 'FMEA', '19', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('20', 'Debug_V01R01C01', 'FMEA', '20', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('21', 'Debug_V01R01C01', 'FMEA', '21', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('22', 'Test12_V01R01C01', 'FMEA', '22', 'Tommy', '已完成', '1', '7', '6');
INSERT INTO `u_fmearating` VALUES ('23', 'Test12_V01R01C01', 'FMEA', '23', 'Tommy', '已完成', '2', '7', '6');
INSERT INTO `u_fmearating` VALUES ('24', 'Test12_V01R01C01', 'FMEA', '24', 'Tommy', '已完成', '3', '7', '6');
INSERT INTO `u_fmearating` VALUES ('25', 'Test12_V01R01C01', 'FMEA', '25', 'Tommy', '已完成', '4', '7', '6');
INSERT INTO `u_fmearating` VALUES ('26', 'Test12_V01R01C01', 'FMEA', '26', 'Tommy', '已完成', '5', '7', '6');
INSERT INTO `u_fmearating` VALUES ('27', 'Test12_V01R01C01', 'FMEA', '27', 'Tommy', '已完成', '6', '5', '6');
INSERT INTO `u_fmearating` VALUES ('28', 'Test12_V01R01C01', 'FMEA', '28', 'Tommy', '已完成', '6', '5', '6');
INSERT INTO `u_fmearating` VALUES ('29', 'Test12_V01R01C01', 'FMEA', '29', 'Tommy', '已完成', '0', '5', '6');
INSERT INTO `u_fmearating` VALUES ('30', 'Test12_V01R01C01', 'FMEA', '30', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('31', 'Test12_V01R01C01', 'FMEA', '31', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('32', 'Test12_V01R01C01', 'FMEA', '32', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('33', 'Test12_V01R01C01', 'FMEA', '33', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('34', 'Test12_V01R01C01', 'FMEA', '34', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('35', 'Test12_V01R01C01', 'FMEA', '35', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('36', 'Test12_V01R01C01', 'FMEA', '36', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('37', 'Test12_V01R01C01', 'FMEA', '37', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('38', 'Test12_V01R01C01', 'FMEA', '38', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('39', 'Test12_V01R01C01', 'FMEA', '39', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('40', 'Test12_V01R01C01', 'FMEA', '40', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('41', 'Test12_V01R01C01', 'FMEA', '41', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('42', 'Test12_V01R01C01', 'FMEA', '42', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('43', 'Test12_V01R01C01', 'FMEA', '43', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('44', 'Test12_V01R01C01', 'FMEA', '44', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('45', 'Test12_V01R01C01', 'FMEA', '45', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('46', 'Test12_V01R01C01', 'FMEA', '46', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('47', 'test013_V01R01C01', 'FMEA', '47', 'Tommy', '已完成', '1', '1', '4');
INSERT INTO `u_fmearating` VALUES ('48', 'test013_V01R01C01', 'FMEA', '48', 'Tommy', '已完成', '2', '2', '5');
INSERT INTO `u_fmearating` VALUES ('49', 'test013_V01R01C01', 'FMEA', '49', 'Tommy', '已完成', '4', '3', '5');
INSERT INTO `u_fmearating` VALUES ('50', 'test013_V01R01C01', 'FMEA', '50', 'Tommy', '已完成', '3', '0', '0');
INSERT INTO `u_fmearating` VALUES ('51', 'test013_V01R01C01', 'FMEA', '51', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('52', 'test013_V01R01C01', 'FMEA', '52', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('53', 'test013_V01R01C01', 'FMEA', '53', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('54', 'test013_V01R01C01', 'FMEA', '54', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('55', 'test013_V01R01C01', 'FMEA', '55', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('56', 'test013_V01R01C01', 'FMEA', '56', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('57', 'test013_V01R01C01', 'FMEA', '57', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('58', 'test013_V01R01C01', 'FMEA', '58', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('59', 'test013_V01R01C01', 'FMEA', '59', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('60', 'test013_V01R01C01', 'FMEA', '60', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('61', 'test013_V01R01C01', 'FMEA', '61', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('62', 'test013_V01R01C01', 'FMEA', '62', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('63', 'test013_V01R01C01', 'FMEA', '63', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('64', 'test013_V01R01C01', 'FMEA', '64', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('65', 'test013_V01R01C01', 'FMEA', '65', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('66', 'test013_V01R01C01', 'FMEA', '66', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('67', 'test013_V01R01C01', 'FMEA', '67', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('68', 'test013_V01R01C01', 'FMEA', '68', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('69', 'test013_V01R01C01', 'FMEA', '69', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('70', 'test013_V01R01C01', 'FMEA', '70', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('71', 'test013_V01R01C01', 'FMEA', '71', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('72', 'test013_V01R01C01', 'FMEA', '72', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('73', 'test013_V01R01C01', 'FMEA', '73', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('74', 'test013_V01R01C01', 'FMEA', '74', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('75', 'test013_V01R01C01', 'FMEA', '75', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('76', 'test013_V01R01C01', 'FMEA', '76', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('77', 'test013_V01R01C01', 'FMEA', '77', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('78', 'test013_V01R01C01', 'FMEA', '78', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('79', 'test013_V01R01C01', 'FMEA', '79', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('80', 'test013_V01R01C01', 'FMEA', '80', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('81', 'test013_V01R01C01', 'FMEA', '81', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('82', 'test013_V01R01C01', 'FMEA', '82', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('83', 'test013_V01R01C01', 'FMEA', '83', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('84', 'test013_V01R01C01', 'FMEA', '84', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('85', 'test013_V01R01C01', 'FMEA', '85', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('86', 'test013_V01R01C01', 'FMEA', '86', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('87', 'test013_V01R01C01', 'FMEA', '87', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('88', 'test013_V01R01C01', 'FMEA', '88', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('89', 'test013_V01R01C01', 'FMEA', '89', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('90', 'test013_V01R01C01', 'FMEA', '90', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('91', 'test013_V01R01C01', 'FMEA', '91', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('92', 'test013_V01R01C01', 'FMEA', '92', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('93', 'test013_V01R01C01', 'FMEA', '93', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('94', 'test013_V01R01C01', 'FMEA', '94', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('95', 'test013_V01R01C01', 'FMEA', '95', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('96', 'test013_V01R01C01', 'FMEA', '96', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('97', 'test013_V01R01C01', 'FMEA', '97', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('98', 'Test014_V01R01C01', 'FMEA', '98', 'Tommy', '已完成', '1', '2', '3');
INSERT INTO `u_fmearating` VALUES ('99', 'Test014_V01R01C01', 'FMEA', '99', 'Tommy', '已完成', '4', '3', '4');
INSERT INTO `u_fmearating` VALUES ('100', 'Test014_V01R01C01', 'FMEA', '100', 'Tommy', '已完成', '2', '4', '3');
INSERT INTO `u_fmearating` VALUES ('101', 'Test014_V01R01C01', 'FMEA', '101', 'Tommy', '已完成', '3', '4', '5');
INSERT INTO `u_fmearating` VALUES ('102', 'Test014_V01R01C01', 'FMEA', '102', 'Tommy', '已完成', '5', '6', '7');
INSERT INTO `u_fmearating` VALUES ('103', 'Test014_V01R01C01', 'FMEA', '103', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('104', 'Test014_V01R01C01', 'FMEA', '104', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('105', 'Test014_V01R01C01', 'FMEA', '105', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('106', 'Test014_V01R01C01', 'FMEA', '106', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('107', 'Test014_V01R01C01', 'FMEA', '107', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('108', 'Test014_V01R01C01', 'FMEA', '108', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('109', 'Test014_V01R01C01', 'FMEA', '109', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('110', 'Test014_V01R01C01', 'FMEA', '110', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('111', 'Test014_V01R01C01', 'FMEA', '111', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('112', 'Test014_V01R01C01', 'FMEA', '112', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('113', 'Test014_V01R01C01', 'FMEA', '113', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('114', 'Test014_V01R01C01', 'FMEA', '114', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('115', 'Test014_V01R01C01', 'FMEA', '115', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('116', 'Test014_V01R01C01', 'FMEA', '116', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('117', 'Test014_V01R01C01', 'FMEA', '117', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('118', 'Test014_V01R01C01', 'FMEA', '118', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('119', 'Test014_V01R01C01', 'FMEA', '119', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('120', 'Test014_V01R01C01', 'FMEA', '120', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('121', 'Test014_V01R01C01', 'FMEA', '121', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('122', 'Test014_V01R01C01', 'FMEA', '122', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('123', 'Test014_V01R01C01', 'FMEA', '123', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('124', 'Test014_V01R01C01', 'FMEA', '124', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('125', 'Test014_V01R01C01', 'FMEA', '125', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('126', 'Test014_V01R01C01', 'FMEA', '126', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('127', 'Test014_V01R01C01', 'FMEA', '127', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('128', 'Test014_V01R01C01', 'FMEA', '128', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('129', 'Test014_V01R01C01', 'FMEA', '129', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('130', 'Test014_V01R01C01', 'FMEA', '130', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('131', 'Test014_V01R01C01', 'FMEA', '131', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('132', 'Test014_V01R01C01', 'FMEA', '132', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('133', 'Test014_V01R01C01', 'FMEA', '133', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('134', 'Test014_V01R01C01', 'FMEA', '134', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('135', 'Test014_V01R01C01', 'FMEA', '135', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('136', 'Test014_V01R01C01', 'FMEA', '136', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('137', 'Test014_V01R01C01', 'FMEA', '137', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('138', 'Test014_V01R01C01', 'FMEA', '138', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('139', 'Test014_V01R01C01', 'FMEA', '139', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('140', 'Test014_V01R01C01', 'FMEA', '140', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('141', 'Test014_V01R01C01', 'FMEA', '141', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('142', 'Test014_V01R01C01', 'FMEA', '142', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('143', 'Test014_V01R01C01', 'FMEA', '143', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('144', 'Test014_V01R01C01', 'FMEA', '144', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('145', 'Test014_V01R01C01', 'FMEA', '145', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('146', 'Test014_V01R01C01', 'FMEA', '146', 'Tommy', '已完成', '0', '0', '0');
INSERT INTO `u_fmearating` VALUES ('147', 'Test02_V01R01C01', 'FMEA', '181', 'Tommy', '已完成', '1', '2', '3');
INSERT INTO `u_fmearating` VALUES ('148', 'Test02_V01R01C01', 'FMEA', '182', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('149', 'Test02_V01R01C01', 'FMEA', '183', 'Tommy', '已完成', '1', '2', '3');
INSERT INTO `u_fmearating` VALUES ('150', 'Test02_V01R01C01', 'FMEA', '184', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('151', 'Test02_V01R01C01', 'FMEA', '185', 'Tommy', '已完成', '1', '2', '3');
INSERT INTO `u_fmearating` VALUES ('152', 'Test02_V01R01C01', 'FMEA', '186', 'Tommy', '已完成', '1', '2', '3');
INSERT INTO `u_fmearating` VALUES ('153', 'Test02_V01R01C01', 'FMEA', '187', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('154', 'Test02_V01R01C01', 'FMEA', '188', 'Tommy', '已完成', '1', '2', '3');
INSERT INTO `u_fmearating` VALUES ('155', 'Test02_V01R01C01', 'FMEA', '189', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('156', 'Test02_V01R01C01', 'FMEA', '190', 'Tommy', '已完成', '1', '2', '3');
INSERT INTO `u_fmearating` VALUES ('157', 'Test02_V01R01C01', 'FMEA', '191', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('158', 'Test02_V01R01C01', 'FMEA', '192', 'Tommy', '已完成', '1', '2', '3');
INSERT INTO `u_fmearating` VALUES ('159', 'Test02_V01R01C01', 'FMEA', '193', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('160', 'Test02_V01R01C01', 'FMEA', '194', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('161', 'Test02_V01R01C01', 'FMEA', '195', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('162', 'Test02_V01R01C01', 'FMEA', '196', 'Tommy', '已完成', '2', '2', '3');
INSERT INTO `u_fmearating` VALUES ('163', 'Test02_V01R01C01', 'FMEA', '197', 'Tommy', '已完成', '2', '2', '3');

-- ----------------------------
-- Table structure for u_reportapprove
-- ----------------------------
DROP TABLE IF EXISTS `u_reportapprove`;
CREATE TABLE `u_reportapprove` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT ' 编码(系统内建)',
  `TaskName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务名',
  `subTaskName` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '子任务名',
  `Owner` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '评审专家',
  `Status` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `Comment` longtext CHARACTER SET utf8,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COMMENT='报告评审|EDITLEVEL=1';

-- ----------------------------
-- Records of u_reportapprove
-- ----------------------------
INSERT INTO `u_reportapprove` VALUES ('1', 'Debug_V01R01C01', 'REPORT', 'Tommy', '已完成', 'OK,没意见');
INSERT INTO `u_reportapprove` VALUES ('2', 'test013_V01R01C01', 'REPORT', 'Tommy', '已完成', 'OK');
INSERT INTO `u_reportapprove` VALUES ('3', 'Test014_V01R01C01', 'REPORT', 'Tommy', '已完成', 'dsfdfdfddd');
INSERT INTO `u_reportapprove` VALUES ('4', 'Test02_V01R01C01', 'REPORT', 'Tommy', '已完成', 'sfdsfdsf');

-- ----------------------------
-- Table structure for u_right_action
-- ----------------------------
DROP TABLE IF EXISTS `u_right_action`;
CREATE TABLE `u_right_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建)',
  `RightName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限名称',
  `ActionName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '功能名称',
  PRIMARY KEY (`ID`),
  KEY `id` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1 COMMENT='权限功能映射库|EDITLEVEL=2';

-- ----------------------------
-- Records of u_right_action
-- ----------------------------
INSERT INTO `u_right_action` VALUES ('81', '数据管理员', 'A_SaveNewTask');
INSERT INTO `u_right_action` VALUES ('82', '数据管理员', 'A_EditTask');
INSERT INTO `u_right_action` VALUES ('83', '数据管理员', 'A_ViewTask');
INSERT INTO `u_right_action` VALUES ('84', '数据管理员', 'A_DeleteTask');
INSERT INTO `u_right_action` VALUES ('85', '数据管理员', 'A_ChangeUser');
INSERT INTO `u_right_action` VALUES ('86', '数据管理员', 'A_TB');
INSERT INTO `u_right_action` VALUES ('87', '数据管理员', 'A_SB');
INSERT INTO `u_right_action` VALUES ('88', '数据管理员', 'A_EmailServer');
INSERT INTO `u_right_action` VALUES ('89', '数据管理员', 'A_UserManager');
INSERT INTO `u_right_action` VALUES ('90', '数据管理员', 'A_EditUser');
INSERT INTO `u_right_action` VALUES ('91', '数据管理员', 'A_RightControl');
INSERT INTO `u_right_action` VALUES ('92', '数据管理员', 'A_CloseFunc');
INSERT INTO `u_right_action` VALUES ('93', '数据管理员', 'A_Exit');
INSERT INTO `u_right_action` VALUES ('94', '数据管理员', 'A_About');
INSERT INTO `u_right_action` VALUES ('95', '数据管理员', 'A_ViewAllTask');
INSERT INTO `u_right_action` VALUES ('96', '数据管理员', 'A_RuleQuery');
INSERT INTO `u_right_action` VALUES ('118', '主设计师', 'A_ChangeUser');
INSERT INTO `u_right_action` VALUES ('119', '主设计师', 'A_UserManager');
INSERT INTO `u_right_action` VALUES ('120', '主设计师', 'A_ViewAllTask');
INSERT INTO `u_right_action` VALUES ('121', '主设计师', 'A_RuleQuery');
INSERT INTO `u_right_action` VALUES ('122', '单板首席', 'A_SaveNewTask');
INSERT INTO `u_right_action` VALUES ('123', '单板首席', 'A_EditTask');
INSERT INTO `u_right_action` VALUES ('124', '单板首席', 'A_ViewTask');
INSERT INTO `u_right_action` VALUES ('125', '单板首席', 'A_DeleteTask');
INSERT INTO `u_right_action` VALUES ('126', '单板首席', 'A_ChangeUser');
INSERT INTO `u_right_action` VALUES ('127', '单板首席', 'A_TB');
INSERT INTO `u_right_action` VALUES ('128', '单板首席', 'A_SB');
INSERT INTO `u_right_action` VALUES ('129', '单板首席', 'A_EmailServer');
INSERT INTO `u_right_action` VALUES ('130', '单板首席', 'A_UserManager');
INSERT INTO `u_right_action` VALUES ('131', '单板首席', 'A_EditUser');
INSERT INTO `u_right_action` VALUES ('132', '单板首席', 'A_RightControl');
INSERT INTO `u_right_action` VALUES ('133', '单板首席', 'A_CloseFunc');
INSERT INTO `u_right_action` VALUES ('134', '单板首席', 'A_Exit');
INSERT INTO `u_right_action` VALUES ('135', '基础工艺', 'A_ViewTask');
INSERT INTO `u_right_action` VALUES ('136', '基础工艺', 'A_Exit');
INSERT INTO `u_right_action` VALUES ('137', '基础工艺', 'A_About');

-- ----------------------------
-- Table structure for u_r_pcb_product
-- ----------------------------
DROP TABLE IF EXISTS `u_r_pcb_product`;
CREATE TABLE `u_r_pcb_product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TaskName` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品名称',
  `PCBCode` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'PCB编码',
  `PCBDescription` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'PCB描述',
  `Brd_LocalPath` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'Brd存储路径',
  `Bom_LocalPath` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Input_LocalPath` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Attachment` longblob,
  `InputFlag` bit(1) DEFAULT NULL,
  `DFRFlag` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of u_r_pcb_product
-- ----------------------------
INSERT INTO `u_r_pcb_product` VALUES ('19', 'Test0605_V01R01C01', '111234', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\深圳有限元\\深圳有限元\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\Test0605_V01R01C01\\Test0605_V01R01C01_111234_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('20', 'Test0606_V01R01C01', '1234', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\Test0606_V01R01C01\\Test0606_V01R01C01_1234_Input.xls', null, '', null);
INSERT INTO `u_r_pcb_product` VALUES ('21', 'Test0604_V01R01C02', '1112344', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\Test0604_V01R01C02\\Test0604_V01R01C02_1112344_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('22', 'test0607_V01R01C01', '112345', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\test0607_V01R01C01\\test0607_V01R01C01_112345_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('23', 'Debug_V01R01C01', '12345', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\Debug_V01R01C01\\Debug_V01R01C01_12345_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('24', 'Test02_V01R01C01', '11111', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\Test02_V01R01C01\\Test02_V01R01C01_11111_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('25', 'Test_V01R01C01', '11111', null, null, null, null, null, null, null);
INSERT INTO `u_r_pcb_product` VALUES ('26', 'Test12_V01R01C01', '123456', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\H3C\\H3CDFR\\Main\\Project\\Test12_V01R01C01\\Test12_V01R01C01_123456_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('27', 'test013_V01R01C01', '123', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\test013_V01R01C01\\test013_V01R01C01_123_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('28', 'test013_V01R01C01', '456', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\test013_V01R01C01\\test013_V01R01C01_456_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('29', 'Test014_V01R01C01', '12345', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\Test014_V01R01C01\\Test014_V01R01C01_12345_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('30', 'Test014_V01R01C01', '23456', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\Huawei\\IDSDFR\\Main\\Project\\Test014_V01R01C01\\Test014_V01R01C01_23456_Input.xls', null, '', '');
INSERT INTO `u_r_pcb_product` VALUES ('31', 'Test1234_V01R01C01', '1234', null, 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\Demo test.brd', 'E:\\Projects\\Program\\Demo&Help\\Demo\\DFRTest\\BOM.xls', 'E:\\Projects\\Program\\BuildingVersion\\YW\\Huawei\\IDSDFR\\Main\\Project\\Test1234_V01R01C01\\Test1234_V01R01C01_1234_Input.xls', null, '', null);

-- ----------------------------
-- Table structure for u_task
-- ----------------------------
DROP TABLE IF EXISTS `u_task`;
CREATE TABLE `u_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建)',
  `TaskName` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '任务名称',
  `TaskDescription` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务描述',
  `TaskOwner` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '任务责任人',
  `TaskStartDate` datetime DEFAULT NULL COMMENT '任务开始日期',
  `TaskEndDate` datetime DEFAULT NULL COMMENT '任务完成日期',
  `TaskRealDate` datetime DEFAULT NULL COMMENT '任务实际完成时间',
  `ProductCode` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品编码',
  `ProductType` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品类型',
  `ProductFamily` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品族',
  `Env` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '环境',
  `TaskDocID` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '总结报告',
  `FinalDocID` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `TaskStatus` int(20) DEFAULT '0' COMMENT '任务状态',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TaskName` (`TaskName`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1 COMMENT='任务|EDITLEVEL=1';

-- ----------------------------
-- Records of u_task
-- ----------------------------
INSERT INTO `u_task` VALUES ('64', 'Debug_V01R01C01', 'ddd', 'Admin', '2015-06-09 21:38:30', '2015-06-13 21:38:30', null, 'ddddd', '网络', '核心路由器', 'A', 'Debug_V01R01C01.doc', 'Debug_V01R01C01_Revised.doc', '3');
INSERT INTO `u_task` VALUES ('65', 'Test02_V01R01C01', 'sfsdfs', 'Admin', '2015-06-15 20:20:49', '2015-06-19 20:20:49', null, 'sdfsd', '网络', '核心路由器', 'A', 'Test02_V01R01C01.doc', 'Test02_V01R01C01_Revised.doc', '9');
INSERT INTO `u_task` VALUES ('66', 'Test_V01R01C01', 'dfdsfs', 'Admin', '2015-06-15 21:39:10', '2015-06-19 21:39:10', null, 'sdfdsfsd', '网络', '交换机', 'B', null, null, '0');
INSERT INTO `u_task` VALUES ('67', 'Test12_V01R01C01', 'sdfdsfds', 'Admin', '2015-06-15 21:41:06', '2015-06-19 21:41:06', null, 'sdfdsfs', '网络', '交换机', 'B', null, null, '7');
INSERT INTO `u_task` VALUES ('68', 'test013_V01R01C01', 'sdfds', 'Admin', '2015-06-15 23:41:39', '2015-06-19 23:41:39', null, 'sdfds', '网络', '核心路由器', 'A', 'test013_V01R01C01.doc', 'test013_V01R01C01_Revised.doc', '9');
INSERT INTO `u_task` VALUES ('69', 'Test014_V01R01C01', 'sfdsfsd', 'Admin', '2015-06-16 09:11:53', '2015-06-20 09:11:53', null, 'sdfdsf', '网络', '交换机', 'B', 'Test014_V01R01C01.doc', 'Test014_V01R01C01_Revised.doc', '9');
INSERT INTO `u_task` VALUES ('70', 'Test1234_V01R01C01', 'qqqq', 'Admin', '2015-08-23 02:46:36', '2015-08-27 02:46:36', null, 'qqqqq', '无线', 'TDD RRU', 'E', null, null, '2');

-- ----------------------------
-- Table structure for u_taskdetail
-- ----------------------------
DROP TABLE IF EXISTS `u_taskdetail`;
CREATE TABLE `u_taskdetail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建)',
  `TaskName` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '任务名称',
  `SubTaskID` int(4) DEFAULT NULL COMMENT '子任务顺序号',
  `SubTaskName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '子任务名称',
  `SubTaskOwner` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '子任务责任人',
  `SubTaskStartDate` date DEFAULT NULL COMMENT '子任务起始日期',
  `SubTaskEndDate` date DEFAULT NULL COMMENT '子任务终止日期',
  `SubTaskRealDate` datetime DEFAULT NULL COMMENT '子任务实际完成日期',
  `SubTaskStatus` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '子任务当前状态',
  `SubTaskDescription` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '子任务相关说明',
  `SubTaskResult` longblob COMMENT '子任务中间数据结果',
  `SubTaskDoc` int(11) DEFAULT NULL COMMENT '子任务中间输出文档编号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=latin1 COMMENT='任务细项|EDITLEVEL=1';

-- ----------------------------
-- Records of u_taskdetail
-- ----------------------------
INSERT INTO `u_taskdetail` VALUES ('418', 'Debug_V01R01C01', '1', 'INPUT', 'Admin', '2015-06-08', '2015-06-08', '2015-06-08 21:39:13', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('419', 'Debug_V01R01C01', '2', 'DFR', 'Admin', '2015-06-08', '2015-06-08', '2015-10-14 13:23:34', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('420', 'Debug_V01R01C01', '3', 'FMEARATING', 'Admin', '2015-06-08', '2015-06-08', '2015-06-13 23:36:53', '进行中', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('421', 'Debug_V01R01C01', '4', 'FMEAAPPROVE', 'Admin', '2015-06-08', '2015-06-08', '2015-06-13 23:38:14', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('422', 'Debug_V01R01C01', '5', 'FMEAREVISED', 'Admin', '2015-06-08', '2015-06-08', '2015-06-13 23:38:51', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('423', 'Debug_V01R01C01', '6', 'FMEARESULT', 'Admin', '2015-06-08', '2015-06-08', '2015-06-14 20:13:32', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('424', 'Debug_V01R01C01', '7', 'REPORT', 'Admin', '2015-06-08', '2015-06-08', '2015-06-14 20:18:57', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('425', 'Debug_V01R01C01', '8', 'REPORTAPPROVE', 'Admin', '2015-06-08', '2015-06-08', '2015-06-14 20:19:30', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('426', 'Test02_V01R01C01', '1', 'INPUT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 20:21:35', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('427', 'Test02_V01R01C01', '2', 'DFR', 'Admin', '2015-06-14', '2015-06-14', '2015-08-17 21:10:36', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('428', 'Test02_V01R01C01', '3', 'FMEARATING', 'Admin', '2015-06-14', '2015-06-14', '2015-08-17 21:10:52', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('429', 'Test02_V01R01C01', '4', 'FMEAAPPROVE', 'Admin', '2015-06-14', '2015-06-14', '2015-08-17 21:14:58', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('430', 'Test02_V01R01C01', '5', 'FMEAREVISED', 'Admin', '2015-06-14', '2015-06-14', '2015-08-17 21:29:16', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('431', 'Test02_V01R01C01', '6', 'FMEARESULT', 'Admin', '2015-06-14', '2015-06-14', '2015-08-17 21:40:33', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('432', 'Test02_V01R01C01', '7', 'REPORT', 'Admin', '2015-06-14', '2015-06-14', '2015-08-17 21:41:30', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('433', 'Test02_V01R01C01', '8', 'REPORTAPPROVE', 'Admin', '2015-06-14', '2015-06-14', '2015-08-17 21:42:16', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('434', 'Test_V01R01C01', '1', 'INPUT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '进行中', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('435', 'Test_V01R01C01', '2', 'DFR', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('436', 'Test_V01R01C01', '3', 'FMEARATING', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('437', 'Test_V01R01C01', '4', 'FMEAAPPROVE', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('438', 'Test_V01R01C01', '5', 'FMEAREVISED', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('439', 'Test_V01R01C01', '6', 'FMEARESULT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('440', 'Test_V01R01C01', '7', 'REPORT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('441', 'Test_V01R01C01', '8', 'REPORTAPPROVE', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('442', 'Test12_V01R01C01', '1', 'INPUT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 21:50:37', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('443', 'Test12_V01R01C01', '2', 'DFR', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 21:52:51', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('444', 'Test12_V01R01C01', '3', 'FMEARATING', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 21:54:58', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('445', 'Test12_V01R01C01', '4', 'FMEAAPPROVE', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 22:04:12', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('446', 'Test12_V01R01C01', '5', 'FMEAREVISED', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 22:05:09', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('447', 'Test12_V01R01C01', '6', 'FMEARESULT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 22:21:02', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('448', 'Test12_V01R01C01', '7', 'REPORT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '进行中', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('449', 'Test12_V01R01C01', '8', 'REPORTAPPROVE', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('450', 'test013_V01R01C01', '1', 'INPUT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 23:42:39', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('451', 'test013_V01R01C01', '2', 'DFR', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 23:44:33', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('452', 'test013_V01R01C01', '3', 'FMEARATING', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 23:45:10', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('453', 'test013_V01R01C01', '4', 'FMEAAPPROVE', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 23:46:11', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('454', 'test013_V01R01C01', '5', 'FMEAREVISED', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 23:46:51', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('455', 'test013_V01R01C01', '6', 'FMEARESULT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 23:49:09', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('456', 'test013_V01R01C01', '7', 'REPORT', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 23:49:44', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('457', 'test013_V01R01C01', '8', 'REPORTAPPROVE', 'Admin', '2015-06-14', '2015-06-14', '2015-06-14 23:50:12', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('458', 'Test014_V01R01C01', '1', 'INPUT', 'Admin', '2015-06-15', '2015-06-15', '2015-06-15 09:13:24', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('459', 'Test014_V01R01C01', '2', 'DFR', 'Admin', '2015-06-15', '2015-06-15', '2015-06-15 09:16:23', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('460', 'Test014_V01R01C01', '3', 'FMEARATING', 'Admin', '2015-06-15', '2015-06-15', '2015-06-15 09:17:29', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('461', 'Test014_V01R01C01', '4', 'FMEAAPPROVE', 'Admin', '2015-06-15', '2015-06-15', '2015-06-15 09:20:25', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('462', 'Test014_V01R01C01', '5', 'FMEAREVISED', 'Admin', '2015-06-15', '2015-06-15', '2015-06-15 09:21:34', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('463', 'Test014_V01R01C01', '6', 'FMEARESULT', 'Admin', '2015-06-15', '2015-06-15', '2015-06-15 09:24:34', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('464', 'Test014_V01R01C01', '7', 'REPORT', 'Admin', '2015-06-15', '2015-06-15', '2015-06-15 09:25:05', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('465', 'Test014_V01R01C01', '8', 'REPORTAPPROVE', 'Admin', '2015-06-15', '2015-06-15', '2015-06-15 09:25:37', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('466', 'Test1234_V01R01C01', '1', 'INPUT', 'Admin', '2015-08-22', '2015-08-22', '2015-08-22 02:48:39', '已完成', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('467', 'Test1234_V01R01C01', '2', 'DFR', 'Admin', '2015-08-22', '2015-08-22', '2015-08-22 00:00:00', '进行中', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('468', 'Test1234_V01R01C01', '3', 'FMEARATING', 'Admin', '2015-08-22', '2015-08-22', '2015-08-22 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('469', 'Test1234_V01R01C01', '4', 'FMEAAPPROVE', 'Admin', '2015-08-22', '2015-08-22', '2015-08-22 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('470', 'Test1234_V01R01C01', '5', 'FMEAREVISED', 'Admin', '2015-08-22', '2015-08-22', '2015-08-22 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('471', 'Test1234_V01R01C01', '6', 'FMEARESULT', 'Admin', '2015-08-22', '2015-08-22', '2015-08-22 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('472', 'Test1234_V01R01C01', '7', 'REPORT', 'Admin', '2015-08-22', '2015-08-22', '2015-08-22 00:00:00', '未启动', null, null, null);
INSERT INTO `u_taskdetail` VALUES ('473', 'Test1234_V01R01C01', '8', 'REPORTAPPROVE', 'Admin', '2015-08-22', '2015-08-22', '2015-08-22 00:00:00', '未启动', null, null, null);

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号（系统内建)',
  `UserName` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `WorkingID` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `WorkingDepartMent` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RightName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '权限名称',
  `UserPassword` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户密码',
  `UserEmailAddress` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户邮件地址',
  `UserEmailPass` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户邮件密码',
  `UserCaption` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户姓名',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UserName` (`UserName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='用户管理表|EDITLEVEL=2';

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', 'Admin', '1111111', '工艺部', '数据管理员', '123', 'tommy.li@featech.com.cn', 'featech02', '申工');
INSERT INTO `u_user` VALUES ('6', 'Tommy', '2222222', '工艺部', '数据管理员', '111', 'tommy.li@featech.com.cn', 'featech02', '李冬');
INSERT INTO `u_user` VALUES ('7', 'Slingy', '3333333', '工艺部', '数据管理员', '123', 'tommy.li@featech.com.cn', null, '彭胜勇');
INSERT INTO `u_user` VALUES ('8', 'Tomm', '345678', '工艺二部', '主设计师', '123', 'tommy.li@featech.com.cn', null, '李松林');
INSERT INTO `u_user` VALUES ('9', 'tss', '111233', '工艺部', '项目主管', '123', 'tommy.li@featech.com.cn', null, '111');
