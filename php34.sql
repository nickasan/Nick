-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 05 月 09 日 10:17
-- 服务器版本: 5.5.20
-- PHP 版本: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `php34`
--

-- --------------------------------------------------------

--
-- 表的结构 `php34_admin`
--

CREATE TABLE IF NOT EXISTS `php34_admin` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `is_use` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用 1：启用0：禁用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `php34_admin`
--

INSERT INTO `php34_admin` (`id`, `username`, `password`, `is_use`) VALUES
(1, 'root', 'bafcbdc80e0ca50e92abe420f506456b', 1),
(4, 'goods1', '43b85abf93aef8770dfc3cb3a5cbfbe5', 1);

-- --------------------------------------------------------

--
-- 表的结构 `php34_admin_role`
--

CREATE TABLE IF NOT EXISTS `php34_admin_role` (
  `admin_id` tinyint(3) unsigned NOT NULL COMMENT '管理员的id',
  `role_id` smallint(5) unsigned NOT NULL COMMENT '角色的id',
  KEY `admin_id` (`admin_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员角色表';

--
-- 转存表中的数据 `php34_admin_role`
--

INSERT INTO `php34_admin_role` (`admin_id`, `role_id`) VALUES
(4, 10);

-- --------------------------------------------------------

--
-- 表的结构 `php34_attribute`
--

CREATE TABLE IF NOT EXISTS `php34_attribute` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(30) NOT NULL COMMENT '属性名称',
  `attr_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '属性的类型0：唯一 1：可选',
  `attr_option_values` varchar(150) NOT NULL DEFAULT '' COMMENT '属性的可选值，多个可选值用，隔开',
  `type_id` tinyint(3) unsigned NOT NULL COMMENT '所在的类型的id',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='属性' AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `php34_attribute`
--

INSERT INTO `php34_attribute` (`id`, `attr_name`, `attr_type`, `attr_option_values`, `type_id`) VALUES
(1, '出版社', 0, '', 2),
(3, '页数', 0, '', 2),
(4, '内存', 0, '', 1),
(5, '颜色', 1, '黑色,白色,蓝色,绿色', 5),
(6, '尺寸', 0, '', 5),
(7, '触控', 0, '非触控,触控', 5),
(8, '内存', 1, '4G,8G,16G,32G,64G', 5),
(9, '操作系统', 1, 'linux,windows,ios', 5),
(10, '显卡类型', 0, '独立,集成', 5),
(11, '硬盘尺寸', 0, '', 5),
(12, '星期几出厂的', 0, '星期一,星期二,星期三,星期四,星期五,星期六,星期七', 5);

-- --------------------------------------------------------

--
-- 表的结构 `php34_brand`
--

CREATE TABLE IF NOT EXISTS `php34_brand` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(45) NOT NULL COMMENT '品牌名称',
  `site_url` varchar(150) NOT NULL COMMENT '品牌网站地址',
  `logo` varchar(150) NOT NULL DEFAULT '' COMMENT '品牌logo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='品牌表' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `php34_brand`
--

INSERT INTO `php34_brand` (`id`, `brand_name`, `site_url`, `logo`) VALUES
(1, '明基', 'xxx', 'Admin/2015-04-25/553b0d92e7861.jpg'),
(2, '七匹狼', 'xxxx', 'Admin/2015-04-25/553b0da364969.jpg'),
(3, 'LG', 'fdas', 'Admin/2015-04-27/553d88f80576e.jpg'),
(4, '苹果', '12', 'Admin/2015-04-27/553d890193f92.jpg'),
(5, 'ThinkPad', '213', 'Admin/2015-04-27/553d890e7bbf9.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `php34_cart`
--

CREATE TABLE IF NOT EXISTS `php34_cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品ID',
  `goods_attr_id` varchar(30) NOT NULL DEFAULT '' COMMENT '选择的商品属性ID，多个用，隔开',
  `goods_number` int(10) unsigned NOT NULL COMMENT '购买的数量',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='购物车' AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `php34_cart`
--

INSERT INTO `php34_cart` (`id`, `goods_id`, `goods_attr_id`, `goods_number`, `member_id`) VALUES
(22, 22, '56,59,60', 1, 1),
(17, 23, '62,64,66', 4, 1);

-- --------------------------------------------------------

--
-- 表的结构 `php34_category`
--

CREATE TABLE IF NOT EXISTS `php34_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(30) NOT NULL COMMENT '分类名称',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级分类的ID，0：代表顶级',
  `search_attr_id` varchar(100) NOT NULL DEFAULT '' COMMENT '筛选选属性ID，多个ID用逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商品分类表' AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `php34_category`
--

INSERT INTO `php34_category` (`id`, `cat_name`, `parent_id`, `search_attr_id`) VALUES
(15, '家用电器', 0, ''),
(16, '大家电', 15, ''),
(14, '手机、数码', 0, ''),
(17, '生活电器', 15, ''),
(18, '厨房电器', 15, ''),
(19, '平板电视', 16, ''),
(20, '空调', 16, ''),
(21, '冰箱', 16, ''),
(22, '手机配件', 14, ''),
(23, '数码配件', 14, ''),
(24, '蓝牙耳机', 22, ''),
(25, '手机饰品', 22, ''),
(26, '存储卡', 23, ''),
(27, '读卡器', 23, ''),
(28, '文化用品', 0, ''),
(29, '书', 28, ''),
(30, 'php', 29, ''),
(31, 'ios', 29, ''),
(32, '测试商品分类属性', 0, '5,6,7,10,11'),
(33, '新的分类', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `php34_clicked_use`
--

CREATE TABLE IF NOT EXISTS `php34_clicked_use` (
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员ID',
  `comment_id` mediumint(8) unsigned NOT NULL COMMENT '评论的ID',
  PRIMARY KEY (`member_id`,`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户点击过有用的评论';

-- --------------------------------------------------------

--
-- 表的结构 `php34_comment`
--

CREATE TABLE IF NOT EXISTS `php34_comment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL COMMENT '评论的内容',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '3' COMMENT '打的分',
  `addtime` int(10) unsigned NOT NULL COMMENT '评论时间',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员ID',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品的ID',
  `used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '有用的数量',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评论' AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `php34_comment`
--

INSERT INTO `php34_comment` (`id`, `content`, `star`, `addtime`, `member_id`, `goods_id`, `used`) VALUES
(24, 'req', 3, 1430890007, 1, 22, 0),
(2, 'tezt', 4, 1430877079, 1, 23, 0),
(3, 'tezt', 4, 1430877120, 1, 23, 0),
(4, '最新的评论', 3, 1430877430, 1, 23, 0),
(5, '再发布一个试试', 4, 1430877450, 1, 23, 0),
(6, '再发布一个试试', 4, 1430877469, 1, 23, 0),
(7, '再下', 2, 1430877533, 1, 23, 0),
(8, '测试好', 2, 1430877564, 1, 23, 0),
(9, '朝秦暮楚', 3, 1430877580, 1, 23, 0),
(10, 'dfsfsafdas', 3, 1430877860, 1, 23, 0),
(11, '1231232123', 3, 1430877886, 1, 23, 0),
(12, 'dsfadfadfas', 3, 1430877957, 1, 23, 0),
(13, 'fdsdsafdfdasf', 3, 1430877962, 1, 23, 0),
(14, 'asdfafsdafsdsafafds', 3, 1430877976, 1, 23, 0),
(15, 'dfsafsdaadfss', 3, 1430877996, 1, 23, 0),
(16, 'fdsdfssdfaasdf', 3, 1430878013, 1, 23, 0),
(17, '压顶', 3, 1430878219, 1, 23, 0),
(18, '东奔西走dsafas', 3, 1430878296, 1, 23, 0),
(19, '魂牵梦萦霍布斯鞋柜夺', 3, 1430878331, 1, 23, 0),
(20, '柘城朝秦暮楚', 3, 1430878453, 1, 23, 0),
(21, '测试评论效果', 3, 1430879122, 1, 23, 0),
(22, '魂牵梦萦', 3, 1430879161, 1, 23, 0),
(23, '魂牵梦萦', 3, 1430879167, 1, 23, 0);

-- --------------------------------------------------------

--
-- 表的结构 `php34_goods`
--

CREATE TABLE IF NOT EXISTS `php34_goods` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(45) NOT NULL COMMENT '商品名称',
  `cat_id` smallint(5) unsigned NOT NULL COMMENT '主分类的id',
  `brand_id` smallint(5) unsigned NOT NULL COMMENT '品牌的id',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本店价',
  `jifen` int(10) unsigned NOT NULL COMMENT '赠送积分',
  `jyz` int(10) unsigned NOT NULL COMMENT '赠送经验值',
  `jifen_price` int(10) unsigned NOT NULL COMMENT '如果要用积分兑换，需要的积分数',
  `promote_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '促销价',
  `promote_start_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '促销开始时间',
  `promote_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '促销结束时间',
  `logo` varchar(150) NOT NULL DEFAULT '' COMMENT 'logo原图',
  `sm_logo` varchar(150) NOT NULL DEFAULT '' COMMENT 'logo缩略图',
  `is_hot` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否热卖',
  `is_new` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否新品',
  `is_best` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否精品',
  `is_on_sale` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否上架：1：上架，0：下架',
  `seo_keyword` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo优化_关键字',
  `seo_description` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo优化_描述',
  `type_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品类型id',
  `sort_num` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '排序数字',
  `is_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否放到回收站：1：是，0：否',
  `addtime` int(10) unsigned NOT NULL COMMENT '添加时间',
  `goods_desc` longtext COMMENT '商品描述',
  `is_promote` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否促销',
  PRIMARY KEY (`id`),
  KEY `shop_price` (`shop_price`),
  KEY `cat_id` (`cat_id`),
  KEY `brand_id` (`brand_id`),
  KEY `is_on_sale` (`is_on_sale`),
  KEY `is_hot` (`is_hot`),
  KEY `is_new` (`is_new`),
  KEY `is_best` (`is_best`),
  KEY `is_delete` (`is_delete`),
  KEY `sort_num` (`sort_num`),
  KEY `promote_start_time` (`promote_start_time`),
  KEY `promote_end_time` (`promote_end_time`),
  KEY `addtime` (`addtime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `php34_goods`
--

INSERT INTO `php34_goods` (`id`, `goods_name`, `cat_id`, `brand_id`, `market_price`, `shop_price`, `jifen`, `jyz`, `jifen_price`, `promote_price`, `promote_start_time`, `promote_end_time`, `logo`, `sm_logo`, `is_hot`, `is_new`, `is_best`, `is_on_sale`, `seo_keyword`, `seo_description`, `type_id`, `sort_num`, `is_delete`, `addtime`, `goods_desc`, `is_promote`) VALUES
(2, '商品图片测试', 14, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1429951026, '', 0),
(3, 'abc1223', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1429951098, '', 0),
(4, 'ThinkPad-123123', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 1, 1429951192, '', 0),
(5, 'ThinkPad-123123', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1429951231, '', 0),
(6, 'ThinkPad-123123', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1429951260, '', 0),
(7, 'ThinkPad-123123', 15, 0, '210.00', '200.00', 0, 0, 0, '23.00', 1427817600, 1431619200, 'Admin/2015-04-25/553b53791f055.jpg', 'Admin/2015-04-25/thumb_0_553b53791f055.jpg', 0, 0, 0, 1, '', '', 0, 50, 0, 1429951353, '', 1),
(8, '312123', 15, 0, '0.00', '0.00', 0, 0, 0, '100.00', 1427817600, 1430409600, 'Admin/2015-04-26/553cadd781349.jpg', 'Admin/2015-04-26/thumb_0_553cadd781349.jpg', 1, 0, 0, 1, '', '', 5, 44, 0, 1429951685, '', 1),
(9, '132', 14, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 1, 1429951744, '', 0),
(10, 'ThinkPad', 14, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1430010910, '', 0),
(11, 'ThinkPad-123123', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1430011234, '', 1),
(12, 'abc', 14, 0, '0.00', '0.00', 0, 0, 0, '321.00', 2015, 2015, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1430011631, '', 1),
(13, 'ThinkPad', 15, 0, '0.00', '0.00', 0, 0, 0, '123.00', 1430050500, 1430050500, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1430011977, '', 1),
(14, 'asdfafdds', 14, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 0, 100, 0, 1430012214, '<p>asdffadsadsfdfsdffddfas<img src="http://www.34.com/Public/ueditor/php/upload1//20150420/1429496911107897.jpg" alt="1429496911107897.jpg" /></p>', 0),
(15, '商品属性的修改', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 5, 100, 0, 1430014073, '', 0),
(16, 'ThinkPad', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 5, 100, 0, 1430014251, '', 0),
(17, 'ThinkPad -- 安妮版', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 5, 100, 0, 1430016307, '', 0),
(22, '库存量管理', 32, 0, '23.00', '12.00', 0, 0, 0, '0.00', 0, 0, 'Admin/2015-04-30/55419a647c9ec.jpg', 'Admin/2015-04-30/thumb_0_55419a647c9ec.jpg', 1, 0, 0, 1, '', '', 5, 100, 0, 1430100678, '', 0),
(23, 'ThinkPad', 32, 0, '312.00', '295.00', 0, 0, 0, '0.00', 0, 0, 'Admin/2015-04-30/55419ab9ce26a.jpg', 'Admin/2015-04-30/thumb_0_55419ab9ce26a.jpg', 1, 0, 1, 1, '', '', 5, 100, 0, 1430105560, '<p>sdadsa<img src="http://www.34.com/Public/ueditor/php/upload1//20140123/1390442614330225.jpg" alt="1390442614330225.jpg" /></p><p><img src="http://www.34.com/Public/ueditor/php/upload1//20150420/1429496911107897.jpg" alt="1429496911107897.jpg" /></p><p>商品介绍：</p><p><img src="http://www.34.com/Public/ueditor/php/upload1//20140123/1390442614330225.jpg" alt="1390442614330225.jpg" /></p>', 0),
(19, 'abcabcabc', 15, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 2, 100, 0, 1430033140, '', 0),
(20, '12323', 14, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 5, 100, 0, 1430033605, '', 0),
(21, 'ThinkPad', 14, 0, '0.00', '0.00', 0, 0, 0, '0.00', 0, 0, '', '', 0, 0, 0, 1, '', '', 5, 100, 0, 1430035304, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `php34_goods_attr`
--

CREATE TABLE IF NOT EXISTS `php34_goods_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品的id',
  `attr_id` mediumint(8) unsigned NOT NULL COMMENT '属性的id',
  `attr_value` varchar(150) NOT NULL DEFAULT '' COMMENT '属性的值',
  `attr_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '属性的价格',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`),
  KEY `attr_id` (`attr_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商品属性' AUTO_INCREMENT=73 ;

--
-- 转存表中的数据 `php34_goods_attr`
--

INSERT INTO `php34_goods_attr` (`id`, `goods_id`, `attr_id`, `attr_value`, `attr_price`) VALUES
(1, 1, 5, '黑色', '0.00'),
(2, 1, 5, '白色', '0.00'),
(3, 1, 8, '4G', '222.00'),
(4, 1, 8, '8G', '111.00'),
(5, 15, 5, '黑色', '123.00'),
(6, 15, 5, '白色', '343.00'),
(7, 15, 5, '蓝色', '2123.00'),
(8, 15, 8, '4G', '0.00'),
(9, 15, 8, '8G', '0.00'),
(10, 16, 5, '黑色', '0.00'),
(11, 16, 5, '', '0.00'),
(12, 16, 6, '12寸', '0.00'),
(13, 16, 7, '非触控', '0.00'),
(14, 16, 8, '16G', '0.00'),
(15, 16, 8, '32G', '0.00'),
(16, 16, 8, '64G', '0.00'),
(17, 17, 5, '黑色', '43.00'),
(18, 17, 5, '白色', '23.00'),
(19, 17, 5, '蓝色', '123.00'),
(20, 17, 6, '12寸', '0.00'),
(21, 17, 7, '触控', '0.00'),
(22, 17, 8, '8G', '2323.00'),
(23, 17, 8, '16G', '222.00'),
(24, 17, 8, '32G', '111.00'),
(62, 23, 5, '白色', '0.00'),
(61, 23, 5, '黑色', '0.00'),
(60, 22, 9, 'windows', '0.00'),
(59, 22, 8, '16G', '0.00'),
(58, 22, 8, '8G', '0.00'),
(57, 22, 8, '4G', '0.00'),
(56, 22, 5, '白色', '0.00'),
(55, 22, 5, '黑色', '0.00'),
(68, 23, 7, '触控', '0.00'),
(67, 23, 6, '12寸', '0.00'),
(66, 23, 9, 'linux', '0.00'),
(65, 23, 9, 'windows', '0.00'),
(64, 23, 8, '16G', '0.00'),
(63, 23, 8, '4G', '0.00'),
(54, 19, 3, '123', '0.00'),
(47, 20, 5, '黑色', '0.00'),
(48, 20, 6, '12寸', '0.00'),
(49, 20, 11, '345G', '0.00'),
(50, 20, 7, '触控', '0.00'),
(51, 20, 10, '独立', '0.00'),
(53, 19, 1, '人民大学出版社', '0.00'),
(69, 23, 10, '独立', '0.00'),
(70, 23, 11, '500G', '0.00'),
(71, 23, 12, '星期四', '0.00'),
(72, 8, 5, '白色', '0.00');

-- --------------------------------------------------------

--
-- 表的结构 `php34_goods_cat`
--

CREATE TABLE IF NOT EXISTS `php34_goods_cat` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `cat_id` smallint(5) unsigned NOT NULL COMMENT '分类id',
  KEY `goods` (`goods_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品扩展分类表';

--
-- 转存表中的数据 `php34_goods_cat`
--

INSERT INTO `php34_goods_cat` (`goods_id`, `cat_id`) VALUES
(10, 15),
(10, 14),
(10, 15),
(10, 14),
(17, 14),
(8, 32),
(7, 28),
(7, 32),
(1, 15),
(1, 15),
(1, 15),
(1, 15),
(1, 15);

-- --------------------------------------------------------

--
-- 表的结构 `php34_goods_number`
--

CREATE TABLE IF NOT EXISTS `php34_goods_number` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品的id',
  `goods_number` int(10) unsigned NOT NULL COMMENT '库存量',
  `goods_attr_id` varchar(150) NOT NULL COMMENT '商品属性ID列表-注释：这里的ID保存的是上面php34_goods_attr表中的ID，通过这个ID即可以知道值是什么也可以是知道属性是什么,如果有多个ID组合就用，号隔开保存一个字符串，并且存时要按ID的升序存,将来前台查询库存量时也要先把商品属性ID升序拼成字符串然后查询数据库',
  KEY `goods_id` (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品库存量';

--
-- 转存表中的数据 `php34_goods_number`
--

INSERT INTO `php34_goods_number` (`goods_id`, `goods_number`, `goods_attr_id`) VALUES
(22, 111, '56,59'),
(22, 444, '56,58'),
(21, 123, ''),
(21, 123, ''),
(23, 94, '61,63,65'),
(7, 107, ''),
(23, 100, '62,64,66'),
(23, 43, '62,64,65'),
(20, 12, ''),
(20, 12, ''),
(20, 12, ''),
(20, 12, ''),
(14, 123213, ''),
(21, 123, ''),
(21, 123, ''),
(21, 123, ''),
(23, 221, '62,63,65'),
(23, 4332, '61,64,65'),
(23, 100, '61,64,66');

-- --------------------------------------------------------

--
-- 表的结构 `php34_goods_pics`
--

CREATE TABLE IF NOT EXISTS `php34_goods_pics` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pic` varchar(150) NOT NULL COMMENT '图片',
  `sm_pic` varchar(150) NOT NULL COMMENT '缩略图',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品的id',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商品图片' AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `php34_goods_pics`
--

INSERT INTO `php34_goods_pics` (`id`, `pic`, `sm_pic`, `goods_id`) VALUES
(1, 'Goods/2015-04-25/553b52323d748.jpg', 'Goods/2015-04-25/thumb_0_553b52323d748.jpg', 2),
(2, 'Goods/2015-04-25/553b527ae4c6e.jpg', 'Goods/2015-04-25/thumb_0_553b527ae4c6e.jpg', 3),
(3, 'Goods/2015-04-25/553b52ffb3d79.jpg', 'Goods/2015-04-25/thumb_0_553b52ffb3d79.jpg', 5),
(4, 'Goods/2015-04-25/553b531ce1c48.jpg', 'Goods/2015-04-25/thumb_0_553b531ce1c48.jpg', 6),
(5, 'Goods/2015-04-25/553b54c54e717.jpg', 'Goods/2015-04-25/thumb_0_553b54c54e717.jpg', 8),
(19, 'Goods/2015-05-04/5546d1f612be8.jpg', 'Goods/2015-05-04/thumb_0_5546d1f612be8.jpg', 23),
(7, 'Goods/2015-04-25/553b5500167cb.jpg', 'Goods/2015-04-25/thumb_0_553b5500167cb.jpg', 9),
(8, 'Goods/2015-04-25/553b55004c3fc.jpg', 'Goods/2015-04-25/thumb_0_553b55004c3fc.jpg', 9),
(9, 'Goods/2015-04-25/553b55007b620.jpg', 'Goods/2015-04-25/thumb_0_553b55007b620.jpg', 9),
(21, 'Goods/2015-05-04/5546d1f67ab81.jpg', 'Goods/2015-05-04/thumb_0_5546d1f67ab81.jpg', 23),
(22, 'Goods/2015-05-04/5546d1f69c845.jpg', 'Goods/2015-05-04/thumb_0_5546d1f69c845.jpg', 23),
(23, 'Goods/2015-05-04/5546d1f6a6e30.jpg', 'Goods/2015-05-04/thumb_0_5546d1f6a6e30.jpg', 23),
(24, 'Goods/2015-05-04/5546d1f6d5a5e.jpg', 'Goods/2015-05-04/thumb_0_5546d1f6d5a5e.jpg', 23),
(20, 'Goods/2015-05-04/5546d1f645e75.jpg', 'Goods/2015-05-04/thumb_0_5546d1f645e75.jpg', 23);

-- --------------------------------------------------------

--
-- 表的结构 `php34_impression`
--

CREATE TABLE IF NOT EXISTS `php34_impression` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `imp_name` varchar(30) NOT NULL COMMENT '印象的标题',
  `imp_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT '印象出现的次数',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='印象' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `php34_impression`
--

INSERT INTO `php34_impression` (`id`, `imp_name`, `imp_count`, `goods_id`) VALUES
(1, '大气', 2, 23),
(2, '上档次', 2, 23),
(3, '低调', 1, 23),
(4, '有内涵', 1, 23),
(5, '新的印象', 1, 23);

-- --------------------------------------------------------

--
-- 表的结构 `php34_member`
--

CREATE TABLE IF NOT EXISTS `php34_member` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(60) NOT NULL COMMENT '会员账号',
  `password` char(32) NOT NULL COMMENT '密码',
  `face` varchar(150) NOT NULL DEFAULT '' COMMENT '头像',
  `addtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `email_code` char(32) NOT NULL DEFAULT '' COMMENT '邮件验证的验证码，当会员验证通过之后，会把这个字段清空，所以如果这个字段为空就说明会员已经通过email验证了',
  `jifen` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `jyz` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '经验值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `php34_member`
--

INSERT INTO `php34_member` (`id`, `email`, `password`, `face`, `addtime`, `email_code`, `jifen`, `jyz`) VALUES
(1, 'fortheday@126.com', 'cb13e53b5b69756273087acecb651c26', '', 1430379596, '', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `php34_member_level`
--

CREATE TABLE IF NOT EXISTS `php34_member_level` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(30) NOT NULL COMMENT '级别名称',
  `bottom_num` int(10) unsigned NOT NULL COMMENT '积分下限',
  `top_num` int(10) unsigned NOT NULL COMMENT '积分上限',
  `rate` tinyint(3) unsigned NOT NULL DEFAULT '100' COMMENT '折扣率，以百分比，如：9折=90',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='会员级别' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `php34_member_level`
--

INSERT INTO `php34_member_level` (`id`, `level_name`, `bottom_num`, `top_num`, `rate`) VALUES
(1, '注册会员', 0, 20000, 90),
(2, '中级会员', 20001, 50000, 99),
(3, '高级会员', 50001, 150000, 96),
(4, '白金会员', 150001, 500000, 90);

-- --------------------------------------------------------

--
-- 表的结构 `php34_member_price`
--

CREATE TABLE IF NOT EXISTS `php34_member_price` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品的id',
  `level_id` mediumint(8) unsigned NOT NULL COMMENT '级别id',
  `price` decimal(10,2) NOT NULL COMMENT '这个级别的价格',
  KEY `goods_id` (`goods_id`),
  KEY `level_id` (`level_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员级别';

--
-- 转存表中的数据 `php34_member_price`
--

INSERT INTO `php34_member_price` (`goods_id`, `level_id`, `price`) VALUES
(1, 3, '1.00'),
(1, 2, '1.00'),
(1, 1, '1.00'),
(7, 1, '150.00'),
(1, 4, '1.00');

-- --------------------------------------------------------

--
-- 表的结构 `php34_order`
--

CREATE TABLE IF NOT EXISTS `php34_order` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `addtime` int(10) unsigned NOT NULL COMMENT '下单时间',
  `shr_name` varchar(30) NOT NULL COMMENT '收货人姓名',
  `shr_province` varchar(30) NOT NULL COMMENT '省',
  `shr_city` varchar(30) NOT NULL COMMENT '市',
  `shr_area` varchar(30) NOT NULL COMMENT '地区',
  `shr_tel` varchar(30) NOT NULL COMMENT '收货人电话',
  `shr_address` varchar(30) NOT NULL COMMENT '收货人地址',
  `total_price` decimal(10,2) NOT NULL COMMENT '定单总价',
  `post_method` varchar(30) NOT NULL COMMENT '发货方式',
  `pay_method` varchar(30) NOT NULL COMMENT '支付方式',
  `pay_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态，0：未支付 1：已支付',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发货状态，0：未发货 1：已发货 2：已收到货',
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='定单基本信息' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `php34_order`
--

INSERT INTO `php34_order` (`id`, `member_id`, `addtime`, `shr_name`, `shr_province`, `shr_city`, `shr_area`, `shr_tel`, `shr_address`, `total_price`, `post_method`, `pay_method`, `pay_status`, `post_status`) VALUES
(2, 1, 1430966451, '吴英雷', '上海', '东城区', '三环以内', '3124567', '西三旗', '1589.00', '顺风', '支付宝', 1, 0),
(3, 1, 1430971384, '吴英雷', '天津', '西城区', '三环以内', '3124567', 'abc', '23.00', '顺风', '支付宝', 0, 0),
(4, 1, 1430981625, 'sdssdadsds', '北京', '朝阳区', '三环以内', '3124567', '西三旗', '46.00', '顺风', '支付宝', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `php34_order_goods`
--

CREATE TABLE IF NOT EXISTS `php34_order_goods` (
  `order_id` mediumint(8) unsigned NOT NULL COMMENT '定单id',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品ID',
  `goods_attr_id` varchar(30) NOT NULL DEFAULT '' COMMENT '选择的属性的ID，如果有多个用，隔开',
  `goods_attr_str` varchar(150) NOT NULL DEFAULT '' COMMENT '选择的属性的字符串',
  `goods_price` decimal(10,2) NOT NULL COMMENT '商品的价格',
  `goods_number` int(10) unsigned NOT NULL COMMENT '购买的数量',
  KEY `order_id` (`order_id`),
  KEY `goods_id` (`goods_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定单商品';

--
-- 转存表中的数据 `php34_order_goods`
--

INSERT INTO `php34_order_goods` (`order_id`, `member_id`, `goods_id`, `goods_attr_id`, `goods_attr_str`, `goods_price`, `goods_number`) VALUES
(2, 1, 7, '', '', '23.00', 1),
(2, 1, 23, '61,63,65', '颜色:黑色<br />内存:4G<br />操作系统:windows', '261.00', 6),
(3, 1, 7, '', '', '23.00', 1),
(4, 1, 7, '', '', '23.00', 2);

-- --------------------------------------------------------

--
-- 表的结构 `php34_privilege`
--

CREATE TABLE IF NOT EXISTS `php34_privilege` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pri_name` varchar(30) NOT NULL COMMENT '权限名称',
  `module_name` varchar(20) NOT NULL COMMENT '模块名称',
  `controller_name` varchar(20) NOT NULL COMMENT '控制器名称',
  `action_name` varchar(20) NOT NULL COMMENT '方法名称',
  `parent_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级权限的ID，0：代表顶级权限',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='权限表' AUTO_INCREMENT=52 ;

--
-- 转存表中的数据 `php34_privilege`
--

INSERT INTO `php34_privilege` (`id`, `pri_name`, `module_name`, `controller_name`, `action_name`, `parent_id`) VALUES
(1, '商品列表', 'Admin', 'Goods', 'lst', 3),
(2, '添加商品', 'Admin', 'Goods', 'add', 1),
(3, '商品管理', 'null', 'null', 'null', 0),
(4, '修改商品', 'Admin', 'Goods', 'edit', 1),
(5, '删除商品', 'Admin', 'Goods', 'delete', 1),
(6, '商品分类列表', 'Admin', 'Category', 'lst', 3),
(7, '添加分类', 'Admin', 'Category', 'add', 6),
(8, '修改分类', 'Admin', 'Category', 'edit', 6),
(9, '删除分类', 'Admin', 'Category', 'delete', 6),
(10, '权限管理', 'null', 'null', 'null', 0),
(11, '权限列表', 'Admin', 'Privilege', 'lst', 10),
(12, '添加权限', 'Admin', 'Privilege', 'add', 11),
(13, '修改权限', 'Admin', 'Privilege', 'edit', 11),
(14, '删除权限', 'Admin', 'Privilege', 'delete', 11),
(15, '角色列表', 'Admin', 'Role', 'lst', 10),
(16, '添加角色', 'Admin', 'Role', 'add', 15),
(17, '修改角色', 'Admin', 'Role', 'edit', 15),
(18, '删除角色', 'Admin', 'Role', 'delete', 15),
(19, '管理员列表', 'Admin', 'Admin', 'lst', 10),
(20, '添加管理员', 'Admin', 'Admin', 'add', 19),
(21, '修改管理员', 'Admin', 'Admin', 'edit', 19),
(22, '删除管理员', 'Admin', 'Admin', 'delete', 19),
(23, 'ajax修改状态', 'Admin', 'Admin', 'ajaxUpdateIsuse', 19),
(24, '类型列表', 'Admin', 'Type', 'lst', 3),
(25, '添加类型', 'Admin', 'Type', 'add', 24),
(26, '修改类型', 'Admin', 'Type', 'edit', 24),
(27, '删除类型', 'Admin', 'Type', 'delete', 24),
(28, '属性列表', 'Admin', 'Attribute', 'lst', 24),
(29, '添加属性', 'Admin', 'Attribute', 'add', 28),
(30, '修改属性', 'Admin', 'Attribute', 'edit', 28),
(31, '删除属性', 'Admin', 'Attribute', 'delete', 28),
(36, 'ajax获取商品属性', 'Admin', 'Goods', 'ajaxGetAttr', 1),
(38, '添加品牌', 'Admin', 'Brand', 'add', 37),
(37, '品牌列表', 'Admin', 'Brand', 'lst', 3),
(39, '修改品牌', 'Admin', 'Brand', 'edit', 37),
(40, '删除品牌', 'Admin', 'Brand', 'delete', 37),
(41, '会员管理', 'null', 'null', 'null', 0),
(42, '会员级别列表', 'Admin', 'MemberLevel', 'lst', 41),
(43, '添加会员级别', 'Admin', 'MemberLevel', 'add', 42),
(44, '修改会员级别', 'Admin', 'MemberLevel', 'edit', 42),
(45, '删除会员级别', 'Admin', 'MemberLevel', 'delete', 42),
(46, 'ajax删除图片', 'Admin', 'Goods', 'ajaxDelImage', 4),
(47, 'ajax删除商品属性', 'Admin', 'Goods', 'ajaxDelGoodsAttr', 4),
(48, '放入回收站', 'Admin', 'Goods', 'recycle', 1),
(49, '商品回收站', 'Admin', 'Goods', 'recyclelst', 3),
(50, '还原', 'Admin', 'Goods', 'restore', 1),
(51, '库存', 'Admin', 'Goods', 'goods_number', 1);

-- --------------------------------------------------------

--
-- 表的结构 `php34_reply`
--

CREATE TABLE IF NOT EXISTS `php34_reply` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL COMMENT '回复的内容',
  `addtime` int(10) unsigned NOT NULL COMMENT '回复时间',
  `member_id` mediumint(8) unsigned NOT NULL COMMENT '会员ID',
  `comment_id` mediumint(8) unsigned NOT NULL COMMENT '评论的ID',
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='回复' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `php34_role`
--

CREATE TABLE IF NOT EXISTS `php34_role` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='角色表' AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `php34_role`
--

INSERT INTO `php34_role` (`id`, `role_name`) VALUES
(3, '123'),
(6, '333'),
(8, '333333'),
(10, '商品管理员');

-- --------------------------------------------------------

--
-- 表的结构 `php34_role_privilege`
--

CREATE TABLE IF NOT EXISTS `php34_role_privilege` (
  `pri_id` smallint(5) unsigned NOT NULL COMMENT '权限的ID',
  `role_id` smallint(5) unsigned NOT NULL COMMENT '角色的id',
  KEY `pri_id` (`pri_id`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色权限表';

--
-- 转存表中的数据 `php34_role_privilege`
--

INSERT INTO `php34_role_privilege` (`pri_id`, `role_id`) VALUES
(9, 3),
(8, 3),
(7, 3),
(6, 3),
(4, 3),
(2, 3),
(1, 3),
(3, 3),
(3, 6),
(1, 6),
(2, 6),
(4, 6),
(5, 6),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(9, 10),
(8, 10),
(7, 10),
(6, 10),
(3, 10);

-- --------------------------------------------------------

--
-- 表的结构 `php34_type`
--

CREATE TABLE IF NOT EXISTS `php34_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商品类型' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `php34_type`
--

INSERT INTO `php34_type` (`id`, `type_name`) VALUES
(1, '手机'),
(2, '书'),
(3, '光盘'),
(4, '服装'),
(5, '笔记本');

-- --------------------------------------------------------

--
-- 表的结构 `php34_youhui_price`
--

CREATE TABLE IF NOT EXISTS `php34_youhui_price` (
  `goods_id` mediumint(8) unsigned NOT NULL COMMENT '商品id',
  `youhui_num` int(10) unsigned NOT NULL COMMENT '数量',
  `youhui_price` decimal(10,2) NOT NULL COMMENT '优惠价格',
  KEY `goods` (`goods_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品的优惠价格';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
