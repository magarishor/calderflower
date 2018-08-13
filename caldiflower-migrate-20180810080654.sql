# WordPress MySQL database migration
#
# Generated: Friday 10. August 2018 08:06 UTC
# Hostname: localhost
# Database: `caldiflower`
# URL: //dev7.naphix.com/calderflower
# Path: E:\\xampp\\htdocs\\calderflower
# Tables: wp_commentmeta, wp_comments, wp_gf_draft_submissions, wp_gf_entry, wp_gf_entry_meta, wp_gf_entry_notes, wp_gf_form, wp_gf_form_meta, wp_gf_form_view, wp_links, wp_options, wp_postmeta, wp_posts, wp_rg_form, wp_rg_form_meta, wp_rg_form_view, wp_rg_incomplete_submissions, wp_rg_lead, wp_rg_lead_detail, wp_rg_lead_detail_long, wp_rg_lead_meta, wp_rg_lead_notes, wp_term_relationships, wp_term_taxonomy, wp_termmeta, wp_terms, wp_usermeta, wp_users
# Table Prefix: wp_
# Post Types: revision, acf-field, acf-field-group, attachment, customize_changeset, nav_menu_item, page, post, project, slider, team
# Protocol: http
# Multisite: false
# Subsite Export: false
# --------------------------------------------------------

/*!40101 SET NAMES utf8 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



#
# Delete any existing table `wp_commentmeta`
#

DROP TABLE IF EXISTS `wp_commentmeta`;


#
# Table structure of table `wp_commentmeta`
#

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_commentmeta`
#

#
# End of data contents of table `wp_commentmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_comments`
#

DROP TABLE IF EXISTS `wp_comments`;


#
# Table structure of table `wp_comments`
#

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_comments`
#
INSERT INTO `wp_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2018-08-06 04:29:12', '2018-08-06 04:29:12', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href="https://gravatar.com">Gravatar</a>.', 0, '1', '', '', 0, 0) ;

#
# End of data contents of table `wp_comments`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_draft_submissions`
#

DROP TABLE IF EXISTS `wp_gf_draft_submissions`;


#
# Table structure of table `wp_gf_draft_submissions`
#

CREATE TABLE `wp_gf_draft_submissions` (
  `uuid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_gf_draft_submissions`
#

#
# End of data contents of table `wp_gf_draft_submissions`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_entry`
#

DROP TABLE IF EXISTS `wp_gf_entry`;


#
# Table structure of table `wp_gf_entry`
#

CREATE TABLE `wp_gf_entry` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_agent` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_fulfilled` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` tinyint(1) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `form_id_status` (`form_id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_gf_entry`
#

#
# End of data contents of table `wp_gf_entry`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_entry_meta`
#

DROP TABLE IF EXISTS `wp_gf_entry_meta`;


#
# Table structure of table `wp_gf_entry_meta`
#

CREATE TABLE `wp_gf_entry_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `entry_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `entry_id` (`entry_id`),
  KEY `meta_value` (`meta_value`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_gf_entry_meta`
#

#
# End of data contents of table `wp_gf_entry_meta`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_entry_notes`
#

DROP TABLE IF EXISTS `wp_gf_entry_notes`;


#
# Table structure of table `wp_gf_entry_notes`
#

CREATE TABLE `wp_gf_entry_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `user_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `note_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `entry_user_key` (`entry_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_gf_entry_notes`
#

#
# End of data contents of table `wp_gf_entry_notes`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_form`
#

DROP TABLE IF EXISTS `wp_gf_form`;


#
# Table structure of table `wp_gf_form`
#

CREATE TABLE `wp_gf_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_gf_form`
#
INSERT INTO `wp_gf_form` ( `id`, `title`, `date_created`, `date_updated`, `is_active`, `is_trash`) VALUES
(1, 'Leave us an enquiry', '2018-08-08 02:17:28', NULL, 1, 0) ;

#
# End of data contents of table `wp_gf_form`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_form_meta`
#

DROP TABLE IF EXISTS `wp_gf_form_meta`;


#
# Table structure of table `wp_gf_form_meta`
#

CREATE TABLE `wp_gf_form_meta` (
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext COLLATE utf8mb4_unicode_ci,
  `entries_grid_meta` longtext COLLATE utf8mb4_unicode_ci,
  `confirmations` longtext COLLATE utf8mb4_unicode_ci,
  `notifications` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_gf_form_meta`
#
INSERT INTO `wp_gf_form_meta` ( `form_id`, `display_meta`, `entries_grid_meta`, `confirmations`, `notifications`) VALUES
(1, '{"title":"Leave us an enquiry","description":"Footer Enquiry form","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Submit","imageUrl":""},"fields":[{"type":"text","id":1,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"First Name","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"text","id":2,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"Last Name","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"email","id":3,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"Email address","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","productField":"","emailConfirmEnabled":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"phone","id":4,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"phoneFormat":"international","formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"Phone","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","form_id":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"textarea","id":5,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"Message","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","productField":"","form_id":"","useRichTextEditor":false,"multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"pageNumber":1,"displayOnly":""}],"version":"2.3.3","id":1,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null}', NULL, '{"5b6a52b8ac34e":{"id":"5b6a52b8ac34e","name":"Default Confirmation","isDefault":true,"type":"message","message":"Thanks for contacting us! We will get in touch with you shortly.","url":"","pageId":"","queryString":""}}', '{"5b6a52b89deb0":{"id":"5b6a52b89deb0","to":"{admin_email}","name":"Admin Notification","event":"form_submission","toType":"email","subject":"New submission from {form_title}","message":"{all_fields}"}}') ;

#
# End of data contents of table `wp_gf_form_meta`
# --------------------------------------------------------



#
# Delete any existing table `wp_gf_form_view`
#

DROP TABLE IF EXISTS `wp_gf_form_view`;


#
# Table structure of table `wp_gf_form_view`
#

CREATE TABLE `wp_gf_form_view` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `date_created` (`date_created`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_gf_form_view`
#
INSERT INTO `wp_gf_form_view` ( `id`, `form_id`, `date_created`, `ip`, `count`) VALUES
(1, 1, '2018-08-09 08:31:13', '', 3) ;

#
# End of data contents of table `wp_gf_form_view`
# --------------------------------------------------------



#
# Delete any existing table `wp_links`
#

DROP TABLE IF EXISTS `wp_links`;


#
# Table structure of table `wp_links`
#

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_links`
#

#
# End of data contents of table `wp_links`
# --------------------------------------------------------



#
# Delete any existing table `wp_options`
#

DROP TABLE IF EXISTS `wp_options`;


#
# Table structure of table `wp_options`
#

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=843 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_options`
#
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://dev7.naphix.com/calderflower', 'yes'),
(2, 'home', 'http://dev7.naphix.com/calderflower', 'yes'),
(3, 'blogname', 'Calder Flower', 'yes'),
(4, 'blogdescription', 'Creating living spaces', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'ishor@naphix.com.au', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:121:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:34:"slider/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"slider/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"slider/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"slider/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"slider/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:40:"slider/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:23:"slider/([^/]+)/embed/?$";s:39:"index.php?slider=$matches[1]&embed=true";s:27:"slider/([^/]+)/trackback/?$";s:33:"index.php?slider=$matches[1]&tb=1";s:35:"slider/([^/]+)/page/?([0-9]{1,})/?$";s:46:"index.php?slider=$matches[1]&paged=$matches[2]";s:42:"slider/([^/]+)/comment-page-([0-9]{1,})/?$";s:46:"index.php?slider=$matches[1]&cpage=$matches[2]";s:31:"slider/([^/]+)(?:/([0-9]+))?/?$";s:45:"index.php?slider=$matches[1]&page=$matches[2]";s:23:"slider/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:33:"slider/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:53:"slider/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"slider/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"slider/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:29:"slider/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"project/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"project/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"project/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"project/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"project/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"project/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:24:"project/([^/]+)/embed/?$";s:40:"index.php?project=$matches[1]&embed=true";s:28:"project/([^/]+)/trackback/?$";s:34:"index.php?project=$matches[1]&tb=1";s:36:"project/([^/]+)/page/?([0-9]{1,})/?$";s:47:"index.php?project=$matches[1]&paged=$matches[2]";s:43:"project/([^/]+)/comment-page-([0-9]{1,})/?$";s:47:"index.php?project=$matches[1]&cpage=$matches[2]";s:32:"project/([^/]+)(?:/([0-9]+))?/?$";s:46:"index.php?project=$matches[1]&page=$matches[2]";s:24:"project/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"project/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"project/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"project/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"project/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"project/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:27:"comment-page-([0-9]{1,})/?$";s:38:"index.php?&page_id=9&cpage=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:4:{i:0;s:29:"gravityforms/gravityforms.php";i:1;s:34:"advanced-custom-fields-pro/acf.php";i:2;s:33:"instagram-feed/instagram-feed.php";i:3;s:31:"wp-migrate-db/wp-migrate-db.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', '', 'no'),
(40, 'template', 'calderflower', 'yes'),
(41, 'stylesheet', 'calderflower', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'page', 'yes'),
(54, 'tag_base', '', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:"_multiwidget";i:1;}', 'yes'),
(81, 'uninstall_plugins', 'a:1:{s:33:"instagram-feed/instagram-feed.php";s:22:"sb_instagram_uninstall";}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '9', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'wp_page_for_privacy_policy', '3', 'yes'),
(92, 'show_comments_cookies_opt_in', '0', 'yes'),
(93, 'initial_db_version', '38590', 'yes'),
(94, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:73:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:11:"edit_blocks";b:1;s:18:"edit_others_blocks";b:1;s:14:"publish_blocks";b:1;s:19:"read_private_blocks";b:1;s:11:"read_blocks";b:1;s:13:"delete_blocks";b:1;s:21:"delete_private_blocks";b:1;s:23:"delete_published_blocks";b:1;s:20:"delete_others_blocks";b:1;s:19:"edit_private_blocks";b:1;s:21:"edit_published_blocks";b:1;s:13:"create_blocks";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:46:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:11:"edit_blocks";b:1;s:18:"edit_others_blocks";b:1;s:14:"publish_blocks";b:1;s:19:"read_private_blocks";b:1;s:11:"read_blocks";b:1;s:13:"delete_blocks";b:1;s:21:"delete_private_blocks";b:1;s:23:"delete_published_blocks";b:1;s:20:"delete_others_blocks";b:1;s:19:"edit_private_blocks";b:1;s:21:"edit_published_blocks";b:1;s:13:"create_blocks";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:17:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;s:11:"edit_blocks";b:1;s:14:"publish_blocks";b:1;s:11:"read_blocks";b:1;s:13:"delete_blocks";b:1;s:23:"delete_published_blocks";b:1;s:21:"edit_published_blocks";b:1;s:13:"create_blocks";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:6:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:11:"read_blocks";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(95, 'fresh_site', '0', 'yes'),
(96, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(100, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `wp_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(101, 'sidebars_widgets', 'a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:13:"array_version";i:3;}', 'yes'),
(102, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(105, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(106, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(107, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(108, 'nonce_key', '$Ia3w%+n,A:+U`avc`<:5#z&.94&w=v[<){Qr2|f;bnW!E=mM_fE)2I.(yLE:N.P', 'no'),
(109, 'nonce_salt', 'v)i>V|Bftf8>bEz7vy:wW^l$+nuJo?rB$Gtx|=708M?4#-/_|,fT7{lLwXj _i /', 'no'),
(110, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(111, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(112, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(113, 'cron', 'a:6:{i:1533889754;a:1:{s:34:"wp_privacy_delete_old_export_files";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:6:"hourly";s:4:"args";a:0:{}s:8:"interval";i:3600;}}}i:1533918554;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1533953749;a:1:{s:17:"gravityforms_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1533961882;a:2:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1533963268;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(114, 'theme_mods_twentyseventeen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1533529911;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";a:0:{}s:9:"sidebar-3";a:0:{}}}}', 'yes'),
(124, 'auth_key', '7H2XL!a[/pEoZH5=Jo3>O(A[x(%fghp=7,]wOXn7Ps~fc^9oY|%F=tlU#DUv,kb)', 'no'),
(125, 'auth_salt', 'zoi5ngW|`dJUl~7mLs:o7N%hp5d=8:h+.]Cp>BxoaT@?wLiTw`~7%i_xT)vUC^p8', 'no'),
(126, 'logged_in_key', '!z&>RbDIh|T)E8x *!-7l`ga7kj*lmn)b&Y.D a%JD)g:?Ww$%b;f^%(5KtHN<vU', 'no'),
(127, 'logged_in_salt', '0e6Rts:f+&W8RbxDSS7i@)ay:Z0Ru K)Z2vsP;V_LqkGz}6@,fbogP&<gFaCtNf}', 'no'),
(130, 'can_compress_scripts', '1', 'no'),
(145, 'current_theme', 'calderflower', 'yes'),
(146, 'theme_mods_calderflower', 'a:12:{i:0;b:0;s:18:"nav_menu_locations";a:0:{}s:18:"custom_css_post_id";i:-1;s:8:"linkedin";s:1:"#";s:8:"facebook";s:1:"#";s:9:"pinterest";s:1:"#";s:7:"twitter";s:1:"#";s:9:"instagram";s:1:"#";s:24:"footer_copyright_setting";s:72:"2018 © CalderFlower • Level 2, 140 Myrtle Street Chippendale NSW 2008";s:22:"header_address_setting";s:0:"";s:20:"header_email_setting";s:0:"";s:11:"custom_logo";i:85;}', 'yes'),
(147, 'theme_switched', '', 'yes'),
(152, 'recently_activated', 'a:2:{s:57:"accesspress-instagram-feed/accesspress-instagram-feed.php";i:1533720531;s:23:"gutenberg/gutenberg.php";i:1533539111;}', 'yes'),
(163, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(192, 'acf_version', '5.7.2', 'yes'),
(196, 'acf_pro_license', 'YToyOntzOjM6ImtleSI7czo3NjoiYjNKa1pYSmZhV1E5TVRBME1UUTVmSFI1Y0dVOVpHVjJaV3h2Y0dWeWZHUmhkR1U5TWpBeE55MHdOQzB4TXlBd09EbzBNem8xTWc9PSI7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3QvY2FsZGVyZmxvd2VyIjt9', 'yes'),
(206, 'widget_gform_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(207, 'gravityformsaddon_gravityformswebapi_version', '1.0', 'yes'),
(208, 'gform_enable_background_updates', '1', 'yes'),
(210, 'gform_pending_installation', '', 'yes'),
(211, 'rg_form_version', '2.3.3', 'yes'),
(221, 'rg_gforms_key', '885351de50cb716982ddec8fa755c849', 'yes'),
(222, 'gform_enable_noconflict', '1', 'yes'),
(223, 'rg_gforms_enable_akismet', '0', 'yes'),
(224, 'rg_gforms_currency', 'AUD', 'yes'),
(225, 'gform_enable_toolbar_menu', '1', 'yes'),
(236, 'category_children', 'a:0:{}', 'yes'),
(242, 'gf_previous_db_version', '2.2.1', 'yes'),
(243, 'gf_upgrade_lock', '', 'yes'),
(244, 'gform_sticky_admin_messages', 'a:0:{}', 'yes'),
(248, 'gf_submissions_block', '', 'yes'),
(249, 'gf_db_version', '2.3.3', 'yes'),
(250, 'gform_version_info', 'a:10:{s:12:"is_valid_key";b:1;s:6:"reason";s:0:"";s:7:"version";s:5:"2.3.3";s:3:"url";s:164:"http://s3.amazonaws.com/gravityforms/releases/gravityforms_2.3.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=CkOQQayParUDJqgC8JobjC2js7I%3D";s:15:"expiration_time";i:1565248968;s:9:"offerings";a:46:{s:12:"gravityforms";a:5:{s:12:"is_available";b:1;s:7:"version";s:5:"2.3.3";s:14:"version_latest";s:7:"2.3.3.6";s:3:"url";s:164:"http://s3.amazonaws.com/gravityforms/releases/gravityforms_2.3.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=CkOQQayParUDJqgC8JobjC2js7I%3D";s:10:"url_latest";s:168:"http://s3.amazonaws.com/gravityforms/releases/gravityforms_2.3.3.6.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=xljVcGIt3%2BVgAHEhTKjirol49WE%3D";}s:26:"gravityformsactivecampaign";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.4";s:14:"version_latest";s:5:"1.4.5";s:3:"url";s:193:"http://s3.amazonaws.com/gravityforms/addons/activecampaign/gravityformsactivecampaign_1.4.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=jPp%2FqKAV9IlMs66TiN7HxJa%2BseU%3D";s:10:"url_latest";s:195:"http://s3.amazonaws.com/gravityforms/addons/activecampaign/gravityformsactivecampaign_1.4.5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=6dpW2jEv%2B7%2BTV6GI6k7fpxMYVuA%3D";}s:20:"gravityformsagilecrm";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:179:"http://s3.amazonaws.com/gravityforms/addons/agilecrm/gravityformsagilecrm_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=3xpKEzV8nkmohGKSDGQI5AT%2BNJw%3D";s:10:"url_latest";s:179:"http://s3.amazonaws.com/gravityforms/addons/agilecrm/gravityformsagilecrm_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=3xpKEzV8nkmohGKSDGQI5AT%2BNJw%3D";}s:24:"gravityformsauthorizenet";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"2.6";s:14:"version_latest";s:3:"2.6";}s:18:"gravityformsaweber";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.7";s:14:"version_latest";s:5:"2.7.1";s:3:"url";s:175:"http://s3.amazonaws.com/gravityforms/addons/aweber/gravityformsaweber_2.7.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=%2BfurGBdLlX6TYveTfPSNh6YLEnE%3D";s:10:"url_latest";s:179:"http://s3.amazonaws.com/gravityforms/addons/aweber/gravityformsaweber_2.7.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=88e%2BfmmxNelUoO%2F5y7fjRCbHMqw%3D";}s:21:"gravityformsbatchbook";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:3:"1.3";s:3:"url";s:181:"http://s3.amazonaws.com/gravityforms/addons/batchbook/gravityformsbatchbook_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=jB3QdgHDIPZ%2BVqmjMqK0iNIRdG8%3D";s:10:"url_latest";s:181:"http://s3.amazonaws.com/gravityforms/addons/batchbook/gravityformsbatchbook_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=jB3QdgHDIPZ%2BVqmjMqK0iNIRdG8%3D";}s:18:"gravityformsbreeze";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:3:"1.3";s:3:"url";s:177:"http://s3.amazonaws.com/gravityforms/addons/breeze/gravityformsbreeze_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=cJP3puRiKfh9lsYUo%2F8Q4%2BgkBAs%3D";s:10:"url_latest";s:177:"http://s3.amazonaws.com/gravityforms/addons/breeze/gravityformsbreeze_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=cJP3puRiKfh9lsYUo%2F8Q4%2BgkBAs%3D";}s:27:"gravityformscampaignmonitor";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.7";s:14:"version_latest";s:3:"3.7";s:3:"url";s:191:"http://s3.amazonaws.com/gravityforms/addons/campaignmonitor/gravityformscampaignmonitor_3.7.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=5dYP8pfYIQCcrVj11iTYPDTsLUA%3D";s:10:"url_latest";s:191:"http://s3.amazonaws.com/gravityforms/addons/campaignmonitor/gravityformscampaignmonitor_3.7.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=5dYP8pfYIQCcrVj11iTYPDTsLUA%3D";}s:20:"gravityformscampfire";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.1";s:14:"version_latest";s:5:"1.2.1";s:3:"url";s:177:"http://s3.amazonaws.com/gravityforms/addons/campfire/gravityformscampfire_1.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=EmyYmVvWHrObuG7UJmr9sZKQRhY%3D";s:10:"url_latest";s:181:"http://s3.amazonaws.com/gravityforms/addons/campfire/gravityformscampfire_1.2.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=5zr92JGLGn%2B9OONyaHwxRPBEyEs%3D";}s:22:"gravityformscapsulecrm";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:3:"1.3";s:3:"url";s:181:"http://s3.amazonaws.com/gravityforms/addons/capsulecrm/gravityformscapsulecrm_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=d6nVdmMslKBMJK8LWeksyRoUFz8%3D";s:10:"url_latest";s:181:"http://s3.amazonaws.com/gravityforms/addons/capsulecrm/gravityformscapsulecrm_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=d6nVdmMslKBMJK8LWeksyRoUFz8%3D";}s:26:"gravityformschainedselects";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"1.0";s:14:"version_latest";s:6:"1.0.11";}s:23:"gravityformscleverreach";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.4";s:14:"version_latest";s:3:"1.4";s:3:"url";s:183:"http://s3.amazonaws.com/gravityforms/addons/cleverreach/gravityformscleverreach_1.4.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=Y0Ayq92JZDd0FUuTbYrqvDx1P34%3D";s:10:"url_latest";s:183:"http://s3.amazonaws.com/gravityforms/addons/cleverreach/gravityformscleverreach_1.4.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=Y0Ayq92JZDd0FUuTbYrqvDx1P34%3D";}s:19:"gravityformscoupons";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"2.6";s:14:"version_latest";s:5:"2.6.2";}s:17:"gravityformsdebug";a:5:{s:12:"is_available";b:1;s:7:"version";s:0:"";s:14:"version_latest";s:10:"1.0.beta10";s:3:"url";s:0:"";s:10:"url_latest";s:180:"http://s3.amazonaws.com/gravityforms/addons/debug/gravityformsdebug_1.0.beta10.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=OvoPonJE%2B8HT66nfPM9dz8KQdpM%3D";}s:19:"gravityformsdropbox";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.1";s:14:"version_latest";s:5:"2.1.1";s:3:"url";s:177:"http://s3.amazonaws.com/gravityforms/addons/dropbox/gravityformsdropbox_2.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=hkg7SVsK%2FfmRxdF3jlvPfSejLm4%3D";s:10:"url_latest";s:177:"http://s3.amazonaws.com/gravityforms/addons/dropbox/gravityformsdropbox_2.1.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=PTaSvRPdx7dAldxxY48I5U9ioHI%3D";}s:16:"gravityformsemma";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:5:"1.2.5";s:3:"url";s:173:"http://s3.amazonaws.com/gravityforms/addons/emma/gravityformsemma_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=%2F%2Fwkn78zizXdrs2y8W4kVymKEz8%3D";s:10:"url_latest";s:175:"http://s3.amazonaws.com/gravityforms/addons/emma/gravityformsemma_1.2.5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=wFVDl%2BhFWVgW0xQ%2BCU0IZnHaK5s%3D";}s:22:"gravityformsfreshbooks";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.5";s:14:"version_latest";s:5:"2.5.2";s:3:"url";s:181:"http://s3.amazonaws.com/gravityforms/addons/freshbooks/gravityformsfreshbooks_2.5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=Ez7zmhjt9IWdeezTk0DCsyjHhe0%3D";s:10:"url_latest";s:183:"http://s3.amazonaws.com/gravityforms/addons/freshbooks/gravityformsfreshbooks_2.5.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=zqDuDX8yNlOsc2iXoXemm5wSGBY%3D";}s:23:"gravityformsgetresponse";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:185:"http://s3.amazonaws.com/gravityforms/addons/getresponse/gravityformsgetresponse_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=0PXDjngEbZnyDnx4dRztZ%2B6dlKk%3D";s:10:"url_latest";s:185:"http://s3.amazonaws.com/gravityforms/addons/getresponse/gravityformsgetresponse_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=0PXDjngEbZnyDnx4dRztZ%2B6dlKk%3D";}s:21:"gravityformsgutenberg";a:5:{s:12:"is_available";b:1;s:7:"version";s:10:"1.0-beta-5";s:14:"version_latest";s:10:"1.0-beta-5";s:3:"url";s:186:"http://s3.amazonaws.com/gravityforms/addons/gutenberg/gravityformsgutenberg_1.0-beta-5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=UQa570dofn3kog35bDqLnlBanS8%3D";s:10:"url_latest";s:186:"http://s3.amazonaws.com/gravityforms/addons/gutenberg/gravityformsgutenberg_1.0-beta-5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=UQa570dofn3kog35bDqLnlBanS8%3D";}s:21:"gravityformshelpscout";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.5";s:14:"version_latest";s:3:"1.5";s:3:"url";s:181:"http://s3.amazonaws.com/gravityforms/addons/helpscout/gravityformshelpscout_1.5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=k9VBLt%2FSGhj9IdIF4WtHVb7TPxU%3D";s:10:"url_latest";s:181:"http://s3.amazonaws.com/gravityforms/addons/helpscout/gravityformshelpscout_1.5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=k9VBLt%2FSGhj9IdIF4WtHVb7TPxU%3D";}s:20:"gravityformshighrise";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:5:"1.2.3";s:3:"url";s:181:"http://s3.amazonaws.com/gravityforms/addons/highrise/gravityformshighrise_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=5x8Q%2BNpp56%2Fvkzbo8PDe720kizY%3D";s:10:"url_latest";s:181:"http://s3.amazonaws.com/gravityforms/addons/highrise/gravityformshighrise_1.2.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=ZioG6MLxdCm9gKABzT%2Fc7TczSME%3D";}s:19:"gravityformshipchat";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:179:"http://s3.amazonaws.com/gravityforms/addons/hipchat/gravityformshipchat_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=T8BXCaTGRj%2FEGyt3rLGeRoplL%2Fg%3D";s:10:"url_latest";s:179:"http://s3.amazonaws.com/gravityforms/addons/hipchat/gravityformshipchat_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=T8BXCaTGRj%2FEGyt3rLGeRoplL%2Fg%3D";}s:20:"gravityformsicontact";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:3:"1.3";s:3:"url";s:181:"http://s3.amazonaws.com/gravityforms/addons/icontact/gravityformsicontact_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=7T7ySX4v%2FKgalp8Qx%2FBxo7evyOs%3D";s:10:"url_latest";s:181:"http://s3.amazonaws.com/gravityforms/addons/icontact/gravityformsicontact_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=7T7ySX4v%2FKgalp8Qx%2FBxo7evyOs%3D";}s:19:"gravityformslogging";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.3";s:14:"version_latest";s:5:"1.3.1";s:3:"url";s:175:"http://s3.amazonaws.com/gravityforms/addons/logging/gravityformslogging_1.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=2zy37JZNJN7gIipqmU70ZkAaTgQ%3D";s:10:"url_latest";s:179:"http://s3.amazonaws.com/gravityforms/addons/logging/gravityformslogging_1.3.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=ay9L%2BQBRjJWolK7X107pJxFY3p4%3D";}s:19:"gravityformsmadmimi";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:3:"1.2";s:3:"url";s:181:"http://s3.amazonaws.com/gravityforms/addons/madmimi/gravityformsmadmimi_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=CFY73D%2FBbaG73ql%2BWoX%2BIpQYaDc%3D";s:10:"url_latest";s:181:"http://s3.amazonaws.com/gravityforms/addons/madmimi/gravityformsmadmimi_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=CFY73D%2FBbaG73ql%2BWoX%2BIpQYaDc%3D";}s:21:"gravityformsmailchimp";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"4.3";s:14:"version_latest";s:3:"4.3";s:3:"url";s:179:"http://s3.amazonaws.com/gravityforms/addons/mailchimp/gravityformsmailchimp_4.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=UBUfa6Invr0IZMeBGunAdHMGZGY%3D";s:10:"url_latest";s:179:"http://s3.amazonaws.com/gravityforms/addons/mailchimp/gravityformsmailchimp_4.3.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=UBUfa6Invr0IZMeBGunAdHMGZGY%3D";}s:26:"gravityformspartialentries";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"1.2";s:14:"version_latest";s:5:"1.2.1";}s:18:"gravityformspaypal";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.1";s:14:"version_latest";s:5:"3.1.1";s:3:"url";s:173:"http://s3.amazonaws.com/gravityforms/addons/paypal/gravityformspaypal_3.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=YGl9M0QWx0qMj26d3LRCQ4TWTvs%3D";s:10:"url_latest";s:179:"http://s3.amazonaws.com/gravityforms/addons/paypal/gravityformspaypal_3.1.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=QUrAcepLZ0Of%2FFSxeA20Z%2BY7iwM%3D";}s:33:"gravityformspaypalexpresscheckout";a:3:{s:12:"is_available";b:0;s:7:"version";s:0:"";s:14:"version_latest";N;}s:29:"gravityformspaypalpaymentspro";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"2.3";s:14:"version_latest";s:5:"2.3.2";}s:21:"gravityformspaypalpro";a:3:{s:12:"is_available";b:0;s:7:"version";s:5:"1.8.1";s:14:"version_latest";s:5:"1.8.1";}s:20:"gravityformspicatcha";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"2.0";s:14:"version_latest";s:3:"2.0";}s:16:"gravityformspipe";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.1";s:14:"version_latest";s:3:"1.1";s:3:"url";s:169:"http://s3.amazonaws.com/gravityforms/addons/pipe/gravityformspipe_1.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=AnH3TPoW6HLfnGWB189TcQaWPy0%3D";s:10:"url_latest";s:169:"http://s3.amazonaws.com/gravityforms/addons/pipe/gravityformspipe_1.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=AnH3TPoW6HLfnGWB189TcQaWPy0%3D";}s:17:"gravityformspolls";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"3.1";s:14:"version_latest";s:5:"3.1.4";}s:16:"gravityformsquiz";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"3.1";s:14:"version_latest";s:5:"3.1.7";}s:19:"gravityformsrestapi";a:5:{s:12:"is_available";b:1;s:7:"version";s:10:"2.0-beta-2";s:14:"version_latest";s:10:"2.0-beta-2";s:3:"url";s:186:"http://s3.amazonaws.com/gravityforms/addons/restapi/gravityformsrestapi_2.0-beta-2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=ExMth%2FP2kpmqfoD7eT%2FJanHAG4U%3D";s:10:"url_latest";s:186:"http://s3.amazonaws.com/gravityforms/addons/restapi/gravityformsrestapi_2.0-beta-2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=ExMth%2FP2kpmqfoD7eT%2FJanHAG4U%3D";}s:21:"gravityformssignature";a:3:{s:12:"is_available";b:0;s:7:"version";s:5:"3.5.1";s:14:"version_latest";s:5:"3.5.2";}s:17:"gravityformsslack";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.8";s:14:"version_latest";s:3:"1.8";s:3:"url";s:175:"http://s3.amazonaws.com/gravityforms/addons/slack/gravityformsslack_1.8.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=2Z3%2Fb09jiCmz9wAOa%2BQxYkJCiec%3D";s:10:"url_latest";s:175:"http://s3.amazonaws.com/gravityforms/addons/slack/gravityformsslack_1.8.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=2Z3%2Fb09jiCmz9wAOa%2BQxYkJCiec%3D";}s:18:"gravityformsstripe";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"2.5";s:14:"version_latest";s:5:"2.5.4";}s:18:"gravityformssurvey";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"3.2";s:14:"version_latest";s:5:"3.2.2";}s:18:"gravityformstrello";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.2";s:14:"version_latest";s:5:"1.2.2";s:3:"url";s:175:"http://s3.amazonaws.com/gravityforms/addons/trello/gravityformstrello_1.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=9SYhHx%2BZUOpFe8OUUzUNxmIhyJY%3D";s:10:"url_latest";s:175:"http://s3.amazonaws.com/gravityforms/addons/trello/gravityformstrello_1.2.2.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=SHOPdCbt0IBpzOwixJmZf7gfrNk%3D";}s:18:"gravityformstwilio";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"2.5";s:14:"version_latest";s:5:"2.5.1";s:3:"url";s:177:"http://s3.amazonaws.com/gravityforms/addons/twilio/gravityformstwilio_2.5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=a5aNC4v7o%2B%2BpB73CPCjrXTNMJ90%3D";s:10:"url_latest";s:175:"http://s3.amazonaws.com/gravityforms/addons/twilio/gravityformstwilio_2.5.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=ie53ry9hQVCVJOTyXp7oj62UVY0%3D";}s:28:"gravityformsuserregistration";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"3.9";s:14:"version_latest";s:5:"3.9.5";}s:20:"gravityformswebhooks";a:3:{s:12:"is_available";b:0;s:7:"version";s:3:"1.1";s:14:"version_latest";s:5:"1.1.5";}s:18:"gravityformszapier";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"3.0";s:14:"version_latest";s:5:"3.0.1";s:3:"url";s:173:"http://s3.amazonaws.com/gravityforms/addons/zapier/gravityformszapier_3.0.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=eY0uWz3Qe9H1XU0i0OIETV3WG80%3D";s:10:"url_latest";s:177:"http://s3.amazonaws.com/gravityforms/addons/zapier/gravityformszapier_3.0.1.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=TxctSoBWRvbHIx5O5El%2BNLKYnhE%3D";}s:19:"gravityformszohocrm";a:5:{s:12:"is_available";b:1;s:7:"version";s:3:"1.5";s:14:"version_latest";s:3:"1.5";s:3:"url";s:177:"http://s3.amazonaws.com/gravityforms/addons/zohocrm/gravityformszohocrm_1.5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=FLJooQ1XGUEl%2FOwlD06U6CRDL6c%3D";s:10:"url_latest";s:177:"http://s3.amazonaws.com/gravityforms/addons/zohocrm/gravityformszohocrm_1.5.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=FLJooQ1XGUEl%2FOwlD06U6CRDL6c%3D";}}s:9:"is_active";s:1:"1";s:14:"version_latest";s:7:"2.3.3.6";s:10:"url_latest";s:168:"http://s3.amazonaws.com/gravityforms/releases/gravityforms_2.3.3.6.zip?AWSAccessKeyId=1603BBK66770VCSCJSG2&Expires=1533977268&Signature=xljVcGIt3%2BVgAHEhTKjirol49WE%3D";s:9:"timestamp";i:1533804467;}', 'yes'),
(321, 'sbi_rating_notice', 'pending', 'yes'),
(322, 'sb_instagram_settings', 'a:40:{s:15:"sb_instagram_at";s:0:"";s:20:"sb_instagram_user_id";a:1:{i:0;s:9:"537086543";}s:30:"sb_instagram_preserve_settings";s:0:"";s:23:"sb_instagram_ajax_theme";s:0:"";s:23:"sb_instagram_cache_time";s:1:"1";s:28:"sb_instagram_cache_time_unit";s:5:"hours";s:18:"sb_instagram_width";i:100;s:23:"sb_instagram_width_unit";s:1:"%";s:28:"sb_instagram_feed_width_resp";s:2:"on";s:19:"sb_instagram_height";s:0:"";s:16:"sb_instagram_num";i:20;s:24:"sb_instagram_height_unit";s:1:"%";s:17:"sb_instagram_cols";s:1:"4";s:27:"sb_instagram_disable_mobile";s:0:"";s:26:"sb_instagram_image_padding";i:10;s:31:"sb_instagram_image_padding_unit";s:2:"px";s:17:"sb_instagram_sort";s:4:"none";s:23:"sb_instagram_background";s:0:"";s:21:"sb_instagram_show_btn";s:0:"";s:27:"sb_instagram_btn_background";s:0:"";s:27:"sb_instagram_btn_text_color";s:0:"";s:21:"sb_instagram_btn_text";s:12:"Load More...";s:22:"sb_instagram_image_res";s:4:"auto";s:24:"sb_instagram_show_header";s:2:"on";s:25:"sb_instagram_header_color";s:0:"";s:28:"sb_instagram_show_follow_btn";s:2:"on";s:33:"sb_instagram_folow_btn_background";s:0:"";s:34:"sb_instagram_follow_btn_text_color";s:0:"";s:28:"sb_instagram_follow_btn_text";s:19:"Follow on Instagram";s:23:"sb_instagram_custom_css";s:0:"";s:22:"sb_instagram_custom_js";s:0:"";s:17:"sb_instagram_cron";s:2:"no";s:9:"check_api";s:2:"on";s:19:"sb_instagram_backup";s:2:"on";s:24:"enqueue_css_in_shortcode";b:0;s:30:"sb_instagram_disable_mob_swipe";b:0;s:15:"sbi_font_method";s:3:"svg";s:28:"sb_instagram_disable_awesome";s:0:"";s:18:"connected_accounts";a:1:{i:537086543;a:6:{s:12:"access_token";s:68:"537086543.M2E4MWE5Zg==.YWNhYzRlYjI3ZTIyN.GNmMWFjN2Q1ZWU0MWU4ZTNhNTY=";s:7:"user_id";s:9:"537086543";s:8:"username";s:10:"magarishor";s:8:"is_valid";b:1;s:12:"last_checked";i:1533705874;s:15:"profile_picture";s:248:"https://scontent.cdninstagram.com/vp/b22969f886e6c04c37be359c42c5901b/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg?_nc_eui2=AeEWzSXIIN2hzqCSOP1oNn3wQX4s32N_T8WoMVkl09LiQpuOMXXOfvNpwKZYtQrX9UKb6w2I732DdI5Eyqx5-ypz";}}s:21:"sb_instagram_show_bio";s:2:"on";}', 'yes'),
(329, '!sbi_header_537086543', '%7B%22data%22:%7B%22id%22:%22537086543%22,%22username%22:%22magarishor%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22full_name%22:%22ishor%20magar%22,%22bio%22:%22%22,%22website%22:%22%22,%22is_business%22:false,%22counts%22:%7B%22media%22:6,%22follows%22:685,%22followed_by%22:281%7D%7D,%22meta%22:%7B%22code%22:200%7D%7D', 'no'),
(332, '!sbi_537086543', '%7B%22pagination%22:%7B%22next_url%22:%5B%5D%7D,%22data%22:%5B%7B%22id%22:%221839057207119981333_537086543%22,%22user%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D,%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/42f78b76b0ba9698d9b20eca62c5f1d1/5BF5A4CC/t51.2885-15/e35/s150x150/37730629_444421016066262_4699067952698228736_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/42f5a638d8cf3696ec657a5668f15f43/5BF1923C/t51.2885-15/e35/s320x320/37730629_444421016066262_4699067952698228736_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/49fd3da29b6b30b43917f6d048c25409/5BED6E6B/t51.2885-15/sh0.08/e35/s640x640/37730629_444421016066262_4699067952698228736_n.jpg%22%7D%7D,%22created_time%22:%221533452724%22,%22caption%22:%7B%22id%22:%2217966607058003848%22,%22text%22:%22@riverfunbeach%22,%22created_time%22:%221533452724%22,%22from%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D%7D,%22user_has_liked%22:false,%22likes%22:%7B%22count%22:37%7D,%22tags%22:%5B%5D,%22filter%22:%22Normal%22,%22comments%22:%7B%22count%22:0%7D,%22type%22:%22carousel%22,%22link%22:%22https://www.instagram.com/p/BmFpMlAAisV/%22,%22location%22:%7B%22latitude%22:27.861432041023,%22longitude%22:84.635333706816,%22name%22:%22River%20Fun%20Beach%20Resort%22,%22id%22:342228090%7D,%22attribution%22:null,%22users_in_photo%22:%5B%5D,%22carousel_media%22:%5B%7B%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/42f78b76b0ba9698d9b20eca62c5f1d1/5BF5A4CC/t51.2885-15/e35/s150x150/37730629_444421016066262_4699067952698228736_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/42f5a638d8cf3696ec657a5668f15f43/5BF1923C/t51.2885-15/e35/s320x320/37730629_444421016066262_4699067952698228736_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/49fd3da29b6b30b43917f6d048c25409/5BED6E6B/t51.2885-15/sh0.08/e35/s640x640/37730629_444421016066262_4699067952698228736_n.jpg%22%7D%7D,%22users_in_photo%22:%5B%5D,%22type%22:%22image%22%7D,%7B%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/564fa040c6b47246f44793acba379379/5C025039/t51.2885-15/e35/s150x150/37972840_213776976146640_4867763092580204544_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/65d76de8b8d74a88ed8a9d1780225e16/5BF3D0C9/t51.2885-15/e35/s320x320/37972840_213776976146640_4867763092580204544_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/0c74650287b0c4f98d7c2a6c904bba19/5C06209E/t51.2885-15/sh0.08/e35/s640x640/37972840_213776976146640_4867763092580204544_n.jpg%22%7D%7D,%22users_in_photo%22:%5B%5D,%22type%22:%22image%22%7D,%7B%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/956de4123a31b1704f5763bd34fc7cd7/5C078C52/t51.2885-15/e35/s150x150/38478842_2164944673721186_7099776417134542848_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/be860b0424bec43a0a5b0136d2759e7c/5BFE672A/t51.2885-15/e35/s320x320/38478842_2164944673721186_7099776417134542848_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/928d7103d3e97cf43b4774219d610d20/5BFA0AD7/t51.2885-15/sh0.08/e35/s640x640/38478842_2164944673721186_7099776417134542848_n.jpg%22%7D%7D,%22users_in_photo%22:%5B%5D,%22type%22:%22image%22%7D,%7B%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/41f943de84ab9dd433ced0a11392f2bf/5C083C89/t51.2885-15/e35/s150x150/38081412_663655667336169_8171219634767265792_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/f0ce6bc3b8d80581a67ed52b5dd10bbc/5C0E5F79/t51.2885-15/e35/s320x320/38081412_663655667336169_8171219634767265792_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/88b47b6bb7637c3386681a5831e9ea2b/5BF7CB2E/t51.2885-15/sh0.08/e35/s640x640/38081412_663655667336169_8171219634767265792_n.jpg%22%7D%7D,%22users_in_photo%22:%5B%5D,%22type%22:%22image%22%7D,%7B%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/3d6ec78e38e7bf5b600cb81dff28fc4a/5C079332/t51.2885-15/e35/s150x150/38080979_1102969459853197_106809943956389888_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/d031b98a2a65ad189ca622bbf3ff5ce8/5C03E5C2/t51.2885-15/e35/s320x320/38080979_1102969459853197_106809943956389888_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/f02803264b23889622c1e33818230284/5BFCF095/t51.2885-15/sh0.08/e35/s640x640/38080979_1102969459853197_106809943956389888_n.jpg%22%7D%7D,%22users_in_photo%22:%5B%5D,%22type%22:%22image%22%7D,%7B%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/f5c128a093665dd623c572e6cb424f4a/5BEEA9A1/t51.2885-15/e35/s150x150/37774517_2125452381112012_38231677155147776_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/81a8943556090ad01854ea31023f31a6/5BFC68AC/t51.2885-15/e35/s320x320/37774517_2125452381112012_38231677155147776_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/81e8887ace37e4bf11608f5d1554f1b7/5BF90240/t51.2885-15/sh0.08/e35/s640x640/37774517_2125452381112012_38231677155147776_n.jpg%22%7D%7D,%22users_in_photo%22:%5B%5D,%22type%22:%22image%22%7D,%7B%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/609b2b63b52486265b3be6802cc53ee3/5BF0DE2F/t51.2885-15/e35/s150x150/38081294_306268353250940_2229364317575184384_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/7a994e56280369521b83a12251de7711/5BFB7EDF/t51.2885-15/e35/s320x320/38081294_306268353250940_2229364317575184384_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/fb3916680b87424516055f0f6748df5e/5BFDA288/t51.2885-15/sh0.08/e35/s640x640/38081294_306268353250940_2229364317575184384_n.jpg%22%7D%7D,%22users_in_photo%22:%5B%5D,%22type%22:%22image%22%7D%5D%7D,%7B%22id%22:%221823811684637198634_537086543%22,%22user%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D,%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/025509b4d9ba2dce78a6eb898d3ec5a9/5BF01765/t51.2885-15/e35/c208.0.543.543/s150x150/36875182_270413416870658_4484408549555830784_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:181,%22url%22:%22https://scontent.cdninstagram.com/vp/16967e6d25233aaf614d1fbcd82d63ed/5C1430F1/t51.2885-15/e35/s320x320/36875182_270413416870658_4484408549555830784_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:362,%22url%22:%22https://scontent.cdninstagram.com/vp/8f7abdfbb2f55fef2fa5856fe65b2d1c/5C1071A6/t51.2885-15/sh0.08/e35/s640x640/36875182_270413416870658_4484408549555830784_n.jpg%22%7D%7D,%22created_time%22:%221531635316%22,%22caption%22:null,%22user_has_liked%22:false,%22likes%22:%7B%22count%22:4%7D,%22tags%22:%5B%5D,%22filter%22:%22Normal%22,%22comments%22:%7B%22count%22:1%7D,%22type%22:%22image%22,%22link%22:%22https://www.instagram.com/p/BlPexBwAckq/%22,%22location%22:null,%22attribution%22:null,%22users_in_photo%22:%5B%5D%7D,%7B%22id%22:%221692778167502478959_537086543%22,%22user%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D,%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/4dc84cc8514fdafdacd0569b4a9df15b/5BF445F7/t51.2885-15/e35/s150x150/26073728_184549715478469_8454853326465400832_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/a58a7629bf9565db1ca2b9cfd931637f/5BF81707/t51.2885-15/e35/s320x320/26073728_184549715478469_8454853326465400832_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/7bbe49e7b27c4f17e667369ba17282a3/5BEEAD50/t51.2885-15/sh0.08/e35/s640x640/26073728_184549715478469_8454853326465400832_n.jpg%22%7D%7D,%22created_time%22:%221516014904%22,%22caption%22:%7B%22id%22:%2217903655805121824%22,%22text%22:%22To%20travel%20is%20to%20live.%22,%22created_time%22:%221516014904%22,%22from%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D%7D,%22user_has_liked%22:false,%22likes%22:%7B%22count%22:61%7D,%22tags%22:%5B%5D,%22filter%22:%22Dogpatch%22,%22comments%22:%7B%22count%22:0%7D,%22type%22:%22image%22,%22link%22:%22https://www.instagram.com/p/Bd99MZNhZ5v/%22,%22location%22:%7B%22latitude%22:27.550601437778,%22longitude%22:85.547918914046,%22name%22:%22Balthali%20Eco%20Hill%20Resort%22,%22id%22:703252018%7D,%22attribution%22:null,%22users_in_photo%22:%5B%5D%7D,%7B%22id%22:%221659343786977036215_537086543%22,%22user%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D,%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/75fa6051bd647f2f253d8acadf931128/5C11F028/t51.2885-15/e35/s150x150/24177282_933989650092238_5789217926158483456_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/d45b724dc036dd91f3b70d721e084b1b/5C0182D8/t51.2885-15/e35/s320x320/24177282_933989650092238_5789217926158483456_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/f099fc5ac30e41d779caad49e20c43a4/5C13648F/t51.2885-15/sh0.08/e35/s640x640/24177282_933989650092238_5789217926158483456_n.jpg%22%7D%7D,%22created_time%22:%221512029215%22,%22caption%22:%7B%22id%22:%2217902399945075992%22,%22text%22:%22%5C%22When%20writing%20the%20story%20of%20your%20life,%20don\\\'t%20let%20anyone%20else%20hold%20the%20pen.%5C%22%22,%22created_time%22:%221512029215%22,%22from%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D%7D,%22user_has_liked%22:false,%22likes%22:%7B%22count%22:49%7D,%22tags%22:%5B%5D,%22filter%22:%22Hudson%22,%22comments%22:%7B%22count%22:0%7D,%22type%22:%22image%22,%22link%22:%22https://www.instagram.com/p/BcHLGH3BIe3/%22,%22location%22:null,%22attribution%22:null,%22users_in_photo%22:%5B%5D%7D,%7B%22id%22:%22570474625169367820_537086543%22,%22user%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D,%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/403b9156764c33771f9b962c1fb21b74/5BFF0873/t51.2885-15/e15/s150x150/1389977_168791063315423_1234946006_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/4ed73b08252c7341de7a194876dfec37/5C061DD5/t51.2885-15/e15/s320x320/1389977_168791063315423_1234946006_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:640,%22height%22:640,%22url%22:%22https://scontent.cdninstagram.com/vp/f26fd9ea4455442be85d5b810ba235e9/5BFE4F1D/t51.2885-15/e15/1389977_168791063315423_1234946006_n.jpg%22%7D%7D,%22created_time%22:%221382225896%22,%22caption%22:null,%22user_has_liked%22:true,%22likes%22:%7B%22count%22:14%7D,%22tags%22:%5B%5D,%22filter%22:%22Normal%22,%22comments%22:%7B%22count%22:0%7D,%22type%22:%22image%22,%22link%22:%22https://www.instagram.com/p/fqu6YqmCMM/%22,%22location%22:null,%22attribution%22:null,%22users_in_photo%22:%5B%5D%7D,%7B%22id%22:%22536525528767144132_537086543%22,%22user%22:%7B%22id%22:%22537086543%22,%22full_name%22:%22ishor%20magar%22,%22profile_picture%22:%22https://scontent.cdninstagram.com/vp/5114d624885a81776f5eaf0dcad63c22/5C06E11C/t51.2885-19/s150x150/30079034_267840007089323_7937107401323315200_n.jpg%22,%22username%22:%22magarishor%22%7D,%22images%22:%7B%22thumbnail%22:%7B%22width%22:150,%22height%22:150,%22url%22:%22https://scontent.cdninstagram.com/vp/faa5f971f0d30c33211be0b7d570571f/5BEE1216/t51.2885-15/e15/s150x150/11269917_369380769925365_598803899_n.jpg%22%7D,%22low_resolution%22:%7B%22width%22:320,%22height%22:320,%22url%22:%22https://scontent.cdninstagram.com/vp/77c3d8f8c21c25cd1c0c3e4141155ad8/5C1086B0/t51.2885-15/e15/s320x320/11269917_369380769925365_598803899_n.jpg%22%7D,%22standard_resolution%22:%7B%22width%22:612,%22height%22:612,%22url%22:%22https://scontent.cdninstagram.com/vp/3bab34b7fc6a39dc01f651a625cd8657/5BFC5378/t51.2885-15/e15/11269917_369380769925365_598803899_n.jpg%22%7D%7D,%22created_time%22:%221378178848%22,%22caption%22:null,%22user_has_liked%22:true,%22likes%22:%7B%22count%22:16%7D,%22tags%22:%5B%5D,%22filter%22:%22Amaro%22,%22comments%22:%7B%22count%22:0%7D,%22type%22:%22image%22,%22link%22:%22https://www.instagram.com/p/dyHyAzGCDE/%22,%22location%22:null,%22attribution%22:null,%22users_in_photo%22:%5B%5D%7D%5D,%22meta%22:%7B%22code%22:200%7D%7D', 'no'),
(359, 'apif_settings', 'a:4:{s:8:"username";s:0:"";s:12:"access_token";s:0:"";s:7:"user_id";s:0:"";s:16:"instagram_mosaic";s:6:"mosaic";}', 'yes'),
(360, 'widget_apif_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(361, 'widget_apif_sidewidget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(460, 'options_slider_settings_view_our_projects_title', 'View our <br/> Projects', 'no'),
(461, '_options_slider_settings_view_our_projects_title', 'field_5b6bb4523052f', 'no'),
(462, 'options_slider_settings_view_our_projects_url', '#', 'no'),
(463, '_options_slider_settings_view_our_projects_url', 'field_5b6bb46230530', 'no'),
(464, 'options_slider_settings_meet_our_team_title', 'Meet our team', 'no'),
(465, '_options_slider_settings_meet_our_team_title', 'field_5b6bb48d1b07c', 'no'),
(466, 'options_slider_settings_meet_our_team_url', '#', 'no'),
(467, '_options_slider_settings_meet_our_team_url', 'field_5b6bb49e1b07d', 'no'),
(468, 'options_slider_settings_read_our_news_title', 'Read our news', 'no'),
(469, '_options_slider_settings_read_our_news_title', 'field_5b6bb4ab1b07e', 'no'),
(470, 'options_slider_settings_read_our_news_url', '#', 'no'),
(471, '_options_slider_settings_read_our_news_url', 'field_5b6bb4b51b07f', 'no'),
(472, 'options_slider_settings', '', 'no'),
(473, '_options_slider_settings', 'field_5b6bb4353052e', 'no'),
(554, 'gf_site_key', '2e72402f-2b1d-4913-b5d8-504643356dad', 'yes'),
(555, 'gf_site_secret', '90abe418-d788-45f5-bbc5-caada5cc0327', 'yes'),
(556, 'rg_gforms_disable_css', '1', 'yes'),
(557, 'rg_gforms_captcha_public_key', '', 'yes'),
(558, 'rg_gforms_captcha_private_key', '', 'yes'),
(559, 'rg_gforms_message', '<!--GFM-->', 'yes'),
(568, 'wpmdb_usage', 'a:2:{s:6:"action";s:8:"savefile";s:4:"time";i:1533888414;}', 'no'),
(657, 'cfproject_type_children', 'a:0:{}', 'yes'),
(701, 'cfteam_type_children', 'a:0:{}', 'yes') ;

#
# End of data contents of table `wp_options`
# --------------------------------------------------------



#
# Delete any existing table `wp_postmeta`
#

DROP TABLE IF EXISTS `wp_postmeta`;


#
# Table structure of table `wp_postmeta`
#

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_postmeta`
#
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(3, 5, '_oembed_bf6964af303ed7ed4297755ba99a9f33', '<iframe src="https://player.vimeo.com/video/22439234?app_id=122963" width="640" height="360" frameborder="0" title="The Mountain" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'),
(4, 5, '_oembed_time_bf6964af303ed7ed4297755ba99a9f33', '1533531297'),
(5, 5, '_edit_lock', '1533538985:1'),
(13, 9, '_edit_last', '1'),
(14, 9, '_edit_lock', '1533886220:1'),
(15, 11, '_edit_last', '1'),
(16, 11, '_edit_lock', '1533883338:1'),
(17, 13, '_edit_last', '1'),
(18, 13, '_edit_lock', '1533539779:1'),
(19, 15, '_edit_last', '1'),
(20, 15, '_edit_lock', '1533539789:1'),
(21, 17, '_edit_last', '1'),
(22, 17, '_edit_lock', '1533539802:1'),
(23, 19, '_edit_last', '1'),
(24, 19, '_edit_lock', '1533627140:1'),
(25, 21, '_edit_last', '1'),
(26, 21, '_edit_lock', '1533607655:1'),
(27, 23, '_edit_last', '1'),
(28, 23, '_edit_lock', '1533610183:1'),
(29, 25, '_menu_item_type', 'custom'),
(30, 25, '_menu_item_menu_item_parent', '0'),
(31, 25, '_menu_item_object_id', '25'),
(32, 25, '_menu_item_object', 'custom'),
(33, 25, '_menu_item_target', ''),
(34, 25, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(35, 25, '_menu_item_xfn', ''),
(36, 25, '_menu_item_url', 'http://dev7.naphix.com/calderflower/'),
(38, 26, '_menu_item_type', 'post_type'),
(39, 26, '_menu_item_menu_item_parent', '0'),
(40, 26, '_menu_item_object_id', '11'),
(41, 26, '_menu_item_object', 'page'),
(42, 26, '_menu_item_target', ''),
(43, 26, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(44, 26, '_menu_item_xfn', ''),
(45, 26, '_menu_item_url', ''),
(47, 27, '_menu_item_type', 'post_type'),
(48, 27, '_menu_item_menu_item_parent', '0'),
(49, 27, '_menu_item_object_id', '19'),
(50, 27, '_menu_item_object', 'page'),
(51, 27, '_menu_item_target', ''),
(52, 27, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(53, 27, '_menu_item_xfn', ''),
(54, 27, '_menu_item_url', ''),
(56, 28, '_menu_item_type', 'post_type'),
(57, 28, '_menu_item_menu_item_parent', '0'),
(58, 28, '_menu_item_object_id', '21'),
(59, 28, '_menu_item_object', 'page'),
(60, 28, '_menu_item_target', ''),
(61, 28, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(62, 28, '_menu_item_xfn', ''),
(63, 28, '_menu_item_url', ''),
(65, 29, '_menu_item_type', 'post_type'),
(66, 29, '_menu_item_menu_item_parent', '0'),
(67, 29, '_menu_item_object_id', '9'),
(68, 29, '_menu_item_object', 'page'),
(69, 29, '_menu_item_target', ''),
(70, 29, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(71, 29, '_menu_item_xfn', ''),
(72, 29, '_menu_item_url', ''),
(74, 30, '_menu_item_type', 'post_type'),
(75, 30, '_menu_item_menu_item_parent', '0'),
(76, 30, '_menu_item_object_id', '13'),
(77, 30, '_menu_item_object', 'page'),
(78, 30, '_menu_item_target', ''),
(79, 30, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(80, 30, '_menu_item_xfn', ''),
(81, 30, '_menu_item_url', ''),
(83, 31, '_menu_item_type', 'post_type'),
(84, 31, '_menu_item_menu_item_parent', '0'),
(85, 31, '_menu_item_object_id', '17'),
(86, 31, '_menu_item_object', 'page'),
(87, 31, '_menu_item_target', ''),
(88, 31, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(89, 31, '_menu_item_xfn', ''),
(90, 31, '_menu_item_url', ''),
(92, 32, '_menu_item_type', 'post_type'),
(93, 32, '_menu_item_menu_item_parent', '0'),
(94, 32, '_menu_item_object_id', '23'),
(95, 32, '_menu_item_object', 'page'),
(96, 32, '_menu_item_target', ''),
(97, 32, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(98, 32, '_menu_item_xfn', ''),
(99, 32, '_menu_item_url', ''),
(101, 33, '_menu_item_type', 'post_type'),
(102, 33, '_menu_item_menu_item_parent', '0'),
(103, 33, '_menu_item_object_id', '15'),
(104, 33, '_menu_item_object', 'page'),
(105, 33, '_menu_item_target', ''),
(106, 33, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(107, 33, '_menu_item_xfn', ''),
(108, 33, '_menu_item_url', ''),
(110, 1, '_edit_lock', '1533627239:1'),
(111, 38, '_edit_last', '1'),
(112, 38, '_edit_lock', '1533692460:1'),
(113, 38, 'calder_flwr_about_text', 'architecture + interiors'),
(114, 38, 'calder_flwr_about_subtitle', 'architecture + interiors'),
(115, 38, 'calder_flwr_about_button1', 'Let\'s talk'),
(116, 41, '_wp_trash_meta_status', 'publish'),
(117, 41, '_wp_trash_meta_time', '1533629576'),
(120, 43, '_edit_last', '1') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(121, 43, '_edit_lock', '1533784949:1'),
(122, 38, 'cf_home_subtitle', 'architecture+interiors'),
(123, 38, '_cf_home_subtitle', 'field_5b6a434c9e057'),
(124, 38, 'first_button_first_button_name', 'Let\'s Talk'),
(125, 38, '_first_button_first_button_name', 'field_5b6a43ce9e059'),
(126, 38, 'first_button_first_button_url', '#'),
(127, 38, '_first_button_first_button_url', 'field_5b6a43e49e05a'),
(128, 38, 'first_button', ''),
(129, 38, '_first_button', 'field_5b6a43bc9e058'),
(130, 38, 'second_button_second_button_name', 'Our aim'),
(131, 38, '_second_button_second_button_name', 'field_5b6a45055a1cf'),
(132, 38, 'second_button_second_button_url', '#'),
(133, 38, '_second_button_second_button_url', 'field_5b6a45265a1d0'),
(134, 38, 'second_button', ''),
(135, 38, '_second_button', 'field_5b6a44f35a1ce'),
(136, 54, '_edit_last', '1'),
(137, 54, '_edit_lock', '1533692415:1'),
(138, 54, 'cf_home_subtitle', 'architecture+interiors'),
(139, 54, '_cf_home_subtitle', 'field_5b6a434c9e057'),
(140, 54, 'first_button_first_button_name', 'Let\'s Talk'),
(141, 54, '_first_button_first_button_name', 'field_5b6a43ce9e059'),
(142, 54, 'first_button_first_button_url', '#'),
(143, 54, '_first_button_first_button_url', 'field_5b6a43e49e05a'),
(144, 54, 'first_button', ''),
(145, 54, '_first_button', 'field_5b6a43bc9e058'),
(146, 54, 'second_button_second_button_name', 'Our aim'),
(147, 54, '_second_button_second_button_name', 'field_5b6a45055a1cf'),
(148, 54, 'second_button_second_button_url', '#'),
(149, 54, '_second_button_second_button_url', 'field_5b6a45265a1d0'),
(150, 54, 'second_button', ''),
(151, 54, '_second_button', 'field_5b6a44f35a1ce'),
(152, 55, '_edit_last', '1'),
(153, 55, '_edit_lock', '1533784165:1'),
(154, 55, 'cf_home_subtitle', 'architecture+interiors'),
(155, 55, '_cf_home_subtitle', 'field_5b6a434c9e057'),
(156, 55, 'first_button_first_button_name', 'Let\'s Talk'),
(157, 55, '_first_button_first_button_name', 'field_5b6a43ce9e059'),
(158, 55, 'first_button_first_button_url', '#'),
(159, 55, '_first_button_first_button_url', 'field_5b6a43e49e05a'),
(160, 55, 'first_button', ''),
(161, 55, '_first_button', 'field_5b6a43bc9e058'),
(162, 55, 'second_button_second_button_name', 'Our aim'),
(163, 55, '_second_button_second_button_name', 'field_5b6a45055a1cf'),
(164, 55, 'second_button_second_button_url', '#'),
(165, 55, '_second_button_second_button_url', 'field_5b6a45265a1d0'),
(166, 55, 'second_button', ''),
(167, 55, '_second_button', 'field_5b6a44f35a1ce'),
(168, 56, '_wp_attached_file', '2018/08/Creating-living-spaces.jpg'),
(169, 56, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:678;s:6:"height";i:610;s:4:"file";s:34:"2018/08/Creating-living-spaces.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:34:"Creating-living-spaces-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:34:"Creating-living-spaces-300x270.jpg";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(170, 56, '_wp_attachment_image_alt', 'Creating living spaces'),
(171, 55, '_thumbnail_id', '56'),
(172, 57, '_wp_attached_file', '2018/08/Crafting-the-new-age-of-aged-care.jpg'),
(173, 57, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:678;s:6:"height";i:610;s:4:"file";s:45:"2018/08/Crafting-the-new-age-of-aged-care.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:45:"Crafting-the-new-age-of-aged-care-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:45:"Crafting-the-new-age-of-aged-care-300x270.jpg";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(174, 57, '_wp_attachment_image_alt', 'Crafting the new age of aged care'),
(175, 54, '_thumbnail_id', '57'),
(176, 58, '_wp_attached_file', '2018/08/Celebrating-life-and-community.jpg'),
(177, 58, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:678;s:6:"height";i:610;s:4:"file";s:42:"2018/08/Celebrating-life-and-community.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:42:"Celebrating-life-and-community-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:42:"Celebrating-life-and-community-300x270.jpg";s:5:"width";i:300;s:6:"height";i:270;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(178, 58, '_wp_attachment_image_alt', 'Celebrating life and community'),
(179, 38, '_thumbnail_id', '58'),
(180, 9, '_wp_page_template', 'index.php'),
(181, 62, '_edit_last', '1'),
(182, 62, '_edit_lock', '1533886220:1'),
(185, 9, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(186, 9, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(187, 9, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(188, 9, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(189, 9, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(190, 9, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(191, 9, 'cf_home_featured_work', ''),
(192, 9, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(193, 68, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(194, 68, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(195, 68, 'cf_home_featured_work_cf_home_featured_work_shortcode', ''),
(196, 68, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(197, 68, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(198, 68, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(199, 68, 'cf_home_featured_work', ''),
(200, 68, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(201, 69, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(202, 69, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(203, 69, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(204, 69, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(205, 69, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(206, 69, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(207, 69, 'cf_home_featured_work', ''),
(208, 69, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(209, 9, 'cf_home_lets_talk_cf_home_lets_talk_description', 'Lorem ipsum dolor sit amet consectetur apippicing elit\r\nsed do color euismot tempor incididunt'),
(210, 9, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(211, 9, 'cf_home_lets_talk_cf_home_lets_talk_title', 'Let\'s talk'),
(212, 9, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(213, 9, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', '[gravityform id="1" title="true" description="false" ajax="true"]'),
(214, 9, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(215, 9, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(216, 9, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(217, 9, 'cf_home_lets_talk', ''),
(218, 9, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(219, 75, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(220, 75, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(221, 75, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(222, 75, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(223, 75, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(224, 75, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(225, 75, 'cf_home_featured_work', ''),
(226, 75, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(227, 75, 'cf_home_lets_talk_cf_home_lets_talk_description', ''),
(228, 75, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(229, 75, 'cf_home_lets_talk_cf_home_lets_talk_title', ''),
(230, 75, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(231, 75, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', ''),
(232, 75, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(233, 75, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(234, 75, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(235, 75, 'cf_home_lets_talk', ''),
(236, 75, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(237, 9, 'cf_home_lets_talk_cf_home_maps_data', ''),
(238, 9, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(239, 77, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(240, 77, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(241, 77, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(242, 77, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(243, 77, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(244, 77, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(245, 77, 'cf_home_featured_work', ''),
(246, 77, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(247, 77, 'cf_home_lets_talk_cf_home_lets_talk_description', ''),
(248, 77, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(249, 77, 'cf_home_lets_talk_cf_home_lets_talk_title', ''),
(250, 77, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(251, 77, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', ''),
(252, 77, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(253, 77, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(254, 77, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(255, 77, 'cf_home_lets_talk', ''),
(256, 77, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(257, 77, 'cf_home_lets_talk_cf_home_maps_data', ''),
(258, 77, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(259, 78, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(260, 78, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(261, 78, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(262, 78, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(263, 78, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(264, 78, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(265, 78, 'cf_home_featured_work', ''),
(266, 78, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(267, 78, 'cf_home_lets_talk_cf_home_lets_talk_description', ''),
(268, 78, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(269, 78, 'cf_home_lets_talk_cf_home_lets_talk_title', ''),
(270, 78, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(271, 78, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', ''),
(272, 78, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(273, 78, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(274, 78, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(275, 78, 'cf_home_lets_talk', ''),
(276, 78, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(277, 78, 'cf_home_lets_talk_cf_home_maps_data', ''),
(278, 78, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(279, 80, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(280, 80, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(281, 80, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(282, 80, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(283, 80, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(284, 80, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(285, 80, 'cf_home_featured_work', ''),
(286, 80, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(287, 80, 'cf_home_lets_talk_cf_home_lets_talk_description', ''),
(288, 80, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(289, 80, 'cf_home_lets_talk_cf_home_lets_talk_title', ''),
(290, 80, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(291, 80, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', ''),
(292, 80, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(293, 80, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(294, 80, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(295, 80, 'cf_home_lets_talk', ''),
(296, 80, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(297, 80, 'cf_home_lets_talk_cf_home_maps_data', ''),
(298, 80, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(299, 81, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(300, 81, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(301, 81, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(302, 81, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(303, 81, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(304, 81, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(305, 81, 'cf_home_featured_work', ''),
(306, 81, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(307, 81, 'cf_home_lets_talk_cf_home_lets_talk_description', ''),
(308, 81, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(309, 81, 'cf_home_lets_talk_cf_home_lets_talk_title', ''),
(310, 81, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(311, 81, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', ''),
(312, 81, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(313, 81, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(314, 81, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(315, 81, 'cf_home_lets_talk', ''),
(316, 81, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(317, 81, 'cf_home_lets_talk_cf_home_maps_data', ''),
(318, 81, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(319, 82, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(320, 82, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(321, 82, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(322, 82, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(323, 82, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(324, 82, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(325, 82, 'cf_home_featured_work', ''),
(326, 82, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(327, 82, 'cf_home_lets_talk_cf_home_lets_talk_description', 'Lorem ipsum dolor sit amet consectetur apippicing elit\r\nsed do color euismot tempor incididunt'),
(328, 82, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(329, 82, 'cf_home_lets_talk_cf_home_lets_talk_title', 'Let\'s talk'),
(330, 82, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(331, 82, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', '[gravityform id="1" title="true" description="false" ajax="true"]'),
(332, 82, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(333, 82, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(334, 82, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(335, 82, 'cf_home_lets_talk', ''),
(336, 82, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(337, 82, 'cf_home_lets_talk_cf_home_maps_data', ''),
(338, 82, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(339, 83, '_edit_lock', '1533721207:1'),
(340, 83, '_wp_trash_meta_status', 'publish'),
(341, 83, '_wp_trash_meta_time', '1533721252'),
(342, 84, '_wp_trash_meta_status', 'publish'),
(343, 84, '_wp_trash_meta_time', '1533721291'),
(344, 85, '_wp_attached_file', '2018/08/logo.svg'),
(345, 86, '_wp_trash_meta_status', 'publish'),
(346, 86, '_wp_trash_meta_time', '1533779606'),
(347, 87, '_edit_last', '1'),
(348, 87, '_edit_lock', '1533873476:1'),
(349, 95, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(350, 95, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(351, 95, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(352, 95, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(353, 95, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(354, 95, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(355, 95, 'cf_home_featured_work', ''),
(356, 95, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(357, 95, 'cf_home_lets_talk_cf_home_lets_talk_description', 'Lorem ipsum dolor sit amet consectetur apippicing elit\r\nsed do color euismot tempor incididunt'),
(358, 95, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(359, 95, 'cf_home_lets_talk_cf_home_lets_talk_title', 'Let\'s talk'),
(360, 95, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(361, 95, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', '[gravityform id="1" title="true" description="false" ajax="true"]'),
(362, 95, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(363, 95, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(364, 95, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(365, 95, 'cf_home_lets_talk', ''),
(366, 95, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(367, 95, 'cf_home_lets_talk_cf_home_maps_data', ''),
(368, 95, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(369, 97, '_edit_last', '1'),
(370, 97, '_edit_lock', '1533871697:1'),
(371, 99, '_edit_last', '1'),
(372, 99, '_edit_lock', '1533873177:1'),
(373, 100, '_wp_attached_file', '2018/08/Projects1.jpg'),
(374, 100, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:448;s:6:"height";i:448;s:4:"file";s:21:"2018/08/Projects1.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"Projects1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"Projects1-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(375, 100, '_wp_attachment_image_alt', 'Projects1'),
(376, 99, '_thumbnail_id', '100'),
(377, 99, 'projects_subtitle', 'Bupa'),
(378, 99, '_projects_subtitle', 'field_5b6be557c40bc'),
(379, 101, '_edit_last', '1'),
(380, 101, '_edit_lock', '1533873177:1'),
(381, 102, '_wp_attached_file', '2018/08/Projects2.jpg'),
(382, 102, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:448;s:6:"height";i:448;s:4:"file";s:21:"2018/08/Projects2.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"Projects2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"Projects2-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(383, 101, '_thumbnail_id', '102'),
(384, 101, 'projects_subtitle', 'Bupa'),
(385, 101, '_projects_subtitle', 'field_5b6be557c40bc'),
(386, 103, '_edit_last', '1'),
(387, 103, '_edit_lock', '1533873176:1'),
(388, 104, '_wp_attached_file', '2018/08/Projects3.jpg'),
(389, 104, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:448;s:6:"height";i:448;s:4:"file";s:21:"2018/08/Projects3.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"Projects3-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"Projects3-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(390, 103, '_thumbnail_id', '104'),
(391, 103, 'projects_subtitle', 'Bupa'),
(392, 103, '_projects_subtitle', 'field_5b6be557c40bc'),
(393, 105, '_edit_last', '1'),
(394, 105, '_edit_lock', '1533873176:1'),
(395, 106, '_wp_attached_file', '2018/08/Projects4.jpg'),
(396, 106, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:448;s:6:"height";i:448;s:4:"file";s:21:"2018/08/Projects4.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"Projects4-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"Projects4-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(397, 105, '_thumbnail_id', '106'),
(398, 105, 'projects_subtitle', 'Bupa'),
(399, 105, '_projects_subtitle', 'field_5b6be557c40bc'),
(400, 107, '_edit_last', '1'),
(401, 107, '_edit_lock', '1533873175:1'),
(402, 108, '_wp_attached_file', '2018/08/Projects5.jpg'),
(403, 108, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:448;s:6:"height";i:448;s:4:"file";s:21:"2018/08/Projects5.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"Projects5-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"Projects5-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(404, 107, '_thumbnail_id', '108'),
(405, 107, 'projects_subtitle', 'Bupa'),
(406, 107, '_projects_subtitle', 'field_5b6be557c40bc'),
(407, 109, '_edit_last', '1'),
(408, 109, '_edit_lock', '1533883874:1'),
(409, 110, '_wp_attached_file', '2018/08/Projects6.jpg'),
(410, 110, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:448;s:6:"height";i:448;s:4:"file";s:21:"2018/08/Projects6.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:21:"Projects6-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:21:"Projects6-300x300.jpg";s:5:"width";i:300;s:6:"height";i:300;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(411, 109, '_thumbnail_id', '110'),
(412, 109, 'projects_subtitle', 'Bupa'),
(413, 109, '_projects_subtitle', 'field_5b6be557c40bc'),
(414, 109, 'icon_blocks_cf_residents_icon', ''),
(415, 109, '_icon_blocks_cf_residents_icon', 'field_5b6d02b493233'),
(416, 109, 'icon_blocks_cf_residents_info', '120'),
(417, 109, '_icon_blocks_cf_residents_info', 'field_5b6d02c793234'),
(418, 109, 'icon_blocks_cf_area_icon', ''),
(419, 109, '_icon_blocks_cf_area_icon', 'field_5b6d02e393235'),
(420, 109, 'icon_blocks_cf_area_info', '980'),
(421, 109, '_icon_blocks_cf_area_info', 'field_5b6d02f993236'),
(422, 109, 'icon_blocks_cf_completed_year_icon', '') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(423, 109, '_icon_blocks_cf_completed_year_icon', 'field_5b6d031293237'),
(424, 109, 'icon_blocks_cf_completed_year_text', '2012'),
(425, 109, '_icon_blocks_cf_completed_year_text', 'field_5b6d032893238'),
(426, 109, 'icon_blocks', ''),
(427, 109, '_icon_blocks', 'field_5b6d02a093232'),
(428, 109, 'cf_projects_gallery', 'a:4:{i:0;s:3:"108";i:1;s:3:"106";i:2;s:3:"104";i:3;s:3:"102";}'),
(429, 109, '_cf_projects_gallery', 'field_5b6d03a0f0e55'),
(430, 107, 'practice_area', 'architecture'),
(431, 107, '_practice_area', 'field_5b6d067fbb611'),
(432, 107, 'icon_blocks_cf_residents_icon', ''),
(433, 107, '_icon_blocks_cf_residents_icon', 'field_5b6d02b493233'),
(434, 107, 'icon_blocks_cf_residents_info', '120'),
(435, 107, '_icon_blocks_cf_residents_info', 'field_5b6d02c793234'),
(436, 107, 'icon_blocks_cf_area_icon', ''),
(437, 107, '_icon_blocks_cf_area_icon', 'field_5b6d02e393235'),
(438, 107, 'icon_blocks_cf_area_info', '980'),
(439, 107, '_icon_blocks_cf_area_info', 'field_5b6d02f993236'),
(440, 107, 'icon_blocks_cf_completed_year_icon', ''),
(441, 107, '_icon_blocks_cf_completed_year_icon', 'field_5b6d031293237'),
(442, 107, 'icon_blocks_cf_completed_year_text', '2012'),
(443, 107, '_icon_blocks_cf_completed_year_text', 'field_5b6d032893238'),
(444, 107, 'icon_blocks', ''),
(445, 107, '_icon_blocks', 'field_5b6d02a093232'),
(446, 107, 'cf_projects_gallery', 'a:6:{i:0;s:3:"110";i:1;s:3:"108";i:2;s:3:"106";i:3;s:3:"104";i:4;s:3:"102";i:5;s:3:"100";}'),
(447, 107, '_cf_projects_gallery', 'field_5b6d03a0f0e55'),
(448, 105, 'practice_area', 'architecture'),
(449, 105, '_practice_area', 'field_5b6d067fbb611'),
(450, 105, 'icon_blocks_cf_residents_icon', ''),
(451, 105, '_icon_blocks_cf_residents_icon', 'field_5b6d02b493233'),
(452, 105, 'icon_blocks_cf_residents_info', '120'),
(453, 105, '_icon_blocks_cf_residents_info', 'field_5b6d02c793234'),
(454, 105, 'icon_blocks_cf_area_icon', ''),
(455, 105, '_icon_blocks_cf_area_icon', 'field_5b6d02e393235'),
(456, 105, 'icon_blocks_cf_area_info', '980'),
(457, 105, '_icon_blocks_cf_area_info', 'field_5b6d02f993236'),
(458, 105, 'icon_blocks_cf_completed_year_icon', ''),
(459, 105, '_icon_blocks_cf_completed_year_icon', 'field_5b6d031293237'),
(460, 105, 'icon_blocks_cf_completed_year_text', '2012'),
(461, 105, '_icon_blocks_cf_completed_year_text', 'field_5b6d032893238'),
(462, 105, 'icon_blocks', ''),
(463, 105, '_icon_blocks', 'field_5b6d02a093232'),
(464, 105, 'cf_projects_gallery', 'a:8:{i:0;s:3:"110";i:1;s:3:"108";i:2;s:3:"106";i:3;s:3:"104";i:4;s:3:"102";i:5;s:3:"100";i:6;s:2:"57";i:7;s:2:"58";}'),
(465, 105, '_cf_projects_gallery', 'field_5b6d03a0f0e55'),
(466, 103, 'practice_area', 'architecture'),
(467, 103, '_practice_area', 'field_5b6d067fbb611'),
(468, 103, 'icon_blocks_cf_residents_icon', ''),
(469, 103, '_icon_blocks_cf_residents_icon', 'field_5b6d02b493233'),
(470, 103, 'icon_blocks_cf_residents_info', '120'),
(471, 103, '_icon_blocks_cf_residents_info', 'field_5b6d02c793234'),
(472, 103, 'icon_blocks_cf_area_icon', ''),
(473, 103, '_icon_blocks_cf_area_icon', 'field_5b6d02e393235'),
(474, 103, 'icon_blocks_cf_area_info', '980'),
(475, 103, '_icon_blocks_cf_area_info', 'field_5b6d02f993236'),
(476, 103, 'icon_blocks_cf_completed_year_icon', ''),
(477, 103, '_icon_blocks_cf_completed_year_icon', 'field_5b6d031293237'),
(478, 103, 'icon_blocks_cf_completed_year_text', '2012'),
(479, 103, '_icon_blocks_cf_completed_year_text', 'field_5b6d032893238'),
(480, 103, 'icon_blocks', ''),
(481, 103, '_icon_blocks', 'field_5b6d02a093232'),
(482, 103, 'cf_projects_gallery', 'a:7:{i:0;s:3:"110";i:1;s:3:"108";i:2;s:3:"104";i:3;s:3:"102";i:4;s:3:"106";i:5;s:2:"58";i:6;s:2:"57";}'),
(483, 103, '_cf_projects_gallery', 'field_5b6d03a0f0e55'),
(484, 101, 'practice_area', 'architecture'),
(485, 101, '_practice_area', 'field_5b6d067fbb611'),
(486, 101, 'icon_blocks_cf_residents_icon', ''),
(487, 101, '_icon_blocks_cf_residents_icon', 'field_5b6d02b493233'),
(488, 101, 'icon_blocks_cf_residents_info', '120'),
(489, 101, '_icon_blocks_cf_residents_info', 'field_5b6d02c793234'),
(490, 101, 'icon_blocks_cf_area_icon', ''),
(491, 101, '_icon_blocks_cf_area_icon', 'field_5b6d02e393235'),
(492, 101, 'icon_blocks_cf_area_info', '980'),
(493, 101, '_icon_blocks_cf_area_info', 'field_5b6d02f993236'),
(494, 101, 'icon_blocks_cf_completed_year_icon', ''),
(495, 101, '_icon_blocks_cf_completed_year_icon', 'field_5b6d031293237'),
(496, 101, 'icon_blocks_cf_completed_year_text', '2012'),
(497, 101, '_icon_blocks_cf_completed_year_text', 'field_5b6d032893238'),
(498, 101, 'icon_blocks', ''),
(499, 101, '_icon_blocks', 'field_5b6d02a093232'),
(500, 101, 'cf_projects_gallery', 'a:6:{i:0;s:3:"108";i:1;s:3:"110";i:2;s:3:"104";i:3;s:3:"106";i:4;s:3:"102";i:5;s:3:"100";}'),
(501, 101, '_cf_projects_gallery', 'field_5b6d03a0f0e55'),
(502, 99, 'practice_area', 'architecture'),
(503, 99, '_practice_area', 'field_5b6d067fbb611'),
(504, 99, 'icon_blocks_cf_residents_icon', ''),
(505, 99, '_icon_blocks_cf_residents_icon', 'field_5b6d02b493233'),
(506, 99, 'icon_blocks_cf_residents_info', '120'),
(507, 99, '_icon_blocks_cf_residents_info', 'field_5b6d02c793234'),
(508, 99, 'icon_blocks_cf_area_icon', ''),
(509, 99, '_icon_blocks_cf_area_icon', 'field_5b6d02e393235'),
(510, 99, 'icon_blocks_cf_area_info', '980'),
(511, 99, '_icon_blocks_cf_area_info', 'field_5b6d02f993236'),
(512, 99, 'icon_blocks_cf_completed_year_icon', ''),
(513, 99, '_icon_blocks_cf_completed_year_icon', 'field_5b6d031293237'),
(514, 99, 'icon_blocks_cf_completed_year_text', '2012'),
(515, 99, '_icon_blocks_cf_completed_year_text', 'field_5b6d032893238'),
(516, 99, 'icon_blocks', ''),
(517, 99, '_icon_blocks', 'field_5b6d02a093232'),
(518, 99, 'cf_projects_gallery', 'a:6:{i:0;s:3:"108";i:1;s:3:"110";i:2;s:3:"106";i:3;s:3:"104";i:4;s:3:"102";i:5;s:3:"100";}'),
(519, 99, '_cf_projects_gallery', 'field_5b6d03a0f0e55'),
(520, 11, '_wp_page_template', 'default'),
(521, 123, '_edit_last', '1'),
(522, 123, '_edit_lock', '1533877689:1') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(523, 11, 'about_info_block_cf_architecture_block', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem '),
(524, 11, '_about_info_block_cf_architecture_block', 'field_5b6d0d72cceb4'),
(525, 11, 'about_info_block_cf_interiors_block', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet.\r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem '),
(526, 11, '_about_info_block_cf_interiors_block', 'field_5b6d0d82cceb5'),
(527, 11, 'about_info_block', ''),
(528, 11, '_about_info_block', 'field_5b6d0d4bcceb3'),
(529, 127, 'about_info_block_cf_architecture_block', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem '),
(530, 127, '_about_info_block_cf_architecture_block', 'field_5b6d0d72cceb4'),
(531, 127, 'about_info_block_cf_interiors_block', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet.\r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem '),
(532, 127, '_about_info_block_cf_interiors_block', 'field_5b6d0d82cceb5'),
(533, 127, 'about_info_block', ''),
(534, 127, '_about_info_block', 'field_5b6d0d4bcceb3'),
(535, 128, '_wp_attached_file', '2018/08/about-banner.jpg'),
(536, 128, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:907;s:6:"height";i:381;s:4:"file";s:24:"2018/08/about-banner.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:24:"about-banner-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:24:"about-banner-300x126.jpg";s:5:"width";i:300;s:6:"height";i:126;s:9:"mime-type";s:10:"image/jpeg";}s:12:"medium_large";a:4:{s:4:"file";s:24:"about-banner-768x323.jpg";s:5:"width";i:768;s:6:"height";i:323;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:1:"0";s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";s:1:"0";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"0";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:1:"0";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(537, 128, '_wp_attachment_image_alt', 'about-banner'),
(538, 11, '_thumbnail_id', '128'),
(539, 134, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(540, 134, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(541, 134, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(542, 134, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(543, 134, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(544, 134, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(545, 134, 'cf_home_featured_work', ''),
(546, 134, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(547, 134, 'cf_home_lets_talk_cf_home_lets_talk_description', 'Lorem ipsum dolor sit amet consectetur apippicing elit\r\nsed do color euismot tempor incididunt'),
(548, 134, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(549, 134, 'cf_home_lets_talk_cf_home_lets_talk_title', 'Let\'s talk'),
(550, 134, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(551, 134, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', '[gravityform id="1" title="true" description="false" ajax="false"]'),
(552, 134, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(553, 134, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(554, 134, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(555, 134, 'cf_home_lets_talk', ''),
(556, 134, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(557, 134, 'cf_home_lets_talk_cf_home_maps_data', ''),
(558, 134, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(559, 135, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(560, 135, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(561, 135, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(562, 135, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(563, 135, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(564, 135, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(565, 135, 'cf_home_featured_work', ''),
(566, 135, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(567, 135, 'cf_home_lets_talk_cf_home_lets_talk_description', 'Lorem ipsum dolor sit amet consectetur apippicing elit\r\nsed do color euismot tempor incididunt'),
(568, 135, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(569, 135, 'cf_home_lets_talk_cf_home_lets_talk_title', 'Let\'s talk'),
(570, 135, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(571, 135, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', '[gravityform id="1" title="true" description="false" ajax="true"]'),
(572, 135, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(573, 135, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(574, 135, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(575, 135, 'cf_home_lets_talk', ''),
(576, 135, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(577, 135, 'cf_home_lets_talk_cf_home_maps_data', ''),
(578, 135, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(579, 137, '_menu_item_type', 'custom'),
(580, 137, '_menu_item_menu_item_parent', '0'),
(581, 137, '_menu_item_object_id', '137'),
(582, 137, '_menu_item_object', 'custom'),
(583, 137, '_menu_item_target', ''),
(584, 137, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(585, 137, '_menu_item_xfn', ''),
(586, 137, '_menu_item_url', 'tel:0296989822'),
(588, 138, '_menu_item_type', 'custom'),
(589, 138, '_menu_item_menu_item_parent', '0'),
(590, 138, '_menu_item_object_id', '138'),
(591, 138, '_menu_item_object', 'custom'),
(592, 138, '_menu_item_target', ''),
(593, 138, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(594, 138, '_menu_item_xfn', ''),
(595, 138, '_menu_item_url', 'mailto:ishor@naphix.com.au'),
(597, 139, '_edit_last', '1'),
(598, 139, '_wp_page_template', 'default'),
(599, 139, '_edit_lock', '1533883976:1'),
(600, 141, '_menu_item_type', 'post_type'),
(601, 141, '_menu_item_menu_item_parent', '0'),
(602, 141, '_menu_item_object_id', '139'),
(603, 141, '_menu_item_object', 'page'),
(604, 141, '_menu_item_target', ''),
(605, 141, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(606, 141, '_menu_item_xfn', ''),
(607, 141, '_menu_item_url', ''),
(609, 9, 'cf_home_lets_talk_cf_home_maps_address', 'Calder Flower Architects Pty Ltd'),
(610, 9, '_cf_home_lets_talk_cf_home_maps_address', 'field_5b6a76c5a999c'),
(611, 9, 'cf_home_lets_talk_cf_home_maps_information', 'Calder Flower Architects Pty Ltd'),
(612, 9, '_cf_home_lets_talk_cf_home_maps_information', 'field_5b6d3aeab95df'),
(613, 143, 'cf_home_featured_work_cf_home_featured_work_title', 'Featured work'),
(614, 143, '_cf_home_featured_work_cf_home_featured_work_title', 'field_5b6a50280c93d'),
(615, 143, 'cf_home_featured_work_cf_home_featured_work_shortcode', '[ cf-home-featured-work ]'),
(616, 143, '_cf_home_featured_work_cf_home_featured_work_shortcode', 'field_5b6a50580c93e'),
(617, 143, 'cf_home_featured_work_cf_home_see_more_url', '#'),
(618, 143, '_cf_home_featured_work_cf_home_see_more_url', 'field_5b6a50920c93f'),
(619, 143, 'cf_home_featured_work', ''),
(620, 143, '_cf_home_featured_work', 'field_5b6a500a0c93c'),
(621, 143, 'cf_home_lets_talk_cf_home_lets_talk_description', 'Lorem ipsum dolor sit amet consectetur apippicing elit\r\nsed do color euismot tempor incididunt'),
(622, 143, '_cf_home_lets_talk_cf_home_lets_talk_description', 'field_5b6a7624a9999'),
(623, 143, 'cf_home_lets_talk_cf_home_lets_talk_title', 'Let\'s talk'),
(624, 143, '_cf_home_lets_talk_cf_home_lets_talk_title', 'field_5b6a765aa999a'),
(625, 143, 'cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', '[gravityform id="1" title="true" description="false" ajax="true"]') ;
INSERT INTO `wp_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(626, 143, '_cf_home_lets_talk_cf_home_leave_us_an_enquiry_form', 'field_5b6a7678a999b'),
(627, 143, 'cf_home_lets_talk_cf_home_maps', 'a:3:{s:7:"address";s:51:"356-362 King St, West Melbourne VIC 3003, Australia";s:3:"lat";s:19:"-37.808311249238066";s:3:"lng";s:18:"144.95224539211267";}'),
(628, 143, '_cf_home_lets_talk_cf_home_maps', 'field_5b6a76c5a999c'),
(629, 143, 'cf_home_lets_talk', ''),
(630, 143, '_cf_home_lets_talk', 'field_5b6a75faa9998'),
(631, 143, 'cf_home_lets_talk_cf_home_maps_data', ''),
(632, 143, '_cf_home_lets_talk_cf_home_maps_data', 'field_5b6a76c5a999c'),
(633, 143, 'cf_home_lets_talk_cf_home_maps_address', 'Calder Flower Architects Pty Ltd'),
(634, 143, '_cf_home_lets_talk_cf_home_maps_address', 'field_5b6a76c5a999c'),
(635, 143, 'cf_home_lets_talk_cf_home_maps_information', 'Calder Flower Architects Pty Ltd'),
(636, 143, '_cf_home_lets_talk_cf_home_maps_information', 'field_5b6d3aeab95df'),
(637, 144, '_wp_trash_meta_status', 'publish'),
(638, 144, '_wp_trash_meta_time', '1533886511') ;

#
# End of data contents of table `wp_postmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_posts`
#

DROP TABLE IF EXISTS `wp_posts`;


#
# Table structure of table `wp_posts`
#

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_posts`
#
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2018-08-06 04:29:12', '2018-08-06 04:29:12', 'Welcome to WordPress. This is your first post. Edit or delete it, then start writing!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2018-08-06 04:29:12', '2018-08-06 04:29:12', '', 0, 'http://dev7.naphix.com/calderflower/?p=1', 0, 'post', '', 1),
(4, 1, '2018-08-06 04:30:30', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-06 04:30:30', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?p=4', 0, 'post', '', 0),
(5, 1, '2018-08-06 04:54:56', '0000-00-00 00:00:00', '<!-- wp:cover-image {"url":"https://cldup.com/Fz-ASbo2s3.jpg","align":"wide"} -->\n<div class="wp-block-cover-image has-background-dim alignwide" style="background-image:url(https://cldup.com/Fz-ASbo2s3.jpg)"><p class="wp-block-cover-image-text">Of Mountains &amp; Printing Presses</p></div>\n<!-- /wp:cover-image -->\n\n<!-- wp:paragraph -->\n<p>The goal of this new editor is to make adding rich content to WordPress simple and enjoyable. This whole post is composed of <em>pieces of content</em>—somewhat similar to LEGO bricks—that you can move around and interact with. Move your cursor around and you\'ll notice the different blocks light up with outlines and arrows. Press the arrows to reposition blocks quickly, without fearing about losing things in the process of copying and pasting.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>What you are reading now is a <strong>text block</strong>, the most basic block of all. The text block has its own controls to be moved freely around the post...</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {"align":"right"} -->\n<p style="text-align:right">... like this one, which is right aligned.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Headings are separate blocks as well, which helps with the outline and organization of your content.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>A Picture is worth a Thousand Words</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Handling images and media with the utmost care is a primary focus of the new editor. Hopefully, you\'ll find aspects of adding captions or going full-width with your pictures much easier and robust than before.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"align":"center"} -->\n<figure class="wp-block-image aligncenter"><img src="https://cldup.com/cXyG__fTLN.jpg" alt="Beautiful landscape"/><figcaption>If your theme supports it, you\'ll see the "wide" button on the image toolbar. Give it a try.</figcaption></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Try selecting and removing or editing the caption, now you don\'t have to be careful about selecting the image or other text by mistake and ruining the presentation.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>The <em>Inserter</em> Tool</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>Imagine everything that WordPress can do is available to you quickly and in the same place on the interface. No need to figure out HTML tags, classes, or remember complicated shortcode syntax. That\'s the spirit behind the inserter—the <code>(+)</code> button you\'ll see around the editor—which allows you to browse all available content blocks and add them into your post. Plugins and themes are able to register their own, opening up all sort of possibilities for rich editing and publishing.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Go give it a try, you may discover things WordPress can already add into your posts that you didn\'t know about. Here\'s a short list of what you can currently find there:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:list -->\n<ul><li>Text &amp; Headings</li><li>Images &amp; Videos</li><li>Galleries</li><li>Embeds, like YouTube, Tweets, or other WordPress posts.</li><li>Layout blocks, like Buttons, Hero Images, Separators, etc.</li><li>And <em>Lists</em> like this one of course :)</li></ul>\n<!-- /wp:list -->\n\n<!-- wp:separator -->\n<hr class="wp-block-separator"/>\n<!-- /wp:separator -->\n\n<!-- wp:heading -->\n<h2>Visual Editing</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>A huge benefit of blocks is that you can edit them in place and manipulate your content directly. Instead of having fields for editing things like the source of a quote, or the text of a button, you can directly change the content. Try editing the following quote:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class="wp-block-quote"><p>The editor will endeavour to create a new page and post building experience that makes writing rich posts effortless, and has “blocks” to make it easy what today might take shortcodes, custom HTML, or “mystery meat” embed discovery.</p><cite>Matt Mullenweg, 2017</cite></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>The information corresponding to the source of the quote is a separate text field, similar to captions under images, so the structure of the quote is protected even if you select, modify, or remove the source. It\'s always easy to add it back.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Blocks can be anything you need. For instance, you may want to add a subdued quote as part of the composition of your text, or you may prefer to display a giant stylized one. All of these options are available in the inserter.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {"columns":2} -->\n<ul class="wp-block-gallery columns-2 is-cropped"><li class="blocks-gallery-item"><figure><img src="https://cldup.com/n0g6ME5VKC.jpg" alt=""/></figure></li><li class="blocks-gallery-item"><figure><img src="https://cldup.com/ZjESfxPI3R.jpg" alt=""/></figure></li><li class="blocks-gallery-item"><figure><img src="https://cldup.com/EKNF8xD2UM.jpg" alt=""/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p>You can change the amount of columns in your galleries by dragging a slider in the block inspector in the sidebar.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:heading -->\n<h2>Media Rich</h2>\n<!-- /wp:heading -->\n\n<!-- wp:paragraph -->\n<p>If you combine the new <strong>wide</strong> and <strong>full-wide</strong> alignments with galleries, you can create a very media rich layout, very quickly:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:image {"align":"full"} -->\n<figure class="wp-block-image alignfull"><img src="https://cldup.com/8lhI-gKnI2.jpg" alt="Accessibility is important don\'t forget image alt attribute"/></figure>\n<!-- /wp:image -->\n\n<!-- wp:paragraph -->\n<p>Sure, the full-wide image can be pretty big. But sometimes the image is worth it.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:gallery {"align":"wide"} -->\n<ul class="wp-block-gallery alignwide columns-2 is-cropped"><li class="blocks-gallery-item"><figure><img src="https://cldup.com/_rSwtEeDGD.jpg" alt=""/></figure></li><li class="blocks-gallery-item"><figure><img src="https://cldup.com/L-cC3qX2DN.jpg" alt=""/></figure></li></ul>\n<!-- /wp:gallery -->\n\n<!-- wp:paragraph -->\n<p>The above is a gallery with just two images. It\'s an easier way to create visually appealing layouts, without having to deal with floats. You can also easily convert the gallery back to individual images again, by using the block switcher.</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>Any block can opt into these alignments. The embed block has them also, and is responsive out of the box:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:core-embed/vimeo {"url":"https://vimeo.com/22439234","type":"video","providerNameSlug":"vimeo","align":"wide"} -->\n<figure class="wp-block-embed-vimeo alignwide wp-block-embed is-type-video is-provider-vimeo">\nhttps://vimeo.com/22439234\n</figure>\n<!-- /wp:core-embed/vimeo -->\n\n<!-- wp:paragraph -->\n<p>You can build any block you like, static or dynamic, decorative or plain. Here\'s a pullquote block:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:pullquote -->\n<blockquote class="wp-block-pullquote"><p>Code is Poetry</p><cite>The WordPress community</cite></blockquote>\n<!-- /wp:pullquote -->\n\n<!-- wp:paragraph {"align":"center"} -->\n<p style="text-align:center"><em>If you want to learn more about how to build additional blocks, or if you are interested in helping with the project, head over to the <a href="https://github.com/WordPress/gutenberg">GitHub repository</a>.</em></p>\n<!-- /wp:paragraph -->\n\n<!-- wp:button {"align":"center"} -->\n<div class="wp-block-button aligncenter"><a class="wp-block-button__link" href="https://github.com/WordPress/gutenberg">Help build Gutenberg</a></div>\n<!-- /wp:button -->\n\n<!-- wp:separator -->\n<hr class="wp-block-separator"/>\n<!-- /wp:separator -->\n\n<!-- wp:paragraph {"align":"center"} -->\n<p style="text-align:center">Thanks for testing Gutenberg!</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph {"align":"center"} -->\n<p style="text-align:center"><img draggable="false" class="emoji" alt="👋" src="https://s.w.org/images/core/emoji/2.3/svg/1f44b.svg"/></p>\n<!-- /wp:paragraph -->', 'Welcome to the Gutenberg Editor', '', 'draft', 'open', 'open', '', '', '', '', '2018-08-06 04:54:56', '2018-08-06 04:54:56', '', 0, 'http://dev7.naphix.com/calderflower/?p=5', 0, 'post', '', 0),
(6, 1, '2018-08-06 04:55:44', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-06 04:55:44', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?p=6', 0, 'post', '', 0),
(9, 1, '2018-08-06 07:18:17', '2018-08-06 07:18:17', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-08-10 07:22:18', '2018-08-10 07:22:18', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=9', 0, 'page', '', 0),
(10, 1, '2018-08-06 07:18:17', '2018-08-06 07:18:17', '', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-06 07:18:17', '2018-08-06 07:18:17', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2018-08-06 07:18:29', '2018-08-06 07:18:29', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut ', 'About Us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2018-08-10 04:02:48', '2018-08-10 04:02:48', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=11', 0, 'page', '', 0),
(12, 1, '2018-08-06 07:18:29', '2018-08-06 07:18:29', '', 'About Us', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2018-08-06 07:18:29', '2018-08-06 07:18:29', '', 11, 'http://dev7.naphix.com/calderflower/11-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2018-08-06 07:18:40', '2018-08-06 07:18:40', '', 'Meet the team', '', 'publish', 'closed', 'closed', '', 'meet-the-team', '', '', '2018-08-06 07:18:40', '2018-08-06 07:18:40', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=13', 0, 'page', '', 0),
(14, 1, '2018-08-06 07:18:40', '2018-08-06 07:18:40', '', 'Meet the team', '', 'inherit', 'closed', 'closed', '', '13-revision-v1', '', '', '2018-08-06 07:18:40', '2018-08-06 07:18:40', '', 13, 'http://dev7.naphix.com/calderflower/13-revision-v1/', 0, 'revision', '', 0),
(15, 1, '2018-08-06 07:18:49', '2018-08-06 07:18:49', '', 'Projects', '', 'publish', 'closed', 'closed', '', 'projects', '', '', '2018-08-06 07:18:49', '2018-08-06 07:18:49', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=15', 0, 'page', '', 0),
(16, 1, '2018-08-06 07:18:49', '2018-08-06 07:18:49', '', 'Projects', '', 'inherit', 'closed', 'closed', '', '15-revision-v1', '', '', '2018-08-06 07:18:49', '2018-08-06 07:18:49', '', 15, 'http://dev7.naphix.com/calderflower/15-revision-v1/', 0, 'revision', '', 0),
(17, 1, '2018-08-06 07:19:02', '2018-08-06 07:19:02', '', 'Milestones', '', 'publish', 'closed', 'closed', '', 'milestones', '', '', '2018-08-06 07:19:02', '2018-08-06 07:19:02', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=17', 0, 'page', '', 0),
(18, 1, '2018-08-06 07:19:02', '2018-08-06 07:19:02', '', 'Milestones', '', 'inherit', 'closed', 'closed', '', '17-revision-v1', '', '', '2018-08-06 07:19:02', '2018-08-06 07:19:02', '', 17, 'http://dev7.naphix.com/calderflower/17-revision-v1/', 0, 'revision', '', 0),
(19, 1, '2018-08-06 07:19:12', '2018-08-06 07:19:12', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2018-08-06 07:19:12', '2018-08-06 07:19:12', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=19', 0, 'page', '', 0),
(20, 1, '2018-08-06 07:19:12', '2018-08-06 07:19:12', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '19-revision-v1', '', '', '2018-08-06 07:19:12', '2018-08-06 07:19:12', '', 19, 'http://dev7.naphix.com/calderflower/19-revision-v1/', 0, 'revision', '', 0),
(21, 1, '2018-08-06 07:20:53', '2018-08-06 07:20:53', '', 'Contact Us', '', 'publish', 'closed', 'closed', '', 'contact-us', '', '', '2018-08-06 07:20:53', '2018-08-06 07:20:53', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=21', 0, 'page', '', 0),
(22, 1, '2018-08-06 07:20:53', '2018-08-06 07:20:53', '', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2018-08-06 07:20:53', '2018-08-06 07:20:53', '', 21, 'http://dev7.naphix.com/calderflower/21-revision-v1/', 0, 'revision', '', 0),
(23, 1, '2018-08-07 02:52:04', '2018-08-07 02:52:04', '', 'Privacy Policy', '', 'publish', 'closed', 'closed', '', 'privacy-policy', '', '', '2018-08-07 02:52:04', '2018-08-07 02:52:04', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=23', 0, 'page', '', 0),
(24, 1, '2018-08-07 02:52:04', '2018-08-07 02:52:04', '', 'Privacy Policy', '', 'inherit', 'closed', 'closed', '', '23-revision-v1', '', '', '2018-08-07 02:52:04', '2018-08-07 02:52:04', '', 23, 'http://dev7.naphix.com/calderflower/23-revision-v1/', 0, 'revision', '', 0),
(25, 1, '2018-08-07 02:52:28', '2018-08-07 02:52:28', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2018-08-07 02:52:28', '2018-08-07 02:52:28', '', 0, 'http://dev7.naphix.com/calderflower/?p=25', 1, 'nav_menu_item', '', 0),
(26, 1, '2018-08-07 02:52:28', '2018-08-07 02:52:28', ' ', '', '', 'publish', 'closed', 'closed', '', '26', '', '', '2018-08-07 02:52:28', '2018-08-07 02:52:28', '', 0, 'http://dev7.naphix.com/calderflower/?p=26', 2, 'nav_menu_item', '', 0),
(27, 1, '2018-08-07 02:52:28', '2018-08-07 02:52:28', ' ', '', '', 'publish', 'closed', 'closed', '', '27', '', '', '2018-08-07 02:52:28', '2018-08-07 02:52:28', '', 0, 'http://dev7.naphix.com/calderflower/?p=27', 3, 'nav_menu_item', '', 0),
(28, 1, '2018-08-07 02:52:28', '2018-08-07 02:52:28', ' ', '', '', 'publish', 'closed', 'closed', '', '28', '', '', '2018-08-07 02:52:28', '2018-08-07 02:52:28', '', 0, 'http://dev7.naphix.com/calderflower/?p=28', 4, 'nav_menu_item', '', 0),
(29, 1, '2018-08-07 02:52:28', '2018-08-07 02:52:28', ' ', '', '', 'publish', 'closed', 'closed', '', '29', '', '', '2018-08-07 02:52:28', '2018-08-07 02:52:28', '', 0, 'http://dev7.naphix.com/calderflower/?p=29', 5, 'nav_menu_item', '', 0),
(30, 1, '2018-08-07 02:52:29', '2018-08-07 02:52:29', ' ', '', '', 'publish', 'closed', 'closed', '', '30', '', '', '2018-08-07 02:52:29', '2018-08-07 02:52:29', '', 0, 'http://dev7.naphix.com/calderflower/?p=30', 6, 'nav_menu_item', '', 0),
(31, 1, '2018-08-07 02:52:29', '2018-08-07 02:52:29', ' ', '', '', 'publish', 'closed', 'closed', '', '31', '', '', '2018-08-07 02:52:29', '2018-08-07 02:52:29', '', 0, 'http://dev7.naphix.com/calderflower/?p=31', 7, 'nav_menu_item', '', 0),
(32, 1, '2018-08-07 02:52:29', '2018-08-07 02:52:29', ' ', '', '', 'publish', 'closed', 'closed', '', '32', '', '', '2018-08-07 02:52:29', '2018-08-07 02:52:29', '', 0, 'http://dev7.naphix.com/calderflower/?p=32', 8, 'nav_menu_item', '', 0),
(33, 1, '2018-08-07 02:52:29', '2018-08-07 02:52:29', ' ', '', '', 'publish', 'closed', 'closed', '', '33', '', '', '2018-08-07 02:52:29', '2018-08-07 02:52:29', '', 0, 'http://dev7.naphix.com/calderflower/?p=33', 9, 'nav_menu_item', '', 0),
(34, 1, '2018-08-07 07:36:24', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-07 07:36:24', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?p=34', 0, 'post', '', 0),
(35, 1, '2018-08-07 07:37:03', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-07 07:37:03', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?p=35', 0, 'post', '', 0),
(36, 1, '2018-08-07 07:37:06', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-08-07 07:37:06', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?p=36', 0, 'post', '', 0),
(37, 1, '2018-08-07 07:43:26', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-08-07 07:43:26', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=slider&p=37', 0, 'slider', '', 0),
(38, 1, '2018-08-07 07:46:10', '2018-08-07 07:46:10', '', 'Celebrating life and community', '', 'publish', 'closed', 'closed', '', 'celebrating-life-and-community', '', '', '2018-08-08 01:43:23', '2018-08-08 01:43:23', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=slider&#038;p=38', 0, 'slider', '', 0),
(39, 1, '2018-08-07 07:45:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-08-07 07:45:53', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=slider&p=39', 0, 'slider', '', 0),
(40, 1, '2018-08-07 07:45:56', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-08-07 07:45:56', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=slider&p=40', 0, 'slider', '', 0),
(41, 1, '2018-08-07 08:12:56', '2018-08-07 08:12:56', '{"calderflower::linkedin":{"value":"#","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-07 08:12:56"},"calderflower::facebook":{"value":"#","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-07 08:12:56"},"calderflower::pinterest":{"value":"#","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-07 08:12:56"},"calderflower::twitter":{"value":"#","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-07 08:12:56"},"calderflower::instagram":{"value":"#","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-07 08:12:56"}}', '', '', 'trash', 'closed', 'closed', '', '044652b2-8b39-4d1a-a481-2e3cc6c93cfe', '', '', '2018-08-07 08:12:56', '2018-08-07 08:12:56', '', 0, 'http://dev7.naphix.com/calderflower/044652b2-8b39-4d1a-a481-2e3cc6c93cfe/', 0, 'customize_changeset', '', 0),
(43, 1, '2018-08-08 01:15:57', '2018-08-08 01:15:57', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:6:"slider";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Slider Settings', 'slider-settings', 'publish', 'closed', 'closed', '', 'group_5b6a434026a5c', '', '', '2018-08-08 01:20:55', '2018-08-08 01:20:55', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=acf-field-group&#038;p=43', 0, 'acf-field-group', '', 0),
(44, 1, '2018-08-08 01:15:57', '2018-08-08 01:15:57', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Subtitle', 'cf_home_subtitle', 'publish', 'closed', 'closed', '', 'field_5b6a434c9e057', '', '', '2018-08-08 01:15:57', '2018-08-08 01:15:57', '', 43, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=44', 0, 'acf-field', '', 0),
(45, 1, '2018-08-08 01:15:57', '2018-08-08 01:15:57', 'a:7:{s:4:"type";s:5:"group";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:6:"layout";s:5:"block";s:10:"sub_fields";a:0:{}}', 'First Button', 'first_button', 'publish', 'closed', 'closed', '', 'field_5b6a43bc9e058', '', '', '2018-08-08 01:20:54', '2018-08-08 01:20:54', '', 43, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=45', 1, 'acf-field', '', 0),
(46, 1, '2018-08-08 01:15:57', '2018-08-08 01:15:57', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Button Name', 'first_button_name', 'publish', 'closed', 'closed', '', 'field_5b6a43ce9e059', '', '', '2018-08-08 01:20:54', '2018-08-08 01:20:54', '', 45, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=46', 0, 'acf-field', '', 0),
(47, 1, '2018-08-08 01:15:57', '2018-08-08 01:15:57', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Button url', 'first_button_url', 'publish', 'closed', 'closed', '', 'field_5b6a43e49e05a', '', '', '2018-08-08 01:20:54', '2018-08-08 01:20:54', '', 45, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=47', 1, 'acf-field', '', 0),
(51, 1, '2018-08-08 01:19:45', '2018-08-08 01:19:45', 'a:7:{s:4:"type";s:5:"group";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:6:"layout";s:5:"block";s:10:"sub_fields";a:0:{}}', 'Second Button', 'second_button', 'publish', 'closed', 'closed', '', 'field_5b6a44f35a1ce', '', '', '2018-08-08 01:20:54', '2018-08-08 01:20:54', '', 43, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=51', 2, 'acf-field', '', 0),
(52, 1, '2018-08-08 01:19:45', '2018-08-08 01:19:45', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Button Name', 'second_button_name', 'publish', 'closed', 'closed', '', 'field_5b6a45055a1cf', '', '', '2018-08-08 01:20:54', '2018-08-08 01:20:54', '', 51, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=52', 0, 'acf-field', '', 0),
(53, 1, '2018-08-08 01:19:45', '2018-08-08 01:19:45', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Button url', 'second_button_url', 'publish', 'closed', 'closed', '', 'field_5b6a45265a1d0', '', '', '2018-08-08 01:20:54', '2018-08-08 01:20:54', '', 51, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=53', 1, 'acf-field', '', 0),
(54, 1, '2018-08-08 01:37:06', '2018-08-08 01:37:06', '', 'Crafting the new age of aged care', '', 'publish', 'closed', 'closed', '', 'crafting-the-new-age-of-aged-care', '', '', '2018-08-08 01:42:38', '2018-08-08 01:42:38', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=slider&#038;p=54', 0, 'slider', '', 0),
(55, 1, '2018-08-08 01:37:52', '2018-08-08 01:37:52', '', 'Creating living spaces', '', 'publish', 'closed', 'closed', '', 'creating-living-spaces', '', '', '2018-08-08 01:41:59', '2018-08-08 01:41:59', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=slider&#038;p=55', 0, 'slider', '', 0),
(56, 1, '2018-08-08 01:41:35', '2018-08-08 01:41:35', 'Creating living spaces', 'Creating living spaces', 'Creating living spaces', 'inherit', 'open', 'closed', '', 'creating-living-spaces-2', '', '', '2018-08-08 01:41:55', '2018-08-08 01:41:55', '', 55, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Creating-living-spaces.jpg', 0, 'attachment', 'image/jpeg', 0),
(57, 1, '2018-08-08 01:42:11', '2018-08-08 01:42:11', 'Crafting the new age of aged care', 'Crafting the new age of aged care', 'Crafting the new age of aged care', 'inherit', 'open', 'closed', '', 'crafting-the-new-age-of-aged-care-2', '', '', '2018-08-10 03:34:30', '2018-08-10 03:34:30', '', 54, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Crafting-the-new-age-of-aged-care.jpg', 0, 'attachment', 'image/jpeg', 0),
(58, 1, '2018-08-08 01:43:05', '2018-08-08 01:43:05', 'Celebrating life and community', 'Celebrating life and community', 'Celebrating life and community', 'inherit', 'open', 'closed', '', 'celebrating-life-and-community-2', '', '', '2018-08-10 03:34:07', '2018-08-10 03:34:07', '', 38, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Celebrating-life-and-community.jpg', 0, 'attachment', 'image/jpeg', 0),
(59, 1, '2018-08-08 01:52:05', '2018-08-08 01:52:05', 'We are specialists in creating aged care andcommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 01:52:05', '2018-08-08 01:52:05', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(60, 1, '2018-08-08 01:57:11', '2018-08-08 01:57:11', 'We are specialists in creating aged care and community living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 01:57:11', '2018-08-08 01:57:11', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(61, 1, '2018-08-08 01:57:25', '2018-08-08 01:57:25', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 01:57:25', '2018-08-08 01:57:25', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(62, 1, '2018-08-08 02:09:22', '2018-08-08 02:09:22', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:1:"9";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Home Page Settings', 'home-page-settings', 'publish', 'closed', 'closed', '', 'group_5b6a4feb16ebc', '', '', '2018-08-10 07:13:42', '2018-08-10 07:13:42', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=acf-field-group&#038;p=62', 0, 'acf-field-group', '', 0),
(63, 1, '2018-08-08 02:09:22', '2018-08-08 02:09:22', 'a:7:{s:4:"type";s:5:"group";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:6:"layout";s:5:"block";s:10:"sub_fields";a:0:{}}', 'Featured work', 'cf_home_featured_work', 'publish', 'closed', 'closed', '', 'field_5b6a500a0c93c', '', '', '2018-08-08 04:51:51', '2018-08-08 04:51:51', '', 62, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=63', 0, 'acf-field', '', 0),
(64, 1, '2018-08-08 02:09:22', '2018-08-08 02:09:22', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Featured work title', 'cf_home_featured_work_title', 'publish', 'closed', 'closed', '', 'field_5b6a50280c93d', '', '', '2018-08-08 02:10:30', '2018-08-08 02:10:30', '', 63, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=64', 0, 'acf-field', '', 0),
(65, 1, '2018-08-08 02:09:22', '2018-08-08 02:09:22', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Featured work shortcode', 'cf_home_featured_work_shortcode', 'publish', 'closed', 'closed', '', 'field_5b6a50580c93e', '', '', '2018-08-08 02:10:30', '2018-08-08 02:10:30', '', 63, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=65', 1, 'acf-field', '', 0),
(66, 1, '2018-08-08 02:09:22', '2018-08-08 02:09:22', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'See more url', 'cf_home_see_more_url', 'publish', 'closed', 'closed', '', 'field_5b6a50920c93f', '', '', '2018-08-08 02:10:30', '2018-08-08 02:10:30', '', 63, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=66', 2, 'acf-field', '', 0),
(68, 1, '2018-08-08 02:24:46', '2018-08-08 02:24:46', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 02:24:46', '2018-08-08 02:24:46', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(69, 1, '2018-08-08 02:25:27', '2018-08-08 02:25:27', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 02:25:27', '2018-08-08 02:25:27', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(70, 1, '2018-08-08 04:51:51', '2018-08-08 04:51:51', 'a:7:{s:4:"type";s:5:"group";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:6:"layout";s:5:"block";s:10:"sub_fields";a:0:{}}', 'Let\'s talk', 'cf_home_lets_talk', 'publish', 'closed', 'closed', '', 'field_5b6a75faa9998', '', '', '2018-08-08 05:05:37', '2018-08-08 05:05:37', '', 62, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=70', 1, 'acf-field', '', 0),
(71, 1, '2018-08-08 04:51:52', '2018-08-08 04:51:52', 'a:10:{s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:4:"tabs";s:3:"all";s:7:"toolbar";s:4:"full";s:12:"media_upload";i:1;s:5:"delay";i:0;}', 'Let\'s talk description', 'cf_home_lets_talk_description', 'publish', 'closed', 'closed', '', 'field_5b6a7624a9999', '', '', '2018-08-08 04:51:52', '2018-08-08 04:51:52', '', 70, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=71', 0, 'acf-field', '', 0),
(72, 1, '2018-08-08 04:51:52', '2018-08-08 04:51:52', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Let\'s talk title', 'cf_home_lets_talk_title', 'publish', 'closed', 'closed', '', 'field_5b6a765aa999a', '', '', '2018-08-08 04:51:52', '2018-08-08 04:51:52', '', 70, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=72', 1, 'acf-field', '', 0),
(73, 1, '2018-08-08 04:51:52', '2018-08-08 04:51:52', 'a:10:{s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:4:"tabs";s:3:"all";s:7:"toolbar";s:4:"full";s:12:"media_upload";i:1;s:5:"delay";i:0;}', 'Leave us an enquiry form', 'cf_home_leave_us_an_enquiry_form', 'publish', 'closed', 'closed', '', 'field_5b6a7678a999b', '', '', '2018-08-08 04:51:52', '2018-08-08 04:51:52', '', 70, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=73', 2, 'acf-field', '', 0),
(74, 1, '2018-08-08 04:51:52', '2018-08-08 04:51:52', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"25";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:0:"";}', 'Maps Address', 'cf_home_maps_address', 'publish', 'closed', 'closed', '', 'field_5b6a76c5a999c', '', '', '2018-08-10 07:13:42', '2018-08-10 07:13:42', '', 70, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=74', 3, 'acf-field', '', 0),
(75, 1, '2018-08-08 04:52:56', '2018-08-08 04:52:56', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 04:52:56', '2018-08-08 04:52:56', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(76, 1, '2018-08-08 05:25:12', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-08-08 05:25:12', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=76', 0, 'page', '', 0),
(77, 1, '2018-08-08 05:25:33', '2018-08-08 05:25:33', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life\r\n\r\n[instagram-feed num=4 cols=4 showfollow=false]', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 05:25:33', '2018-08-08 05:25:33', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(78, 1, '2018-08-08 05:28:20', '2018-08-08 05:28:20', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life\r\n\r\n[instagram-feed num=6 cols=6 showfollow=false]', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 05:28:20', '2018-08-08 05:28:20', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(80, 1, '2018-08-08 07:02:15', '2018-08-08 07:02:15', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life\r\n\r\n[instagram-feed num=6 cols=6 showfollow=false]\r\n[instagram url="https://www.instagram.com/magarishor" width=320]', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 07:02:15', '2018-08-08 07:02:15', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(81, 1, '2018-08-08 09:28:27', '2018-08-08 09:28:27', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life\r\n\r\n[instagram-feed num=6 cols=6 showfollow=false]', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 09:28:27', '2018-08-08 09:28:27', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(82, 1, '2018-08-08 09:38:31', '2018-08-08 09:38:31', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life\r\n\r\n[instagram-feed num=6 cols=6 showfollow=false]', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-08 09:38:31', '2018-08-08 09:38:31', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(83, 1, '2018-08-08 09:40:51', '2018-08-08 09:40:51', '{"calderflower::footer_copyright_setting":{"value":"2018 \\u00a9 CalderFlower \\u2022 Level 2, 140 Myrtle Street Chippendale NSW 2008","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-08 09:40:07"},"calderflower::header_address_setting":{"value":"02 9698 9822","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-08 09:40:51"},"calderflower::header_email_setting":{"value":"ishor@naphix.com.au","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-08 09:40:51"}}', '', '', 'trash', 'closed', 'closed', '', '71dd0761-a4cd-4f87-9106-a1bd90dd4bb6', '', '', '2018-08-08 09:40:51', '2018-08-08 09:40:51', '', 0, 'http://dev7.naphix.com/calderflower/?p=83', 0, 'customize_changeset', '', 0),
(84, 1, '2018-08-08 09:41:30', '2018-08-08 09:41:30', '{"blogdescription":{"value":"Creating living spaces","type":"option","user_id":1,"date_modified_gmt":"2018-08-08 09:41:30"}}', '', '', 'trash', 'closed', 'closed', '', '6a42bc58-041f-4f87-b36f-6c55a2eda087', '', '', '2018-08-08 09:41:30', '2018-08-08 09:41:30', '', 0, 'http://dev7.naphix.com/calderflower/6a42bc58-041f-4f87-b36f-6c55a2eda087/', 0, 'customize_changeset', '', 0),
(85, 1, '2018-08-09 01:53:05', '2018-08-09 01:53:05', '', 'logo', '', 'inherit', 'open', 'closed', '', 'logo', '', '', '2018-08-09 01:53:05', '2018-08-09 01:53:05', '', 0, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/logo.svg', 0, 'attachment', 'image/svg+xml', 0),
(86, 1, '2018-08-09 01:53:26', '2018-08-09 01:53:26', '{"calderflower::custom_logo":{"value":85,"type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-09 01:53:26"}}', '', '', 'trash', 'closed', 'closed', '', 'dd6d8e7e-bc2d-47be-966f-d2be6bfc882b', '', '', '2018-08-09 01:53:26', '2018-08-09 01:53:26', '', 0, 'http://dev7.naphix.com/calderflower/dd6d8e7e-bc2d-47be-966f-d2be6bfc882b/', 0, 'customize_changeset', '', 0),
(87, 1, '2018-08-09 03:25:30', '2018-08-09 03:25:30', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:12:"options_page";s:8:"operator";s:2:"==";s:5:"value";s:19:"cf-general-settings";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Calder Flower Settings', 'calder-flower-settings', 'publish', 'closed', 'closed', '', 'group_5b6bb41c9055c', '', '', '2018-08-10 04:00:19', '2018-08-10 04:00:19', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=acf-field-group&#038;p=87', 0, 'acf-field-group', '', 0),
(88, 1, '2018-08-09 03:26:41', '2018-08-09 03:26:41', 'a:7:{s:4:"type";s:5:"group";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:6:"layout";s:5:"block";s:10:"sub_fields";a:0:{}}', 'Slider Settings', 'slider_settings', 'publish', 'closed', 'closed', '', 'field_5b6bb4353052e', '', '', '2018-08-09 03:26:41', '2018-08-09 03:26:41', '', 87, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=88', 0, 'acf-field', '', 0),
(89, 1, '2018-08-09 03:26:41', '2018-08-09 03:26:41', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'View our projects title', 'view_our_projects_title', 'publish', 'closed', 'closed', '', 'field_5b6bb4523052f', '', '', '2018-08-09 03:28:09', '2018-08-09 03:28:09', '', 88, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=89', 0, 'acf-field', '', 0),
(90, 1, '2018-08-09 03:26:41', '2018-08-09 03:26:41', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'View our projects url', 'view_our_projects_url', 'publish', 'closed', 'closed', '', 'field_5b6bb46230530', '', '', '2018-08-09 03:28:09', '2018-08-09 03:28:09', '', 88, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=90', 1, 'acf-field', '', 0),
(91, 1, '2018-08-09 03:28:09', '2018-08-09 03:28:09', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Meet our team title', 'meet_our_team_title', 'publish', 'closed', 'closed', '', 'field_5b6bb48d1b07c', '', '', '2018-08-09 03:28:09', '2018-08-09 03:28:09', '', 88, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=91', 2, 'acf-field', '', 0),
(92, 1, '2018-08-09 03:28:10', '2018-08-09 03:28:10', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Meet our team url', 'meet_our_team_url', 'publish', 'closed', 'closed', '', 'field_5b6bb49e1b07d', '', '', '2018-08-09 03:28:10', '2018-08-09 03:28:10', '', 88, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=92', 3, 'acf-field', '', 0),
(93, 1, '2018-08-09 03:28:10', '2018-08-09 03:28:10', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Read our news title', 'read_our_news_title', 'publish', 'closed', 'closed', '', 'field_5b6bb4ab1b07e', '', '', '2018-08-09 03:28:10', '2018-08-09 03:28:10', '', 88, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=93', 4, 'acf-field', '', 0),
(94, 1, '2018-08-09 03:28:10', '2018-08-09 03:28:10', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Read our news url', 'read_our_news_url', 'publish', 'closed', 'closed', '', 'field_5b6bb4b51b07f', '', '', '2018-08-09 03:28:10', '2018-08-09 03:28:10', '', 88, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=94', 5, 'acf-field', '', 0),
(95, 1, '2018-08-09 03:51:19', '2018-08-09 03:51:19', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-09 03:51:19', '2018-08-09 03:51:19', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(96, 1, '2018-08-09 06:54:20', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-08-09 06:54:20', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=project&p=96', 0, 'project', '', 0),
(97, 1, '2018-08-09 06:55:01', '2018-08-09 06:55:01', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:7:"project";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'Projects Settings', 'projects-settings', 'publish', 'closed', 'closed', '', 'group_5b6be53c973b6', '', '', '2018-08-10 03:30:28', '2018-08-10 03:30:28', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=acf-field-group&#038;p=97', 0, 'acf-field-group', '', 0),
(98, 1, '2018-08-09 06:55:42', '2018-08-09 06:55:42', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'subtitle', 'projects_subtitle', 'publish', 'closed', 'closed', '', 'field_5b6be557c40bc', '', '', '2018-08-09 07:02:02', '2018-08-09 07:02:02', '', 97, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=98', 0, 'acf-field', '', 0),
(99, 1, '2018-08-09 07:01:52', '2018-08-09 07:01:52', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus', 'Baulkham Hills Aged Care', '', 'publish', 'closed', 'closed', '', 'baulkham-hills-aged-care', '', '', '2018-08-10 03:50:44', '2018-08-10 03:50:44', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=project&#038;p=99', 0, 'project', '', 0),
(100, 1, '2018-08-09 07:01:38', '2018-08-09 07:01:38', 'Projects1', 'Projects1', 'Projects1', 'inherit', 'open', 'closed', '', 'projects1', '', '', '2018-08-10 03:50:39', '2018-08-10 03:50:39', '', 99, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Projects1.jpg', 0, 'attachment', 'image/jpeg', 0),
(101, 1, '2018-08-09 07:02:55', '2018-08-09 07:02:55', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus', 'Baulkham Hills Aged Care', '', 'publish', 'closed', 'closed', '', 'baulkham-hills-aged-care-2', '', '', '2018-08-10 03:50:18', '2018-08-10 03:50:18', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=project&#038;p=101', 0, 'project', '', 0),
(102, 1, '2018-08-09 07:02:50', '2018-08-09 07:02:50', '', 'Projects2', '', 'inherit', 'open', 'closed', '', 'projects2', '', '', '2018-08-10 03:17:30', '2018-08-10 03:17:30', '', 101, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Projects2.jpg', 0, 'attachment', 'image/jpeg', 0),
(103, 1, '2018-08-09 07:03:11', '2018-08-09 07:03:11', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus', 'Baulkham Hills Aged Care', '', 'publish', 'closed', 'closed', '', 'baulkham-hills-aged-care-3', '', '', '2018-08-10 03:34:41', '2018-08-10 03:34:41', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=project&#038;p=103', 0, 'project', '', 0),
(104, 1, '2018-08-09 07:03:07', '2018-08-09 07:03:07', '', 'Projects3', '', 'inherit', 'open', 'closed', '', 'projects3', '', '', '2018-08-09 07:03:07', '2018-08-09 07:03:07', '', 103, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Projects3.jpg', 0, 'attachment', 'image/jpeg', 0),
(105, 1, '2018-08-09 07:03:37', '2018-08-09 07:03:37', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus', 'Baulkham Hills Aged Care', '', 'publish', 'closed', 'closed', '', 'baulkham-hills-aged-care-4', '', '', '2018-08-10 03:34:09', '2018-08-10 03:34:09', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=project&#038;p=105', 0, 'project', '', 0) ;
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(106, 1, '2018-08-09 07:03:33', '2018-08-09 07:03:33', '', 'Projects4', '', 'inherit', 'open', 'closed', '', 'projects4', '', '', '2018-08-09 07:03:33', '2018-08-09 07:03:33', '', 105, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Projects4.jpg', 0, 'attachment', 'image/jpeg', 0),
(107, 1, '2018-08-09 07:03:53', '2018-08-09 07:03:53', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus', 'Baulkham Hills Aged Care', '', 'publish', 'closed', 'closed', '', 'baulkham-hills-aged-care-5', '', '', '2018-08-10 03:33:46', '2018-08-10 03:33:46', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=project&#038;p=107', 0, 'project', '', 0),
(108, 1, '2018-08-09 07:03:49', '2018-08-09 07:03:49', '', 'Projects5', '', 'inherit', 'open', 'closed', '', 'projects5', '', '', '2018-08-09 07:03:49', '2018-08-09 07:03:49', '', 107, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Projects5.jpg', 0, 'attachment', 'image/jpeg', 0),
(109, 1, '2018-08-09 07:04:07', '2018-08-09 07:04:07', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \r\n\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus', 'Baulkham Hills Aged Care', '', 'publish', 'closed', 'closed', '', 'baulkham-hills-aged-care-6', '', '', '2018-08-10 03:24:51', '2018-08-10 03:24:51', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=project&#038;p=109', 0, 'project', '', 0),
(110, 1, '2018-08-09 07:04:04', '2018-08-09 07:04:04', '', 'Projects6', '', 'inherit', 'open', 'closed', '', 'projects6', '', '', '2018-08-09 07:04:04', '2018-08-09 07:04:04', '', 109, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/Projects6.jpg', 0, 'attachment', 'image/jpeg', 0) ;
INSERT INTO `wp_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(111, 1, '2018-08-09 07:34:08', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-08-09 07:34:08', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=acf-field-group&p=111', 0, 'acf-field-group', '', 0),
(112, 1, '2018-08-10 03:15:28', '2018-08-10 03:15:28', 'a:7:{s:4:"type";s:5:"group";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:6:"layout";s:5:"block";s:10:"sub_fields";a:0:{}}', 'Icon Blocks', 'icon_blocks', 'publish', 'closed', 'closed', '', 'field_5b6d02a093232', '', '', '2018-08-10 03:30:11', '2018-08-10 03:30:11', '', 97, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=112', 2, 'acf-field', '', 0),
(113, 1, '2018-08-10 03:15:28', '2018-08-10 03:15:28', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Residents Icon', 'cf_residents_icon', 'publish', 'closed', 'closed', '', 'field_5b6d02b493233', '', '', '2018-08-10 03:15:28', '2018-08-10 03:15:28', '', 112, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=113', 0, 'acf-field', '', 0),
(114, 1, '2018-08-10 03:15:28', '2018-08-10 03:15:28', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Residents Info', 'cf_residents_info', 'publish', 'closed', 'closed', '', 'field_5b6d02c793234', '', '', '2018-08-10 03:15:28', '2018-08-10 03:15:28', '', 112, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=114', 1, 'acf-field', '', 0),
(115, 1, '2018-08-10 03:15:28', '2018-08-10 03:15:28', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Area Icon', 'cf_area_icon', 'publish', 'closed', 'closed', '', 'field_5b6d02e393235', '', '', '2018-08-10 03:15:28', '2018-08-10 03:15:28', '', 112, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=115', 2, 'acf-field', '', 0),
(116, 1, '2018-08-10 03:15:28', '2018-08-10 03:15:28', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Area Info', 'cf_area_info', 'publish', 'closed', 'closed', '', 'field_5b6d02f993236', '', '', '2018-08-10 03:15:28', '2018-08-10 03:15:28', '', 112, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=116', 3, 'acf-field', '', 0),
(117, 1, '2018-08-10 03:15:28', '2018-08-10 03:15:28', 'a:15:{s:4:"type";s:5:"image";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:5:"array";s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Completed year icon', 'cf_completed_year_icon', 'publish', 'closed', 'closed', '', 'field_5b6d031293237', '', '', '2018-08-10 03:15:28', '2018-08-10 03:15:28', '', 112, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=117', 4, 'acf-field', '', 0),
(118, 1, '2018-08-10 03:15:29', '2018-08-10 03:15:29', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Completed year text', 'cf_completed_year_text', 'publish', 'closed', 'closed', '', 'field_5b6d032893238', '', '', '2018-08-10 03:22:08', '2018-08-10 03:22:08', '', 112, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=118', 5, 'acf-field', '', 0),
(119, 1, '2018-08-10 03:17:17', '2018-08-10 03:17:17', 'a:16:{s:4:"type";s:7:"gallery";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:3:"min";s:0:"";s:3:"max";s:0:"";s:6:"insert";s:6:"append";s:7:"library";s:3:"all";s:9:"min_width";s:0:"";s:10:"min_height";s:0:"";s:8:"min_size";s:0:"";s:9:"max_width";s:0:"";s:10:"max_height";s:0:"";s:8:"max_size";s:0:"";s:10:"mime_types";s:0:"";}', 'Projects Gallery', 'cf_projects_gallery', 'publish', 'closed', 'closed', '', 'field_5b6d03a0f0e55', '', '', '2018-08-10 03:30:11', '2018-08-10 03:30:11', '', 97, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=119', 3, 'acf-field', '', 0),
(120, 1, '2018-08-10 03:29:53', '2018-08-10 03:29:53', 'a:13:{s:4:"type";s:6:"select";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"choices";a:2:{s:12:"architecture";s:12:"Architecture";s:9:"interiors";s:9:"Interiors";}s:13:"default_value";a:0:{}s:10:"allow_null";i:0;s:8:"multiple";i:0;s:2:"ui";i:0;s:13:"return_format";s:5:"value";s:4:"ajax";i:0;s:11:"placeholder";s:0:"";}', 'Practice Area', 'practice_area', 'publish', 'closed', 'closed', '', 'field_5b6d067fbb611', '', '', '2018-08-10 03:30:28', '2018-08-10 03:30:28', '', 97, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=120', 1, 'acf-field', '', 0),
(121, 1, '2018-08-10 03:35:48', '2018-08-10 03:35:48', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. \n\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus', 'Baulkham Hills Aged Care', '', 'inherit', 'closed', 'closed', '', '101-autosave-v1', '', '', '2018-08-10 03:35:48', '2018-08-10 03:35:48', '', 101, 'http://dev7.naphix.com/calderflower/101-autosave-v1/', 0, 'revision', '', 0),
(122, 1, '2018-08-10 03:56:27', '2018-08-10 03:56:27', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut ', 'About Us', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2018-08-10 03:56:27', '2018-08-10 03:56:27', '', 11, 'http://dev7.naphix.com/calderflower/11-revision-v1/', 0, 'revision', '', 0),
(123, 1, '2018-08-10 03:57:22', '2018-08-10 03:57:22', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:4:"page";s:8:"operator";s:2:"==";s:5:"value";s:2:"11";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";s:11:"description";s:0:"";}', 'About Us Settings', 'about-us-settings', 'publish', 'closed', 'closed', '', 'group_5b6d0d0fc5b09', '', '', '2018-08-10 05:01:00', '2018-08-10 05:01:00', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=acf-field-group&#038;p=123', 0, 'acf-field-group', '', 0),
(124, 1, '2018-08-10 03:59:24', '2018-08-10 03:59:24', 'a:7:{s:4:"type";s:5:"group";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:6:"layout";s:5:"block";s:10:"sub_fields";a:0:{}}', 'About Info Block [ Architecture , Interiors ]', 'cf_about_info_block', 'publish', 'closed', 'closed', '', 'field_5b6d0d4bcceb3', '', '', '2018-08-10 04:07:38', '2018-08-10 04:07:38', '', 123, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=124', 0, 'acf-field', '', 0),
(125, 1, '2018-08-10 03:59:24', '2018-08-10 03:59:24', 'a:10:{s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:4:"tabs";s:3:"all";s:7:"toolbar";s:4:"full";s:12:"media_upload";i:1;s:5:"delay";i:0;}', 'Architecture Block', 'cf_architecture_block', 'publish', 'closed', 'closed', '', 'field_5b6d0d72cceb4', '', '', '2018-08-10 03:59:24', '2018-08-10 03:59:24', '', 124, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=125', 0, 'acf-field', '', 0),
(126, 1, '2018-08-10 03:59:24', '2018-08-10 03:59:24', 'a:10:{s:4:"type";s:7:"wysiwyg";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"50";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:4:"tabs";s:3:"all";s:7:"toolbar";s:4:"full";s:12:"media_upload";i:1;s:5:"delay";i:0;}', 'Interiors Block', 'cf_interiors_block', 'publish', 'closed', 'closed', '', 'field_5b6d0d82cceb5', '', '', '2018-08-10 04:00:50', '2018-08-10 04:00:50', '', 124, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=126', 1, 'acf-field', '', 0),
(127, 1, '2018-08-10 04:01:36', '2018-08-10 04:01:36', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\r\n\r\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut ', 'About Us', '', 'inherit', 'closed', 'closed', '', '11-revision-v1', '', '', '2018-08-10 04:01:36', '2018-08-10 04:01:36', '', 11, 'http://dev7.naphix.com/calderflower/11-revision-v1/', 0, 'revision', '', 0),
(128, 1, '2018-08-10 04:02:35', '2018-08-10 04:02:35', 'about-banner', 'about-banner', 'about-banner', 'inherit', 'open', 'closed', '', 'about-banner', '', '', '2018-08-10 04:02:41', '2018-08-10 04:02:41', '', 11, 'http://dev7.naphix.com/calderflower/wp-content/uploads/2018/08/about-banner.jpg', 0, 'attachment', 'image/jpeg', 0),
(129, 1, '2018-08-10 04:07:38', '2018-08-10 04:07:38', 'a:7:{s:4:"type";s:5:"group";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:6:"layout";s:5:"block";s:10:"sub_fields";a:0:{}}', 'About Info Block [ 4 Block ]', 'cf_about_info_block_4', 'publish', 'closed', 'closed', '', 'field_5b6d0f4c5c414', '', '', '2018-08-10 04:07:38', '2018-08-10 04:07:38', '', 123, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=129', 1, 'acf-field', '', 0),
(130, 1, '2018-08-10 04:08:44', '2018-08-10 04:08:44', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"20";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Info one', 'info_one', 'publish', 'closed', 'closed', '', 'field_5b6d0f8f83006', '', '', '2018-08-10 04:08:44', '2018-08-10 04:08:44', '', 129, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=130', 0, 'acf-field', '', 0),
(131, 1, '2018-08-10 04:08:45', '2018-08-10 04:08:45', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"20";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Info two', 'info_two', 'publish', 'closed', 'closed', '', 'field_5b6d0fad83007', '', '', '2018-08-10 04:08:45', '2018-08-10 04:08:45', '', 129, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=131', 1, 'acf-field', '', 0),
(132, 1, '2018-08-10 04:08:45', '2018-08-10 04:08:45', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"20";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Info three', 'info_three', 'publish', 'closed', 'closed', '', 'field_5b6d0fb783008', '', '', '2018-08-10 04:08:45', '2018-08-10 04:08:45', '', 129, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=132', 2, 'acf-field', '', 0),
(133, 1, '2018-08-10 04:08:45', '2018-08-10 04:08:45', 'a:10:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"20";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";}', 'Info four', 'info_four', 'publish', 'closed', 'closed', '', 'field_5b6d0fc183009', '', '', '2018-08-10 04:08:45', '2018-08-10 04:08:45', '', 129, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&p=133', 3, 'acf-field', '', 0),
(134, 1, '2018-08-10 05:09:22', '2018-08-10 05:09:22', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-10 05:09:22', '2018-08-10 05:09:22', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(135, 1, '2018-08-10 05:09:56', '2018-08-10 05:09:56', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-10 05:09:56', '2018-08-10 05:09:56', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(136, 1, '2018-08-10 06:44:45', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2018-08-10 06:44:45', '0000-00-00 00:00:00', '', 0, 'http://dev7.naphix.com/calderflower/?post_type=team&p=136', 0, 'team', '', 0),
(137, 1, '2018-08-10 06:55:01', '2018-08-10 06:55:01', '', '<i class="fas fa-phone"></i> 02 9698 9822', '', 'publish', 'closed', 'closed', '', '02-9698-9822', '', '', '2018-08-10 06:57:49', '2018-08-10 06:57:49', '', 0, 'http://dev7.naphix.com/calderflower/?p=137', 1, 'nav_menu_item', '', 0),
(138, 1, '2018-08-10 06:55:02', '2018-08-10 06:55:02', '', '<i class="fas fa-envelope"></i> Email Us', '', 'publish', 'closed', 'closed', '', 'email-us', '', '', '2018-08-10 06:57:49', '2018-08-10 06:57:49', '', 0, 'http://dev7.naphix.com/calderflower/?p=138', 2, 'nav_menu_item', '', 0),
(139, 1, '2018-08-10 06:55:18', '2018-08-10 06:55:18', '', 'Client Portal Login', '', 'publish', 'closed', 'closed', '', 'client-portal-login', '', '', '2018-08-10 06:55:18', '2018-08-10 06:55:18', '', 0, 'http://dev7.naphix.com/calderflower/?page_id=139', 0, 'page', '', 0),
(140, 1, '2018-08-10 06:55:18', '2018-08-10 06:55:18', '', 'Client Portal Login', '', 'inherit', 'closed', 'closed', '', '139-revision-v1', '', '', '2018-08-10 06:55:18', '2018-08-10 06:55:18', '', 139, 'http://dev7.naphix.com/calderflower/139-revision-v1/', 0, 'revision', '', 0),
(141, 1, '2018-08-10 06:55:27', '2018-08-10 06:55:27', '', '<i class="fas fa-user"></i> Client Portal Login', '', 'publish', 'closed', 'closed', '', '141', '', '', '2018-08-10 06:57:49', '2018-08-10 06:57:49', '', 0, 'http://dev7.naphix.com/calderflower/?p=141', 3, 'nav_menu_item', '', 0),
(142, 1, '2018-08-10 07:13:12', '2018-08-10 07:13:12', 'a:10:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:2:"25";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:9:"new_lines";s:0:"";}', 'Maps Information', 'cf_home_maps_information', 'publish', 'closed', 'closed', '', 'field_5b6d3aeab95df', '', '', '2018-08-10 07:13:42', '2018-08-10 07:13:42', '', 70, 'http://dev7.naphix.com/calderflower/?post_type=acf-field&#038;p=142', 4, 'acf-field', '', 0),
(143, 1, '2018-08-10 07:22:18', '2018-08-10 07:22:18', 'We are specialists in creating aged care and\r\ncommunity living spaces that celebrate life', 'Home', '', 'inherit', 'closed', 'closed', '', '9-revision-v1', '', '', '2018-08-10 07:22:18', '2018-08-10 07:22:18', '', 9, 'http://dev7.naphix.com/calderflower/9-revision-v1/', 0, 'revision', '', 0),
(144, 1, '2018-08-10 07:35:11', '2018-08-10 07:35:11', '{"calderflower::header_address_setting":{"value":"","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-10 07:35:11"},"calderflower::header_email_setting":{"value":"","type":"theme_mod","user_id":1,"date_modified_gmt":"2018-08-10 07:35:11"}}', '', '', 'trash', 'closed', 'closed', '', '433eddcc-63f6-45d7-a89d-131317b1b852', '', '', '2018-08-10 07:35:11', '2018-08-10 07:35:11', '', 0, 'http://dev7.naphix.com/calderflower/433eddcc-63f6-45d7-a89d-131317b1b852/', 0, 'customize_changeset', '', 0) ;

#
# End of data contents of table `wp_posts`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_form`
#

DROP TABLE IF EXISTS `wp_rg_form`;


#
# Table structure of table `wp_rg_form`
#

CREATE TABLE `wp_rg_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_form`
#
INSERT INTO `wp_rg_form` ( `id`, `title`, `date_created`, `is_active`, `is_trash`) VALUES
(1, 'Leave us an enquiry', '2018-08-08 02:17:28', 1, 0) ;

#
# End of data contents of table `wp_rg_form`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_form_meta`
#

DROP TABLE IF EXISTS `wp_rg_form_meta`;


#
# Table structure of table `wp_rg_form_meta`
#

CREATE TABLE `wp_rg_form_meta` (
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext COLLATE utf8mb4_unicode_ci,
  `entries_grid_meta` longtext COLLATE utf8mb4_unicode_ci,
  `confirmations` longtext COLLATE utf8mb4_unicode_ci,
  `notifications` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_form_meta`
#
INSERT INTO `wp_rg_form_meta` ( `form_id`, `display_meta`, `entries_grid_meta`, `confirmations`, `notifications`) VALUES
(1, '{"title":"Leave us an enquiry","description":"Footer Enquiry form","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Submit","imageUrl":""},"fields":[{"type":"text","id":1,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"First Name","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1},{"type":"text","id":2,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"Last Name","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1},{"type":"email","id":3,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"Email address","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","productField":"","emailConfirmEnabled":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1},{"type":"phone","id":4,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"phoneFormat":"standard","formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"Phone","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","form_id":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1},{"type":"textarea","id":5,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"Message","cssClass":"","inputName":"","visibility":"visible","noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","productField":"","form_id":"","useRichTextEditor":false,"multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"pageNumber":1}],"version":"2.2.1","id":1,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null}', NULL, '{"5b6a52b8ac34e":{"id":"5b6a52b8ac34e","name":"Default Confirmation","isDefault":true,"type":"message","message":"Thanks for contacting us! We will get in touch with you shortly.","url":"","pageId":"","queryString":""}}', '{"5b6a52b89deb0":{"id":"5b6a52b89deb0","to":"{admin_email}","name":"Admin Notification","event":"form_submission","toType":"email","subject":"New submission from {form_title}","message":"{all_fields}"}}') ;

#
# End of data contents of table `wp_rg_form_meta`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_form_view`
#

DROP TABLE IF EXISTS `wp_rg_form_view`;


#
# Table structure of table `wp_rg_form_view`
#

CREATE TABLE `wp_rg_form_view` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `date_created` (`date_created`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_form_view`
#

#
# End of data contents of table `wp_rg_form_view`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_incomplete_submissions`
#

DROP TABLE IF EXISTS `wp_rg_incomplete_submissions`;


#
# Table structure of table `wp_rg_incomplete_submissions`
#

CREATE TABLE `wp_rg_incomplete_submissions` (
  `uuid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_url` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `submission` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `form_id` (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_incomplete_submissions`
#

#
# End of data contents of table `wp_rg_incomplete_submissions`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_lead`
#

DROP TABLE IF EXISTS `wp_rg_lead`;


#
# Table structure of table `wp_rg_lead`
#

CREATE TABLE `wp_rg_lead` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_agent` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `payment_method` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_fulfilled` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` tinyint(1) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_lead`
#

#
# End of data contents of table `wp_rg_lead`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_lead_detail`
#

DROP TABLE IF EXISTS `wp_rg_lead_detail`;


#
# Table structure of table `wp_rg_lead_detail`
#

CREATE TABLE `wp_rg_lead_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `field_number` float NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_field_number` (`lead_id`,`field_number`),
  KEY `lead_field_value` (`value`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_lead_detail`
#

#
# End of data contents of table `wp_rg_lead_detail`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_lead_detail_long`
#

DROP TABLE IF EXISTS `wp_rg_lead_detail_long`;


#
# Table structure of table `wp_rg_lead_detail_long`
#

CREATE TABLE `wp_rg_lead_detail_long` (
  `lead_detail_id` bigint(20) unsigned NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lead_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_lead_detail_long`
#

#
# End of data contents of table `wp_rg_lead_detail_long`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_lead_meta`
#

DROP TABLE IF EXISTS `wp_rg_lead_meta`;


#
# Table structure of table `wp_rg_lead_meta`
#

CREATE TABLE `wp_rg_lead_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lead_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `lead_id` (`lead_id`),
  KEY `form_id_meta_key` (`form_id`,`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_lead_meta`
#

#
# End of data contents of table `wp_rg_lead_meta`
# --------------------------------------------------------



#
# Delete any existing table `wp_rg_lead_notes`
#

DROP TABLE IF EXISTS `wp_rg_lead_notes`;


#
# Table structure of table `wp_rg_lead_notes`
#

CREATE TABLE `wp_rg_lead_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `user_name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `note_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_user_key` (`lead_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_rg_lead_notes`
#

#
# End of data contents of table `wp_rg_lead_notes`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_relationships`
#

DROP TABLE IF EXISTS `wp_term_relationships`;


#
# Table structure of table `wp_term_relationships`
#

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_term_relationships`
#
INSERT INTO `wp_term_relationships` ( `object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(5, 1, 0),
(25, 2, 0),
(26, 2, 0),
(27, 2, 0),
(28, 2, 0),
(29, 2, 0),
(30, 2, 0),
(31, 2, 0),
(32, 2, 0),
(33, 2, 0),
(99, 3, 0),
(99, 4, 0),
(99, 5, 0),
(99, 6, 0),
(99, 7, 0),
(101, 3, 0),
(101, 4, 0),
(101, 5, 0),
(101, 6, 0),
(101, 7, 0),
(103, 3, 0),
(103, 4, 0),
(103, 5, 0),
(103, 6, 0),
(103, 7, 0),
(105, 3, 0),
(105, 4, 0),
(105, 5, 0),
(105, 6, 0),
(105, 7, 0),
(107, 3, 0),
(107, 4, 0),
(107, 5, 0),
(107, 6, 0),
(107, 7, 0),
(109, 3, 0),
(109, 4, 0),
(109, 5, 0),
(109, 6, 0),
(109, 7, 0),
(137, 11, 0),
(138, 11, 0),
(141, 11, 0) ;

#
# End of data contents of table `wp_term_relationships`
# --------------------------------------------------------



#
# Delete any existing table `wp_term_taxonomy`
#

DROP TABLE IF EXISTS `wp_term_taxonomy`;


#
# Table structure of table `wp_term_taxonomy`
#

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_term_taxonomy`
#
INSERT INTO `wp_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'nav_menu', '', 0, 9),
(3, 3, 'cfproject_type', '', 0, 6),
(4, 4, 'cfproject_type', '', 0, 6),
(5, 5, 'cfproject_type', '', 0, 6),
(6, 6, 'cfproject_type', '', 0, 6),
(7, 7, 'cfproject_type', '', 0, 6),
(9, 9, 'cfteam_type', '', 0, 0),
(10, 10, 'cfteam_type', '', 0, 0),
(11, 11, 'nav_menu', '', 0, 3) ;

#
# End of data contents of table `wp_term_taxonomy`
# --------------------------------------------------------



#
# Delete any existing table `wp_termmeta`
#

DROP TABLE IF EXISTS `wp_termmeta`;


#
# Table structure of table `wp_termmeta`
#

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_termmeta`
#

#
# End of data contents of table `wp_termmeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_terms`
#

DROP TABLE IF EXISTS `wp_terms`;


#
# Table structure of table `wp_terms`
#

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_terms`
#
INSERT INTO `wp_terms` ( `term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Top menu', 'top-menu', 0),
(3, 'Competitions', 'competitions', 0),
(4, 'Master Planning', 'master-planning', 0),
(5, 'Housing', 'housing', 0),
(6, 'Community Living', 'community-living', 0),
(7, 'Aged Care', 'aged-care', 0),
(9, 'Interiors Team', 'interiors-team', 0),
(10, 'Architecture Team', 'architecture-team', 0),
(11, 'Secondary Menu', 'secondary-menu', 0) ;

#
# End of data contents of table `wp_terms`
# --------------------------------------------------------



#
# Delete any existing table `wp_usermeta`
#

DROP TABLE IF EXISTS `wp_usermeta`;


#
# Table structure of table `wp_usermeta`
#

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_usermeta`
#
INSERT INTO `wp_usermeta` ( `umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'fresh'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(13, 1, 'wp_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'wp496_privacy'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:2:{s:64:"d58ce091bc6fd58e5632d174eee7c88c666dd46af506371aeb82e63fe3b8cd82";a:4:{s:10:"expiration";i:1534049658;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36";s:5:"login";i:1533876858;}s:64:"6d0baa883823093d00dc48ffd95297f8bc7bbbc6f233b6571fc79d64bdfea09c";a:4:{s:10:"expiration";i:1534050032;s:2:"ip";s:3:"::1";s:2:"ua";s:114:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.99 Safari/537.36";s:5:"login";i:1533877232;}}'),
(17, 1, 'wp_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'managenav-menuscolumnshidden', 'a:5:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";i:4;s:15:"title-attribute";}'),
(19, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:20:"add-post-type-slider";i:1;s:21:"add-post-type-project";i:2;s:12:"add-post_tag";}'),
(20, 1, 'closedpostboxes_slider', 'a:0:{}'),
(21, 1, 'metaboxhidden_slider', 'a:1:{i:0;s:7:"slugdiv";}'),
(22, 1, 'wp_user-settings', 'mfold=o&libraryContent=browse&editor=html'),
(23, 1, 'wp_user-settings-time', '1533779851'),
(24, 1, 'gform_recent_forms', 'a:1:{i:0;s:1:"1";}'),
(25, 1, 'closedpostboxes_page', 'a:0:{}'),
(26, 1, 'metaboxhidden_page', 'a:6:{i:0;s:23:"acf-group_5b6a434026a5c";i:1;s:12:"revisionsdiv";i:2;s:16:"commentstatusdiv";i:3;s:11:"commentsdiv";i:4;s:7:"slugdiv";i:5;s:9:"authordiv";}'),
(27, 1, 'nav_menu_recently_edited', '11') ;

#
# End of data contents of table `wp_usermeta`
# --------------------------------------------------------



#
# Delete any existing table `wp_users`
#

DROP TABLE IF EXISTS `wp_users`;


#
# Table structure of table `wp_users`
#

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


#
# Data contents of table `wp_users`
#
INSERT INTO `wp_users` ( `ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$B0opxmZn/AsYUh7GF38QX2oOOKQLBl0', 'admin', 'ishor@naphix.com.au', '', '2018-08-06 04:29:12', '', 0, 'admin') ;

#
# End of data contents of table `wp_users`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

