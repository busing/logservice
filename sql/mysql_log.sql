/*
Navicat MySQL Data Transfer

Source Server         : dpc
Source Server Version : 50541
Source Host           : 121.40.55.170:3306
Source Database       : dpc

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2015-08-24 16:20:58
*/
SET FOREIGN_KEY_CHECKS=0;
ALTER TABLE `t_doctor`
ADD COLUMN `user_agent`  varchar(200) NULL COMMENT '手机ua信息';
ALTER TABLE `t_doctor`
ADD COLUMN `device_os`  int(11) NULL COMMENT '注册设备系统';
ALTER TABLE `t_doctor`
ADD COLUMN `device_os_version`  varchar(64) NULL COMMENT '设备系统系统版本';
ALTER TABLE `t_doctor`
ADD COLUMN `client_os`  int(11) NULL COMMENT '客户端系统';
ALTER TABLE `t_doctor`
ADD COLUMN `client_version`  varchar(64) NULL COMMENT '客户端版本';
ALTER TABLE `t_doctor`
ADD COLUMN `client_type`  int(11) NULL COMMENT '客户端类型';
ALTER TABLE `t_doctor`
ADD COLUMN `channel_id`  varchar(32) NULL COMMENT '渠道id';
ALTER TABLE `t_doctor`
ADD COLUMN `imei`  varchar(32) NULL COMMENT '手机imei';
ALTER TABLE `t_doctor`
ADD COLUMN `imsi`  varchar(32) NULL COMMENT '手机imsi';
ALTER TABLE `t_patient`
ADD COLUMN `user_agent`  varchar(200) NULL COMMENT '手机ua信息';
ALTER TABLE `t_patient`
ADD COLUMN `device_os`  int(11) NULL COMMENT '注册设备系统';
ALTER TABLE `t_patient`
ADD COLUMN `device_os_version`  varchar(64) NULL COMMENT '设备系统系统版本';
ALTER TABLE `t_patient`
ADD COLUMN `client_os`  int(11) NULL COMMENT '客户端系统';
ALTER TABLE `t_patient`
ADD COLUMN `client_version`  varchar(64) NULL COMMENT '客户端版本';
ALTER TABLE `t_patient`
ADD COLUMN `client_type`  int(11) NULL COMMENT '客户端类型';
ALTER TABLE `t_patient`
ADD COLUMN `channel_id`  varchar(32) NULL COMMENT '渠道id';
ALTER TABLE `t_patient`
ADD COLUMN `imei`  varchar(32) NULL COMMENT '手机imei';
ALTER TABLE `t_patient`
ADD COLUMN `imsi`  varchar(32) NULL COMMENT '手机imsi';

-- ----------------------------
-- Table structure for `t_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_action_log`;
CREATE TABLE `t_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'user_agent',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `phone_num` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `device_os` int(11) DEFAULT NULL COMMENT '设备系统',
  `device_os_version` varchar(64) DEFAULT NULL COMMENT '设备系统版本',
  `client_os` int(11) DEFAULT NULL COMMENT '客户端系统',
  `imei` varchar(64) DEFAULT NULL COMMENT '手机串号',
  `imsi` varchar(64) DEFAULT NULL COMMENT '移动识别号',
  `client_version` varchar(64) DEFAULT NULL COMMENT '客户端版本',
  `client_type` int(11) DEFAULT NULL COMMENT '客户端类型',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型',
  `channel_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `session_id` varchar(64) DEFAULT NULL COMMENT '客户端sessionId',
  `wx_openid` varchar(64) DEFAULT NULL COMMENT '微信id',
  `qq_openid` varchar(64) DEFAULT NULL COMMENT 'qqid',
  `wb_openid` varchar(64) DEFAULT NULL COMMENT '微博id',
  `request_time` varchar(32) DEFAULT NULL COMMENT '请求时间',
  `response_time` varchar(32) DEFAULT NULL COMMENT '返回结果时间',
  `server_cost_time` varchar(32) DEFAULT NULL COMMENT '服务用时',
  `action_type` int(11) DEFAULT NULL COMMENT '动作类型',
  `request_success` int(11) DEFAULT NULL COMMENT '是否处理成功',
  `status_code` int(11) DEFAULT NULL COMMENT '服务返回的状态码',
  `data_id` varchar(32) DEFAULT NULL COMMENT '关联数据id',
  `day_time` varchar(32) DEFAULT NULL COMMENT '日期（20150824）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户行为日志表';
-- ----------------------------
-- Table structure for `t_download_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_download_log`;
CREATE TABLE `t_download_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `client_os` int(11) DEFAULT NULL COMMENT '客户端系统',
  `client_version` varchar(64) DEFAULT NULL COMMENT '客户端版本',
  `client_type` int(11) DEFAULT NULL COMMENT '客户端类型',
  `download_time` varchar(32) DEFAULT NULL COMMENT '下载时间',
  `channel_id` int(11) DEFAULT NULL COMMENT '渠道id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='下载记录表';

-- ----------------------------
-- Table structure for `t_login_record`
-- ----------------------------
DROP TABLE IF EXISTS `t_login_record`;
CREATE TABLE `t_login_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'user_agent',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `phone_num` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `device_os` int(11) DEFAULT NULL COMMENT '设备系统',
  `device_os_version` varchar(64) DEFAULT NULL COMMENT '设备系统版本',
  `client_os` int(11) DEFAULT NULL COMMENT '客户端系统',
  `imei` varchar(64) DEFAULT NULL COMMENT '手机串号',
  `imsi` varchar(64) DEFAULT NULL COMMENT '移动识别号',
  `client_version` varchar(64) DEFAULT NULL COMMENT '客户端版本',
  `client_type` int(11) DEFAULT NULL COMMENT '客户端类型',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型',
  `channel_id` int(11) DEFAULT NULL COMMENT '渠道id',
  `wx_openid` varchar(64) DEFAULT NULL COMMENT '微信id',
  `qq_openid` varchar(64) DEFAULT NULL COMMENT 'qqid',
  `wb_openid` varchar(64) DEFAULT NULL COMMENT '微博id',
  `last_login_time` varchar(32) DEFAULT NULL COMMENT '最后登录时间',
  `login_times` varchar(32) DEFAULT NULL COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户登录记录表';

-- ----------------------------
-- Table structure for `t_userstatus_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_userstatus_log`;
CREATE TABLE `t_userstatus_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `phone_num` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `wx_openid` varchar(64) DEFAULT NULL COMMENT '微信id',
  `qq_openid` varchar(64) DEFAULT NULL COMMENT 'qqid',
  `wb_openid` varchar(64) DEFAULT NULL COMMENT '微博id',
  `user_type` int(11) NOT NULL COMMENT '用户类型',
  `change_index` varchar(32) DEFAULT NULL COMMENT '导致用户状态变更的数据表主键',
  `change_time` varchar(32) NOT NULL COMMENT '变更时间',
  `reason` varchar(64) DEFAULT NULL COMMENT '变更缘由',
  `before_status` int(11) NOT NULL COMMENT '变更前状态',
  `after_status` int(11) NOT NULL COMMENT '变更后状态',
  `operator_id` int(11) NOT NULL COMMENT '操作人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户状态变更记录表';

-- ----------------------------
-- Table structure for `t_activeuser_daycount`
-- ----------------------------
DROP TABLE IF EXISTS `t_activeuser_daycount`;
CREATE TABLE `t_activeuser_daycount` (
`id`  int NOT NULL AUTO_INCREMENT ,
`client_os`  int NULL COMMENT '客户端系统(1=Android；2=IOS；3=windows；4=BlackBerry；5=YunOS；0=其它)' ,
`client_type`  int NULL COMMENT '客户端类型（版本类型：0=医生版；1=患者版）' ,
`channel_id`  int NULL COMMENT '渠道id' ,
`active_count`  int NULL COMMENT '活动人数' ,
`day_time`  int NULL COMMENT '时间（yyyyMMdd）' ,
`create_time`	int(11)	NOT NULL COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日活跃用户统计表';

-- ----------------------------
-- Table structure for `t_action_daycount`
-- ----------------------------
DROP TABLE IF EXISTS `t_action_daycount`;
CREATE TABLE `t_action_daycount` (
`id`  int NOT NULL AUTO_INCREMENT ,
`client_os`  int NULL COMMENT '客户端系统(1=Android；2=IOS；3=windows；4=BlackBerry；5=YunOS；0=其它)' ,
`client_type`  int NULL COMMENT '客户端类型（版本类型：0=医生版；1=患者版）' ,
`channel_id`  int NULL COMMENT '渠道id' ,
`action_type`  int NULL COMMENT '动作类型' ,
`action_count`  int NULL COMMENT '动作统计次数' ,
`action_success_count`  int NULL COMMENT '动作成功次数' ,
`action_fail_count`  int NULL COMMENT '动作失败次数' ,
`request_count`  int NULL COMMENT '服务请求次数' ,
`result_success_count`  int NULL COMMENT '服务请求成功次数' ,
`result_fail_count`  int NULL COMMENT '服务请求失败次数' ,
`day_time`  int NULL COMMENT '时间（yyyyMMdd）' ,
`create_time`	long	NOT NULL COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日用户行为统计表';


-- ----------------------------
-- Table structure for `t_page_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_page_log`;
CREATE TABLE `t_page_log` (
`id`  int NOT NULL AUTO_INCREMENT ,
`user_agent`  varchar(256) NULL COMMENT '手机ua信息' ,
`user_id`  int NULL COMMENT '用户id' ,
`phone_num`  int NULL COMMENT '手机号码' ,
`device_os`  int NULL COMMENT '客户端系统(1=Android；2=IOS；3=windows；4=BlackBerry；5=YunOS；0=其它)' ,
`device_os_version`  varchar(32) NULL COMMENT '设备系统(1=Android；2=IOS；3=windows；4=BlackBerry；5=YunOS；0=其它)' ,
`client_os`  int NULL COMMENT '动作失败次数' ,
`client_version`  varchar(32) NULL COMMENT '客户端版本号' ,
`client_type`  int NULL COMMENT '客户端类型（版本类型：0=医生版；1=患者版）' ,
`channel_id`  int NULL COMMENT '客户端渠道号' ,
`imei`  varchar(32) NULL COMMENT 'imei' ,
`imsi`  varchar(32) NULL COMMENT 'imsi' ,
`sessioni_d`  varchar(32) NULL COMMENT '每次使用周期的唯一标' ,
`open_page`  varchar(32) NULL COMMENT '打开页面' ,
`from_page`  varchar(32) NULL COMMENT '来源页面' ,
`open_time`  long NULL COMMENT '打开时间' ,
`close_time`  long NULL COMMENT '关闭时间' ,
`remain_time`  int NULL COMMENT '停留时间' ,
`is_exit`  int NULL COMMENT '是否从此页面退出应用（0：否：1:是）' ,
`day_time`  int NULL COMMENT '时间（yyyyMMdd）' ,
`create_time`	long	NOT NULL COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户浏览记录日志';

-- ----------------------------
-- Table structure for `t_eachusertime_day`
-- ----------------------------
DROP TABLE IF EXISTS `t_eachusertime_day`;
CREATE TABLE `t_eachusertime_day` (
`id`  int NOT NULL AUTO_INCREMENT ,
`user_id`  int NULL COMMENT '用户id' ,
`phone_num`  int NULL COMMENT '手机号码' ,
`device_os`  int NULL COMMENT '客户端系统(1=Android；2=IOS；3=windows；4=BlackBerry；5=YunOS；0=其它)' ,
`device_os_version`  varchar(32) NULL COMMENT '设备系统(1=Android；2=IOS；3=windows；4=BlackBerry；5=YunOS；0=其它)' ,
`client_os`  int NULL COMMENT '动作失败次数' ,
`client_version`  varchar(32) NULL COMMENT '客户端版本号' ,
`client_type`  int NULL COMMENT '客户端类型（版本类型：0=医生版；1=患者版）' ,
`channel_id`  int NULL COMMENT '客户端渠道号' ,
`start_using_time`  long NULL COMMENT '开始使用时间' ,
`end_using_time`  long NULL COMMENT '结束使用时间' ,
`sessioni_d`  varchar(32) NULL COMMENT '每次使用周期的唯一标' ,
`using_time`  int NULL COMMENT '使用时长（秒）' ,
`day_time`  int NULL COMMENT '时间（yyyyMMdd）' ,
`create_time`	long	NOT NULL COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日客户端每次使用时长';

-- ----------------------------
-- Table structure for `t_pagevisit_day`
-- ----------------------------
DROP TABLE IF EXISTS `t_pagevisit_day`;
CREATE TABLE `t_pagevisit_day` (
`id`  int NOT NULL AUTO_INCREMENT ,
`client_os`  int NULL COMMENT '动作失败次数' ,
`client_type`  int NULL COMMENT '客户端类型（版本类型：0=医生版；1=患者版）' ,
`channel_id`  int NULL COMMENT '客户端渠道号' ,
`page`  int NULL COMMENT '开始使用时间' ,
`visit_time_count`  int NULL COMMENT '访问次数' ,
`visit_user_count`  int NULL COMMENT '访问人数' ,
`remain_time`  int NULL COMMENT '停留总时长（秒）' ,
`quit_times`  int NULL COMMENT '退出应用次数' ,
`day_time`  int NULL COMMENT '时间（yyyyMMdd）' ,
`create_time`	long	NOT NULL COMMENT '创建时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='每日页面访问统计';








