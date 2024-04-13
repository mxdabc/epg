-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2024-04-13 12:23:00
-- 服务器版本： 5.7.42-log
-- PHP 版本： 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `epg`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `content_type_id`, `codename`, `name`) VALUES
(1, 1, 'add_logentry', 'Can add log entry'),
(2, 1, 'change_logentry', 'Can change log entry'),
(3, 1, 'delete_logentry', 'Can delete log entry'),
(4, 1, 'view_logentry', 'Can view log entry'),
(5, 2, 'add_permission', 'Can add permission'),
(6, 2, 'change_permission', 'Can change permission'),
(7, 2, 'delete_permission', 'Can delete permission'),
(8, 2, 'view_permission', 'Can view permission'),
(9, 3, 'add_group', 'Can add group'),
(10, 3, 'change_group', 'Can change group'),
(11, 3, 'delete_group', 'Can delete group'),
(12, 3, 'view_group', 'Can view group'),
(13, 4, 'add_user', 'Can add user'),
(14, 4, 'change_user', 'Can change user'),
(15, 4, 'delete_user', 'Can delete user'),
(16, 4, 'view_user', 'Can view user'),
(17, 5, 'add_contenttype', 'Can add content type'),
(18, 5, 'change_contenttype', 'Can change content type'),
(19, 5, 'delete_contenttype', 'Can delete content type'),
(20, 5, 'view_contenttype', 'Can view content type'),
(21, 6, 'add_session', 'Can add session'),
(22, 6, 'change_session', 'Can change session'),
(23, 6, 'delete_session', 'Can delete session'),
(24, 6, 'view_session', 'Can view session'),
(25, 7, 'add_channel', 'Can add 频道列表'),
(26, 7, 'change_channel', 'Can change 频道列表'),
(27, 7, 'delete_channel', 'Can delete 频道列表'),
(28, 7, 'view_channel', 'Can view 频道列表'),
(29, 8, 'add_channel_list', 'Can add 频道来源整理表'),
(30, 8, 'change_channel_list', 'Can change 频道来源整理表'),
(31, 8, 'delete_channel_list', 'Can delete 频道来源整理表'),
(32, 8, 'view_channel_list', 'Can view 频道来源整理表'),
(33, 9, 'add_crawl_log', 'Can add 抓取日志'),
(34, 9, 'change_crawl_log', 'Can change 抓取日志'),
(35, 9, 'delete_crawl_log', 'Can delete 抓取日志'),
(36, 9, 'view_crawl_log', 'Can view 抓取日志'),
(37, 10, 'add_epg', 'Can add 节目表'),
(38, 10, 'change_epg', 'Can change 节目表'),
(39, 10, 'delete_epg', 'Can delete 节目表'),
(40, 10, 'view_epg', 'Can view 节目表');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` varchar(255) NOT NULL,
  `username` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` varchar(255) NOT NULL,
  `date_joined` datetime NOT NULL,
  `first_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `first_name`) VALUES
(1, 'pbkdf2_sha256$600000$oLXjllddOXrqJwNzKkk4vz$XG7jciyfvn7TgQGjollwM/Oj3cLn9Ruf77CdAkm6udk=', '2023-12-31 16:00:00', '1', 'admin', '', 'local@localhost', 1, '1', '2023-12-31 16:00:00', '');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` text,
  `object_repr` varchar(200) NOT NULL,
  `change_message` text NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'web', 'channel'),
(8, 'web', 'channel_list'),
(9, 'web', 'crawl_log'),
(10, 'web', 'epg');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` text NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2bw3x2il1k7yghuxas14r6csczl921j4', '.eJxVjMsOwiAUBf-FtSEFWsJ16d5vIPcBUjWQlHZl_Hdt0oVuz8ycl4q4rSVuPS1xFnVWRp1-N0J-pLoDuWO9Nc2trstMelf0Qbu-NknPy-H-HRTs5VsDk4MJ_Eg5BMRsrYhLZIBlQGsHH5wQWsmTc8jJ5AAcMrHxgQFGVO8PABA4yg:1rZWxt:0H5DqqSkwCpcee127TGPY2qtPPGLCdtAzomep8ERH20', '2024-02-26 14:07:21'),
('3s7i3397p2gfxceu4rmizh3gjfmtmdyy', '.eJxVjMsOwiAQRf-FtSHIa8Cle7-BADNI1UBS2pXx322TLnR7zzn3zUJclxrWQXOYkF3YmZ1-txTzk9oO8BHbvfPc2zJPie8KP-jgt470uh7u30GNo261V8qAArDCF5OVUaSNFsmpJKMhQgmYbSbtRHHWa_CCNmgLIUmyGdjnC71FN5Y:1rrzao:XAJmBQxi3zWs5Uf4OQDimGit3UXcJl649AUSchpkeCQ', '2024-04-17 12:19:51'),
('71geb1s5hy4xofrmfu8r6fxal41tagsb', '.eJxVjMsOwiAQRf-FtSHIa8Cle7-BADNI1UBS2pXx322TLnR7zzn3zUJclxrWQXOYkF3YmZ1-txTzk9oO8BHbvfPc2zJPie8KP-jgt470uh7u30GNo261V8qAArDCF5OVUaSNFsmpJKMhQgmYbSbtRHHWa_CCNmgLIUmyGdjnC71FN5Y:1rtqZb:OvPAL_13mjDAFmKRQLB0sNVd1irobouqRuobGTWfi0M', '2024-04-22 15:06:15'),
('7urfuoayrltuzbe69s341zcu4mftnb15', '.eJxVjMsOwiAQRf-FtSHIa8Cle7-BADNI1UBS2pXx322TLnR7zzn3zUJclxrWQXOYkF3YmZ1-txTzk9oO8BHbvfPc2zJPie8KP-jgt470uh7u30GNo261V8qAArDCF5OVUaSNFsmpJKMhQgmYbSbtRHHWa_CCNmgLIUmyGdjnC71FN5Y:1rtku3:2IQOIWyaE9XOtZp2QwLmfKBesPUOQzTUfxXdv8tbYSM', '2024-04-22 09:03:00'),
('8ji741c9cm8zo5so2w3r78n94kxvhs47', '.eJxVjMsOwiAQRf-FtSHIa8Cle7-BADNI1UBS2pXx322TLnR7zzn3zUJclxrWQXOYkF3YmZ1-txTzk9oO8BHbvfPc2zJPie8KP-jgt470uh7u30GNo261V8qAArDCF5OVUaSNFsmpJKMhQgmYbSbtRHHWa_CCNmgLIUmyGdjnC71FN5Y:1rtkfn:-3JeptWYwWW3oET6MMmZmAESCNqh1_l4J0rGkDuxPFc', '2024-04-22 08:48:16'),
('h5z2rhnxm4a6ss5u28tmwnbfbd8ekvkm', '.eJxVjEEOwiAQRe_C2pACCoxL956BDDODVA1NSrsy3l2bdKHb_977L5VwXWpau8xpZHVWRh1-t4z0kLYBvmO7TZqmtsxj1puid9r1dWJ5Xnb376Bir9-aMDqLgYMHw4UzYDT-BGg8UQwMztlSYjCDhSLsLQtkTyJMMJA7FvX-APRsOK8:1rrEVJ:pxsCMr812rPoRDrKO216zbKev3ihhY7RWbVVpiU-Jn4', '2024-04-15 10:03:02'),
('jpk8fav1fid0ncfegb3d5mqse2o651pl', '.eJxVjEsOwiAUAO_C2hCgj59L9z0DeQ-oVA0kpV0Z725IutDtzGTeLOCxl3D0vIU1sSuT7PLLCOMz1yHSA-u98djqvq3ER8JP2_ncUn7dzvZvULCXsfXgjDXkjHc6EgpLAOgUJSWmRStpHWUwagEdpyg8WVDCgAbtNMho2ecLteA2XQ:1rvUrg:pe46TVQn_uQjCuF58K_MJZS2v4fnusPx7HBtk7oEqtY', '2024-04-27 04:19:45'),
('l7mext4sv64jsne0cn877stflawvig01', '.eJxVjMEOwiAQBf-FsyGwwEI9evcbCCwgVQNJaU_Gf9cmPej1zcx7MR-2tfpt5MXPiZ2ZZKffLQZ65LaDdA_t1jn1ti5z5LvCDzr4taf8vBzu30ENo37ryZkswbmMyooYKSIVi4QCQSmSxljIKMJkwekEgCKRRmGKMFBIasXeH8BYNq8:1pa5YJ:UBi15Ar9JYTUrpkFAWAV4EABthO_21IzlFdyLS7SdIs', '2023-03-23 01:58:44'),
('pu3jania9gc4p2rjz05ksqtiosg2kos0', '.eJxVjMsOwiAQRf-FtSHIa8Cle7-BADNI1UBS2pXx322TLnR7zzn3zUJclxrWQXOYkF3YmZ1-txTzk9oO8BHbvfPc2zJPie8KP-jgt470uh7u30GNo261V8qAArDCF5OVUaSNFsmpJKMhQgmYbSbtRHHWa_CCNmgLIUmyGdjnC71FN5Y:1rrydK:M11MCowl1b1waUwGPK_ZmpcxmDE-1kKOMU9c_gQC8xY', '2024-04-17 11:18:23');

-- --------------------------------------------------------

--
-- 表的结构 `web_channel`
--

CREATE TABLE `web_channel` (
  `id` int(11) NOT NULL,
  `channel_id` varchar(300) NOT NULL,
  `tvg_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sort` varchar(50) NOT NULL,
  `logo` varchar(400) DEFAULT NULL,
  `last_program_date` date DEFAULT NULL,
  `last_crawl_dt` datetime DEFAULT NULL,
  `create_dt` datetime DEFAULT NULL,
  `descr` varchar(500) DEFAULT NULL,
  `has_epg` int(11) NOT NULL,
  `ineed` int(11) NOT NULL,
  `source` varchar(50) DEFAULT NULL,
  `recrawl` int(11) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `patten` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `web_channel`
--

INSERT INTO `web_channel` (`id`, `channel_id`, `tvg_name`, `name`, `sort`, `logo`, `last_program_date`, `last_crawl_dt`, `create_dt`, `descr`, `has_epg`, `ineed`, `source`, `recrawl`, `remark`, `patten`) VALUES
(1, '<cctv:cctv1><tvmao:CCTV-CCTV1><zhongshu:cctv1><tvsou:b3666b9d#yangshi><nowtv:G05-541><chuanliu:3342>', 'CCTV1', 'CCTV-1综合', '央视', 'https://live.mxdyeah.top/logo/CCTV1.png', '2024-04-13', '2024-04-11 16:32:05', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, NULL),
(2, '<cctv:cctv2><tvmao:CCTV-CCTV2><zhongshu:cctv2><tvsou:c5717c2d#yangshi><chuanliu:3351>', 'CCTV2', 'CCTV-2财经', '央视', 'https://live.mxdyeah.top/logo/CCTV2.png', '2024-04-14', '2024-04-08 09:04:07', '2023-07-01 00:00:00', NULL, 1, 1, 'zhongshu', 1, NULL, '(cctv|央视)(2(\\\\D|$)|2??财经)'),
(3, '<cctv:cctv3><tvmao:CCTV-CCTV3><zhongshu:cctv3><tvsou:53eda06f#yangshi><chuanliu:3353>', 'CCTV3', 'CCTV-3综艺', '央视', 'https://live.mxdyeah.top/logo/CCTV3.png', '2024-04-13', '2024-04-11 16:32:06', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(3|综艺)'),
(4, '<cctv:cctv4><tvmao:CCTV-CCTV4><zhongshu:cctv4><tvsou:0ccc41bf#yangshi><nowtv:G05-542><chuanliu:3355>', 'CCTV4', 'CCTV-4中文国际', '央视', 'https://live.mxdyeah.top/logo/CCTV4.png', '2024-04-13', '2024-04-11 16:32:07', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(4$|4[^k]|中文)'),
(5, '<cctv:cctv5><tvmao:CCTV-CCTV5><zhongshu:cctv5><tvsou:6b26bee1#yangshi><chuanliu:3359>', 'CCTV5', 'CCTV-5体育', '央视', 'https://live.mxdyeah.top/logo/CCTV5.png', '2024-04-13', '2024-04-11 16:32:09', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)5?($|体育$|体育频道|高清)'),
(6, '<chuanliu:3358><cctv:cctv5plus><tvmao:CCTV-CCTV5-PLUS><zhongshu:cctv5plus><tvsou:e4e3801d#yangshi>', 'CCTV5+', 'CCTV-5+体育赛事', '央视', 'https://live.mxdyeah.top/logo/CCTV5+.png', '2024-04-13', '2024-04-11 16:32:10', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(5(\\\\+|plus)|体育赛事)'),
(7, '<chuanliu:3361><cctv:cctv6><tvmao:CCTV-CCTV6><zhongshu:cctv6><tvsou:ddb707c0#yangshi>', 'CCTV6', 'CCTV-6电影', '央视', 'https://live.mxdyeah.top/logo/CCTV6.png', '2024-04-13', '2024-04-11 16:32:10', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(6|电影)'),
(8, '<chuanliu:3363><cctv:cctv7><tvmao:CCTV-CCTV7><zhongshu:cctv7><tvsou:f2d13f2a#yangshi>', 'CCTV7', 'CCTV-7国防军事', '央视', 'https://live.mxdyeah.top/logo/CCTV7.png', '2024-04-13', '2024-04-11 16:32:11', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(7|(国防|军事))'),
(9, '<chuanliu:3365><cctv:cctv8><tvmao:CCTV-CCTV8><zhongshu:cctv8><tvsou:13e8f054#yangshi>', 'CCTV8', 'CCTV-8电视剧', '央视', 'https://live.mxdyeah.top/logo/CCTV8.png', '2024-04-13', '2024-04-11 16:32:12', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(8|电视)'),
(10, '<chuanliu:3367><cctv:cctvjilu><tvmao:CCTV-CCTV9><zhongshu:cctvjilu><tvsou:8f932b7b#yangshi>', 'CCTV9', 'CCTV-9纪录', '央视', 'https://live.mxdyeah.top/logo/CCTV9.png', '2024-04-13', '2024-04-11 16:32:13', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(9|记录)'),
(11, '<chuanliu:3344><cctv:cctv10><tvmao:CCTV-CCTV10><zhongshu:cctv10><tvsou:CCTV-10#yangshi>', 'CCTV10', 'CCTV-10科教', '央视', 'https://live.mxdyeah.top/logo/CCTV10.png', '2024-04-13', '2024-04-11 16:32:13', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(10|科教)'),
(12, '<chuanliu:3345><cctv:cctv11><tvmao:CCTV-CCTV11><zhongshu:cctv11><tvsou:0a2de840#yangshi>', 'CCTV11', 'CCTV-11戏曲', '央视', 'https://live.mxdyeah.top/logo/CCTV11.png', '2024-04-13', '2024-04-11 16:32:14', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(11|戏曲)'),
(13, '<chuanliu:3348><cctv:cctv12><tvmao:CCTV-CCTV12><zhongshu:cctv12><tvsou:1e983148#yangshi>', 'CCTV12', 'CCTV-12社会与法', '央视', 'https://live.mxdyeah.top/logo/CCTV12.png', '2024-04-13', '2024-04-11 16:32:14', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(12|社会)'),
(14, '<chuanliu:3369><cctv:cctv13><tvmao:CCTV-CCTV13><zhongshu:cctv13><tvsou:f5b1a323#yangshi>', 'CCTV13', 'CCTV-13新闻', '央视', 'https://live.mxdyeah.top/logo/CCTV13.png', '2024-04-13', '2024-04-11 16:32:15', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(13|新闻)'),
(15, '<chuanliu:3371><cctv:cctvchild><tvmao:CCTV-CCTV15><zhongshu:cctvchild><tvsou:6fff4f43#yangshi>', 'CCTV14', 'CCTV-14少儿', '央视', 'https://live.mxdyeah.top/logo/CCTV14.png', '2024-04-13', '2024-04-11 16:32:17', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(14|少儿)'),
(16, '<chuanliu:3368><cctv:cctv15><tvmao:CCTV-CCTV16><zhongshu:cctv15><tvsou:3201ff16#yangshi>', 'CCTV15', 'CCTV-15音乐', '央视', 'https://live.mxdyeah.top/logo/CCTV15.png', '2024-04-13', '2024-04-11 16:32:18', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(15|音乐)'),
(17, '<cctv:cctv16><tvmao:CCTV-CCTV16><zhongshu:cctv16>', 'CCTV16', 'CCTV-16奥林匹克', '央视', 'https://live.mxdyeah.top/logo/CCTV16.png', '2024-04-13', '2024-04-11 16:32:19', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, NULL),
(18, '<cctv:cctv17><tvmao:CCTV-CCTV17>', 'CCTV17', 'CCTV-17农村农业', '央视', 'https://live.mxdyeah.top/logo/CCTV17.png', '2024-04-13', '2024-04-11 16:32:19', '2023-07-01 00:00:00', NULL, 1, 1, 'cctv', 1, NULL, '(cctv|央视)(17|(农村|农业))'),
(20, '<chuanliu:3864><cabletv:id=1&cid=15><icable:129>', 'CGTN', 'CGTN', '央视', 'https://live.mxdyeah.top/logo/CGTN.png', '2024-04-13', '2024-04-11 16:32:20', '2023-07-01 00:00:00', NULL, 1, 1, 'chuanliu', 1, NULL, 'cgtn($|[^d中])|中国国际电视'),
(28, '<chuanliu:3589><tvsou:ZJTV-1#weishi><tvmao:ZJTV-ZJTV1><zhongshu:zhejiang><nowtv:G05-555><icable:335>', '浙江卫视', '浙江卫视', '卫视', 'https://live.mxdyeah.top/logo/浙江卫视.png', '2024-04-13', '2024-04-11 16:32:21', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '浙江卫视'),
(29, '<chuanliu:3458><tvsou:JSTV-1#weishi><tvmao:JSTV-JSTV1><zhongshu:jiangsu>', '江苏卫视', '江苏卫视', '卫视', 'https://live.mxdyeah.top/logo/江苏卫视.png', '2024-04-13', '2024-04-11 16:32:23', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '江苏卫视'),
(30, '<chuanliu:3338><tvsou:696f2203#weishi><tvmao:BTV-BTV1><zhongshu:btv1><tianyi:00000110240129>', '北京卫视', '北京卫视', '卫视', 'https://live.mxdyeah.top/logo/北京卫视.png', '2024-04-13', '2024-04-11 16:32:24', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '北京卫视'),
(31, '<chuanliu:3521><tvsou:SMG#weishi><tvmao:SHHAI-DONGFANG1><zhongshu:dongfang><icable:334>', '东方卫视', '东方卫视', '卫视', 'https://live.mxdyeah.top/logo/东方卫视.png', '2024-04-13', '2024-04-11 16:32:25', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '东方卫视'),
(32, '<chuanliu:3327><tvsou:AHTV-1#weishi><tvmao:AHTV-AHTV1><zhongshu:anhui>', '安徽卫视', '安徽卫视', '卫视', 'https://live.mxdyeah.top/logo/安徽卫视.png', '2024-04-13', '2024-04-11 16:32:26', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '安徽卫视'),
(33, '<chuanliu:3415><tvsou:GDTV-1#weishi><tvmao:GDTV-GDTV1><zhongshu:guangdong><gdtv:1>', '广东卫视', '广东卫视', '卫视', 'https://live.mxdyeah.top/logo/广东卫视.png', '2024-04-13', '2024-04-11 16:32:27', '2023-07-01 00:00:00', NULL, 1, 1, 'gdtv', 1, NULL, '广东卫视'),
(34, '<chuanliu:3556><tvsou:SHENZHENTV-1#weishi><tvmao:SZTV-SZTV1><zhongshu:shenzhen><nowtv:G05-540>', '深圳卫视', '深圳卫视', '卫视', 'https://live.mxdyeah.top/logo/深圳卫视.png', '2024-04-13', '2024-04-11 16:32:28', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '深圳卫视'),
(36, '<chuanliu:3471><tvsou:LNTV-1#weishi><tvmao:LNTV-LNTV1><zhongshu:liaoning>', '辽宁卫视', '辽宁卫视', '卫视', 'https://live.mxdyeah.top/logo/辽宁卫视.png', '2024-04-13', '2024-04-11 16:32:29', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '辽宁卫视'),
(37, '<chuanliu:3428><tvmao:TCTC-TCTC1>', '旅游卫视', '海南卫视', '卫视', 'https://live.mxdyeah.top/logo/海南卫视.png', '2024-04-13', '2024-04-11 16:32:30', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '旅游卫视|海南卫视'),
(38, '<chuanliu:3514><tvsou:SDTV-1#weishi><tvmao:SDTV-SDTV1><zhongshu:shandong>', '山东卫视', '山东卫视', '卫视', 'https://live.mxdyeah.top/logo/山东卫视.png', '2024-04-13', '2024-04-11 16:32:32', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '山东卫视'),
(39, '<chuanliu:3558><tvsou:TJTV-1#weishi><tvmao:TJTV-TJTV1><zhongshu:tianjin>', '天津卫视', '天津卫视', '卫视', 'https://live.mxdyeah.top/logo/天津卫视.png', '2024-04-13', '2024-04-11 16:32:33', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '天津卫视'),
(40, '<chuanliu:3399><tvsou:CQTV-1#weishi><tvmao:CCQTV-CCQTV1><zhongshu:chongqing>', '重庆卫视', '重庆卫视', '卫视', 'https://live.mxdyeah.top/logo/重庆卫视.png', '2024-04-13', '2024-04-11 16:32:34', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '重庆卫视'),
(41, '<chuanliu:3410><tvsou:DNWS#weishi><tvmao:FJTV-FJTV2><zhongshu:fujian>', '东南卫视', '东南卫视', '卫视', 'https://live.mxdyeah.top/logo/东南卫视.png', '2024-04-13', '2024-04-11 16:32:35', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '东南卫视'),
(42, '<chuanliu:3421><tvsou:GSTV-1#weishi><tvmao:GSTV-GSTV1><zhongshu:gansu>', '甘肃卫视', '甘肃卫视', '卫视', 'https://live.mxdyeah.top/logo/甘肃卫视.png', '2024-04-13', '2024-04-11 16:32:36', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '甘肃卫视'),
(43, '<chuanliu:3424><tvsou:GXTV--1#weishi><tvmao:GUANXI-GUANXI1><zhongshu:guangxi>', '广西卫视', '广西卫视', '卫视', 'https://live.mxdyeah.top/logo/广西卫视.png', '2024-04-13', '2024-04-11 16:32:38', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '广西卫视'),
(44, '<chuanliu:3426><tvsou:GZTV-1#weishi><tvmao:GUIZOUTV-GUIZOUTV1><zhongshu:guizhou>', '贵州卫视', '贵州卫视', '卫视', 'https://live.mxdyeah.top/logo/贵州卫视.png', '2024-04-13', '2024-04-11 16:32:39', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '贵州卫视'),
(45, '<tvsou:HEBTV-1#weishi><tvmao:HEBEI-HEBEI1><zhongshu:hebei>', '河北卫视', '河北卫视', '卫视', 'https://live.mxdyeah.top/logo/河北卫视.png', '2024-04-14', '2024-04-08 09:06:23', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '河北卫视'),
(46, '<chuanliu:3436><tvsou:HLJTV-1#weishi><tvmao:HLJTV-HLJTV1><zhongshu:heilongjiang>', '黑龙江卫视', '黑龙江卫视', '卫视', 'https://live.mxdyeah.top/logo/黑龙江卫视.png', '2024-04-13', '2024-04-11 16:32:40', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '黑龙江卫视'),
(47, '<chuanliu:3431><tvsou:HENANTV-1#weishi><tvmao:HNTV-HNTV1><zhongshu:henan><', '河南卫视', '河南卫视', '卫视', 'https://live.mxdyeah.top/logo/河南卫视.png', '2024-04-13', '2024-04-11 16:32:41', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '河南卫视'),
(48, '<chuanliu:3439><tvsou:526cbae7#weishi><tvmao:HUBEI-HUBEI1><zhongshu:hubei><icable:337>', '湖北卫视', '湖北卫视', '卫视', 'https://live.mxdyeah.top/logo/湖北卫视.png', '2024-04-13', '2024-04-11 16:32:42', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '湖北卫视'),
(50, '<chuanliu:3467><tvsou:JXTV-1#weishi><tvmao:JXTV-JXTV1><zhongshu:jiangxi>', '江西卫视', '江西卫视', '卫视', 'https://live.mxdyeah.top/logo/江西卫视.png', '2024-04-13', '2024-04-11 16:32:43', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '江西卫视'),
(51, '<chuanliu:3451><tvsou:JLTV-1#weishi><tvmao:JILIN-JILIN1><zhongshu:jilin>', '吉林卫视', '吉林卫视', '卫视', 'https://live.mxdyeah.top/logo/吉林卫视.png', '2024-04-13', '2024-04-11 16:32:45', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '吉林卫视'),
(52, '<chuanliu:3476><tvsou:NMGTV-1#weishi><tvmao:NMGTV-NMGTV1><zhongshu:neimenggu>', '内蒙古卫视', '内蒙古卫视', '卫视', 'https://live.mxdyeah.top/logo/内蒙古卫视.png', '2024-04-13', '2024-04-11 16:32:46', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '内蒙古??卫视'),
(53, '<tvsou:NXTV-1#weishi><tvmao:NXTV-NXTV2><zhongshu:ningxia>', '宁夏卫视', '宁夏卫视', '卫视', 'https://live.mxdyeah.top/logo/宁夏卫视.png', '2024-04-14', '2024-04-08 09:06:42', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '宁夏卫视'),
(54, '<chuanliu:3551><tvsou:SHANXITV-1#weishi><tvmao:SXTV-SXTV1><zhongshu:shan1xi>', '山西卫视', '山西卫视', '卫视', 'https://live.mxdyeah.top/logo/山西卫视.png', '2024-04-13', '2024-04-11 16:32:47', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '山西卫视'),
(55, '<chuanliu:3515><tvsou:SXTV-1#weishi><tvmao:SHXITV-SHXITV1><zhongshu:shan3xi>', '陕西卫视', '陕西卫视', '卫视', 'https://live.mxdyeah.top/logo/陕西卫视.png', '2024-04-13', '2024-04-11 16:32:48', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '陕西卫视'),
(58, '<chuanliu:3582><tvsou:3a19b822#weishi><tvmao:YNTV-YNTV1><zhongshu:yunnan>', '云南卫视', '云南卫视', '卫视', 'https://live.mxdyeah.top/logo/云南卫视.png', '2024-04-13', '2024-04-11 16:32:50', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '云南卫视'),
(63, '<tvsou:YANBIANTV-1#weishi><tvmao:YANBIAN-YANBIAN1>', '延边卫视', '延边卫视', '上海', 'https://live.mxdyeah.top/logo/延边卫视.png', '2024-04-13', '2024-04-11 16:32:51', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '延边卫视'),
(65, '<tvsou:HHWS#weishi><tvmao:CYRTV-HHWS>', '黄河卫视', '黄河卫视', '卫视', 'https://live.mxdyeah.top/logo/黄河卫视.png', '2024-04-13', '2024-04-11 16:32:52', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '黄河卫视'),
(67, '<chuanliu:3339><tvmao:BTV-BTV10><tvsou:648e72a2#beijing-110000><btv:142>', '卡酷动画', '卡酷动画', '卫视', 'https://live.mxdyeah.top/logo/卡酷少儿.png', '2024-04-13', '2024-04-11 16:32:53', '2023-07-01 00:00:00', NULL, 1, 1, 'chuanliu', 1, NULL, '卡酷(动画|少儿)'),
(68, '<tvsou:XIAMENTV-1#weishi><tvmao:XMTV-XMTV5>', '厦门卫视', '厦门卫视', '北京', 'https://live.mxdyeah.top/logo/厦门卫视.png', '2024-04-13', '2024-04-11 16:32:54', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '厦门卫视'),
(69, '<chuanliu:3446><tvsou:bc0c3927#hunan-430000><tvmao:HUNANTV-HUNANTV2><tvsou:bc0c3927#hunan-430000>', '金鹰卡通', '金鹰卡通', '卫视', 'https://live.mxdyeah.top/logo/湖南金鹰卡通.png', '2024-04-13', '2024-04-11 16:32:55', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '(湖南)??金鹰卡通'),
(70, '<chuanliu:3494><tvsou:5ccb1172#weishi><tvmao:SCTV-KAMBA-TV><tvsou:KBWS#sichuan-510000>', '康巴卫视', '康巴卫视', '卫视', 'https://live.mxdyeah.top/logo/康巴卫视.png', '2024-04-13', '2024-04-11 16:32:57', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '康巴卫视'),
(71, '<chuanliu:3580><tvsou:XZTV-1#weishi><tvmao:XIZANGTV-XIZANGTV2><zhongshu:xizang>', '西藏卫视', '西藏卫视', '卫视', 'https://live.mxdyeah.top/logo/西藏卫视.png', '2024-04-13', '2024-04-11 16:32:57', '2023-07-01 00:00:00', NULL, 1, 1, 'chuanliu', 1, NULL, '西藏卫视'),
(72, '<tvsou:ssws#weishi><tvmao:SSTV-SANSHATV><nowtv:G05-553>', '三沙卫视', '三沙卫视', '卫视', 'https://live.mxdyeah.top/logo/三沙卫视.png', '2024-04-13', '2024-04-11 16:32:58', '2023-07-01 00:00:00', NULL, 1, 1, 'tvmao', 1, NULL, '三沙卫视'),
(73, '<chuanliu:3393><tvmao:CETV-CETV1><zhongshu:cetv1><tvsou:5a44bb16#yangshi>', '中国教育1台', '教育1台', '卫视', 'https://live.mxdyeah.top/logo/CETV1.png', '2024-04-13', '2024-04-11 16:32:59', '2023-07-01 00:00:00', NULL, 1, 1, 'chuanliu', 1, NULL, '^(中国)??教育(电视台)??(1|一)'),
(74, '<chuanliu:3394><tvmao:CETV-CETV2><tvsou:e04d023a#yangshi>', '中国教育2台', '教育2台', '数字付费', 'https://live.mxdyeah.top/logo/CETV4.png', '2024-04-13', '2024-04-11 16:33:00', '2023-07-01 00:00:00', NULL, 1, 1, 'chuanliu', 0, NULL, '^(中国)??教育(电视台)??(2|二)'),
(76, '<tvmao:HUNANTV-HUNANTV1>', '湖南卫视', '湖南卫视', '卫视', 'https://live.imxd.top/logo/湖南卫视.png', '2024-04-13', '2024-04-11 16:33:01', '2024-04-09 15:42:17', NULL, 1, 1, 'tvmao', 1, NULL, '湖南卫视');

-- --------------------------------------------------------

--
-- 表的结构 `web_channel_list`
--

CREATE TABLE `web_channel_list` (
  `id` int(11) NOT NULL,
  `inner_channel_id` int(11) NOT NULL,
  `out_channel_id` varchar(100) NOT NULL,
  `inner_name` varchar(20) NOT NULL,
  `out_name` varchar(20) NOT NULL,
  `source` varchar(20) NOT NULL,
  `is_alive` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `update_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `web_crawl_log`
--

CREATE TABLE `web_crawl_log` (
  `id` int(11) NOT NULL,
  `dt` datetime NOT NULL,
  `msg` text NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- 表的结构 `web_epg`
--

CREATE TABLE `web_epg` (
  `id` int(11) NOT NULL,
  `channel_id` varchar(50) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `descr` text,
  `program_date` date NOT NULL,
  `crawl_dt` datetime DEFAULT NULL,
  `source` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转储表的索引
--

--
-- 表的索引 `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sqlite_autoindex_auth_group_1` (`name`);

--
-- 表的索引 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`),
  ADD KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`);

--
-- 表的索引 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  ADD KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`);

--
-- 表的索引 `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sqlite_autoindex_auth_user_1` (`username`);

--
-- 表的索引 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544` (`group_id`),
  ADD KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`);

--
-- 表的索引 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`),
  ADD KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`);

--
-- 表的索引 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_user_id_c564eba6` (`user_id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`);

--
-- 表的索引 `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- 表的索引 `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- 表的索引 `web_channel`
--
ALTER TABLE `web_channel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_channel_recrawl_6fee02e1` (`recrawl`),
  ADD KEY `web_channel_source_96a7eb09` (`source`),
  ADD KEY `web_channel_ineed_805ba0a2` (`ineed`),
  ADD KEY `web_channel_has_epg_5bfcecdd` (`has_epg`),
  ADD KEY `web_channel_last_program_date_eaef95db` (`last_program_date`),
  ADD KEY `web_channel_sort_123332c5` (`sort`),
  ADD KEY `web_channel_name_a76f0fc3` (`name`),
  ADD KEY `web_channel_tvg_name_16cbd0e1` (`tvg_name`);

--
-- 表的索引 `web_channel_list`
--
ALTER TABLE `web_channel_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_channel_list_inner_channel_id_3d070728` (`inner_channel_id`);

--
-- 表的索引 `web_crawl_log`
--
ALTER TABLE `web_crawl_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_crawl_log_dt_b86f9a22` (`dt`);

--
-- 表的索引 `web_epg`
--
ALTER TABLE `web_epg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_epg_program_date_b01641c3` (`program_date`),
  ADD KEY `web_epg_starttime_e7e4c8be` (`starttime`),
  ADD KEY `web_epg_channel_id_61467185` (`channel_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- 使用表AUTO_INCREMENT `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `web_channel`
--
ALTER TABLE `web_channel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- 使用表AUTO_INCREMENT `web_channel_list`
--
ALTER TABLE `web_channel_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `web_crawl_log`
--
ALTER TABLE `web_crawl_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `web_epg`
--
ALTER TABLE `web_epg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 限制导出的表
--

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_FK_0_0` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_FK_1_0` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_FK_0_0` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_FK_0_0` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_FK_1_0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_FK_0_0` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_FK_1_0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_FK_0_0` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_FK_1_0` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
