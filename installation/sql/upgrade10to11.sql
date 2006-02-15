# $Id$

# Joomla 1.0 to Joomla 1.1

# Mambot Additions
INSERT INTO `jos_mambots` VALUES (0, 'Joomla Authentication Plugin', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'LDAP Authentication Plugin', 'ldap', 'authentication', 0, 1, 0, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'Joomla SEF URLs', 'joomla.sefurlbot', 'system', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'Search XML-RPC', 'search.xmlrpcbot', 'xmlrpc', 0, 7, 1, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'Visitor Statistics', 'joomla.visitorbot', 'system', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'Page Navigation','pagenavigation','content',0,2,1,1,0,0,'0000-00-00 00:00:00','');
INSERT INTO `jos_mambots` VALUES (0, 'Syndicate Content', 'content.syndicatebot', 'syndicate', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'Syndicate Frontpage', 'frontpage.syndicatebot', 'syndicate', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'Syndicate Weblinks', 'weblinks.syndicatebot', 'syndicate', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'Syndicate Contacts', 'contact.syndicatebot', 'syndicate', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'Syndicate Poll', 'poll.syndicatebot', 'syndicate', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', '');
INSERT INTO `jos_mambots` VALUES (0, 'XStandard Lite 1.7', 'xstandard', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', '');

#Mambot Removals 
DELETE FROM `jos_mambots` WHERE `element` = 'legacybots' 

# Module Additions
INSERT INTO `jos_modules` VALUES (1000, 'Footer', '', 1, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 0);
INSERT INTO `jos_modules` VALUES (1001, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1);
INSERT INTO `jos_modules` VALUES (0, 'Newsfeed', '', 11, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_rss', 0, 0, 1, '', 1, 0);
INSERT INTO `jos_modules` VALUES (1002, 'Breadcrumbs', '', 1, 'breadcrumb', 0, '0000-00-00 00:00:00', 1, 'mod_breadcrumbs', 0, 0, 1, '', 1, 0);

INSERT INTO `jos_modules_menu` VALUES (1000,0);
INSERT INTO `jos_modules_menu` VALUES (1001,0);
INSERT INTO `jos_modules_menu` VALUES (1002,0);

UPDATE `jos_modules` SET `access` = '23' WHERE `client_id` = 1;
UPDATE `jos_modules` SET `title` = 'Feed Display' AND `module` = 'mod_feed' WHERE `module` = 'mod_rss';

#Mambot Removals 
DELETE FROM `jos_modules` WHERE `module` = 'mod_mosmsg' 
DELETE FROM `jos_modules` WHERE `module` = 'mod_rssfeed' 

# Expand content title lengths
ALTER TABLE `jos_content` CHANGE `title` `title` varchar(255) NOT NULL default '';
ALTER TABLE `jos_content` CHANGE `title_alias` `title_alias` varchar(255) NOT NULL default '';

UPDATE `jos_components` SET `admin_menu_link` = 'option=com_categories&section=com_contact_details' WHERE `id` = '9'  LIMIT 1;
UPDATE `jos_components` SET `admin_menu_link` = 'option=com_categories&section=com_weblinks' WHERE `id` = '6'  LIMIT 1;

# AJE: 17-Nov-2005
# Fix column names in phpgacl tables
ALTER TABLE `jos_core_acl_aro` CHANGE COLUMN `aro_id` `id` INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `jos_core_acl_aro_groups` CHANGE COLUMN `group_id` `id` INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE `jos_core_acl_aro_sections` CHANGE COLUMN `section_id` `id` INTEGER NOT NULL AUTO_INCREMENT;

ALTER TABLE `jos_core_acl_aro_groups` ADD COLUMN `value` varchar(255) NOT NULL default '';
UPDATE `jos_core_acl_aro_groups` SET value=name;
ALTER TABLE `jos_core_acl_aro_groups` ADD UNIQUE `value_aro_groups`(`value`);
ALTER TABLE `jos_core_acl_aro_groups` DROP PRIMARY KEY, ADD PRIMARY KEY(`id`, `value`);

# LBL: 05-Jan-2006
# Mambot refactor to Plugin
RENAME TABLE `jos_mambots` TO `jos_plugins`;

# LBL: 18-Jan-2006
# Add enabling of components
ALTER TABLE `jos_components` ADD `enabled` TINYINT NOT NULL ;

# LBL: 11-Feb-2006
# Add breadcrumb template position
INSERT INTO `#__template_positions` VALUES (0, 'breadcrumb', '');

# SAM: 16-Feb-2006
# Add GMail Auth Plugin
INSERT INTO `#__plugins` VALUES (0, 'GMail Auth Plugin', 'gmail', 'authentication', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '');
