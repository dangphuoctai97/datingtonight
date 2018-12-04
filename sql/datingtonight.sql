-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 04, 2018 lúc 04:07 PM
-- Phiên bản máy phục vụ: 10.1.33-MariaDB
-- Phiên bản PHP: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `datingtonight`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `administrator`
--

CREATE TABLE `administrator` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `fullname` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `administrator`
--

INSERT INTO `administrator` (`id_admin`, `username`, `password`, `fullname`, `id_role`) VALUES
(1, 'tonquan', '$2y$10$igvgiXBTOJlRqfppDp08xOiod9RveoHGLaVFwCpmHrjDLiKzAccZm', 'Tôn Quân', 1),
(2, 'tandam', '123456', 'Tân Đàm', 2),
(3, 'toyen', '123456', 'Tố Yên', 3),
(4, 'anhvan', '123456', 'Anh Văn', 4),
(5, 'phuoctai', '123456', 'Phước Tài', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role`
--

CREATE TABLE `admin_role` (
  `id_role` int(11) NOT NULL,
  `name_role` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role`
--

INSERT INTO `admin_role` (`id_role`, `name_role`) VALUES
(1, 'Admin'),
(2, 'Mod'),
(3, 'Managing Dating Places'),
(4, 'Managing Flirting Method'),
(5, 'Managing Finding  Suitable Person');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `body`
--

CREATE TABLE `body` (
  `id` int(11) NOT NULL,
  `body` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `body`
--

INSERT INTO `body` (`id`, `body`) VALUES
(0, 'Please input your body'),
(1, 'Slim'),
(2, 'Thin'),
(3, 'Fat');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `city`
--

INSERT INTO `city` (`id`, `city`) VALUES
(1, 'Đà Nẵng'),
(2, 'Hà Nội'),
(3, 'Anything');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment_dating_places`
--

CREATE TABLE `comment_dating_places` (
  `comment_place_id` int(11) NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_place` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment_dating_places_rep`
--

CREATE TABLE `comment_dating_places_rep` (
  `rep_place_id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `rep_content` text COLLATE utf8_unicode_ci NOT NULL,
  `rep_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `comment_place_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `constellation`
--

CREATE TABLE `constellation` (
  `id` int(11) NOT NULL,
  `constellation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `constellation`
--

INSERT INTO `constellation` (`id`, `constellation`) VALUES
(0, 'Your constellation'),
(1, 'Aquarius'),
(2, 'Scorpion'),
(3, 'Lion');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `datingplaces`
--

CREATE TABLE `datingplaces` (
  `id_place` int(11) NOT NULL,
  `name_place` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_type` int(11) NOT NULL,
  `preview_text` text COLLATE utf8_unicode_ci NOT NULL,
  `detail_place` text COLLATE utf8_unicode_ci NOT NULL,
  `picture` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `count_number` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `datingplaces`
--

INSERT INTO `datingplaces` (`id_place`, `name_place`, `city`, `id_type`, `preview_text`, `detail_place`, `picture`, `date_created`, `count_number`) VALUES
(12, 'The Top Bar', 'Đà Nẵng', 1, '<p><span style=\"color: #1a1a1a; font-family: arial, helvetica, sans-serif; text-align: justify; background-color: #f5f5f5;\">Đ&acirc;y l&agrave; địa điểm rất nổi tiếng nhất nh&igrave; th&agrave;nh phố Đ&agrave; Nẵng, được thiết kế theo phong c&aacute;ch tinh tế v&agrave; đầy sang trọng</span></p>', '<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">Địa chỉ: nằm tr&ecirc;n tầng 23 kh&aacute;ch sạn 4 sao A La Carte Da Nang Beach đường V&otilde; Nguy&ecirc;n Gi&aacute;p, quận Sơn Tr&agrave; th&agrave;nh phố Đ&agrave; Nẵng.</span></p>\r\n<div class=\"fb-quote fb_iframe_widget\" style=\"box-sizing: border-box; display: inline-block; position: absolute; left: 12.5px; top: 1385px;\"><span style=\"box-sizing: border-box; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 169px; height: 47px;\"><iframe class=\"\" style=\"box-sizing: border-box; position: absolute; border-width: initial; border-style: none; visibility: visible; width: 169px; height: 47px;\" title=\"fb:quote Facebook Social Plugin\" src=\"https://www.facebook.com/v2.8/plugins/quote.php?app_id=1216538601705933&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df126511ab514d04%26domain%3Dwww.vntrip.vn%26origin%3Dhttps%253A%252F%252Fwww.vntrip.vn%252Ff3a1318beed4428%26relation%3Dparent.parent&amp;container_width=653&amp;href=https%3A%2F%2Fwww.vntrip.vn%2Fcam-nang%2Fdia-diem-hen-ho-da-nang-danh-cho-cap-doi-34881&amp;locale=en_US&amp;sdk=joey\" name=\"f3074a890f6c9d4\" width=\"1000px\" height=\"1000px\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"true\"></iframe></span></div>\r\n<p><span style=\"box-sizing: border-box;\">&nbsp;</span></p>\r\n<p>&nbsp;</p>\r\n<div id=\"attachment_34886\" class=\"wp-caption aligncenter\" style=\"box-sizing: border-box; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; max-width: 650px;\"><img class=\"wp-image-34886 size-full\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Hẹn h&ograve; tr&ecirc;n The Top Bar \" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/10/h%E1%BA%B9n-ho-da-nang-3-e1507283275771.png\" alt=\"Hẹn h&ograve; tr&ecirc;n The Top Bar \" width=\"640\" height=\"499\" />\r\n<p class=\"wp-caption-text\" style=\"box-sizing: border-box; margin: 0px 0px 20px;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\"><em style=\"box-sizing: border-box;\">Hẹn h&ograve; tr&ecirc;n The Top Bar (ảnh sưu tầm)</em></span></p>\r\n</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\"><span style=\"box-sizing: border-box;\">Đ&acirc;y l&agrave; địa điểm rất nổi tiếng nhất nh&igrave; th&agrave;nh phố Đ&agrave; Nẵng, được thiết kế theo phong c&aacute;ch tinh tế v&agrave; đầy sang trọng.&nbsp;Từ The Top Bar l&agrave; một trong những&nbsp;</span><span style=\"box-sizing: border-box; font-weight: bold;\">địa điểm hẹn h&ograve; Đ&agrave; Nẵng</span><span style=\"box-sizing: border-box;\">&nbsp;bạn kh&ocirc;ng thể bỏ qua. Tới đ&acirc;y bạn c&oacute; thể ng&acirc;m m&igrave;nh trong bể bơi s&aacute;t m&eacute;p tường hướng ra biển m&ecirc;nh m&ocirc;ng ph&oacute;ng tầm nh&igrave;n chi&ecirc;m ngưỡng cảnh b&igrave;nh minh v&agrave; ho&agrave;ng h&ocirc;n ấn tượng nhất ở th&agrave;nh phố biển.</span></span></p>\r\n<div id=\"attachment_34885\" class=\"wp-caption aligncenter\" style=\"box-sizing: border-box; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; max-width: 650px;\"><img class=\"wp-image-34885 size-full\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Đ&oacute;n b&igrave;nh minh tr&ecirc;n tầng The Top Bar\" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/10/hen-ho-da-nang-2-e1507283133907.png\" alt=\"Đ&oacute;n b&igrave;nh minh tr&ecirc;n tầng The Top Bar\" width=\"640\" height=\"426\" />\r\n<p class=\"wp-caption-text\" style=\"box-sizing: border-box; margin: 0px 0px 20px;\"><em style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">Đ&oacute;n b&igrave;nh minh tr&ecirc;n tầng The Top Bar (ảnh sưu tầm)</span></em></p>\r\n</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">Nhiều du kh&aacute;ch chia sẻ rằng cảm gi&aacute;c khi đứng tr&ecirc;n The Top Bar họ cảm thấy như được h&ograve;a l&agrave;m một giữa l&agrave;n nước v&agrave; bầu trời tr&ecirc;n cao. Từ tr&ecirc;n cao, kh&ocirc;ng gian nơi đ&acirc;y cực k&igrave; tho&aacute;ng đ&atilde;ng bạn c&oacute; thể nh&igrave;n thấy mọi người đang vui chơi ngo&agrave;i b&atilde;i biển.</span></p>\r\n<div id=\"attachment_34882\" class=\"wp-caption aligncenter\" style=\"box-sizing: border-box; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; max-width: 650px;\"><img class=\"wp-image-34882 size-full\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"The Top Bar về đ&ecirc;m đầy lung linh\" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/10/hen-ho-da-nang-e1507283204521.png\" alt=\"The Top Bar về đ&ecirc;m đầy lung linh\" width=\"640\" height=\"480\" />\r\n<p class=\"wp-caption-text\" style=\"box-sizing: border-box; margin: 0px 0px 20px;\"><em style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">The Top Bar về đ&ecirc;m đầy lung linh (ảnh sưu tầm)</span></em></p>\r\n</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">Tr&ecirc;n s&acirc;n thượng c&ograve;n c&oacute; một qu&aacute;n bar, phục vụ nhiều đồ uống đa dạng, chất lượng m&agrave; gi&aacute; cũng phải chăng. Bạn c&oacute; thể thư th&aacute;i nằm d&agrave;i tr&ecirc;n những chiếc ghế đệm để ngắm nh&igrave;n th&agrave;nh phố v&agrave; cảnh biển trong một ng&agrave;y lười biếng.</span></p>', 'arJpXNoOlrtqMtbCPj6ZGyGF91aaFRG6byY3ZEpB.png', '2018-11-12 12:54:43', 12),
(13, 'Sky 36 – sky bar', 'Đà Nẵng', 1, '<p><span style=\"color: #1a1a1a; font-family: arial, helvetica, sans-serif; text-align: justify; background-color: #f5f5f5;\">Sky 36 l&agrave; sky bar cao nhất Việt Nam với độ cao 166 m, cũng l&agrave; nơi hội ngộ của những thượng kh&aacute;ch lịch l&atilde;m v&agrave; s&agrave;nh điệu tại Đ&agrave; Nẵng.</span></p>', '<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">Địa chỉ: nằm tr&ecirc;n tầng 35 -36 của kh&aacute;ch sạn Novotel Danang Premier Han River, 36 Bạch Đằng quận Hải Ch&acirc;u th&agrave;nh phố Đ&agrave; Nẵng.</span></p>\r\n<div class=\"fb-quote fb_iframe_widget\" style=\"box-sizing: border-box; display: inline-block; position: absolute; left: 172.5px; top: 3267px;\"><span style=\"box-sizing: border-box; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 169px; height: 47px;\"><iframe class=\"\" style=\"box-sizing: border-box; position: absolute; border-width: initial; border-style: none; visibility: visible; width: 169px; height: 47px;\" title=\"fb:quote Facebook Social Plugin\" src=\"https://www.facebook.com/v2.8/plugins/quote.php?app_id=1216538601705933&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df126511ab514d04%26domain%3Dwww.vntrip.vn%26origin%3Dhttps%253A%252F%252Fwww.vntrip.vn%252Ff3a1318beed4428%26relation%3Dparent.parent&amp;container_width=653&amp;href=https%3A%2F%2Fwww.vntrip.vn%2Fcam-nang%2Fdia-diem-hen-ho-da-nang-danh-cho-cap-doi-34881&amp;locale=en_US&amp;sdk=joey\" name=\"f3074a890f6c9d4\" width=\"1000px\" height=\"1000px\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"true\"></iframe></span></div>\r\n<p><span style=\"box-sizing: border-box;\"><br style=\"box-sizing: border-box;\" /></span><span style=\"box-sizing: border-box;\">Sky 36 l&agrave; sky bar cao nhất Việt Nam với độ cao 166 m, cũng l&agrave; nơi hội ngộ của những thượng kh&aacute;ch lịch l&atilde;m v&agrave; s&agrave;nh điệu tại Đ&agrave; Nẵng.</span></p>\r\n<p>&nbsp;</p>\r\n<div id=\"attachment_34889\" class=\"wp-caption aligncenter\" style=\"box-sizing: border-box; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; max-width: 650px;\"><img class=\"wp-image-34889 size-full\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Ngắm to&agrave;n cảnh Đ&agrave; Nẵng về đ&ecirc;m tr&ecirc;n Sky 3\" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/10/hen-ho-da-nang-5-e1507283337798.png\" alt=\"Ngắm to&agrave;n cảnh Đ&agrave; Nẵng về đ&ecirc;m tr&ecirc;n Sky 3\" width=\"640\" height=\"425\" />\r\n<p class=\"wp-caption-text\" style=\"box-sizing: border-box; margin: 0px 0px 20px;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\"><em style=\"box-sizing: border-box;\">Ngắm to&agrave;n cảnh Đ&agrave; Nẵng về đ&ecirc;m tr&ecirc;n Sky 36 (ảnh sưu tầm)</em></span></p>\r\n</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">Những kh&aacute;ch du lịch đến Đ&agrave; Nẵng ưa sự nhộn nhịp th&igrave; chắc hẳn kh&ocirc;ng thể bỏ qua Sky 36. Được khen ngợi v&igrave; vị tr&iacute; đẹp d&agrave;nh cho những ai muốn ngồi h&oacute;ng gi&oacute;, ngắm to&agrave;n cảnh th&agrave;nh phố từ l&uacute;c ho&agrave;ng h&ocirc;n tới khi đ&ecirc;m muộn.</span></p>\r\n<div id=\"attachment_34887\" class=\"wp-caption aligncenter\" style=\"box-sizing: border-box; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; max-width: 651px;\"><img class=\"wp-image-34887 \" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Kh&ocirc;ng gian v&ocirc; c&ugrave;ng l&atilde;ng mạn ở Sky 36 \" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/10/hen-ho-da-nang-4.png\" alt=\"Kh&ocirc;ng gian v&ocirc; c&ugrave;ng l&atilde;ng mạn ở Sky 36 \" width=\"641\" height=\"423\" />\r\n<p class=\"wp-caption-text\" style=\"box-sizing: border-box; margin: 0px 0px 20px;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\"><em style=\"box-sizing: border-box;\">Kh&ocirc;ng gian v&ocirc; c&ugrave;ng l&atilde;ng mạn ở Sky 36 (ảnh sưu tầm)</em></span></p>\r\n</div>\r\n<div id=\"attachment_34891\" class=\"wp-caption aligncenter\" style=\"box-sizing: border-box; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; max-width: 650px;\"><img class=\"wp-image-34891 size-full\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Thiết kế tinh tế v&agrave; đầy sang trọng ở Sky 36\" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/10/hen-ho-da-nang-6-e1507283483441.png\" alt=\"Thiết kế tinh tế v&agrave; đầy sang trọng ở Sky 36\" width=\"640\" height=\"426\" />\r\n<p class=\"wp-caption-text\" style=\"box-sizing: border-box; margin: 0px 0px 20px;\"><em style=\"box-sizing: border-box;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">Thiết kế tinh tế v&agrave; đầy sang trọng ở Sky 36 (ảnh sưu tầm)</span></em></p>\r\n</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box; font-family: arial, helvetica, sans-serif;\">Từ nơi đ&acirc;y bạn c&oacute; thể ngắm trọn cả th&agrave;nh phố Đ&agrave; Nẵng từ những c&acirc;y cầu, ng&ocirc;i nh&agrave; v&agrave; cả d&ograve;ng s&ocirc;ng H&agrave;n&hellip;Một điểm nhấn đặc biệt của Sky 36 ch&iacute;nh l&agrave; kh&ocirc;ng gian bed sofa c&oacute; hướng nh&igrave;n ra biển v&agrave; kh&ocirc;ng gian ngắm nh&igrave;n to&agrave;n cảnh mặt trời lặn l&atilde;ng mạn ngay tại trung t&acirc;m th&agrave;nh phố.</span></p>', '2oL6517vVdyCKAkoeRZcKQs97qyIbNAVlGIFnLmu.png', '2018-11-12 12:54:47', 33),
(15, 'Bà Nà Hills', 'Đà Nẵng', 4, '<p><span style=\"color: #1a1a1a; font-family: \'Open Sans\', sans-serif; text-align: justify; background-color: #f5f5f5;\">&nbsp;B&agrave; N&agrave; Hills ch&iacute;nh l&agrave; một ch&acirc;u &Acirc;u thu nhỏ ngay tr&ecirc;n đỉnh n&uacute;i, một trong c&aacute;c địa điểm&nbsp;</span><span style=\"box-sizing: border-box; font-weight: 600; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; text-align: justify; background-color: #f5f5f5;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #438dc4; text-decoration-line: none; cursor: pointer; transition: all 0.2s ease-in-out 0s;\" href=\"https://www.vntrip.vn/cam-nang/cam-nag-du-lich-da-nang-tu-a-z-12374\">du lịch Đ&agrave; Nẵng</a></span><span style=\"color: #1a1a1a; font-family: \'Open Sans\', sans-serif; text-align: justify; background-color: #f5f5f5;\">&nbsp;độc đ&aacute;o v&agrave; v&ocirc; gi&aacute; của Việt Nam</span></p>', '<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box;\">Ai đến Đ&agrave; Nẵng lần đầu đều sẽ c&oacute; mong muốn &ldquo;ch&aacute;y bỏng&rdquo; được tham quan B&agrave; N&agrave; Hills bởi vẻ đẹp đ&atilde; được rất nhiều du kh&aacute;ch khen ngợi của nơi đ&acirc;y. C&oacute; thể n&oacute;i,&nbsp;B&agrave; N&agrave; Hills ch&iacute;nh l&agrave; một ch&acirc;u &Acirc;u thu nhỏ ngay tr&ecirc;n đỉnh n&uacute;i, một trong c&aacute;c địa điểm&nbsp;<span style=\"box-sizing: border-box; font-weight: 600;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #438dc4; text-decoration-line: none; cursor: pointer; transition: all 0.2s ease-in-out 0s;\" href=\"https://www.vntrip.vn/cam-nang/cam-nag-du-lich-da-nang-tu-a-z-12374\">du lịch Đ&agrave; Nẵng</a></span>&nbsp;độc đ&aacute;o v&agrave; v&ocirc; gi&aacute; của Việt Nam. Du kh&aacute;ch muốn đến đ&acirc;y sẽ mua phải đi c&aacute;p treo l&ecirc;n tới đỉnh n&uacute;i B&agrave; N&agrave;.</span></p>\r\n<div class=\"fb-quote fb_iframe_widget\" style=\"box-sizing: border-box; display: inline-block; position: absolute; left: 250.5px; top: 1055px;\"><span style=\"box-sizing: border-box; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 169px; height: 47px;\"><iframe class=\"\" style=\"box-sizing: border-box; position: absolute; border-width: initial; border-style: none; visibility: visible; width: 169px; height: 47px;\" title=\"fb:quote Facebook Social Plugin\" src=\"https://web.facebook.com/v2.8/plugins/quote.php?app_id=1216538601705933&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df3fd5348393051%26domain%3Dwww.vntrip.vn%26origin%3Dhttps%253A%252F%252Fwww.vntrip.vn%252Ff40da7745fa14%26relation%3Dparent.parent&amp;container_width=653&amp;href=https%3A%2F%2Fwww.vntrip.vn%2Fcam-nang%2Fdia-diem-du-lich-da-nang-14657&amp;locale=en_US&amp;sdk=joey\" name=\"f2514f17602d068\" width=\"1000px\" height=\"1000px\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"true\"></iframe></span></div>\r\n<p>&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box;\">Gi&aacute; v&eacute; đi c&aacute;p treo ở B&agrave; N&agrave; Hill&nbsp;<span style=\"box-sizing: border-box; font-weight: 600;\">địa điểm du lịch ở Đ&agrave; Nẵng</span>&nbsp;l&agrave; 650.000 đồng đối với người lớn v&agrave; 550.000 đồng cho trẻ em đ&atilde; bao gồm tất cả chi ph&iacute; tham quan v&agrave; vui chơi.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><img class=\"aligncenter wp-image-14662\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"B&agrave; N&agrave; Hill - Địa điểm du lịch ở Đ&agrave; Nẵng \" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/bana-hills.jpg\" sizes=\"(max-width: 642px) 100vw, 642px\" srcset=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/bana-hills.jpg 1426w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/bana-hills-768x514.jpg 768w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/bana-hills-345x230.jpg 345w\" alt=\"B&agrave; N&agrave; Hill - Địa điểm du lịch ở Đ&agrave; Nẵng \" width=\"642\" height=\"429\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><em style=\"box-sizing: border-box;\">To&agrave;n bộ quang cảnh B&agrave; N&agrave; Hills (Ảnh: ST)</em></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box;\">Ngo&agrave;i kh&ocirc;ng gian với lối kiến tr&uacute;c Ph&aacute;p l&atilde;ng mạn, nguy nga ngay tr&ecirc;n đỉnh n&uacute;i hội tụ tất cả c&aacute;c dịch vụ sang trọng, hấp dẫn như nh&agrave; h&agrave;ng, c&ocirc;ng vi&ecirc;n giải tr&iacute; Fantasy Park, hầm rượu debay, bảo t&agrave;ng s&aacute;p, vườn hoa,&hellip;điểm thu h&uacute;t du kh&aacute;ch kh&aacute;c nữa ở&nbsp;<span style=\"box-sizing: border-box; font-weight: 600;\">khu du lịch Đ&agrave; Nẵng</span>&nbsp;ch&iacute;nh l&agrave; nơi đ&acirc;y sở hữu kh&iacute; hậu 4 m&ugrave;a trong một ng&agrave;y kh&aacute; th&uacute; vị. Đến&nbsp;<em style=\"box-sizing: border-box;\"><a style=\"box-sizing: border-box; background-color: transparent; color: #438dc4; text-decoration-line: none; cursor: pointer; transition: all 0.2s ease-in-out 0s;\" href=\"https://www.vntrip.vn/cam-nang/dia-diem-du-lich-ba-na-hill-17713\">B&agrave; N&agrave; Hills</a></em>, bạn chắc chắn sẽ c&oacute; những trải nghiệm kh&oacute; qu&ecirc;n c&ugrave;ng những bức ảnh kỉ niệm như đang lạc lối ở ch&acirc;u &Acirc;u.</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><img class=\"aligncenter wp-image-14663\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"B&agrave; N&agrave; Hill - khu du lịch Đ&agrave; Nẵng \" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/bana-hills-2.jpg\" alt=\"B&agrave; N&agrave; Hill - khu du lịch Đ&agrave; Nẵng \" width=\"640\" height=\"480\" /></p>', '1YluXYF0stZ2xs6n9X0mgIbme4cmT7iEv2eodvw8.jpeg', '2018-10-31 15:59:21', 88),
(16, 'Nhà đảo ngược – Upside down World Đà Nẵng', 'Đà Nẵng', 4, '<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5;\">Một điều đ&aacute;ng ch&uacute; &yacute; v&agrave; cũng v&ocirc; c&ugrave;ng ly kỳ khi bước v&agrave;o trong ng&ocirc;i nh&agrave; n&agrave;y l&agrave; bạn sẽ chẳng thể n&agrave;o ph&acirc;n biệt được đ&acirc;u l&agrave; trần đ&acirc;u l&agrave; s&agrave;n, v&igrave; thế h&atilde;y cẩn thận để kh&ocirc;ng bị c&aacute;c đồ vật trong nh&agrave; rớt v&agrave;o Một điều đ&aacute;ng ch&uacute; &yacute; v&agrave; cũng v&ocirc; c&ugrave;ng ly kỳ khi bước v&agrave;o trong ng&ocirc;i nh&agrave; n&agrave;y l&agrave; bạn sẽ chẳng thể n&agrave;o ph&acirc;n biệt được đ&acirc;u l&agrave; trần đ&acirc;u l&agrave; s&agrave;n, v&igrave; thế h&atilde;y cẩn thận để kh&ocirc;ng bị c&aacute;c đồ vật trong nh&agrave; rớt v&agrave;o đầu bạn nh&eacute;.</p>\r\n<div class=\"fb-quote fb_iframe_widget\" style=\"box-sizing: border-box; display: inline-block; position: absolute; left: 28px; top: 2433px;\"><span style=\"box-sizing: border-box; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 169px; height: 47px;\"><iframe class=\"\" style=\"box-sizing: border-box; position: absolute; border-width: initial; border-style: none; visibility: visible; width: 169px; height: 47px;\" title=\"fb:quote Facebook Social Plugin\" src=\"https://web.facebook.com/v2.8/plugins/quote.php?app_id=1216538601705933&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df3fd5348393051%26domain%3Dwww.vntrip.vn%26origin%3Dhttps%253A%252F%252Fwww.vntrip.vn%252Ff40da7745fa14%26relation%3Dparent.parent&amp;container_width=653&amp;href=https%3A%2F%2Fwww.vntrip.vn%2Fcam-nang%2Fdia-diem-du-lich-da-nang-14657&amp;locale=en_US&amp;sdk=joey\" name=\"f2514f17602d068\" width=\"1000px\" height=\"1000px\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"true\"></iframe></span></div>\r\n<p>&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5;\">&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<div class=\"fb-quote fb_iframe_widget\" style=\"box-sizing: border-box; display: inline-block; position: absolute; left: 28px; top: 2433px;\"><span style=\"box-sizing: border-box; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 169px; height: 47px;\"><iframe class=\"\" style=\"box-sizing: border-box; position: absolute; border: none; visibility: visible; width: 169px; height: 47px;\" title=\"fb:quote Facebook Social Plugin\" src=\"https://web.facebook.com/v2.8/plugins/quote.php?app_id=1216538601705933&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df3fd5348393051%26domain%3Dwww.vntrip.vn%26origin%3Dhttps%253A%252F%252Fwww.vntrip.vn%252Ff40da7745fa14%26relation%3Dparent.parent&amp;container_width=653&amp;href=https%3A%2F%2Fwww.vntrip.vn%2Fcam-nang%2Fdia-diem-du-lich-da-nang-14657&amp;locale=en_US&amp;sdk=joey\" name=\"f2514f17602d068\" width=\"1000px\" height=\"1000px\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"true\"></iframe></span></div>', '<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5;\">Đ&acirc;y l&agrave; một địa chỉ vui chơi giải tr&iacute; mới, ch&iacute;nh thức mở cửa đ&oacute;n kh&aacute;ch du lịch tham quan v&agrave;o đầu năm 2018.&nbsp;Ngay từ c&aacute;i t&ecirc;n &ldquo;nh&agrave; đảo ngược&rdquo; đ&atilde; khiến cho kh&ocirc;ng &iacute;t người, đặc biệt l&agrave; c&aacute;c bạn trẻ, hiếu kỳ về c&aacute;ch bố tr&iacute; đồ vật ở đ&acirc;y.&nbsp;Một điều đ&aacute;ng ch&uacute; &yacute; v&agrave; cũng v&ocirc; c&ugrave;ng ly kỳ khi bước v&agrave;o trong ng&ocirc;i nh&agrave; n&agrave;y l&agrave; bạn sẽ chẳng thể n&agrave;o ph&acirc;n biệt được đ&acirc;u l&agrave; trần đ&acirc;u l&agrave; s&agrave;n, v&igrave; thế h&atilde;y cẩn thận để kh&ocirc;ng bị c&aacute;c đồ vật trong nh&agrave; rớt v&agrave;o đầu bạn nh&eacute;.</p>\r\n<div class=\"fb-quote fb_iframe_widget\" style=\"box-sizing: border-box; display: inline-block; position: absolute; left: 250.5px; top: 2393px;\"><span style=\"box-sizing: border-box; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 169px; height: 47px;\"><iframe class=\"\" style=\"box-sizing: border-box; position: absolute; border-width: initial; border-style: none; visibility: visible; width: 169px; height: 47px;\" title=\"fb:quote Facebook Social Plugin\" src=\"https://web.facebook.com/v2.8/plugins/quote.php?app_id=1216538601705933&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df3fd5348393051%26domain%3Dwww.vntrip.vn%26origin%3Dhttps%253A%252F%252Fwww.vntrip.vn%252Ff40da7745fa14%26relation%3Dparent.parent&amp;container_width=653&amp;href=https%3A%2F%2Fwww.vntrip.vn%2Fcam-nang%2Fdia-diem-du-lich-da-nang-14657&amp;locale=en_US&amp;sdk=joey\" name=\"f2514f17602d068\" width=\"1000px\" height=\"1000px\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"true\"></iframe></span></div>\r\n<p>&nbsp;</p>\r\n<div id=\"attachment_77012\" class=\"wp-caption alignnone\" style=\"box-sizing: border-box; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; max-width: 650px;\"><img class=\"size-full wp-image-77012\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2018/07/nha-dao-nguoc-da-nang-vntrip-e1531369218470.jpg\" alt=\"Thỏa th&iacute;ch check-in sống ảo trong căn nh&agrave; đảo ngược (Ảnh ST)\" width=\"640\" height=\"491\" />\r\n<p class=\"wp-caption-text\" style=\"box-sizing: border-box; margin: 0px 0px 20px;\"><em style=\"box-sizing: border-box;\">Thỏa th&iacute;ch check-in sống ảo trong căn nh&agrave; đảo ngược (Ảnh ST)</em></p>\r\n</div>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5;\">Sự đảo lộn mọi vật n&agrave;y sẽ khiến cho bạn cảm thấy như đang lạc v&agrave;o thế giới ma thuật trong những c&acirc;u chuyện của Harry Potter v&agrave; tha hồ check-in, sống ảo độc đ&aacute;o ở đ&acirc;y.</p>\r\n<div id=\"attachment_77013\" class=\"wp-caption alignnone\" style=\"box-sizing: border-box; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; max-width: 650px;\"><img class=\"size-full wp-image-77013\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2018/07/nha-up-nguoc-da-nang-vntrip-e1531369634398.jpg\" alt=\"Nh&agrave; đảo ngược với những h&igrave;nh ảnh độc đ&aacute;o &quot;miễn b&agrave;n&quot; (Ảnh: ST)\" width=\"640\" height=\"480\" /></div>', 'TgGcelhPvvz9XjJPKdyGZBV8k5fkvg1EkgTz3l7f.jpeg', '2018-10-31 15:59:26', 22),
(17, 'Hội An', 'Đà Nẵng', 4, '<p><span style=\"color: #1a1a1a; font-family: \'Open Sans\', sans-serif; text-align: justify; background-color: #f5f5f5;\">&nbsp;Hội An&nbsp;&nbsp;mỗi khi du kh&aacute;ch đặt ch&acirc;n tới th&agrave;nh phố của những c&acirc;y cầu. Kh&aacute;c với một Đ&agrave; Nẵng s&ocirc;i động, sầm uất th&igrave; Hội An l&agrave; một phố cổ y&ecirc;n b&igrave;nh v&agrave; xinh đẹp.&nbsp;</span></p>', '<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box;\">D&ugrave; kh&ocirc;ng thuộc địa phận th&agrave;nh phố Đ&agrave; Nẵng, tuy nhi&ecirc;n Hội An vẫn l&agrave; một trong&nbsp;<span style=\"box-sizing: border-box; font-weight: 600;\">những địa điểm du lịch Đ&agrave; Nẵng</span>&nbsp;&ndash;&nbsp;Hội An&nbsp;&nbsp;mỗi khi du kh&aacute;ch đặt ch&acirc;n tới th&agrave;nh phố của những c&acirc;y cầu. Kh&aacute;c với một Đ&agrave; Nẵng s&ocirc;i động, sầm uất th&igrave; Hội An l&agrave; một phố cổ y&ecirc;n b&igrave;nh v&agrave; xinh đẹp.&nbsp;Đến Hội An, bạn sẽ được sống chậm lại với những qu&aacute;n cafe nhỏ nhắn, những ng&ocirc;i nh&agrave; cổ tường v&agrave;ng hoa giấy, tiếng m&aacute;i ch&egrave;o khua s&oacute;ng nh&egrave; nhẹ tr&ecirc;n d&ograve;ng s&ocirc;ng Ho&agrave;i&hellip;Hội An ở mỗi thời điểm trong ng&agrave;y đều sở hữu n&eacute;t quyến rũ ri&ecirc;ng đ&atilde; l&agrave;m tốn kh&ocirc;ng &iacute;t giấy mực ca ngợi của b&aacute;o ch&iacute; trong v&agrave; ngo&agrave;i nước.</span></p>\r\n<div class=\"fb-quote fb_iframe_widget\" style=\"box-sizing: border-box; display: inline-block; position: absolute; left: 251.5px; top: 3653px;\"><span style=\"box-sizing: border-box; display: inline-block; position: relative; text-align: justify; vertical-align: bottom; width: 169px; height: 47px;\"><iframe class=\"\" style=\"box-sizing: border-box; position: absolute; border-width: initial; border-style: none; visibility: visible; width: 169px; height: 47px;\" title=\"fb:quote Facebook Social Plugin\" src=\"https://web.facebook.com/v2.8/plugins/quote.php?app_id=1216538601705933&amp;channel=https%3A%2F%2Fstaticxx.facebook.com%2Fconnect%2Fxd_arbiter%2Fr%2F__Bz3h5RzMx.js%3Fversion%3D42%23cb%3Df3fd5348393051%26domain%3Dwww.vntrip.vn%26origin%3Dhttps%253A%252F%252Fwww.vntrip.vn%252Ff40da7745fa14%26relation%3Dparent.parent&amp;container_width=653&amp;href=https%3A%2F%2Fwww.vntrip.vn%2Fcam-nang%2Fdia-diem-du-lich-da-nang-14657&amp;locale=en_US&amp;sdk=joey\" name=\"f2514f17602d068\" width=\"1000px\" height=\"1000px\" frameborder=\"0\" scrolling=\"no\" allowfullscreen=\"true\"></iframe></span></div>\r\n<p>&nbsp;</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><img class=\"aligncenter wp-image-14666\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Hội An - C&aacute;c địa điểm tham quan ở Đ&agrave; Nẵng \" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/kinh-nghiem-san-ve-may-bay-di-chu-lai-gia-re-trong-mua-du-lich-cao-diem-1.jpg\" sizes=\"(max-width: 642px) 100vw, 642px\" srcset=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/kinh-nghiem-san-ve-may-bay-di-chu-lai-gia-re-trong-mua-du-lich-cao-diem-1.jpg 900w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/kinh-nghiem-san-ve-may-bay-di-chu-lai-gia-re-trong-mua-du-lich-cao-diem-1-768x510.jpg 768w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/kinh-nghiem-san-ve-may-bay-di-chu-lai-gia-re-trong-mua-du-lich-cao-diem-1-345x230.jpg 345w\" alt=\"Hội An - C&aacute;c địa điểm tham quan ở Đ&agrave; Nẵng \" width=\"642\" height=\"427\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><em style=\"box-sizing: border-box;\">Hội An cổ k&iacute;nh v&agrave; b&igrave;nh y&ecirc;n (Ảnh: ST)</em></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><img class=\"aligncenter wp-image-14667\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Hội An - C&aacute;c địa điểm tham quan ở Đ&agrave; Nẵng 01\" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/20117156_2337159923174802_3494764621011807124_o.jpg\" sizes=\"(max-width: 641px) 100vw, 641px\" srcset=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/20117156_2337159923174802_3494764621011807124_o.jpg 2048w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/20117156_2337159923174802_3494764621011807124_o-768x512.jpg 768w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/20117156_2337159923174802_3494764621011807124_o-345x230.jpg 345w\" alt=\"Hội An - C&aacute;c địa điểm tham quan ở Đ&agrave; Nẵng 01\" width=\"641\" height=\"427\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><em style=\"box-sizing: border-box;\">Hội An đẹp cả trong những ng&agrave;y mưa (Ảnh: ST)</em></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><img class=\"aligncenter wp-image-14683\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Hội An - C&aacute;c địa điểm tham quan ở Đ&agrave; Nẵng 02\" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/20121256_2337159643174830_5214703146307475354_o.jpg\" sizes=\"(max-width: 641px) 100vw, 641px\" srcset=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/20121256_2337159643174830_5214703146307475354_o.jpg 2048w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/20121256_2337159643174830_5214703146307475354_o-768x512.jpg 768w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/20121256_2337159643174830_5214703146307475354_o-345x230.jpg 345w\" alt=\"Hội An - C&aacute;c địa điểm tham quan ở Đ&agrave; Nẵng 02\" width=\"641\" height=\"427\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><em style=\"box-sizing: border-box;\">Hội An khiến ta rung rinh từ những c&aacute;i nhỏ nhặt (Ảnh: ST)</em></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><span style=\"box-sizing: border-box;\">Đến Hội An bạn n&ecirc;n ở lại qua ng&agrave;y để cảm nhận trọn vẹn nhất vẻ đẹp cổ k&iacute;nh, nếp sống giản dị v&agrave; sự th&acirc;n thiện, đ&ocirc;n hậu của con người nơi đ&acirc;y. C&ograve;n g&igrave; tuyệt vời hơn việc ngồi nh&acirc;m nhi một t&aacute;ch cafe trong những qu&aacute;n nhỏ b&ecirc;n bờ d&ograve;ng s&ocirc;ng Ho&agrave;i hay tr&ecirc;n tầng thượng c&oacute; thể nh&igrave;n bao qu&aacute;t khung cảnh, ngắm mặt trời l&ecirc;n dần v&agrave; rọi &aacute;nh s&aacute;ng qua d&agrave;n hoa giấy, in b&oacute;ng l&ecirc;n những bức tường v&agrave;ng, lọt v&agrave;o từng ng&otilde; nhỏ. Khi đ&ecirc;m xuống, Hội An cũng kho&aacute;c l&ecirc;n tấm &aacute;o lung linh từ những chiếc đ&egrave;n hoa đăng thả tr&ocirc;i s&ocirc;ng, của những chiếc đ&egrave;n lồng được b&agrave;y b&aacute;n hay &aacute;nh s&aacute;ng từ những qu&aacute;n cafe, qu&aacute;n ăn b&eacute; xinh. Hội An c&oacute; lẽ sẽ chẳng bao giờ hết hấp dẫn với c&aacute;c vị du kh&aacute;ch bởi n&eacute;t quyến rũ xuy&ecirc;n thời gian của n&oacute;. Nếu chọn c&aacute;c&nbsp;<span style=\"box-sizing: border-box; font-weight: 600;\">địa điểm du lịch Đ&agrave; Nẵng</span>, bạn nhất định kh&ocirc;ng được bỏ qua một trong mười điểm đến của Ch&acirc;u &Aacute; n&agrave;y nh&eacute;!</span></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 20px; color: #1a1a1a; font-family: \'Open Sans\', sans-serif; background-color: #f5f5f5; text-align: justify;\"><img class=\"aligncenter wp-image-14685\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; max-width: 100%;\" title=\"Thưởng thức cafe Hội An - địa điểm du lịch tại Đ&agrave; Nẵng \" src=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/img-0303-1459871005898.jpg\" sizes=\"(max-width: 642px) 100vw, 642px\" srcset=\"https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/img-0303-1459871005898.jpg 600w, https://www.vntrip.vn/cam-nang/wp-content/uploads/2017/07/img-0303-1459871005898-345x230.jpg 345w\" alt=\"Thưởng thức cafe Hội An - địa điểm du lịch tại Đ&agrave; Nẵng \" width=\"642\" height=\"428\" /></p>', 'jtlgQojfwQf6nniufHjruGmuvqG0Bs4PFtLHexdh.jpeg', '2018-10-31 15:59:30', 32),
(18, 'Cafe Núi Đá', 'Đà Nẵng', 1, '<p><span style=\"color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Được thiết kế kh&aacute; mộc mạc, giản đơn, qu&aacute;n cafe N&uacute;i Đ&aacute; dường như kh&ocirc;ng ph&aacute; vỡ cảnh quan tự nhi&ecirc;n, vốn c&oacute; nơi sườn n&uacute;i.</span></p>', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\"><img class=\"aligncenter wp-image-4908 size-full\" style=\"box-sizing: border-box; border: 0px; max-width: 100%; height: auto; display: block; vertical-align: middle; margin: auto;\" src=\"https://danangz.vn/wp-content/uploads/2015/10/cf-nui-da-e1445842091480.png\" alt=\"cf nui da\" width=\"630\" height=\"416\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Từ ch&acirc;n cầu Thuận Phước, đi theo đường L&ecirc; Đức Thọ về hướng b&aacute;n đảo Sơn Tr&agrave; chừng hơn c&acirc;y số sẽ nh&igrave;n thấy qu&aacute;n c&agrave;-ph&ecirc; N&uacute;i Đ&aacute; ẩn hiện b&ecirc;n sườn n&uacute;i. Nằm tr&ecirc;n con đường &iacute;t người qua lại, địa chỉ n&agrave;y vẫn thu h&uacute;t kh&aacute;ch h&agrave;ng bởi sự y&ecirc;n tĩnh v&agrave; gần gũi với thi&ecirc;n nhi&ecirc;n.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Được thiết kế kh&aacute; mộc mạc, giản đơn, qu&aacute;n cafe N&uacute;i Đ&aacute; dường như kh&ocirc;ng ph&aacute; vỡ cảnh quan tự nhi&ecirc;n, vốn c&oacute; nơi sườn n&uacute;i. Thỉnh thoảng đ&acirc;u đ&oacute; c&ograve;n vang l&ecirc;n tiếng g&agrave; g&aacute;y, tiếng chim gọi bầy v&agrave; mọi ng&oacute;c ng&aacute;ch ở qu&aacute;n Cafe n&agrave;y đều hứng trọn l&agrave;n gi&oacute; m&aacute;t từ biển thổi về, mơn man l&agrave;n da kh&aacute;ch. Như nhiều qu&aacute;n cafe s&acirc;n vườn kh&aacute;c, thực đơn nước uống ở đ&acirc;y phong ph&uacute;, đầy đủ nước &eacute;p tr&aacute;i c&acirc;y, nước đ&oacute;ng chai v&agrave; cafe c&aacute;c loại.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\"><img class=\"aligncenter size-full wp-image-88722\" style=\"box-sizing: border-box; border: 0px; max-width: 100%; height: auto; display: block; vertical-align: middle; margin: auto;\" src=\"https://danangz.vn/wp-content/uploads/2015/10/nuida6.jpg\" alt=\"\" width=\"600\" height=\"450\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Kh&ocirc;ng chỉ hấp dẫn về cảnh quan, cafe N&uacute;i Đ&aacute; Đ&agrave; Nẵng c&ograve;n l&agrave; địa chỉ l&yacute; tưởng cho những ai muốn nh&igrave;n ngắm vẻ đẹp tự nhi&ecirc;n của cỏ c&acirc;y sườn n&uacute;i. M&ugrave;a hoa rừng nở, N&uacute;i Đ&aacute; trở th&agrave;nh nơi hẹn h&ograve; của nhiều cặp đ&ocirc;i muốn lưu lại h&igrave;nh ảnh đẹp, l&atilde;ng mạn c&ugrave;ng nhau.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Ngồi ở độ cao tr&ecirc;n 50 m&eacute;t so với mực nước biển, giữa sườn n&uacute;i nhiều c&acirc;y xanh, hơi m&aacute;t tỏa ra từ những tản đ&aacute; to gi&uacute;p kh&ocirc;ng gian nơi đ&acirc;y lu&ocirc;n m&aacute;t mẻ, trong l&agrave;nh. V&agrave;o m&ugrave;a mưa, N&uacute;i Đ&aacute; mang vẻ đẹp tinh kh&ocirc;i với m&agrave;u xanh của r&ecirc;u, của c&acirc;y cỏ được những cơn mưa gội rửa bụi đường. Khi &aacute;nh mặt trời dần khuất sau sườn n&uacute;i, từ nhiều vị tr&iacute; kh&aacute;c nhau ở th&agrave;nh phố Đ&agrave; Nẵng, bạn đều c&oacute; thể nh&igrave;n thấy dải điện rộng lớn, nhiều m&agrave;u sắc nhấp nh&aacute;y từ qu&aacute;n cafe N&uacute;i Đ&aacute;, tạo n&ecirc;n điểm nhấn hấp dẫn về đ&ecirc;m.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\"><img class=\"aligncenter wp-image-4909 size-full\" style=\"box-sizing: border-box; border: 0px; max-width: 100%; height: auto; display: block; vertical-align: middle; margin: auto;\" src=\"https://danangz.vn/wp-content/uploads/2015/10/cf4-e1445842200549.png\" alt=\"cf\" width=\"630\" height=\"474\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Mộc mạc, nhẹ nh&agrave;ng l&agrave; những g&igrave; N&uacute;i Đ&aacute; muốn đem lại cho c&aacute;c bạn, gi&uacute;p ta trong chốc l&aacute;t tho&aacute;t khỏi những lo toan thường nhật, những huy&ecirc;n n&aacute;o, x&ocirc; bồ của phố thị.</p>', 'fCEXkfcrV8Oudkh8B0Br5gwATvDZEg57kXd5qC7k.png', '2018-10-31 15:59:34', 44),
(21, 'Viaggio Cafe', 'Đà Nẵng', 1, '<p><span style=\"color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Điểm khiến Viaggio Cafe trở n&ecirc;n đặc biệt, ch&iacute;nh bởi phong c&aacute;ch trang tr&iacute; ở đ&acirc;y rất độc đ&aacute;o, kh&aacute;c biệt.</span></p>', '<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\"><img class=\"aligncenter wp-image-4923 size-full\" style=\"box-sizing: border-box; border: 0px; max-width: 100%; height: auto; display: block; vertical-align: middle; margin: auto;\" src=\"https://danangz.vn/wp-content/uploads/2015/10/hat-giay1.png\" alt=\"hat giay\" width=\"630\" height=\"427\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Cafe hạc giấy lu&ocirc;n l&agrave; một trong những c&aacute;i t&ecirc;n được nhắc đến nhiều nhất đối với teen m&ecirc; cafe. Điểm khiến Viaggio Cafe trở n&ecirc;n đặc biệt, ch&iacute;nh bởi phong c&aacute;ch trang tr&iacute; ở đ&acirc;y rất độc đ&aacute;o, kh&aacute;c biệt.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Đến với Viaggio Cafe ta cảm nhận được một thế giới ri&ecirc;ng, rất y&ecirc;n b&igrave;nh với t&ocirc;ng xanh trắng l&agrave;m chủ đạo. Cổ điển, thanh tho&aacute;t từ ch&iacute;nh c&aacute;c vật dụng v&agrave; c&aacute;ch bố tr&iacute; ch&uacute;ng trong căn ph&ograve;ng.&nbsp;Đặc biệt, khi đến với Viaggio Cafe bạn sẽ được lựa chọn phong c&aacute;ch thưởng thức kh&aacute;c nhau.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\"><img class=\"aligncenter size-full wp-image-4925\" style=\"box-sizing: border-box; border: 0px; max-width: 100%; height: auto; display: block; vertical-align: middle; margin: auto;\" src=\"https://danangz.vn/wp-content/uploads/2015/10/tang-25.png\" sizes=\"(max-width: 709px) 85vw, (max-width: 909px) 67vw, (max-width: 984px) 61vw, (max-width: 1362px) 45vw, 600px\" srcset=\"https://danangz.vn/wp-content/uploads/2015/10/tang-25.png 630w, https://danangz.vn/wp-content/uploads/2015/10/tang-25-255x170.png 255w\" alt=\"tang 2\" width=\"630\" height=\"417\" /></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1rem; padding: 0px; line-height: 1.6; text-rendering: optimizelegibility; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">Tầng 1 được trang tr&iacute; bằng những bộ b&agrave;n ghế cao, với khung ảnh v&agrave; r&egrave;m trắng l&atilde;ng mạn mang kh&ocirc;ng kh&iacute; gia đ&igrave;nh ấm &aacute;p.&nbsp;Tầng 2 mang phong c&aacute;ch ho&agrave;n to&agrave;n kh&aacute;c biệt: kh&aacute;ch h&agrave;ng sẽ được ngồi bệt tr&ecirc;n thảm &ecirc;m dịu, tr&ecirc;n trần l&agrave; h&agrave;ng trăm con hạc giấy đung đưa theo gi&oacute;.</p>\r\n<ul style=\"box-sizing: border-box; margin: 0px 0px 9px 20px; padding: 0px; line-height: 1.6; list-style-position: initial; list-style-image: initial; color: #0a0a0a; font-family: Roboto, Helvetica, Arial, sans-serif; text-align: justify; background-color: #fefefe;\">\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; text-align: justify;\">Địa chỉ: 81 &Ocirc;ng &Iacute;ch Khi&ecirc;m, Quận Hải Ch&acirc;u, Đ&agrave; Nẵng</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; text-align: justify;\">ĐT: 0918 841 989</li>\r\n<li style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-size: inherit; text-align: justify;\">Khung gi&aacute;: 20.000đ &ndash; 35.000đ</li>\r\n</ul>', 'JFfHRpu0oqZvrScmROylLxa2KsxKYEbxcLblNZDD.png', '2018-10-31 15:59:48', 66);
INSERT INTO `datingplaces` (`id_place`, `name_place`, `city`, `id_type`, `preview_text`, `detail_place`, `picture`, `date_created`, `count_number`) VALUES
(22, 'CÔNG VIÊN CHÂU Á ĐÀ NẴNG', 'Đà Nẵng', 4, '<p><span style=\"color: #222222; font-family: \'Open Sans\', sans-serif; text-align: justify;\">Điểm nhấn nổi bật nhất trong c&ocirc;ng vi&ecirc;n l&agrave; sự hiện diện của v&ograve;ng đu quay Sun Wheel Đ&agrave; Nẵng. Với chiều cao ấn tượng 115m, v&ograve;ng quay khổng lồ n&agrave;y c&oacute; thể chuy&ecirc;n chở được tối đa 384 h&agrave;nh kh&aacute;ch mỗi lượt với 64 cabin hiện l&agrave; 1 trong 10 v&ograve;ng đu quay lớn nhất thế giới.</span></p>', '<p style=\"box-sizing: border-box; clear: both; text-align: center; color: #222222; font-family: \'Open Sans\', sans-serif;\"><img style=\"box-sizing: border-box; max-width: 100%; clear: both; border: 1px solid #cccccc; border-radius: 3px; max-height: 500px; width: 830px;\" title=\"cong vien chau a\" src=\"http://media.dulich24.com.vn/bai-viet/nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321/nhung-dia-diem-hen-ho-lang-man-o-da-nang-1.jpg\" alt=\"cong vien chau a\" /><br style=\"box-sizing: border-box;\" />C&ocirc;ng vi&ecirc;n ch&acirc;u &Aacute; Đ&agrave; Nẵng</p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: justify; color: #222222; font-family: \'Open Sans\', sans-serif;\"><span style=\"box-sizing: border-box;\">C&ocirc;ng vi&ecirc;n Ch&acirc;u &Aacute; Đ&agrave; Nẵng &ndash; Asia Park Da Nang nằm ph&iacute;a Đ&ocirc;ng Nam Đ&agrave;i Tưởng niệm, tr&ecirc;n đường 2/9 dọc theo bờ T&acirc;y s&ocirc;ng H&agrave;n, ngay ch&acirc;n cầu Tuy&ecirc;n Sơn với diện t&iacute;ch đất khoảng 89ha (gồm 48,65ha mặt đất v&agrave; hơn 40ha mặt nước). Đ&acirc;y l&agrave; khu c&ocirc;ng vi&ecirc;n vui chơi giải tr&iacute; h&agrave;ng đầu tại Đ&ocirc;ng Nam &Aacute; với quy m&ocirc; đầu tư &ldquo;khủng&rdquo; l&ecirc;n đến 4.000 tỉ đồng.</span></p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: center; color: #222222; font-family: \'Open Sans\', sans-serif;\"><img style=\"box-sizing: border-box; max-width: 100%; clear: both; border: 1px solid #cccccc; border-radius: 3px; max-height: 500px; width: 830px;\" src=\"http://media.dulich24.com.vn/bai-viet/nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321/nhung-dia-diem-hen-ho-lang-man-o-da-nang-2.jpg\" alt=\"Tr&ograve; chơi cảm gi&aacute;c mạnh ở Đ&agrave; Nẵng\" /><br style=\"box-sizing: border-box;\" />Tr&ograve; chơi cảm gi&aacute;c mạnh ở Đ&agrave; Nẵng</p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: justify; color: #222222; font-family: \'Open Sans\', sans-serif;\"><span style=\"box-sizing: border-box;\">Ri&ecirc;ng trong khu c&ocirc;ng vi&ecirc;n vui chơi giải tr&iacute; sẽ c&oacute; đến 60 tr&ograve; chơi, trong đ&oacute; c&oacute; đến 20 tr&ograve; chơi cảm gi&aacute;c mạnh d&agrave;nh cho người d&acirc;n địa phương v&agrave; du kh&aacute;ch du lịch Đ&agrave; Nẵng&nbsp;kh&aacute;m ph&aacute;.</span></p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: center; color: #222222; font-family: \'Open Sans\', sans-serif;\"><img style=\"box-sizing: border-box; max-width: 100%; clear: both; border: 1px solid #cccccc; border-radius: 3px; max-height: 500px; width: 830px;\" src=\"http://media.dulich24.com.vn/bai-viet/nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321/nhung-dia-diem-hen-ho-lang-man-o-da-nang-3.jpg\" alt=\"V&ograve;ng quay Sun Wheel Đ&agrave; Nẵng\" /><br style=\"box-sizing: border-box;\" />V&ograve;ng quay Sun Wheel Đ&agrave; Nẵng</p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: justify; color: #222222; font-family: \'Open Sans\', sans-serif;\"><span style=\"box-sizing: border-box;\">Điểm nhấn nổi bật nhất trong c&ocirc;ng vi&ecirc;n l&agrave; sự hiện diện của v&ograve;ng đu quay Sun Wheel Đ&agrave; Nẵng. Với chiều cao ấn tượng 115m, v&ograve;ng quay khổng lồ n&agrave;y c&oacute; thể chuy&ecirc;n chở được tối đa 384 h&agrave;nh kh&aacute;ch mỗi lượt với 64 cabin hiện l&agrave; 1 trong 10 v&ograve;ng đu quay lớn nhất thế giới. S&oacute;ng đ&ocirc;i c&ugrave;ng n&agrave;ng chi&ecirc;m ngưỡng cảnh quan quanh c&ocirc;ng vi&ecirc;n hay quan s&aacute;t to&agrave;n cảnh th&agrave;nh phố từ độ cao của v&ograve;ng đu quay hẳn l&agrave; những kỷ niệm kh&oacute; phai trong l&ograve;ng bạn.</span></p>', 'bZfv7lknLSYbrPP5008ldEDBUsWKxAsHzlyw5ghu.png', '2018-10-31 15:59:52', 11),
(23, 'LUNG LINH CẦU TÌNH YÊU', 'Đà Nẵng', 4, '<p><span style=\"color: #222222; font-family: \'Open Sans\', sans-serif; text-align: justify;\">Ngắm &ldquo;cầu t&igrave;nh y&ecirc;u&rdquo; l&atilde;ng mạn như trong phim H&agrave;n ở Đ&agrave; NẵngSau khi tượng c&aacute; ch&eacute;p h&oacute;a rồng được kh&aacute;nh th&agrave;nh, một chiếc &ldquo;cầu t&agrave;u t&igrave;nh y&ecirc;u&rdquo; đ&atilde; được x&acirc;y dựng tại bờ s&ocirc;ng H&agrave;n (TP Đ&agrave; Nẵng). C&acirc;y cầu tr&aacute;i tim với những ổ kh&oacute;a dễ thương tr&ecirc;n th&agrave;nh&hellip;</span></p>', '<p style=\"box-sizing: border-box; clear: both; text-align: center; color: #222222; font-family: \'Open Sans\', sans-serif;\"><img style=\"box-sizing: border-box; max-width: 100%; clear: both; border: 1px solid #cccccc; border-radius: 3px; max-height: 500px; width: 830px;\" src=\"http://media.dulich24.com.vn/bai-viet/nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321/nhung-dia-diem-hen-ho-lang-man-o-da-nang-4.jpg\" sizes=\"(max-width: 660px) 100vw, 660px\" srcset=\"http://danangz.vn/wp-content/uploads/2016/03/C43A1206_1-255x170.jpg 255w, http://media.dulich24.com.vn/bai-viet\\nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321\\nhung-dia-diem-hen-ho-lang-man-o-da-nang-4.jpg 660w\" alt=\"Cầu t&agrave;u t&igrave;nh y&ecirc;u &ndash; điểm h&uacute;t du kh&aacute;ch mới ở Đ&agrave; Nẵng\" /><br style=\"box-sizing: border-box;\" />Cầu t&agrave;u t&igrave;nh y&ecirc;u &ndash; điểm h&uacute;t du kh&aacute;ch mới ở Đ&agrave; Nẵng</p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: justify; color: #222222; font-family: \'Open Sans\', sans-serif;\"><span style=\"box-sizing: border-box;\">Nằm ở đoạn giữa cầu Rồng v&agrave; cầu s&ocirc;ng H&agrave;n, ở ph&iacute;a Đ&ocirc;ng đường Trần Hưng Đạo, hiện cầu kh&oacute;a t&igrave;nh y&ecirc;u đang l&agrave; &ldquo;điểm n&oacute;ng&rdquo; thu h&uacute;t đ&ocirc;ng đảo c&aacute;c bạn trẻ. C&acirc;y cầu c&oacute; h&igrave;nh v&ograve;ng cung, hướng về ph&iacute;a giữa s&ocirc;ng. Lối đi dạo rộng khoảng 2m c&ugrave;ng kh&ocirc;ng gian tho&aacute;ng đ&atilde;ng tạo điều kiện thoải m&aacute;i cho mọi người ngắm nh&igrave;n cảnh s&ocirc;ng H&agrave;n v&agrave; tận hưởng những cơn gi&oacute; m&aacute;t l&agrave;nh.</span></p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: center; color: #222222; font-family: \'Open Sans\', sans-serif;\"><img style=\"box-sizing: border-box; max-width: 100%; clear: both; border: 1px solid #cccccc; border-radius: 3px; max-height: 500px; width: 830px;\" src=\"http://media.dulich24.com.vn/bai-viet/nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321/nhung-dia-diem-hen-ho-lang-man-o-da-nang-5.jpg\" sizes=\"(max-width: 600px) 100vw, 600px\" srcset=\"http://danangz.vn/wp-content/uploads/2015/09/15-abbc1-e8742-255x170.jpg 255w, http://media.dulich24.com.vn/bai-viet\\nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321\\nhung-dia-diem-hen-ho-lang-man-o-da-nang-5.jpg 600w\" alt=\"Cầu t&igrave;nh y&ecirc;u\" /><br style=\"box-sizing: border-box;\" />Cầu t&igrave;nh y&ecirc;u</p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: justify; color: #222222; font-family: \'Open Sans\', sans-serif;\"><span style=\"box-sizing: border-box;\">V&agrave;o buổi tối c&oacute; h&agrave;ng trăm chiếc đ&egrave;n lồng đỏ h&igrave;nh tr&aacute;i tim tr&ecirc;n cầu được thắp s&aacute;ng t&ocirc; điểm cho khung cảnh nơi đ&acirc;y th&ecirc;m lung linh, huyền ảo. C&ocirc;ng tr&igrave;nh x&acirc;y dựng dựa tr&ecirc;n việc học hỏi &yacute; tưởng từ cầu kh&oacute;a t&igrave;nh y&ecirc;u nổi tiếng như Pont des Arts của Ph&aacute;p, Milvio của &Yacute;&hellip; trở th&agrave;nh nơi để những cặp đ&ocirc;i thể hiện t&igrave;nh y&ecirc;u vĩnh cửu. C&aacute;c bạn trẻ thường đến đ&acirc;y, treo những ổ kh&oacute;a viết t&ecirc;n hay trang tr&iacute; h&igrave;nh tr&aacute;i tim l&ecirc;n th&agrave;nh cầu để chứng nh&acirc;n cho c&acirc;u chuyện t&igrave;nh y&ecirc;u của m&igrave;nh.</span></p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: center; color: #222222; font-family: \'Open Sans\', sans-serif;\"><img style=\"box-sizing: border-box; max-width: 100%; clear: both; border: 1px solid #cccccc; border-radius: 3px; max-height: 500px; width: 830px;\" src=\"http://media.dulich24.com.vn/bai-viet/nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321/nhung-dia-diem-hen-ho-lang-man-o-da-nang-6.jpg\" sizes=\"(max-width: 660px) 100vw, 660px\" srcset=\"http://danangz.vn/wp-content/uploads/2016/03/C43A0649-255x170.jpg 255w, http://media.dulich24.com.vn/bai-viet\\nhung-dia-diem-hen-ho-lang-man-o-da-nang-40040321\\nhung-dia-diem-hen-ho-lang-man-o-da-nang-6.jpg 660w\" alt=\"Cầu t&agrave;u t&igrave;nh y&ecirc;u &ndash; điểm hẹn h&ograve; cực l&atilde;ng mạn cho c&aacute;c cặp đ&ocirc;i\" /><br style=\"box-sizing: border-box;\" />Cầu t&agrave;u t&igrave;nh y&ecirc;u &ndash; điểm hẹn h&ograve; cực l&atilde;ng mạn cho c&aacute;c cặp đ&ocirc;i</p>\r\n<p style=\"box-sizing: border-box; clear: both; text-align: justify; color: #222222; font-family: \'Open Sans\', sans-serif;\">Ngắm &ldquo;cầu t&igrave;nh y&ecirc;u&rdquo; l&atilde;ng mạn như trong phim H&agrave;n ở Đ&agrave; NẵngSau khi tượng c&aacute; ch&eacute;p h&oacute;a rồng được kh&aacute;nh th&agrave;nh, một chiếc &ldquo;cầu t&agrave;u t&igrave;nh y&ecirc;u&rdquo; đ&atilde; được x&acirc;y dựng tại bờ s&ocirc;ng H&agrave;n (TP Đ&agrave; Nẵng). C&acirc;y cầu tr&aacute;i tim với những ổ kh&oacute;a dễ thương tr&ecirc;n th&agrave;nh&hellip;</p>', '8yvXt5hZN2KJ81UJ8hIGFaFuMG7NbSe6KuZtSQuu.jpeg', '2018-10-31 15:59:55', 12);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dating_place_picture`
--

CREATE TABLE `dating_place_picture` (
  `id` int(11) NOT NULL,
  `picture1` varchar(150) NOT NULL,
  `picture2` varchar(150) NOT NULL,
  `picture3` varchar(150) NOT NULL,
  `picture4` varchar(150) NOT NULL,
  `picture5` varchar(150) NOT NULL,
  `id_place` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dating_place_type`
--

CREATE TABLE `dating_place_type` (
  `id_type` int(11) NOT NULL,
  `name_type` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dating_place_type`
--

INSERT INTO `dating_place_type` (`id_type`, `name_type`) VALUES
(1, 'Coffee & Restaurant'),
(2, 'Hotel'),
(4, 'Landscapes');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `drinking`
--

CREATE TABLE `drinking` (
  `id` int(11) NOT NULL,
  `drink` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `drinking`
--

INSERT INTO `drinking` (`id`, `drink`) VALUES
(0, 'Do you have drink?'),
(1, 'Usually'),
(2, 'No drinking');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `educational_level`
--

CREATE TABLE `educational_level` (
  `id` int(11) NOT NULL,
  `level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `educational_level`
--

INSERT INTO `educational_level` (`id`, `level`) VALUES
(0, 'Educational level'),
(1, 'University'),
(2, 'College');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `eye_color`
--

CREATE TABLE `eye_color` (
  `id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `eye_color`
--

INSERT INTO `eye_color` (`id`, `color`) VALUES
(0, 'Please input your eye color'),
(1, 'Red'),
(2, 'Green'),
(3, 'Yellow');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flirtingmethods`
--

CREATE TABLE `flirtingmethods` (
  `id` int(11) NOT NULL,
  `name_flirting` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `preview_text` text COLLATE utf8_unicode_ci NOT NULL,
  `detail_flirting` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `id_gender` int(11) NOT NULL,
  `count_number` int(11) NOT NULL DEFAULT '0',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `flirtingmethods`
--

INSERT INTO `flirtingmethods` (`id`, `name_flirting`, `preview_text`, `detail_flirting`, `author`, `id_gender`, `count_number`, `date_created`, `image`) VALUES
(3, 'Eye Contact and Attraction', 'When it comes to attraction, eye contact does a lot.  You can use eye contact to show a girl you’re interested, to gauge her interest, and to create or deepen her attraction in you.', '<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">When it comes to attraction, eye contact does a lot. &nbsp;You can use eye contact to show a girl you&rsquo;re interested, to gauge her interest, and to create or deepen her attraction in you. &nbsp;This article will cover all of that, and will even touch on the secret that allows you to make perfect eye contact with a woman every time.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Using eye contact to show interest</strong></p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Eye contact and attraction go hand in hand; the simplest way to show a girl you&rsquo;re interested in her is through eye contact. &nbsp;It may seem like a subtle sign of interest to guys, but to women, it&rsquo;s clear as day. &nbsp;But to do it right, you want to avoid the mistake most guys make in giving too much eye contact too soon.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">You see, your eye contact reflects your level of interest, and interest becomes more valuable the more she has to work for it. &nbsp;So if you&rsquo;re at a bar and just started talking to a girl you don&rsquo;t know, then you want to make eye contact about 50% of the time. &nbsp;The rest of the time can be spent looking elsewhere (if you stand shoulder to shoulder, rather than face to face, it&rsquo;s easy to casually look away). &nbsp;As the interaction progresses and she proves that she&rsquo;s an awesome girl, you&rsquo;ll want to reward her with more interest. &nbsp;This is when you give her more and more eye contact.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Using eye contact to gauge interest</strong></p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Eye contact is the most common indicator a girl is interested in you. &nbsp;If you&rsquo;re wondering whether or not that girl across the room wants to meet you, here are a few ways eye contact will let you know:</p>\r\n<ul style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 1.5em 1.655em; color: #171717; font-family: Lato, sans-serif; font-size: 17px;\">\r\n<li dir=\"ltr\" style=\"box-sizing: border-box; line-height: 1.6; margin-bottom: 0.8em;\">\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">If a girl makes eye contact with you, looks away, and then looks back at you all within about 30 seconds&hellip;she&rsquo;s interested.</p>\r\n</li>\r\n</ul>\r\n<ul style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 1.5em 1.655em; color: #171717; font-family: Lato, sans-serif; font-size: 17px;\">\r\n<li dir=\"ltr\" style=\"box-sizing: border-box; line-height: 1.6; margin-bottom: 0.8em;\">\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">If you lock eyes with a girl and she immediately looks down and away, that&rsquo;s a sign of embarrassment. &nbsp;She&rsquo;s probably interested, but just feels shy.</p>\r\n</li>\r\n</ul>\r\n<ul style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 1.5em 1.655em; color: #171717; font-family: Lato, sans-serif; font-size: 17px;\">\r\n<li dir=\"ltr\" style=\"box-sizing: border-box; line-height: 1.6; margin-bottom: 0.8em;\">\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">If you lock eyes with a girl for a longer period of time than the usual quick glance &ndash; even if it&rsquo;s just 2-3 seconds &ndash; it&rsquo;s a sign she&rsquo;s likely interested.</p>\r\n</li>\r\n</ul>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Create attraction with confident eye contact</strong></p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Our eyes express our emotional state. &nbsp;Anytime you allow someone to look into your eyes you&rsquo;re allowing them to see how you feel at that moment. &nbsp;You&rsquo;re making yourself vulnerable and letting them get a glimpse of the real you. &nbsp;And this is why eye contact and attraction are so strongly connected. &nbsp;Eye contact is an incredibly strong indicator of confidence.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">When someone feels insecure they will have a hard time maintaining eye contact. &nbsp;Their eyes will likely dart around the room as a means of &ldquo;hiding&rdquo;. &nbsp;But when someone feels confident, maintaining eye contact comes easily. &nbsp;A confident man is able to keep a strong, steady gaze. &nbsp;His eyes don&rsquo;t dart nervously, they move with purpose and intention.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">So when you&rsquo;re talking to a woman, keep a steady gaze. &nbsp;When you look away to do so with purpose and intention and avoid nervous darting. &nbsp;&nbsp;It&rsquo;ll help you come across as more confident, which will help generate those feelings of attraction in her.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Create attraction with friendly eye contact</strong></p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Plenty of guys can make strong, steady eye contact but still find they&rsquo;re unable to connect or build much attraction. &nbsp;This usually is a result of how they make eye contact. &nbsp;To build attraction eye contact needs to show more than confidence. &nbsp;It also needs to show that you&rsquo;re a positive, friendly guy. &nbsp;And the way to do this is by &ldquo;smiling with your eyes&rdquo;.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Listen or watch something that makes you laugh really hard. &nbsp;When you&rsquo;re done laughing, notice how your eyes feel and take a look at them in a mirror. &nbsp;You can see and feel that warm positivity coming from your eyes. &nbsp;Remember that feeling, because that&rsquo;s what you want to have whenever you make eye contact with a woman. &nbsp;You&rsquo;ll project a warm, friendly vibe and she&rsquo;ll be more receptive to you.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">The secret to perfect, effortless eye contact</strong></p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Sure eye contact shows confidence and interest, but that&rsquo;s not what it&rsquo;s really about. &nbsp;What eye contact is really about, is giving. &nbsp;It&rsquo;s about giving the woman attention and respect, and showing her that you appreciate her for the beautiful person she is (and not just physical beauty). &nbsp;When you&rsquo;re able to see a woman in that light &ndash; to look at her and appreciate her for who she is &ndash; then perfect, effortless eye contact (the steady gaze, smiling with your eyes, knowing when to hold eye contact and when to look away) all comes naturally.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Eye contact bonus! What to do when you get caught staring at a woman</strong></p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">When you&rsquo;re checking out a girl and she catches you, what do you do? &nbsp;Lots of guys out there will feel embarrassed, avert their eyes, and act like nothing happened. &nbsp;Their eyes will often dart down and away, as if to tell the woman &ldquo;sorry I was checking you out&rdquo;.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">But all this does is show a lack of confidence. &nbsp;And if that&rsquo;s her first impression, then building up any attraction is going to be incredibly difficult. &nbsp;So instead of apologizing, own up to it. &nbsp;Maintain that eye contact and attraction will have a chance to be created.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Besides, there&rsquo;s nothing wrong with letting a girl know she&rsquo;s attractive and has caught your attention. It&rsquo;s flattering. &nbsp;So long as you&rsquo;re not creepy about it, there&rsquo;s nothing to worry about. &nbsp;And to ensure you don&rsquo;t come off as creepy, all you&rsquo;ve got to do is relax and give her a nice smile.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">To learn more about how to flirt without being sleazy, get more dates, develop confident body language, and overcome your approach anxiety in just 5 days, check out The Art of Charm Bootcamp.</p>\r\n<p dir=\"ltr\" style=\"box-sizing: border-box; ma', 'The Art of Charm', 6, 12, '2018-11-12 12:48:42', 'YRRm73KYew63kOFfv2oVKzHk7hQmJEnSjEOVvvMn.jpeg'),
(5, 'How to Evoke Flirting Body Language', 'Flirting body language can be easy to spot.  See a girl lean in, make strong eye contact, touch you, giggle, and start blushing, and it’s pretty clear that she’s into you.  But how can you evoke this kind of flirting body language in a girl you’ve just met?', '<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Flirting body language can be easy to spot.&nbsp; See a girl lean in, make strong eye contact, touch you, giggle, and start blushing, and it&rsquo;s pretty clear that she&rsquo;s into you.&nbsp; But how can you evoke this kind of flirting body language in a girl you&rsquo;ve just met?&nbsp; Check out the tips below to find out.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Flirty eye contact</strong><br style=\"box-sizing: border-box;\" />If you want the girl to hold strong eye contact with you then you&rsquo;ve got to lead the way.&nbsp; You&rsquo;ve got to make and hold strong eye contact with her first.&nbsp; That means no darting your eyes away when a girl catches you looking at her.&nbsp; Instead, hold her eye contact while maintaining a soft, warm gaze.&nbsp; When done right she&rsquo;ll melt right there in front of you.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Another way to think of &ldquo;a soft, warm gaze&rdquo; is &ldquo;smiling with your eyes&rdquo;.&nbsp; You know that warm, relaxed feeling you get in your eyes after you&rsquo;ve laughed really hard?&nbsp; That is the feeling you want to have when making eye contact with a girl.&nbsp; That way your gaze won&rsquo;t feel hard and creepy.&nbsp; It will be warm and inviting.&nbsp; She&rsquo;ll feel drawn to you and respond with that strong, deep eye contact you were hoping for.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><a style=\"box-sizing: border-box; text-decoration-line: none; color: #137ac4;\" href=\"https://theartofcharm-theartofcharminc.netdna-ssl.com/wp-content/uploads/2014/05/Fotolia_51544022.jpg\"><img class=\"alignleft size-full wp-image-5586 jetpack-lazy-image jetpack-lazy-image--handled\" style=\"box-sizing: border-box; max-width: 100%; height: auto; vertical-align: middle; border: 0px; float: left; margin: 0.35em 1.5em 0.35em 0px;\" src=\"https://theartofcharm-theartofcharminc.netdna-ssl.com/wp-content/uploads/2014/05/Fotolia_51544022.jpg\" alt=\"\" width=\"394\" height=\"300\" data-lazy-loaded=\"1\" /></a><strong style=\"box-sizing: border-box;\">Get her laughing</strong><br style=\"box-sizing: border-box;\" />Begin the conversation by showing the girl you&rsquo;re not looking to get anything from her.&nbsp; You&rsquo;re just a fun, friendly guy looking to have a good time.&nbsp; When there&rsquo;s no agenda and you&rsquo;re just out having fun, flirty conversations, she&rsquo;ll be able to relax and feel comfortable talking with you.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">One way to get the ball rolling on a fun, flirty conversation is through playful teasing.&nbsp; Poke fun at the girl in a playful, good-natured way.&nbsp; Say something like &ldquo;You know, you&rsquo;d look really cute in a purple Mohawk&rdquo; while keeping a big smile on your face.&nbsp; This gets a conversation going and establishes that flirty, playful tone at the same time.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">An important think to keep in mind when starting a conversation with a girl in this way is to be self-amusing.&nbsp; Don&rsquo;t worry so much about whether or not you get her smiling and laughing.&nbsp; Instead focus on getting yourself smiling and laughing.&nbsp; If the conversation is fun for you then it&rsquo;s much more likely to be fun for her, too.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Draw her in</strong><br style=\"box-sizing: border-box;\" />Positive body language (when a girl faces you completely, leans in towards you, makes a lot of eye contact) is a form of flirting body language.&nbsp; To evoke this specific kind of flirting body language you&rsquo;ve got to prove to her that you&rsquo;re not like every other guy.&nbsp; Show her that you&rsquo;re different.&nbsp; You&rsquo;re a challenge.&nbsp; You&rsquo;re a guy with high-standards and although you may be interested in her, you&rsquo;re not completely sold just yet.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">An easy way to show you&rsquo;re interested &ndash; but not yet sold &ndash; is to ask her questions about herself.&nbsp; Specifically questions that get her to talk about herself in a positive way.&nbsp; Questions like &ldquo;So what&rsquo;s your deal?&rdquo; or &ldquo;What are three things I wouldn&rsquo;t know about you by looking?&rdquo; are great examples.&nbsp; They&rsquo;re open-ended, so a girl can answer however she wants.&nbsp; They also get her to talk about herself in a positive way, which automatically puts her in the role of the girl trying to win you over.&nbsp; Most important of all, these questions actually give you a chance to get to know her better.&nbsp; That way you can see if she actually is a girl you want to spend more time with.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Get her touching you</strong><br style=\"box-sizing: border-box;\" />The most obvious sign of flirting body language is when a girl starts touching you.&nbsp; To get a girl touching you, break the touch barrier yourself and start touching her.&nbsp; Give her light, playful taps with the back of your hand just above her elbow.&nbsp; As the conversation continues and she proves to be okay with your touch, use an open hand and touch her upper arm, shoulder, back, thigh, etc.&nbsp; By leading the way and touching her first you show that it&rsquo;s okay for her to start touching you, too.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">(For a more in-depth look at how to use touch to build attraction with women, check out the Art of Charm toolbox episode on touch.)</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Turn her on</strong><br style=\"box-sizing: border-box;\" />If you want to take her flirting body language to the next level and really get a girl turned on you&rsquo;ve got to continue building sexual tension.&nbsp; How can you do this?&nbsp; You can start by turning the conversation sexual.&nbsp; Sexual innuendos can be great for this as they bring sex into the conversation in a playful way.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">Once sex is introduced into the conversation it gives you a foundation to build from.&nbsp; Down the road you can be more direct, saying things like &ldquo;You&rsquo;re so turning me on right now&rdquo;.&nbsp; Since you&rsquo;ve already shown yourself to be a sexual being comfortable talking about sex, comments like this won&rsquo;t feel out of place.&nbsp; Instead, they&rsquo;ll be effective in building the sexual tension and getting her turned on.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\"><strong style=\"box-sizing: border-box;\">Mindsets for flirting with women</strong><br style=\"box-sizing: border-box;\" />While the actions described above are key for evoking flirting body language, what&rsquo;s even more important is getting the right mindset.&nbsp; When you have the right mindsets in place then the type of actions mentioned earlier flow easily and naturally.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">One mindset you want to have in order to evoke flirting body language is to assume the girl is already attracted to you.&nbsp; You don&rsquo;t have to say or do anything special to prove yourself to her.&nbsp; She&rsquo;s already sold.&nbsp; When you have this attitude it becomes much easier to relax and be both confident and sexual with women.&nbsp; With this mindset you&rsquo;ll find more and more women becoming attracted to you and showing you that flirting body language.</p>', 'The Art of Charm', 6, 31, '2018-11-12 12:48:46', 'L7fvLIvYVG4GNDf6aKGd8MQ2LEy3zv3GIxtcEQO6.jpeg'),
(6, 'Keeping It Light: Can Banter Be Flirting?', 'Most of the time when I coach men on bantering they’re amazed at how easy it is. Change the subject to flirting and they might clam up. But are the two actually different?', '<div class=\"entry-content content\" style=\"box-sizing: border-box; margin-top: 25px; font-size: 17px; color: #171717; font-family: Lato, sans-serif;\">\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\"><img class=\"alignright jetpack-lazy-image jetpack-lazy-image--handled\" style=\"box-sizing: border-box; max-width: 100%; height: auto; vertical-align: middle; border: 0px; float: right; margin: 0.35em 10px;\" src=\"https://theartofcharm-theartofcharminc.netdna-ssl.com/wp-content/uploads/files/2013/07/flirting.jpg\" alt=\"banter and flirting\" width=\"276\" height=\"184\" data-lazy-loaded=\"1\" />Most of the time when I coach men on bantering they&rsquo;re amazed at how easy it is. Change the subject to flirting and they might clam up. But are the two actually different? It&rsquo;s worth exploring the question can banter be flirting?</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\"><strong style=\"box-sizing: border-box;\">Flirting Is Fun</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">At the very least, banter and flirting have a lot in common. They&rsquo;re both light, fun and playful. They allow two people to interact with each other in an exciting way that doesn&rsquo;t risk a lot for either party. Can banter be flirting? Of course. But not all banter is flirting. There are a few things you can do to make sure that you&rsquo;re flirting while bantering and keep yourself out of the friend zone.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\"><strong style=\"box-sizing: border-box;\">Body Language Is Key</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">Body language is one of the biggest keys to making simple banter into sexy flirting. There&rsquo;s the basic use of your body to project confidence by standing up straight and a good smile to project friendliness. However, there&rsquo;s also the question of how your body language relates to hers.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">A lot of guys talk to women by facing them directly. This can put a lot of pressure on the interaction. You&rsquo;re also giving her something (your attention) without getting anything in return. Here&rsquo;s what we do instead:</p>\r\n<ul style=\"box-sizing: border-box; padding: 0px; margin: 0px 0px 1.5em 1.655em;\">\r\n<li style=\"box-sizing: border-box; line-height: 1.6; margin-bottom: 0.8em;\"><strong style=\"box-sizing: border-box;\">Introduce</strong>&nbsp;yourself by facing her straight on.</li>\r\n<li style=\"box-sizing: border-box; line-height: 1.6; margin-bottom: 0.8em;\"><strong style=\"box-sizing: border-box;\">Pivot</strong>&nbsp;to her side so that you are standing shoulder to shoulder, slightly angled in.</li>\r\n<li style=\"box-sizing: border-box; line-height: 1.6; margin-bottom: 0.8em;\"><strong style=\"box-sizing: border-box;\">Angle</strong>&nbsp;more toward her the more you want to show your approval. If you&rsquo;re unhappy with how the interaction is going, angle out a bit.</li>\r\n</ul>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">Think of your attention as a reward. People don&rsquo;t respect rewards they get for nothing. Using that to your advantage is a subtle way of displaying confidence; You&rsquo;re not giving your approval out to just anyone.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\"><strong style=\"box-sizing: border-box;\">Touch Accelerates Things</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">Guys are often afraid to touch women when they&rsquo;re talking. They shouldn&rsquo;t be. The arms, hands and upper back are all very safe places to touch a woman. Touch accomplishes a few things. First, it creates a sense of intimacy. Second, it gives her permission to start touching you. In my years of coaching, I&rsquo;ve noticed that the heat can get turned up&nbsp;<em style=\"box-sizing: border-box;\">fast</em>when a guy does something simple like touching a woman on the shoulder. Next time you&rsquo;re bantering with a woman at a bar or a club, try just playfully touching her on the shoulder and see where it goes.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\"><strong style=\"box-sizing: border-box;\">Smiling Is Your Ticket</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">Another thing that can make all the difference is a big smile. Smiling allows you to get away with saying and doing things that you might not otherwise. Think of something as simple as the phrase &ldquo;Get out of town!&rdquo; Said with a smile, this is a playful jest. The smile is an ancient, ancient sign that you&rsquo;re friendly and nonthreatening. Smiling with your eyes and cheeks, not just your mouth, is a great way to create a sense of ease in a woman, allowing both of you to flirt without fear.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\"><strong style=\"box-sizing: border-box;\">Let Her Be the Pace Car</strong></p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 1.5em; font-size: 1em;\">When it comes to flirting with banter, let her be the pace car. As a man, you want to be taking charge and have her be the one putting on the brakes. This shows confidence, but it&rsquo;s also the best way to keep things moving forward. Don&rsquo;t worry so much about going too far &mdash; she&rsquo;ll let you know. As long as you&rsquo;re being friendly and respectful it&rsquo;s OK to push the envelope a little.</p>\r\n</div>', 'The Art of Charm Academy .', 6, 35, '2018-11-12 12:48:53', 'ydIhs72UQprPH8ttK9xCkaqlRHtZXg29ueMnLrrf.jpeg'),
(7, 'Thời buổi này muốn thoát ế thì phải mạnh dạn \"điên\" một chút, tán crush mới đổ', 'Quên đi những bài viết kiểu “6 cách giúp bạn thoát kiếp F.A”“Bí kíp để không phải một mình trong những ngày lễ” đi vì chúng chẳng \"xi nhê\" gì cả.', '<h2 style=\"box-sizing: border-box; font-weight: 500; line-height: 25px; margin: 0px; font-size: 17px; padding: 0px 0px 10px; font-family: Roboto-Regular !important;\"><strong style=\"box-sizing: border-box; line-height: 25px !important;\">Qu&ecirc;n đi những b&agrave;i viết kiểu &ldquo;6 c&aacute;ch gi&uacute;p bạn tho&aacute;t kiếp F.A&rdquo;, &ldquo;B&iacute; k&iacute;p để kh&ocirc;ng phải một m&igrave;nh trong những ng&agrave;y lễ&rdquo; đi v&igrave; ch&uacute;ng chẳng \"xi nh&ecirc;\" g&igrave; cả.</strong></h2>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-size: 17px; font-family: Roboto-Regular !important; line-height: 25px !important;\">Thật ra, đa số c&aacute;c b&agrave;i viết đều khuy&ecirc;n bạn phải chăm ch&uacute;t cho vẻ ngo&agrave;i, thể hiện sự quan t&acirc;m, chia sẻ niềm vui nỗi buồn với đối tượng trong khi đ&oacute;&hellip; crush thời n&agrave;y chỉ th&iacute;ch &ldquo;mặn&rdquo;, cứ chuốc &ldquo;ngọt&rdquo; v&agrave;o hỏi sao kh&ocirc;ng hỏng. Thế mới n&oacute;i, muốn&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://www.yan.vn/24-bi-mat-cua-nhung-co-nang-van-nguoi-me-chua-xong-109187.html?utm_campaign=InternallinkYAN&amp;utm_source=145456&amp;utm_medium=noniadesktop\">g&acirc;y ấn tượng mạnh</a>&nbsp;với crush bạn phải &ldquo;ngược&rdquo;, c&agrave;ng &ldquo;ngược&rdquo; c&agrave;ng tốt, phải kh&aacute;c biệt, kh&ocirc;ng được giống đứa n&agrave;o hết, c&oacute; vậy crush mới ch&uacute; &yacute; đến m&igrave;nh.</p>\r\n<p style=\"box-sizing: border-box; margin: 0px 0px 10px; font-size: 17px; font-family: Roboto-Regular !important; line-height: 25px !important;\">Đ&acirc;y, h&atilde;y qu&ecirc;n hết c&aacute;c&nbsp;<a style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://www.yan.vn/muon-thoat-e-thi-ban-phai-hoc-thuoc-bo-bi-kip-gay-su-chu-y-nay-127291.html?utm_campaign=InternallinkYAN&amp;utm_source=145456&amp;utm_medium=noniadesktop\">tips cưa crush</a>&nbsp;trước kia đi, đọc ngay c&aacute;ch &ldquo;ngược&rdquo; m&agrave;&nbsp;<strong style=\"box-sizing: border-box; line-height: 25px !important;\">B&iacute; K&iacute;p Y&ecirc;u</strong>đ&atilde; soạn cho bạn n&agrave;y!</p>\r\n<p class=\"relative_position\" style=\"box-sizing: border-box; margin: 0px 0px 10px; position: relative; background: #f5f5f5; font-size: 17px; text-align: center; padding: 0px !important; font-family: Roboto-Regular !important; line-height: 25px !important;\">&nbsp;</p>\r\n<div class=\"adbro-md\" style=\"box-sizing: border-box; position: relative; overflow: hidden; width: 673px; height: 673px; top: 0px; margin-bottom: -673px;\">&nbsp;</div>\r\n<p><a class=\"image_fullscreen\" style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051800-hinh-1-copy.jpg\"><img class=\"img-content lazy\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; text-align: center !important; height: 520px; width: 520px; display: inline;\" title=\"\r\nC&aacute;ch 1: Crush sẽ ỷ bạn th&iacute;ch họ m&agrave; h&agrave;nh l&ecirc;n h&agrave;nh xuống. Trong trường hợp n&agrave;y bạn h&atilde;y &quot;chuyển hướng đi&quot;, v&igrave; t&acirc;m l&yacute; người ta l&agrave;&nbsp;c&oacute; kh&ocirc;ng giữ mất mới bắt đầu t&igrave;m.&nbsp;&nbsp;\" src=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051800-hinh-1-copy.jpg\" alt=\"\r\nC&aacute;ch 1: Crush sẽ ỷ bạn th&iacute;ch họ m&agrave; h&agrave;nh l&ecirc;n h&agrave;nh xuống. Trong trường hợp n&agrave;y bạn h&atilde;y &quot;chuyển hướng đi&quot;, v&igrave; t&acirc;m l&yacute; người ta l&agrave;&nbsp;c&oacute; kh&ocirc;ng giữ mất mới bắt đầu t&igrave;m.&nbsp;&nbsp;\" data-original=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051800-hinh-1-copy.jpg\" /></a><br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box; font-family: Roboto-Regular !important; font-size: 17px !important; line-height: 25px !important;\">C&aacute;ch 1: Crush sẽ ỷ bạn th&iacute;ch họ m&agrave; h&agrave;nh l&ecirc;n h&agrave;nh xuống. Trong trường hợp n&agrave;y bạn h&atilde;y \"chuyển hướng đi\", v&igrave; t&acirc;m l&yacute; người ta l&agrave;&nbsp;c&oacute; kh&ocirc;ng giữ mất mới bắt đầu t&igrave;m.&nbsp;&nbsp;</em></p>\r\n<p>&nbsp;</p>\r\n<p class=\"relative_position\" style=\"box-sizing: border-box; margin: 0px 0px 10px; position: relative; background: #f5f5f5; font-size: 17px; text-align: center; padding: 0px !important; font-family: Roboto-Regular !important; line-height: 25px !important;\"><a class=\"image_fullscreen\" style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051813-hinh-2-copy.jpg\"><img class=\"img-content lazy\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; height: 520px; width: 520px; display: inline;\" title=\"\r\nC&aacute;ch 2: Crush thả th&iacute;nh như n&agrave;o th&igrave; cứ thế m&agrave; thả lại y hệt, thả nhiều v&agrave;o, thả như c&aacute;ch n&oacute; t&agrave;n nhẫn thả m&igrave;nh.&nbsp;\" src=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051813-hinh-2-copy.jpg\" alt=\"\r\nC&aacute;ch 2: Crush thả th&iacute;nh như n&agrave;o th&igrave; cứ thế m&agrave; thả lại y hệt, thả nhiều v&agrave;o, thả như c&aacute;ch n&oacute; t&agrave;n nhẫn thả m&igrave;nh.&nbsp;\" data-original=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051813-hinh-2-copy.jpg\" /></a><br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box; line-height: 25px !important;\">C&aacute;ch 2: Crush thả th&iacute;nh như n&agrave;o th&igrave; cứ thế m&agrave; thả lại y hệt, thả nhiều v&agrave;o, thả như c&aacute;ch n&oacute; t&agrave;n nhẫn thả m&igrave;nh.&nbsp;</em></p>\r\n<p class=\"relative_position\" style=\"box-sizing: border-box; margin: 0px 0px 10px; position: relative; background: #f5f5f5; font-size: 17px; text-align: center; padding: 0px !important; font-family: Roboto-Regular !important; line-height: 25px !important;\"><a class=\"image_fullscreen\" style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051828-hinh-3-copy.jpg\"><img class=\"img-content lazy\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; height: 520px; width: 520px; display: inline;\" title=\"\r\nC&aacute;ch 3: Đừng bao giờ, đừng bao giờ thả tim v&agrave;o một bức h&igrave;nh n&agrave;o của crush, cứ m&agrave; &quot;phẫn nộ&quot; thẳng tiến.&nbsp;\" src=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051828-hinh-3-copy.jpg\" alt=\"\r\nC&aacute;ch 3: Đừng bao giờ, đừng bao giờ thả tim v&agrave;o một bức h&igrave;nh n&agrave;o của crush, cứ m&agrave; &quot;phẫn nộ&quot; thẳng tiến.&nbsp;\" data-original=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051828-hinh-3-copy.jpg\" /></a><br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box; line-height: 25px !important;\">C&aacute;ch 3: Đừng bao giờ, đừng bao giờ thả tim v&agrave;o một bức h&igrave;nh n&agrave;o của crush, cứ m&agrave; \"phẫn nộ\" thẳng tiến.&nbsp;</em></p>\r\n<p class=\"relative_position\" style=\"box-sizing: border-box; margin: 0px 0px 10px; position: relative; background: #f5f5f5; font-size: 17px; text-align: center; padding: 0px !important; font-family: Roboto-Regular !important; line-height: 25px !important;\"><a class=\"image_fullscreen\" style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051848-hinh-4-copy.jpg\"><img class=\"img-content lazy\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; height: 780px; width: 520px; display: inline;\" title=\"\r\nC&aacute;ch 4: Crush th&iacute;ch c&aacute;i g&igrave; th&igrave; m&igrave;nh gh&eacute;t c&aacute;i đ&oacute;, phải l&agrave;m crush từ &quot;chướng&quot; m&igrave;nh đến &quot;y&ecirc;u&quot; m&ecirc; mệt.&nbsp;\" src=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051848-hinh-4-copy.jpg\" alt=\"\r\nC&aacute;ch 4: Crush th&iacute;ch c&aacute;i g&igrave; th&igrave; m&igrave;nh gh&eacute;t c&aacute;i đ&oacute;, phải l&agrave;m crush từ &quot;chướng&quot; m&igrave;nh đến &quot;y&ecirc;u&quot; m&ecirc; mệt.&nbsp;\" data-original=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051848-hinh-4-copy.jpg\" /></a><br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box; line-height: 25px !important;\">C&aacute;ch 4: Crush th&iacute;ch c&aacute;i g&igrave; th&igrave; m&igrave;nh gh&eacute;t c&aacute;i đ&oacute;, phải l&agrave;m crush từ \"chướng\" m&igrave;nh đến \"y&ecirc;u\" m&ecirc; mệt.&nbsp;</em></p>\r\n<div class=\"row mb20\" style=\"box-sizing: border-box; margin-left: -10px; margin-right: -10px; margin-bottom: 20px; font-family: Roboto-Regular, sans-serif; font-size: 17px;\">\r\n<div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-12\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-left: 10px; padding-right: 10px; float: left; width: 346.656px;\">\r\n<div class=\"ads\" style=\"box-sizing: border-box; width: 326.656px; text-align: center; position: relative; margin-bottom: 20px;\">&nbsp;</div>\r\n</div>\r\n<div class=\"col-lg-6 col-md-6 col-sm-6 col-xs-12\" style=\"box-sizing: border-box; position: relative; min-height: 1px; padding-left: 10px; padding-right: 10px; float: left; width: 346.656px;\">\r\n<div class=\"ads\" style=\"box-sizing: border-box; width: 326.656px; text-align: center; position: relative; margin-bottom: 20px;\">\r\n<div id=\"div-gpt-ad-1504591910407-0\" style=\"box-sizing: border-box; height: 250px; width: 300px;\" data-google-query-id=\"CKuAxquEpN4CFUZolgodt3gCqw\">\r\n<div id=\"google_ads_iframe_/37151495/YAN.vn-Reading-Centerbanner1_0__container__\" style=\"box-sizing: border-box; border: 0pt none; display: inline-block; width: 300px; height: 250px;\"><iframe id=\"google_ads_iframe_/37151495/YAN.vn-Reading-Centerbanner1_0\" style=\"box-sizing: border-box; width: 300px; border-width: 0px; border-style: initial; vertical-align: bottom; margin: 0px !important; padding: 0px !important;\" title=\"3rd party ad content\" src=\"http://tpc.googlesyndication.com/safeframe/1-0-30/html/container.html\" name=\"\" width=\"300\" height=\"250\" frameborder=\"0\" marginwidth=\"0\" marginheight=\"0\" scrolling=\"no\" sandbox=\"allow-forms allow-pointer-lock allow-popups allow-popups-to-escape-sandbox allow-same-origin allow-scripts allow-top-navigation-by-user-activation\" data-is-safeframe=\"true\" data-load-complete=\"true\"></iframe></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n<p class=\"relative_position\" style=\"box-sizing: border-box; margin: 0px 0px 10px; position: relative; background: #f5f5f5; font-size: 17px; text-align: center; padding: 0px !important; font-family: Roboto-Regular !important; line-height: 25px !important;\"><a class=\"image_fullscreen\" style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051902-hinh-5-copy.jpg\"><img class=\"img-content lazy\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; height: 780px; width: 520px; display: inline;\" title=\"\r\nC&aacute;ch 5: Kh&ocirc;ng d&aacute;m cược th&igrave; sao th&agrave;nh c&ocirc;ng? Cứ mạnh dạn &quot;ngược&quot; hết cỡ nhưng đừng để... n&oacute; biết!&nbsp;\" src=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051902-hinh-5-copy.jpg\" alt=\"\r\nC&aacute;ch 5: Kh&ocirc;ng d&aacute;m cược th&igrave; sao th&agrave;nh c&ocirc;ng? Cứ mạnh dạn &quot;ngược&quot; hết cỡ nhưng đừng để... n&oacute; biết!&nbsp;\" data-original=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051902-hinh-5-copy.jpg\" /></a><br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box; line-height: 25px !important;\">C&aacute;ch 5: Kh&ocirc;ng d&aacute;m cược th&igrave; sao th&agrave;nh c&ocirc;ng? Cứ mạnh dạn \"ngược\" hết cỡ nhưng đừng để... n&oacute; biết!&nbsp;</em></p>\r\n<p class=\"relative_position\" style=\"box-sizing: border-box; margin: 0px 0px 10px; position: relative; background: #f5f5f5; font-size: 17px; text-align: center; padding: 0px !important; font-family: Roboto-Regular !important; line-height: 25px !important;\"><a class=\"image_fullscreen\" style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051916-hinh-6-copy.jpg\"><img class=\"img-content lazy\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; height: 780px; width: 520px; display: inline;\" title=\"\r\nC&aacute;ch 6: Phải đẹp, kh&ocirc;ng đẹp th&igrave; phải c&oacute; duy&ecirc;n. Chứ v&ocirc; duy&ecirc;n th&igrave; hết đường chữa.&nbsp;\" src=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051916-hinh-6-copy.jpg\" alt=\"\r\nC&aacute;ch 6: Phải đẹp, kh&ocirc;ng đẹp th&igrave; phải c&oacute; duy&ecirc;n. Chứ v&ocirc; duy&ecirc;n th&igrave; hết đường chữa.&nbsp;\" data-original=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051916-hinh-6-copy.jpg\" /></a><br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box; line-height: 25px !important;\">C&aacute;ch 6: Phải đẹp, kh&ocirc;ng đẹp th&igrave; phải c&oacute; duy&ecirc;n. Chứ v&ocirc; duy&ecirc;n th&igrave; hết đường chữa.&nbsp;</em></p>\r\n<p class=\"relative_position\" style=\"box-sizing: border-box; margin: 0px 0px 10px; position: relative; background: #f5f5f5; font-size: 17px; text-align: center; padding: 0px !important; font-family: Roboto-Regular !important; line-height: 25px !important;\"><img class=\"imgShareFB\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; position: absolute; cursor: pointer; display: block; left: -60px; top: 0px; height: 60px !important; width: auto !important;\" src=\"http://www.yan.vn/images/fb.jpg\" /><img class=\"imgShareLink\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; position: absolute; cursor: pointer; display: block; left: -60px; top: 60px; height: 60px !important; width: auto !important;\" src=\"http://www.yan.vn/images/link.jpg\" /><a class=\"image_fullscreen\" style=\"box-sizing: border-box; background-color: transparent; color: #dd3333; text-decoration-line: none;\" href=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051930-hinh-7-copy.jpg\"><img class=\"img-content lazy\" style=\"box-sizing: border-box; border: 0px; vertical-align: middle; height: 520px; width: 520px; display: inline;\" title=\"\r\nC&aacute;ch 7: Cố qu&aacute; th&agrave;nh qu&aacute; cố, c&oacute; khi bạn bỏ cuộc th&igrave; crush lại quyết định &quot;nhập cuộc&quot;. Đ&ocirc;i khi h&atilde;y học c&aacute;ch từ bỏ.&nbsp;\" src=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051930-hinh-7-copy.jpg\" alt=\"\r\nC&aacute;ch 7: Cố qu&aacute; th&agrave;nh qu&aacute; cố, c&oacute; khi bạn bỏ cuộc th&igrave; crush lại quyết định &quot;nhập cuộc&quot;. Đ&ocirc;i khi h&atilde;y học c&aacute;ch từ bỏ.&nbsp;\" data-original=\"http://static2.yan.vn/YanNews/2167221/201711/20171106-051930-hinh-7-copy.jpg\" /></a><br style=\"box-sizing: border-box;\" /><em style=\"box-sizing: border-box; line-height: 25px !important;\">C&aacute;ch 7: Cố qu&aacute; th&agrave;nh qu&aacute; cố, c&oacute; khi bạn bỏ cuộc th&igrave; crush lại quyết định \"nhập cuộc\". Đ&ocirc;i khi h&atilde;y học c&aacute;ch từ bỏ.&nbsp;</em></p>', 'Bí kiếp Yêu', 6, 65, '2018-11-12 12:48:57', 'bh1HG4V1uRFohzP9AyfIoIh2FO58Iiq84HcpCbpG.jpeg');
INSERT INTO `flirtingmethods` (`id`, `name_flirting`, `preview_text`, `detail_flirting`, `author`, `id_gender`, `count_number`, `date_created`, `image`) VALUES
(8, 'Tán đổ crush chỉ trong vòng 1 nốt nhạc với trọn bộ 12 bí kíp bất bình thường này!', 'Đừng dùng những chiêu thông thường để gây chú ý với crush nữa, bạn sẽ không thoát ế được đâu!', '<p style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: 25px; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; box-sizing: border-box; color: #222222; -webkit-font-smoothing: subpixel-antialiased;\">Ng&agrave;y n&agrave;o bạn cũng đọc được nhan nhản c&aacute;c b&agrave;i viết kiểu \"10 c&aacute;ch gi&uacute;p bạn tho&aacute;t ế\", \"7 b&iacute; quyết gi&uacute;p bạn sớm ra khỏi hội F.A\", \"5 c&aacute;ch khiến crush phải ch&uacute; &yacute; tới bạn\"... Nhưng rồi khi bạn &aacute;p dụng th&igrave; chẳng xi nh&ecirc; g&igrave;, người y&ecirc;u vẫn kh&ocirc;ng c&oacute;, m&agrave; ngay cả c&aacute;i đứa m&igrave;nh crush cũng chẳng th&egrave;m đo&aacute;i ho&agrave;i.&nbsp;</p>\r\n<p style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: 25px; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; box-sizing: border-box; color: #222222; -webkit-font-smoothing: subpixel-antialiased;\">Thật ra, nguy&ecirc;n nh&acirc;n cũng dễ hiểu th&ocirc;i. Bất cứ lời khuy&ecirc;n hay b&iacute; k&iacute;p n&agrave;o cũng c&oacute; nội dung na n&aacute; nhau, khuy&ecirc;n bạn phải chăm ch&uacute;t cho vẻ bề ngo&agrave;i, thể hiện sự quan t&acirc;m đến người ấy, chia sẻ niềm vui nỗi buồn với họ... Thế n&ecirc;n ai cũng x&agrave;i y hệt 1 chi&ecirc;u đ&oacute;, th&igrave; thử hỏi g&acirc;y ấn tượng l&agrave;m sao được. B&acirc;y giờ muốn khiến crush ch&uacute; &yacute; đến m&igrave;nh th&igrave; phải l&agrave;m kh&aacute;c đi, kh&ocirc;ng được giống đứa n&agrave;o hết, c&oacute; thế th&igrave; khả năng tho&aacute;t ế mới cao.</p>\r\n<p style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: 25px; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; box-sizing: border-box; color: #222222; -webkit-font-smoothing: subpixel-antialiased;\">Vứt hết những thứ bạn đ&atilde; đọc được từ trước đến nay đi, v&agrave; học theo bộ 12 b&iacute; k&iacute;p g&acirc;y sự ch&uacute; &yacute; với crush mới nhất n&agrave;y nh&eacute;. Ch&uacute;c bạn th&agrave;nh c&ocirc;ng!</p>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">1. Đừng đi theo lối m&ograve;n nữa, tất cả những g&igrave; bạn cần l&agrave;m l&agrave; sở hữu một bộ sưu tập avatar thật vi diệu m&agrave; th&ocirc;i.</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18156781-453139075034126-8353964637512848254-o-1493356228777.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_fd0a6bc0-2bd0-11e7-b3d7-d9e94ef10d9e\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 1.\" src=\"https://kenh14cdn.com/2017/18156781-453139075034126-8353964637512848254-o-1493356228777.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 1.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18156781-453139075034126-8353964637512848254-o-1493356228777.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode active\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\"><span style=\"box-sizing: border-box; line-height: 20px; font-size: 20px;\">2. T&aacute;n crush th&igrave; thường qu&aacute;, ai chả l&agrave;m được. B&acirc;y giờ l&agrave; phải t&aacute;n bạn th&acirc;n crush cơ!</span></h3>\r\n<div class=\"VCSortableInPreviewMode noCaption active\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18156127-453139498367417-685277603981670094-o-1493356350592.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_459aedb0-2bd1-11e7-b3d7-d9e94ef10d9e\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 3.\" src=\"https://kenh14cdn.com/2017/18156127-453139498367417-685277603981670094-o-1493356350592.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 3.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18156127-453139498367417-685277603981670094-o-1493356350592.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">3. Nam ch&acirc;m tr&aacute;i dấu th&igrave; h&uacute;t nhau, thế n&ecirc;n c&aacute;i g&igrave; m&agrave; crush th&iacute;ch cũng phải phản đối cho bằng được, nhớ chưa!</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18121852-453139495034084-6991899448518428214-o-1493356457283.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_856cf8c0-2bd1-11e7-b3d7-d9e94ef10d9e\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 5.\" src=\"https://kenh14cdn.com/2017/18121852-453139495034084-6991899448518428214-o-1493356457283.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 5.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18121852-453139495034084-6991899448518428214-o-1493356457283.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">4. Kết bạn, rồi giữ li&ecirc;n lạc th&igrave; ai chả l&agrave;m được. Nhưng hack nick lại cần tr&igrave;nh độ kh&aacute;c cơ!</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18077292-453139491700751-5509522978490239672-o-1493356477154.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_9136dae0-2bd1-11e7-a8ef-278aa46c14f5\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 7.\" src=\"https://kenh14cdn.com/2017/18077292-453139491700751-5509522978490239672-o-1493356477154.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 7.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18077292-453139491700751-5509522978490239672-o-1493356477154.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">5. Từ l&uacute;c c&oacute; Phẫn Nộ, t&ocirc;i thấy người ta hay kh&oacute; chịu với nhau hơn...</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18121837-453139538367413-6447287775859329679-o-1493356846609.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_6d384420-2bd2-11e7-a8ef-278aa46c14f5\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 9.\" src=\"https://kenh14cdn.com/2017/18121837-453139538367413-6447287775859329679-o-1493356846609.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 9.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18121837-453139538367413-6447287775859329679-o-1493356846609.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\"><span style=\"box-sizing: border-box; line-height: 20px; font-size: 20px;\">6. Cẩn thận t&aacute;c dụng ngược: crush sẽ nghĩ bạn chảnh, rồi cả hai sẽ lại th&agrave;nh người dưng ngược lối...</span></h3>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18193168-453139541700746-7137475768897322579-o-1493356932070.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_a0462e90-2bd2-11e7-b3d7-d9e94ef10d9e\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 11.\" src=\"https://kenh14cdn.com/2017/18193168-453139541700746-7137475768897322579-o-1493356932070.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 11.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18193168-453139541700746-7137475768897322579-o-1493356932070.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">7. Thật kh&ocirc;ng ngờ cũng c&oacute; ng&agrave;y icon :) hữu dụng đến thế!</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18121216-453139588367408-6303686439818316001-o-1493357097819.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_02fa2050-2bd3-11e7-a8ef-278aa46c14f5\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 13.\" src=\"https://kenh14cdn.com/2017/18121216-453139588367408-6303686439818316001-o-1493357097819.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 13.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18121216-453139588367408-6303686439818316001-o-1493357097819.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<p style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: 25px; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; box-sizing: border-box; color: #222222; -webkit-font-smoothing: subpixel-antialiased;\"><strong style=\"margin: 0px; padding: 0px; border: 0px; font-style: inherit; font-variant: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; box-sizing: border-box;\"><span style=\"box-sizing: border-box; line-height: 20px; font-size: 20px;\">8. Thể hiện bản chất thật mọi l&uacute;c mọi nơi!</span></strong></p>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18193240-453139548367412-6643428634250163144-o-1493357312308.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_853bebc0-2bd3-11e7-b630-eb19d879ac9b\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 15.\" src=\"https://kenh14cdn.com/2017/18193240-453139548367412-6643428634250163144-o-1493357312308.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 15.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18193240-453139548367412-6643428634250163144-o-1493357312308.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">9. H&atilde;y d&ugrave;ng c&aacute;ch kh&ocirc;ng giống người - b&igrave;nh - thường để g&acirc;y ch&uacute; &yacute; với crush, đảm bảo ấn tượng kh&oacute; phai!</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption active\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18122004-453139591700741-3918642274096939328-o-1493357381789.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_ae750d50-2bd3-11e7-94dd-f5fb809058d1\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 17.\" src=\"https://kenh14cdn.com/2017/18122004-453139591700741-3918642274096939328-o-1493357381789.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 17.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18122004-453139591700741-3918642274096939328-o-1493357381789.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">10. Nếu kh&ocirc;ng mạnh bạo quăng th&iacute;nh v&agrave;o mặt crush th&igrave; sẽ c&oacute; đứa kh&aacute;c thay bạn l&agrave;m việc đ&oacute; đấy!</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18121337-453139598367407-3408614130944303913-o-1493357513060.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_fca512e0-2bd3-11e7-a8ef-278aa46c14f5\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 19.\" src=\"https://kenh14cdn.com/2017/18121337-453139598367407-3408614130944303913-o-1493357513060.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 19.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18121337-453139598367407-3408614130944303913-o-1493357513060.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">11. Th&iacute;ch l&agrave; phải nh&iacute;ch, cứ chần chừ lại bị kẻ kh&aacute;c nẫng tay tr&ecirc;n...</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18193295-453139628367404-4645627881279537452-o-1493357570349.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_1ed84300-2bd4-11e7-8322-779d627a548f\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 21.\" src=\"https://kenh14cdn.com/2017/18193295-453139628367404-4645627881279537452-o-1493357570349.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 21.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18193295-453139628367404-4645627881279537452-o-1493357570349.jpg\" /></a></div>\r\n</div>\r\n<div class=\"VCSortableInPreviewMode\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\"><hr style=\"box-sizing: border-box; height: 1px; border-right: 0px; border-bottom: 0px; border-left: 0px; border-image: initial; border-top-style: solid; border-top-color: #ececec; margin: 2em 0px; padding: 0px;\" /></div>\r\n<h3 style=\"margin: 0px 0px 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-weight: inherit; font-stretch: inherit; font-size: 22px; line-height: 26px; font-family: SFD-Bold; vertical-align: baseline; box-sizing: border-box; color: #111111;\">12. Haha, tin người thế nhỉ!!! Nhưng d&ugrave; sao cũng ch&uacute;c c&aacute;c bạn sớm \"v&aacute;c\" được crush về nh&agrave; nh&eacute;!!!</h3>\r\n<div class=\"VCSortableInPreviewMode noCaption active\" style=\"margin: 0px auto 25px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 17px; line-height: inherit; font-family: \'Times New Roman\', Georgia, serif; vertical-align: baseline; outline: 0px; text-align: center; width: 550px; box-sizing: border-box; color: #222222;\">\r\n<div style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; outline: 0px; box-sizing: border-box;\"><a class=\"detail-img-lightbox\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline; text-decoration-line: none; box-sizing: border-box; cursor: zoom-in; display: block;\" title=\"\" href=\"https://kenh14cdn.com/2017/18121158-453139641700736-1751458967724007219-o-1493357628307.jpg\" target=\"_blank\" rel=\"noopener\" data-fancybox-group=\"img-lightbox\"><img id=\"img_41ad0a50-2bd4-11e7-b3d7-d9e94ef10d9e\" class=\"lightbox-content\" style=\"margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: bottom; color: transparent; box-sizing: border-box; display: block; width: 550px; max-width: 100%;\" title=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 23.\" src=\"https://kenh14cdn.com/2017/18121158-453139641700736-1751458967724007219-o-1493357628307.jpg\" alt=\"T&aacute;n đổ crush chỉ trong v&ograve;ng 1 nốt nhạc với trọn bộ 12 b&iacute; k&iacute;p bất b&igrave;nh thường n&agrave;y! - Ảnh 23.\" width=\"\" height=\"\" data-original=\"https://kenh14cdn.com/2017/18121158-453139641700736-1751458967724007219-o-1493357628307.jpg\" /></a></div>\r\n</div>', 'Awkward or Cute\'s Facebook', 6, 22, '2018-11-12 12:49:00', 'ZSCLMjmJsVaIfwutl0k0joYX5rFpJISF0kVhR9yj.jpeg');
INSERT INTO `flirtingmethods` (`id`, `name_flirting`, `preview_text`, `detail_flirting`, `author`, `id_gender`, `count_number`, `date_created`, `image`) VALUES
(9, '20 dấu hiệu chàng yêu thích bạn thật lòng hơn chính bản thân mình', 'Dấu hiệu chàng yêu thích bạn thật lòng dù không nói ra giúp các bạn gái có thể kiểm chứng tình yêu của người mình yêu một cách hiệu quả nhất. Đã bao giờ bạn tự hỏi người yêu của mình có yêu mình thật lòng hay không? liệu đây có phải là người đàn ông của cuộc đời bạn?', '<p><strong style=\"margin: 0px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\"><a style=\"margin: 0px; padding: 0px; color: #3399ff; text-decoration-line: none;\" href=\"https://giadinh.blog/dau-hieu-chang-yeu-thich-ban-that-long.html\">Dấu hiệu ch&agrave;ng y&ecirc;u th&iacute;ch bạn</a>&nbsp;thật l&ograve;ng</strong><span style=\"color: #222222; font-family: Verdana, Geneva, sans-serif;\">&nbsp;d&ugrave; kh&ocirc;ng n&oacute;i ra gi&uacute;p c&aacute;c bạn g&aacute;i c&oacute; thể kiểm chứng t&igrave;nh y&ecirc;u của người m&igrave;nh y&ecirc;u một c&aacute;ch hiệu quả nhất. Đ&atilde; bao giờ bạn tự hỏi người y&ecirc;u của m&igrave;nh c&oacute; y&ecirc;u m&igrave;nh thật l&ograve;ng hay kh&ocirc;ng? liệu đ&acirc;y c&oacute; phải l&agrave; người đ&agrave;n &ocirc;ng của cuộc đời bạn?&hellip;.Để trả lời cho những c&acirc;u hỏi n&agrave;y kh&ocirc;ng hề dễ d&agrave;ng. Trong t&igrave;nh y&ecirc;u, kh&ocirc;ng cần những c&acirc;u &ldquo;Anh y&ecirc;u em&rdquo; mỗi ng&agrave;y mới l&agrave; thể hiện t&igrave;nh cảm, c&aacute;c bạn g&aacute;i cũng c&oacute; thể cảm nhận được t&igrave;nh y&ecirc;u của ch&agrave;ng trai th&ocirc;ng qua c&aacute;c h&agrave;nh động thường ng&agrave;y hay những nụ h&ocirc;n nhẹ nh&agrave;ng, chỉ cần bạn kh&eacute;o l&eacute;o v&agrave; tinh &yacute; quan s&aacute;t một t&iacute; l&agrave; c&oacute; thể nhận ra ngay.</span></p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">1. Anh ấy trả lời điện thoại v&agrave; gửi tin nhắn cho bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Với những người đang y&ecirc;u, gọi điện hay gửi tin nhắn hỏi thăm l&agrave; việc l&agrave;m thường xuy&ecirc;n, thậm ch&iacute;, ta mong tin ch&agrave;ng c&ograve;n hơn cả giờ cơm trưa. N&agrave;y nh&eacute;! Bạn nhắn tin &ldquo;anh y&ecirc;u, anh đ&atilde; ăn chưa, chiều anh đ&oacute;n em nh&eacute;&rdquo;. Nếu kh&ocirc;ng bận g&igrave;, lập tức anh ấy sẽ trả lời cho bạn ngay tức th&igrave;. Giao tiếp l&agrave; ch&igrave;a kh&oacute;a của mọi vấn đề v&agrave; l&agrave; một điều kh&ocirc;ng thể thiếu trong c&aacute;c mối quan hệ. Khi đ&atilde; cưới, đang y&ecirc;u hay sắp sửa y&ecirc;u, bạn v&agrave; người y&ecirc;u cần n&oacute;i chuyện với nhau h&agrave;ng ng&agrave;y. Thời buổi c&ocirc;ng nghệ th&ocirc;ng tin, nếu một anh ch&agrave;ng y&ecirc;u v&agrave; theo đuổi bạn, anh ta sẽ nhắn tin v&agrave; gọi điện h&agrave;ng ng&agrave;y cho bạn.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">2. Anh ta y&ecirc;u c&aacute;ch bạn sống</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">L&agrave;m sao để biết anh ấy y&ecirc;u bạn? Một người y&ecirc;u bạn thật l&ograve;ng sẽ l&agrave;m những điều m&agrave; bạn th&iacute;ch. Nếu bạn kh&ocirc;ng th&iacute;ch đi ăn trưa, tụ tập chỗ đ&ocirc;ng người, anh ấy sẽ l&agrave;m theo &yacute; bạn. T&igrave;nh y&ecirc;u, hay h&ocirc;n nh&acirc;n cũng thật l&agrave; mu&ocirc;n m&agrave;u mu&ocirc;n vẻ. C&oacute; những người lấy rồi, thế m&agrave; vẫn hỏi anh ấy c&oacute; y&ecirc;u m&igrave;nh thật l&ograve;ng kh&ocirc;ng? Vậy h&atilde;y xem, anh ấy c&oacute; gi&uacute;p bạn l&agrave;m việc nh&agrave; kh&ocirc;ng, c&oacute; gi&uacute;p bạn tr&ocirc;ng con kh&ocirc;ng nh&eacute;. Nếu c&oacute;, th&igrave; anh ấy y&ecirc;u bạn thật rồi.</p>\r\n<table class=\"picture\" style=\"margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; width: 640px; color: #222222; font-family: Verdana, Geneva, sans-serif;\" align=\"center\">\r\n<tbody style=\"margin: 0px; padding: 0px;\">\r\n<tr style=\"margin: 0px; padding: 0px;\">\r\n<td class=\"pic\" style=\"margin: 0px; padding: 10px;\"><img class=\"alignnone size-full wp-image-177179 cool-image-share\" style=\"margin: 0px 0px 20px; padding: 0px; border: 0px; transition: all 1s ease 0s; max-width: 100%; height: auto;\" title=\"20 dấu hiệu ch&agrave;ng y&ecirc;u th&iacute;ch bạn thật l&ograve;ng hơn ch&iacute;nh bản th&acirc;n m&igrave;nh\" src=\"https://giadinh.blog/wp-content/uploads/2018/03/20-dau-hieu-chang-yeu-thich-ban-that-long-hon-chinh-ban-than-minh-20180322-03-2018-131748.jpg\" alt=\"20 dấu hiệu ch&agrave;ng y&ecirc;u th&iacute;ch bạn thật l&ograve;ng hơn ch&iacute;nh bản th&acirc;n m&igrave;nh\" width=\"500\" height=\"502\" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">&nbsp;</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">3. Bạn đẹp trong l&ograve;ng anh ấy</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Một ch&agrave;ng trai y&ecirc;u một c&ocirc; g&aacute;i, chắc hẳn anh ta sẽ kh&ocirc;ng để &yacute; đến những c&ocirc; g&aacute;i kh&aacute;c. Bạn đẹp trong l&ograve;ng anh ấy v&agrave; anh ấy sẽ quan t&acirc;m bạn như một qu&yacute; c&ocirc;. Chỉ một cử chỉ nhỏ như che &ocirc; cho bạn, hay c&ugrave;ng đi ăn v&agrave; anh ấy k&eacute;o ghế cho bạn, rồi anh mở cửa xe cho bạn, cũng đủ bạn xao xuyến l&ograve;ng rồi. Khỏi phải n&oacute;i, bạn đ&aacute;ng được phục t&ugrave;ng như một qu&yacute; c&ocirc; đ&agrave;i c&aacute;c.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">4. Anh ấy y&ecirc;u vẻ đẹp tự nhi&ecirc;n của bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Thực tế th&igrave; kh&ocirc;ng mấy đ&agrave;n &ocirc;ng th&iacute;ch người phụ nữ của m&igrave;nh suốt ng&agrave;y son phấn. Họ c&oacute; xu hướng y&ecirc;u vẻ đẹp tự nhi&ecirc;n v&agrave; t&iacute;nh c&aacute;ch tự nhi&ecirc;n vốn c&oacute; của bạn. Nếu y&ecirc;u bạn, anh ấy sẽ xem cả c&aacute;ch trang điểm, ăn mặc, v&agrave; cả c&aacute;ch ứng xử của bạn nữa. Anh ấy y&ecirc;u bạn v&agrave; kh&ocirc;ng t&igrave;m c&aacute;ch thay đổi ngoại h&igrave;nh cũng như t&iacute;nh c&aacute;ch của bạn.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">5. Anh ấy tự h&agrave;o về bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Nếu y&ecirc;u, anh ấy rất tự h&agrave;o về bạn v&agrave; hay nhắc đến bạn, nghĩ đến bạn. Nếu anh ấy rủ đi chơi c&ugrave;ng đ&aacute;m bạn của anh ấy, h&atilde;y đi đi đừng ngại nh&eacute;. Bởi bạn c&oacute; thể biết được anh ấy l&agrave; người thế n&agrave;o qua bạn b&egrave; đấy. Mỗi khi bạn đạt th&agrave;nh t&iacute;ch cao trong học tập, anh ấy sẽ rất tự h&agrave;o v&agrave; tất nhi&ecirc;n, nếu đ&atilde; để &yacute; v&agrave; giữ t&igrave;nh y&ecirc;u b&ecirc;n m&igrave;nh, anh ta sẽ kh&ocirc;ng giấu bạn với bạn b&egrave;, gia đ&igrave;nh.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">6. Anh ấy quyết t&acirc;m theo đuổi bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Nếu y&ecirc;u thật l&ograve;ng, anh ấy sẽ quyết kh&ocirc;ng để mất người con g&aacute;i như bạn. Khi đang y&ecirc;u, anh ấy sẽ nhắn tin, gọi điện thường xuy&ecirc;n, gi&uacute;p đỡ bạn khi cần v&agrave; đặc biệt l&agrave; lu&ocirc;n lu&ocirc;n chăm ch&uacute;t bản th&acirc;n mỗi khi b&ecirc;n bạn. Khi đ&atilde; về một nh&agrave;, anh ấy vẫn kh&ocirc;ng ngừng thể hiện l&agrave; một người đ&agrave;n &ocirc;ng mẫu mực v&agrave; y&ecirc;u bạn hết l&ograve;ng. Anh ấy sẽ kh&ocirc;ng ngừng theo đuổi v&agrave; gi&uacute;p đỡ bạn. Anh ấy sẽ kh&ocirc;ng qu&ecirc;n những m&oacute;n qu&agrave; v&agrave;o những ng&agrave;y đặc biệt của phụ nữ đ&acirc;u nh&eacute;.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">7. Anh ấy gi&uacute;p đỡ v&agrave; lu&ocirc;n b&ecirc;n bạn khi cần</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Kh&ocirc;ng phải ai đang y&ecirc;u hay cả khi tiến tới h&ocirc;n nh&acirc;n rồi cũng được ở b&ecirc;n nhau cả ng&agrave;y. Bởi đặc th&ugrave; c&ocirc;ng việc mỗi người mỗi kh&aacute;c. Tuy nhi&ecirc;n, trong cuộc sống, c&oacute; v&ocirc; v&agrave;n c&aacute;ch để ch&uacute;ng ta thể hiện t&igrave;nh y&ecirc;u v&agrave; thể hiện sự gi&uacute;p đỡ lẫn nhau. Anh ấy sẽ ở b&ecirc;n bạn khi buồn, lắng nghe v&agrave; gi&uacute;p đỡ bạn khi cần. Anh ấy sẽ kh&ocirc;ng ph&aacute;n x&eacute;t, buồn b&atilde; hay thất vọng mỗi khi bạn gặp thất bại. Ngược lại, anh ấy sẽ động vi&ecirc;n bạn vượt qua kh&oacute; khăn. Đ&oacute; l&agrave; một trong những dấu hiệu nhận biết anh ấy y&ecirc;u bạn thật l&ograve;ng.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">8. Anh ấy l&agrave;m bạn cười</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">C&oacute; một điều chắc chắn rằng, khi đang y&ecirc;u, anh ấy sẽ kh&ocirc;ng muốn bạn đau khổ hay kh&oacute;c l&oacute;c. Anh ấy chỉ muốn mang nụ cười cho bạn. H&atilde;y tr&acirc;n trọng một ch&agrave;ng trai lu&ocirc;n lu&ocirc;n muốn bạn cười n&oacute;i vui vẻ v&agrave; lu&ocirc;n h&agrave;i hước, gi&uacute;p bạn giải tỏa căng thẳng mỗi khi c&oacute; chuyện g&igrave; đ&oacute;. Ngay cả khi gặp kh&oacute; khăn, anh ấy cũng muốn bạn cười chứ kh&ocirc;ng được kh&oacute;c đ&acirc;u nh&eacute;.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">9. Anh ấy lu&ocirc;n lu&ocirc;n lắng nghe bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">L&agrave;m sao để biết anh ấy y&ecirc;u bạn thật l&ograve;ng? Đ&oacute; l&agrave; lắng nghe bạn n&oacute;i. Anh ấy tin tưởng ở bạn v&agrave; nghe bạn đưa ra lời khuy&ecirc;n mỗi khi gặp kh&oacute; khăn. Đ&ocirc;i khi ch&agrave;ng trai đ&oacute; kh&ocirc;ng n&oacute;i ra, nhưng nếu bạn để &yacute;, anh ấy sẽ rất vui nếu bạn đưa ra những &yacute; kiến, khuy&ecirc;n anh ấy n&ecirc;n thế n&agrave;y, thế kia. Một ng&agrave;y anh ấy chợt buồn v&igrave; c&ocirc;ng việc v&agrave; chỉ muốn ở b&ecirc;n bạn, t&acirc;m sự với bạn. H&atilde;y tr&acirc;n trọng những khoảnh khắc đ&oacute; bởi đ&oacute; mới l&agrave; cuộc sống, l&agrave; t&igrave;nh cảm. V&agrave; ngược lại, anh ấy cũng sẽ l&agrave; chỗ dựa tinh thần mỗi khi bạn gặp kh&oacute; khăn.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">10. Anh ấy quan t&acirc;m đến gia đ&igrave;nh bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Kh&ocirc;ng phải ngẫu nhi&ecirc;n anh ấy th&iacute;ch đến nh&agrave; bạn, tr&ograve; chuyện với c&aacute;c bậc phụ huynh đ&acirc;u nh&eacute;. Anh ấy th&iacute;ch đến nh&agrave; v&agrave; đ&aacute; b&oacute;ng c&ugrave;ng cậu em trai, hay gi&uacute;p đỡ cha mẹ bạn l&agrave;m những việc cỏn con trong nh&agrave;. Anh ấy hỏi thăm v&agrave; c&ugrave;ng bạn lo toan cho bố mẹ. Tất cả để chứng minh rằng anh ấy y&ecirc;u bạn thật l&ograve;ng v&agrave; muốn c&oacute; bạn trong đời m&agrave; th&ocirc;i.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">11. Anh ấy kh&oacute;c trước mặt bạn.</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Đ&agrave;n &ocirc;ng thường kh&ocirc;ng dễ d&agrave;ng cho người kh&aacute;c thấy m&igrave;nh yếu đuối, nhất l&agrave; đối với phụ nữ. Ph&aacute;i mạnh lu&ocirc;n muốn tỏ ra m&igrave;nh cứng cỏi, mạnh mẽ. Nhưng nếu ch&agrave;ng c&oacute; thể kh&oacute;c trước mặt bạn, chứng tỏ chỉ bạn mới c&oacute; thể chạm đến nơi-yếu-đuối-nhất của ch&agrave;ng. Ch&agrave;ng sẵn s&agrave;ng mở l&ograve;ng m&igrave;nh, chia sẻ điểm yếu của m&igrave;nh cho bạn v&igrave; ch&agrave;ng tin rằng bạn sẽ hiểu ch&agrave;ng c&ograve;n hơn ch&iacute;nh bản th&acirc;n ch&agrave;ng.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">12. Anh ấy kh&ocirc;ng nu&ocirc;ng chiều bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Ch&agrave;ng sẽ thẳng thắn n&oacute;i cho bạn biết điều đ&uacute;ng sai. Ch&agrave;ng sẵn s&agrave;ng ngồi nghe bạn than v&atilde;n những chuyện kh&ocirc;ng đ&acirc;u, ngồi im lặng nghe bạn tr&uacute;t điều ấm ức, bờ vai ch&agrave;ng sẵn s&agrave;ng cho bạn mượn nếu bạn muốn kh&oacute;c. Sau đ&oacute; ch&agrave;ng sẽ ph&acirc;n t&iacute;ch cho bạn thấy đ&uacute;ng sai, bạn l&agrave;m vậy c&oacute; đ&aacute;ng hay kh&ocirc;ng.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">13. Thường xuy&ecirc;n đề cập đến chuyện đưa bạn đến gặp gia đ&igrave;nh</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Ch&agrave;ng cũng ngỏ &yacute; muốn đến &ldquo;ra mắt&rdquo; người nh&agrave; bạn. Đi&ecirc;u n&agrave;y chứng tỏ ch&agrave;ng rất nghi&ecirc;m t&uacute;c trong mối quan hệ của hai người v&agrave; muốn c&ugrave;ng bạn t&iacute;nh đến chuyện tương lai.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">14. T&ocirc;n trọng thời gian ri&ecirc;ng tư của bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Ch&agrave;ng kh&ocirc;ng muốn bạn l&agrave;m một con b&uacute;p b&ecirc; lu&ocirc;n quấn qu&yacute;t b&ecirc;n ch&agrave;ng. Ch&agrave;ng y&ecirc;u bạn n&ecirc;n lu&ocirc;n nghĩ đến bạn sẽ thế n&agrave;o trong tương lai, bạn cần g&igrave;. Bạn cần bạn b&egrave; chia sẽ những l&uacute;c ch&agrave;ng kh&ocirc;ng thể l&agrave;m điều đ&oacute; hay những l&uacute;c bạn giận ch&agrave;ng.</p>\r\n<table class=\"picture\" style=\"margin: 0px; padding: 0px; border-collapse: collapse; border-spacing: 0px; width: 640px; color: #222222; font-family: Verdana, Geneva, sans-serif;\" align=\"center\">\r\n<tbody style=\"margin: 0px; padding: 0px;\">\r\n<tr style=\"margin: 0px; padding: 0px;\">\r\n<td class=\"pic\" style=\"margin: 0px; padding: 10px;\"><img class=\"alignnone size-full wp-image-177180 cool-image-share\" style=\"margin: 0px 0px 20px; padding: 0px; border: 0px; transition: all 1s ease 0s; max-width: 100%; height: auto;\" title=\"20 dấu hiệu ch&agrave;ng y&ecirc;u th&iacute;ch bạn thật l&ograve;ng hơn ch&iacute;nh bản th&acirc;n m&igrave;nh\" src=\"https://giadinh.blog/wp-content/uploads/2018/03/20-dau-hieu-chang-yeu-thich-ban-that-long-hon-chinh-ban-than-minh-20180322-03-2018-131749.jpg\" alt=\"20 dấu hiệu ch&agrave;ng y&ecirc;u th&iacute;ch bạn thật l&ograve;ng hơn ch&iacute;nh bản th&acirc;n m&igrave;nh\" width=\"500\" height=\"355\" /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">&nbsp;</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">15. D&ugrave; bận đến đ&acirc;u ch&agrave;ng cũng d&agrave;nh thời gian cho bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Khi y&ecirc;u người ta thường muốn b&ecirc;n người m&igrave;nh y&ecirc;u, muốn chia sẻ với nhau tất cả mọi thứ trong cuộc sống hằng ng&agrave;y. Ch&agrave;ng kh&ocirc;ng phiền khi bạn cứ huy&ecirc;n thuy&ecirc;n về chuyện vui n&agrave;o đ&oacute;, ch&agrave;ng muốn thấy bạn cười, tr&agrave;n đầy sức sống như thế. Ch&agrave;ng muốn m&igrave;nh l&agrave; người đầu ti&ecirc;n bạn t&igrave;m đến khi c&oacute; chuyện kh&ocirc;ng vui. Điều đ&oacute; chứng tỏ ch&agrave;ng l&agrave; chỗ dựa vững chắc cho bạn.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">16. Kh&ocirc;ng khi n&agrave;o khen ngợi bạn</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Ch&agrave;ng kh&ocirc;ng lu&ocirc;n miệng khen bạn xinh đẹp nhưng trong l&ograve;ng ch&agrave;ng bạn l&agrave; người tuyệt nhất. Ch&agrave;ng sẽ tức giận một c&aacute;ch cực kỳ trẻ con nếu bạn thu h&uacute;t &aacute;nh nh&igrave;n của qu&aacute; nhiều người v&igrave; ch&agrave;ng chỉ muốn giấu những điều đẹp nhất của bạn cho ri&ecirc;ng m&igrave;nh.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">17. N&oacute;i &iacute;t, l&agrave;m nhiều</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Ch&agrave;ng trai y&ecirc;u bạn sẽ kh&ocirc;ng thường xuy&ecirc;n &ldquo;dẻo miệng&rdquo; n&oacute;i y&ecirc;u bạn, ch&agrave;ng chỉ đột nhi&ecirc;n &ocirc;m bạn thật chặt. Khi ch&agrave;ng cảm thấy bản th&acirc;n m&igrave;nh y&ecirc;u bạn thật nhiều, mọi lời n&oacute;i trở n&ecirc;n s&aacute;o rỗng. Ch&agrave;ng chỉ muốn bạn cảm nhận tr&aacute;i tim ch&agrave;ng đang loạn nhịp v&igrave; bạn, muốn bạn cảm nhận sự m&atilde;nh liệt của ch&agrave;ng.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">18. Im lặng giải quyết vấn đề</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Ch&agrave;ng chỉ im lặng khi bạn nổi c&aacute;u. Ch&agrave;ng biết nếu tiếp tục c&atilde;i nhau sẽ ảnh hưởng đến mối quan hệ của hai người v&agrave; ch&agrave;ng gh&eacute;t điều đ&oacute;. Sau khi bạn b&igrave;nh tĩnh lại, ch&agrave;ng sẽ vờ như kh&ocirc;ng c&oacute; g&igrave; m&agrave; đưa bạn đi đ&acirc;u đ&oacute; hay ăn m&oacute;n g&igrave; đ&oacute; v&agrave; kh&eacute;o l&eacute;o giải th&iacute;ch cho bạn hiểu m&acirc;u thuẫn giữa hai người.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">19. Kh&ocirc;ng khoe khoang</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Nếu anh ấy kh&ocirc;ng bao giờ kể lể tất cả những g&igrave; tốt đẹp m&agrave; anh ấy l&agrave;m cho bạn, điều đ&oacute; c&oacute; nghĩa l&agrave; anh ấy đ&atilde; l&agrave;m điều đ&oacute; một c&aacute;ch v&ocirc; tư.</p>\r\n<h3 style=\"margin: 0px 0px 20px; padding: 0px; font-size: 20px; font-weight: normal; color: #222222; font-family: Verdana, Geneva, sans-serif;\">20. Nắm tay</h3>\r\n<p style=\"margin: 0px 0px 20px; padding: 0px; color: #222222; font-family: Verdana, Geneva, sans-serif;\">Người đ&agrave;n &ocirc;ng tự tin với mối quan hệ của họ sẽ kh&ocirc;ng ngại l&agrave;m an l&ograve;ng người phụ nữ b&ecirc;n cạnh họ.</p>', 'Yêu không khó', 4, 60, '2018-11-12 12:49:12', 'NQLj1bbnFgj5CGU8hdqnlTcrC4H7JVOLh8LF5dSp.jpeg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `icon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `gender`
--

INSERT INTO `gender` (`id`, `gender`, `icon`) VALUES
(1, 'Male', '<i class=\"fas fa-male\"></i>'),
(4, 'Female', '<i class=\"fas fa-female\"></i>'),
(6, 'Other', '<i class=\"fas fa-male\"></i> <i class=\"fas fa-heart\"></i> <i class=\"fas fa-female\"></i>');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hair_color`
--

CREATE TABLE `hair_color` (
  `id` int(11) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hair_color`
--

INSERT INTO `hair_color` (`id`, `color`) VALUES
(0, 'Please input hair color'),
(1, 'Red'),
(2, 'Green'),
(3, 'Yellow');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hair_length`
--

CREATE TABLE `hair_length` (
  `id` int(11) NOT NULL,
  `length` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hair_length`
--

INSERT INTO `hair_length` (`id`, `length`) VALUES
(0, 'Please input your hair length'),
(1, 'Long'),
(2, 'Short');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hair_style`
--

CREATE TABLE `hair_style` (
  `id` int(11) NOT NULL,
  `style` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hair_style`
--

INSERT INTO `hair_style` (`id`, `style`) VALUES
(0, 'Please input your hair style'),
(1, 'Curly');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `have_children`
--

CREATE TABLE `have_children` (
  `id` int(11) NOT NULL,
  `children` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `have_children`
--

INSERT INTO `have_children` (`id`, `children`) VALUES
(0, 'Do you have children?'),
(1, 'No Children'),
(2, 'Anything');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `house_type`
--

CREATE TABLE `house_type` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `house_type`
--

INSERT INTO `house_type` (`id`, `type`) VALUES
(0, 'What type of your house?'),
(1, 'Department'),
(2, 'Villa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_status`
--

CREATE TABLE `job_status` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `job_status`
--

INSERT INTO `job_status` (`id`, `status`) VALUES
(0, 'Do you have job?'),
(1, 'No Job'),
(2, 'Have Job');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `language`
--

CREATE TABLE `language` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `language`
--

INSERT INTO `language` (`id`, `language`) VALUES
(0, 'Your language'),
(1, 'Vietnamese'),
(2, 'English');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `live_with`
--

CREATE TABLE `live_with` (
  `id` int(11) NOT NULL,
  `livewith` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `live_with`
--

INSERT INTO `live_with` (`id`, `livewith`) VALUES
(0, 'You live with?'),
(1, 'Parent'),
(2, 'Alone');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `fromuser` int(11) NOT NULL,
  `touser` int(11) NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `message`
--

INSERT INTO `message` (`id`, `fromuser`, `touser`, `content`, `time`) VALUES
(1, 3, 4, 'alo quân ơi', '0000-00-00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `national`
--

CREATE TABLE `national` (
  `id` int(11) NOT NULL,
  `national` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `national`
--

INSERT INTO `national` (`id`, `national`) VALUES
(0, 'Your national'),
(1, 'Vietnamese'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `religion`
--

CREATE TABLE `religion` (
  `id` int(11) NOT NULL,
  `religion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `religion`
--

INSERT INTO `religion` (`id`, `religion`) VALUES
(0, 'Your religion'),
(1, 'Budha');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `smoking`
--

CREATE TABLE `smoking` (
  `id` int(11) NOT NULL,
  `smoke` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `smoking`
--

INSERT INTO `smoking` (`id`, `smoke`) VALUES
(0, 'Do you smoke?'),
(1, 'Usually'),
(2, 'Never');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Fullname` varchar(255) NOT NULL,
  `Avatar` varchar(255) DEFAULT 'default.jpg',
  `email` text NOT NULL,
  `phone_number` text NOT NULL,
  `Facebook` varchar(255) NOT NULL,
  `Gender` int(11) DEFAULT NULL,
  `City` int(11) DEFAULT NULL,
  `Birthdate` date DEFAULT NULL,
  `Hair_color` int(11) DEFAULT '0',
  `Hair_length` int(11) DEFAULT '0',
  `Hair_style` int(11) DEFAULT '0',
  `Eye_color` int(11) DEFAULT '0',
  `Height` int(11) DEFAULT '0',
  `Weight` int(11) DEFAULT '0',
  `Body` int(11) DEFAULT '0',
  `Drinking` int(11) DEFAULT '0',
  `Smoking` int(11) DEFAULT '0',
  `Job_status` int(11) DEFAULT '0',
  `Home_type` int(11) DEFAULT '0',
  `Live_with` int(11) DEFAULT '0',
  `Have_children` int(11) DEFAULT '0',
  `National` int(11) DEFAULT '0',
  `Educational_level` int(11) DEFAULT '0',
  `Language` int(11) DEFAULT '0',
  `Religion` int(11) DEFAULT '0',
  `Constellation` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `Fullname`, `Avatar`, `email`, `phone_number`, `Facebook`, `Gender`, `City`, `Birthdate`, `Hair_color`, `Hair_length`, `Hair_style`, `Eye_color`, `Height`, `Weight`, `Body`, `Drinking`, `Smoking`, `Job_status`, `Home_type`, `Live_with`, `Have_children`, `National`, `Educational_level`, `Language`, `Religion`, `Constellation`) VALUES
(3, 'tandam', '123456', 'Tân Đàm', '1.jpg', '', '', '', 1, 1, '1997-01-31', 0, 2, 1, 1, 160, 61, 1, 2, 2, 2, 2, 1, 1, 1, 2, 1, 1, 1),
(4, 'nhatquan', '123456', 'Nhật Quân', 'avatar-1543841247.jpg', '', '', '', 4, 1, '1997-10-10', 1, 2, 1, 1, 150, 65, 2, 2, 2, 2, 1, 2, 2, 1, 2, 2, 1, 2),
(5, 'aaaaaa', '123456', 'a\r\n', '1.jpg', '', '', '', 4, 2, '2000-10-10', 2, 2, 1, 1, 170, 71, 3, 2, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2),
(6, 'bbbbbb', '123456', 'b', '1.jpg', 'abc@gmail.com', '123456778', 'fb.com\\abc', 4, 2, '1990-10-10', 2, 1, 1, 3, 150, 44, 2, 1, 2, 2, 1, 2, 1, 2, 1, 1, 1, 3),
(7, 'cccccc', '123456', 'c', '1.jpg', 'abc@gmail.com', '124561111', 'fb.com\\myfb', 1, 1, '1994-10-10', 1, 2, 1, 3, 180, 55, 2, 2, 1, 2, 1, 2, 1, 1, 1, 1, 1, 3),
(8, 'vuphan', '123456', 'Vu Phan', '1.jpg', 'vuphan@gmail.com', '012321313', 'fb.com/VuPhan', 1, 1, '1997-12-12', 1, 2, 1, 3, 150, 66, 2, 1, 1, 2, 1, 2, 1, 1, 2, 1, 1, 1),
(10, 'test02', '123123', 'Test 02', 'avatar-1543856600.jpg', 'test02@gmail.com', '0122312312', 'fb.com/test02', 1, 1, '2012-12-12', 2, 1, 1, 1, 150, 50, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_search`
--

CREATE TABLE `user_search` (
  `id` int(11) NOT NULL,
  `Gender` int(11) DEFAULT NULL,
  `City` int(11) DEFAULT NULL,
  `Hair_color` int(11) DEFAULT NULL,
  `Hair_length` int(11) DEFAULT NULL,
  `Hair_style` int(11) DEFAULT NULL,
  `Eye_color` int(11) DEFAULT NULL,
  `Body` int(11) DEFAULT NULL,
  `Drinking` int(11) DEFAULT NULL,
  `Smoking` int(11) DEFAULT NULL,
  `Job_status` int(11) DEFAULT NULL,
  `Home_type` int(11) DEFAULT NULL,
  `Live_with` int(11) DEFAULT NULL,
  `Have_children` int(11) DEFAULT NULL,
  `National` int(11) DEFAULT NULL,
  `Educational_level` int(11) DEFAULT NULL,
  `Language` int(11) DEFAULT NULL,
  `Religion` int(11) DEFAULT NULL,
  `Constellation` int(11) DEFAULT NULL,
  `fromage` int(11) NOT NULL,
  `toage` int(11) NOT NULL,
  `fromheight` int(11) NOT NULL,
  `toheight` int(11) NOT NULL,
  `fromweight` int(11) NOT NULL,
  `toweight` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user_search`
--

INSERT INTO `user_search` (`id`, `Gender`, `City`, `Hair_color`, `Hair_length`, `Hair_style`, `Eye_color`, `Body`, `Drinking`, `Smoking`, `Job_status`, `Home_type`, `Live_with`, `Have_children`, `National`, `Educational_level`, `Language`, `Religion`, `Constellation`, `fromage`, `toage`, `fromheight`, `toheight`, `fromweight`, `toweight`) VALUES
(3, 1, 1, 2, 2, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 30, 150, 180, 50, 70),
(4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 30, 150, 180, 50, 70);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_role` (`id_role`);

--
-- Chỉ mục cho bảng `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Chỉ mục cho bảng `body`
--
ALTER TABLE `body`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment_dating_places`
--
ALTER TABLE `comment_dating_places`
  ADD PRIMARY KEY (`comment_place_id`);

--
-- Chỉ mục cho bảng `comment_dating_places_rep`
--
ALTER TABLE `comment_dating_places_rep`
  ADD PRIMARY KEY (`rep_place_id`);

--
-- Chỉ mục cho bảng `constellation`
--
ALTER TABLE `constellation`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `datingplaces`
--
ALTER TABLE `datingplaces`
  ADD PRIMARY KEY (`id_place`);

--
-- Chỉ mục cho bảng `dating_place_picture`
--
ALTER TABLE `dating_place_picture`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_picture` (`id_place`);

--
-- Chỉ mục cho bảng `dating_place_type`
--
ALTER TABLE `dating_place_type`
  ADD PRIMARY KEY (`id_type`);

--
-- Chỉ mục cho bảng `drinking`
--
ALTER TABLE `drinking`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `educational_level`
--
ALTER TABLE `educational_level`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `eye_color`
--
ALTER TABLE `eye_color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `flirtingmethods`
--
ALTER TABLE `flirtingmethods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flirting_gender` (`id_gender`);

--
-- Chỉ mục cho bảng `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hair_color`
--
ALTER TABLE `hair_color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hair_length`
--
ALTER TABLE `hair_length`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `hair_style`
--
ALTER TABLE `hair_style`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `have_children`
--
ALTER TABLE `have_children`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `house_type`
--
ALTER TABLE `house_type`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `job_status`
--
ALTER TABLE `job_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `live_with`
--
ALTER TABLE `live_with`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `national`
--
ALTER TABLE `national`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `smoking`
--
ALTER TABLE `smoking`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_haircolor` (`Hair_color`),
  ADD KEY `user_hairlenght` (`Hair_length`),
  ADD KEY `user_hairstyle` (`Hair_style`),
  ADD KEY `user_eyecolor` (`Eye_color`),
  ADD KEY `user_body` (`Body`),
  ADD KEY `user_drink` (`Drinking`),
  ADD KEY `user_smoke` (`Smoking`),
  ADD KEY `user_jobstatus` (`Job_status`),
  ADD KEY `user_housetype` (`Home_type`),
  ADD KEY `user_livewith` (`Live_with`),
  ADD KEY `user_havechildren` (`Have_children`),
  ADD KEY `user_national` (`National`),
  ADD KEY `user_educational` (`Educational_level`),
  ADD KEY `user_language` (`Language`),
  ADD KEY `user_religion` (`Religion`),
  ADD KEY `user_constellation` (`Constellation`),
  ADD KEY `user_city` (`City`),
  ADD KEY `user_gender` (`Gender`);

--
-- Chỉ mục cho bảng `user_search`
--
ALTER TABLE `user_search`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_haircolor` (`Hair_color`),
  ADD KEY `user_hairlenght` (`Hair_length`),
  ADD KEY `user_hairstyle` (`Hair_style`),
  ADD KEY `user_eyecolor` (`Eye_color`),
  ADD KEY `user_body` (`Body`),
  ADD KEY `user_drink` (`Drinking`),
  ADD KEY `user_smoke` (`Smoking`),
  ADD KEY `user_jobstatus` (`Job_status`),
  ADD KEY `user_housetype` (`Home_type`),
  ADD KEY `user_livewith` (`Live_with`),
  ADD KEY `user_havechildren` (`Have_children`),
  ADD KEY `user_national` (`National`),
  ADD KEY `user_educational` (`Educational_level`),
  ADD KEY `user_language` (`Language`),
  ADD KEY `user_religion` (`Religion`),
  ADD KEY `user_constellation` (`Constellation`),
  ADD KEY `user_city` (`City`),
  ADD KEY `user_gender` (`Gender`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `body`
--
ALTER TABLE `body`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `comment_dating_places`
--
ALTER TABLE `comment_dating_places`
  MODIFY `comment_place_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `comment_dating_places_rep`
--
ALTER TABLE `comment_dating_places_rep`
  MODIFY `rep_place_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `constellation`
--
ALTER TABLE `constellation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `datingplaces`
--
ALTER TABLE `datingplaces`
  MODIFY `id_place` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `dating_place_picture`
--
ALTER TABLE `dating_place_picture`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `dating_place_type`
--
ALTER TABLE `dating_place_type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `drinking`
--
ALTER TABLE `drinking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `educational_level`
--
ALTER TABLE `educational_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `eye_color`
--
ALTER TABLE `eye_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `flirtingmethods`
--
ALTER TABLE `flirtingmethods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `hair_color`
--
ALTER TABLE `hair_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `hair_length`
--
ALTER TABLE `hair_length`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `hair_style`
--
ALTER TABLE `hair_style`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `have_children`
--
ALTER TABLE `have_children`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `house_type`
--
ALTER TABLE `house_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `job_status`
--
ALTER TABLE `job_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `language`
--
ALTER TABLE `language`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `live_with`
--
ALTER TABLE `live_with`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `national`
--
ALTER TABLE `national`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `religion`
--
ALTER TABLE `religion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `smoking`
--
ALTER TABLE `smoking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `administrator`
--
ALTER TABLE `administrator`
  ADD CONSTRAINT `administrator_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `admin_role` (`id_role`);

--
-- Các ràng buộc cho bảng `dating_place_picture`
--
ALTER TABLE `dating_place_picture`
  ADD CONSTRAINT `place_picture` FOREIGN KEY (`id_place`) REFERENCES `datingplaces` (`id_place`);

--
-- Các ràng buộc cho bảng `flirtingmethods`
--
ALTER TABLE `flirtingmethods`
  ADD CONSTRAINT `flirting_gender` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `user_body` FOREIGN KEY (`Body`) REFERENCES `body` (`id`),
  ADD CONSTRAINT `user_city` FOREIGN KEY (`City`) REFERENCES `city` (`id`),
  ADD CONSTRAINT `user_constellation` FOREIGN KEY (`Constellation`) REFERENCES `constellation` (`id`),
  ADD CONSTRAINT `user_drink` FOREIGN KEY (`Drinking`) REFERENCES `drinking` (`id`),
  ADD CONSTRAINT `user_educational` FOREIGN KEY (`Educational_level`) REFERENCES `educational_level` (`id`),
  ADD CONSTRAINT `user_eyecolor` FOREIGN KEY (`Eye_color`) REFERENCES `eye_color` (`id`),
  ADD CONSTRAINT `user_gender` FOREIGN KEY (`Gender`) REFERENCES `gender` (`id`),
  ADD CONSTRAINT `user_haircolor` FOREIGN KEY (`Hair_color`) REFERENCES `hair_color` (`id`),
  ADD CONSTRAINT `user_hairlenght` FOREIGN KEY (`Hair_length`) REFERENCES `hair_length` (`id`),
  ADD CONSTRAINT `user_hairstyle` FOREIGN KEY (`Hair_style`) REFERENCES `hair_style` (`id`),
  ADD CONSTRAINT `user_havechildren` FOREIGN KEY (`Have_children`) REFERENCES `have_children` (`id`),
  ADD CONSTRAINT `user_housetype` FOREIGN KEY (`Home_type`) REFERENCES `house_type` (`id`),
  ADD CONSTRAINT `user_jobstatus` FOREIGN KEY (`Job_status`) REFERENCES `job_status` (`id`),
  ADD CONSTRAINT `user_language` FOREIGN KEY (`Language`) REFERENCES `language` (`id`),
  ADD CONSTRAINT `user_livewith` FOREIGN KEY (`Live_with`) REFERENCES `live_with` (`id`),
  ADD CONSTRAINT `user_national` FOREIGN KEY (`National`) REFERENCES `national` (`id`),
  ADD CONSTRAINT `user_religion` FOREIGN KEY (`Religion`) REFERENCES `religion` (`id`),
  ADD CONSTRAINT `user_smoke` FOREIGN KEY (`Smoking`) REFERENCES `smoking` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
