# DatafileID: MTI2NzY2NDM3NiwwOENNUywzLjQsaW5zdGFsbHNxbA==
# <?exit();?>
# 08cms InstallPack Data Dump
# Version: 08cms v3.4
# Date: 2010-03-04
# --------------------------------------------------------
# Home: www.08cms.com
# --------------------------------------------------------


DROP TABLE IF EXISTS {$tblprefix}cradminlogs;
CREATE TABLE {$tblprefix}cradminlogs (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  crid smallint(5) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL,
  frommid mediumint(8) unsigned NOT NULL DEFAULT '0',
  frommname varchar(15) NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  `mode` varchar(6) NOT NULL,
  `value` float NOT NULL DEFAULT '0',
  dealmode varchar(10) NOT NULL,
  PRIMARY KEY (id)
) TYPE=MyISAM;

DROP TABLE IF EXISTS {$tblprefix}msession;
CREATE TABLE {$tblprefix}msession (
  msid varchar(6) NOT NULL,
  onlineip varchar(15) NOT NULL,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(30) NOT NULL,
  mslastactive int(10) unsigned NOT NULL DEFAULT '0',
  msclicks smallint(6) unsigned NOT NULL DEFAULT '0',
  lastsearch int(10) unsigned NOT NULL DEFAULT '0',
  errtimes tinyint(1) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY msid (msid),
  KEY mid (mid)
) TYPE=MyISAM;

DROP TABLE IF EXISTS {$tblprefix}alangs;
CREATE TABLE {$tblprefix}alangs (
  lid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(50) NOT NULL,
  content text NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (lid)
) TYPE=MyISAM AUTO_INCREMENT=3287;

INSERT INTO {$tblprefix}alangs VALUES ('69','subsite','��վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('70','catalog','��Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('71','inalbum_check','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('72','msite','��վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('65','id','ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('66','exit','�˳�','0');
INSERT INTO {$tblprefix}alangs VALUES ('67','altype','�ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('68','author','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('64','current_album_set','�Ѿ�����ĺϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('63','modify_album_copys','�޸ĺϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('60','catas_album_set','��Ŀ��ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('61','permission_set','Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('62','modify_album','�޸ĺϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('53','freesale','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('52','arc_price','����ĵ��ۼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('54','annex_price','���������ۼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('55','archive_content_template','�ĵ�����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('56','archive_plus_page','�ĵ�����ҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('57','template','ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('58','add','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('59','add_album','��Ӻϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('50','content_permissions','����Ȩ�޷���','0');
INSERT INTO {$tblprefix}alangs VALUES ('47','day','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('48','max','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('49','set_valid_day','������Ч��(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('39','catasalbumset','��Ŀ��ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('40','be_catalog','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('41','noset','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('42','belong_album','�����ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('43','input_albumid','���������ϼ�ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('44','content_set','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('45','more_set','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('46','mini','��С','0');
INSERT INTO {$tblprefix}alangs VALUES ('73','exit_album','�˳��ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('74','all_catalog','ȫ����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('75','all_altype','ȫ���ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('76','filter0_want_in_album','ɸѡ��Ҫ����ĺϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('77','belong_altype','�����ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('78','search_title','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('79','search_author','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('80','agsearchkey','�ɺ�ͨ��� *','0');
INSERT INTO {$tblprefix}alangs VALUES ('81','add_date','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('82','day_before','��ǰ','0');
INSERT INTO {$tblprefix}alangs VALUES ('83','day_in','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('84','album_list','�ϼ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('85','choose_want_setin_album','��ѡ����Ҫ����ĺϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('86','title','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('87','setalbum','�鼭','0');
INSERT INTO {$tblprefix}alangs VALUES ('88','exit_album_admin','�˳��ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('89','archive_exit_album','�ĵ��˳��ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('90','setalbum_admin','�鼭����','0');
INSERT INTO {$tblprefix}alangs VALUES ('91','archive_manager','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('92','album_manager','�ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('93','detail','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('94','abover','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('95','load','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('96','inalbum_content_manager','�������ݹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('97','inalbum_content_list','���������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('98','clear','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('99','type','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('100','check','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('101','inalbum_order','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('102','edit','�༭','0');
INSERT INTO {$tblprefix}alangs VALUES ('103','submit','�ύ','0');
INSERT INTO {$tblprefix}alangs VALUES ('104','admin_album','����ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('105','all_channel','ȫ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('106','filter0_archive_album','ɸѡ�ĵ���ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('107','archive_belong_channel','�ĵ�����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('108','marchtmldir','��Ա������̬�ļ�Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('109','album_belong_type','�ϼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('110','content_load_list','��ѡ����Ҫ���ص��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('111','goback','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('112','channel_album','ģ�ͻ�ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('113','based_msg','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('114','marchtmlurl','��Ա������̬url��ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('115','archive_title','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('116','member_cname','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('117','add_time','���ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('118','update_time','����ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('119','readd_time','�ط���ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('120','end1_time','����ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('121','check_state','���״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('122','uncheck','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('123','clicks','�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('124','comments','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('125','othermessage','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('126','nocheck','δ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('127','checked','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('128','nolimit','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('129','nocheck_album','δ��ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('130','checked_album','����ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('131','noabover_album','δ���ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('132','abover_album','���ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('133','invalid','��Ч','0');
INSERT INTO {$tblprefix}alangs VALUES ('134','available','��Ч','0');
INSERT INTO {$tblprefix}alangs VALUES ('135','filter0_album','ɸѡ�ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('136','validperiod_state','��Ч��״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('137','weather_abover','�Ƿ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('138','order_prior_smaller','�������ȼ�С��','0');
INSERT INTO {$tblprefix}alangs VALUES ('139','look','�鿴','0');
INSERT INTO {$tblprefix}alangs VALUES ('140','nocata','�ݸ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('141','admin','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('142','selectallpage','ȫѡ����ҳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('143','order','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('144','message','��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('145','album','�ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('146','cancel','ȡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('147','operate_item','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('148','delete_album','ɾ���ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('149','archive_readd','�ĵ��ط���','0');
INSERT INTO {$tblprefix}alangs VALUES ('150','auto_abstract','�Զ�ժҪ','0');
INSERT INTO {$tblprefix}alangs VALUES ('151','auto_thumb','�Զ�����ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('152','stat_attachment_size','ͳ�Ƹ�����С','0');
INSERT INTO {$tblprefix}alangs VALUES ('153','auto_keyword','�Զ��ؼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('154','check_album','��˺ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('155','album_weather_abover','�ϼ��Ƿ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('156','setalbum_input_album_id','�鼭(������ϼ�ID)','0');
INSERT INTO {$tblprefix}alangs VALUES ('157','reset_validperiod_days','������Ч��(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('158','order_prior','�������ȼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('159','album_admin','����ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('160','album_list_operate','�ϼ��б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('176','marchiveslist','��Ա�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('162','update_copys','���¸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('163','no_update_copys','�޸��¸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('164','yes_update_copys','�и��¸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('165','album_channel','�ϼ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('166','update_need','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('167','allow_update','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('168','copys','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('169','original','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('170','allow','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2884','novalidtype','û���κ���Ч����','0');
INSERT INTO {$tblprefix}alangs VALUES ('172','disagreeupdate','���ز�ɾ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2882','add_inalbum','�� %s ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2898','choosecoclass','��ѡ�� %s ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('206','edswomanli','�༭�������ʹ����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('205','addsword','��ӱ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('203','modify','�޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('204','swordillegal','�������ʲ��Ϲ淶','0');
INSERT INTO {$tblprefix}alangs VALUES ('202','del','ɾ?','0');
INSERT INTO {$tblprefix}alangs VALUES ('201','swordmanager','�������ʹ���&nbsp;:&nbsp;(����&nbsp;: %s)','0');
INSERT INTO {$tblprefix}alangs VALUES ('200','imphotkey','��ϵͳ�������Źؼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('199','marchivesedit','��Ա���������޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('198','choose_item','ѡ�������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('197','memberid','��ԱID','0');
INSERT INTO {$tblprefix}alangs VALUES ('196','matype','��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('195','marchive','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('194','search_member','������Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('193','filter0','ɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('207','impamomaxlim','����ؼ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('208','add_altype','��Ӻϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('209','fromidmod','ָ��ID������','0');
INSERT INTO {$tblprefix}alangs VALUES ('210','keyvpclar','�����ô�����Ҫ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('211','import','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('212','altype_name','�ϼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('213','handaddswo','�ֶ���ӱ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('214','sword','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('215','album_cover_channel','�ϼ�����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('216','relateurl','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('217','vpcs','���ô���','0');
INSERT INTO {$tblprefix}alangs VALUES ('218','altype_admin','�ϼ����͹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('219','achannel','�ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('220','enable','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('221','cover_channel','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('222','addvote','���ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('223','votetitle','ͶƱ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('224','mchannel','��Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('225','votecoc','ͶƱ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('226','voteexpl','ͶƱ˵��','0');
INSERT INTO {$tblprefix}alangs VALUES ('227','endtime','����ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('228','weathermsel','�Ƿ����ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('229','delete','ɾ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('230','fornouservote','��ֹ�ο�ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('231','limitedrevo','�����ظ�ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('232','idsourcetype','ָ��ID��Դ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('233','editaltypemanagerlist','�༭�ϼ����͹����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('234','repvotetimemin','�ظ�ͶƱʱ��(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('235','altype_set','�ϼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('236','inalbum_add_archive','����������������ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('237','inalbum_add_album','������������������ͺϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('238','pointid','ָ��ID����Ϊ����ID��','0');
INSERT INTO {$tblprefix}alangs VALUES ('239','setalbum_auto_check','�鼭�Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('240','albumoneuser','�ϼ����ߵĸ�����Ʒ�ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('241','allcoclass','ȫ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('242','nocheckvote','δ��ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('243','noovervote','δ����ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('244','filvote','ɸѡͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('245','cotype','��ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('246','belongcocl','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('247','alang_manager','��̨���԰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('248','ischeckvo','�Ƿ����ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('249','coclass','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('250','usergroup','��Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('251','isovevo','�Ƿ����ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('252','mlang_manager','��Ա���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('253','clang_manager','ǰ̨�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('254','schoise','��ѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('255','amsg_manager','��̨��ʾ','0');
INSERT INTO {$tblprefix}alangs VALUES ('256','mmsg_manager','��Ա������ʾ','0');
INSERT INTO {$tblprefix}alangs VALUES ('257','cmsg_manager','ǰ̨��ʾ','0');
INSERT INTO {$tblprefix}alangs VALUES ('258','votmanlis','ͶƱ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('259','alang_filter','��̨���԰�ɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('260','search_keyword','�����ؼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('261','alang_admin','��̨���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('262','enddate','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('263','add_alang','��Ӻ�̨�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('264','editvote','�༭ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('265','voteenddate','ͶƱ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('266','edit_alang_list','�༭��̨������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('267','ename','��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('268','remark','��ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('269','cannotrepevote','�����ظ�ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('270','reptimintmin','�ظ�ͶƱʱ����(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('271','voteoption','ͶƱѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('272','optiontitle','ѡ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('273','optioorder','ѡ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('274','checkvote','����ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('275','mchoise','��ѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('276','alang_ename','��̨�������ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('277','votenum','Ʊ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('278','addvoteopt','���ͶƱѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('279','alang_remark','��̨�������ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('280','alang_content','��̨���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('281','edit_alang','�༭��̨�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('282','addvotcoc','���ͶƱ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('283','cocname','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('284','edit_alang_detail','�༭��̨���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('285','votcocman','ͶƱ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('286','sn','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('287','choose_operate_type','ѡ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('288','del_alert','ɾ�����ָܻ���ȷ��ɾ����ѡ��Ŀ?','0');
INSERT INTO {$tblprefix}alangs VALUES ('289','confirmclick','ȷ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('290','mmsg_filter','��Ա������ʾ��Ϣɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('291','giveupclick','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('292','nocheckalter','δ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('293','checkedalter','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('294','filaltrec','ɸѡ�����¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('295','viewdetail','��ʾ��ϸ','0');
INSERT INTO {$tblprefix}alangs VALUES ('296','altchesta','������״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('297','altadddate','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('298','user0','�����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('299','altneetim','�������ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('300','alterremark','�����ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('301','add_mmsg','��ӻ�Ա������ʾ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('302','mmsg_ename','��Ա������ʾ��Ϣ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('303','adminreply','����Ա�ظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('304','mmsg_remark','��Ա������ʾ��Ϣ��ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('305','mmsg_content','��Ա������ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('306','mmsg_jump_url','��Ա������ʾ��Ϣ��ת����','0');
INSERT INTO {$tblprefix}alangs VALUES ('307','mmsg_view_url','��Ա������ʾ��Ϣ��ʾ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('308','moduseralter','�޸Ļ�Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('309','mmsg_admin','��Ա������ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('310','useraltetmodope','��Ա���������޸Ĳ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('311','edit_mmsg_list','�༭��Ա������ʾ��Ϣ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('312','edit_mmsg','�༭��Ա������ʾ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('313','useraltlist','��Ա�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('314','edit_mmsg_detail','�༭��Ա������ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('315','sourceuser','��Դ��Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('316','cmsg_filter','ǰ̨��ʾ��Ϣɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('317','targetusergroup','Ŀ���Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('318','cmsg_admin','ǰ̨��ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('319','add_cmsg','���ǰ̨��ʾ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('320','edit_cmsg_list','�༭ǰ̨��ʾ��Ϣ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('321','cmsg_ename','ǰ̨��ʾ��Ϣ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('322','cmsg_remark','ǰ̨��ʾ��Ϣ��ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('323','cmsg_content','ǰ̨��ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('324','cmsg_jump_url','ǰ̨��ʾ��Ϣ��ת����','0');
INSERT INTO {$tblprefix}alangs VALUES ('325','cmsg_view_url','ǰ̨��ʾ��Ϣ��ʾ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('326','edit_cmsg','�༭ǰ̨��ʾ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('327','edit_cmsg_detail','�༭ǰ̨��ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('328','useraltadm','��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('329','setting','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('330','albumonlyone','���ݲ��ܹ���������ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('331','isonlyloadalbum','�Ƿ�����Ժϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('332','agonlyload','ֻ���ɺϼ�������ȡ�������ݵ��ϼ��У���������������������˳��˺ϼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('333','enableinalbumcount','���ü���ͳ�ƺϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('334','inalbummaxlimit','�������������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('335','albumcctpl','�ϼ���������ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('336','useraltlisadmoper','��Ա�����б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('337','usereeopt','��Ա������ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('338','altergroup','�����Ա����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('339','albumplustpl','�ϼ����渽��ҳ%sģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('340','album_add_tpl','�ϼ����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('341','useraltmode','��Ա������ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('342','album_prepage_tpl','�ϼ�����ǰ��ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('343','usuatitle','�������ӱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('344','album_add_p_set','�ϼ����Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('346','usualurl','��������URL','0');
INSERT INTO {$tblprefix}alangs VALUES ('347','detail_modify_altype','��ϸ�޸ĺϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('348','del_altype','ɾ���ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('349','adminbapmanager','��̨����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('350','usuorder','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('351','adminbapadd','��̨���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('352','urlimage','����ͼƬ','0');
INSERT INTO {$tblprefix}alangs VALUES ('353','adminbapname','��̨����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('354','belsitforuse','����վ���ֹʹ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('355','editbaprojectlist','�༭��̨�����������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('356','tagtemplate','��ʶ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('357','projectname','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('358','inhitatt','�̳�վ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('359','addadminbap','��Ӻ�̨������','0');
INSERT INTO {$tblprefix}alangs VALUES ('377','aaddusualurl','��ӳ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('361','edusudet','�༭������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('362','tagjspick','�Ƿ�����JS��̬���ݵ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('363','selectall','ȫѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('364','msitebasshieldmenu','�����̨������ʾ�Ĳ˵���','0');
INSERT INTO {$tblprefix}alangs VALUES ('365','addusualurl','���%s��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('366','newwin','�´��ڴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('367','list_result','�б�����ʾ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('368','list_cols','��Ϊ������ʾ','0');
INSERT INTO {$tblprefix}alangs VALUES ('369','chourlty','ѡ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('370','marchive_list','��Ա�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('371','marchive_mod','������Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('372','ediusuli','�༭���������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('373','caid_attr','������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('374','adminbacuser','�����̨�û�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('375','colasslimit','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('376','memcenuse','��Ա�����û�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('378','atid_attr','�趨�ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('379','subsitebasshieldmenu','��վ��̨���� -  ѡ����Ҫ���εĲ˵�','0');
INSERT INTO {$tblprefix}alangs VALUES ('380','chid_attr','���������ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('381','memcenusua','��Ա���ĳ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('382','only_valid_period','ֻ������Ч���ڵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('383','contentadminforbid','���ݹ����ܽ�ֹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('384','forbidentersubsiteba','��ֹ����������վ��̨','0');
INSERT INTO {$tblprefix}alangs VALUES ('385','view_ch_field','��Ҫ��ʾ��ͨ���ֶ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('386','adminbackusual','�����̨��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('387','view_plus_stat','��Ҫ����ͳ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('388','agtagdetail','����ģ������Ϊ����ģ��ʱ��Ч���Ϻ���Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('389','agtagrec','��Ҫ�ܡ��¡����ϼƵ�ͳ����Ϣ�������ʾ���Լ�ɸѡʹ����archives_rec��ʱ����ѡ ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('390','urlusualurlmana','%s �������ӹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('391','forbidadmincatalog','��ֹ������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('392','forbidadminfcoclass','��ֹ��������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('393','forbidadmincmember','��ֹ��������ģ�͵Ļ�Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('394','detailmodifyabap','��ϸ�޸ĺ�̨������','0');
INSERT INTO {$tblprefix}alangs VALUES ('395','amsgfilter','��̨��ʾ��Ϣɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('396','amsgadmin','��̨��ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('397','addamsg','��Ӻ�̨��ʾ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('398','editamsglist','�༭��̨��ʾ��Ϣ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('399','amsgename','��̨��ʾ��Ϣ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('400','amsgremark','��̨��ʾ��Ϣ��ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('401','addscoclass','���%s����','0');
INSERT INTO {$tblprefix}alangs VALUES ('402','topiccoclass','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('403','amsgcontent','��̨��ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('404','amsg_jump_url','��̨��ʾ��Ϣ��ת����','0');
INSERT INTO {$tblprefix}alangs VALUES ('405','amsg_view_url','��̨��ʾ��Ϣ��ʾ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('406','editamsgdetail','�༭��̨��ʾ��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('407','editamsg','�༭��̨��ʾ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('408','uplevelcoclass','�ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('409','noadoptanswer','δ���ô�','0');
INSERT INTO {$tblprefix}alangs VALUES ('410','coclasspickurl','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('411','adoptedanswer','�����ô�','0');
INSERT INTO {$tblprefix}alangs VALUES ('412','filteranswer','ɸѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('413','isadoptedanswer','�Ƿ񱻲��ô�','0');
INSERT INTO {$tblprefix}alangs VALUES ('414','search_arc_title','�����ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('415','answer_list','���б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('416','question_title','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('417','member','��Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('418','coclassorder','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('419','adopt','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('420','award','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('421','accountin','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('422','ediusecocdet','�༭�û����ӷ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('423','source','��Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('424','answer_list_admin','���б����','0');
INSERT INTO {$tblprefix}alangs VALUES ('425','answer_list_a_operate','���б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('426','editsuserurl','�༭%s�û�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('427','edit_answer','�༭��','0');
INSERT INTO {$tblprefix}alangs VALUES ('428','question_state','����״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('429','userurlcname','�û���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('430','answer_title','���ɱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('431','userurlorder','�û���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('432','answer_content','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('433','question_closed','�����ѹر�','0');
INSERT INTO {$tblprefix}alangs VALUES ('434','ediuserdetail','�༭�û���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('435','question_noclose','����δ�ر�','0');
INSERT INTO {$tblprefix}alangs VALUES ('436','answer_content_edit','�����ݱ༭','0');
INSERT INTO {$tblprefix}alangs VALUES ('437','delusercoc','ɾ���û����ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('438','edit_answer_content','�༭������','0');
INSERT INTO {$tblprefix}alangs VALUES ('439','deleteuserurl','ɾ���û�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('440','addusecoc','����û����ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('441','acontent_by_catalog','����Ŀ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('442','nolimitchannel','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('443','addsuserurl','���%s�û�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('444','archive_admin','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('445','handpoint','�ֶ�ָ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('446','userurl','�û�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('447','archive','�ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('448','nolimitcatas','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('449','inputbealbumid','�ֶ����������ϼ�ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('450','suserurlmanager','%s�û����ӹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('451','add_archive','����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('452','activecatas','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('453','addurlcoclass','������ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('454','modify_archive','�޸��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('455','nearofactive','������Ŀ��������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('456','modify_arc_copys','�޸��ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('457','current_be_album','��ǰ�����ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('458','editsuserurlcoclass','�༭%s�û����ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('459','nocheck_archive','δ���ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('460','ediuserulist','�༭�û������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('461','include_son','���ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('462','url','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('463','checked_archive','�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('464','filter_archive','ɸѡ�ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('465','archive_channel','�ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('466','copy','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('467','check_archive','����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('468','addusergroup','��ӻ�Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('469','archive_list','�ĵ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('470','noalbum_archive','�Ǻϼ��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('471','channel','ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('472','editusergroup','�༭��Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('473','unstatic','�����̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('474','usergroupcname','��Ա������','0');
INSERT INTO {$tblprefix}alangs VALUES ('475','tostatic','������̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('476','all_archive','�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2881','inalbum_add_coids','��ӵ��ĵ��̳кϼ��ķ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('478','inchallowuse','��ѡ���û�Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('479','delete_archive','ɾ���ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('480','uservalid','��Ա����Ч��','0');
INSERT INTO {$tblprefix}alangs VALUES ('481','active_channel','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('482','alloissuearch','�������ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('483','allissuecomm','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('484','member_related','��Ա�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('485','allpurcgoods','��������Ʒ','0');
INSERT INTO {$tblprefix}alangs VALUES ('486','setalbum_input','�鼭(������ϼ�ID)','0');
INSERT INTO {$tblprefix}alangs VALUES ('487','alloissans','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('488','arc_update_admin','�ĵ����¹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('489','arc_list_aoperate','�ĵ��б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('490','allouploattach','�����ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('491','individual_list','����ʾ�����Ա���ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('492','allodownattach','�������ظ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('493','admibackaproje','��̨������','0');
INSERT INTO {$tblprefix}alangs VALUES ('494','active_uclass','ֻ��ʾ������˷�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3156','closequestion','�ر�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('496','allinsisear','����վ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('498','freeupdatecheck','������������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3146','memlogset','��Ա��½����','0');
INSERT INTO {$tblprefix}alangs VALUES ('500','nolimit_coclass','���޷���','0');
INSERT INTO {$tblprefix}alangs VALUES ('501','nospare','�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('502','freelooktaxcon','��Ѳ鿴�շ��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('503','spared','�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('504','freelooktaxattach','��Ѳ鿴�շѸ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('505','active_coclass','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('506','pmmountlimi','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3164','agadditems_m','��ѡ��ע���Աʱֻ��Ҫ��д�ʺš�������Email��','0');
INSERT INTO {$tblprefix}alangs VALUES ('508','nosetting','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('509','uploadlimited','�ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('510','downloadlimited','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('512','purgoodiscount','������Ʒ�ۿ�(%)','0');
INSERT INTO {$tblprefix}alangs VALUES ('513','isspared','�Ƿ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('514','relatcurramou','��ػ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('516','freesubarch','��Ѷ����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3161','crelates','��Ա���Ŀɹ�������ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3162','agrelates','��ѡ��ʾ��ǰ���ͻ�Ա���ܹ����κ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('519','freesubatta','��Ѷ��ĸ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('520','allarcdefamo','�޶��ĵ�Ĭ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('521','allcomdefamomon','�޶��Ĭ������/��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3163','additems_m','ע���»�Ա�Ŀ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('523','detmoduserg','�����޸Ļ�Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('524','reward_currency','���ͻ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('525','belonggroupty','������ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('526','spare','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('527','pointmatype','ָ����Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('528','base','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3160','arelates','�����̨�ɹ�������ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('530','exchange','�һ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('531','answer0','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('532','related','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('533','currency','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('534','answer_reward','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('535','usergroupcopy','��Ա�鸴��','0');
INSERT INTO {$tblprefix}alangs VALUES ('536','alter_record','�����¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('537','sousergname','Դ��Ա������','0');
INSERT INTO {$tblprefix}alangs VALUES ('538','noclose','δ�ر�','0');
INSERT INTO {$tblprefix}alangs VALUES ('539','newusergroupname','�»�Ա������','0');
INSERT INTO {$tblprefix}alangs VALUES ('540','closed','�ѹر�','0');
INSERT INTO {$tblprefix}alangs VALUES ('541','copyusergroup','���ƻ�Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('542','alltype','ȫ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('544','image','ͼƬ','0');
INSERT INTO {$tblprefix}alangs VALUES ('545','question_title_state','�������(״̬)','0');
INSERT INTO {$tblprefix}alangs VALUES ('546','flash','Flash','0');
INSERT INTO {$tblprefix}alangs VALUES ('547','question_det_content','������ϸ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('548','media','��Ƶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('549','other','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('550','reward_spare_appeal','���� / ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('551','nonethumb','������ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('552','question_adddate','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('553','answer_enddate','���ɽ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('554','havethumb','������ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3158','regtpl','ע��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('556','filteattachment','ɸѡ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('557','attachmenttype','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('558','aidstxt','����ĵ�ID(���ID�ö��Ÿ���)','0');
INSERT INTO {$tblprefix}alangs VALUES ('560','ishavethumb','�Ƿ�������ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('561','support','֧��','0');
INSERT INTO {$tblprefix}alangs VALUES ('562','attalistdeloper','�����б�ɾ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('563','question_alter_record','��������¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('564','answer_alter_record','�𰸱����¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('565','preview','Ԥ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('566','modify_date','�޸�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('567','thumb','����ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('568','content','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('569','uploaddate','�ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('570','uploadattadm','�ϴ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('571','add_badword','��Ӳ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('572','cname','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('573','badword','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('574','rword','�滻��','0');
INSERT INTO {$tblprefix}alangs VALUES ('575','sizek','��С(k)','0');
INSERT INTO {$tblprefix}alangs VALUES ('576','edit_badword_mlist','�༭�����ʹ����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('577','badword_manager','�����ʹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('578','indextemplate','��ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('579','cataspagetem','��Ŀҳ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('580','text','�����ı�','0');
INSERT INTO {$tblprefix}alangs VALUES ('581','albuconpagtemset','�ϼ�����ҳ��ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('582','multitext','�����ı�','0');
INSERT INTO {$tblprefix}alangs VALUES ('583','freconpagtemset','�������ҳ��ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('584','htmltext','Html�ı�','0');
INSERT INTO {$tblprefix}alangs VALUES ('585','arccomtemset','�ĵ�����ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('586','image_f','��ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('587','memcomtemset','��Ա����ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('588','images','ͼ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('589','sppagtemset','�ض�����ҳ��ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('590','flashs','Flash��','0');
INSERT INTO {$tblprefix}alangs VALUES ('591','basemset','����ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('592','arcconpagtemset','�ĵ�����ҳ��ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('593','medias','��Ƶ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('594','file_f','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('595','files_f','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('596','addconsub','���������վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('597','select','����ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('598','subsitecname','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('599','mselect','����ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('600','date_f','����(ʱ���)','0');
INSERT INTO {$tblprefix}alangs VALUES ('601','subsstadir','��վ��̬Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('602','int','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('603','substempldir','��վģ��Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('604','float','С��','0');
INSERT INTO {$tblprefix}alangs VALUES ('605','agtemplatedir','ֻ��Ҫ���ƣ�λ��templateĿ¼��','0');
INSERT INTO {$tblprefix}alangs VALUES ('606','common_message','ͨ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('607','archive_related','�ĵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('608','addsubsite','�����վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('609','catas_related','��Ŀ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('610','freeinfo_related','�����Ϣ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('611','subsitemanager','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('612','commu_message','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('613','msitetranstsubsite','��վתΪ��վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('614','transtomsite','תΪ��վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('615','index','��ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('616','choose_initag_type','ѡ��ԭʼ��ʶ�б�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('617','start','��ʼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('618','comment','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('619','purchase','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('620','subsittranstmsite','��վתΪ��վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('621','answer','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('622','delsubsite','ɾ����վ֮ǰ��������ո���վ����Ŀ,�ڵ�,�ϼ�����,�ĵ����ϼ�!','0');
INSERT INTO {$tblprefix}alangs VALUES ('623','pt','��ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('624','close','�ر�','0');
INSERT INTO {$tblprefix}alangs VALUES ('625','attachment','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('626','vote','ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('627','sublisadmope','��վ�б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('628','initag_common','ԭʼ��ʶ(ͨ��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('629','newsubset','����վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('630','createdate_desc','���ʱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('631','tagname','��ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('632','createdate_asc','���ʱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('633','use_style','ʹ����ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('634','poisubstatramsi','ָ������վ��ʼתΪ��վ!','0');
INSERT INTO {$tblprefix}alangs VALUES ('635','field_type','�ֶ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('636','related_tag','��ر�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('637','currencytype','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('638','refreshdate_desc','ˢ��ʱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('639','search_initag','����ԭʼ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('640','grouptype','��Ա����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('641','tagid_inc_string','��ʶID���ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('642','order_str','�����ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('643','commuitem','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('644','cotypem','�����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('645','create_str','�����ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('646','coclasssetting','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('647','startno','�б���ʼλ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('648','catascnode','��Ŀ�ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('649','affixchannel','���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('650','agstartno','���ð���ǰ���õĵڼ�����¼��ʼ��Ĭ��Ϊ0','0');
INSERT INTO {$tblprefix}alangs VALUES ('651','affixcoclass','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('652','isolutepage','����ҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('653','more_filter','����ɸѡ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('654','contsubsinst','������վ��װ','0');
INSERT INTO {$tblprefix}alangs VALUES ('655','list_order','�б���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('656','delinupdatandrec','ɾ����װ�ϴ��������¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('657','nextstep','��һ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('658','filter_sql_str','ɸѡ��ѯ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('659','tagname_inc_string','��ʶ���ƺ��ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('660','relay_param','����Ƕ��ʶ���ݲ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('661','tag_coclass','��ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('662','rrelay_param','�ϼ����Ͳ�����Ϊԭʼ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('663','search','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('664','undosetting','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('665','agrelays','����������Զ��Ÿ������� a,b=b_1 ������Ƕ��ʶ�У�ʹ��{$a}���ñ���ʶ��{$a}��ֵ����{$b_1}����{$b}��ֵ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('666','initag_search_result','ԭʼ��ʶ��������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('667','agrrelays','����������Զ��Ÿ������� a,b=b_1 ���ڵ�ǰģ���У�ʹ��{$a}�����ϼ���ʶ�е�{$a}����{$b_1}����{$b}��','0');
INSERT INTO {$tblprefix}alangs VALUES ('668','delsubinsupdatandrec','ɾ����վ��װ�ϴ������밲װ��¼!','0');
INSERT INTO {$tblprefix}alangs VALUES ('669','subsiteid','��վID','0');
INSERT INTO {$tblprefix}alangs VALUES ('670','currtypetran','��������ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('671','soucurid','��Դ����ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('672','tagclass','��ʶ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('673','tranurrentsys','ת�뵱ǰϵͳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('674','detail_coclass','��ϸ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('675','memchantransto','��Աģ��ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('676','soumemchaid','��Դ��Աģ��ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('677','soumemchname','��Դ��Աģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('678','subtemtra','��վģ��ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('679','templatesdo','ģ��do','0');
INSERT INTO {$tblprefix}alangs VALUES ('680','templatesundo','ģ��undo','0');
INSERT INTO {$tblprefix}alangs VALUES ('681','sourceid','��ԴID','0');
INSERT INTO {$tblprefix}alangs VALUES ('682','sourcecurrencycname','��Դ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('683','grouptypetransto','��Ա����ϵת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('684','sogrouptypeid','��Դ��Ա����ϵID','0');
INSERT INTO {$tblprefix}alangs VALUES ('685','add_catalog','�����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('686','sogroupname','��Դ��Ա����ϵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('687','base_setting','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('688','usertransto','��Ա��ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('689','catalog_name','��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('690','sourcegrouptype','��Դ��Ա����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('691','parent_catalog','����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('692','souusergrid','��Դ��Ա��ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('693','souusename','��Դ��Ա������','0');
INSERT INTO {$tblprefix}alangs VALUES ('694','commuitemtrans','������Ŀת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('695','isframe_catalog_r','�ṹ��Ŀ(��������Ŀ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('696','soucomitemid','��Դ������ĿID','0');
INSERT INTO {$tblprefix}alangs VALUES ('697','soucomitemname','��Դ������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('698','shipingtransto','�ͻ���ʽת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('699','catalog_smallsite','��Ŀ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('700','sourshipid','��Դ�ͻ���ʽID','0');
INSERT INTO {$tblprefix}alangs VALUES ('701','soushipname','��Դ�ͻ���ʽ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('702','allow_channel_archive','�����������ģ�͵��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('703','arcchatrans','�ĵ�ģ��ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('704','souarcchaid','��Դ�ĵ�ģ��ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('705','allow_type_album','��������������͵ĺϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('706','purchase_discount','������Ʒ�ۿ�(%)','0');
INSERT INTO {$tblprefix}alangs VALUES ('707','issue_arc_currency','�����ĵ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('708','arc_deduct_currency','����ĵ��۳�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('709','att_deduct_currency','���ػ򲥷Ÿ����۳�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('710','souarcchaname','��Դ�ĵ�ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('711','allow_sale_archive','�������߳����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('712','altypetransto','�ϼ�����ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('713','allow_sale_attachment','�������߳��۸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('714','arc_static_url_format','�Զ��ĵ���̬URL��ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('715','topic_catalog','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('716','noaward','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('717','direct_aid','ָ���ĵ�id(��ȱָ�����ĵ�)','0');
INSERT INTO {$tblprefix}alangs VALUES ('718','agcustomurl','��ֵΪϵͳĬ�ϸ�ʽ��{$y}�� {$m}�� {$d}�� {$h}ʱ {$i}�� {$s}�� {$chid}ģ��id  {$aid}�ĵ�id {$page}��ҳҳ�� {$addno}����ҳid��id֮�佨���÷ָ���_��-���ӡ��ĵ���̬�̶��ڶ�����Ŀ�����ɡ�','1264422980');
INSERT INTO {$tblprefix}alangs VALUES ('719','direct_maid','ָ����ԱID(��ȱָ�����Ա)','0');
INSERT INTO {$tblprefix}alangs VALUES ('720','iscustom_message','�Զ���Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('721','iscustom_catalog_field','�Զ���Ŀ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('722','sourcealtypeid','��Դ�ϼ�����ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('723','souraltyname','��Դ�ϼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('724','catalogtransto','��Ŀת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('725','catalog_manager','��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('726','soucatid','��Դ��ĿID','0');
INSERT INTO {$tblprefix}alangs VALUES ('727','sourcataname','��Դ��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('728','reset_parent_catalog','���踸��Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('729','cotypetransto','��ϵת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('730','coclasstransto','����ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('731','to_other_subsite','ת��������վ(�޶�����Ŀ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('732','sourcecotype','��Դ��ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('733','soucocid','��Դ����ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('734','soucoclcname','��Դ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('735','edit_catalog_mlist','�༭��Ŀ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('736','catcnotran','��Ŀ�ڵ�ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('737','soucatconfigid','��Դ��Ŀ�ṹID','0');
INSERT INTO {$tblprefix}alangs VALUES ('738','catalog_base_set','��Ŀ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('739','sourataonfigname','��Դ��Ŀ�ṹ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('740','freechantransto','���ģ��ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('741','del_catalog','ɾ����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('742','soufrechaid','��Դ���ģ��ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('743','add_catalog_field','�����Ŀ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('744','sourfreechanname','��Դ���ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('745','freecoctran','�����Ϣ����ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('746','catalog_msg_field_m','��Ŀ��Ϣ�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('747','soufrecocid','��Դ�������ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('748','soufrecoccna','��Դ�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('749','add_field','����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('750','isolpagtrans','����ҳ��ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('751','field_name','�ֶ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('752','souisopagid','��Դ����ҳ��ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('753','field_ename','�ֶα�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('754','souisopagcna','��Դ����ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('755','catalog_iscustom_msg','��Ŀ�Զ���Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('756','subcoliadmoper','���������б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('757','subconadm','�������ݹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('758','field_edit','�ֶα༭','0');
INSERT INTO {$tblprefix}alangs VALUES ('759','purchasedate','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('760','filsubrec','ɸѡ���ļ�¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('761','subscribetype','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('762','detail_modify_catalog','��ϸ�޸���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('763','contpurchdat','���ݹ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('764','continue','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('765','subsrecolis','���ļ�¼�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('766','add_catalog_msg_field','�����Ŀ��Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('767','edit_cmsg_field_mlist','�༭��Ŀ��Ϣ�ֶι����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('768','detail_mcmsg_field','��ϸ�޸���Ŀ��Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('769','channel_manager','ģ�͹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('770','channel_name','ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('771','ut_commu','���⽻��','0');
INSERT INTO {$tblprefix}alangs VALUES ('772','add_channel','���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('773','ut_commu_item','���⽻����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('774','arc_channel_copy','�ĵ�ģ�͸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('775','soc_channel_name','Դģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('776','soc_ccommu_config','Դģ�ͽ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('777','new_channel_name','��ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('778','new_ccommu_config','��ģ�ͽ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('779','plimits','ÿҳ��ʾ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('780','palimits','�ܽ��������(��Ϊ����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('781','nav_simple','�Ƿ����ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('782','nav_length','����ҳ�볤��','0');
INSERT INTO {$tblprefix}alangs VALUES ('783','masearchlist','��Ա���������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('784','arcconpage','�ĵ�����ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('785','pascresta','�������ɾ�̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('786','actcresta','�������ɾ�̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('787','cleolstfi','���ԭ��̬�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('788','repstaurl','�޸���̬����','0');
INSERT INTO {$tblprefix}alangs VALUES ('789','crearcpagsta','�����ĵ�ҳ��̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('790','stacremo','��̬����ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('791','choarcpaty','ѡ���ĵ�ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('792','passtadet','������̬���ٷ��Ӻ�ʼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('793','numperpic20_500','������������(20-500)','0');
INSERT INTO {$tblprefix}alangs VALUES ('794','filarcpagcurarcamo','ɸѡ�ĵ�ҳ--��ǰ�ĵ�����:&nbsp; &nbsp;','0');
INSERT INTO {$tblprefix}alangs VALUES ('795','edit_arc_channel_list','�༭�ĵ�ģ���б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('796','clickslarger','���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('797','commentlarger','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('798','arcstaadm','�ĵ���̬����','0');
INSERT INTO {$tblprefix}alangs VALUES ('799','copy_arc_channel','�����ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('800','channel_set','ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('801','sum','�ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('802','add_freeinfo','��Ӳ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('803','crecatcnodpagsta','������Ŀ�ڵ�ҳ��̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('804','admin_self_channel','����ר��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('805','common_option','ͨ��ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('806','arc_auto_check','�ĵ��Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('807','arc_auto_static','�ĵ��Զ���̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('808','message_coclass','��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('809','auto_abstract_src','�Զ�ժҪ��Դ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('810','state_message','״̬��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('811','indstaadm','��ҳ��̬����','0');
INSERT INTO {$tblprefix}alangs VALUES ('812','auto_thumb_src','�Զ�����ͼ��Դ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('813','auto_keyword_src','�Զ��ؼ�����Դ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('814','msg_buy_price','��Ϣ����۸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('815','auto_stat_asize_src','�Զ�ͳ�Ƹ�����С��Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('816','flong','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('817','buy_cell','����Ԫ','0');
INSERT INTO {$tblprefix}alangs VALUES ('818','mini_buy_cell_amount','��С����Ԫ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('819','msg_content_checked','��Ϣ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('820','msg_content_nocheck','��Ϣ����δ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('821','auto_stat_a_size_mode','�Զ�ͳ�Ƹ�����Сģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('822','effecting_msg','��Ч����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('823','baidu_map_src','Baidu��ͼ������Դ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('824','catasindex','��Ŀ��ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('825','fulltxt_search_src','ȫ��������Դ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('826','start_date','��ʼ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('827','cataslistpage','��Ŀ�б�ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('828','catasbklist','��Ŀ����ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('829','oneof','����֮һ','0');
INSERT INTO {$tblprefix}alangs VALUES ('830','topic','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('831','level2','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('832','noeffect_msg','δ��Ч��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('833','arc_prepage_tpl','�ĵ�ǰ��ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('834','level3','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('835','level4','�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('836','search_tpl','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('837','arc_add_tpl','�ĵ����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('838','choatpaty','ѡ����Ŀҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('839','commu_item_sett','[%s]������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('840','msg_current_state','��Ϣ��ǰ״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('841','comment_commu_setg','���۽�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('842','reply_commu_set','�ظ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('843','detail0_modify_freeinfo','��ϸ�޸Ĳ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('844','offer_commu_set','���۽�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('845','pickbug_commu_set','�ٱ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('846','nocheck_msg','δ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('847','is_allowance_arc','�Ƿ��޶��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('848','not_enable_readd','�������ط���','0');
INSERT INTO {$tblprefix}alangs VALUES ('849','checked_msg','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('850','allowance_and_vp','�޶�����Ч��','0');
INSERT INTO {$tblprefix}alangs VALUES ('851','ba_allow_readd','��̨�����ط���','0');
INSERT INTO {$tblprefix}alangs VALUES ('852','filter0_msg','ɸѡ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('853','member_allow_readd','��Ա�����ط���','0');
INSERT INTO {$tblprefix}alangs VALUES ('854','readd_set','�ط�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('855','readd_time_inval_h','�ط���ʱ����(Сʱ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('856','ficatcnocuo','ɸѡ��Ŀ�ڵ�--��ǰ�ڵ�����:&nbsp; &nbsp;','0');
INSERT INTO {$tblprefix}alangs VALUES ('857','check_msg','�����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('858','not_enable_vp','��������Ч��','0');
INSERT INTO {$tblprefix}alangs VALUES ('859','mainlinemode','Ƶ��ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('860','over_reset_vp','���ں�������Ч��','0');
INSERT INTO {$tblprefix}alangs VALUES ('861','cnodelevelnum','�ڵ㼶��','0');
INSERT INTO {$tblprefix}alangs VALUES ('862','msg_list','��Ϣ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('863','anytime_reset_vp','��ʱ������Ч��','0');
INSERT INTO {$tblprefix}alangs VALUES ('864','catcnostaadm','��Ŀ�ڵ㾲̬����','0');
INSERT INTO {$tblprefix}alangs VALUES ('865','arc_vp_set','�ĵ���Ч������','0');
INSERT INTO {$tblprefix}alangs VALUES ('866','cnliadmope','�ڵ��б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('867','vp_days','��Ч������','0');
INSERT INTO {$tblprefix}alangs VALUES ('868','create_static','���ɾ�̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('869','admin_self','����ר��','0');
INSERT INTO {$tblprefix}alangs VALUES ('870','del_msg','ɾ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('871','add_arc_channel','����ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('872','email','Email','0');
INSERT INTO {$tblprefix}alangs VALUES ('873','default','Ĭ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('874','check_msg_content','�����Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('875','tpl_set','ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('876','insitepm','վ�ڶ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('877','msg_content_page0_static','��Ϣ����ҳ��̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('878','nouser','�ο�','0');
INSERT INTO {$tblprefix}alangs VALUES ('879','nolimittype','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('880','issue_permission_set','����Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('881','filtersplang','ɸѡ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('882','spltemadmin','��������ģ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('883','field_manager','�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('884','freeinfo_admin','�����Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('885','detail_marc_channel','��ϸ�޸��ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('886','freeinfo_list_admin','�����Ϣ�б����','0');
INSERT INTO {$tblprefix}alangs VALUES ('887','splangcname','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('888','add_arc_channel_field','����ĵ�ģ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('889','splangtype','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('890','is_func_field','�Ƿ����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2796','lic_no','��Ȩ�ţ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('892','add_achannel_msg_field','����ĵ�ģ����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('893','detaimodifysplang','��ϸ�޸Ĺ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('894','del_arc_channel','ɾ���ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('895','splangset','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('896','edit_channel_field','�༭ģ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('897','msg_coclass_manager','��Ϣ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('898','sitepageadmin','Sitemapҳ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('899','detail_mach_msg_field','��ϸ�޸��ĵ�ģ����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('900','consult','��ѯ','0');
INSERT INTO {$tblprefix}alangs VALUES ('901','add_common_field','���ͨ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('902','sitemapcname','Sitemap����','0');
INSERT INTO {$tblprefix}alangs VALUES ('903','common_field_manager','ͨ���ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('904','add_msg_coclass','�����Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('905','dynamicurl','��̬����','0');
INSERT INTO {$tblprefix}alangs VALUES ('906','xmlurl','xml����','0');
INSERT INTO {$tblprefix}alangs VALUES ('907','edit_acm_field_mlist','�༭�ĵ�ͨ����Ϣ�ֶι����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('908','create','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('909','freeinfo_channel','���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('910','detail_mac_msg_field','��ϸ�޸��ĵ�ͨ����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('911','sitemapsetting','Sitemap����','0');
INSERT INTO {$tblprefix}alangs VALUES ('912','add_acm_field','����ĵ�ͨ����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('913','dynapickurl','��̬��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('914','xmlpickurl','xml��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('915','weather_consult_coclass','�Ƿ���ѯ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('916','isenable','�Ƿ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('917','upperiodhours','��������(Сʱ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('918','edit_freeinfo_list','�༭�����������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('919','limitdayarchive','�޶�����������ӵ��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('920','cataloglimi','��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('921','limited','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('922','addshiping','����ͻ���ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('923','shiiteadm','�ͻ���ʽ��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('924','add_freeinfo_coclass','��Ӳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('925','msg_coclass_set','��Ϣ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('926','msg_auto_check','��Ϣ�Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('927','dbsrc_data_miss','�ⲿ����Դ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}alangs VALUES ('928','author_update_checked_msg','���߿��Ը���������Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('929','dbsrc_connect_error','�ⲿ����Դ���Ӵ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('930','freetop','��Ѷ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('931','dbsrc_connect_correct','�ⲿ����Դ������ȷ','0');
INSERT INTO {$tblprefix}alangs VALUES ('932','edishimanlis','�༭�ͻ���ʽ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('933','shipingset','�ͻ���ʽ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('934','test_mail','08CMS�����ʼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('935','email_test_succeed','Email���Գɹ�!','0');
INSERT INTO {$tblprefix}alangs VALUES ('936','detaimodiship','��ϸ�޸��ͻ���ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('937','msg_con_tpl','��Ϣ����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('938','freetopyuan','��Ѷ��(Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('939','consult_set','��ѯ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('940','basedfeeyuan','��������(Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('941','bystep_config_cnode','���������ýڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('942','plusfee1','���ӷ���1','0');
INSERT INTO {$tblprefix}alangs VALUES ('943','pluscontent','��ѡΪ�̶�ֵ(Ԫ)<br>\r\n���򸽼ӷ�=����ֵ������ֵ%','0');
INSERT INTO {$tblprefix}alangs VALUES ('952','issue1_tax_set','�����շ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('945','allow_reply_usergroup','���Իظ���Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('946','plusfee2','���ӷ���2','0');
INSERT INTO {$tblprefix}alangs VALUES ('947','commu_content_length','�������ݳ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('948','node_step2','����2  �޸���Ŀ�ṹ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('949','overw1staweightkg','����1��ʼ����(Kg)','0');
INSERT INTO {$tblprefix}alangs VALUES ('950','node_step1','����1  �����Ŀ�ṹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('951','overw1weighkg','����1�Ʒѵ�Ԫ(Kg)','0');
INSERT INTO {$tblprefix}alangs VALUES ('953','overw1priyuan','����1�۸�(Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('954','node_step3','����3  �������ø�����Ŀ�ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('955','overw2stawkg','����2��ʼ����(Kg)','0');
INSERT INTO {$tblprefix}alangs VALUES ('956','save_config','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('957','overw2weigkg','����2�Ʒѵ�Ԫ(Kg)','0');
INSERT INTO {$tblprefix}alangs VALUES ('958','overw2priyuan','����2�۸�(Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('959','tax_currency_type','�շѻ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('960','edit_catas_cmlist','�༭��Ŀ�ṹ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('961','tax_cell','�շѵ�Ԫ','0');
INSERT INTO {$tblprefix}alangs VALUES ('962','shipdatamiss','�ͻ���ʽ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}alangs VALUES ('963','catas_cdescription','��Ŀ�ṹ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('964','contseaurl','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('965','mainline_cotype','Ƶ����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('966','agmainline','�ṹ�е�������ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('967','searformurl','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('968','tax_price','�շѼ۸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('969','searesurl','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('970','add_catas_configs','�����Ŀ�ṹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('971','more','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('972','currency_cell','����/��Ԫ','0');
INSERT INTO {$tblprefix}alangs VALUES ('973','keyword','�ؼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('974','cnode_name','�ڵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('975','cnode_alias','�ڵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('976','seaparset','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('977','taxmini','ÿ�ι�������(��Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('978','searchmode1','������ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('979','cnode_url','ָ���ڵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('980','index_tpl','��ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('981','indays','�������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('982','online_msg_amount','������Ϣ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('983','list_tpl','�б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('984','outdays','��������ǰ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('985','bklist_tpl','����ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('986','ordertype','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('987','agappurl','վ��Url��վ��Url����','0');
INSERT INTO {$tblprefix}alangs VALUES ('988','isasc','�Ƿ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('989','detail_catas_cnode','��ϸ��Ŀ�ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('990','seasettres','�������ý��','0');
INSERT INTO {$tblprefix}alangs VALUES ('991','agcncorder','��Ϊѡ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('992','del_freeinfo_coclass','ɾ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('993','ctaquestr','���ϱ�ʶ��ѯ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('994','cnode_all','һ������ȫ���ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('995','cnode_cnc','cnode_cnc','0');
INSERT INTO {$tblprefix}alangs VALUES ('996','remproman','Զ�̷�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('997','cnode_top','cnode_top','0');
INSERT INTO {$tblprefix}alangs VALUES ('998','update','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('999','projecttype','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1000','filetypeext','�ļ�������չ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1001','update_catas_cnode','������Ŀ�ṹ�ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1002','edit_freeinfo_channel_list','�༭���ģ�͹����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1003','nolimit_outconfig','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1004','iscustom','�Զ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1005','outconfig_cnode','����ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1006','system','ϵͳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1007','inconfig_cnode','�����ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1008','message_title','��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1009','addrempro','���Զ�̷���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1010','ediremuplpro','�༭Զ���ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1011','is_outconfig_cnode','�Ƿ�����ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1012','editprojlist','�༭�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1013','cnode_levelnum','�ڵ㽻������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1014','add_freeinfo_channel','��Ӳ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1015','addremouplpro','���Զ���ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1016','outconfig','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1017','remdowfityp','Զ�������ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1018','catas_cnode_list','��Ŀ�ڵ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1019','fileext','�ļ���չ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1020','field','�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1021','maxlimited','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1022','del_cnode','ɾ���ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1023','minilimited','��С����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1024','cnode_index_tpl','�ڵ���ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1025','savecoclass','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1026','otherset','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1027','cnode_list_tpl','�ڵ��б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1028','cnode_bklist_tpl','�ڵ㱸��ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1029','down_timeout','���س�ʱ����(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1030','add_free_channel_field','��Ӳ��ģ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1031','excludestxt','���Ժ������ִ���Զ���ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1032','agexcludes','�������趨������ĳЩ��ַ��Զ���ļ���ÿ������һ���ִ���ȫ���������𳬹�255�ֽڡ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1033','config_name','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1034','agnolimit','0��ձ�ʾ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1035','catas_configs','��Ŀ�ṹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1036','addfiletype','����ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1037','filter_cnode','ɸѡ�ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1038','filesavecoclass','�ļ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1039','mainline','Ƶ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1040','detail0_modify_freeinfo_channel_field','��ϸ�޸Ĳ��ģ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1041','catalog_attr','��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1042','list_page0','�б�ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1043','bklist','����ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1044','delete_freeinfo_channel','ɾ�����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1045','nosettle','δ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1046','cnode_admin_operate','�ڵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1047','cnode_list_admin','�ڵ��б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1048','cnode_detail_set','�ڵ���ϸ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1049','addremupprofity','���Զ���ϴ������ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1050','dealing0','���ڴ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1051','coclass_ename','�����ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1052','settled','�ѽ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1053','detmodremouplpro','��ϸ�޸�Զ���ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1054','parent_coclass','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1059','purcgood','�ѹ���Ʒ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1056','coclass_smallsite','���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1057','nopurgoods','δ����Ʒ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1058','filter0_consult_msg','ɸѡ��ѯ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1060','isframe_coclass_i','�ṹ����(�����ӷ���)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1061','filpicarc','ɸѡ�ٱ��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1062','belongchannel','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1063','deal_state','����״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1064','piclisadmope','�ٱ��б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1065','picklistadmin','�ٱ��б����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1066','clearrecord','�����¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('1067','allow_sale_arc','�������߳����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1068','amount','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1069','allow_sale_att','�������߳��۸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1070','pickrcli','�ٱ��ĵ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1071','all_state','ȫ��״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1072','time','ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1073','reason','ԭ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1074','consult_msg_list','��ѯ��Ϣ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1075','mode1','��ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1076','praise_pics','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1077','usercname','�û�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1078','debase_pics','�ȴ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1079','userid','�û�ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('1080','state','״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1081','address','��ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1082','arc_acondition_set','�ĵ��Զ�������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1083','operate','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1084','favorite_pics','�ղش���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1085','tryusercname','�����û�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1086','consult_based_msg','��ѯ������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1087','goods_orders_amount','��Ʒ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1088','trypassword','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1089','goods_price','��Ʒ�۸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1090','operatetime','����ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1091','answer_amount','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1092','crrecord','���ֱ����־','0');
INSERT INTO {$tblprefix}alangs VALUES ('1093','answer_reward_currency','�������ͻ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1094','loginerrrecord','��¼������־','0');
INSERT INTO {$tblprefix}alangs VALUES ('1095','adminoperate','���������־','0');
INSERT INTO {$tblprefix}alangs VALUES ('1096','is_answer_close','�����Ƿ��ѹر�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1097','consult_coclass_title','��ѯ���� / ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1098','create_string','�����ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1099','iscustom_coclass_field','�Զ������ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1100','consult_member_add_update','��ѯ��Ա / ��� / ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1101','set_state','����״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1102','consult_commu_list','��ѯ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1103','refmssyscac','ˢ����վϵͳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1104','udef_query_string','�û������ѯ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1105','refsubsyca','ˢ����վϵͳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1106','consult_reply_content','��ѯ��ظ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1107','end','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1108','add_arc_coclass','����ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1109','reply','�ظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1110','coclass_manager','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1111','add_coclass','��ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1112','son_coclass','�ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1113','reply_content','�ظ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1114','edit_acoclass_mlist','�༭�ĵ���������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1115','detail_marc_coclass','��ϸ�޸��ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1116','del_arc_coclass','ɾ���ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1117','html_to_txt','HtmlText�ֶ�תΪ�ı����� - �ĵ�ͨ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1118','filter_comment','ɸѡ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1119','is_check','�Ƿ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1120','bassyscac','����ϵͳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1121','del_comment','ɾ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1122','table_to_txt','���ݱ�תΪ�ı�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1123','check_comment','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1124','intagquliac','ԭʼ��ʶ��ѯ�б���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1125','catcnocac','��Ŀ�ڵ㻺��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1126','comment_list','�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1127','comment_content','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1128','txt_to_table','�ı�����תΪ���ݱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1129','goolisdmope','��Ʒ�б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1130','score','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1131','gooliadm','��Ʒ�б����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1132','orders','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1133','release_check','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1134','nocheck_orders','δ�󶩵�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1135','arc_comment_admin','�ĵ����۹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1136','comment_list_admin','�����б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1137','filtgoods','ɸѡ��Ʒ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1138','edit_comment','�༭����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1139','ispurchased','�Ƿ��ѹ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1140','comment_title','���۱���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1141','filter0_orders','ɸѡ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1142','arc_score','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1143','arc_comment_edit','�ĵ����۱༭','0');
INSERT INTO {$tblprefix}alangs VALUES ('1144','edit_comment_content','�༭��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1145','praise_no','��/��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1146','pickbug','�ٱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1147','favorite','�ղ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1148','offer','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1149','item_name','��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1150','pick_url_style','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1151','edit_citem_mlist','�༭������Ŀ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1152','commu_item_copy','������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1153','soc_citem_name','Դ������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1154','soc_citem_type','Դ������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1155','new_citem_name','�½�����Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1156','copy_commu_item','���ƽ�����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1157','orders_check_state','�������״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1158','commu_item_set','������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1159','item_type','��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1160','is_allowance_citem','�Ƿ��޶����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3018','deleteorders','ɾ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1162','detail_modify_citem','��ϸ�޸Ľ�����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1163','check_orders','��˶���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1164','forbid_reoperate','��ֹ�ظ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1165','orders_admin','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1166','increase','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1167','decrease','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1168','orders_list_admin','�����б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1169','reoperate_time_m','�ظ�����ʱ��(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1170','forder_msg','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1171','detail0','��ϸ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1172','minscore','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1173','member_current_currency','��Ա��ǰ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1174','maxscore','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1175','udef_func','�û����庯��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1176','php_func_code','PHP��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1177','operate_permi_set','����Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1178','view','��ʾ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1179','ava_msg_field','��Ч��Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1180','isolute_page_manager','����ҳ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1181','add_report_tpl','��Ӿٱ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1182','comment_autocheck','�����Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1183','forbid_repeat_vote','��ֹ�ظ�ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1184','isolute_page_cname','����ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1185','add_comment_tpl','�������ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1186','comment_list_tpl','�����б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1187','page_template','ҳ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1188','admin_permi_set','����Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1189','goodslist','��Ʒ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1190','forbid_revote_support','��ֹ�ظ�ͶƱ֧��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1191','page_pick_url','ҳ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1192','answer_minlength','����С�ֳ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1193','answer_maxlength','������ֳ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1194','static','��̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1195','item_ava_days','��Ŀ��Ч����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1196','subscribe','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1197','citem_admin','������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1198','add_page_tpl','���ҳ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1199','add_isolute_page','��Ӷ���ҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1200','list_page_tpl','�б�ҳ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1201','isolute_page_template','����ҳ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1202','max_favorite_amount','����ղ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1203','purchasemember','�����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('1204','reward_currency_type','���ͻ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1205','gather_mission_manager','�ɼ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1206','allow_reward_max_cu','����������߻���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1207','goodscname','��Ʒ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1208','add_mission','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1209','onlyclearreadpm','������Ѷ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1210','credit_val_reward_cu','����ÿ�����ͻ��ֵõ�����ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1211','pmfromids','������ID(���ŷָ����ID)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1212','pmclearfilter','�������ɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3165','relate','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1214','mission_cname','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1215','pmcontent','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1216','pmtitle','���ű���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3166','allowance','�޶�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1218','gather_model','�ɼ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1219','add_answer_tpl','��Ӵ���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1220','pmcontentset','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1221','handworkchoose','�ֶ�ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1222','inalbum_mission','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1223','nolimitusergroup','���޻�Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1224','pmtonames','������(���ŷָ������Ա����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1225','netsite_gather','��ַ�ɼ�','1264120825');
INSERT INTO {$tblprefix}alangs VALUES ('1226','pmtoids','������(���ŷָ������ԱID)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1227','answer_list_tpl','�����б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1228','acceptmemberfilter','���ջ�Աɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1229','detmodmedpla','��ϸ�޸���Ƶ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1230','discount_nov','�ۿ���Ч','0');
INSERT INTO {$tblprefix}alangs VALUES ('1231','maxmode','���ֵģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1232','content_gather','���ݲɼ�','1264120841');
INSERT INTO {$tblprefix}alangs VALUES ('1233','playertemplate','������ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1234','addmode','�����ۼ�ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1235','defplayfileformat','Ĭ�ϲ����ļ���ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1236','cart_mode','���ﳵģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1237','playertype','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1238','playercname','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1239','single_goods_mode','����Ʒģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1240','playerset','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1241','goods_purchase_mode','��Ʒ����ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1242','edimedplalis','�༭��Ƶ�������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1243','discount1','�ۿ�1   ������Ŀ�ۿ�(%)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1244','addmedplay','�����Ƶ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1245','discount2','�Զ������Ա���ۿ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1246','discount3','�ۿ�3   ��Ŀ�ۿ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1247','alldcmode','�ۺ��ۿ�ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1248','addplayer','��Ӳ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1249','purchase_list_tpl','�����б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1250','offer_msg_autocheck','������Ϣ�Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1251','offer_msg_ava_days','������Ϣ��Ч����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1252','content_output','�������','1264120856');
INSERT INTO {$tblprefix}alangs VALUES ('1253','playermanager','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1254','add_offer_tpl','��ӱ���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1255','flashplayer','Flash������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1256','offer_list_tpl','�����б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1257','mediaplayer','��Ƶ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1258','detmodpermpro','��ϸ�޸�Ȩ�޷���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1259','auto_pro_av_price','�Զ����ɲ�Ʒƽ���۸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1260','detailset','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1261','detailpermis','����Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1262','no','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1263','lowest','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1264','prior','���ȼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1265','play','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1266','download','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1267','issuearchive','�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1268','catasbrowse','��Ŀ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1269','archivebrowse','�ĵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1270','edipermpromanlist','�༭Ȩ�޷��������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1271','addpermiproj','���Ȩ�޷���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1272','pleetdet','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1273','onekey_all_finish','һ��ȫ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1274','defaultproject','Ĭ�Ϸ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1275','permprojmana','Ȩ�޷�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1276','highest','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1277','low','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1278','center','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1279','high','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1280','visitingpay','����֧��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1281','postoffremit','�ʾֻ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1282','bigimage','��ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1283','paywarrant','֧��ƾ֤','0');
INSERT INTO {$tblprefix}alangs VALUES ('1284','contactemail','��ϵEmail','0');
INSERT INTO {$tblprefix}alangs VALUES ('1285','contatelep','��ϵ�绰','0');
INSERT INTO {$tblprefix}alangs VALUES ('1286','contaname','��ϵ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1287','currsavtime','���ֳ�ֵʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1288','casarrtim','�ֽ���ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1289','messsentim','��Ϣ����ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1290','payorderidsn','֧��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1291','payinter','֧���ӿ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1292','handrmbi','������(�����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1293','payamourmbi','֧������(�����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1294','paymode','֧��ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1295','paymesslook','֧����Ϣ�鿴','0');
INSERT INTO {$tblprefix}alangs VALUES ('1296','paymessamod','֧����Ϣ�޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1297','edit_gather_mission','�༭�ɼ���������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1298','paysavlisadmoper','֧����ֵ�б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1299','gather_mission_add','�ɼ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1300','cashsavadmin','�ֽ��ֵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1301','cashsav','�ֽ��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1302','payarrcansav','֧�����ʲ��ܳ�ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1303','formemcasaccsav','Ϊ��Ա�ֽ��ʻ���ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1304','gather_mission_cname','�ɼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1305','setarrsta','���õ���״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1306','belong_gather_mission','�����ɼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1307','is_create_av_price','�Ƿ�����ƽ���۸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1308','av_price_field_type','ƽ���۸��ֶ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1309','add_gather_mission','��Ӳɼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1310','av_price_field_ename','ƽ���۸��ֶα�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1311','gather_based_setting','�ɼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1312','onlynoartrarecdel','��δ���˻��ѳ�ֵ��֧����¼����ɾ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1313','delpayrec','ɾ��֧����¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('1314','choose_reward_cutype','��ָ����ȷ�����ͻ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1315','arrived','�ѵ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1316','noarrive','δ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1317','savdate','��ֵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1318','common_field','ͨ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1319','arrivedate','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1320','recodate','��¼����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1321','payamount','֧������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1322','paymember','֧����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('1323','channel_field','ģ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1324','test_rule','���Թ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1325','payrecolist','֧����¼�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1326','onlpayinter','����֧���ӿ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1327','currweattra','�����Ƿ��ѳ�ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1328','casweaarr','�ֽ��Ƿ��ѵ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1329','forbid_repeat_add','��ֹ�ظ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1330','filpayrec','ɸѡ֧����¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('1331','repeat_add_time_m','�ظ����ʱ��(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1332','transed','�ѳ�ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1333','notrans','δ��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1334','charset','ҳ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1335','reply_autocheck','�ظ��Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2992','cu_citems','���õķ�����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1337','banktransfer','����ת��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1339','onlinepay','����֧��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2991','cu_aitems','��������Ч������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1341','add_reply_tpl','��ӻظ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1342','downsyscondatfi','����ϵͳ���������ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1343','instwebscon','��װ��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1344','sameversion','�汾�ϸ�ƥ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1345','reply_list_tpl','�ظ��б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1346','login_website','��¼��վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1347','arc_subscribe_mode','�ĵ�����ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1348','tempfoldcnam','ģ���ļ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1349','uplfolcnam','�ϴ��ļ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1350','att_subscribe_mode','��������ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1351','add_comment','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1352','delsyscondafil','ɾ��ϵͳ���������ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1353','admin_arc_comment','����ָ���ĵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1354','expsyscondat','���ϵͳ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1355','edit_point_comment','�༭ָ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1356','arc_comment_list','ָ���ĵ��������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1357','add_reply','��ӻظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1358','exportime','���ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1359','size','��С','0');
INSERT INTO {$tblprefix}alangs VALUES ('1360','edit_submit_reply','�༭�ύ��ָ���ظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1361','version','�汾','0');
INSERT INTO {$tblprefix}alangs VALUES ('1362','confilecnam','�����ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1363','expdafilli','��������ļ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1364','admin_rec_arc_reply','�����յ���ָ���ĵ��Ļظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1365','usehex','ʮ�����Ʒ�ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1366','admin_rec_reply','�����յ���ָ���Ļظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1367','sqlcompat','��������ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1368','dbfilename','�����ļ���(������չ��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1369','arc_reply_list','ָ���ĵ��Ļظ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1370','ordersmodify','�����޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1371','m_add_edit_offer','��Ա���/�༭����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1372','netsite_source_rule','��ַ��Դ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1373','ordemessset','������Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1374','admin_arc_offer','����ָ���ĵ��ı���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1375','price','�۸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1376','weight','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1377','admin_point_offer','����ָ���ı���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1378','handwork_source_netsite','�ֶ���Դ��ַ<br> (ÿ��һ����ַ�����������)','1264120544');
INSERT INTO {$tblprefix}alangs VALUES ('1379','ordergoodlist','������Ʒ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1380','arc_offer_list','ָ���ĵ��ı����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1381','shiping','�ͻ���ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1382','answer_pick_url','���ɵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1383','payedcashyuan','��֧���ֽ�(Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1384','serial_source_netsite','������Դ��ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1385','ordfeeallamyua','���������ܶ�(Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1386','del_answer_url','ɾ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1387','shipfeeyuan','�ͻ�����(Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1388','goodfeeyuan','��Ʒ����(Ԫ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1389','vote_sup_answer_url','ͶƱ֧�ִ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1391','received','���ջ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1392','noreceive','δ�ջ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1393','question_admin_url','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1394','ordersstate','����״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1395','purchase_pick_url','����վ����ĵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1396','orderssncode','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1397','ordebasedset','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1398','goods_pu_record_url','��Ʒ�����¼����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1399','setordesta','���ö���״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1400','arc_subscribe_pick_url','�ĵ����ĵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1401','att_subscribe_pick_url','�������ĵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1402','nosend','δ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1403','sended','�ѷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1404','arc_praise_operate','ָ���ĵ��Ķ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1405','arc_debase_operate','ָ���ĵ��ĲȲ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1406','serial_start_pagecode','���п�ʼҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1407','arc_score_operate','ָ���ĵ������ֲ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1408','ordersdate','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1409','serial_end_pagecode','���н���ҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1410','arc_favorite','ָ���ĵ����ղ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1411','payed','��֧��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1412','auto_purchase','�Զ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1413','ordallamo','�����ܶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1414','confirm_purchase','ȷ�Ϲ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1415','more_pick_url','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1416','orderslist','�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1417','score_amount','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1418','isreceived','�Ƿ����ջ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1419','issended','�Ƿ��ѷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1420','ischecked','�Ƿ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1421','css_file_admin','CSS�ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1422','none','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1423','nolimiship','�����ͻ���ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1424','js_file','JS�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1425','edit_cssfile_mlist','�༭CSS�ļ������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1426','edit_jsfile_mlist','�༭JS�ļ������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1427','based_content_page0','��������ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1428','add_css_js_file','���css��js�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1429','content_trace_page0_1','����׷��ҳ1','0');
INSERT INTO {$tblprefix}alangs VALUES ('1430','file_saveas','�ļ����Ϊ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1431','file_content','�ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1432','content_trace_page0_2','����׷��ҳ2','0');
INSERT INTO {$tblprefix}alangs VALUES ('1433','ufrompage','��ַ���Ժϼ����ĸ�ҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1434','add_file','��� %s �ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1435','reverseorder_gather','����ɼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1436','netsite_gather_rule','��ַ�ɼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1437','css_file','css�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1438','page_initial_rgp','ҳ��ɼ���Χ<br /> �ɼ�ģӡ','1264120679');
INSERT INTO {$tblprefix}alangs VALUES ('1439','js_file_admin','js�ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1440','netsite_list_cell_split_tag','��ַ�б�ָ���','1264120722');
INSERT INTO {$tblprefix}alangs VALUES ('1441','copy_css_js_file','����css��js�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1442','netsite_gather_pattern','��ַ�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1443','edinmlandet','�༭��Ա�������԰�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1444','title_gather_pattern','����ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1445','result_netsite_mustinc','�����ַ�غ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1446','soc_file','Դ�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1447','mlangcontent','��Ա�������԰�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1448','trace_netsite_rule','׷����ַ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1449','mlangremark','��Ա�������԰���ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('1450','trace_netsite_1_gp','׷����ַ1�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1451','file_edit','�ļ��༭','0');
INSERT INTO {$tblprefix}alangs VALUES ('1452','mlangename','��Ա�������԰���ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1453','file_name','�ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1454','trace_netsite_1_m','׷����ַ1�غ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1455','editmlang','�༭��Ա�������԰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1456','trace_netsite_1_f','׷����ַ1����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1457','addmlang','��ӻ�Ա�������԰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1458','detail_modify_file','��ϸ�޸�%s�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1459','delete_file','ɾ��%s�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1460','trace_netsite_2_gp','׷����ַ2�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1461','update_js_file','����js�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1462','trace_netsite_2_m','׷����ַ2�غ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1463','copy_file','����%s�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1464','trace_netsite_2_f','׷����ַ2����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1465','reply_coclass_manager','�ظ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1466','detail0_modify_gm','��ϸ�޸Ĳɼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1467','editmlanglist','�༭��Ա�������԰��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1468','e_re_class_mlist','�༭�ظ���������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1469','mlangadmin','��Ա�������԰�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1470','add_reply_class','��ӻظ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1471','no_splitpage','�޷�ҳ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1472','del_reply_class','ɾ���ظ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1473','mlangfilter','��Ա�������԰�ɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1474','co_class_manager','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1475','reply_class_manager','�ظ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1476','editclangdetail','�༭ǰ̨���԰�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1477','clangcontent','ǰ̨���԰�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1478','timeout_s','���ӳ�ʱ(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1479','clangremark','ǰ̨���԰���ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('1480','clangename','ǰ̨���԰���ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1481','editclang','�༭ǰ̨���԰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1482','addclang','���ǰ̨���԰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1483','splitpage_gather_rule','��ҳ�ɼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1484','editclanglist','�༭ǰ̨���԰��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1485','clangadmin','ǰ̨���԰�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1486','splitpage_field','��ҳ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1487','clangfilter','ǰ̨���԰�ɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1488','notall_splitpage_navi','��ҳ�����Ƿ�����','1264121369');
INSERT INTO {$tblprefix}alangs VALUES ('1489','splitpage_navi_region_br_gp','��ҳ��������<br /> �ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1490','memaltdetmodope','��Աģ�ͱ�������޸Ĳ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1491','modmemchanalt','�޸Ļ�Աģ�ͱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1492','memaltmes','��Ա�����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1493','memchaaltmod','��Աģ�ͱ����ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1494','memtypneeopt','��Ա��������ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1495','memchaalliadope','��Աģ�ͱ���б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1496','memchaaltadm','��Աģ�ͱ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1497','targetchannel','Ŀ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1498','sourcechannel','��Դģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1499','memchanaltli','��Աģ�ͱ���б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1500','alttarcha','���Ŀ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1501','altsoucha','�����Դģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1502','splitpage_url_mustinc','��ҳ���ӱغ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1503','pu_msg_field_manager','������Ϣ�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1504','e_pu_msg_field_mlist','�༭������Ϣ�ֶι����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1505','add_pu_field','��ӹ����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1506','splitpage_url_forbidinc','��ҳ���ӽ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1507','add_pu_msg_field','��ӹ�����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1508','det_modify_pu_msg_field','��ϸ�޸Ĺ�����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1509','rt','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1510','cataslist','��Ŀ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1511','add_offer_field','��ӱ����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1512','archivecontent','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1513','gather_field_rule','�ɼ��ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1514','add_offer_msg_field','��ӱ�����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1515','freeinfocontent','�����Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1516','output_based_setting',']����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1517','mustfields','���²ɼ��ֶ�Ϊ��ʱ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1518','archiverelated','�ĵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1519','output_default_value',']���Ĭ��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1520','gather_netsite_rule_test','�ɼ���ַ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1521','reply_msg_field_manager','�ظ���Ϣ�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1522','none_source_netsite','����Դ��ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1523','all_source_netsite','ȫ����Դ��ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1524','archivecommu','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1525','add_pickbug_msg_field','��Ӿٱ���Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1526','det_modify_pickbug_msg_field','��ϸ�޸ľٱ���Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1527','membercommu','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1528','current_test_source_netsite','��ǰ������Դ��ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1529','commu_field_manager','�����ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1530','con_weblist','������ַ�б� (������ַ�����������30)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1531','spacepage','���˿ռ�ҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1532','netsite_title','��ַ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1533','pu_field_manager','�����ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1534','content_netsite','������ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1535','offer_field_manager','�����ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1536','jstemplate','jsģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1537','reply_field_manager','�ظ��ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1538','pttag','��ҳ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1539','cttag','���ϱ�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1540','trace_netsite_1','׷����ַ1','0');
INSERT INTO {$tblprefix}alangs VALUES ('1541','utfield','�����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1542','initdata1','ԭʼ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1543','ref','�ο�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1544','comment_field_manager','�����ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1545','pickbug_field_manager','�ٱ��ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1546','tagtype','��ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1547','tagstyle','��ʶ��ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1548','offer_msg_field_manager','������Ϣ�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1549','tagmap','��ʶ��ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1550','trace_netsite_2','׷����ַ2','0');
INSERT INTO {$tblprefix}alangs VALUES ('1551','copynormaltemplate','���Ƴ���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1552','tempfilsav','ģ���ļ����Ϊ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1553','add_reply_field','��ӻظ��ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1554','gather_content_rule_test','�ɼ����ݹ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1555','soctemfi','Դģ���ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1556','add_reply_msg_field','��ӻظ���Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1557','templateclass','ģ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1558','current_want_gather0','��ǰ��Ҫ�ɼ�����ַ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1559','templatecname','ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1560','cmt_msg_field_manager','������Ϣ�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1561','copnormapagetemp','���Ƴ���ҳ��ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1562','please_gather_netsite','���Ȳɼ�������ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1563','add_comment_field','��������ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1564','detamodnormtem','��ϸ�޸ĳ���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1565','add_cmt_msg_field','���������Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1566','current_test_netsite_title','��ǰ������ַ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1567','edinortemmanli','�༭����ģ������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1568','pb_msg_field_manager','�ٱ���Ϣ�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1569','templatefile','ģ���ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1570','add_pickbug_field','��Ӿٱ��ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1571','current_test_netsite','��ǰ������ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1572','currency_manager','���ֹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1573','gather_result','�ɼ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1574','currency_name','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1575','no1_gather','δ�ɼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1576','already1_gather','�Ѳɼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1577','unit','��λ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1578','norpagtempadm','����ҳ��ģ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1579','reg_initval','ע���ʼֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1580','addnormtemp','��ӳ���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1581','no1_output','δ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1582','add_currency','��ӻ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1583','already1_output','�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1584','edit_currency_type','�༭��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1585','noabover','δ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1586','putin','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1587','modify_currency_mlist','�޸Ļ��ֹ����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1588','filter0_gather_record','ɸѡ�ɼ���¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('1589','edit_currency','�༭����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1590','currency_unit','���ֵ�λ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1591','settitemplty','����ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1592','current_gather_mission','��ǰ�ɼ�����&nbsp;:&nbsp;','0');
INSERT INTO {$tblprefix}alangs VALUES ('1593','currency_allow_inout','���ֿ��Գ�/��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1594','settempcna','����ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1595','crpolicy','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1596','gather_state','�ɼ�״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1597','output_state','���״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('1598','issue_arc','�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1599','issue_freeinfo','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1600','weather_abover_album','�Ƿ����ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1601','issue_comment','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1602','nortemaddpu','����ģ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1603','purchase_goods','������Ʒ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1604','templatetype','ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1605','question_answer','�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1606','autosearch','�Զ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1607','favorite_arc','�ղ��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1608','content_gather_manager','���ݲɼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1609','other_commu','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1610','searchpage0','����ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1611','website_vote','��վͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1612','send_pm','���Ͷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1613','gather','�ɼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1614','website_search','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1615','result','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1616','add_currency_type','��ӻ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1617','add_price_project','��Ӽ۸񷽰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1618','already1_abover','�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1619','price_name','�۸�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1620','setting_album_abover','�ϼ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1621','currency_amount','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1622','add_cu_price_prj','��ӻ��ּ۸񷽰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1623','edit_cu_price_prj','�༭���ּ۸񷽰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1624','add_cu_ex_prj','��ӻ��ֶһ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1625','edit_cu_ex_prj','�༭���ֶһ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1626','edit_cu_ex_prj_mlist','�༭���ֶһ����������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1627','member_cu_saving','��Ա���ֳ�ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1628','det_modify_cutype','��ϸ�޸Ļ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1629','onekey_auto_gather','һ���Զ��ɼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1630','url_auto_gather','�����Զ��ɼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1631','content_auto_gather','�����Զ��ɼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1632','content_auto_output','�����Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1633','rule','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1634','detmodspatempro','��ϸ�޸Ŀռ�ģ�巽��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1635','spalistemp','�ռ��б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1636','spaindtem','�ռ���ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1637','enaspacat','���ÿռ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1638','price_prj_manager','�۸񷽰�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1639','spacatcna','�ռ���Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1640','spatemproset','�ռ�ģ�巽������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1641','addspaccata','��ӿռ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1642','catalogremark','��Ŀ��ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('1643','uclmaxaddamomem','���˷������������� / ��Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('1644','addspatempro','��ӿռ�ģ�巽��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1645','temprocna','ģ�巽������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1646','spatemproadd','�ռ�ģ�巽�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1647','edispacatmanlis','�༭�ռ���Ŀ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1648','add_ex_prj','��Ӷһ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1649','edispatepromanis','�༭�ռ�ģ�巽�������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1650','cocllimi','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1651','source_currency','��Դ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1652','src_cu_val','��Դ����ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1653','spacatamana','�ռ���Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1654','inchuse','������ģ����ʹ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1655','ex_currency','�һ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1656','ex_cu_val','�һ�����ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1657','spatemproman','�ռ�ģ�巽������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1658','cash','�ֽ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1659','saving','��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1660','deductvalue','��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1661','member_inout','��Ա��/��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1662','choose_cutype','ѡ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1663','choose','ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1664','operate_type','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1665','detamod','��ϸ�޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1666','add_val','���ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1667','closecode','�رմ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1668','copycode','���ƴ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1669','reduce_val','����ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1670','curtagoftemcod','��ǰ��ʶ��ģ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1671','savingmode','��/��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1672','tagenidill','��ʶӢ�����Ʋ��Ϲ淶','1264819540');
INSERT INTO {$tblprefix}alangs VALUES ('1673','addreduce','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1674','inptagenid','�������ʶӢ������','1264819540');
INSERT INTO {$tblprefix}alangs VALUES ('1675','createcode','���ɴ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1676','enid','��ʶӢ������','1264819540');
INSERT INTO {$tblprefix}alangs VALUES ('1677','typeset','%s ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1678','help','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1679','newtempcna','��ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1680','newtagid','�±�ʶID','0');
INSERT INTO {$tblprefix}alangs VALUES ('1681','filter_record','ɸѡ��¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('1682','newtagcnam','�±�ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1683','operate_mode','������ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1684','soctempcnam','Դģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1685','soctagid','Դ��ʶID','0');
INSERT INTO {$tblprefix}alangs VALUES ('1686','soctagcname','Դ��ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1687','crmode','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1688','inaarcli','�����ĵ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1689','seararchli','�����ĵ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1690','relarclis','����ĵ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1691','crrecordmname','��������(���ŷָ��������)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1692','freepickli','���ɵ����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1693','crrecordfrommname','������(���ŷָ��������)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1694','startdate','��ʼ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1695','arcconmod','�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1696','arcamosta','�ĵ�����ͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1697','pre','��һҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1698','cu_operate_record','���ֲ�����¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('1699','catasmod','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1700','next','��һҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1701','iscusfunlist','�Զ������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1702','catasplacnav','��Ŀλ�õ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1703','tomname','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1704','frommname','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1705','context','����ƪ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1706','inalbumcontext','��������ƪ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1707','operate_date','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1708','freelist','�����Ϣ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1709','messconmod','���������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1710','arc_browse','�ĵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1711','isolpageurl','����ҳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1712','arc_sale','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1713','archcommlist','�ĵ������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1714','membcommlist','��Ա�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1715','arc_issue','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1716','votemod','ͶƱģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1717','votelist','ͶƱ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1718','att_operate','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1719','memberlist','��Ա�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1720','membermessage','������Ա��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1721','att_sale','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1722','membamousta','��Ա����ͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1723','keywlist','�ؼ����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1724','edit_cu_prj_mlist','�༭���ּ۸񷽰������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1725','archichanlist','�ĵ�ģ���б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1726','membchalist','��Աģ���б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1727','space0','�ռ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1728','catasplace','��Ŀλ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1729','ex_prj_manager','�һ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1730','choose_table','ѡ�����ݱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1731','subsitelist','��վ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1732','backup_param_set','���ݲ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1733','imagemod','ͼƬģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1734','dbsizelimit','���ݷ־��С(KB)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1735','downloadmod','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1736','flashmod','Flashģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1737','mediamod','��Ƶģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1738','sqlcharset','ǿ���ַ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1739','imageslist','ͼ���б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1740','backup','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1741','downlist','�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1742','dbbackup','���ݿⱸ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1743','flashlist','Flash�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1744','medialist','��Ƶ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1745','attachmenturl','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1746','timeviewtag','ʱ����ʾ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1747','backup_file_list','�����ļ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1748','txtdealtag','�ı������ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1749','backup_file_name','�����ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1750','archfeemes','�ĵ�������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1751','iscusfuntag','�Զ�������ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1752','volume','�־�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1753','pttxt','��ҳ�ı�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1754','backup_time','����ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1755','ptimages','��ҳͼ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1756','searmembelist','������Ա�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1757','del_db_backup_file','ɾ�����ݿⱸ���ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1758','import_db_backup','�������ݿⱸ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1759','optimize','�Ż�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1760','repair','�޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1761','db_tb_optimize','���ݿ����ݱ��Ż�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1762','db_tb_repair','���ݿ����ݱ��޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1763','addtype','��� %s','0');
INSERT INTO {$tblprefix}alangs VALUES ('1764','run_sql_code','����SQL����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1765','im_sql_code_content','����SQL��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1766','dl_db_backup_file','�������ݿⱸ���ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1767','curtagtemcod','��ǰ��ʶģ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1768','closewindow','�رմ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1769','typeadmin','%s ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1770','select_table','��ѡ�����ݱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1771','code','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1772','membchaaltpro','��Աģ�ͱ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1773','input_notnull','���벻��Ϊ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1774','form_guide','����ʾ˵��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1775','delusealtpro','ɾ����Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1776','delmemchaaltpro','ɾ����Աģ�ͱ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1777','modusealtpro','�޸Ļ�Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1778','agguide','������ʹ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1779','useraltautch','��Ա�����Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1780','default_value','Ĭ������ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1781','ediusergaltpro','�༭��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1782','addusergaltpro','��ӻ�Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1783','date_range','�������ڷ�Χ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1784','php_func','����PHP��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1785','addproject','��ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1786','memaltautche','��Ա����Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1787','tarmemcha','Ŀ���Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1788','sourmemcha','��Դ��Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1789','nosearch','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1790','edmemchaaltpro','�༭��Աģ�ͱ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1791','modmemchaaltpro','�޸Ļ�Աģ�ͱ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1792','db_field_list','���ݿ��ֶ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1793','onesearch','��ȷ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1794','autocheck','�Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1795','content_replace','�����滻','0');
INSERT INTO {$tblprefix}alangs VALUES ('1796','useltpro','��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1797','field_remark','�ֶα�ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('1798','multisearch','��Χ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1799','normal','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1800','addmemchaaltpro','��ӻ�Աģ�ͱ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1801','regular','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1802','field_cre_operate','�ֶ������滻����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1803','issearch','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1804','current_table','��ǰ���ݱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1805','current_field','��ǰ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1806','search_mode','����ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1807','search_txt','�����ı�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1808','delmemcenmeite','ɾ����Ա���Ĳ˵���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1809','delmemcenmencoc','ɾ����Ա���Ĳ˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1810','replace_txt','�滻�ı�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1811','memcenmeitedet','�༭��Ա���Ĳ˵���Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1812','remote_download','Զ�����ط���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1813','where_plus_string','WHERE���������ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1814','beluseval','�˵���ʾȨ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1815','meniteord','�˵���Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1816','dont_inc_where','��Ҫ��WHERE','0');
INSERT INTO {$tblprefix}alangs VALUES ('1817','menuitemurl','�˵���Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1818','menuitemcname','�˵���Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1819','replace','�滻','0');
INSERT INTO {$tblprefix}alangs VALUES ('1820','annex_limit','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1821','edmecemecode','�༭��Ա���Ĳ˵���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1822','regular_help','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1823','edmecemeli','�༭��Ա���Ĳ˵��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1824','f_view_player','���ؼ���ʾ�������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1825','guide0','ע��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1826','menu','�˵�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1827','start_replace','��ʼ�滻','0');
INSERT INTO {$tblprefix}alangs VALUES ('1828','admencoc','��Ӳ˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1829','memcenmenman','��Ա���Ĳ˵�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1830','addmemcenmenite','��ӻ�Ա���Ĳ˵���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1831','value_range','����ֵ��Χ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1832','addmemcenmenco','��ӻ�Ա���Ĳ˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1833','guidecontent','��ʾ˵������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1834','memcenpacna','��Ա����ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1835','memcenpaggui','��Ա����ҳ����ʾ˵��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1836','delmenuitem','ɾ���˵���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1837','db_src_manager','�ⲿ����Դ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1838','format_regular_check_str','�����ʽ�������ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1839','delmenucoc','ɾ���˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1840','db_server','���ݿ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1841','edimenitdet','�༭�˵���Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1842','db_src_name','�ⲿ����Դ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1843','db_user','���ݿ��û�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1844','istxt_field','�Ƿ��ı������ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1845','db_name','���ݿ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1846','db_charset','���ݿ��ַ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1847','yes','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1848','edimencocdet','�༭�˵���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1849','db_config','���ݿ�ṹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1850','cocdefurl','����Ĭ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1851','add_db_src','����ⲿ����Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1852','db_pwd','���ݿ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1853','controller_mode','���ؼ�ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1854','edit_db_src','�༭�ⲿ����Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1855','edmenitli','�༭�˵���Ŀ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1856','dbcheck','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1857','addtopcocl','��Ӷ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1858','subsimenadm','��վ�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1859','msimenadm','��վ�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1860','det_modify_db_src','�����޸��ⲿ����Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1861','chositetyp','ѡ��վ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1862','current_system','��ǰϵͳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1863','addbackmenite','��Ӻ�̨�˵���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1864','choose_db_src','ѡ���ⲿ����Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1865','create_query_string','���ɲ�ѯ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1866','asc','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1867','desc','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1868','query_mode','��ѯģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1869','menuitem_k1','�˵���Ŀ_%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('1870','value','ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1871','query_str_result','��ѯ�ִ����ɽ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1872','query_string','��ѯ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1873','normal_editor','����༭��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1874','menutype_k0','�˵�����_%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('1875','logoutadmin','�˳�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1876','adminindex','������ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1877','membercenter1','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1878','subsiteindex','��վ��ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1879','websiteindex','��վ��ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1880','backarea','��̨','0');
INSERT INTO {$tblprefix}alangs VALUES ('1881','founder','��ʼ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1882','simple_editor','���ױ༭��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1883','memomfiman','��Ա�����ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1884','value_length','����ֵ�ֽڳ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1885','detmocomefi','��ϸ�޸Ľ�����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1886','addmecomefi','��ӻ�Ա������Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1887','edmecomefimali','�༭��Ա������Ϣ�ֶι����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1888','mesfiman','��Ϣ�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1889','table_fieldlength','���ݱ��ֶγ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1890','memberreport','��Ա�ٱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1891','memberreply','��Ա�ظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1892','agtlength','�趨��Χ1-255','0');
INSERT INTO {$tblprefix}alangs VALUES ('1893','membercomment','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1894','spaceflink','�ռ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1895','agmselectsplit','���Ĭ��ֵ��[##] (�������м�##) ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1896','upanddownset','�ϴ�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1897','mchoise_list','��ѡ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1898','mail_sign','�����ʼ�ǩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1899','mchoisebox','��ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1900','mail_to','�����ʼ����ŵ�ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1901','mail_silent','�����ʼ����͵ĳ�����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1902','mail_delimiter','�ʼ�ͷ�ķָ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1903','choose_content_set','ѡ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1904','mail_pwd','SMTP �����֤����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1905','mail_user','SMTP �����֤�ʻ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1906','mail_from','�������ʼ���ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1907','mail_auth','SMTP Ҫ�������֤','0');
INSERT INTO {$tblprefix}alangs VALUES ('1908','mail_port','SMTP �˿�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1909','mail_smtp','SMTP ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1910','normal_size1','����ߴ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1911','mailtest','�ʼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1912','mailset','�ʼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1913','enlarge_size1','�Ӵ�ߴ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1914','subsiteset','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1915','siteset','վ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1916','hostname','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1917','hosturl','��վURL','0');
INSERT INTO {$tblprefix}alangs VALUES ('1918','cmsname','��ǰ��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1919','cmsurl','��ǰ��վURL','0');
INSERT INTO {$tblprefix}alangs VALUES ('1920','cmslogo','��վLogo','0');
INSERT INTO {$tblprefix}alangs VALUES ('1921','sitetitle','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1922','sitekeyword','��վ�ؼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1923','sitedescrip','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1924','siteicpno','��վICP����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1925','bazscert','����֤��bazs.cert�ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1926','copyrightmessage','��Ȩ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1927','subsmallsite','��վ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1928','subsitetitle','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1929','subkeyword','��վ�ؼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1930','subsitedescrip','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1931','websiteset','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1932','sitemessaadmi','վ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1933','timerelated','ʱ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1934','sitetimez','վ��ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1935','contentrelat','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1936','msg_orders_list','��Ϣ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1937','issueupdateche','�����ĵ������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1938','purchase_days','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1939','issueupdatecopy','�����ĵ�����������˻���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1940','purchase_currency','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1941','msg_content','��Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1942','arcautcreathu','�ĵ��Զ���������ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1943','orders_date','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1944','arcautcreabs','�ĵ��Զ�����ժҪ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1945','arcautbstlen','�ĵ��Զ�ժҪ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1946','nohtml','��������е�Html����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1947','stathotkey','ͳ�����Źؼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1948','cotypem_manager','�����ϵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1949','enablerss','����RSS','0');
INSERT INTO {$tblprefix}alangs VALUES ('1950','rss_ttl','RSSˢ������(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1951','schoise_list','��ѡ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1952','nousersearch','�����ο�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1953','cotype_name','��ϵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1954','schoise_box','��ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1955','seamaxreamomembcen','�������������(��Ա����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1956','seatiintlimsec','����ʱ��������(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1957','format_limited','�����ʽ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1958','websitstat','��վͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1959','enabelstat','������վͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1960','add_cotypem','��������ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1961','clickscachetime','����ͳ�ƵĻ����������(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1962','mclickscircle','�û�����ĸ���Ƶ��(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1963','context_choose','����ƪѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1964','is_self_reg','�Ƿ��Զ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1965','mactivetime','�ʱ���������(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1966','onlinehold','�û����߱���ʱ��(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('3113','inurl_admin','��̨��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1968','cnodestatcir','��Ŀͳ�Ƹ�������(Сʱ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1969','edit_cotype_mlist','�༭��ϵ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1970','purchamount','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1971','vmode0','��ͨѡ���б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1972','vmode1','��ѡ��ť','0');
INSERT INTO {$tblprefix}alangs VALUES ('1973','mailmode3','PHP��SMTP����(������Windows����,��֧�������֤)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1974','is_admin_self','�Ƿ����ר��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1975','mailmode2','SOCKET ����SMTP������(֧�������֤)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1976','is_notblank_catas','�Ƿ��ѡ��Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1977','mailmode1','PHP��mail��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('1978','filter0_set','����ɸѡ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1979','cnode_leaguer_cotype','�ڵ��Ա��ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1980','emaisenmod','Email���ͷ�ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1981','emaiset','Email����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1982','mainline_leaguer_cotype','Ƶ����Ա��ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1983','maildelimiter3','CR (Mac ����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1984','maildelimiter2','LF (Unix/Linux ����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1985','maildelimiter1','CRLF (Windows ����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('1986','below_charc_forbid_use','����ģ���ĵ���ֹʹ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1987','attr','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1988','below_type_album_forbid_use','�������ͺϼ���ֹʹ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('1989','class_choose_list_mode','����ѡ���б�ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1990','det_modify_cotype','��ϸ�޸���ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1991','agtagdetail_yes','����ģ������Ϊ����ģ��ʱ��Ч���Ϻ���Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('1992','ftpcheck','���FTP','0');
INSERT INTO {$tblprefix}alangs VALUES ('1993','add_cotype_msg_field','�����ϵ��Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('1994','ftp_url','WEB����URL','0');
INSERT INTO {$tblprefix}alangs VALUES ('1995','class_msg_field_manager','������Ϣ�ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('1996','ftp_dir','Զ�̸���Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('3105','traceurl','׷����ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3106','ga_result','�ɼ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1998','ftp_ssl','�Ƿ�����SSL��ȫ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('1999','det_modify_cotype_msg_field','��ϸ�޸���ϵ��Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2000','ftp_pasv','�Ƿ�ʹ�ñ���ģʽ(pasv)�ϴ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2001','ftp_timeout','FTP ���䳬ʱʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2002','self_reg','�Զ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2003','inalbum_order_asc','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2004','cnode_leaguer','�ڵ��Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2005','ftp_password','FTP ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2006','mainline_leaguer','Ƶ����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2007','clicks_desc1','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2008','ftp_user','FTP �ʺ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2009','add_cotype','�����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2010','ftp_port','FTP �������˿�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2011','ftp_host','FTP ��������ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2012','cotypem_detail_edit','�����ϵ��ϸ�༭','0');
INSERT INTO {$tblprefix}alangs VALUES ('2013','del_cotype','ɾ����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2014','enaatftpupl','���ø���FTP�ϴ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2015','add_class_msg_field','��ӷ�����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2016','rematftpset','Զ�̸���FTP����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2017','edit_cotype_msg_field','�༭��ϵ��Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2018','watermarkquality','JPEGͼƬˮӡ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2019','watermarktrans','ͼƬˮӡ�ں϶�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2020','comments_desc1','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2021','imawattyp','ͼƬˮӡ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2022','add_gather_model','��Ӳɼ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2023','average_score_desc1','ƽ�����֡�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2024','rightbottom','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2025','gather_model_name','�ɼ�ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2026','centerbottom','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2027','favorite_pics_desc1','�ղش�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2028','leftbottom','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2029','arc_model_choose','��ָ���ɼ����ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2030','rightcenter','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2031','altype_choose','�ϼ�����(�ɼ��ϼ���ѡ��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2032','praise_pics_desc1','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2033','leftcenter','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2034','debase_pics_desc1','�ȴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2035','righttop','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2036','gather_model_manager','�ɼ�ģ�͹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2037','centertop','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2038','lefttop','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2039','notaddwater','�����ˮӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2040','imawateset','ͼƬˮӡ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2041','edit_gat_model_mlist','�༭�ɼ�ģ�͹����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2042','gather_field_set','�ɼ��ֶ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2043','attbroperset','���������Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2044','allnouupl','�ο������ϴ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2045','det_modify_gather_model','��ϸ�޸Ĳɼ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2046','player_height','Ĭ��ý�岥�Ÿ߶�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2047','player_width','Ĭ��ý�岥�ſ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2048','path_userfile','�������ౣ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2049','onlylink','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2050','attacsmal','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2051','dir_userfile','����·��(���ϵͳ��Ŀ¼)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2052','orders_amount_desc1','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2053','user_handwork','�û��ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2054','uplattaset','�ϴ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2055','download_pics_desc1','���ش�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2056','admin_handwork','�����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2057','uplimaaddwate','�ϴ�ͼƬ���ˮӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2058','crbase','���ֻ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2059','crex','���ֶһ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2060','onlyadmini','������Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2061','play_pics_desc1','���Ŵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2062','allmember','ȫ����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2063','edit_grouptype','�༭��Ա����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2064','alluser','ȫ���û�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2065','imagewaterm','ͼƬˮӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2066','grouptype_name','��ϵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2067','answer_reward_desc1','�������͡�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2068','date','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2069','deal_mode','����ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2070','related_currency','��ػ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2071','month_clicks_desc1','�µ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2072','month','��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2073','add_grouptype','��ӻ�Ա����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2074','related_cutype','��ػ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2075','edit_grouptype_mlist','�༭��Ա����ϵ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2076','usergroup_alter_reset','��Ա������Ҫ�����޶�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2077','inchids_forbid_use','������ģ���н�ֹʹ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2078','detail_modify_grouptype','�����޸Ļ�Ա����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2079','websbuspayset','��վ����֧������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2080','week_clicks_desc1','�ܵ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2081','msite_backarea','��վ��̨','0');
INSERT INTO {$tblprefix}alangs VALUES ('2082','month_comments_desc1','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2083','deducthandfee','�۳�������(%)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2084','paykey','֧����Կ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2085','partnerid','�̻����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2086','week_comments_desc1','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2087','resultreceiveurl','�������URL','0');
INSERT INTO {$tblprefix}alangs VALUES ('2088','datasendurl','���Ϸ���URL','0');
INSERT INTO {$tblprefix}alangs VALUES ('2089','paycname','֧������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2090','m_fav_pics_desc1','���ղش�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2091','w_fav_pics_desc1','���ղش�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2092','onlpayset','%s-����֧������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2093','class_condition_set','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2094','cartgooamolim','���ﳵ��Ʒ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2095','enagoostosta','������Ʒ���ͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2096','choose_list_tag_type','ѡ���б��ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2097','m_praise_pics_desc1','�¶�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2098','enagoshfest','������Ʒ�ͻ�����ͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2099','onlpayarrautsav','����֧�������Զ���ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2100','busrelbasset','������ػ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2101','w_praise_pics_desc1','�ܶ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2102','webpptpptset','��վpptput����ͨ��֤����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2103','filter_string','ɸѡ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2104','m_debase_pics_desc1','�²ȴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2105','order_string','�����ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2106','ct_listtag_querystring','�����б��ʶ��ѯ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2107','uc_key','UCenter ͨ����Կ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2108','list','�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2109','table','���ݱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2110','uc_appid','UCenter �����Ӧ��ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('2111','uc_dbpre','UCenter ���ݿ��ǰ׺','0');
INSERT INTO {$tblprefix}alangs VALUES ('2112','edit_local_upload_prj','�༭�����ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2113','modify_filetype','�޸��ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2114','local_upload_prj','�����ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2115','uc_dbpwd','UCenter ���ݿ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2116','all_att_type','ȫ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2117','allow_upload_type','�������ϴ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2118','uc_dbuser','UCenter ���ݿ��û���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2119','uc_dbname','UCenter ���ݿ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2120','local_upload_filetype','�����ϴ��ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2121','uc_dbhost','UCenter ���ݿ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2122','add_file_type','����ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2123','uc_ip','UCenter ����IP��ͨ�����ա�<br>\r\n������������ͨ��ʧ��ʱ���ø�ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2124','file_type_input','�ļ�����(������չ��,���ŷָ��������)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2125','uc_api','UCenter API ��ַ��ĩβ����б��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2126','file_ext','�ļ���չ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2127','enableucent','����UCenter','0');
INSERT INTO {$tblprefix}alangs VALUES ('2128','w_debase_pics_desc1','�ܲȴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2129','allow_local_upload','�������ϴ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2130','uc_clientconfig','UCenter �ͻ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2131','max_up_limit_k','����ϴ�����(K)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2132','pptin_logout','�ӿڳ����˳���ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2133','min_up_limit_k','��С�ϴ�����(K)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2134','pptin_login','�ӿڳ����¼��ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2135','pptin_register','�ӿڳ���ע���ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2136','m_orders_amount_desc1','�¶���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2137','pptin_url','�ӿڳ���URL��ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2138','altypeid','����ID','0');
INSERT INTO {$tblprefix}alangs VALUES ('2139','pptin_expire','��֤�ִ���Ч��(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2140','w_orders_amount_desc1','�ܶ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2141','pptinkey','����ͨ��֤��Կ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2142','enablepptin','���÷���ͨ��֤','0');
INSERT INTO {$tblprefix}alangs VALUES ('2143','pptinset','����ͨ��֤����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2144','m_download_pics_desc1','�����ش�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2145','pptoutkey','����ͨ��֤��Կ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2146','typename','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2147','pptout_charset','�ӿڳ����ַ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2148','pptout_file','�ӿڳ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2149','enablepptout','��������ͨ��֤','0');
INSERT INTO {$tblprefix}alangs VALUES ('2150','pptoutsett','����ͨ��֤����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2151','add_marc_type','��ӻ�Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2152','pagandtemset','ҳ����ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2153','matype_name','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2154','w_download_pics_desc1','�����ش�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2155','edit_matype_list','�༭��Ա���������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2156','add_arc_autocheck','��ӵĵ����Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2157','m_play_pics_desc1','�²��Ŵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2158','subindtem','��վģ��Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2159','add_arc_autostatic','��ӵĵ����Զ���̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2160','enmemcenmefiuse','�Ƿ���ݻ�Ա��Ȩ�޹��˲˵�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2161','w_play_pics_desc1','�ܲ��Ŵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2162','floathei','�������ڸ߶ȣ�px��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2163','allow_update_checked_arc','��Ա���Ը������󵵰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2164','floatwinwidth','�������ڿ�ȣ�px��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2165','enablefloatwin','���ø�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2166','memcenterlogo','��Ա����LOGO','0');
INSERT INTO {$tblprefix}alangs VALUES ('2167','content_open_tpl','���ݹ���ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2168','first_order','��һ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2169','content_limit_tpl','��������ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2170','uclbytlenlim','���˷����ֽڳ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2171','second0_order','�ڶ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2172','add_tpl','���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2173','uclmaxamolim','���˷��������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2174','read_permi_set','�Ķ�Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2175','det_set_matype','��ϸ���û�Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2176','add_matype_field','��ӻ�Ա�����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2177','mrowpp','��Ա�����б�ÿҳ��ʾ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2178','clicks_gt','�����>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2179','del_matype','ɾ����Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2180','memcenmsgfor','��Ա������ʾ��Ϣͣ��(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2181','comments_gt','������>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2182','memcentrelaset','��Ա���Ĳ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2183','matype_set','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2184','favorite_pics_gt','�ղش���>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2185','catahidden','��Ŀѡ���б����ز���ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2186','praise_pics_gt','������>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2187','edit_matype_field','�༭��Ա�����ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2188','catacholismod','��Ŀѡ��ʱ�б�ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2189','cnprow','�ڵ����ý���ÿ����ʾ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2190','debase_pics_gt','�ȴ���>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2191','goods_orders_amount_gt','��Ʒ��������>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2192','admbackamsgforw','�����̨��ʾ��Ϣͣ��(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2193','atpp','�����̨�б�ÿҳ��ʾ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2194','admbacrelset','�����̨����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2195','goods_price_le','��Ʒ�۸�<=','0');
INSERT INTO {$tblprefix}alangs VALUES ('2196','goods_price_gt','��Ʒ�۸�>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2197','member_channel_name','��Աģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2198','answer0_amount_gt','������>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2199','htmltext_channel','HtmlText�ֶ�תΪ�ı����� - %sģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2200','transto_txt_field','���ݱ��ֶο�ʼתΪ�ı������ֶ�!','0');
INSERT INTO {$tblprefix}alangs VALUES ('2201','transto_table_field','�ı������ֶο�ʼתΪ���ݱ��ֶ�!','0');
INSERT INTO {$tblprefix}alangs VALUES ('2202','add_member_channel','��ӻ�Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2203','agmclogo','��ѳߴ� 260 X 50','0');
INSERT INTO {$tblprefix}alangs VALUES ('2204','adopt_answer0_amount_gt','���ô�����>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2205','clearoldcache','�������ҳ�滺������(Сʱ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2206','answer_reward_currency_le','�������ͻ���<=','0');
INSERT INTO {$tblprefix}alangs VALUES ('2207','cachejscircle','js���ݻ����������(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2208','mslistcachenum','���˿ռ��б�ҳ����ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2209','cachemscircle','���˿ռ仺���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2210','answer_reward_currency_gt','�������ͻ���>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2211','listcachenum','�б�ҳ����ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2212','cache1circle','��̬ҳ�����������(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2213','edit_member_channel_list','�༭��Աģ���б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2214','cacherelaset','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2215','rewritephp','.php?��Rewrite��Ӧ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2216','dynamipage','��̬ҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2217','liststaticnum','��Ŀ�б�ҳ��̬ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2218','virtuastatic','���⾲̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2219','contpagestaticci','����ҳ������̬����(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2220','calispagestati','��Ŀ�б�ҳ������̬����(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2221','catindestaticc','��Ŀ��ҳ������̬����(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2222','infohtmldir','�����Ϣ������ҳ��̬Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2223','archtmlmode','�ı��ֶ����ݱ���Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2224','cnhtmldir','��Ŀ���ĵ���̬����Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2225','only_stat_validperiod_archive','��ͳ����Ч�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2226','instaficna','��ҳ��̬�ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2227','space_related_setting','���˿ռ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2228','weaenasta','�Ƿ����þ�̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2229','starelset','��̬�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2230','agjsrefsource','����Ϊ�����ơ�ÿ������һ�У���֧��ͨ������������ http:// ���������������ݣ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2231','jsrefsource','js��·����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2232','tepawedest','ģ�������Ϊ����״̬','1264130825');
INSERT INTO {$tblprefix}alangs VALUES ('2233','temjsdir','ģ��jsĿ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2234','temcssdir','ģ��cssĿ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2235','templatedir','ģ��Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2236','commsgforwordtime','ͨ����ʾ��Ϣͣ��(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2237','timeformat','Ĭ��ʱ���ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2238','dateformat','Ĭ�����ڸ�ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2239','gzipenable','ҳ��Gzipѹ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2240','agrewritephp','������Ϊ-htm-�������⾲̬url ��archive.php?aid-5.htm������װΪarchive-htm-aid-5.htm��������url���⾲̬����ʱ��Ч���뱣����վ��rewrite�������Ӧ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2241','agcss_dir','ֻ��Ҫ��дĿ¼��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2242','eg','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2243','weather_space_archive_list','�Ƿ���˿ռ��ĵ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2244','yearmonthday','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2245','yearmonth','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2246','pagebasedset','ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2247','visiandregset','������ע������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2248','enableregco','������֤��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2249','cashpay','�ֽ�֧��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2250','addpickbug','��Ӿٱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2251','member_channel_copy','��Աģ�͸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2252','addoffer','��ӱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2253','backalogin','��̨��¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2254','memblogin','��Ա��¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2255','memberregis','��Աע��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2256','regcode_height','��֤��ͼƬ�߶�(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2257','more_filter0_order_set','����ɸѡ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2258','regcode_width','��֤��ͼƬ���(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2259','regcodeset','��֤������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2260','censoruser','�û����Ʊ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2261','regclosereason','ע��ر�ԭ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2262','siteclosereg','վ��ر�ע��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2263','reg_member_check_mode','ע���Ա��˷�ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2264','memregset','��Աע������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2265','urlmode','��ĿƵ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2266','member_comment_commu_set','��Ա���۽�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2267','sid_self','��վ��ֻ̨�ܹ�����վ��Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2268','spaceclose','���˿ռ�ر�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2269','list_item_setting','�б���Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2270','adminipaccess','�����̨����IP�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2271','siteclosereason','վ��ر�ԭ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2272','siteclose','վ��ر�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2273','current_subsite','��ǰ��վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2274','webvisiset','ע�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2275','member_reply_commu_set','��Ա�ظ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2276','websibaseset','��վ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2277','search_member_tpl','������Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2278','subsite_attr','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2279','handwork_check','�ֶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2280','inausttiminterh','���ںϼ�ͳ��ʱ����(Сʱ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2281','wanweestatitem','��Ҫ��ͳ�Ƶ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2282','wanmonstatitem','��Ҫ��ͳ�Ƶ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2283','auto_check','�Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2284','all_topic_catas','ȫ��������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2285','replpic','�ظ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2286','mail_active','Email����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2287','sonofactive','������Ŀ���¼���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2288','offerpics','���۴���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2289','not_relate','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2290','sameofactive','������Ŀ��ƽ����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2291','user_choose_and_modify','�û�ѡ�����޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2292','list_item','��Ϊ�б���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2293','playpics','���Ŵ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2294','user_choose_admin_modify','�û�ѡ�� ����Ա�޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2295','downlopic','���ش���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2296','catas_attr','��Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2297','admin_choose_modify','����Աѡ�����޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2298','addanswer','��Ӵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2299','member_relate_catas_attr','��Ա������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2300','nolist_item_available','���б���Ŀ��Ч','0');
INSERT INTO {$tblprefix}alangs VALUES ('2301','member_relate_catalog','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2302','norelated','�ǹ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2303','freeinfo','�����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2304','active_catalog','������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2305','member_channel_set','��Աģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2306','agcensor','�û�������ʹ���б��еĹؼ��ʣ�ÿ����дһ���ؼ��ʣ�����ʹ��ͨ��� *','0');
INSERT INTO {$tblprefix}alangs VALUES ('2307','agipaccess','ÿ������һ�� IP����Ϊ������ַ��Ҳ���� IP ��ͷĳ�����ַ����ձ�ʾ�����Ƶ�¼��IP','0');
INSERT INTO {$tblprefix}alangs VALUES ('2308','member_relate_cotype','������ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2309','purcallam','�����ܶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2310','list_channel','�б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2311','point_cotypem','ָ�������ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2312','directid2','ָ����Ŀid(��ȱָ������Ŀ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2313','agcmsurl','��β�躬 /','0');
INSERT INTO {$tblprefix}alangs VALUES ('2314','det_modify_mchannel','��ϸ�޸Ļ�Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2315','not_trace','��׷��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2316','aghosturl','Ӧ��http����β�� /','0');
INSERT INTO {$tblprefix}alangs VALUES ('2317','add_member_msg_field','��ӻ�Ա��Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2318','del_mchannel','ɾ����Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2319','level1','һ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2320','addflink','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2321','addfriend','��Ӻ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2322','poimemoffavo','ָ����Ա���ղ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2323','catas_upcata','׷��ָ����Ŀ���ϼ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2324','det_modify_mch_msg_field','��ϸ�޸Ļ�Աģ����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2325','add_member_cfield','��ӻ�Աͨ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2326','poimembscooper','ָ����Ա�����ֲ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2327','list_upcata','׷��ָ���б���Ŀ���ϼ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2328','add_member_cmsg_field','��ӻ�Աͨ����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2329','recrepallrep','�յ��Ļظ����Դ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2330','member_cfield_manager','��Աͨ���ֶι���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2331','active_archive','�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2332','recrepallche','�յ��Ļظ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2333','active_member','�����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2334','recerepalldel','�յ��Ļظ�����ɾ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2335','emcmsg_field_mlist','�༭��Աͨ����Ϣ�ֶι����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2336','reccomallrep','�յ������ۿ��Դ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2337','reccoalche','�յ������ۿ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2338','point_commu_item','ָ��������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2339','relate_id_source','����ID��Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2340','reccomalldel','�յ������ۿ���ɾ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2341','det_modify_mcmsg_field','��ϸ�޸Ļ�Աͨ����Ϣ�ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2342','aguclass','������ID��ԴΪ��Աʱ��Ч','0');
INSERT INTO {$tblprefix}alangs VALUES ('2343','friautche','�����Զ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2344','frimaxamo','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2345','demomecomit','��ϸ�޸Ļ�Ա������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2346','memcomitset','��Ա������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2347','add_time_asc','���ʱ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2348','copymcomitem','���ƻ�Ա���Ľ�����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2349','add_subsite_menu_class','�����վ�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2350','add_msite_menu_class','�����վ�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2351','memcomitco','��Ա������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2352','limitin_current_channel','���ڵ�ǰģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2353','edmemcomitmanli','�༭��Ա������Ŀ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2354','limitin_current_catalog','���ڵ�ǰ��Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2355','add_subsite_menu_item','�����վ�˵���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2356','memcomitad','��Ա������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2357','add_msite_menu_item','�����վ�˵���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2358','limitin_current_coclass','���ڵ�ǰ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2359','limitin_active_member','���ڼ����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2360','flink','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2361','friend','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2362','subsite_ba_menu_manager','��վ��̨�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2363','point_msg_id','ָ����ϢID(0-������Ϣ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2364','msite_ba_menu_manager','��վ��̨�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2365','msg_order','��Ϣ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2366','edit_subsite_menu_class','�༭��վ�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2367','referror','�ο�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2368','edit_msite_menu_class','�༭��վ�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2369','msg_order_desc','��Ϣ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2370','tagmodify','��ʶ�޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2371','add_time_desc','���ʱ�併��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2372','edit_subsite_menu_item','�༭��վ�˵���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2373','edit_msite_menu_item','�༭��վ�˵���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2374','detmosptemp','��ϸ�޸��ض�����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2375','templatecontent','ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2376','pagecname','ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2377','ctag','���ϱ�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2378','sptemset','�ض�����ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2379','utag','�����ֶα�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2380','rtag','���������ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2381','edsptemmanli','�༭�ض�����ģ������б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2382','ptag','��ҳ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2383','sppagemana','�ض�����ҳ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2384','ctag_admin','���ϱ�ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2385','utag_admin','�����ֶα�ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2386','add_time_asc1','���ʱ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2387','rtag_admin','���������ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2388','ptag_admin','��ҳ��ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2389','tag_style','��ʶ��ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2390','listby','����˳��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2391','edit_ctag_mlist','�༭���ϱ�ʶ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2392','edit_utag_mlist','�༭�����ֶα�ʶ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2393','edit_rtag_mlist','�༭���������ʶ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2394','point_isolute_page0_id','ָ������ҳID','0');
INSERT INTO {$tblprefix}alangs VALUES ('2395','edit_ptag_mlist','�༭��ҳ��ʶ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2396','copy_ctag','���Ƹ��ϱ�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2397','copy_utag','���������ֶα�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2398','copy_rtag','�������������ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2399','functionscode','�б�������������PHP��������ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2400','copy_ptag','���Ʒ�ҳ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2401','agfunctionscode','����ֵΪ�б��������飬��ԭʼ��ʶ��ʽ����ָ���������ǰҳ��Ϊ{$nowpage}','0');
INSERT INTO {$tblprefix}alangs VALUES ('2402','currencyinout','���ֳ�/��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2403','otherreason','����ԭ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2404','setting_list_item','�����б���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2405','lookinittag','�鿴ԭʼ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2406','all_space0_catalog','ȫ���ռ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2407','lookttype','�鿴 %s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2408','lookselecttag','�鿴ѡ�б�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2409','plepoimemid','��ָ����ԱID','0');
INSERT INTO {$tblprefix}alangs VALUES ('2410','notremote','������Զ���ļ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2411','netsilistpage','��ַ�б�ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2412','contensourcpage','������Դҳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2413','resultdealfunc','���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2414','fiecontgathpatt','�ֶ�����<br>�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2415','space0catalog','�ռ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2416','catalog_all_coclass','��Ŀ��ȫ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2417','replmesssouront','�滻��Ϣ<br> ��Դ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2418','repmessagresulcont','�滻��Ϣ<br>\r\n=>�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2419','lisregigathpatt','�б�����<br>�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2420','liscellsplitag','�б�Ԫ\r\n�ָ���ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2421','cellurlgathpatte','��Ԫ����<br>�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2422','celltitlgathepatt','��Ԫ����<br>�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2423','downjumfilsty','������ת�ļ���ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2424','titleunknown','���ⲻ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2425','confchoosarchi','��ָ����ȷ���ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2426','poinarchnoch','ָ�����ĵ�δ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2427','noarchivbrowpermis','���ĵ����Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2428','subattachwanpaycur','���Ĵ˸�����Ҫ֧������ : &nbsp;:&nbsp;','0');
INSERT INTO {$tblprefix}alangs VALUES ('2429','younosuatwaencur','<br><br>��û�ж��Ĵ˸�������Ҫ���㹻����!','0');
INSERT INTO {$tblprefix}alangs VALUES ('2430','subsattach','���ĸ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2431','saleattach','���۸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2432','nolimitformat','���޸�ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2433','number','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2434','letter','��ĸ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2435','numberletter','��ĸ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2436','advancedmes','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2437','attachmentedit','�����༭','0');
INSERT INTO {$tblprefix}alangs VALUES ('2438','uclass','���˷���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2439','lengsmalmilim','����С����С����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2440','lenglargmaxlimi','���ȴ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2441','smallminilimi','С����С����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2442','largmaxlimi','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2443','attatamosmaminili','��������С����С����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2444','notnull','����Ϊ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2445','liminpda','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2446','liminpint','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2447','receive_member','���ջ�Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2448','liminpnum','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2449','limiinputlett','��������ĸ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2450','submit_member','�ύ��Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2451','limitinputnumberl','��������ĸ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2452','limitinputtagtype','��������ĸ��ͷ��_��ĸ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2453','limitinputemail','������Email','0');
INSERT INTO {$tblprefix}alangs VALUES ('2454','regcode','��֤��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2455','member_channel_limited','��Աģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2456','agregcode','������ͼƬ���е��ַ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2457','issutaxfree','�����շѲ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2458','re_regcode','���ͼƬ��һ����֤��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2459','catas_relate_setting','��Ŀ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2460','rewarcurrenval','���ͻ���ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2461','relate_catalog_limited','������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2462','question','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2463','guide','��ʾ˵��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2464','clickhere','��������û����ת�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2465','stock','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2466','default_order','Ĭ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2467','register_time_desc1','ע��ʱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2468','register_time_asc1','ע��ʱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2469','questcontnotn','�������ݲ���Ϊ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2470','prompt_msg','��ʾ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2471','online_time_desc1','����ʱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2472','msclicks_desc1','�ռ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2473','rewcurtychdomoarc','���ͻ������͸ı�,��Ҫ�޸��ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2474','dontredrewcur','��Ҫ�������ͻ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2475','recusmmiva','���ͻ���С����Сֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2476','issue_archive_amount_desc1','�����ĵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2477','rightnowjump','������ת','0');
INSERT INTO {$tblprefix}alangs VALUES ('2478','purchase_amount_desc1','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2479','rightnowgoback','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2480','defaultclosedreason','��վ����ά�������Ժ������ӡ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2481','answer_amount_desc1','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2482','arc_browse_fee','�ĵ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2483','credit_desc1','���á�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2484','att_deal_fee','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2485','fee_msg_type','������Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3157','membertpl','��Աģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2487','list_amount_limit','�б���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2489','online_time','����ʱ��>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2490','awardcurrency','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2491','input_tag_tpl','�������ʶģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2492','msclicks1','�ռ�����>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2493','cheforcon','���������!','0');
INSERT INTO {$tblprefix}alangs VALUES ('2494','issue_archive_amount','�����ĵ�����>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2495','usource','ָ��������Դ','1264056469');
INSERT INTO {$tblprefix}alangs VALUES ('2496','date_view_format','������ʾ��ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2497','purchase_goods_amount','������Ʒ����>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2498','time_view_format','ʱ����ʾ��ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2499','answer_credit','��������>','0');
INSERT INTO {$tblprefix}alangs VALUES ('2500','memcnameerror','��Ա���ƴ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2501','not_view_date','����ʾ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2502','passerror','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2503','not_view_time','����ʾʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2504','outregmemwanact','վ��ע���Ա,��Ҫ����!','0');
INSERT INTO {$tblprefix}alangs VALUES ('2505','pick_setting','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3221','tagdisabled','[����ʶ�ر���]','1264060037');
INSERT INTO {$tblprefix}alangs VALUES ('2507','oldpasserr','ԭ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2508','dbsource','�ⲿ����Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2509','mempassmodfai','��Ա�����޸�ʧ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2510','files_t','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2511','look_configs','�鿴�ṹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2512','file_t','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2513','usourcemode','��Դ����ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3220','sourceillegal','������Դ���ò��Ϲ淶','1264056727');
INSERT INTO {$tblprefix}alangs VALUES ('2515','define_content_query_string','�������ݲ�ѯ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2516','clicks_desc','���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2517','ctrl_permission','������������Ȩ�޷���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2518','comments_desc','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2519','filter0set','ɸѡ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2520','clearhtml','���Html��ǩ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2521','ctrl_awardcp','���������ĵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2522','nodeal','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2523','ctrl_taxcp','������������ĵ��۳�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2524','disablehtml','����ʾHtml��ǩ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2525','ctrl_ftaxcp','�������ø��������۳�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2526','channel_limited','ģ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2527','safehtml','�����Թ���Html','0');
INSERT INTO {$tblprefix}alangs VALUES ('2528','ctrl_sale','����������߳����ĵ�Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2529','ctrl_fsale','����������߳��۸���Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2530','deal_html_code','����Html����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2531','searchtxt','��ѯ�ִ�(��ͨ�� �ĵ�-�ĵ��������-���� �����ִ�)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2532','txt_length_trim','�ı����ȼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2533','filter_badword','���˲�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2534','ctrl_discount','����������Ʒ�ۿ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2535','deal_wordlink','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2536','all_site','ȫ��վ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2537','temfilecna','ģ���ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2538','multitext_newline','�����ı�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2539','all_subsite','ȫ����վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2540','add_randstr','��ӻ����ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2541','browse_user','����û�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2542','amount_limit','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2543','active_user','�����û�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2544','user_source','�û���Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2545','pleinptatem','�������ʶģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2546','flashs_t','�༯Flash','0');
INSERT INTO {$tblprefix}alangs VALUES ('2547','flash_t','����Flash','0');
INSERT INTO {$tblprefix}alangs VALUES ('2548','point_voteid','ָ��ͶƱID(0-����ͶƱ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2549','ptnaviset','��ҳ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2550','vote_option_list','ͶƱѡ���б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2551','nolimitsubsite','������վ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2552','vote_option_cols','ͶƱѡ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2553','confirmcomitem','��ָ����ȷ�Ľ�����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2554','vote_coclass_limited','ͶƱ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2555','player_width_r','���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2556','vote_id_limited','ͶƱID����(���ŷָ��������)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2557','choosemescoc','��ָ����ȷ����Ϣ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2558','player_height_r','�������߶�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2559','functionsmpcode','�б���Ŀ������������PHP��������ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2560','agfunctionsmpcode','����ֵΪ�б���Ŀ�������������ɷ�ҳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2561','tagdatamiss','��ʶ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2562','psource','��ҳ������Դ','1264046716');
INSERT INTO {$tblprefix}alangs VALUES ('2563','imawidlim','ͼƬ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2564','att_page_type','����ҳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2565','imaheilim','ͼƬ�߶�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2566','createthumb','���趨�ߴ���������ͼ','1264047951');
INSERT INTO {$tblprefix}alangs VALUES ('2567','emptyurl','��ȱͼƬurl','1264047870');
INSERT INTO {$tblprefix}alangs VALUES ('2568','emptytitle','��ȱͼƬ˵��','1264047870');
INSERT INTO {$tblprefix}alangs VALUES ('2570','file_download','�ļ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2571','media_play','��Ƶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2572','flash_play','Flash����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2573','mcontent','�༯(��)����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2574','scontent','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2575','inpquerstr','�������ѯ�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2576','image_width_limit','ͼƬ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2577','image_height_limit','ͼƬ�߶�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2578','medias_t','�༯��Ƶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2579','media_t','������Ƶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2580','byte_len_trim','�����ֽڳ���,��Ϊ�ջ�0ֵ��ʾ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2581','point_altype','��ָ���ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2582','not_direct_album','��ָ��ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2583','direct_belong_album','ָ�������ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2584','view_channel_option_msg','��ʾģ��ѡ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2585','page0id','��ָ������ҳID','0');
INSERT INTO {$tblprefix}alangs VALUES ('2586','add_flink_tpl','�����������ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2587','inalbum_sum_item','���ںϼ�ͳ�Ƶ���Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2588','channel_add_member','��ģ����ӻ�Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2589','base_option','����ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2590','password','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2591','member_relate_class','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2592','space_tpl_prj','���˿ռ�ģ�巽��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2593','usergroup_msg','��Ա����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2594','add_member','��ӻ�Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2595','modify_pwd','�޸�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2596','release_usergroup','�����Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2597','noend','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2598','notbelong_usergroup','�����ڻ�Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2599','issue_allowance_manager','�����޶����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2600','aw_arc_issue_limit','�޶��ĵ�������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2601','aw_commu_issue_limit','�޶��������������/��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2602','detail_edit_member','��ϸ�༭��Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2603','nocheck_member','δ���Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2604','checked_member','�����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2605','filter_normal_member','ɸѡ��ͨ��Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2606','filter_admin_member','ɸѡ�����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2607','register_date','ע������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2608','reg_date','ע������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2609','recentvisit','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2610','del_member','ɾ����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2611','member_admin','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2612','member_list_admin','��Ա�б�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2613','addinpointalbum','��ָ���ϼ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2614','df_index_tpl','Ĭ�ϵ���ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2615','df_list_tpl','Ĭ�ϵ��б�ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2616','df_bklist_tpl','Ĭ�ϵı����б�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2617','html_dirname','��̬�ļ�����Ŀ¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2618','scnodemanager','�����ڵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2619','mcnodemanager','����ڵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2620','acrossleve2','���ؽ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2621','acrossleve3','���ؽ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2622','acrossleve4','���ؽ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2623','scnode_update','��ѡ�����������»����ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2624','amconfigbelongsid','����������վ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2625','belongsubsite','����վ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2626','subbackareatitle','��վ�����̨ - 08CMS','0');
INSERT INTO {$tblprefix}alangs VALUES ('2627','mbackareatitle','��վ�����̨ - 08CMS','0');
INSERT INTO {$tblprefix}alangs VALUES ('2628','awelcome','���ã�%s ����ӭʹ��08CMS��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2629','msite_index_deal','��վ��ҳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2630','subsite_index_deal','��վ��ҳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2631','check_member','��˻�Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2632','dbopre','�Ż����޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2633','dbsql','ִ��SQL','0');
INSERT INTO {$tblprefix}alangs VALUES ('2634','dboperate','���ݿ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2635','content_static','����ҳ��̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2636','cnodes_static','��Ŀҳ��̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2637','index_static','��ҳ��̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2638','static_config','��̬��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2639','staticadmin','��̬����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2640','updatescnode','���»����ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2641','cnconfigsadd','��ӽ���ṹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2642','cnconfigadmin','����ṹ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2643','cnodesupdate','���½���ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2644','cnodeadmin','�ڵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2645','normal_member_list','��ͨ��Ա�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2646','admin_member_list','�����Ա�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2647','member_channel_manager','��Աģ�͹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2648','set','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2649','alladmin','�ۺϹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2650','update_admin','���¹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2651','checkadmin','��˲���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2652','all','ȫ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2653','detailfilter','��ϸɸѡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2654','pointcaid','��ָ����Ŀ!','0');
INSERT INTO {$tblprefix}alangs VALUES ('2655','imged','[ͼ]','0');
INSERT INTO {$tblprefix}alangs VALUES ('2656','vmode2','�´���ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2657','coclassvmode','����ѡ���б�ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2658','cataapermission','���������ĵ���ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2659','otherapermission','��������Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2660','allowafcoclass','�������Ĳ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2661','allowamember','�������Ļ�Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2662','allowafuncs','����Ĺ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2663','tpladmin','ģ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2708','purchase_record','�����¼','0');
INSERT INTO {$tblprefix}alangs VALUES ('2707','accessorytool','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2695','contentmanage','���ݹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2696','conventcontent','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2697','docintercontent','�ĵ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2698','staticpage','ҳ�澲̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2699','goodsorder','��Ʒ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2700','plugincontent','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2701','votingmanagement','ͶƱ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2702','attachmentmanage','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2703','popularwords','���Źؼ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2704','managemmembermanage','�����Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2705','memberintercontent','��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2706','membertypechange','��Ա���ͱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2681','allowacommu','���������ĵ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2682','allowamcommu','�������Ļ�Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2683','allowamatype','�������Ļ�Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2684','commu','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2685','report','�ٱ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2686','ba_logout_finish','�����̨�˳����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2687','mtrans','��Աģ�ͱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2688','utrans','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2689','memtrans','��Ա���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2690','crproject','���ֻ��ҷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2691','crprice','���ּ۸񷽰�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2692','crconfig','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2709','collectmanagement','�ɼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2710','aboutdatabase','���ݿ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2711','sitemap','SiteMap��ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2712','sitelogs','վ����־','0');
INSERT INTO {$tblprefix}alangs VALUES ('2713','systemstructure','�ܹ���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2714','integralset','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2715','membergroupset','��Ա��ϵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2716','backgroundmanageplan','��̨������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2717','memberinterconfig','��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2718','memberchange','��Ա�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2719','classmanage','��ϵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2720','collectset','�ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2721','docinterconfig','�ĵ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2722','pluginframework','����ܹ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2723','templatestyles','ģ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2724','regulartemplate','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2725','functiontpl','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2726','spatialtpl_solutions','�ռ�ģ��/����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2727','cssandjsmanage','CSS��JS����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2728','originallogo','ԭʼ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2729','systemset','ϵͳ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2730','basicparameter','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2731','passsettings','ͨ��֤����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2732','ecommerce','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2733','electronicmail','�����ʼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2734','annexset','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2735','menumanage','�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2736','lanpackmanage','���԰�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2737','voteadmin','ͶƱ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2738','pmadmin','���Ź���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2739','pmclear','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2740','fieldtotxt','�ֶ�ת�ı�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2741','dbdict','���ݿ�ʵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2742','m_cfield','��Աͨ���ֶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2743','channeladmin','�ĵ�ģ�͹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2744','tplallconfig','ģ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2745','subindtpl','��վ��ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2746','field_cname','�ֶ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2747','exchange_currency','�һ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2748','base_currency','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2749','atmdown','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2750','farcissue','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2751','cuissue','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2752','allusergroup','ȫ����Ա��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2753','pugidsbelow','���»�Ա��ӵ��Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2754','allopen','��ȫ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2755','read_pmid','�������Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2756','add_pmid','���ݷ���Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2757','down_pmid','��������Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2758','cnbrowse','��Ŀ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2759','cread_pmid','��Ŀҳ���Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2760','mcmenu','�˵�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2761','abackarea','�����̨','0');
INSERT INTO {$tblprefix}alangs VALUES ('2762','u_permission_set','������ʾȨ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2763','ablock','�ĵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2764','amconfig','��̨������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2765','sysdefsetting','ϵͳĬ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2766','issysdef','�Ƿ�ʹ���Զ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2767','anodeset','���ݹ���ڵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2768','anode','���ݹ���ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2769','aurl','�����̨����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2770','defsetting','Ĭ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2771','aurl_add','��ӹ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2772','aurl_name','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2773','aurl_remark','����������ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('2774','aurl_type','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2775','aurl_admin','��̨��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2776','aurl_item_set','�����̨��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2777','arcandalb','�ĵ���ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2778','arange','����Χ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2779','nococlass','δ���÷���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2780','agnoselect','��ѡ��ʾ���޷�Χ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2781','view_filters','����ҳ����Ҫ��ʾ����ɸѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2782','view_info','��ʾ��ϸ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2783','view_lists','����ҳ����б���ʾ����Ϣ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2784','reset_validperiod','������Ч��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2785','view_operates','����ҳ����Ҫ��ʾ�Ĳ�����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2786','arangeset','����Χ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2787','pageresult','����ҳ����ʾ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2788','customapage','�Զ������ű�','1264210971');
INSERT INTO {$tblprefix}alangs VALUES ('2789','agcustomapage','�����������ա����������ҳ����ʾ������Ч�������ʽ��a/b.php����ȷ��ϵͳ���ڸ��ļ���','1264300736');
INSERT INTO {$tblprefix}alangs VALUES ('2790','node','�ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2792','fromcata','�̳���ĿȨ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2793','agnoselect1','��ѡ��ʾȫ����ʾ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2794','customphp','�Զ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2795','readd','�ط���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2797','lic_ck','��ʵ��Ȩ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2798','lic_uk','δ��Ȩ�汾','0');
INSERT INTO {$tblprefix}alangs VALUES ('2799','lic_by','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2800','unknow','δ֪','0');
INSERT INTO {$tblprefix}alangs VALUES ('2801','welcome_platform','��ӭ����С˵����ƽ̨','0');
INSERT INTO {$tblprefix}alangs VALUES ('2802','08cms_dynamic','�ٷ����¶�̬ �ٷ��°汾�ķ�������Ҫ�����������ȶ�̬��������������ʾ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2803','08cms_service','����֧�ַ��� �������ʹ�����������⣬���Է�����������Ѱ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2804','08cms_bbs','�ٷ�������̳','0');
INSERT INTO {$tblprefix}alangs VALUES ('2805','08cms_biz_service','08CMS ��ҵ֧�ַ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2806','08cms_stat','վ������ͳ�� ͨ��վ��ͳ�ƣ��������������վ��ķ�չ״����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2807','server_stat','ϵͳ������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2808','dingyue_com','��Խ�Ƽ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2809','master_level','��Ĺ�����%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2810','daterange','���ڷ�Χ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2811','server_info','��������Ϣ��%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2812','cancel_album_abover','ȡ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2813','php_safemode','PHP��ȫģʽ��%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2814','mysql_version','MySQL�汾��%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2815','php_max_upload','����ϴ����ƣ�%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2816','allow_url_fopen','�����Զ���ļ���%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2817','db_use_size','��ǰ���ݿ��С��%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2818','php_gd_pic','ͼ��GD��֧�֣�%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2819','attach_size','��ǰ����������%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2820','php_mail_mode','�ʼ�֧��ģʽ��%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2821','server_ip','������IP��%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2822','server_time','��������ǰʱ�䣺%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2823','server_domain','��ǰ������%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2824','user_ip','��ǰ����IP��%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2825','08cms_version','����汾��Ϣ��%s','0');
INSERT INTO {$tblprefix}alangs VALUES ('2826','arctype','ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2827','content_list','�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2828','all_cuitem','ȫ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2829','reply_list','�ظ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2830','replys','�ظ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2831','order_num','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2832','offers','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2833','ordersum','�����ܶ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2834','favorites','�ղ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2835','praises','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2836','debases','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2837','answers','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2838','adopts','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2839','downs','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2840','reward','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2841','view_coids','����ҳ����Ҫ��ʾ������ϵѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2842','cata_choose','��ѡ����Ŀ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2843','p_choose','��ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2844','allow_type','ѡ���ĵ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2845','inurl','�����̨����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2846','inurl_add','��ӹ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2847','addinalbum','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2848','abconfig','���ڽṹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2849','abcontent','�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2850','selected','��ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2851','oneuser','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2852','multiuser','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2853','oneuser_state','�Ƿ��úϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2854','webparam','��վ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2855','view_inurls','�����̨�б���Զ���<br />��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2856','inadmin','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2857','inurl_','[%s]�����̨����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2858','pchoosecontent','��ѡ��Ҫ����������!','0');
INSERT INTO {$tblprefix}alangs VALUES ('2860','lookrelatedsource','�鿴�����Դ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2861','submitmessage','�ύ��Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2862','backmessage','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2864','offer_list','�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2865','oprice','���ۼ۸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2866','inpofferprice','�����뱨�ۼ۸�!','0');
INSERT INTO {$tblprefix}alangs VALUES ('2867','adminmessage','������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2868','adopt_state','����״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2869','adopted','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2870','noadopt','δ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2871','look_question','�鿴����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3159','allow_mchannel','�����������͵Ļ�Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2873','allow_reward_mini_cu','����������ͻ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2874','report_list','�ٱ��б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2883','look_album','�鿴ָ���ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2877','uncheckneed','�ܾ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2878','checkcopy','���ø��¸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2879','uncheckcopy','���ز�ɾ�����¸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2880','checkneed','��׼��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2885','catas_pointed','��ָ������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2886','saddinalbum','���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2887','maddinalbum','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2888','look_archive','�鿴�ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2889','cinadmin','�Զ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2946','view_inmurls','��Ա�����б���Զ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2890','click','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2891','ba_map','��̨��ͼ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2892','cn_pointed','��ָ����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2893','albumchoose','�ϼ�ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2894','selectedalbum','��ѡ�ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2895','confirm','ȷ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2896','addinpriv','������˺ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2897','addinopen','���빫�úϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2899','allowcopys','����ʱ������Ӹ�������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2900','addcpinca','ͬʱ��������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2901','addcpincc','ͬʱ������ %s �з���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2902','cpkeep','����������ϵ����ʱ����������ͬ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2903','cpupdate','ͬ�����µ�ǰ�ĵ��ĸ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2904','noupdate','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2905','cpupdate1','��ȫͬ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2906','cpupdate2','���ָ���(�����±��⡢�ؽ��ʡ�����ͼ��ժҪ)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2907','addcp','�� %s ���Ӹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2908','cpallow','�����ڲ�ͬ�������Ӹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2909','nocp','�����б����ظ��ĸ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2910','agnocp','���б��г��ֶ���ظ��ĸ���ʱ��ֻ��ʾ��һ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2911','incheck','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2912','inuncheck','���ڽ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2913','inclear','�˳��ϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2914','inorder','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2915','murl','��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2916','inmurl','��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2917','delcp','ɾ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2918','needupdate','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2919','unneedupdate','ȡ����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2920','onclick','���Ӽ���onclick�ִ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2921','fnodeset','�������ڵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2922','fnode','�������ڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2923','fblock','���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2924','reply_permission_set','�ظ�Ȩ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2925','consult_pics','��ѯ�ֽڳ������ƣ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2926','agdate','��������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2927','utran','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2928','mtran','���ͱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2929','mblock','��Ա������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2930','qstate','��ѯ״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('2931','qadmin','��ѯ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2932','updatebtag','����ԭʼ��ʶ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2933','btag_update','��ѡ���˸���ԭʼ��ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2934','btaglist','ԭʼ��ʶ�б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2935','isconsult','������ѯ����Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2936','nousergroup','δ������Ļ�Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('2937','memtype','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2938','regip','ע��IP','0');
INSERT INTO {$tblprefix}alangs VALUES ('2939','arcallows','�ĵ��޶�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2940','cuallows','�����޶�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2942','aga_title','������ʹ��ϵͳĬ��ֵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2941','arange_field','��Ҫ�������Ϣ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2943','adm_title','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2944','adm_guide','���������ʾ˵��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2945','arcdetail','�ĵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3032','asetalbum','�ĵ��鼭','0');
INSERT INTO {$tblprefix}alangs VALUES ('2947','fieldpm','�ֶ�Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2948','useredit','��˺���ǰ̨�����޸�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2949','field_pmid','��Ϣ���ݵı༭Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2950','frommsg','�̳�������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2951','commu_sett','������Ŀ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2952','a_url','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2953','cpkeeps','���ɸ���ʱ��Ҫ���ֵķ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2954','aitems','�����̨���õĲ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2955','agitems','ϵͳĬ��������Ŀ��Ч��ѡ�к�رա�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2956','mcopy','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2957','addcopy','��Ӹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2958','citems','��Ա���Ľ��õĲ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2959','useredits','��Ա���ĵ������޸���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2960','aguseredits','�������ݵ���Ϣ��ϵͳĬ��Ϊ�����޸ģ�ѡ�к��Ա�������޸ĸ�����Ϣ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2961','acoids','�����̨���õ���ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2962','agcoids','ϵͳĬ�����е���ϵ��Ч��ѡ�к�رա�','0');
INSERT INTO {$tblprefix}alangs VALUES ('2963','ccoids','��Ա���Ľ��õ���ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2964','altype_copy','���ƺϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2965','soc_altype_name','Դ�ϼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2966','new_altype_name','�ºϼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2967','altypenamemiss','������ϼ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2970','additems_a','�����ĵ�ʱ���õĲ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2969','arcedit','�ĵ��༭','0');
INSERT INTO {$tblprefix}alangs VALUES ('2971','agadditems','ϵͳĬ��Ϊȫ����Ŀ���ã�ѡ�����������Ϣʱ����ʾ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2972','abfunc','�ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2973','enablealbum','�����ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2974','paynext','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2975','paycurrency','վ���ʻ�֧��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2976','payalipay','֧����֧��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2977','paytenpay','�Ƹ�֧ͨ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2978','shipingfee1','ƽ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2979','shipingfee2','�ؿ�ר��EMS','0');
INSERT INTO {$tblprefix}alangs VALUES ('2980','shipingfee3','������ݹ�˾','0');
INSERT INTO {$tblprefix}alangs VALUES ('2981','mypaymode','��Ʒ֧����ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2982','agisalbum','�����ϼ����ܺ󣬱������ĵ�����Ϊ�ϼ��������ںϼ�����������ĵ���������е��ĵ����ϼ��С�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3253','advsetting','�߼���չѡ��','1264302613');
INSERT INTO {$tblprefix}alangs VALUES ('3254','customsetting','�Զ������ò���','1264302885');
INSERT INTO {$tblprefix}alangs VALUES ('2984','ucotype','������ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2985','ucotype_manager','������ϵ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2986','add_ucotype','��ӽ�����ϵ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2987','commu_type','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2988','ucotypem_detail_edit','������ϵ��ϸ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('2989','ucoclass','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('2990','ucoclass_admin','�����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3024','modify_payed','�޸��Ѹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('2993','allow_repeat','�����ظ�������Ϣ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2994','nouservote','�����οͲ���ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2995','repeatvote','�����ظ�ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2996','repeat_time_m','�ظ�����ʱ����(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('2997','cu_cviews','���ͷ�����鿴����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('2998','cu_useredits','���ͷ���������Ϣ�����ɱ༭��','0');
INSERT INTO {$tblprefix}alangs VALUES ('2999','cu_aviews','�����ɲ鿴����Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3000','wait_cpcheck','�ȴ��̼�ȷ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3001','wait_pay','�ȴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3002','wait_send','�ȴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3003','goods_send','�ѷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3004','order_ok','���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3005','order_cancel','ȡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3006','orderstate','����״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('3007','noshiping','�����ͻ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3008','cancelorders','ȡ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3009','mtplstore','����ģ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3010','sptplstore','����ģ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3011','spacetpl','�ռ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3017','confirmorders','ȷ�϶���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3013','modify_confirm','�޸Ĳ�ȷ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3014','tplrelated','ģ����ع���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3015','confirm_cancel','ȷ��ȡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3021','umode0','���ͷ������ͨ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3020','coclassumode','����ʹ�÷�Χ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3022','umode1','���ͷ�ר��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3023','umode2','����ר��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3025','purchase_type_set','���̼ҹ��﷽ʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3026','nopurchse','��֧�����̼ҹ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3027','no_confirm','����ȷ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3028','be_confirm','����ȷ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3029','ordmode','����ģʽ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3030','cartkey','���ﳵУ����Կ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3031','offerdetail','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3033','loadold','�����ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3034','commentadmin','���۹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3035','offeradmin','���۹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3036','replyadmin','�ظ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3037','purchaseadmin','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3038','answeradmin','�𰸹���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3039','pickbugadmin','�ٱ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3041','memberdetail','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3042','inurl0','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3043','no_admin_backarea','û�й����̨Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3044','backarea_ip_forbid','�����̨IP��ֹ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3045','admin_login_finish','�����½�ɹ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3046','cur_member','��ǰ��Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('3047','logout_member','�˳���Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('3048','login_member','��½��Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('3049','goback_index','������ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3050','admin_account','�����ʺ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3051','login_pwd','��½����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3053','areplyadmin','�ظ�����(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('3054','allsitecac','�����վ���沢�ؽ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3055','read_state','�Ѷ�״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('3056','reply_state','����״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('3057','mnode','��Աģ�ͽڵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3058','mnodeset','��Աģ�ͽڵ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3059','nobackareapm','��û�� %s �����̨Ȩ��!','0');
INSERT INTO {$tblprefix}alangs VALUES ('3060','rechoosebackarea','������ѡ�������Ȩ�޵ĺ�̨��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3061','mainmenu','��վ�˵�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3062','submenu','��վ�˵�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3063','usualurl0','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3064','backareaconfig','�����̨����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3065','mcenterconfig','��Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3066','choosecpurl','��ָ��Ҫ���Ƶ����ӣ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3067','url_copy','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3068','soc_url_name','��Դ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3069','new_url_name','����������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3070','urlcopyfinish','���Ӹ�����ɣ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3071','fugidsbelow','���»�Ա��û��Ȩ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3072','remodedown','Զ������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3073','localproject','�ϴ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3074','player','������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3075','passport','ͨ��֤','0');
INSERT INTO {$tblprefix}alangs VALUES ('3076','ms_cnt_tpl','�ռ�����ҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3077','ms_plus_page','�ռ��ĵ�����ҳ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3078','ms_cu_tpl','�ռ�����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3079','ms_plus_tpl','�ռ����ݸ���ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3080','arctpl','�ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3081','mnamestxt','����������(���ŷָ����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('3082','gotopage','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3083','cnt_tpl','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3084','product_tpl','�ռ��Ʒҳģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3085','parent_altype','ָ�������ϼ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3086','othertpl','����ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3087','checksubject','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3088','result_netsite_forbidinc','�����ַ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3089','test','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3090','plitpage_navi_region','��ҳ��������ɼ�ģӡ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3092','choose_urlsauto','��ѡ���������ɼ���ǰ����(����������)��������ַ��<br>��ʾ��һ��ȫ����ɰ����ⲽ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3093','choose_gatherauto','��ѡ���˲ɼ���ǰ����(����������)���ĵ����ݣ�<br>\r\n��ʾ��һ��ȫ����ɰ����˱����Ĳ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3095','choose_outputauto','��ѡ���˽���ǰ����(����������)�е�����������⣡<br>\r\n��ʾ��һ��ȫ����ɰ����˱����Ĳ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3096','choose_allauto','��ѡ����һ��������²�����<br>\r\n��ַ�ɼ������ݲɼ���������⣡<br>\r\nִ��֮ǰȷ�����й����Ѿ�������ɡ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3104','cnturl','������ַ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3103','utitle','��ַ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3100','choose_urlstest','��ѡ���˲��Թ���<br>\r\n�ڲ���֮ǰ��ȷ���Ѿ�������ع���<br>\r\n�����Դ���ַ����һ��һ�����ԣ���ע��ѡ�����ҳ���������ӽ�����һ�����ԡ�','1264120912');
INSERT INTO {$tblprefix}alangs VALUES ('3101','choose_contentstest','��ѡ�������ݹ�����ԡ�<br>\r\n��ִ����ǰ��ȷ�����������ݹ���<br>\r\n�Լ�������Ҫ��δ�ɼ����ݵ���ַ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3107','all_1_catas','ȫ��������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3108','all_2_catas','ȫ��������Ŀ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3109','orderitem','�Զ���Ŀ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3110','agorderitem','����һ�����أ��磺���������clicks���ĵ�������archives','0');
INSERT INTO {$tblprefix}alangs VALUES ('3130','adv_options','�߼�ѡ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3112','cotypestats','������ϵͳ���������ĵ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3114','inurl_name','��̨��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3115','inurl_remark','��̨������ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('3116','inurl_type','��̨��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3117','murl_admin','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3118','murl_name','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3119','murl_remark','��Ա����������ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('3120','murl_type','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3121','murl_add','��ӻ�Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3122','inmurl_admin','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3123','inmurl_add','��ӻ�Ա��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3124','inmurl_remark','��Ա����������ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('3125','inmurl_type','��Ա����������ע','0');
INSERT INTO {$tblprefix}alangs VALUES ('3126','inmurl_name','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3127','inmurl_item_set','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3128','murl_item_set','��Ա������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3129','inurl_item_set','��̨��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3131','replydetail','�ظ�����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3132','commentdetail','��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3133','noread','δ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3134','mcomment','��Ա����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3135','mreply','��Ա�ظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3136','mem_stat','��Ա��Ϣͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3137','arc_stat','վ����Ϣͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3138','stat','ͳ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3139','nowmonth','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3140','nowweek','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3141','day_3','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3142','day_1','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3143','amember','����Ա','0');
INSERT INTO {$tblprefix}alangs VALUES ('3144','openreg','��Ա����ע�᣺','0');
INSERT INTO {$tblprefix}alangs VALUES ('3145','openspace','��Ա�ռ俪�ţ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3147','minerrtime','ͬһIP��½ʧ������ʱ��(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('3148','maxerrtimes','ͬһIP����Դ���(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('3149','purchase_pick_url1','���̼ҹ���ĵ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3150','emaltpl','�ʼ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3151','splangcontent','������������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3152','vote_option','ͶƱѡ���1��5','0');
INSERT INTO {$tblprefix}alangs VALUES ('3153','vote_url','�Ե�����¼ͶƱ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3154','cart_pick_url','���ﳵ��������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3155','vcatalog','ͶƱ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3167','overupdate','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3168','checkupdate','Ӧ�ø�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3169','uncheckupdate','�ܾ���������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3170','memberareply','��Ա�ظ�(��)','0');
INSERT INTO {$tblprefix}alangs VALUES ('3171','status','״̬','0');
INSERT INTO {$tblprefix}alangs VALUES ('3172','no_chid_attr','�ų������ĵ�ģ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3173','reportor','�ٱ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3174','reporttime','�ٱ�ʱ��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3176','read','�Ѷ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3177','areply','�ظ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3179','openalbum','���úϼ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3180','indestaticc','��ҳ������̬����(����)','0');
INSERT INTO {$tblprefix}alangs VALUES ('3181','reset_parent_coclass','���踸����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3183','setusualtag','��Ϊ���ñ�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3184','usual','����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3185','usualtagremark','���ñ�ʶ˵��','0');
INSERT INTO {$tblprefix}alangs VALUES ('3186','usualtagclass','���ñ�ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3187','usualtags','���ñ�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3188','usualtagsadmin','���ñ�ʶ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3189','cancelclass','�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3190','noclass','δ����','0');
INSERT INTO {$tblprefix}alangs VALUES ('3191','addclass','��ӷ���','0');
INSERT INTO {$tblprefix}alangs VALUES ('3192','tagclassesadmin','���ñ�ʶ�������','0');
INSERT INTO {$tblprefix}alangs VALUES ('3193','edit_tagclasses_mlist','�༭���ñ�ʶ�����б�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3194','edit_usualtags_mlist','�༭���ñ�ʶ','0');
INSERT INTO {$tblprefix}alangs VALUES ('3195','space','��Ա�ռ�','0');
INSERT INTO {$tblprefix}alangs VALUES ('3198','please_set_payed','�������Ѹ������','1262612859');
INSERT INTO {$tblprefix}alangs VALUES ('3199','set_payed','�Է���������������Ѹ���������ٴ��ύ��','1262612873');
INSERT INTO {$tblprefix}alangs VALUES ('3196','alipay_partner','֧���������̻�ID','1262163309');
INSERT INTO {$tblprefix}alangs VALUES ('3200','orderspayed','�Ѹ���ȷ��','1262612978');
INSERT INTO {$tblprefix}alangs VALUES ('3197','confirm_set_payed','ȷ���Է���֧�� %s Ԫ�Ļ�����ᵥ��','1262612821');
INSERT INTO {$tblprefix}alangs VALUES ('3201','needtime','����ʱ��','1263192862');
INSERT INTO {$tblprefix}alangs VALUES ('3202','checkdate','���ʱ��','1263195965');
INSERT INTO {$tblprefix}alangs VALUES ('3203','extract_count','��������','1263196557');
INSERT INTO {$tblprefix}alangs VALUES ('3204','extract_getcount','���ֻ��','1263196573');
INSERT INTO {$tblprefix}alangs VALUES ('3205','extract_discount','������(%)','1263346450');
INSERT INTO {$tblprefix}alangs VALUES ('3206','extract_record_check','���ּ�¼���','1263201697');
INSERT INTO {$tblprefix}alangs VALUES ('3207','yuan','Ԫ','1263201791');
INSERT INTO {$tblprefix}alangs VALUES ('3208','extract_list','���ּ�¼�б�','1263257271');
INSERT INTO {$tblprefix}alangs VALUES ('3209','delstate','ɾ��״̬','1263266047');
INSERT INTO {$tblprefix}alangs VALUES ('3210','extract','����','1263289817');
INSERT INTO {$tblprefix}alangs VALUES ('3211','extract_mincount','������ֶ�(Ԫ)','1263348247');
INSERT INTO {$tblprefix}alangs VALUES ('3212','inalbumlist','�����ϼ��б�','1263983745');
INSERT INTO {$tblprefix}alangs VALUES ('3213','inscount','�����ĵ�����','1263983803');
INSERT INTO {$tblprefix}alangs VALUES ('3214','arr_pre','��ʶ���ص���������','1263986807');
INSERT INTO {$tblprefix}alangs VALUES ('3215','alltag','ȫ����ʶ','1263988184');
INSERT INTO {$tblprefix}alangs VALUES ('3216','abnew','���������ĵ�','1264007618');
INSERT INTO {$tblprefix}alangs VALUES ('3217','album_newstat','���������ĵ�ͳ�Ƶ�ʱ����(Сʱ)','1264012996');
INSERT INTO {$tblprefix}alangs VALUES ('3218','agusource1','�������ֶ���aa�����$a[b]�����ʶ�������ء�����ҳ��flash.php��(ҳ��ָ����Դ)�������ա�','1264046431');
INSERT INTO {$tblprefix}alangs VALUES ('3219','agusource','�����ʽ���ֶ���aa������$a[b]�ȡ�','1264047147');
INSERT INTO {$tblprefix}alangs VALUES ('3222','rebtplcache','�ؽ�ģ�建��','1264069340');
INSERT INTO {$tblprefix}alangs VALUES ('3223','rebuld_tplcache','��ѡ�����ؽ���ǰվ���ҳ�滺�档<br> �ڷǵ���ģʽ�£�ҳ��ģ�����ݵ��޸ģ�<br>��Ҫ�ؽ����������Ч��','1264070129');
INSERT INTO {$tblprefix}alangs VALUES ('3224','rebuild','�ؽ�','1264069730');
INSERT INTO {$tblprefix}alangs VALUES ('3225','tplcachefin','ģ�建���ؽ��ɹ���','1264069961');
INSERT INTO {$tblprefix}alangs VALUES ('3226','tagsearch','��ʶ����','1264074068');
INSERT INTO {$tblprefix}alangs VALUES ('3227','customsql','�Զ���ѯ�ִ�','1264093785');
INSERT INTO {$tblprefix}alangs VALUES ('3228','gather_test_title','[���Բɼ�]','1264120325');
INSERT INTO {$tblprefix}alangs VALUES ('3229','reset_gather','����״̬','1264120343');
INSERT INTO {$tblprefix}alangs VALUES ('3230','gmission_copy','������','1264120360');
INSERT INTO {$tblprefix}alangs VALUES ('3231','gather_mission_copy','�ɼ�������','1264120380');
INSERT INTO {$tblprefix}alangs VALUES ('3232','copy_gather_mission','���Ʋɼ�����','1264120398');
INSERT INTO {$tblprefix}alangs VALUES ('3233','son_mission','������','1264120542');
INSERT INTO {$tblprefix}alangs VALUES ('3234','son_gather_mission_cname','����������','1264120556');
INSERT INTO {$tblprefix}alangs VALUES ('3235','son_gather_model','������ģ��','1264120697');
INSERT INTO {$tblprefix}alangs VALUES ('3236','autoall','һ��','1264120713');
INSERT INTO {$tblprefix}alangs VALUES ('3237','netsite','��ַ','1264120749');
INSERT INTO {$tblprefix}alangs VALUES ('3238','warehousing','���','1264120774');
INSERT INTO {$tblprefix}alangs VALUES ('3239','rulemanagement','�������','1264120795');
INSERT INTO {$tblprefix}alangs VALUES ('3240','breakfinish','��ֹ�������','1264120811');
INSERT INTO {$tblprefix}alangs VALUES ('3242','vol_admin','�־����','1264145515');
INSERT INTO {$tblprefix}alangs VALUES ('3243','volno','�־��','1264145542');
INSERT INTO {$tblprefix}alangs VALUES ('3244','volname','�־���','1264145567');
INSERT INTO {$tblprefix}alangs VALUES ('3245','add_vol','��ӷ־�','1264145590');
INSERT INTO {$tblprefix}alangs VALUES ('3246','vol','�־�','1264150524');
INSERT INTO {$tblprefix}alangs VALUES ('3247','set_volid','���÷־�','1264151162');
INSERT INTO {$tblprefix}alangs VALUES ('3248','del_vol','ɾ���־�󣬷־��ڵ����ݽ���Ϊ���־��� <br>�˲���ִ�к󲻿ɻָ���','1264152218');
INSERT INTO {$tblprefix}alangs VALUES ('3255','agmucustom','�����������գ������ʽ��a/b.php����ȷ��ϵͳ�д��ڸ��ļ���','1264303145');
INSERT INTO {$tblprefix}alangs VALUES ('3252','no_arange','�ų���Χ��','1264251919');
INSERT INTO {$tblprefix}alangs VALUES ('3251','yes_arange','����Χ��','1264251919');
INSERT INTO {$tblprefix}alangs VALUES ('3250','onlyview','�ű�ֻ�������','1264216291');
INSERT INTO {$tblprefix}alangs VALUES ('3256','custom_ucadd','�Զ�ǰ̨��Ӵ���ű�','1264304436');
INSERT INTO {$tblprefix}alangs VALUES ('3257','custom_uadetail','�Զ�������̨�༭�ű�','1264304348');
INSERT INTO {$tblprefix}alangs VALUES ('3258','custom_umdetail','�Զ����Ա���ı༭�ű�','1264304377');
INSERT INTO {$tblprefix}alangs VALUES ('3259','agcustomsetting','ÿ������һ�����ò��������ø�ʽΪ��������=����ֵ����aaa=abc��aa=a,b,c�ȡ�<br>��������Ҫ����php�����淶','1264322421');
INSERT INTO {$tblprefix}alangs VALUES ('3260','custom_ucvote','�Զ�ǰ̨ͶƱ����ű�','1264345190');
INSERT INTO {$tblprefix}alangs VALUES ('3261','bytenum','�ֽ���','1264383660');
INSERT INTO {$tblprefix}alangs VALUES ('3262','agarr_pre','���ϱ�ʶ���ҳ��ʶĬ��Ϊv�������ʶĬ��Ϊu��������ʶ��Ƕ��ͬ���ͱ�ʶʱ����Ҫ�޸ĸ�ֵ��<br> �ڵ�ǰ��ʶ�ڿ���{aaa}��{$v[aaa]}������Ϣ�����ʶ������Ϣֻ��ʹ��{$v[aaa]}��','1264818861');
INSERT INTO {$tblprefix}alangs VALUES ('3263','stat_text_size_src','�Զ�ͳ���ı���С��Դ','1264402621');
INSERT INTO {$tblprefix}alangs VALUES ('3264','disable_htmldir','�����ô�Ŀ¼','1264408485');
INSERT INTO {$tblprefix}alangs VALUES ('3265','agdirname','������������޸ľ�̬Ŀ¼����Ҫ������ҳ���޸���̬���ӻ��������ɾ�̬��','1264427322');
INSERT INTO {$tblprefix}alangs VALUES ('3266','fromcode','���Դ��뷵������','1264600443');
INSERT INTO {$tblprefix}alangs VALUES ('3267','aginnertext','ÿ����дһ��ѡ���ʽ1��ѡ��ֵ��ͬʱΪ��ʾ���⣩����ʽ2��ѡ��ֵ=ѡ����ʾ���⡣<br> ��ѡ���� ���Դ��뷵�����飬����дPHP���룬ʹ��return array(��������);�õ�ѡ�����ݡ�','1264600443');
INSERT INTO {$tblprefix}alangs VALUES ('3268','scorestr','����ѡ��(���ŷָ�)','1264678394');
INSERT INTO {$tblprefix}alangs VALUES ('3269','agscorestr','ѡ����Ϊ1-99���������ѡ����Զ��ŷָ�','1264678498');
INSERT INTO {$tblprefix}alangs VALUES ('3270','scorepics','ͳ�Ƹ�ѡ������ִ���','1264679184');
INSERT INTO {$tblprefix}alangs VALUES ('3271','agscorepics','���ͳ�ƴ�������Ҫ�����ʽΪscore_2(2Ϊѡ��)���ĵ�ͨ���ֶ�(��������)��','1264679329');
INSERT INTO {$tblprefix}alangs VALUES ('3272','repugradeadmin','���õȼ�����','1264700919');
INSERT INTO {$tblprefix}alangs VALUES ('3273','rgbase','����ֵ����','1264701022');
INSERT INTO {$tblprefix}alangs VALUES ('3274','repugrade','���õȼ�','1264701057');
INSERT INTO {$tblprefix}alangs VALUES ('3275','ico','ͼ��','1264701169');
INSERT INTO {$tblprefix}alangs VALUES ('3276','nodurat','������ʱ������','1264747618');
INSERT INTO {$tblprefix}alangs VALUES ('3278','custom_uaadd','�Զ������̨��ӽű�','1264835376');
INSERT INTO {$tblprefix}alangs VALUES ('3279','repu','����','1264904214');
INSERT INTO {$tblprefix}alangs VALUES ('3280','repualterlist','���ñ���б�','1264904263');
INSERT INTO {$tblprefix}alangs VALUES ('3281','repualter','���ñ��','1264904298');
INSERT INTO {$tblprefix}alangs VALUES ('3282','hand_repu','�ֶ���������ֵ','1264906552');
INSERT INTO {$tblprefix}alangs VALUES ('3283','agmultiuser','�����Ա�Զ��ŷָ�','1264907302');
INSERT INTO {$tblprefix}alangs VALUES ('3284','repurecord','���ü�¼','1264909424');
INSERT INTO {$tblprefix}alangs VALUES ('3285','repurelate','��Ա�������','1264909735');
INSERT INTO {$tblprefix}alangs VALUES ('3286','foundernobest','<b>[��ʾ]��ʼ���ʻ�����ѹ����ʻ���</b>','1267430171');

DROP TABLE IF EXISTS {$tblprefix}albums;
CREATE TABLE {$tblprefix}albums (
  abid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  chid smallint(6) unsigned NOT NULL DEFAULT '0',
  pid mediumint(8) unsigned NOT NULL DEFAULT '0',
  pchid smallint(6) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  volid smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (abid),
  KEY aid (aid),
  KEY pid (pid),
  KEY aid_2 (aid),
  KEY pid_2 (pid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}amconfigs;
CREATE TABLE {$tblprefix}amconfigs (
  amcid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  sid smallint(6) unsigned NOT NULL DEFAULT '0',
  caids text NOT NULL,
  fcaids varchar(255) NOT NULL,
  mchids varchar(255) NOT NULL,
  menus text NOT NULL,
  funcs text NOT NULL,
  cuids varchar(255) NOT NULL,
  mcuids varchar(255) NOT NULL,
  matids varchar(255) NOT NULL,
  abcustom tinyint(1) unsigned NOT NULL DEFAULT '0',
  fbcustom tinyint(1) unsigned NOT NULL DEFAULT '0',
  mbcustom tinyint(1) unsigned NOT NULL DEFAULT '0',
  anodes text NOT NULL,
  fnodes text NOT NULL,
  mnodes text NOT NULL,
  PRIMARY KEY (amcid)
) TYPE=MyISAM AUTO_INCREMENT=2;

INSERT INTO {$tblprefix}amconfigs VALUES ('1','�ճ�����','0','-1','-1','-1','1,3,125,126,127,128,129,44,59,60,88,78,96,79,27,22,26,37,123,131,21,82,28,29,31,33,95,34,35,36,38,40,42,56,80,97,122,107,120,48,51,53,54,55,57,43,32,39,106','normal,commu,static,orders,farchive,member,amember,mcommu,marchive,mtrans,utrans,extract,save,pay,gather,database,sitemap,record,other,currency,mchannel,grouptype,matype,cfmcommu,cftrans,channel,catalog,cotype,cnode,cfcommu,freeinfo,subsite,tpl,webparam,bkconfig,mcconfig,permission','5','','','1','1','1','a:13:{i:1;s:13:\"117,119,1,4,9\";i:2;s:13:\"117,119,1,4,9\";i:3;s:13:\"117,119,1,4,9\";i:4;s:13:\"117,119,1,4,9\";i:5;s:13:\"117,119,1,4,9\";i:6;s:13:\"117,119,1,4,9\";i:7;s:13:\"117,119,1,4,9\";i:8;s:9:\"121,1,4,9\";i:9;s:9:\"121,1,4,9\";i:10;s:9:\"121,1,4,9\";i:12;s:9:\"124,1,4,9\";i:13;s:9:\"118,1,4,9\";i:0;s:5:\"1,4,9\";}','a:17:{i:1;s:5:\"11,12\";i:2;s:5:\"11,12\";i:3;s:5:\"11,12\";i:4;s:5:\"11,12\";i:5;s:5:\"11,12\";i:6;s:5:\"11,12\";i:10;s:5:\"11,12\";i:11;s:5:\"11,12\";i:12;s:5:\"11,12\";i:14;s:5:\"11,12\";i:15;s:5:\"11,12\";i:13;s:5:\"11,12\";i:16;s:5:\"11,12\";i:17;s:5:\"11,12\";i:18;s:5:\"11,12\";i:20;s:5:\"11,12\";i:19;s:5:\"11,12\";}','a:1:{i:1;s:24:\"115,116,122,123,13,14,19\";}');

DROP TABLE IF EXISTS {$tblprefix}amsgs;
CREATE TABLE {$tblprefix}amsgs (
  lid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(50) NOT NULL,
  content text NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (lid)
) TYPE=MyISAM AUTO_INCREMENT=612;

INSERT INTO {$tblprefix}amsgs VALUES ('5','swordillegal','�������ʲ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('6','pleinpreaurl','�������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('7','swoaddfinish','��������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('8','hotkeystfunclo','���Źؼ���ͳ�ƹ����ѹر�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('3','no_apermission','��û�д���Ŀ�Ĺ���Ȩ�ޣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('4','swmodfin','���������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('9','keyimpfinish','�ؼ����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('10','msiteadmitem','��վ������Ŀ!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('11','pleaddvotcoc','�����ͶƱ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('12','datamissing','���ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('13','voteaddfinish','ͶƱ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('14','votmodfin','ͶƱ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('15','poivotenoe','ָ����ͶƱ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('16','userisforbid','���ڵ��������ֹ�˴˹���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('17','voteedifin','ͶƱ�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('18','pleinpopttit','������ѡ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('19','optaddfin','ѡ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('20','cocledifin','����༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('21','votcocaddfin','ͶƱ����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('22','choosealtype','��ָ����ȷ�ĺϼ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('23','coclwitvotcandel','����û���������ͶƱ����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('24','cocdelefini','����ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('25','selectaltrec','��ѡ������¼','0');
INSERT INTO {$tblprefix}amsgs VALUES ('26','useraltopefin','��Ա�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('27','choosealtrec','��ָ����ȷ�ı����¼','0');
INSERT INTO {$tblprefix}amsgs VALUES ('28','useraltrecmodfin','��Ա������¼�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('29','filetypeaddfinish','�ļ�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('30','pleinpusutitandurl','�����볣�����ӱ���������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('31','usuaddfin','��������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('32','usuedifin','�������ӱ༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('33','chooseusu','��ָ����ȷ�ĳ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('34','usuamodifin','���������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('35','filetypeeditfinish','�ļ����ͱ༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('36','inpusecoctit','�������û����ӷ������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('37','usecocmodfin','�û����ӷ����޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('38','chooseuserurl','��ָ����ȷ���û�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('39','inpusetiau','�������û����ӱ���������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('40','marcmodifysuccess','��Ա�����޸ĳɹ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('41','poiusebelcoc','��ָ���û�������������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('42','matypeaddsuccess','��Ա����������ӳɹ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('43','usermodfin','�û������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('44','usercocwitsoncoccandel','�û����ӷ���û����������ӷ������ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('45','matypesetsuccess','��Ա�����������óɹ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('46','mafieldaddsuccess','��Ա�����ֶ���ӳɹ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('47','usercocwitusecandel','�û����ӷ���û����������û����Ӳ���ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('48','matypedelsuccess','��Ա��������ɾ���ɹ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('49','usecocdelfin','�û����ӷ���ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('50','mafieldmodifysuccess','��Ա�����ֶα༭�ɹ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('51','userurldelfin','�û�����ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('52','deluserasmatype','����ɾ���뱾������ص����л�Ա����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('53','inputmatypename','�������Ա������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('54','mchanneleditfinish','��Աģ�ͱ༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('55','mchanneladdfinish','��Աģ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('56','mchannelcopyfinish','��Աģ�͸������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('57','usercocaddfin','�û����ӷ���������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('58','useraddfin','�û�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('59','channelmodifyfinish','ģ���޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('60','useedifin','�û����ӱ༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('61','chooseusecoc','��ָ����ȷ���û����ӷ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('62','fieldaddfinish','�ֶ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('63','chooseuserpara','��ָ����ȷ���û����Ӳ���!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('64','mchanneldeletefinish','��Աģ��ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('65','nopermission','û��ָ����Ŀ�Ĳ���Ȩ��!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('66','fieldeditfinish','�ֶα༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('67','fieldmodifyfinish','�ֶ��޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('68','schannelcannotdelete','ϵͳģ�Ͳ���ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('69','delchannelnomember','ģ��û��������Ļ�Ա����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('70','choosememberchannel','��ָ����ȷ�Ļ�Աģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('71','choosefield','��ָ����ȷ���ֶ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('72','choosegroup','��ָ����ȷ�Ļ�Ա����ϵ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('73','userdatamiss','��Ա�����ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('74','itemmodifyfinish','��Ŀ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('75','usergroupaddfin','��Ա��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('76','usergroupmodfin','��Ա���޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('77','usercopyfin','��Ա�鸴�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('78','usereditfin','��Ա��༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('79','mcommucopyfinish','��Ա������Ŀ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('80','selectarchive','��ѡ���ĵ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('81','chooseitem','��ָ����ȷ����Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('82','operating','�ļ��������ڽ�����...<br>�� %s ҳ�����ڴ���� %s ҳ<br><br>%s>>��ֹ��ǰ����%s','0');
INSERT INTO {$tblprefix}amsgs VALUES ('83','attopefin','�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('84','subdatamiss','��վ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('85','substadirill','��վ��̬Ŀ¼���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('86','nowcresubstadir','�޷�������վ��̬Ŀ¼','0');
INSERT INTO {$tblprefix}amsgs VALUES ('87','msitrasubfin','��վתΪ��վ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('88','msitrasubfai','��վתΪ��վʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('89','delmsiarcoralb','��ɾ����վ���ĵ���ϼ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('90','delmsicat','��ɾ����վ����Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('91','inputcommuname','�����뽻����Ŀ���ƣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('92','hosturlillegal','����URL���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('93','subtemdirill','��վģ��Ŀ¼���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('94','websitesetfinish','��վ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('95','nowcresubtemdir','�޷�������վģ��Ŀ¼','0');
INSERT INTO {$tblprefix}amsgs VALUES ('96','tpldirillegal','ģ��Ŀ¼���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('97','subaddfin','��վ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('98','paysetfinish','����֧���������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('99','subaddfai','��վ���ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('100','mailsetfinish','�ʼ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('101','subopefin','��վ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('102','pointfieldtype','��ָ���ֶ�����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('103','delmsicno','��ɾ����վ�Ľڵ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('104','delmsicnocon','��ɾ����վ�Ľڵ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('105','delmsialt','��ɾ����վ�ĺϼ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('106','delmsiisopag','��ɾ����վ�Ķ���ҳ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('107','delmsigatrec','��ɾ����վ�Ĳɼ���¼','0');
INSERT INTO {$tblprefix}amsgs VALUES ('108','delmsigatmiss','��ɾ����վ�Ĳɼ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('109','delmsgatcha','��ɾ����վ�Ĳɼ�ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('110','subtramsifin','��վתΪ��վ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('111','subwitarccandel','��վû����������ĵ�����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('112','subwitcatcandel','��վû�����������Ŀ����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('113','subwitcatcnocandel','��վû�����������Ŀ�ڵ����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('114','subswitcnoconcandel','��վû��������Ľڵ����ò���ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('115','membernameillegal','��Ա���Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('116','subwitltdel','��վû��������ĺϼ����Ͳ���ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('117','subitisopagdel','��վû��������Ķ���ҳ�����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('118','membernamerepeat','��Ա�����ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('119','subwitgatmisdel','��վû��������Ĳɼ��������ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('120','memberemailillegal','��ԱEmail���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('121','subwitgathadel','��վû��������Ĳɼ�ģ�Ͳ���ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('122','erroroperate','�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('123','subitgatrecdel','��վû��������Ĳɼ���¼����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('124','subdelfin','��վɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('125','memberaddfinish','��Ա������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('126','membermodifyfinish','��Ա�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('127','donrepoper','�벻Ҫ�ظ�����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('128','subsetupcancel','��װ��������ȡ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('129','mnamelengthillegal','��Ա���Ƴ��Ȳ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('130','operatesuc','�����ɹ�!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('131','memberpwdillegal','��Ա���벻�Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('132','undosuc','�����ɹ�!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('133','upinssubinidataupl','���ϴ���Ҫ��װ����վԭʼ����!<br /><br />�����ϴ�·��:%s','0');
INSERT INTO {$tblprefix}amsgs VALUES ('134','memberaddfailed','��Ա���ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('135','choosemember','��ָ����ȷ�Ļ�Ա','0');
INSERT INTO {$tblprefix}amsgs VALUES ('136','invoperate','��Ч����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('137','cannotmodifyfounder','�����޸Ĵ�ʼ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('138','telcopyerror','ģ�帴�ƴ���!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('139','memberdelfinish','��Աɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('140','memberoperatefinish','��Ա�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('141','recdelfin','��¼ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('142','selectsubcon','��ѡ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('143','selectoperateitem','��ѡ�������Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('144','selectmember','��ѡ���Ա','0');
INSERT INTO {$tblprefix}amsgs VALUES ('145','noissuepermission','û�� %s �ķ���Ȩ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('146','calbumcoverchannel','��ָ����ȷ�ĺϼ�����ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('147','choosecatalog','��ָ����ȷ����Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('148','nocurcatalogpermi','��ǰ�û�û��ָ����Ŀ�ķ���Ȩ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('149','subdelsuc','����ɾ���ɹ�!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('150','catalogcantadd','%s ��Ŀ������� %s','0');
INSERT INTO {$tblprefix}amsgs VALUES ('151','fbd_caids','ָ����Ŀ�ĺ�̨����Ȩ�ޱ����� !','0');
INSERT INTO {$tblprefix}amsgs VALUES ('152','addalbumfailed','��Ӻϼ�ʧ��!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('153','choarcpaty','��ѡ���ĵ�ҳ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('154','albumaddfinish','�ϼ�������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('155','albumeditfinish','�ϼ��༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('156','staopefin','��̬�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('157','albumcopyseditfinish','�ϼ������༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('158','chocatpagty','��ѡ����Ŀҳ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('159','selectalbum','��ѡ��ϼ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('160','chocatcno','��ѡ����Ŀ�ڵ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('161','catcnoopefin','��Ŀ�ڵ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('162','inddeafin','��ҳ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('163','setalbumfinish','�鼭�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('164','pagemodfin','ҳ���޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('165','exitalbumfinish','�˳��ϼ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('166','sptplnoexist','û�ж���ģ���ģ�岻����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('167','temconnot','ģ�����ݲ���Ϊ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('168','tplerrsave','ģ�屣��ʱ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('169','choosealbum','��ָ����ȷ�ĺϼ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('170','tplmodfin','ģ���޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('171','albumadminfinish','�ϼ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('172','splmodfin','���������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('173','sitmodfin','Sitemap�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('174','choosesite','��ָ����ȷ��Sitemap','0');
INSERT INTO {$tblprefix}amsgs VALUES ('175','aboveralbum','���ϼ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('176','nobaidunews','δ����������Sitemap���������ֶε��ĵ�ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('177','selectcatg','��ѡ����Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('178','noarcoralbumload','û�п��Լ��ص��ĵ���ϼ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('179','selectcha','��ѡ��ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('180','confirmselect','��ѡ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('181','sitsetfin','Sitemap�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('182','sitemapclo','Sitemap�ѹر�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('183','sitcrefin','Sitemap�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('184','shiaddfin','�ͻ���ʽ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('185','shimodfin','�ͻ���ʽ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('186','promodfin','�����޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('187','proaddfin','����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('188','fileextill','�ļ���չ�����Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('189','fileextrep','�ļ���չ���ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('190','remproedifin','Զ�̷����༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('191','prodatamis','��������missiong','0');
INSERT INTO {$tblprefix}amsgs VALUES ('192','piclisopefin','�ٱ��б�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('193','noexrecord','�����ڼ�¼','0');
INSERT INTO {$tblprefix}amsgs VALUES ('194','syscacreffin','ϵͳ����ˢ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('195','albumfinish','�ϼ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('196','selectgoods','��ѡ����Ʒ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('197','goolisopefin','��Ʒ�б�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('198','updateclosed','ϵͳ�ر��˸��¹��ƹ��ܼ����¸������ܣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('199','definechannelp','�붨��ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('200','altypeaddfinish','�ϼ�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('201','altypesetfinish','�ϼ������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('202','altypenoarcoralbumdel','�ϼ�����û����������ĵ���ϼ�����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('203','altypedelfinish','�ϼ�����ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('204','bapdatamiss','��̨�������ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('205','bapaddfinish','��̨����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('206','bapmodifyfinish','��̨�����޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('207','chooseadminbap','��ָ����ȷ�Ĺ����̨����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('208','adminbapsetfinish','�����̨�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('209','pmmiss','�������ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('210','pmsendfin','���ŷ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('211','pmclearfin','����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('212','amsgeditfinish','��̨��ʾ�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('213','inpplanam','�����벥��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('214','amsgaddfinish','��̨��ʾ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('215','playaddfin','������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('216','amsgmodifyfinish','��̨��ʾ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('217','playedifin','�������༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('218','enameillegal','��ʶ���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('219','choosepla','��ָ����ȷ�Ĳ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('220','enamerepeat','��ʶ�ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('221','inpplatem','�����벥����ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('222','playmodfin','�������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('223','chooseamsg','��ָ����ȷ�ĺ�̨��ʾ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('224','selectpayrec','��ѡ��֧����¼','0');
INSERT INTO {$tblprefix}amsgs VALUES ('225','selectanswer','��ѡ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('226','casvadmopefin','�ֽ��ֵ����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('227','answerlistfinish','���б�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('228','choosepay','��ָ����ȷ��֧��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('229','answernoexist','ָ���Ĵ𰸲�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('230','choosepayrec','��ָ����ȷ��֧����¼','0');
INSERT INTO {$tblprefix}amsgs VALUES ('231','inppayamo','������֧������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('232','questionclosed','�����ѹر�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('233','inputanswercontent','������ش�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('234','paymesmodfin','֧����Ϣ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('235','answerovermin','������̫��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('236','selectorder','��ѡ�񶩵�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('237','answermodifyfinish','���޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('238','choosechannel','��ָ����ȷ��ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('239','ordopefin','�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('240','ordmodfin','�����޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('241','chooseord','��ָ����ȷ�Ķ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('242','addarcfailed','����ĵ�ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('243','cheordcanmod','���ܶԴ�״̬�������б�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('244','arcaddfinish','�ĵ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('245','arceditfinish','�ĵ��༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('246','arccopyseditfinish','�ĵ������༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('247','mlangedifin','��Ա���ı༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('248','mlanaddfin','��Ա�������԰�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('249','choosemlan','��ָ����ȷ�Ļ�Ա�������԰�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('250','mlangmodfin','��Ա�������԰��޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('251','clangedifin','ǰ̨���԰��༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('252','clangaddfin','ǰ̨���԰�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('253','choosenclang','��ָ����ȷ��ǰ̨���԰�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('254','clangmodfin','ǰ̨���԰��޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('255','memchaaltopefin','��Աģ�ͱ���������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('256','memchaaltrecmodfin','��Աģ�ͱ����¼�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('257','arcfinish','�ĵ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('258','mtplsearchnone','û����������Ҫ����ģ���ļ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('259','temcnaill','ģ�����Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('260','pagtemrepdef','ҳ��ģ���ظ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('261','temaddfin','ģ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('262','undefanswerchannel','δ�������ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('263','temputfin','ģ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('264','temdatamiss','ģ�����ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('265','temcopfin','ģ�帴�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('266','poitagsou','��ָ����ʶ��Դ!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('267','temfiladdfai','ģ���ļ����ʧ��!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('269','poisotemfino','ָ����Դģ���ļ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('270','poitemficnarep','ָ����ģ���ļ������ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('584','replysetsucceed','�ظ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('272','temcopfai','ģ�帴��ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('585','setusualfin','ָ����ʶ�ɹ����볣�ñ�ʶ�⣡','0');
INSERT INTO {$tblprefix}amsgs VALUES ('274','spatempromodfin','�ռ�ģ�巽���޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('586','setusualed','ָ����ʶ�Ѿ������ĳ��ñ�ʶ���У�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('276','questionadminsucceed','�������ɹ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('277','spacatmodfin','�ռ���Ŀ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('278','badwordsamerword','���������滻����ͬ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('279','badwordaddfinish','������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('280','badwordmodifyfinish','�������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('281','temprodatmis','ģ�巽�����ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('282','inputsearchstring','�����������ִ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('283','temproaddfin','ģ�巽��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('284','addchannel','���������Ч��ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('285','inpspacatcnam','������ռ���Ŀ����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('286','catalogdatamiss','��Ŀ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('287','spacataddfin','�ռ���Ŀ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('288','catalogenameillegal','��Ŀ��ʶ���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('289','choosespatempro','��ָ����ȷ�Ŀռ�ģ�巽��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('290','catalogenamerepeat','��Ŀ��ʶ�ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('291','selectopecat','��ѡ�������Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('292','catalogaddfinish','��Ŀ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('293','catalogeditfinish','��Ŀ�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('294','tempprosetfin','ģ�巽���������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('295','paramerror','��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('296','catas_forbidmove','��Ŀ����ת��ԭ��Ŀ��������Ŀ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('297','catalogsetfinish','��Ŀ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('298','tagdatamiss','��ʶ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('299','tagenidill','��ʶӢ��ID���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('304','choosetag','��ָ����ȷ�ı�ʶ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('301','tagenidrep','��ʶӢ��ID�ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('302','catalognosoncandel','��Ŀû�������������Ŀ����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('303','tagaddfin','��ʶ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('305','catalognoarccandel','��Ŀû����������ĵ�����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('306','tagmodfin','��ʶ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('307','catalogdelfinish','��Ŀɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('308','errorparament','������ļ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('309','archanneleditfinish','�ĵ�ģ�ͱ༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('310','channelnamemiss','ģ�����Ʋ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('311','arcchanneladdfinish','�ĵ�ģ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('312','arcchannelcopyfinish','�ĵ�ģ�͸������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('313','channelnoaltypecandel','ģ��û��������ĺϼ����Ͳ���ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('314','channelnoarccandel','ģ��û����������ĵ�����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('315','arcchanneldelfinish','�ĵ�ģ��ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('316','temfilcnaill','ģ���ļ����Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('317','cmsgeditfinish','ǰ̨��ʾ�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('318','cmsgaddfinish','ǰ̨��ʾ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('319','tagcopfin','��ʶ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('320','confirmchoosecmsg','��ָ����ȷ��ǰ̨��ʾ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('321','cmsgmodifyfinish','ǰ̨��ʾ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('322','conmemcha','���������Ч�Ļ�Աģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('323','choosememchaaltpro','��ָ����ȷ�Ļ�Աģ�ͱ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('324','inpprocna','�����뷽������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('325','souchatarchasam','��Դģ����Ŀ��ģ����ͬ!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('326','memchaalpromodfin','��Աģ�ͱ�������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('327','confirmadduser','���������Ч�Ļ�Ա��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('328','usealtprodelfin','��Ա��������ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('329','memchanaltprodelfin','��Աģ�ͱ������ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('330','usealtpromodfin','��Ա���������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('331','prorepdef','�����ظ�����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('332','useraltproaddfin','��Ա��������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('333','souuserandtar','��Դ��Ա����Ŀ���Ա����ͬ!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('334','memchaalproaddfin','��Աģ�ͱ������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('335','mmsgmodfin','��Ա������ʾ��Ϣ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('336','choosemmsg','��ָ����ȷ�Ļ�Ա������ʾ��Ϣ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('337','mmsgaddfin','��Ա������ʾ��Ϣ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('338','ccconfigsavefinish','�ڵ�ṹ���ñ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('339','mmsgeditfin','��Ա������ʾ��Ϣ�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('340','cconfigsaddfinish','�ڵ�ṹ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('341','menitedelfin','�˵���Ŀɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('342','pleinpmmecoctit','�������Ա���Ĳ˵��������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('343','memcenmecocaddfin','��Ա���Ĳ˵�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('344','pleinpmetitandurl','������˵�����������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('345','poimmebelcoc','��ָ����Ա���Ĳ˵���������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('346','memcenmeniteadd','��Ա���Ĳ˵���Ŀ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('347','ccnodeupdatefinish','��Ŀ�ڵ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('348','mecemeedifin','��Ա���Ĳ˵��༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('349','choosemecoc','��ָ����ȷ�Ĳ˵�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('350','mecocmodfin','�˵������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('351','selectcnode','��ѡ��ڵ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('352','oosemmit','��ָ����ȷ�Ļ�Ա���Ĳ˵���Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('353','cnodeoperatefinish','�ڵ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('354','inmmtiturl','�������Ա���Ĳ˵�����������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('355','menitemodfin','�˵���Ŀ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('356','cnodesetfinish','�ڵ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('357','mecocoutmetedel','�˵�����û��������Ĳ˵���Ŀ����ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('358','mecocdefi','�˵�����ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('359','choosecotypem','��ָ����ȷ�������ϵ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('360','coclassdatamiss','�������ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('361','mecenpagusetfin','��Ա����ҳ����ʾ˵���������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('362','coclassenameillegal','�����ʶ���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('363','inpmecoctit','������˵��������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('364','coclassenamerepeat','�����ʶ�ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('365','inpcocdefurl','������˵�����Ĭ������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('366','setself_regcondition','�������Զ���������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('367','mocwitocdel','�˵�����û����������ӷ������ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('368','coclassaddfinish','����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('369','pombecoc','��ָ���˵���������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('370','coclasssetfinish','�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('371','choosemeit','��ָ����ȷ�Ĳ˵���Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('372','coclassnosoncandel','����û����������ӷ������ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('373','menitedfin','�˵���Ŀ�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('374','selectcomment','��ѡ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('375','commentadminfinish','���۹������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('377','commentnoexist','ָ�������۲�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('378','choosematype','��ָ����ȷ�Ļ�Ա��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('379','commentovermin','���۳�����С�ֳ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('380','commentmodifyfinish','�����޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('381','cotypeeditfinish','��ϵ�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('382','cotypenamemiss','��ϵ���Ʋ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('383','cotypeaddfinish','��ϵ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('384','cotypeaddfailed','��ϵ���ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('385','choosecotype','��ָ����ȷ����ϵ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('386','cotypemsetfinish','�����ϵ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('387','cotypedelfinish','�����ϵɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('388','grouedifin','��Ա����ϵ�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('389','pointfilename','��ָ���ļ�����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('390','groupdatamis','��Ա����ϵ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('391','grouaddfin','��Ա����ϵ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('392','sfileaddfinish','%s �ļ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('393','grouperrsave','��Ա����ϵ����ʱ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('394','fileaddfailed','�ļ����ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('395','gathmodedifin','�ɼ�ģ�ͱ༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('396','filenamerepeat','ָ�����ļ������ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('397','modrelarcmodnoe','�ɼ�ģ�͹������ĵ�ģ�Ͳ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('398','jsfilemodifyfinish','JS�ļ��޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('399','cssfilemodifyfinish','CSS�ļ��޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('400','socfilenoexist','ָ����Դ�ļ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('401','targetfilename','��ָ��Ŀ���ļ�����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('402','filecopyfailed','�ļ�����ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('403','definejsfiletemplate','�붨��JS�ļ�ģ��!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('404','jsfileupdatefinish','JS�ļ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('405','gatmodmodfin','�ɼ�ģ���޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('406','filecopyfinish','�ļ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('407','filemodifyfinish','�ļ��޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('408','filedelfinish','�ļ�ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('409','replycoclasseditfinish','�ظ�����༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('410','replycoclassaddfinish','�ظ�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('411','inpgatmodnam','������ɼ�ģ������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('412','replycoclassdelfinish','�ظ�����ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('413','chorcchanalt','��ѡ���ĵ�ģ�ͻ�ϼ�����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('414','gamodaddfin','�ɼ�ģ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('415','choosegatmod','��ָ����ȷ�Ĳɼ�ģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('416','currencyaddfinish','����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('417','currencyfinish','���ֲ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('418','currencyeditfinish','���ֱ༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('419','definecurrencytype','�붨���������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('420','pricenamerepeat','�۸������ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('421','currencypriceaddfinish','���ּ۸�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('422','currencypriceeditfinish','���ּ۸�༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('423','addgatcha','����Ӳɼ�ģ��!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('424','definemorecurrencytype','�붨������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('425','notexchangesame','��ͬ����֮�䲻�ܶһ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('426','gatmismodfin','�ɼ������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('427','gatmisaddfin','�ɼ�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('428','exchangeexist','�һ������Ѵ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('429','gatmisedifin','�ɼ�����༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('430','exchangeaddfinish','�һ�����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('431','exchangemodifyfinish','�һ������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('432','defineinoutcutype','�붨����Գ�/��ֵ�Ļ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('433','currencyinoutfinish','���ֳ�/��ֵ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('434','commuitemcopyfinish','������Ŀ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('435','filenameillegal','�ļ����Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('436','selecttable','��ѡ�����ݱ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('437','tableexportfailed','���ݱ����ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('438','backuping','ȫ�� %s �����ݱ�,���ڱ��ݵ� %s �����ݱ�<br>�־� %s ������ϡ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('439','dbbackupfinish','���ݿⱸ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('440','choosegatmis','��ָ����ȷ�Ĳɼ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('441','selectnet','��ѡ����ַ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('442','congatfinconoutwa','�����Զ��ɼ����<br>��ʼ�������,��ȴ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('443','nooutitem','�������Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('444','setoutrul','������������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('445','conautoutfin','�����Զ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('446','backupfiledelfinish','�����ļ�ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('447','connetgatfin','������ַ�ɼ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('448','nongatitem','�޲ɼ���Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('449','setgatrul','�����òɼ�����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('450','conaugatfin','�����Զ��ɼ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('451','gatmisdatmis','�ɼ��������ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('452','pageaddfin','ҳ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('453','selectbackupfile','��ѡ�񱸷��ļ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('454','chooseisopa','��ָ����ȷ�Ķ���ҳ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('455','pagestafin','ҳ�澲̬���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('456','pastacanfin','ҳ�澲̬ȡ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('457','selectford','��ѡ�񶩵�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('458','choosemes','��ָ����ȷ����Ϣ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('459','addrepsuc','��ӻظ��ɹ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('460','thconiteclo','����ѯ��Ŀ�ѹر�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('461','staetsuc','״̬���óɹ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('462','nomatype','�붨���Ա��������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('463','poconcoc','��ָ����ѯ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('464','nocheckmess','δ����Ϣ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('465','importdbsucceed','�������ݿ�ɹ�!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('466','freeopefin','������Ϣ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('467','mselectmes','��ѡ����Ϣ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('468','maddconmescoc','���������Ч����ѯ��Ϣ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('469','frechadelfin','������Ϣģ��ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('470','chaoutrelocdel','ģ��û�����������ط������ɾ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('471','frechaaddfin','������Ϣģ��������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('472','frechaedifin','������Ϣģ�ͱ༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('473','cocwitarccandel','����û����������ĵ����ӷ���ʱ����ɾ��','1264318910');
INSERT INTO {$tblprefix}amsgs VALUES ('474','mescocaddfin','��Ϣ����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('475','deffrecha','�붨�帽����Ϣģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('476','volumeexporting','�־�%s������ϣ����ڴ���־�$s��<br>%s��ֹ��ǰ����%s','0');
INSERT INTO {$tblprefix}amsgs VALUES ('477','choosemesid','��ָ����ȷ����ϢID','0');
INSERT INTO {$tblprefix}amsgs VALUES ('478','freaddfin','������Ϣ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('479','mesaddfai','��Ϣ���ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('480','nothicocaddper','��û�д˷�������Ȩ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('481','choosemescoc','��ָ����ȷ����Ϣ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('482','dbconerr','�ⲿ����Դ���Ӵ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('483','dbdatamis','�ⲿ����Դ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('484','choosedbs','��ָ����ȷ���ⲿ����Դ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('485','dbmodfin','�ⲿ����Դ�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('486','dbaddfin','�ⲿ����Դ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('487','succrepl','�ɹ��滻%s����¼��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('488','tableoperatefinish','���ݱ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('489','inputsqlcode','������SQL����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('490','ondeal','�벻Ҫ�������������ֶΡ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('491','sqlresult','SQL����ִ�гɹ�!���漰 %s ����¼��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('492','find','����%s','0');
INSERT INTO {$tblprefix}amsgs VALUES ('493','notablerecord','û���ҵ����������ļ�¼��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('494','notablekey','�����ݱ���Կ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('495','modseareptxtnot','����ģʽ,�����ı����滻�ı�����Ϊ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('496','dataexportfailed','�������ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('497','dataexportfinish','��������ɹ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('498','choosetable','��ָ����ȷ�����ݱ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('499','dataiodfin','���ݿ��ֶα�ע�޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('500','chooseconfigfile','��ѡ�������ļ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('501','configfiledelfinish','�����ļ�ɾ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('502','onlyfounderconfig','����ʼ�˿��԰�װϵͳ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('503','inputuportplfolder','�������ϴ��ļ��л�ģ���ļ�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('504','uportplfolderillegal','�ϴ��ļ��л�ģ���ļ������Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('505','uploadfilemiss','�ϴ��ļ�����ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('506','tplfolderused','ģ���ļ��б�ռ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('507','psqlfileillegal','package.sql�ļ����Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('508','psqlfileerror','package.sql�ļ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('509','cfgfilevererror','�����ļ��汾����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('510','funcdircopyfailed','����Ŀ¼����ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('511','marcfinish','��Ա�����޸ĳɹ�!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('512','alangaddfin','��̨���԰�������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('513','alangedifin','��̨���԰��༭���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('514','alangmodfin','��̨���԰��޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('515','find_replace','����%s����¼���ɹ��滻%s����¼��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('516','choose_msg_id','��ָ����ȷ����ϢID','0');
INSERT INTO {$tblprefix}amsgs VALUES ('534','point_altype','��ָ���ϼ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('533','input_tag_tpl','�������ʶģ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('530','field_ename_repeat','�ֶα�ʶ�ظ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('531','field_ename_illegal','�ֶα�ʶ���Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('532','field_ename_notuse','�ֶα�ʶ��ֹʹ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('529','field_data_miss','�ֶ����ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('547','nosite','ָ����վ�㲻����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('525','data_export_failed','�������ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('526','data_export_finish','����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('535','usource_illegal','��Ϊ�����ԭʼ��Ϣ��ʶ���Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('536','input_query_string','�������ѯ�ִ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('537','choose_commu_item','��ָ����ȷ�Ľ�����Ŀ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('538','psource_illegal','��ҳ������Դ��ʶ�����Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('539','choose_msg_class','��ָ����ȷ����Ϣ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('540','tag_data_miss','��ʶ���ϲ���ȫ','0');
INSERT INTO {$tblprefix}amsgs VALUES ('541','tpl_file_name_illegal','ģ���ļ����Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}amsgs VALUES ('542','tpl_save_failed','ģ�屣��ʧ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('543','point_isolute_page_id','��ָ������ҳID','0');
INSERT INTO {$tblprefix}amsgs VALUES ('544','input_usource','ȷ��������ȷ��Ϊ�����ԭʼ��Ϣ��ʶ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('546','addinpointalbum','��ָ���ϼ������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('549','defineachannel','�붨���ĵ�ģ�ͣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('550','aurlmissname','�����������������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('551','aurladdfinish','����������ӳɹ�!\r\n�����ӵ����ӽ�����ϸ���á�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('552','chooseaurl','��ѡ��Ĺ������Ӳ����ڻ�ɾ��!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('553','selectanode','��ѡ����Ҫ�����Ĺ���ڵ�!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('554','definealtype','�붨��ϼ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('555','define_add_fcoclass','�붨�帽����Ϣ����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('556','no_commu_tplset','û����Ҫ����ģ����ĵ�����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('557','no_mcommu_tplset','û����Ҫ����ģ��Ļ�Ա����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('558','contentsetsucceed','�������������ɹ�!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('559','pchoosecontent','��ѡ����Ҫ������������!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('560','updatesucceed','%s���³ɹ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('561','choosereply','��ָ����ȷ�Ļظ�����!','0');
INSERT INTO {$tblprefix}amsgs VALUES ('562','albumisover','����ָ���ĺϼ�������Ϊ��ᣬ������ӻ�����µ����ݣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('563','albumisoneuser','����ָ���ĺϼ�Ϊ���˺ϼ���ֻ�кϼ����߲ſ�������µ����ݣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('564','albumisload','����ָ���ĺϼ�Ϊ�����Ժϼ�������ֱ���ںϼ�������µ����ݣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('565','albumovermax','����ָ���ĺϼ������������Ѵﵽ��������ƣ���������ּ������ݺ�ſ�����ӻ�����µ����ݣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('566','confchoosarchi','��ָ����ȷ���ĵ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('567','choosearctype','��ѡ���ĵ����ͣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('568','btagupdatefin','ԭʼ��ʶ���³ɹ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('569','altypecopyfinish','�ϼ����͸��Ƴɹ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('570','orddelfin','����ɾ���ɹ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('571','select_both_cc','ȷ�϶��� �� ȡ������ ���ܲ���ִ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('572','ordmodpay','�������޸ĳɹ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('573','scnodeupdatefinish','�����ڵ���³ɹ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('575','goucpmadmin','�����UCenter���� [%s]','0');
INSERT INTO {$tblprefix}amsgs VALUES ('576','outrulmodfin','�������޸����','0');
INSERT INTO {$tblprefix}amsgs VALUES ('577','nogatheritem','û����Ҫ�ɼ���������ַ��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('578','toautogather','������ַ�ɼ���ϣ�<br> ϵͳ���Զ�ת�����ݲɼ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('579','toautoouput','���ݲɼ���ɣ�<br> ϵͳ�����Զ���������⣡','0');
INSERT INTO {$tblprefix}amsgs VALUES ('580','onekeyfinish','һ���ɼ�ȫ��������ɣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('581','p_setrule','����ɼ����������ԣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('582','ga_op_finish','�ɼ�����������ɣ�','0');
INSERT INTO {$tblprefix}amsgs VALUES ('583','p_choosegurl','��ָ����ȷ�Ĳɼ���¼��','0');
INSERT INTO {$tblprefix}amsgs VALUES ('589','utcls_fin','���ñ�ʶ����������','0');
INSERT INTO {$tblprefix}amsgs VALUES ('590','utcls_exist','���ñ�ʶ�����Ѵ���','0');
INSERT INTO {$tblprefix}amsgs VALUES ('591','setcommuitem','�����ý�����Ŀ!','1261884698');
INSERT INTO {$tblprefix}amsgs VALUES ('592','chooseproduct','��ָ����Ʒ!','1261884750');
INSERT INTO {$tblprefix}amsgs VALUES ('593','choosecommentobject','��ָ�����۵Ķ���!','1261884789');
INSERT INTO {$tblprefix}amsgs VALUES ('594','choosereplyobject','��ָ����ȷ�Ļظ�����!','1261886023');
INSERT INTO {$tblprefix}amsgs VALUES ('595','notnull','%s ����Ϊ��','1261897183');
INSERT INTO {$tblprefix}amsgs VALUES ('596','extract_check_finish','��������������','1263203390');
INSERT INTO {$tblprefix}amsgs VALUES ('597','extract_operate_finish','�����������','1263264774');
INSERT INTO {$tblprefix}amsgs VALUES ('598','select_extract','��ѡ�����ּ�¼','1263264973');
INSERT INTO {$tblprefix}amsgs VALUES ('599','uurls_or_uregular','�ֶ���Դ��ַ��������Դ��ַ������Ҫ��дһ��','1264129641');
INSERT INTO {$tblprefix}amsgs VALUES ('600','uspilit_and_uurltag','��ַ�б�ָ�������ַ�ɼ�ģӡ����Ϊ��','1264130243');
INSERT INTO {$tblprefix}amsgs VALUES ('601','onlyabvol','ֻ�кϼ��ſ��Է־�!','1264142459');
INSERT INTO {$tblprefix}amsgs VALUES ('602','pputvtitle','������־���!','1264144824');
INSERT INTO {$tblprefix}amsgs VALUES ('603','volidrepeat','�־���ظ������������룡','1264145013');
INSERT INTO {$tblprefix}amsgs VALUES ('604','voladdfin','�־���ӳɹ���','1264145170');
INSERT INTO {$tblprefix}amsgs VALUES ('605','voldelfin','ָ���־�ɾ���ɹ���','1264146371');
INSERT INTO {$tblprefix}amsgs VALUES ('606','voleditfin','�־��޸���ɣ�','1264146535');
INSERT INTO {$tblprefix}amsgs VALUES ('607','repugrademodfin','���õȼ��༭�ɹ���','1264704241');
INSERT INTO {$tblprefix}amsgs VALUES ('608','confirmselectcomment','��ѡ������һ�����ۼ�¼��','1264818563');
INSERT INTO {$tblprefix}amsgs VALUES ('609','delrepusrecord','ɾ����Ա����ֵ��¼','1264906194');
INSERT INTO {$tblprefix}amsgs VALUES ('610','handrepufin','�ֶ�������Ա����ֵ���!','1264907484');
INSERT INTO {$tblprefix}amsgs VALUES ('611','arcallowance','���ķ��������ѳ����޶','1265535495');

DROP TABLE IF EXISTS {$tblprefix}answers;
CREATE TABLE {$tblprefix}answers (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  answer mediumtext NOT NULL,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  votes1 int(10) unsigned NOT NULL DEFAULT '0',
  votes2 int(10) unsigned NOT NULL DEFAULT '0',
  votes3 int(10) unsigned NOT NULL DEFAULT '0',
  votes4 int(10) unsigned NOT NULL DEFAULT '0',
  votes5 int(10) unsigned NOT NULL DEFAULT '0',
  crid smallint(6) unsigned NOT NULL DEFAULT '0',
  currency int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}archives;
CREATE TABLE {$tblprefix}archives (
  aid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) NOT NULL,
  sid smallint(5) unsigned NOT NULL DEFAULT '0',
  caid smallint(5) unsigned NOT NULL DEFAULT '0',
  chid tinyint(3) unsigned NOT NULL DEFAULT '0',
  cpid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname char(15) NOT NULL,
  ucid mediumint(8) unsigned NOT NULL DEFAULT '0',
  abover tinyint(1) unsigned NOT NULL DEFAULT '0',
  abnew mediumint(8) unsigned NOT NULL DEFAULT '0',
  author char(30) NOT NULL,
  `source` varchar(50) NOT NULL DEFAULT '',
  abstract mediumtext NOT NULL,
  keywords char(100) NOT NULL,
  thumb varchar(255) NOT NULL,
  vieworder smallint(6) unsigned NOT NULL DEFAULT '500',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  updatedate int(10) unsigned NOT NULL DEFAULT '0',
  refreshdate int(10) NOT NULL DEFAULT '0',
  enddate int(10) NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  clicks int(10) unsigned NOT NULL DEFAULT '0',
  comments int(10) unsigned NOT NULL DEFAULT '0',
  scores int(10) unsigned NOT NULL DEFAULT '0',
  avgscore float unsigned NOT NULL DEFAULT '0',
  orders int(10) unsigned NOT NULL DEFAULT '0',
  ordersum int(10) unsigned NOT NULL DEFAULT '0',
  favorites int(10) unsigned NOT NULL DEFAULT '0',
  praises int(10) unsigned NOT NULL DEFAULT '0',
  debases int(10) unsigned NOT NULL DEFAULT '0',
  answers int(10) unsigned NOT NULL DEFAULT '0',
  atmsize int(10) unsigned NOT NULL DEFAULT '0',
  bytenum int(10) unsigned NOT NULL DEFAULT '0',
  downs int(10) unsigned NOT NULL DEFAULT '0',
  rpmid smallint(6) NOT NULL DEFAULT '-1',
  dpmid smallint(6) NOT NULL DEFAULT '-1',
  salecp varchar(15) NOT NULL,
  fsalecp varchar(15) NOT NULL,
  price float unsigned NOT NULL DEFAULT '0',
  crid smallint(6) unsigned NOT NULL DEFAULT '0',
  currency int(10) unsigned NOT NULL DEFAULT '0',
  adopts int(10) unsigned NOT NULL DEFAULT '0',
  closed tinyint(1) unsigned NOT NULL DEFAULT '0',
  finishdate int(10) unsigned NOT NULL DEFAULT '0',
  replys int(10) unsigned NOT NULL DEFAULT '0',
  offers int(10) unsigned NOT NULL DEFAULT '0',
  ccid1 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid2 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid3 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid4 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid5 smallint(6) unsigned NOT NULL DEFAULT '0',
  plays int(10) unsigned NOT NULL DEFAULT '0',
  ccid6 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid7 smallint(6) unsigned NOT NULL DEFAULT '0',
  score_1 int(11) NOT NULL DEFAULT '0',
  score_2 int(11) NOT NULL DEFAULT '0',
  score_3 int(11) NOT NULL DEFAULT '0',
  score_4 int(11) NOT NULL DEFAULT '0',
  score_5 int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (aid),
  KEY chid (chid),
  KEY cpid (cpid),
  KEY mid (mid),
  KEY abnew (abnew),
  KEY caid (caid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}archives_1;
CREATE TABLE {$tblprefix}archives_1 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  subtitle varchar(255) NOT NULL DEFAULT '',
  content varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}archives_2;
CREATE TABLE {$tblprefix}archives_2 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  subtitle varchar(255) NOT NULL DEFAULT '',
  content text NOT NULL,
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}archives_3;
CREATE TABLE {$tblprefix}archives_3 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  subtitle varchar(255) NOT NULL DEFAULT '',
  content varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}archives_4;
CREATE TABLE {$tblprefix}archives_4 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  subtitle varchar(255) NOT NULL DEFAULT '',
  content text NOT NULL,
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}archives_5;
CREATE TABLE {$tblprefix}archives_5 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  subtitle varchar(255) NOT NULL DEFAULT '',
  content text NOT NULL,
  tipimg varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}archives_rec;
CREATE TABLE {$tblprefix}archives_rec (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mclicks int(10) unsigned NOT NULL DEFAULT '0',
  wclicks int(10) unsigned NOT NULL DEFAULT '0',
  mcomments int(10) unsigned NOT NULL DEFAULT '0',
  wcomments int(10) unsigned NOT NULL DEFAULT '0',
  morders int(10) unsigned NOT NULL DEFAULT '0',
  worders int(10) unsigned NOT NULL DEFAULT '0',
  mordersum int(10) unsigned NOT NULL DEFAULT '0',
  wordersum int(10) unsigned NOT NULL DEFAULT '0',
  mfavorites int(10) unsigned NOT NULL DEFAULT '0',
  wfavorites int(10) unsigned NOT NULL DEFAULT '0',
  mpraises int(10) unsigned NOT NULL DEFAULT '0',
  wpraises int(10) unsigned NOT NULL DEFAULT '0',
  mdebases int(10) unsigned NOT NULL DEFAULT '0',
  wdebases int(10) unsigned NOT NULL DEFAULT '0',
  mdowns int(10) unsigned NOT NULL DEFAULT '0',
  wdowns int(10) unsigned NOT NULL DEFAULT '0',
  mplays int(10) unsigned NOT NULL DEFAULT '0',
  wplays int(10) unsigned NOT NULL DEFAULT '0',
  mreplys int(10) unsigned NOT NULL DEFAULT '0',
  wreplys int(10) unsigned NOT NULL DEFAULT '0',
  moffers int(10) unsigned NOT NULL DEFAULT '0',
  woffers int(10) unsigned NOT NULL DEFAULT '0',
  aclicks int(10) unsigned NOT NULL DEFAULT '0',
  acomments int(10) unsigned NOT NULL DEFAULT '0',
  afavorites int(10) unsigned NOT NULL DEFAULT '0',
  aorders int(10) unsigned NOT NULL DEFAULT '0',
  aanswers int(10) unsigned NOT NULL DEFAULT '0',
  aadopts int(10) unsigned NOT NULL DEFAULT '0',
  aordersum int(10) unsigned NOT NULL DEFAULT '0',
  apraises int(10) unsigned NOT NULL DEFAULT '0',
  adebases int(10) unsigned NOT NULL DEFAULT '0',
  adowns int(10) unsigned NOT NULL DEFAULT '0',
  aplays int(10) unsigned NOT NULL DEFAULT '0',
  areplys int(10) unsigned NOT NULL DEFAULT '0',
  aoffers int(10) unsigned NOT NULL DEFAULT '0',
  abytenum int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}archives_sub;
CREATE TABLE {$tblprefix}archives_sub (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  editorid mediumint(8) unsigned NOT NULL DEFAULT '0',
  editor char(30) NOT NULL,
  needupdate int(10) unsigned NOT NULL DEFAULT '0',
  overupdate int(10) unsigned NOT NULL DEFAULT '0',
  weight float unsigned NOT NULL DEFAULT '0',
  `storage` int(10) unsigned NOT NULL DEFAULT '0',
  spare int(10) unsigned NOT NULL DEFAULT '0',
  reports int(10) unsigned NOT NULL DEFAULT '0',
  needstatic int(10) unsigned NOT NULL DEFAULT '0',
  needstatic1 int(10) unsigned NOT NULL DEFAULT '0',
  needstatic2 int(10) unsigned NOT NULL DEFAULT '0',
  arctpl varchar(50) NOT NULL DEFAULT '',
  arctpl1 varchar(50) NOT NULL DEFAULT '',
  arctpl2 varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}arecents;
CREATE TABLE {$tblprefix}arecents (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  vardate int(10) unsigned NOT NULL DEFAULT '0',
  clicks int(10) unsigned NOT NULL DEFAULT '0',
  comments int(10) unsigned NOT NULL DEFAULT '0',
  orders int(10) unsigned NOT NULL DEFAULT '0',
  ordersum int(10) unsigned NOT NULL DEFAULT '0',
  favorites int(10) unsigned NOT NULL DEFAULT '0',
  praises int(10) unsigned NOT NULL DEFAULT '0',
  debases int(10) unsigned NOT NULL DEFAULT '0',
  downs int(10) unsigned NOT NULL DEFAULT '0',
  plays int(10) unsigned NOT NULL DEFAULT '0',
  replys int(10) unsigned NOT NULL DEFAULT '0',
  offers int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (aid,vardate),
  KEY vardate (vardate)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}asession;
CREATE TABLE {$tblprefix}asession (
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  ip char(15) NOT NULL DEFAULT '',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  errorcount tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (mid)
) TYPE=MyISAM;

INSERT INTO {$tblprefix}asession VALUES ('1','192.168.1.60','1267664376','-1');

DROP TABLE IF EXISTS {$tblprefix}aurls;
CREATE TABLE {$tblprefix}aurls (
  auid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  remark varchar(80) NOT NULL,
  uclass varchar(15) NOT NULL,
  issys tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  url varchar(255) NOT NULL,
  setting text NOT NULL,
  tplname varchar(50) NOT NULL,
  onlyview tinyint(1) unsigned NOT NULL DEFAULT '0',
  mtitle varchar(80) NOT NULL DEFAULT '',
  guide text NOT NULL,
  isbk tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (auid)
) TYPE=MyISAM AUTO_INCREMENT=125;

INSERT INTO {$tblprefix}aurls VALUES ('1','���ݷ���','�ĵ���ϼ��ķ���(ϵͳ����)','arcadd','1','1','7','?entry=addpre&nauid=1','a:3:{s:5:\"coids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"nochids\";s:1:\"1\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('2','','','','1','1','1','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('115','���ֳ��','���ֳ�/��ֵ','custom','0','1','0','?entry=currencys&action=currencysaving&nauid=115','a:1:{s:9:\"customurl\";s:38:\"?entry=currencys&action=currencysaving\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('3','�ĵ�����','�ĵ�����(ϵͳ����)','archives','1','1','6','?entry=archives&action=archivesedit&nauid=3','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:43:\"channel,check,ccid1,ccid2,ccid3,ccid4,ccid5\";s:5:\"lists\";s:40:\"catalog,channel,check,adddate,view,admin\";s:8:\"operates\";s:58:\"delete,check,uncheck,catalog,ccid1,ccid2,ccid3,ccid4,ccid5\";s:5:\"iuids\";s:12:\"13,101,8,9,3\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('4','���۹���','���۹���(ϵͳ����)','comments','1','1','8','?entry=comments&action=commentsedit&nauid=4','a:6:{s:7:\"checked\";s:2:\"-1\";s:5:\"cuids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:10:\"check,date\";s:5:\"lists\";s:43:\"mname,catalog,check,adddate,updatedate,edit\";s:8:\"operates\";s:20:\"delete,check,uncheck\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('5','���۹���','���۹���(ϵͳ����)','offers','1','0','1000','?entry=offers&action=offersedit&nauid=5','a:7:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:5:\"cuids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:24:\"channel,check,valid,date\";s:5:\"lists\";s:53:\"mname,oprice,catalog,channel,check,valid,enddate,edit\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('6','�ظ�����','�ظ�����(ϵͳ����)','replys','1','0','1000','?entry=replys&action=replysedit&nauid=6','a:6:{s:7:\"checked\";s:2:\"-1\";s:5:\"cuids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:24:\"commu,channel,check,date\";s:5:\"lists\";s:41:\"mname,catalog,commu,check,updatedate,edit\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('7','�𰸹���','�𰸹���(ϵͳ����)','answers','1','0','1000','?entry=answers&action=answersedit&nauid=7','a:5:{s:7:\"checked\";s:2:\"-1\";s:5:\"cuids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:18:\"channel,check,date\";s:5:\"lists\";s:30:\"mname,check,award,catalog,edit\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('9','�ٱ�����','�ٱ�����(ϵͳ����)','reports','1','1','10','?entry=reports&action=reportsedit&nauid=9','a:4:{s:5:\"cuids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:7:\"channel\";s:5:\"lists\";s:26:\"mname,catalog,adddate,edit\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('10','���¹���','���¹���( ϵͳ����)','arcupdate','1','0','1000','?entry=archives&action=archivesupdate&nauid=10','a:1:{s:5:\"coids\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('11','��Ϣ�б�','��Ϣ�б�','farchives','1','1','11','?entry=farchives&action=farchivesedit&nauid=11','a:6:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:7:\"consult\";s:1:\"0\";s:7:\"filters\";s:11:\"check,valid\";s:5:\"lists\";s:63:\"mname,check,adddate,updatedate,startdate,enddate,vieworder,edit\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('12','������Ϣ','������Ϣ','farcadd','1','1','12','?entry=farchive&action=farchiveadd&nauid=12','','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('13','ȫ����Ա','��Ա����','members','1','1','13','?entry=members&action=membersedit&nauid=13','a:8:{s:7:\"checked\";s:2:\"-1\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:0:\"\";s:8:\"operates\";s:38:\"delete,check,uncheck,ugid1,ugid2,ugid5\";s:6:\"ugids1\";s:0:\"\";s:6:\"ugids2\";s:0:\"\";s:6:\"ugids3\";s:0:\"\";s:6:\"ugids5\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('14','��ӻ�Ա','��ӻ�Ա','memadd','1','1','14','?entry=memberadd&nauid=14','','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('15','��Ա����','��Ա����','mcomments','1','1','18','?entry=mcomments&action=mcommentsedit&nauid=15','a:6:{s:7:\"checked\";s:2:\"-1\";s:5:\"cuids\";s:0:\"\";s:6:\"mchids\";s:0:\"\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:0:\"\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('16','��Ա�ظ�','��Ա�ظ�','mreplys','1','0','1000','?entry=mreplys&action=mreplysedit&nauid=16','a:6:{s:7:\"checked\";s:2:\"-1\";s:5:\"cuids\";s:0:\"\";s:6:\"mchids\";s:0:\"\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:0:\"\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('17','��Ա�ٱ�','��Ա�ٱ�','mreports','1','1','20','?entry=mreports&action=mreportsedit&nauid=17','','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('18','���ͱ��','��Ա���ͱ��','mtrans','1','1','16','?entry=mtrans&action=mtransedit&nauid=18','','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('19','��������','��Ա����','utrans','1','1','17','?entry=utrans&action=utransedit&nauid=19','','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('20','��Ա����','��Ա����','marchives','1','0','1000','?entry=marchives&action=marchivesedit&nauid=20','','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('21','','','','1','1','11','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('22','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('23','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('24','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('25','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('26','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('27','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('28','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('29','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('30','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('31','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('32','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('33','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('34','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('35','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('36','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('37','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('38','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('39','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('40','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('41','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('42','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('43','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('44','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('45','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('46','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('47','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('48','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('49','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('50','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('51','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('52','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('53','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('54','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('55','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('56','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('57','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('58','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('59','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('60','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('61','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('62','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('63','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('64','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('65','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('66','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('67','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('68','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('69','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('70','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('71','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('72','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('73','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('74','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('75','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('76','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('77','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('78','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('79','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('80','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('81','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('82','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('83','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('84','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('85','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('86','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('87','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('88','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('89','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('90','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('91','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('92','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('93','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('94','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('95','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('96','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('97','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('98','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('99','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('100','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}aurls VALUES ('116','�ֽ����','�ֽ��ֵ����','custom','0','1','0','?entry=pays&action=paysedit&nauid=116','a:1:{s:9:\"customurl\";s:27:\"?entry=pays&action=paysedit\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('117','����С˵','����С˵�������','archives','0','1','1','?entry=archives&action=archivesedit&nauid=117','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:5:\"chids\";s:1:\"4\";s:7:\"filters\";s:29:\"check,ccid1,ccid2,ccid4,ccid5\";s:5:\"lists\";s:41:\"catalog,check,updatedate,view,admin,ccid3\";s:8:\"operates\";s:74:\"delete,check,uncheck,abover,unabover,catalog,ccid1,ccid2,ccid3,ccid4,ccid5\";s:5:\"iuids\";s:14:\"13,101,102,8,3\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('118','����ר��','����ר�����','archives','0','1','4','?entry=archives&action=archivesedit&nauid=118','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:5:\"chids\";s:1:\"2\";s:7:\"filters\";s:17:\"check,ccid1,ccid2\";s:5:\"lists\";s:27:\"check,updatedate,view,admin\";s:8:\"operates\";s:40:\"delete,check,uncheck,catalog,ccid1,ccid2\";s:5:\"iuids\";s:6:\"13,9,3\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('119','VIPС˵','VIPС˵�������','archives','0','1','3','?entry=archives&action=archivesedit&nauid=119','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:5:\"chids\";s:1:\"4\";s:7:\"filters\";s:29:\"check,ccid1,ccid2,ccid4,ccid5\";s:5:\"lists\";s:35:\"catalog,check,updatedate,view,admin\";s:8:\"operates\";s:74:\"delete,check,uncheck,abover,unabover,catalog,ccid1,ccid2,ccid3,ccid4,ccid5\";s:5:\"iuids\";s:16:\"13,101,102,8,9,3\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:1:\"6\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('120','С˵�½�','С˵�½ڹ���','archives','0','0','2','?entry=archives&action=archivesedit&nauid=120','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:5:\"chids\";s:1:\"1\";s:7:\"filters\";s:17:\"check,ccid1,ccid2\";s:5:\"lists\";s:49:\"catalog,check,adddate,updatedate,view,admin,ccid3\";s:8:\"operates\";s:38:\"delete,check,uncheck,ccid1,ccid2,ccid3\";s:5:\"iuids\";s:2:\"13\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('121','��ƪ����','��ƪ���ݹ���','archives','0','1','5','?entry=archives&action=archivesedit&nauid=121','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:5:\"chids\";s:1:\"3\";s:7:\"filters\";s:5:\"check\";s:5:\"lists\";s:35:\"check,adddate,updatedate,view,admin\";s:8:\"operates\";s:20:\"delete,check,uncheck\";s:5:\"iuids\";s:2:\"13\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('122','��ͨ��Ա','��ͨ��Ա����','members','0','1','0','?entry=members&action=membersedit&nauid=122','a:8:{s:7:\"checked\";s:2:\"-1\";s:7:\"filters\";s:10:\"date,ugid3\";s:5:\"lists\";s:34:\"regip,regdate,lastvisit,edit,ugid3\";s:8:\"operates\";s:38:\"delete,check,uncheck,ugid1,ugid2,ugid5\";s:6:\"ugids1\";s:0:\"\";s:6:\"ugids2\";s:0:\"\";s:6:\"ugids3\";s:0:\"\";s:6:\"ugids5\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('123','���һ�Ա','���һ�Ա����','members','0','1','0','?entry=members&action=membersedit&nauid=123','a:8:{s:7:\"checked\";s:2:\"-1\";s:7:\"filters\";s:5:\"check\";s:5:\"lists\";s:35:\"regip,regdate,lastvisit,ugid3,ugid5\";s:8:\"operates\";s:32:\"delete,check,uncheck,ugid1,ugid5\";s:6:\"ugids1\";s:0:\"\";s:6:\"ugids2\";s:0:\"\";s:6:\"ugids3\";s:0:\"\";s:6:\"ugids5\";s:5:\"12,13\";}','','0','','','0');
INSERT INTO {$tblprefix}aurls VALUES ('124','�ƹ�ר��','�ƹ�ר�����','archives','0','1','4','?entry=archives&action=archivesedit&nauid=124','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:5:\"chids\";s:1:\"5\";s:7:\"filters\";s:17:\"check,ccid1,ccid2\";s:5:\"lists\";s:27:\"check,updatedate,view,admin\";s:8:\"operates\";s:40:\"delete,check,uncheck,catalog,ccid1,ccid2\";s:5:\"iuids\";s:6:\"13,9,3\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','','','0');

DROP TABLE IF EXISTS {$tblprefix}badwords;
CREATE TABLE {$tblprefix}badwords (
  bwid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  wsearch varchar(255) NOT NULL,
  wreplace varchar(255) NOT NULL,
  PRIMARY KEY (bwid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}btagnames;
CREATE TABLE {$tblprefix}btagnames (
  bnid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(50) NOT NULL,
  cname varchar(50) NOT NULL,
  bclass varchar(10) NOT NULL,
  sclass varchar(15) NOT NULL,
  vieworder smallint(3) NOT NULL DEFAULT '0',
  datatype varchar(30) NOT NULL,
  PRIMARY KEY (bnid)
) TYPE=MyISAM AUTO_INCREMENT=302;

INSERT INTO {$tblprefix}btagnames VALUES ('1','hostname','��վ����','common','','1','text');
INSERT INTO {$tblprefix}btagnames VALUES ('2','hosturl','��վ����','common','','2','text');
INSERT INTO {$tblprefix}btagnames VALUES ('3','cmsname','վ������','common','','3','text');
INSERT INTO {$tblprefix}btagnames VALUES ('4','cmsurl','վ�����URL','common','','7','text');
INSERT INTO {$tblprefix}btagnames VALUES ('7','cmsindex','վ����ҳ','common','','8','text');
INSERT INTO {$tblprefix}btagnames VALUES ('8','cmstitle','վ�����','common','','9','text');
INSERT INTO {$tblprefix}btagnames VALUES ('9','cmskeyword','վ��ؼ���','common','','10','text');
INSERT INTO {$tblprefix}btagnames VALUES ('10','cmsdescription','վ������','common','','11','text');
INSERT INTO {$tblprefix}btagnames VALUES ('11','tplurl','ģ��λ��URL','common','','12','text');
INSERT INTO {$tblprefix}btagnames VALUES ('13','title','��Ŀ����','cnode','','1','text');
INSERT INTO {$tblprefix}btagnames VALUES ('18','indexurl','��Ŀ��ҳURL','cnode','','2','text');
INSERT INTO {$tblprefix}btagnames VALUES ('47','clicks','�����','archive','','12','int');
INSERT INTO {$tblprefix}btagnames VALUES ('19','listurl','��Ŀ�б�ҳURL','cnode','','3','text');
INSERT INTO {$tblprefix}btagnames VALUES ('20','arcurl','�ĵ�URL','archive','','6','text');
INSERT INTO {$tblprefix}btagnames VALUES ('31','archives','�ĵ�����','member','','12','int');
INSERT INTO {$tblprefix}btagnames VALUES ('26','aid','�ĵ�ID','archive','','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('27','catalog','��Ŀ����','archive','','3','text');
INSERT INTO {$tblprefix}btagnames VALUES ('46','createdate','�ĵ����ʱ��','archive','','11','date');
INSERT INTO {$tblprefix}btagnames VALUES ('28','score','����','commu','comment','5','int');
INSERT INTO {$tblprefix}btagnames VALUES ('29','content','��������','commu','comment','6','multitext');
INSERT INTO {$tblprefix}btagnames VALUES ('118','url','����URL','other','attachment','1','text');
INSERT INTO {$tblprefix}btagnames VALUES ('30','mid','��ԱID','member','','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('32','cmslogo','վ��LOGO','common','','15','text');
INSERT INTO {$tblprefix}btagnames VALUES ('33','copyright','վ���Ȩ��Ϣ','common','','16','text');
INSERT INTO {$tblprefix}btagnames VALUES ('34','cms_icpno','վ�㱸����Ϣ','common','','17','text');
INSERT INTO {$tblprefix}btagnames VALUES ('35','bazscert','����֤��','common','','18','text');
INSERT INTO {$tblprefix}btagnames VALUES ('36','mcharset','վ��ҳ�����','common','','13','text');
INSERT INTO {$tblprefix}btagnames VALUES ('37','cms_version','cms�汾���','common','','14','text');
INSERT INTO {$tblprefix}btagnames VALUES ('38','cms_counter','ҳ��ͳ����','common','','19','text');
INSERT INTO {$tblprefix}btagnames VALUES ('39','caid','��ĿID','archive','','2','int');
INSERT INTO {$tblprefix}btagnames VALUES ('40','chid','ģ��ID','archive','','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('41','mid','��ԱID','archive','','7','int');
INSERT INTO {$tblprefix}btagnames VALUES ('42','mname','��Ա����','archive','','8','text');
INSERT INTO {$tblprefix}btagnames VALUES ('43','ucid','���˷���ID','archive','','9','int');
INSERT INTO {$tblprefix}btagnames VALUES ('44','atid','�ϼ���ϵID','archive','','10','int');
INSERT INTO {$tblprefix}btagnames VALUES ('48','rclicks','���ڵ����','archive','','13','int');
INSERT INTO {$tblprefix}btagnames VALUES ('49','comments','������','archive','','14','int');
INSERT INTO {$tblprefix}btagnames VALUES ('50','scores','ƽ������','archive','','15','float');
INSERT INTO {$tblprefix}btagnames VALUES ('51','orders','��Ʒ������','archive','','16','int');
INSERT INTO {$tblprefix}btagnames VALUES ('52','ordersum','��Ʒ���۽��ϼ�','archive','','17','int');
INSERT INTO {$tblprefix}btagnames VALUES ('53','favorites','�ղش���','archive','','18','int');
INSERT INTO {$tblprefix}btagnames VALUES ('54','praises','���޴���','archive','','19','int');
INSERT INTO {$tblprefix}btagnames VALUES ('55','debases','�������','archive','','20','int');
INSERT INTO {$tblprefix}btagnames VALUES ('56','answers','������','archive','','21','int');
INSERT INTO {$tblprefix}btagnames VALUES ('57','price','��Ʒ�۸�','archive','','22','int');
INSERT INTO {$tblprefix}btagnames VALUES ('58','currency','�������ͻ���','archive','','24','int');
INSERT INTO {$tblprefix}btagnames VALUES ('59','crid','�������ͻ���ID','archive','','23','int');
INSERT INTO {$tblprefix}btagnames VALUES ('60','adopts','���ô�����','archive','','25','int');
INSERT INTO {$tblprefix}btagnames VALUES ('61','closed','�����Ƿ�ر�','archive','','26','int');
INSERT INTO {$tblprefix}btagnames VALUES ('62','finishdate','�������ʱ��','archive','','27','date');
INSERT INTO {$tblprefix}btagnames VALUES ('63','channel','ģ������','archive','','5','text');
INSERT INTO {$tblprefix}btagnames VALUES ('65','createdate','���ʱ��','freeinfo','','5','date');
INSERT INTO {$tblprefix}btagnames VALUES ('64','alias','��Ŀ����','cnode','','4','text');
INSERT INTO {$tblprefix}btagnames VALUES ('66','editor','���α༭','freeinfo','','6','text');
INSERT INTO {$tblprefix}btagnames VALUES ('67','mid','��ԱID','freeinfo','','2','int');
INSERT INTO {$tblprefix}btagnames VALUES ('68','mname','��Ա����','freeinfo','','3','text');
INSERT INTO {$tblprefix}btagnames VALUES ('69','arcurl','��Ϣ����ҳURL','freeinfo','','4','text');
INSERT INTO {$tblprefix}btagnames VALUES ('70','aid','������ϢID','freeinfo','','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('71','regip','ע��IP','member','','2','text');
INSERT INTO {$tblprefix}btagnames VALUES ('72','lastip','�ϴε�¼IP','member','','6','text');
INSERT INTO {$tblprefix}btagnames VALUES ('73','onlinetime','����ʱ��','member','','10','int');
INSERT INTO {$tblprefix}btagnames VALUES ('74','clicks','�����','member','','11','int');
INSERT INTO {$tblprefix}btagnames VALUES ('75','regdate','ע��ʱ��','member','','4','date');
INSERT INTO {$tblprefix}btagnames VALUES ('76','lastvisit','�ϴε�¼ʱ��','member','','5','date');
INSERT INTO {$tblprefix}btagnames VALUES ('77','lastactive','�ϴμ���ʱ��','member','','7','date');
INSERT INTO {$tblprefix}btagnames VALUES ('78','uptotal','���ϴ���','member','','8','int');
INSERT INTO {$tblprefix}btagnames VALUES ('79','downtotal','��������','member','','9','int');
INSERT INTO {$tblprefix}btagnames VALUES ('80','checks','�����ĵ�����','member','','13','int');
INSERT INTO {$tblprefix}btagnames VALUES ('81','comments','������','member','','14','int');
INSERT INTO {$tblprefix}btagnames VALUES ('82','favorites','�ղ���','member','','15','int');
INSERT INTO {$tblprefix}btagnames VALUES ('83','purchases','�ɹ���Ʒ��','member','','16','int');
INSERT INTO {$tblprefix}btagnames VALUES ('84','answers','����','member','','17','int');
INSERT INTO {$tblprefix}btagnames VALUES ('85','freeinfos','������Ϣ��','member','','18','int');
INSERT INTO {$tblprefix}btagnames VALUES ('86','credits','���ö�','member','','19','int');
INSERT INTO {$tblprefix}btagnames VALUES ('87','taxs','�����ĵ���','member','','20','int');
INSERT INTO {$tblprefix}btagnames VALUES ('88','sales','�����ĵ���','member','','21','int');
INSERT INTO {$tblprefix}btagnames VALUES ('89','ftaxs','���Ѹ�����','member','','22','int');
INSERT INTO {$tblprefix}btagnames VALUES ('90','fsales','���򸽼���','member','','23','int');
INSERT INTO {$tblprefix}btagnames VALUES ('91','cid','����ID','commu','comment','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('92','aid','�ĵ�ID','commu','comment','2','int');
INSERT INTO {$tblprefix}btagnames VALUES ('93','mid','��ԱID','commu','comment','3','int');
INSERT INTO {$tblprefix}btagnames VALUES ('94','mname','��Ա����','commu','comment','4','text');
INSERT INTO {$tblprefix}btagnames VALUES ('95','createdate','���ʱ��','commu','comment','7','date');
INSERT INTO {$tblprefix}btagnames VALUES ('96','ip','����IP','commu','comment','8','text');
INSERT INTO {$tblprefix}btagnames VALUES ('97','cid','����ID','commu','purchase','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('98','aid','�ĵ�ID','commu','purchase','2','int');
INSERT INTO {$tblprefix}btagnames VALUES ('99','mid','��ԱID','commu','purchase','3','int');
INSERT INTO {$tblprefix}btagnames VALUES ('100','mname','��Ա����','commu','purchase','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('101','subject','�ĵ�����','commu','purchase','5','text');
INSERT INTO {$tblprefix}btagnames VALUES ('102','price','��Ʒ�۸�','commu','purchase','6','int');
INSERT INTO {$tblprefix}btagnames VALUES ('103','weight','��Ʒ����','commu','purchase','7','float');
INSERT INTO {$tblprefix}btagnames VALUES ('104','nums','��������','commu','purchase','8','int');
INSERT INTO {$tblprefix}btagnames VALUES ('105','oid','����ID','commu','purchase','9','int');
INSERT INTO {$tblprefix}btagnames VALUES ('106','createdate','����ʱ��','commu','purchase','10','date');
INSERT INTO {$tblprefix}btagnames VALUES ('107','cid','��ID','commu','answer','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('108','aid','�ĵ�ID','commu','answer','2','int');
INSERT INTO {$tblprefix}btagnames VALUES ('109','mid','��ԱID','commu','answer','3','int');
INSERT INTO {$tblprefix}btagnames VALUES ('110','mname','��Ա����','commu','answer','4','text');
INSERT INTO {$tblprefix}btagnames VALUES ('111','subject','�ĵ�����','commu','answer','5','text');
INSERT INTO {$tblprefix}btagnames VALUES ('112','answer','������','commu','answer','6','text');
INSERT INTO {$tblprefix}btagnames VALUES ('113','createdate','����ʱ��','commu','answer','7','date');
INSERT INTO {$tblprefix}btagnames VALUES ('114','currency','��������','commu','answer','8','int');
INSERT INTO {$tblprefix}btagnames VALUES ('116','votes','֧��Ʊ��','commu','answer','10','int');
INSERT INTO {$tblprefix}btagnames VALUES ('119','title','����˵��','other','attachment','2','text');
INSERT INTO {$tblprefix}btagnames VALUES ('120','url_s','ͼƬ����ͼURL','other','attachment','3','text');
INSERT INTO {$tblprefix}btagnames VALUES ('121','width','ͼƬ���','other','attachment','4','text');
INSERT INTO {$tblprefix}btagnames VALUES ('122','height','ͼƬ�߶�','other','attachment','5','text');
INSERT INTO {$tblprefix}btagnames VALUES ('123','vid','ͶƱ��Ŀid','other','vote','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('124','caid','ͶƱ����id','other','vote','2','int');
INSERT INTO {$tblprefix}btagnames VALUES ('125','subject','ͶƱ����','other','vote','3','text');
INSERT INTO {$tblprefix}btagnames VALUES ('126','content','ͶƱ˵��','other','vote','4','multitext');
INSERT INTO {$tblprefix}btagnames VALUES ('127','totalnum','��Ʊ��','other','vote','5','int');
INSERT INTO {$tblprefix}btagnames VALUES ('128','mid','�����˻�ԱID','other','vote','6','int');
INSERT INTO {$tblprefix}btagnames VALUES ('129','mname','�����˻�Ա����','other','vote','7','text');
INSERT INTO {$tblprefix}btagnames VALUES ('130','createdate','ͶƱ���ʱ��','other','vote','8','date');
INSERT INTO {$tblprefix}btagnames VALUES ('131','vopid','ͶƱѡ��ID','other','vote','9','int');
INSERT INTO {$tblprefix}btagnames VALUES ('132','votenum','ͶƱѡ��Ʊ��','other','vote','11','int');
INSERT INTO {$tblprefix}btagnames VALUES ('133','title','ͶƱѡ�����','other','vote','10','text');
INSERT INTO {$tblprefix}btagnames VALUES ('134','input','ͶƱѡ��ؼ�','other','vote','12','text');
INSERT INTO {$tblprefix}btagnames VALUES ('135','percent','ͶƱѡ��ٷֱ�','other','vote','13','text');
INSERT INTO {$tblprefix}btagnames VALUES ('136','mpnav','��ҳ����','other','mp','1','text');
INSERT INTO {$tblprefix}btagnames VALUES ('137','mptitle','(�ı�)��ҳ����','other','mp','2','text');
INSERT INTO {$tblprefix}btagnames VALUES ('138','rss','��Ŀrss����','cnode','','5','text');
INSERT INTO {$tblprefix}btagnames VALUES ('140','mppage','��ҳ��ǰҳ','other','mp','3','int');
INSERT INTO {$tblprefix}btagnames VALUES ('146','mpacount','��ҳ�ܼ�¼��','other','mp','9','int');
INSERT INTO {$tblprefix}btagnames VALUES ('141','mpcount','��ҳ��ҳ��','other','mp','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('142','mpstart','��ҳ��ҳURL','other','mp','5','text');
INSERT INTO {$tblprefix}btagnames VALUES ('143','mpend','��ҳβҳURL','other','mp','6','text');
INSERT INTO {$tblprefix}btagnames VALUES ('144','mppre','��ҳ��ҳURL','other','mp','7','text');
INSERT INTO {$tblprefix}btagnames VALUES ('145','mpnext','��ҳ��ҳURL','other','mp','8','text');
INSERT INTO {$tblprefix}btagnames VALUES ('147','siteurl','��ǰ��վURL','common','','4','text');
INSERT INTO {$tblprefix}btagnames VALUES ('148','cms_abs','��վ����URL','common','','6','text');
INSERT INTO {$tblprefix}btagnames VALUES ('149','timestamp','��ǰϵͳʱ���','common','','20','text');
INSERT INTO {$tblprefix}btagnames VALUES ('150','atmsize','������С(K)','archive','','21','text');
INSERT INTO {$tblprefix}btagnames VALUES ('151','downs','���ش���','archive','','21','int');
INSERT INTO {$tblprefix}btagnames VALUES ('152','plays','���Ŵ���','archive','','21','int');
INSERT INTO {$tblprefix}btagnames VALUES ('153','sid','�ĵ�������վid','archive','','8','int');
INSERT INTO {$tblprefix}btagnames VALUES ('154','sitename','�ĵ�������վ����','archive','','8','text');
INSERT INTO {$tblprefix}btagnames VALUES ('155','siteurl','�ĵ�������վURL','archive','','8','text');
INSERT INTO {$tblprefix}btagnames VALUES ('156','bkurl','��Ŀ����ҳURL','cnode','','3','text');
INSERT INTO {$tblprefix}btagnames VALUES ('157','sid','��Ŀ������վid','cnode','','6','int');
INSERT INTO {$tblprefix}btagnames VALUES ('158','sitename','��Ŀ������վ����','cnode','','7','text');
INSERT INTO {$tblprefix}btagnames VALUES ('159','siteurl','��Ŀ������վURL','cnode','','8','text');
INSERT INTO {$tblprefix}btagnames VALUES ('197','mid','��ԱID','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('161','cuid','��ĿID','commu','reply','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('163','votes1','ͶƱ1','commu','reply','5','int');
INSERT INTO {$tblprefix}btagnames VALUES ('164','votes2','ͶƱ2','commu','reply','6','int');
INSERT INTO {$tblprefix}btagnames VALUES ('165','votes3','ͶƱ3','commu','reply','7','int');
INSERT INTO {$tblprefix}btagnames VALUES ('166','votes4','ͶƱ4','commu','reply','8','int');
INSERT INTO {$tblprefix}btagnames VALUES ('167','votes5','ͶƱ5','commu','reply','9','int');
INSERT INTO {$tblprefix}btagnames VALUES ('168','updatedate','����ʱ��','commu','reply','10','date');
INSERT INTO {$tblprefix}btagnames VALUES ('169','cid','�ظ�ID','commu','reply','3','int');
INSERT INTO {$tblprefix}btagnames VALUES ('170','aid','�ĵ�ID','commu','reply','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('172','mid','��ԱID','commu','reply','2','int');
INSERT INTO {$tblprefix}btagnames VALUES ('173','mname','��Ա����','commu','reply','11','text');
INSERT INTO {$tblprefix}btagnames VALUES ('174','createdate','����ʱ��','commu','reply','12','date');
INSERT INTO {$tblprefix}btagnames VALUES ('175','arcaid','�Ķ��ĵ�ID','commu','reply','13','int');
INSERT INTO {$tblprefix}btagnames VALUES ('176','urcaid','�Ķ��ظ�ID','commu','reply','14','int');
INSERT INTO {$tblprefix}btagnames VALUES ('177','areply','�Ƿ�ظ�','commu','reply','15','int');
INSERT INTO {$tblprefix}btagnames VALUES ('178','aread','�Ƿ��Ķ�','commu','reply','16','int');
INSERT INTO {$tblprefix}btagnames VALUES ('179','uread','�Ƿ��Ķ�','commu','reply','17','int');
INSERT INTO {$tblprefix}btagnames VALUES ('180','cid','����ID','commu','offer','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('181','aid','�ĵ�ID','commu','offer','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('182','cuid','��ĿID','commu','offer','1','int');
INSERT INTO {$tblprefix}btagnames VALUES ('183','oprice','ƽ���۸�','commu','offer','1','float');
INSERT INTO {$tblprefix}btagnames VALUES ('184','mid','��ԱID','commu','offer','2','int');
INSERT INTO {$tblprefix}btagnames VALUES ('185','mname','��Ա����','commu','offer','2','text');
INSERT INTO {$tblprefix}btagnames VALUES ('186','ucid','����ID','commu','offer','3','int');
INSERT INTO {$tblprefix}btagnames VALUES ('187','votes1','ͶƱ1','commu','offer','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('188','votes2','ͶƱ2','commu','offer','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('189','votes3','ͶƱ3','commu','offer','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('190','votes4','ͶƱ4','commu','offer','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('191','votes5','ͶƱ5','commu','offer','4','int');
INSERT INTO {$tblprefix}btagnames VALUES ('192','createdate','����ʱ��','commu','offer','5','date');
INSERT INTO {$tblprefix}btagnames VALUES ('193','updatedate','����ʱ��','commu','offer','5','date');
INSERT INTO {$tblprefix}btagnames VALUES ('194','enddate','����ʱ��','commu','offer','5','date');
INSERT INTO {$tblprefix}btagnames VALUES ('198','cid','����ID','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('199','mname','��Ա����','mcommu','comment','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('200','fromid','��Դ��ԱID','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('201','fromname','��Դ��Ա����','mcommu','comment','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('202','ucid','����ID','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('203','uread','��','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('204','aread','�Ƿ��Ķ�','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('205','areply','�Ƿ�ظ�','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('206','createdate','����ʱ��','mcommu','comment','0','date');
INSERT INTO {$tblprefix}btagnames VALUES ('207','cuid','��ĿID','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('208','maid','��Ա����ID','marchive','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('209','matid','��Ա��������ID','marchive','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('210','cid','�ظ�ID','mcommu','reply','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('211','mid','��ԱID','mcommu','reply','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('212','mname','��Ա����','mcommu','reply','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('213','fromid','��Դ��ԱID','mcommu','reply','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('214','fromname','��Դ��Ա����','mcommu','reply','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('215','areply','�Ƿ�ظ�','mcommu','reply','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('216','aread','�Ƿ��Ķ�','mcommu','reply','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('217','createdate','����ʱ��','mcommu','reply','0','date');
INSERT INTO {$tblprefix}btagnames VALUES ('218','cuid','����ID','mcommu','reply','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('219','cid','��������ID','mcommu','comment','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('220','mid','��ԱID','mcommu','flink','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('221','mname','��Ա����','mcommu','flink','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('225','createdate','����ʱ��','mcommu','flink','0','date');
INSERT INTO {$tblprefix}btagnames VALUES ('227','abover','�ϼ��Ƿ����','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('229','vieworder','���ж���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('230','updatedate','��������','archive','','29','date');
INSERT INTO {$tblprefix}btagnames VALUES ('231','refreshdate','�ط�������','archive','','29','date');
INSERT INTO {$tblprefix}btagnames VALUES ('232','enddate','����ʱ��','archive','','29','date');
INSERT INTO {$tblprefix}btagnames VALUES ('237','replys','�ظ�����','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('238','offers','���۴���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('239','mclicks','�µ����','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('240','wclicks','�ܵ����','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('241','mcomments','��������','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('242','wcomments','��������','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('243','morders','�³�����','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('244','worders','�ܳ�����','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('245','mordersum','�³��۽������','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('246','wordersum','�ܳ��۽������','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('247','mfavorites','���ղش���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('248','wfavorites','���ղش���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('249','mpraises','�±��޴���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('250','wpraises','�ܱ��޴���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('251','mdebases','�±������','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('252','wdebases','�ܱ������','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('253','mdowns','��������','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('254','wdowns','��������','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('255','mplays','�²��Ŵ���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('256','wplays','�ܲ��Ŵ���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('257','mreplys','�»ظ���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('258','wreplys','�ܻظ���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('259','moffers','�±�����','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('260','woffers','�ܱ��۴���','archive','','29','int');
INSERT INTO {$tblprefix}btagnames VALUES ('261','aclicks','�����ĵ��������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('262','acomments','�����ĵ���������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('263','afavorites','�����ĵ��ղش���','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('264','aorders','�����ĵ���������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('265','aanswers','�����ĵ�������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('266','aadopts','�����ĵ����ô�����','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('267','aordersum','�����ĵ����۽������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('268','apraises','�����ĵ���������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('269','adebases','�����ĵ���������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('270','adowns','�����ĵ���������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('271','aplays','�����ĵ���������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('272','areplys','�����ĵ��ظ�����','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('273','aoffers','�����ĵ���������','archive','','28','int');
INSERT INTO {$tblprefix}btagnames VALUES ('275','startdate','��ʼʱ��','freeinfo','','5','int');
INSERT INTO {$tblprefix}btagnames VALUES ('276','enddate','����ʱ��','freeinfo','','5','date');
INSERT INTO {$tblprefix}btagnames VALUES ('277','vieworder','��ʾ����','freeinfo','','7','int');
INSERT INTO {$tblprefix}btagnames VALUES ('279','updatedate','����ʱ��','freeinfo','','5','date');
INSERT INTO {$tblprefix}btagnames VALUES ('280','mchid','��Աģ��ID','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('281','isfounder','��','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('283','arcallowance','�ɷ������ĵ�����','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('284','cuallowance','�ɷ����ƻظ�����','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('285','cuaddmonth','����ʣ��ظ�����','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('287','subscribes','��','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('288','fsubscribes','��','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('289','replys','�ظ���','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('290','offers','���۴���','member','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('291','confirmstr','��','member','','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('294','mid','��ԱID','marchive','','0','int');
INSERT INTO {$tblprefix}btagnames VALUES ('295','mname','��Ա����','marchive','','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('296','arcurl','��������','marchive','','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('297','createdate','����ʱ��','marchive','','0','date');
INSERT INTO {$tblprefix}btagnames VALUES ('298','updatedate','����ʱ��','marchive','','0','date');
INSERT INTO {$tblprefix}btagnames VALUES ('299','refreshdate','��ˢ��ʱ��','marchive','','0','date');
INSERT INTO {$tblprefix}btagnames VALUES ('300','editor','�༭��','marchive','','0','text');
INSERT INTO {$tblprefix}btagnames VALUES ('301','sitename','��ǰ��վ����','common','','5','text');

DROP TABLE IF EXISTS {$tblprefix}catalogs;
CREATE TABLE {$tblprefix}catalogs (
  caid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  sid smallint(5) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  pid smallint(6) unsigned NOT NULL DEFAULT '0',
  title char(50) NOT NULL,
  vieworder tinyint(3) unsigned NOT NULL DEFAULT '0',
  trueorder smallint(6) unsigned NOT NULL DEFAULT '0',
  chids varchar(255) NOT NULL,
  mchids varchar(255) NOT NULL DEFAULT '',
  isframe tinyint(1) unsigned NOT NULL DEFAULT '0',
  dirname varchar(30) NOT NULL,
  smallsite varchar(50) NOT NULL,
  apmid smallint(6) unsigned NOT NULL DEFAULT '0',
  crpmid smallint(6) unsigned NOT NULL DEFAULT '0',
  rpmid smallint(6) unsigned NOT NULL DEFAULT '0',
  dpmid smallint(6) unsigned NOT NULL DEFAULT '0',
  allowsale tinyint(1) unsigned NOT NULL DEFAULT '0',
  allowfsale tinyint(1) unsigned NOT NULL DEFAULT '0',
  taxcp varchar(15) NOT NULL,
  awardcp varchar(15) NOT NULL,
  ftaxcp varchar(15) NOT NULL,
  customurl varchar(50) NOT NULL DEFAULT '',
  clicks int(10) unsigned NOT NULL DEFAULT '0',
  archives int(10) unsigned NOT NULL DEFAULT '0',
  indextpl varchar(80) NOT NULL DEFAULT '',
  listtpl varchar(80) NOT NULL DEFAULT '',
  bktpl varchar(80) NOT NULL DEFAULT '',
  PRIMARY KEY (caid),
  KEY parentid (pid,vieworder)
) TYPE=MyISAM AUTO_INCREMENT=14;

INSERT INTO {$tblprefix}catalogs VALUES ('1','0','0','0','С˵Ƶ��','0','0','4,1','','1','xiaoshuo','','0','0','0','0','1','1','','','','','0','0','column_index.html','column_other_1.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('2','0','1','1','����������','0','1','4,1','','0','wuxia','','0','0','0','0','1','1','','','','','0','0','column_index.html','column_other_1.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('3','0','1','1','���顤����','0','2','4,1','','0','yanqing','','0','0','0','0','1','1','','','','','0','0','column_index.html','column_other_1.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('4','0','1','1','���á����','0','3','4,1','','0','xuanqi','','0','0','0','0','1','1','','','','','0','0','column_index.html','column_other_1.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('5','0','1','1','�ƻá�����','0','4','4,1','','0','kefan','','0','0','0','0','1','1','','','','','0','0','column_index.html','column_other_1.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('6','0','1','1','��ʷ������','0','5','4,1','','0','lishi','','0','0','0','0','1','1','','','','','0','0','column_index.html','column_other_1.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('7','0','1','1','���ɡ����','0','6','4,1','','0','xuanjing','','0','0','0','0','1','1','','','','','0','0','column_index.html','column_other_1.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('8','0','0','0','ɢ����','0','7','3','','0','sanwen','','0','0','0','0','0','0','','','','','0','0','','column_other.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('9','0','0','0','������','0','8','3','','0','zawen','','0','0','0','0','0','0','','','','','0','0','','column_other.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('10','0','0','0','��ƪС˵','0','9','3','','0','duanxiaoshuo','','0','0','0','0','0','0','','','','','0','0','','column_other.html','');
INSERT INTO {$tblprefix}catalogs VALUES ('11','0','0','0','��Ʒר��','0','10','2,5','','1','zuanti','','0','0','0','0','0','0','','','','','0','0','','','');
INSERT INTO {$tblprefix}catalogs VALUES ('12','0','1','11','�ƹ�ר��','0','11','5','','0','tuiguan','','4','0','0','0','0','0','','','','','0','0','','','');
INSERT INTO {$tblprefix}catalogs VALUES ('13','0','1','11','����ר��','0','12','2','','0','zirou','','0','0','0','0','0','0','','','','','0','0','','','');

DROP TABLE IF EXISTS {$tblprefix}channels;
CREATE TABLE {$tblprefix}channels (
  chid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname char(30) NOT NULL,
  available tinyint(1) NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  remark varchar(80) NOT NULL DEFAULT '',
  userforbidadd tinyint(1) unsigned NOT NULL DEFAULT '0',
  autocheck tinyint(1) unsigned NOT NULL DEFAULT '0',
  autostatic tinyint(1) unsigned NOT NULL DEFAULT '0',
  apmid smallint(6) unsigned NOT NULL DEFAULT '0',
  isalbum tinyint(1) unsigned NOT NULL DEFAULT '0',
  inchids varchar(255) NOT NULL DEFAULT '',
  incoids varchar(255) NOT NULL DEFAULT '',
  inautocheck tinyint(1) unsigned NOT NULL DEFAULT '0',
  onlyload tinyint(1) unsigned NOT NULL DEFAULT '0',
  oneuser tinyint(1) unsigned NOT NULL DEFAULT '0',
  onlyone tinyint(1) unsigned NOT NULL DEFAULT '0',
  statsum tinyint(1) unsigned NOT NULL DEFAULT '0',
  maxnums smallint(6) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) unsigned NOT NULL DEFAULT '0',
  `comment` smallint(6) unsigned NOT NULL DEFAULT '0',
  reply smallint(6) unsigned NOT NULL DEFAULT '0',
  offer smallint(6) unsigned NOT NULL DEFAULT '0',
  report smallint(6) unsigned NOT NULL DEFAULT '0',
  arctpl varchar(50) NOT NULL,
  arctpl1 varchar(50) NOT NULL DEFAULT '',
  arctpl2 varchar(50) NOT NULL DEFAULT '',
  pretpl varchar(50) NOT NULL,
  srhtpl varchar(50) NOT NULL,
  addtpl varchar(50) NOT NULL DEFAULT '',
  autoabstract varchar(30) NOT NULL DEFAULT '0',
  autokeyword varchar(30) NOT NULL DEFAULT '0',
  autothumb varchar(30) NOT NULL DEFAULT '0',
  autosize varchar(30) NOT NULL DEFAULT '0',
  autosizemode tinyint(1) unsigned NOT NULL DEFAULT '0',
  autobyte varchar(30) NOT NULL,
  baidu varchar(30) NOT NULL,
  fulltxt varchar(30) NOT NULL,
  allowance tinyint(1) unsigned NOT NULL DEFAULT '0',
  readd tinyint(1) unsigned NOT NULL DEFAULT '0',
  reinterval int(10) NOT NULL DEFAULT '0',
  validperiod tinyint(1) unsigned NOT NULL DEFAULT '0',
  mindays int(10) NOT NULL DEFAULT '0',
  maxdays int(10) NOT NULL DEFAULT '0',
  iuids varchar(255) NOT NULL DEFAULT '',
  imuids varchar(255) NOT NULL DEFAULT '',
  cpkeeps varchar(255) NOT NULL DEFAULT '',
  aitems varchar(255) NOT NULL DEFAULT '',
  citems varchar(255) NOT NULL DEFAULT '',
  additems text NOT NULL,
  useredits text NOT NULL,
  acoids varchar(255) NOT NULL DEFAULT '',
  ccoids varchar(255) NOT NULL DEFAULT '',
  coidscp varchar(255) NOT NULL DEFAULT '',
  ucadd varchar(80) NOT NULL,
  uaadd varchar(80) NOT NULL,
  uadetail varchar(80) NOT NULL,
  umdetail varchar(80) NOT NULL,
  usetting text NOT NULL,
  PRIMARY KEY (chid)
) TYPE=MyISAM AUTO_INCREMENT=6;

INSERT INTO {$tblprefix}channels VALUES ('1','�½�����','1','3','','0','1','0','3','0','','','0','0','0','0','0','0','0','0','0','0','3','article_1.html','','','arcpre_vip.html','','','content','content','content','0','0','content','abstract','0','0','0','0','0','0','0','13','1','','ppids,opids,copy,rpmid,dpmid,fsalecp,arctpl','ucid,ppids,opids,copy,fsalecp','ccid1,ccid2,ccid4,ccid5,ccid7,copy,opids,validperiod,rpmid,dpmid,fsalecp','subject,subtitle,author,source,keywords,abstract,thumb,content,salecp','1,2,4,5,7','1,2,3,4,5,7','','','','','','');
INSERT INTO {$tblprefix}channels VALUES ('2','����ר��','1','2','','0','1','0','0','1','4,3','','1','1','0','0','1','100','0','5','0','0','3','article_zppage.html','','','','','','content','content','content','thumb','0','','abstract','abstract','1','0','0','0','0','0','13,9,3','1,3,4','','ppids,opids,copy,rpmid,dpmid,salecp,fsalecp,arctpl','ppids,opids,copy,salecp,fsalecp','ccid3,ccid4,ccid5,ccid7,copy,ppids,opids,validperiod,rpmid,dpmid,salecp,fsalecp','caid,subject,author,source,keywords,abstract,thumb,subtitle,content','3,7','1,2,3,4,5,7','','','','','','');
INSERT INTO {$tblprefix}channels VALUES ('3','��ƪ����','1','1','','0','1','0','3','0','','','0','0','0','0','0','0','0','0','0','0','3','article.html','','','article_qd.html','','','content','content','content','thumb','0','','abstract','abstract','0','0','0','0','0','0','13','1','','ppids,opids,copy,rpmid,dpmid,salecp,fsalecp,arctpl','ppids,opids,copy,salecp,fsalecp','ccid3,ccid4,ccid5,ccid7,copy,ppids,opids,validperiod,rpmid,dpmid,salecp,fsalecp','subject,subtitle,author,source,keywords,thumb,content,salecp','3,4,5,7','1,2,3,4,5,7','','','','','','');
INSERT INTO {$tblprefix}channels VALUES ('4','����С˵','1','0','','0','1','1','3','1','1','caid','1','0','1','1','0','0','0','5','0','0','3','article_jpage.html','allzanjie.html','','','','','content','content','content','0','0','','0','0','0','0','0','0','0','0','13,101,102,8','1,5,101,103','','ppids,opids,copy,rpmid,dpmid,salecp,fsalecp,arctpl','ppids,opids,copy,salecp,fsalecp','ccid7,copy,ppids,opids,validperiod,rpmid,dpmid,salecp,fsalecp','caid,subject,author,source,keywords,abstract,thumb,subtitle,content','7','1,2,3,7','','','','','','');
INSERT INTO {$tblprefix}channels VALUES ('5','�ƹ�ר��','1','2','','0','1','1','4','1','4,3','','1','1','0','0','0','0','0','5','0','0','3','zrticle_tuiguanzt.html','','','','','','content','content','content','thumb','0','','abstract','abstract','0','0','0','0','0','0','13,9,3','1,3,4','','ppids,opids,copy,rpmid,dpmid,salecp,fsalecp,arctpl','ppids,opids,copy,salecp,fsalecp','ccid3,ccid4,ccid5,ccid7,copy,ppids,opids,validperiod,rpmid,dpmid,salecp,fsalecp','caid,subject,author,source,keywords,abstract,thumb,subtitle,content','3,4,5,7','1,2,3,4,5,7','','','','','','');

DROP TABLE IF EXISTS {$tblprefix}clangs;
CREATE TABLE {$tblprefix}clangs (
  lid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(50) NOT NULL,
  content text NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (lid)
) TYPE=MyISAM AUTO_INCREMENT=162;

INSERT INTO {$tblprefix}clangs VALUES ('1','answer_reward','��������','0');
INSERT INTO {$tblprefix}clangs VALUES ('2','awardcurrency','��������','0');
INSERT INTO {$tblprefix}clangs VALUES ('3','msite','��վ','0');
INSERT INTO {$tblprefix}clangs VALUES ('4','goback','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('5','closewindow','�رմ���','0');
INSERT INTO {$tblprefix}clangs VALUES ('6','rightnowjump','������ת','0');
INSERT INTO {$tblprefix}clangs VALUES ('7','rightnowgoback','��������','0');
INSERT INTO {$tblprefix}clangs VALUES ('8','defaultclosedreason','��վ����ά�������Ժ������ӡ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('9','choose_reward_cutype','��ָ����ȷ�����ͻ�������','0');
INSERT INTO {$tblprefix}clangs VALUES ('10','price','�۸�','0');
INSERT INTO {$tblprefix}clangs VALUES ('11','weight','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('12','rewarcurrenval','���ͻ���ֵ','0');
INSERT INTO {$tblprefix}clangs VALUES ('13','question','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('14','stock','���','0');
INSERT INTO {$tblprefix}clangs VALUES ('15','questcontnotn','�������ݲ���Ϊ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('16','rewcurtychdomoarc','���ͻ������͸ı�,��Ҫ�޸��ĵ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('17','dontredrewcur','��Ҫ�������ͻ���','0');
INSERT INTO {$tblprefix}clangs VALUES ('18','recusmmiva','���ͻ���С����Сֵ','0');
INSERT INTO {$tblprefix}clangs VALUES ('19','issutaxfree','�����շѸ�����Ϣ','0');
INSERT INTO {$tblprefix}clangs VALUES ('20','nolimit','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('21','lengsmalmilim','����С����С����','0');
INSERT INTO {$tblprefix}clangs VALUES ('22','lenglargmaxlimi','���ȴ����������','0');
INSERT INTO {$tblprefix}clangs VALUES ('23','smallminilimi','С����С����','0');
INSERT INTO {$tblprefix}clangs VALUES ('24','largmaxlimi','�����������','0');
INSERT INTO {$tblprefix}clangs VALUES ('25','attatamosmaminili','��������С����С����','0');
INSERT INTO {$tblprefix}clangs VALUES ('26','notnull','����Ϊ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('27','liminpda','����������','0');
INSERT INTO {$tblprefix}clangs VALUES ('28','liminpint','����������','0');
INSERT INTO {$tblprefix}clangs VALUES ('29','liminpnum','����������','0');
INSERT INTO {$tblprefix}clangs VALUES ('30','limiinputlett','��������ĸ','0');
INSERT INTO {$tblprefix}clangs VALUES ('31','limitinputnumberl','��������ĸ������','0');
INSERT INTO {$tblprefix}clangs VALUES ('32','limitinputtagtype','��������ĸ��ͷ��_��ĸ����','0');
INSERT INTO {$tblprefix}clangs VALUES ('33','limitinputemail','������Email','0');
INSERT INTO {$tblprefix}clangs VALUES ('34','clear','���','0');
INSERT INTO {$tblprefix}clangs VALUES ('35','selectall','ȫѡ','0');
INSERT INTO {$tblprefix}clangs VALUES ('36','based_content_page0','��������ҳ','0');
INSERT INTO {$tblprefix}clangs VALUES ('37','content_trace_page0_1','����׷��ҳ1','0');
INSERT INTO {$tblprefix}clangs VALUES ('38','content_trace_page0_2','����׷��ҳ2','0');
INSERT INTO {$tblprefix}clangs VALUES ('39','remote_download','Զ�����ط���','0');
INSERT INTO {$tblprefix}clangs VALUES ('40','notremote','������Զ���ļ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('41','netsilistpage','��ַ�б�ҳ','0');
INSERT INTO {$tblprefix}clangs VALUES ('42','contensourcpage','������Դҳ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('43','resultdealfunc','���������','0');
INSERT INTO {$tblprefix}clangs VALUES ('44','fiecontgathpatt','�ֶ�����\r\n�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}clangs VALUES ('45','replmesssouront','�滻��Ϣ\r\n��Դ����','0');
INSERT INTO {$tblprefix}clangs VALUES ('46','repmessagresulcont','�滻��Ϣ\r\n=>�������','0');
INSERT INTO {$tblprefix}clangs VALUES ('47','lisregigathpatt','�б�����\r\n�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}clangs VALUES ('48','liscellsplitag','�б�Ԫ\r\n�ָ���ʶ','0');
INSERT INTO {$tblprefix}clangs VALUES ('49','cellurlgathpatte','��Ԫ���Ӳɼ�ģӡ','0');
INSERT INTO {$tblprefix}clangs VALUES ('50','celltitlgathepatt','��Ԫ����ɼ�ģӡ','0');
INSERT INTO {$tblprefix}clangs VALUES ('51','downjumfilsty','������ת�ļ���ʽ','0');
INSERT INTO {$tblprefix}clangs VALUES ('52','detail','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('53','based_msg','������Ϣ','0');
INSERT INTO {$tblprefix}clangs VALUES ('54','order','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('55','flash','Flash','0');
INSERT INTO {$tblprefix}clangs VALUES ('56','media','��Ƶ','0');
INSERT INTO {$tblprefix}clangs VALUES ('57','text','�����ı�','0');
INSERT INTO {$tblprefix}clangs VALUES ('58','multitext','�����ı�','0');
INSERT INTO {$tblprefix}clangs VALUES ('59','htmltext','Html�ı�','0');
INSERT INTO {$tblprefix}clangs VALUES ('60','image_f','��ͼ','0');
INSERT INTO {$tblprefix}clangs VALUES ('61','images','ͼ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('62','flashs','Flash��','0');
INSERT INTO {$tblprefix}clangs VALUES ('63','medias','��Ƶ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('64','file_f','��������','0');
INSERT INTO {$tblprefix}clangs VALUES ('65','files_f','�������','0');
INSERT INTO {$tblprefix}clangs VALUES ('66','select','����ѡ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('67','mselect','����ѡ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('68','date_f','����(ʱ���)','0');
INSERT INTO {$tblprefix}clangs VALUES ('69','int','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('70','float','С��','0');
INSERT INTO {$tblprefix}clangs VALUES ('71','email','Email','0');
INSERT INTO {$tblprefix}clangs VALUES ('72','system','ϵͳ','0');
INSERT INTO {$tblprefix}clangs VALUES ('73','tagtype','��ʶ����','0');
INSERT INTO {$tblprefix}clangs VALUES ('74','date','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('75','nolimitformat','���޸�ʽ','0');
INSERT INTO {$tblprefix}clangs VALUES ('76','number','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('77','letter','��ĸ','0');
INSERT INTO {$tblprefix}clangs VALUES ('78','numberletter','��ĸ������','0');
INSERT INTO {$tblprefix}clangs VALUES ('79','advancedmes','������Ϣ','0');
INSERT INTO {$tblprefix}clangs VALUES ('80','attachmentedit','�����༭','0');
INSERT INTO {$tblprefix}clangs VALUES ('81','coclass','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('82','usergroup','��Ա��','0');
INSERT INTO {$tblprefix}clangs VALUES ('83','cocname','��������','0');
INSERT INTO {$tblprefix}clangs VALUES ('84','amount','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('87','plepoimemid','��ָ����ԱID','0');
INSERT INTO {$tblprefix}clangs VALUES ('88','crpolicy','������������','0');
INSERT INTO {$tblprefix}clangs VALUES ('89','cash','�ֽ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('90','currencyinout','���ֳ�/��ֵ','0');
INSERT INTO {$tblprefix}clangs VALUES ('91','otherreason','����ԭ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('92','subscribe','����','0');
INSERT INTO {$tblprefix}clangs VALUES ('93','confchoosarchi','��ָ����ȷ���ĵ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('94','poinarchnoch','ָ�����ĵ�δ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('95','noarchivbrowpermis','���ĵ����Ȩ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('96','subattachwanpaycur','���Ĵ˸�����Ҫ֧������ : &nbsp;&nbsp;','1261388506');
INSERT INTO {$tblprefix}clangs VALUES ('97','younosuatwaencur','<br><br>��û�ж��Ĵ˸�������Ҫ���㹻����!','0');
INSERT INTO {$tblprefix}clangs VALUES ('98','subsattach','���ĸ���','0');
INSERT INTO {$tblprefix}clangs VALUES ('99','saleattach','���۸���','0');
INSERT INTO {$tblprefix}clangs VALUES ('100','lookinittag','�鿴ԭʼ��ʶ','0');
INSERT INTO {$tblprefix}clangs VALUES ('101','lookttype','�鿴 %s','0');
INSERT INTO {$tblprefix}clangs VALUES ('102','lookselecttag','�鿴ѡ�б�ʶ','0');
INSERT INTO {$tblprefix}clangs VALUES ('103','titleunknown','���ⲻ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('104','noadminbackareapermis','�޹����̨Ȩ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('105','submit','�ύ','0');
INSERT INTO {$tblprefix}clangs VALUES ('106','regcode','��֤��','0');
INSERT INTO {$tblprefix}clangs VALUES ('107','loginpassword','��¼����','0');
INSERT INTO {$tblprefix}clangs VALUES ('108','adminaccount','�����˺�','0');
INSERT INTO {$tblprefix}clangs VALUES ('109','gobackindex','������ҳ','0');
INSERT INTO {$tblprefix}clangs VALUES ('110','loginmember','��¼��Ա','0');
INSERT INTO {$tblprefix}clangs VALUES ('111','logoutmember','�˳���Ա','0');
INSERT INTO {$tblprefix}clangs VALUES ('112','currentmember','��ǰ��Ա','0');
INSERT INTO {$tblprefix}clangs VALUES ('113','clickhere','��������û����ת�������','0');
INSERT INTO {$tblprefix}clangs VALUES ('114','adminbackarealogoutfin','�����̨�˳����','0');
INSERT INTO {$tblprefix}clangs VALUES ('115','nosubbackareaenterpermis','û����վ��̨����Ȩ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('116','adminloginfinish','�����¼���','0');
INSERT INTO {$tblprefix}clangs VALUES ('117','adminbackareaipforbid','�����̨IP��ֹ','0');
INSERT INTO {$tblprefix}clangs VALUES ('118','siteoff','��վ�ر�','0');
INSERT INTO {$tblprefix}clangs VALUES ('119','no_apermission','û�е�ǰ��Ŀ�Ĺ���Ȩ��!','0');
INSERT INTO {$tblprefix}clangs VALUES ('120','overquick','��������Ƶ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('121','inputbytelennullnotrim','�����ֽڳ���,��Ϊ�ջ�0ֵ��ʾ������','0');
INSERT INTO {$tblprefix}clangs VALUES ('122','operatesucceed','�����ɹ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('123','salestritem','����%s','0');
INSERT INTO {$tblprefix}clangs VALUES ('124','purchasestritem','����%s','0');
INSERT INTO {$tblprefix}clangs VALUES ('125','younopurcstriwanenocurr','��û�й����%s����Ҫ���㹻����!','0');
INSERT INTO {$tblprefix}clangs VALUES ('126','youalrpurchasestritem','���Ѿ������%s','0');
INSERT INTO {$tblprefix}clangs VALUES ('127','nousernopurchpermi','�ο�û�й���Ȩ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('128','scoresucceed','���ֳɹ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('129','dontrepeatscore','�벻Ҫ�ظ�����','0');
INSERT INTO {$tblprefix}clangs VALUES ('130','younoscorepermis','��û������Ȩ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('131','scorefunclosed','���ֹ����ѹر�','0');
INSERT INTO {$tblprefix}clangs VALUES ('132','nocatasbrowsepermis','����Ŀ���Ȩ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('133','reportfunclos','�ٱ������ѹر�','0');
INSERT INTO {$tblprefix}clangs VALUES ('134','userchecking','�û��ȴ����','0');
INSERT INTO {$tblprefix}clangs VALUES ('135','regcodeerror','��֤�����','0');
INSERT INTO {$tblprefix}clangs VALUES ('136','usercnamerepeat','�û������ظ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('137','usercnameillegal','�û����Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}clangs VALUES ('138','inputquerystr','�������ѯ�ִ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('139','pageparammiss','ҳ���������ȫ','0');
INSERT INTO {$tblprefix}clangs VALUES ('140','salearchive','�����ĵ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('141','subscribearchive','�����ĵ�','0');
INSERT INTO {$tblprefix}clangs VALUES ('142','younosubsarchivewantenoughcur','<br><br>��û�ж��Ĵ��ĵ�����Ҫ���㹻����!','0');
INSERT INTO {$tblprefix}clangs VALUES ('143','reloginback','�����µ�½�����̨!','0');
INSERT INTO {$tblprefix}clangs VALUES ('144','catachoose','��Ŀѡ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('145','albumchoose','�ϼ�ѡ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('146','addpre','ǰ��ҳ','0');
INSERT INTO {$tblprefix}clangs VALUES ('147','cata_choose','��ѡ����Ŀ�����','0');
INSERT INTO {$tblprefix}clangs VALUES ('148','be_catalog','������Ŀ','0');
INSERT INTO {$tblprefix}clangs VALUES ('149','prompt_msg','��ʾ��Ϣ','0');
INSERT INTO {$tblprefix}clangs VALUES ('150','allow_type','ѡ���ĵ��������','0');
INSERT INTO {$tblprefix}clangs VALUES ('151','p_choose','��ѡ��','0');
INSERT INTO {$tblprefix}clangs VALUES ('156','memcnameerror','��Ա���ƴ���','0');
INSERT INTO {$tblprefix}clangs VALUES ('153','logout','�˳�','1260243876');
INSERT INTO {$tblprefix}clangs VALUES ('155','outregmemwanact','վ��ע���Ա,��Ҫ����!','1260243876');
INSERT INTO {$tblprefix}clangs VALUES ('157','passerror','�������','1260243876');
INSERT INTO {$tblprefix}clangs VALUES ('159','subarcwantpaycur','���Ĵ��ĵ���Ҫ֧������ :','1261360139');
INSERT INTO {$tblprefix}clangs VALUES ('160','payfinish','����֧����ɣ���鿴���飡','1262944014');
INSERT INTO {$tblprefix}clangs VALUES ('161','look','�鿴','1262943874');

DROP TABLE IF EXISTS {$tblprefix}cmsgs;
CREATE TABLE {$tblprefix}cmsgs (
  lid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(50) NOT NULL,
  content text NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (lid)
) TYPE=MyISAM AUTO_INCREMENT=199;

INSERT INTO {$tblprefix}cmsgs VALUES ('1','choosematype','��ָ����ȷ�Ļ�Ա��������!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('4','choosearchive','��ָ����ȷ���ĵ���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('5','poinarcnoche','δ����ĵ����ܽ��е�ǰ������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('6','noarchbrowspermis','��û�д��ĵ������Ȩ�ޣ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('7','defineansaddtem','�붨��������ģ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('8','addtemcon','�����ģ������!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('9','choosecomobj','��ָ����ȷ�����۶���!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('10','noavailableitemoper','��Ч��Ŀ����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('11','defineanslisttem','�붨������б�ģ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('12','answerlisttemconno','�����б�ģ�����ݲ���Ϊ��!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('13','purarcwantpaycur','������ĵ���Ҫ֧������ : &nbsp;:&nbsp;','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('197','scoreoptionerr','����ѡ�����!','1264679704');
INSERT INTO {$tblprefix}cmsgs VALUES ('15','definereltem','�붨�����ģ��!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('16','developing','�˹������ڿ����У��Ժ��Ƴ���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('17','younoarcbrowsepermis','��û���ĵ����Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('18','commentfunclo','���۹����ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('19','setcomitem','�����ý�����Ŀ!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('20','owancecommuamooverlim','��ǰ�����д������ƣ������µĲ��������Ѿ������޶','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('21','safecodeerr','��֤�����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('22','userisforbid','���ڵ��������ֹ�˴˹���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('23','younoitempermis','��û�д���Ŀ�Ĳ���Ȩ�ޣ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('24','overquick','����������Ƶ�������Ժ��ٲ�����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('25','norepeatoper','�벻Ҫ�ظ�������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('26','commentsubmitsuc','�����ύ�ɹ�!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('27','choosecomeditobj','��ָ����ȷ�����۱༭����!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('28','chooseadminobj','��ָ����ȷ�Ĺ������!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('29','definecomlisttem','�붨�������б�ģ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('30','listtemcontentnotnu','�����б�ģ�����ݲ���Ϊ��!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('31','choosecommuitem','����ָ���Ĳ�����Ŀ�����ڻ򱻹رգ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('32','commuitemclo','�˽�����Ŀ�ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('33','parammissing','��������ȫ!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('34','noattach','û�и���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('35','attachdownerr','�������ش���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('36','poiattaconsoufie','��ָ������������Դ�ֶ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('37','choosemesid','��ָ����ȷ����ϢID','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('38','pointmessagenocheck','ָ������Ϣδ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('39','chooseavaimes','��ָ����ȷ����Ч��Ϣ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('40','pointconpagetemp','��ָ������ҳ��ģ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('41','definerelaisopage','�붨����ض���ҳ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('42','nocatabrowseperm','����Ŀ���Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('43','choosecatacnod','��ָ����ȷ����Ŀ�ڵ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('44','membercnameillegal','��Ա���Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('45','passwordillegal','���벻�Ϲ淶','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('46','loginsucceed','��Ա��¼�ɹ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('47','outmemberactive','վ��ע���Ա,��Ҫ����!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('48','nocheckmember','δ���Ա!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('49','loginfailed','��Ա��¼ʧ�ܣ������Գ��� %s �Σ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('50','memlogoutsucce','��Ա�˳��ɹ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('51','choosemarchive','��ָ����ȷ�Ļ�Ա�ĵ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('52','pointmarchinoch','ָ���Ļ�Աģ��δ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('53','beusenoseapermis','������Ա��û������Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('54','searchoverquick','������������Ƶ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('55','defaultclosedreason','��վ����ά�������Ժ������ӡ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('56','choosecommentmem','��ָ����ȷ�����۵Ļ�Ա!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('57','setmemcommitem','�����û�Ա������Ŀ!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('58','memcommentfunclose','��Ա���۹����ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('59','nocommentpermis','��û������Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('60','onrepeataddcom','�벻Ҫ�ظ��������!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('61','addcommenover','������۲�������Ƶ��!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('62','chooseflinkmem','��ָ����ȷ���������ӵĻ�Ա!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('63','memflinkfunclos','��Ա�������ӹ����ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('64','noflinkpermis','��û����������Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('65','dorepeataddflink','�벻Ҫ�ظ������������!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('66','flinksubmitsucce','���������ύ�ɹ�!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('67','choosereplyofmember','��ָ����ȷ�Ļظ��Ļ�Ա!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('68','memreplyfunclos','��Ա�ظ������ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('69','younoreplypermis','��û�лظ�Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('70','dorepeataddreply','�벻Ҫ�ظ���ӻظ�!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('71','addreplyoverquick','��ӻظ���������Ƶ��!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('72','replysubmitsucceed','�ظ��ύ�ɹ�!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('73','choosereportmember','��ָ����ȷ�ľٱ��Ļ�Ա!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('74','memreportfunclos','��Ա�ٱ������ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('75','noreportpermiss','��û�оٱ�Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('76','dorepeataddrep','�벻Ҫ�ظ���Ӿٱ�!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('77','reportsubmitsucce','�ٱ��ύ�ɹ�!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('78','nousernoofferpermis','�ο�û�б���Ȩ�ޣ����ȵ�¼��ע�ᣡ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('79','chooseofferobje','��ѡ�񱨼۶���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('80','chooseofferobj','��ָ����ȷ�ı��۶���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('81','younoarchivebrowsepermiss','��û�д��ĵ����Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('82','votesucceed','ͶƱ�ɹ�!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('83','nousernooperatepermis','�ο��޲���Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('84','invalidvoteitem','��ЧͶƱ��Ŀ!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('85','choosevoteoption','��ѡ��ͶƱѡ��!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('86','choosevoteitem','��ָ����ȷ��ͶƱ��Ŀ!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('87','choosereporteditobject','��ָ����ȷ�ľٱ��༭����!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('88','choosereportobject','��ָ����ȷ�ľٱ�����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('89','choosereplyeditobject','��ָ����ȷ�Ļظ��༭����!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('90','choosereplyobject','��ָ����ȷ�Ļظ�����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('91','userchecking','�û��ȴ����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('92','emailactiving','Email�����У���������伤��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('93','memberregistersucce','��Աע��ɹ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('94','memregisterfail','��Աע��ʧ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('95','choosememchann','��ָ����ȷ�Ļ�Աģ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('96','erroroperate','�������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('97','mememailillegal','��ԱEmail���Ϲ淶','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('98','memcnamerepeat','��Ա�����ظ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('99','mempasswordillegal','��Ա���벻�Ϲ淶','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('100','notsamepwd','�����������벻һ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('101','memnamelengthillegal','��Ա���Ƴ��Ȳ��Ϲ淶','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('102','defaultregclosedreason','Ĭ��ע���ѹر�ԭ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('103','dorepeatregist','�벻Ҫ�ظ�ע�� [%s]','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('104','defpurchaserecordtemp','�붨�幺���¼ģ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('105','goodsaddfinish','��Ʒ������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('106','carovermaxgoodamo','���ﳵ���������Ʒ����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('107','goodalreadyexist','����Ʒ�Ѿ�����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('108','choosegoods','��ָ����ȷ����Ʒ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('109','nousnopurchasepermi','�ο�û�й���Ȩ�ޣ����ȵ�¼��ע�ᣡ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('110','offisttemcontentnot','�����б�ģ�����ݲ���Ϊ��!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('111','defineofferlisttem','�붨�屨���б�ģ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('112','offerfunclos','���۹����ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('113','offersubmitsucceed','������ӳɹ���<br><br>\r\n��Ա�������ϸ���ã�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('114','inputofferprice','�����뱨�ۼ۸�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('115','noadminbackareapermis','�޹����̨Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('116','submit','�ύ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('117','regcode','��֤��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('118','loginpassword','��¼����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('119','adminaccount','�����˺�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('120','gobackindex','������ҳ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('121','loginmember','��¼��Ա','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('122','logoutmember','�˳���Ա','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('123','currentmember','��ǰ��Ա','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('124','clickhere','��������û����ת�������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('125','adminbackarealogoutfin','�����̨�˳����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('126','nosubbackareaenterpermis','û����վ��̨����Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('127','adminloginfinish','�����¼���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('128','adminbackareaipforbid','�����̨IP��ֹ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('129','reportfunclos','�ٱ������ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('130','operatesucceed','�����ɹ���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('131','younopurcstriwanenocurr','��û�ж��Ĵ�%s����Ҫ���㹻����!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('132','youalrpurchasestritem','���Ѿ������˴�%s','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('133','nousernopurchpermi','�ο�û�й���Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('134','confchoosarchi','��ָ����ȷ���ĵ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('135','succeed','�ɹ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('136','scoresucceed','���ֳɹ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('137','dontrepeatscore','�벻Ҫ�ظ�����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('138','younoscorepermis','��û������Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('139','scorefunclosed','���ֹ����ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('140','noavailablecommuitem','��Ч������Ŀ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('141','choosemember','��ָ����ȷ�Ļ�Ա!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('142','friendaddsucce','������ӳɹ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('143','memberalreadyadd','�˻�Ա�Ѿ����!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('144','friamountoverlim','����������������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('145','younoaddfripermis','��û����Ӻ���Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('146','favoriatefunclos','�ղع��ܹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('147','cannotaddyourself','������������ѵ�!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('192','choosereportofmember','��ѡ��ٱ��Ļ�Ա','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('149','favoritesucceed','�ղسɹ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('150','memalrefavorite','��Ա�Ѿ��ղ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('151','favoriteamooverlimit','�����ղؼеĿռ�������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('152','younofavoriatpermis','��û���ղ�Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('153','cannotfavoritemember','�����ղش˻�Ա!','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('154','nousernofavoritepermis','�ο�û���ղ�Ȩ�ޣ����ȵ�¼��ע�ᣡ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('155','archivealreadyfavorite','���Ѿ��ղ��˵�ǰ�ĵ�����鿴�ղؼУ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('156','dontnrepeatvote','�벻Ҫ�ظ�ͶƱ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('157','choosevoteobject','��ָ����ȷ��ͶƱ����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('158','answerdelsucceed','��ɾ���ɹ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('159','chooseanswer','��ָ����ȷ�Ĵ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('160','nooperatepermission','û�в���Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('195','updatesucceed','��������ִ����ϣ����ֶ�ɾ�� %s ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('164','operateoverdate','��������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('165','chooseyouanswer','��ѡ�������ѵĴ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('166','answeraddfinish','��������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('167','answeroverminlength','�𰸳�����С�ֳ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('168','inputanswercontent','�������������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('169','questionclosed','�����ѹر�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('171','chooseproduct','��ѡ��һ����Ʒ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('172','offerexist','����Ʒ�Ѿ������ı��ۿ��У�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('173','noofferpms','��û�б���Ȩ�ޣ����ȵ�¼��ע�ᣡ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('174','nooffercommu','���۱��رջ�֧�ֱ��ۣ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('175','mspacedisabled','��������δ����','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('176','membercnameillegal','��Ա������Ч','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('177','dontrepeatlogin','�벻Ҫ�ظ���½&nbsp;[%s]','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('178','mloginerrtimes','�����Դ������࣬���Ժ�����...','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('179','nousernosubper','�ο�û�ж���Ȩ�ޣ����ȵ�¼��ע�ᣡ','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('180','notnull','%s ����Ϊ�գ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('181','younocommentpermis','��û������Ȩ�ޣ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('183','choosearctype','��ѡ���ĵ����ͣ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('184','noissuepermission','û�з���Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('185','choosecommentobject','ѡ�����۶���','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('186','nomarcreadpermission','û�л�Ա��������Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('187','choosecommentofmember','��ѡ��Ҫ���۵Ļ�Ա','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('188','dorepeataddcomment','�벻Ҫ�ظ���������','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('189','addcommentoverquick','�������۲���̫Ƶ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('190','chooseflinkofmember','��ѡ���������ӵĻ�Ա','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('191','younoflinkpermis','��û����������Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('193','younoreportpermis','��û�оٱ�Ȩ��','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('194','dorepeataddreport','��Ҫ�ظ��ύ�ٱ�','0');
INSERT INTO {$tblprefix}cmsgs VALUES ('198','arcallowance','���ķ��������ѳ����޶','1265535551');

DROP TABLE IF EXISTS {$tblprefix}cnconfigs;
CREATE TABLE {$tblprefix}cnconfigs (
  cncid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  sid smallint(5) unsigned NOT NULL DEFAULT '0',
  cname varchar(50) NOT NULL,
  idsarr mediumtext NOT NULL,
  PRIMARY KEY (cncid)
) TYPE=MyISAM AUTO_INCREMENT=7;

INSERT INTO {$tblprefix}cnconfigs VALUES ('1','0','vip��Ŀ��Ŀ�˵�','a:2:{s:2:\"ca\";a:7:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";}i:3;a:1:{i:0;s:1:\"6\";}}');
INSERT INTO {$tblprefix}cnconfigs VALUES ('2','0','������Ŀ��Ŀ�˵�','a:2:{s:2:\"ca\";a:10:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";}i:4;a:7:{i:0;s:2:\"13\";i:1;s:2:\"14\";i:2;s:2:\"15\";i:3;s:2:\"16\";i:4;s:2:\"17\";i:5;s:2:\"18\";i:6;s:2:\"19\";}}');
INSERT INTO {$tblprefix}cnconfigs VALUES ('3','0','�����Ŀ��Ŀ�˵�','a:2:{s:2:\"ca\";a:10:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";}i:5;a:4:{i:0;s:2:\"20\";i:1;s:2:\"21\";i:2;s:2:\"22\";i:3;s:2:\"23\";}}');
INSERT INTO {$tblprefix}cnconfigs VALUES ('4','0','С˵��Ŀȫ����Ŀ�˵�','a:2:{s:2:\"ca\";a:7:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";}i:6;a:1:{i:0;s:2:\"36\";}}');
INSERT INTO {$tblprefix}cnconfigs VALUES ('6','0','���а�','a:2:{s:2:\"ca\";a:10:{i:0;s:1:\"1\";i:1;s:1:\"2\";i:2;s:1:\"3\";i:3;s:1:\"4\";i:4;s:1:\"5\";i:5;s:1:\"6\";i:6;s:1:\"7\";i:7;s:1:\"8\";i:8;s:1:\"9\";i:9;s:2:\"10\";}i:7;a:1:{i:0;s:2:\"38\";}}');

DROP TABLE IF EXISTS {$tblprefix}cnfields;
CREATE TABLE {$tblprefix}cnfields (
  fid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  ename char(30) NOT NULL DEFAULT '',
  cname char(30) NOT NULL,
  iscc tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  isfunc tinyint(1) NOT NULL DEFAULT '0',
  func text NOT NULL,
  innertext mediumtext NOT NULL,
  fromcode tinyint(1) unsigned NOT NULL DEFAULT '0',
  issearch tinyint(1) unsigned NOT NULL DEFAULT '0',
  length smallint(5) unsigned NOT NULL DEFAULT '0',
  datatype char(10) NOT NULL,
  notnull tinyint(1) unsigned NOT NULL DEFAULT '0',
  nohtml tinyint(1) unsigned NOT NULL DEFAULT '0',
  mlimit char(15) NOT NULL,
  regular varchar(80) NOT NULL,
  min varchar(15) NOT NULL,
  max varchar(15) NOT NULL,
  rpid smallint(5) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  guide varchar(80) NOT NULL,
  vdefault varchar(255) NOT NULL DEFAULT '',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  useredit tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (fid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}cnodes;
CREATE TABLE {$tblprefix}cnodes (
  cnid int(10) unsigned NOT NULL AUTO_INCREMENT,
  sid smallint(5) unsigned NOT NULL DEFAULT '0',
  alias varchar(50) NOT NULL,
  appurl varchar(80) NOT NULL,
  ename varchar(50) NOT NULL,
  inconfig tinyint(1) unsigned NOT NULL DEFAULT '1',
  indexurl varchar(80) NOT NULL,
  cncids varchar(255) NOT NULL DEFAULT '',
  listurl varchar(80) NOT NULL,
  bkurl varchar(80) NOT NULL,
  indextpl varchar(80) NOT NULL,
  listtpl varchar(80) NOT NULL,
  bktpl varchar(80) NOT NULL,
  mainline char(3) NOT NULL,
  caid smallint(5) unsigned NOT NULL DEFAULT '0',
  cnlevel tinyint(1) unsigned NOT NULL DEFAULT '0',
  ineedstatic int(10) unsigned NOT NULL DEFAULT '0',
  lneedstatic int(10) unsigned NOT NULL DEFAULT '0',
  bkneedstatic int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cnid)
) TYPE=MyISAM AUTO_INCREMENT=163;

INSERT INTO {$tblprefix}cnodes VALUES ('1','0','','','caid=2','1','','','','','column_index.html','lianzai.html','column_other_1.html','ca','2','1','1265809489','1265809489','1265809489');
INSERT INTO {$tblprefix}cnodes VALUES ('2','0','','','caid=3','1','','','','','column_index.html','lianzai.html','column_other_1.html','ca','3','1','1263875317','1263883127','1263831932');
INSERT INTO {$tblprefix}cnodes VALUES ('3','0','','','caid=4','1','','','','','column_index.html','lianzai.html','column_other_1.html','ca','4','1','1263954473','1239455316','1239425317');
INSERT INTO {$tblprefix}cnodes VALUES ('4','0','','','caid=5','1','','','','','column_index.html','lianzai.html','column_other_1.html','ca','5','1','1263875317','1239425317','1239425317');
INSERT INTO {$tblprefix}cnodes VALUES ('5','0','','','caid=6','1','','','','','column_index.html','lianzai.html','column_other_1.html','ca','6','1','1265810912','1265810912','1265810912');
INSERT INTO {$tblprefix}cnodes VALUES ('6','0','','','caid=7','1','','','','','column_index.html','lianzai.html','column_other_1.html','ca','7','1','1263875317','1239453857','1239425317');
INSERT INTO {$tblprefix}cnodes VALUES ('7','0','','','caid=2&ccid3=6','1','','','','','','column_vip_list.html','','ca','2','2','1265809489','1265809489','1265809489');
INSERT INTO {$tblprefix}cnodes VALUES ('8','0','','','caid=3&ccid3=6','1','','','','','','column_vip_list.html','','ca','3','2','1263875317','1239447707','1239447707');
INSERT INTO {$tblprefix}cnodes VALUES ('9','0','','','caid=4&ccid3=6','1','','','','','','column_vip_list.html','','ca','4','2','1263875317','1239425317','1239425317');
INSERT INTO {$tblprefix}cnodes VALUES ('10','0','','','caid=5&ccid3=6','1','','','','','','column_vip_list.html','','ca','5','2','1263875317','1239425317','1239425317');
INSERT INTO {$tblprefix}cnodes VALUES ('11','0','','','caid=6&ccid3=6','1','','','','','','column_vip_list.html','','ca','6','2','1265810889','1265810889','1265810889');
INSERT INTO {$tblprefix}cnodes VALUES ('12','0','','','caid=7&ccid3=6','1','','','','','','column_vip_list.html','','ca','7','2','1263875313','1239425317','1239425317');
INSERT INTO {$tblprefix}cnodes VALUES ('13','0','','','caid=1','1','','','','','column_index.html','lianzai.html','column_other_1.html','ca','1','1','1265810912','1265810912','1265810912');
INSERT INTO {$tblprefix}cnodes VALUES ('14','0','','','caid=8','1','','','','','','column_other.html','','ca','8','1','1239447707','1263882557','1239447707');
INSERT INTO {$tblprefix}cnodes VALUES ('15','0','','','caid=9','1','','','','','','column_other.html','','ca','9','1','1239418115','1263882942','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('16','0','','','caid=10','1','','','','','','column_other.html','','ca','10','1','1239418115','1263882949','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('17','0','','','caid=1&ccid4=13','1','','','','','','column_other_list.html','','ca','1','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('18','0','','','caid=1&ccid4=14','1','','','','','','column_other_list.html','','ca','1','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('19','0','','','caid=1&ccid4=15','1','','','','','','column_other_list.html','','ca','1','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('20','0','','','caid=1&ccid4=16','1','','','','','','column_other_list.html','','ca','1','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('21','0','','','caid=1&ccid4=17','1','','','','','','column_other_list.html','','ca','1','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('22','0','','','caid=1&ccid4=18','1','','','','','','column_other_list.html','','ca','1','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('23','0','','','caid=1&ccid4=19','1','','','','','','column_other_list.html','','ca','1','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('24','0','','','caid=2&ccid4=13','1','','','','','','column_other_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('25','0','','','caid=2&ccid4=14','1','','','','','','column_other_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('26','0','','','caid=2&ccid4=15','1','','','','','','column_other_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('27','0','','','caid=2&ccid4=16','1','','','','','','column_other_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('28','0','','','caid=2&ccid4=17','1','','','','','','column_other_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('29','0','','','caid=2&ccid4=18','1','','','','','','column_other_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('30','0','','','caid=2&ccid4=19','1','','','','','','column_other_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('31','0','','','caid=3&ccid4=13','1','','','','','','column_other_list.html','','ca','3','2','1263875313','1239447707','1239447707');
INSERT INTO {$tblprefix}cnodes VALUES ('32','0','','','caid=3&ccid4=14','1','','','','','','column_other_list.html','','ca','3','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('33','0','','','caid=3&ccid4=15','1','','','','','','column_other_list.html','','ca','3','2','1263875313','1239425315','1239425315');
INSERT INTO {$tblprefix}cnodes VALUES ('34','0','','','caid=3&ccid4=16','1','','','','','','column_other_list.html','','ca','3','2','1263875313','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('35','0','','','caid=3&ccid4=17','1','','','','','','column_other_list.html','','ca','3','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('36','0','','','caid=3&ccid4=18','1','','','','','','column_other_list.html','','ca','3','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('37','0','','','caid=3&ccid4=19','1','','','','','','column_other_list.html','','ca','3','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('38','0','','','caid=4&ccid4=13','1','','','','','','column_other_list.html','','ca','4','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('39','0','','','caid=4&ccid4=14','1','','','','','','column_other_list.html','','ca','4','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('40','0','','','caid=4&ccid4=15','1','','','','','','column_other_list.html','','ca','4','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('41','0','','','caid=4&ccid4=16','1','','','','','','column_other_list.html','','ca','4','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('42','0','','','caid=4&ccid4=17','1','','','','','','column_other_list.html','','ca','4','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('43','0','','','caid=4&ccid4=18','1','','','','','','column_other_list.html','','ca','4','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('44','0','','','caid=4&ccid4=19','1','','','','','','column_other_list.html','','ca','4','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('45','0','','','caid=5&ccid4=13','1','','','','','','column_other_list.html','','ca','5','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('46','0','','','caid=5&ccid4=14','1','','','','','','column_other_list.html','','ca','5','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('47','0','','','caid=5&ccid4=15','1','','','','','','column_other_list.html','','ca','5','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('48','0','','','caid=5&ccid4=16','1','','','','','','column_other_list.html','','ca','5','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('49','0','','','caid=5&ccid4=17','1','','','','','','column_other_list.html','','ca','5','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('50','0','','','caid=5&ccid4=18','1','','','','','','column_other_list.html','','ca','5','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('51','0','','','caid=5&ccid4=19','1','','','','','','column_other_list.html','','ca','5','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('52','0','','','caid=6&ccid4=13','1','','','','','','column_other_list.html','','ca','6','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('53','0','','','caid=6&ccid4=14','1','','','','','','column_other_list.html','','ca','6','2','1263875310','1239425313','1239425313');
INSERT INTO {$tblprefix}cnodes VALUES ('54','0','','','caid=6&ccid4=15','1','','','','','','column_other_list.html','','ca','6','2','1263875310','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('55','0','','','caid=6&ccid4=16','1','','','','','','column_other_list.html','','ca','6','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('56','0','','','caid=6&ccid4=17','1','','','','','','column_other_list.html','','ca','6','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('57','0','','','caid=6&ccid4=18','1','','','','','','column_other_list.html','','ca','6','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('58','0','','','caid=6&ccid4=19','1','','','','','','column_other_list.html','','ca','6','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('59','0','','','caid=7&ccid4=13','1','','','','','','column_other_list.html','','ca','7','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('60','0','','','caid=7&ccid4=14','1','','','','','','column_other_list.html','','ca','7','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('61','0','','','caid=7&ccid4=15','1','','','','','','column_other_list.html','','ca','7','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('62','0','','','caid=7&ccid4=16','1','','','','','','column_other_list.html','','ca','7','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('63','0','','','caid=7&ccid4=17','1','','','','','','column_other_list.html','','ca','7','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('64','0','','','caid=7&ccid4=18','1','','','','','','column_other_list.html','','ca','7','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('65','0','','','caid=7&ccid4=19','1','','','','','','column_other_list.html','','ca','7','2','1263875308','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('66','0','','','caid=8&ccid4=13','1','','','','','','column_other_list.html','','ca','8','2','1239447707','1239447707','1239447707');
INSERT INTO {$tblprefix}cnodes VALUES ('67','0','','','caid=8&ccid4=14','1','','','','','','column_other_list.html','','ca','8','2','1239418111','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('68','0','','','caid=8&ccid4=15','1','','','','','','column_other_list.html','','ca','8','2','1239418111','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('69','0','','','caid=8&ccid4=16','1','','','','','','column_other_list.html','','ca','8','2','1239418111','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('70','0','','','caid=8&ccid4=17','1','','','','','','column_other_list.html','','ca','8','2','1239418111','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('71','0','','','caid=8&ccid4=18','1','','','','','','column_other_list.html','','ca','8','2','1239418111','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('72','0','','','caid=8&ccid4=19','1','','','','','','column_other_list.html','','ca','8','2','1239418111','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('73','0','','','caid=9&ccid4=13','1','','','','','','column_other_list.html','','ca','9','2','1239418111','1239425311','1239425311');
INSERT INTO {$tblprefix}cnodes VALUES ('74','0','','','caid=9&ccid4=14','1','','','','','','column_other_list.html','','ca','9','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('75','0','','','caid=9&ccid4=15','1','','','','','','column_other_list.html','','ca','9','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('76','0','','','caid=9&ccid4=16','1','','','','','','column_other_list.html','','ca','9','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('77','0','','','caid=9&ccid4=17','1','','','','','','column_other_list.html','','ca','9','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('78','0','','','caid=9&ccid4=18','1','','','','','','column_other_list.html','','ca','9','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('79','0','','','caid=9&ccid4=19','1','','','','','','column_other_list.html','','ca','9','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('80','0','','','caid=10&ccid4=13','1','','','','','','column_other_list.html','','ca','10','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('81','0','','','caid=10&ccid4=14','1','','','','','','column_other_list.html','','ca','10','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('82','0','','','caid=10&ccid4=15','1','','','','','','column_other_list.html','','ca','10','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('83','0','','','caid=10&ccid4=16','1','','','','','','column_other_list.html','','ca','10','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('84','0','','','caid=10&ccid4=17','1','','','','','','column_other_list.html','','ca','10','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('85','0','','','caid=10&ccid4=18','1','','','','','','column_other_list.html','','ca','10','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('86','0','','','caid=10&ccid4=19','1','','','','','','column_other_list.html','','ca','10','2','1239418107','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('87','0','','','caid=1&ccid5=20','1','','','','','','column_time_list.html','','ca','1','2','1263875308','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('88','0','','','caid=1&ccid5=21','1','','','','','','column_time_list.html','','ca','1','2','1263875308','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('89','0','','','caid=1&ccid5=22','1','','','','','','column_time_list.html','','ca','1','2','1263875308','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('90','0','','','caid=1&ccid5=23','1','','','','','','column_time_list.html','','ca','1','2','1263875308','1239425307','1239425307');
INSERT INTO {$tblprefix}cnodes VALUES ('91','0','','','caid=2&ccid5=20','1','','','','','','column_time_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('92','0','','','caid=2&ccid5=21','1','','','','','','column_time_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('93','0','','','caid=2&ccid5=22','1','','','','','','column_time_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('94','0','','','caid=2&ccid5=23','1','','','','','','column_time_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('95','0','','','caid=3&ccid5=20','1','','','','','','column_time_list.html','','ca','3','2','1263875308','1239447707','1239447707');
INSERT INTO {$tblprefix}cnodes VALUES ('96','0','','','caid=3&ccid5=21','1','','','','','','column_time_list.html','','ca','3','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('97','0','','','caid=3&ccid5=22','1','','','','','','column_time_list.html','','ca','3','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('98','0','','','caid=3&ccid5=23','1','','','','','','column_time_list.html','','ca','3','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('99','0','','','caid=4&ccid5=20','1','','','','','','column_time_list.html','','ca','4','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('100','0','','','caid=4&ccid5=21','1','','','','','','column_time_list.html','','ca','4','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('101','0','','','caid=4&ccid5=22','1','','','','','','column_time_list.html','','ca','4','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('102','0','','','caid=4&ccid5=23','1','','','','','','column_time_list.html','','ca','4','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('103','0','','','caid=5&ccid5=20','1','','','','','','column_time_list.html','','ca','5','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('104','0','','','caid=5&ccid5=21','1','','','','','','column_time_list.html','','ca','5','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('105','0','','','caid=5&ccid5=22','1','','','','','','column_time_list.html','','ca','5','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('106','0','','','caid=5&ccid5=23','1','','','','','','column_time_list.html','','ca','5','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('107','0','','','caid=6&ccid5=20','1','','','','','','column_time_list.html','','ca','6','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('108','0','','','caid=6&ccid5=21','1','','','','','','column_time_list.html','','ca','6','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('109','0','','','caid=6&ccid5=22','1','','','','','','column_time_list.html','','ca','6','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('110','0','','','caid=6&ccid5=23','1','','','','','','column_time_list.html','','ca','6','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('111','0','','','caid=7&ccid5=20','1','','','','','','column_time_list.html','','ca','7','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('112','0','','','caid=7&ccid5=21','1','','','','','','column_time_list.html','','ca','7','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('113','0','','','caid=7&ccid5=22','1','','','','','','column_time_list.html','','ca','7','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('114','0','','','caid=7&ccid5=23','1','','','','','','column_time_list.html','','ca','7','2','1263875306','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('115','0','','','caid=8&ccid5=20','1','','','','','','column_time_list.html','','ca','8','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('116','0','','','caid=8&ccid5=21','1','','','','','','column_time_list.html','','ca','8','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('117','0','','','caid=8&ccid5=22','1','','','','','','column_time_list.html','','ca','8','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('118','0','','','caid=8&ccid5=23','1','','','','','','column_time_list.html','','ca','8','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('119','0','','','caid=9&ccid5=20','1','','','','','','column_time_list.html','','ca','9','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('120','0','','','caid=9&ccid5=21','1','','','','','','column_time_list.html','','ca','9','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('121','0','','','caid=9&ccid5=22','1','','','','','','column_time_list.html','','ca','9','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('122','0','','','caid=9&ccid5=23','1','','','','','','column_time_list.html','','ca','9','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('123','0','','','caid=10&ccid5=20','1','','','','','','column_time_list.html','','ca','10','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('124','0','','','caid=10&ccid5=21','1','','','','','','column_time_list.html','','ca','10','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('125','0','','','caid=10&ccid5=22','1','','','','','','column_time_list.html','','ca','10','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('126','0','','','caid=10&ccid5=23','1','','','','','','column_time_list.html','','ca','10','2','1239432071','1239432071','1239432071');
INSERT INTO {$tblprefix}cnodes VALUES ('135','0','','','caid=1&ccid3=6','1','','','','','column_vip_index.html','','','ca','1','2','1263875306','1242029479','1242029479');
INSERT INTO {$tblprefix}cnodes VALUES ('136','0','','','caid=1&ccid6=24','0','','|4|','','','','','','ca','1','2','1262765050','1262765050','1262765050');
INSERT INTO {$tblprefix}cnodes VALUES ('137','0','','','caid=2&ccid6=24','0','','|4|','','','','','','ca','2','2','1262765050','1262765050','1262765050');
INSERT INTO {$tblprefix}cnodes VALUES ('138','0','','','caid=3&ccid6=24','0','','|4|','','','','','','ca','3','2','1262765050','1262765050','1262765050');
INSERT INTO {$tblprefix}cnodes VALUES ('139','0','','','caid=4&ccid6=24','0','','|4|','','','','','','ca','4','2','1262765050','1262765050','1262765050');
INSERT INTO {$tblprefix}cnodes VALUES ('140','0','','','caid=5&ccid6=24','0','','|4|','','','','','','ca','5','2','1262765050','1262765050','1262765050');
INSERT INTO {$tblprefix}cnodes VALUES ('141','0','','','caid=6&ccid6=24','0','','|4|','','','','','','ca','6','2','1262765050','1262765050','1262765050');
INSERT INTO {$tblprefix}cnodes VALUES ('142','0','','','caid=7&ccid6=24','0','','|4|','','','','','','ca','7','2','1262765050','1262765050','1262765050');
INSERT INTO {$tblprefix}cnodes VALUES ('143','0','','','caid=1&ccid6=36','1','','|4|','','','finishindex.html','finish_list.html','','ca','1','2','1264060758','1264060758','1264060758');
INSERT INTO {$tblprefix}cnodes VALUES ('144','0','','','caid=2&ccid6=36','1','','|4|','','','','finish_list.html','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('145','0','','','caid=3&ccid6=36','1','','|4|','','','','finish_list.html','','ca','3','2','1264060758','1264060758','1264060758');
INSERT INTO {$tblprefix}cnodes VALUES ('146','0','','','caid=4&ccid6=36','1','','|4|','','','','finish_list.html','','ca','4','2','1264060758','1264060758','1264060758');
INSERT INTO {$tblprefix}cnodes VALUES ('147','0','','','caid=5&ccid6=36','1','','|4|','','','','finish_list.html','','ca','5','2','1264060758','1264060758','1264060758');
INSERT INTO {$tblprefix}cnodes VALUES ('148','0','','','caid=6&ccid6=36','1','','|4|','','','','finish_list.html','','ca','6','2','1264060758','1264060758','1264060758');
INSERT INTO {$tblprefix}cnodes VALUES ('149','0','','','caid=7&ccid6=36','1','','|4|','','','','finish_list.html','','ca','7','2','1264060758','1264060758','1264060758');
INSERT INTO {$tblprefix}cnodes VALUES ('150','0','','','caid=1&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','1','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('151','0','','','caid=2&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','2','2','1265809137','1265809137','1265809137');
INSERT INTO {$tblprefix}cnodes VALUES ('152','0','','','caid=3&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','3','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('153','0','','','caid=4&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','4','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('154','0','','','caid=5&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','5','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('155','0','','','caid=6&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','6','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('156','0','','','caid=7&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','7','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('157','0','','','caid=8&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','8','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('158','0','','','caid=9&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','9','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('159','0','','','caid=10&ccid7=38','1','','|6|','','','panhanindex.html','','','ca','10','2','1264235431','1264235431','1264235431');
INSERT INTO {$tblprefix}cnodes VALUES ('160','0','','','caid=11','1','','','','','ztindex.html','zt_list.html','','ca','11','1','1265600309','1265600309','1265600309');
INSERT INTO {$tblprefix}cnodes VALUES ('161','0','','','caid=12','1','','','','','','zt_list.html','','ca','12','1','1265600309','1265600309','1265600309');
INSERT INTO {$tblprefix}cnodes VALUES ('162','0','','','caid=13','1','','','','','','zt_list.html','','ca','13','1','1265600309','1265600309','1265600309');

DROP TABLE IF EXISTS {$tblprefix}coclass;
CREATE TABLE {$tblprefix}coclass (
  ccid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  pid smallint(6) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  title char(30) NOT NULL,
  isframe tinyint(1) unsigned NOT NULL DEFAULT '0',
  chids varchar(255) NOT NULL,
  mchids varchar(255) NOT NULL DEFAULT '',
  dirname varchar(30) NOT NULL,
  smallsite varchar(50) NOT NULL,
  coid smallint(6) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  trueorder smallint(6) unsigned NOT NULL DEFAULT '0',
  apmid smallint(6) unsigned NOT NULL DEFAULT '0',
  crpmid smallint(6) unsigned NOT NULL DEFAULT '0',
  rpmid smallint(6) unsigned NOT NULL DEFAULT '0',
  dpmid smallint(6) unsigned NOT NULL DEFAULT '0',
  allowsale tinyint(1) unsigned NOT NULL DEFAULT '0',
  allowfsale tinyint(1) unsigned NOT NULL DEFAULT '0',
  taxcp varchar(15) NOT NULL,
  awardcp varchar(15) NOT NULL,
  ftaxcp varchar(15) NOT NULL,
  clicks int(10) unsigned NOT NULL DEFAULT '0',
  archives int(10) unsigned NOT NULL DEFAULT '0',
  conditions text NOT NULL,
  PRIMARY KEY (ccid),
  KEY `level` (`level`)
) TYPE=MyISAM AUTO_INCREMENT=40;

INSERT INTO {$tblprefix}coclass VALUES ('1','0','0','�����Ƽ�','1','1,2,3,4','','reindex','','1','0','0','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('2','0','0','ͼ���Ƽ�','1','1,2,3,4','','reindex_pictxt','','1','0','3','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('3','0','0','ͷ���Ƽ�','1','1,2,3,4','','reindex_type','','1','0','6','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('4','0','0','VIPǿ���ƽ��','1','1,2,3,4','','index_readmin','','1','0','10','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('5','0','0','��ҳjs�õ�Ƭ','0','1,2,3,4','','js_flash','','2','0','0','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('6','0','0','VIPС˵','0','4','','vip','','3','1','1','0','0','0','0','0','0','','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('13','0','0','�й���½','0','2,4','','dalu','','4','0','0','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('14','0','0','���','0','2,4','','xianggang','','4','0','1','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('15','0','0','����','0','2,4','','aomen','','4','0','2','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('16','0','0','̨��','0','2,4','','taiwang','','4','0','3','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('17','0','0','ŷ��','0','2,4','','oumei','','4','0','4','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('18','0','0','����','0','2,4','','korea','','4','0','5','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('19','0','0','�ձ�','0','2,4','','riben','','4','0','6','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('20','0','0','����','0','2,4','','dangdai','','5','0','0','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('21','0','0','�ִ�','0','2,4','','xiandai','','5','0','1','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('22','0','0','����','0','2,4','','jindai','','5','0','2','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('23','0','0','�Ŵ�','0','2,4','','gudai','','5','0','3','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('27','0','0','VIPר��js�õ�Ƭ','0','4','','vip_jsfash','','2','0','1','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('28','3','1','��ҳͷ���Ƽ�','0','1,2,3,4','','reindex_typesy','','1','0','7','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('29','3','1','vipר��_ͷ���Ƽ�','0','4','','reindex_typevip','','1','0','8','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('30','3','1','ר���Ƽ�','0','5','','index_readminsy','','1','0','9','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('39','0','0','VIP�½�','0','1','','nvip','','3','0','0','0','0','0','0','0','0','1_1','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('32','2','1','��ҳͼ���Ƽ�','0','1,2,3,4','','reindex_pictxts','','1','0','4','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('33','2','1','vipר��_ͼ���Ƽ�','0','4','','reindex_pictxtv','','1','0','5','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('34','1','1','��ҳ�����Ƽ�','0','1,2,3,4','','reindex_sy','','1','0','1','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('35','1','1','vipר�������Ƽ�','0','4','','reindex_vip','','1','0','2','0','0','0','0','0','0','0','0','0','0','0','');
INSERT INTO {$tblprefix}coclass VALUES ('36','0','0','ȫ��С˵','0','','','quanben','','6','0','0','0','0','0','0','0','0','','','','0','0','a:1:{s:6:\"sqlstr\";s:20:\"{$pre}abover = \\\'1\\\'\";}');
INSERT INTO {$tblprefix}coclass VALUES ('38','0','0','���а�','0','','','panhan','','7','0','0','0','0','0','0','0','0','0','0','0','0','0','');

DROP TABLE IF EXISTS {$tblprefix}comments;
CREATE TABLE {$tblprefix}comments (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(30) NOT NULL,
  title varchar(80) NOT NULL,
  content mediumtext NOT NULL,
  score int(10) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  updatedate int(10) unsigned NOT NULL DEFAULT '0',
  ip varchar(15) NOT NULL,
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  votes1 int(10) unsigned NOT NULL DEFAULT '0',
  votes2 int(10) unsigned NOT NULL DEFAULT '0',
  votes3 int(10) unsigned NOT NULL DEFAULT '0',
  votes4 int(10) unsigned NOT NULL DEFAULT '0',
  votes5 int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}commus;
CREATE TABLE {$tblprefix}commus (
  cuid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL,
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  cclass varchar(30) NOT NULL,
  setting text NOT NULL,
  func text NOT NULL,
  cutpl varchar(50) NOT NULL,
  addtpl varchar(50) NOT NULL DEFAULT '',
  sortable tinyint(1) unsigned NOT NULL DEFAULT '0',
  addable tinyint(1) unsigned NOT NULL DEFAULT '0',
  ch tinyint(1) unsigned NOT NULL DEFAULT '0',
  isbk tinyint(1) unsigned NOT NULL DEFAULT '0',
  allowance tinyint(1) NOT NULL DEFAULT '0',
  ucadd varchar(80) NOT NULL,
  ucvote varchar(80) NOT NULL,
  uadetail varchar(80) NOT NULL,
  umdetail varchar(80) NOT NULL,
  usetting text NOT NULL,
  uconfig varchar(80) NOT NULL,
  PRIMARY KEY (cuid)
) TYPE=MyISAM AUTO_INCREMENT=30;

INSERT INTO {$tblprefix}commus VALUES ('1','��','1','1','praise','a:3:{s:5:\"apmid\";s:1:\"0\";s:6:\"repeat\";s:1:\"0\";s:10:\"repeattime\";i:1;}','','','','0','0','0','0','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('2','����','1','1','score','a:5:{s:5:\"apmid\";s:1:\"0\";s:6:\"repeat\";s:1:\"0\";s:10:\"repeattime\";i:0;s:8:\"scorestr\";s:9:\"1,2,3,4,5\";s:4:\"pics\";s:1:\"1\";}','','','','0','0','0','0','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('3','�ٱ�����','1','1','report','a:4:{s:5:\"apmid\";s:1:\"1\";s:6:\"repeat\";s:1:\"1\";s:10:\"repeattime\";i:0;s:6:\"citems\";s:7:\"content\";}','','','','0','1','1','0','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('4','�ղ�','1','1','favorite','a:2:{s:5:\"apmid\";s:1:\"0\";s:3:\"max\";i:0;}','','','','0','0','0','0','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('5','����','1','1','comment','a:7:{s:5:\"apmid\";s:1:\"1\";s:9:\"autocheck\";s:1:\"1\";s:6:\"repeat\";s:1:\"0\";s:10:\"repeattime\";i:0;s:10:\"nouservote\";s:1:\"1\";s:10:\"repeatvote\";s:1:\"0\";s:6:\"citems\";s:19:\"title,content,score\";}','','comments.html','','1','1','1','0','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('6','����','1','1','answer','a:10:{s:5:\"apmid\";s:1:\"0\";s:10:\"nouservote\";s:1:\"0\";s:10:\"repeatvote\";s:1:\"0\";s:9:\"minlength\";i:0;s:9:\"maxlength\";i:0;s:5:\"vdays\";i:0;s:4:\"crid\";s:1:\"1\";s:4:\"mini\";i:0;s:3:\"max\";i:0;s:6:\"credit\";i:0;}','','answer.htm','','1','1','1','0','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('7','������Ʒ','1','1','purchase','a:3:{s:5:\"apmid\";s:1:\"0\";s:6:\"gtmode\";s:1:\"0\";s:6:\"citems\";s:0:\"\";}','','','','1','0','1','0','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('8','����','1','1','subscribe','a:3:{s:5:\"apmid\";s:1:\"0\";s:7:\"autoarc\";s:1:\"1\";s:7:\"autoatm\";s:1:\"1\";}','','','','0','0','0','0','0','novel/c/subscribe.php','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('20','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('21','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('22','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('23','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('24','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('25','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('26','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('27','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('28','','1','1','','','','','','0','0','0','1','0','','','','','','');
INSERT INTO {$tblprefix}commus VALUES ('29','','1','1','','','','','','0','0','0','1','0','','','','','','');

DROP TABLE IF EXISTS {$tblprefix}consults;
CREATE TABLE {$tblprefix}consults (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL,
  content mediumtext NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  reply tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}cotypes;
CREATE TABLE {$tblprefix}cotypes (
  coid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname char(30) NOT NULL,
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  notblank tinyint(1) unsigned NOT NULL DEFAULT '0',
  sortable tinyint(1) unsigned NOT NULL DEFAULT '0',
  mainline tinyint(1) unsigned NOT NULL DEFAULT '0',
  self_reg tinyint(1) unsigned NOT NULL DEFAULT '0',
  vmode tinyint(1) unsigned NOT NULL DEFAULT '0',
  permission tinyint(1) unsigned NOT NULL DEFAULT '0',
  awardcp tinyint(1) unsigned NOT NULL DEFAULT '0',
  taxcp tinyint(1) unsigned NOT NULL DEFAULT '0',
  ftaxcp tinyint(1) unsigned NOT NULL DEFAULT '0',
  sale tinyint(1) unsigned NOT NULL DEFAULT '0',
  fsale tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (coid)
) TYPE=MyISAM AUTO_INCREMENT=8;

INSERT INTO {$tblprefix}cotypes VALUES ('1','�Ƽ�����','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO {$tblprefix}cotypes VALUES ('2','�������','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO {$tblprefix}cotypes VALUES ('3','VIP','0','0','1','0','0','0','0','0','1','0','0','0');
INSERT INTO {$tblprefix}cotypes VALUES ('4','�������','0','0','1','0','0','0','0','0','0','0','0','0');
INSERT INTO {$tblprefix}cotypes VALUES ('5','�������','0','0','1','0','0','0','0','0','0','0','0','0');
INSERT INTO {$tblprefix}cotypes VALUES ('6','ȫ��С˵','0','0','1','0','1','0','0','0','0','0','0','0');
INSERT INTO {$tblprefix}cotypes VALUES ('7','���а�','0','0','1','0','0','0','0','0','0','0','0','0');

DROP TABLE IF EXISTS {$tblprefix}crprices;
CREATE TABLE {$tblprefix}crprices (
  cpid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(15) NOT NULL,
  cname varchar(30) NOT NULL,
  crid smallint(5) unsigned NOT NULL DEFAULT '0',
  crvalue float NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '0',
  tax tinyint(1) unsigned NOT NULL DEFAULT '0',
  award tinyint(1) unsigned NOT NULL DEFAULT '0',
  sale tinyint(1) unsigned NOT NULL DEFAULT '0',
  ftax tinyint(1) unsigned NOT NULL DEFAULT '0',
  fsale tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cpid)
) TYPE=MyISAM AUTO_INCREMENT=2;

INSERT INTO {$tblprefix}crprices VALUES ('1','1_1','1����','1','1','0','1','0','0','0','0');

DROP TABLE IF EXISTS {$tblprefix}crprojects;
CREATE TABLE {$tblprefix}crprojects (
  crpid smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(10) NOT NULL,
  scrid smallint(3) unsigned NOT NULL DEFAULT '0',
  scurrency mediumint(8) unsigned NOT NULL DEFAULT '0',
  ecrid smallint(3) unsigned NOT NULL DEFAULT '0',
  ecurrency mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (crpid)
) TYPE=MyISAM AUTO_INCREMENT=2;

INSERT INTO {$tblprefix}crprojects VALUES ('1','0_2','0','1','2','100');

DROP TABLE IF EXISTS {$tblprefix}cucatalogs;
CREATE TABLE {$tblprefix}cucatalogs (
  caid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL DEFAULT '',
  cu tinyint(3) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (caid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}cufields;
CREATE TABLE {$tblprefix}cufields (
  fid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  ename char(30) NOT NULL DEFAULT '',
  cname char(30) NOT NULL,
  cu tinyint(3) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  isfunc tinyint(1) unsigned NOT NULL DEFAULT '0',
  func text NOT NULL,
  isadmin tinyint(1) unsigned NOT NULL DEFAULT '0',
  innertext mediumtext NOT NULL,
  fromcode tinyint(1) unsigned NOT NULL DEFAULT '0',
  length smallint(5) unsigned NOT NULL DEFAULT '0',
  datatype char(10) NOT NULL,
  notnull tinyint(1) unsigned NOT NULL DEFAULT '0',
  nohtml tinyint(1) unsigned NOT NULL DEFAULT '0',
  mlimit char(15) NOT NULL,
  regular varchar(80) NOT NULL,
  min varchar(15) NOT NULL,
  max varchar(15) NOT NULL,
  rpid smallint(5) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  guide varchar(80) NOT NULL,
  vdefault varchar(255) NOT NULL DEFAULT '',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  useredit tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (fid)
) TYPE=MyISAM AUTO_INCREMENT=6;

INSERT INTO {$tblprefix}cufields VALUES ('1','title','����','4','1','0','','0','','0','80','text','0','0','','','','','0','0','0','','','0','0');
INSERT INTO {$tblprefix}cufields VALUES ('2','content','����','4','1','0','','0','','0','0','multitext','0','0','','','','','0','0','0','','','0','0');
INSERT INTO {$tblprefix}cufields VALUES ('3','score','����','4','1','0','','0','1\n2\n3\n4\n5','0','10','select','0','0','','','','','0','0','0','','','0','0');
INSERT INTO {$tblprefix}cufields VALUES ('5','content','����','5','1','0','','0','','0','0','multitext','0','0','','','','','0','0','1','','','0','0');

DROP TABLE IF EXISTS {$tblprefix}currencys;
CREATE TABLE {$tblprefix}currencys (
  crid smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  unit varchar(30) NOT NULL DEFAULT '��',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  initial int(8) unsigned NOT NULL DEFAULT '0',
  saving tinyint(1) unsigned NOT NULL DEFAULT '0',
  archive float unsigned NOT NULL DEFAULT '0',
  `comment` float unsigned NOT NULL DEFAULT '0',
  purchase float unsigned NOT NULL DEFAULT '0',
  answer float unsigned NOT NULL DEFAULT '0',
  favorite float unsigned NOT NULL DEFAULT '0',
  commu float unsigned NOT NULL DEFAULT '0',
  vote float unsigned NOT NULL DEFAULT '0',
  freeinfo float unsigned NOT NULL DEFAULT '0',
  pm float unsigned NOT NULL DEFAULT '0',
  search float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (crid)
) TYPE=MyISAM AUTO_INCREMENT=3;

INSERT INTO {$tblprefix}currencys VALUES ('1','����','��','1','100','0','10','1','0','0','1','1','1','5','1','1');
INSERT INTO {$tblprefix}currencys VALUES ('2','�Ķ���','��','1','0','1','0','0','0','0','0','0','0','0','0','0');

DROP TABLE IF EXISTS {$tblprefix}dbfields;
CREATE TABLE {$tblprefix}dbfields (
  dfid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  ddtable varchar(64) NOT NULL DEFAULT '',
  ddfield varchar(64) NOT NULL DEFAULT '',
  ddcomment varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (dfid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}dbsources;
CREATE TABLE {$tblprefix}dbsources (
  dsid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL,
  dbhost varchar(30) NOT NULL,
  dbuser varchar(50) NOT NULL,
  dbpw varchar(100) NOT NULL,
  dbname varchar(50) NOT NULL,
  dbcharset varchar(10) NOT NULL,
  PRIMARY KEY (dsid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}extracts;
CREATE TABLE {$tblprefix}extracts (
  eid int(10) unsigned NOT NULL AUTO_INCREMENT,
  mid int(10) unsigned NOT NULL,
  mname char(15) NOT NULL,
  integral float unsigned NOT NULL,
  total float NOT NULL,
  rate float NOT NULL,
  remark text NOT NULL,
  checkdate int(11) NOT NULL,
  createdate int(11) NOT NULL,
  PRIMARY KEY (eid),
  KEY mid (mid),
  KEY mid_date (mid,createdate,checkdate)
) TYPE=MyISAM AUTO_INCREMENT=2;

INSERT INTO {$tblprefix}extracts VALUES ('1','4','bbbbb','100','70','70','������������ʽ�������Ϣ��лл��','1265797460','1265797447');

DROP TABLE IF EXISTS {$tblprefix}farchives;
CREATE TABLE {$tblprefix}farchives (
  aid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(80) NOT NULL,
  chid smallint(5) unsigned NOT NULL DEFAULT '0',
  caid smallint(5) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  editor char(30) NOT NULL,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname char(15) NOT NULL,
  startdate int(10) unsigned NOT NULL DEFAULT '0',
  enddate int(10) unsigned NOT NULL DEFAULT '0',
  orderdays int(10) unsigned NOT NULL DEFAULT '0',
  arcurl varchar(100) NOT NULL,
  vieworder mediumint(8) unsigned NOT NULL DEFAULT '999',
  qnew tinyint(1) unsigned NOT NULL DEFAULT '1',
  qstate enum('new','dealing','end','close') NOT NULL DEFAULT 'new',
  updatedate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}farchives_1;
CREATE TABLE {$tblprefix}farchives_1 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  linkurl varchar(255) NOT NULL DEFAULT '',
  linktxt varchar(255) NOT NULL DEFAULT '',
  contactor varchar(255) NOT NULL DEFAULT '',
  email varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}farchives_2;
CREATE TABLE {$tblprefix}farchives_2 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  linkurl varchar(255) NOT NULL DEFAULT '',
  linktxt varchar(255) NOT NULL DEFAULT '',
  piclink varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}farchives_3;
CREATE TABLE {$tblprefix}farchives_3 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  content text NOT NULL,
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}farchives_4;
CREATE TABLE {$tblprefix}farchives_4 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  advurl varchar(100) NOT NULL DEFAULT '',
  advimg varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}farchives_5;
CREATE TABLE {$tblprefix}farchives_5 (
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  advurl varchar(80) NOT NULL DEFAULT '',
  alttext varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}favorites;
CREATE TABLE {$tblprefix}favorites (
  fid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  bkid mediumint(8) unsigned NOT NULL DEFAULT '0',
  ucid mediumint(8) unsigned NOT NULL DEFAULT '0',
  abnew mediumint(8) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (fid),
  KEY mid (mid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}fcatalogs;
CREATE TABLE {$tblprefix}fcatalogs (
  caid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title char(50) NOT NULL,
  pid smallint(6) unsigned NOT NULL DEFAULT '0',
  vieworder tinyint(3) unsigned NOT NULL DEFAULT '0',
  chid smallint(6) unsigned NOT NULL DEFAULT '0',
  cumode tinyint(1) unsigned NOT NULL DEFAULT '0',
  culength smallint(6) unsigned NOT NULL DEFAULT '0',
  autocheck tinyint(1) unsigned NOT NULL DEFAULT '0',
  allowupdate tinyint(1) unsigned NOT NULL DEFAULT '0',
  arctpl varchar(50) NOT NULL,
  apmid smallint(6) unsigned NOT NULL DEFAULT '0',
  rpmid smallint(6) unsigned NOT NULL DEFAULT '0',
  nodurat tinyint(1) unsigned NOT NULL DEFAULT '0',
  ucadd varchar(80) NOT NULL,
  uaadd varchar(80) NOT NULL,
  uadetail varchar(80) NOT NULL,
  umdetail varchar(80) NOT NULL,
  usetting text NOT NULL,
  PRIMARY KEY (caid),
  KEY parentid (vieworder)
) TYPE=MyISAM AUTO_INCREMENT=21;

INSERT INTO {$tblprefix}fcatalogs VALUES ('1','������������','0','1','1','0','0','1','0','','4','0','1','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('2','ͼƬ��������','0','2','2','0','0','1','0','','4','0','1','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('3','��վ����','0','3','3','0','0','1','0','notice.html','4','0','1','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('4','ͷ��ͼƬ700*60','0','8','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('5','���ֹ��','0','7','5','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('6','��վ��̬','0','4','3','0','0','1','0','dongtai.html','4','0','1','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('10','ҵ����ѯ','0','6','3','1','0','1','1','','0','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('11','��վ�ײ���Ϣ','0','5','3','0','0','1','0','dibu.html','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('12','��ҳ��690','0','9','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('13','С˵690','0','12','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('14','��ҳ250��','0','10','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('15','��ҳ250��','0','11','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('16','С˵250��','0','13','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('17','С˵250��','0','14','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('18','��ҳ��690','0','9','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('19','����250','0','16','4','0','0','1','0','','4','0','0','','','','','');
INSERT INTO {$tblprefix}fcatalogs VALUES ('20','����690','0','15','4','0','0','1','0','','4','0','0','','','','','');

DROP TABLE IF EXISTS {$tblprefix}fchannels;
CREATE TABLE {$tblprefix}fchannels (
  chid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname char(30) NOT NULL,
  PRIMARY KEY (chid)
) TYPE=MyISAM AUTO_INCREMENT=6;

INSERT INTO {$tblprefix}fchannels VALUES ('1','������������');
INSERT INTO {$tblprefix}fchannels VALUES ('2','ͼƬ��������');
INSERT INTO {$tblprefix}fchannels VALUES ('3','��������Ϣ');
INSERT INTO {$tblprefix}fchannels VALUES ('4','ͼƬ���');
INSERT INTO {$tblprefix}fchannels VALUES ('5','���ֹ��');

DROP TABLE IF EXISTS {$tblprefix}ffields;
CREATE TABLE {$tblprefix}ffields (
  fid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  ename char(30) NOT NULL DEFAULT '',
  cname char(30) NOT NULL,
  chid smallint(5) unsigned NOT NULL DEFAULT '0',
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  isfunc tinyint(1) unsigned NOT NULL DEFAULT '0',
  func text NOT NULL,
  innertext mediumtext NOT NULL,
  fromcode tinyint(1) unsigned NOT NULL DEFAULT '0',
  length smallint(5) unsigned NOT NULL DEFAULT '0',
  datatype char(10) NOT NULL,
  notnull tinyint(1) unsigned NOT NULL DEFAULT '0',
  nohtml tinyint(1) unsigned NOT NULL DEFAULT '0',
  mlimit char(15) NOT NULL,
  regular varchar(80) NOT NULL,
  min varchar(15) NOT NULL,
  max varchar(15) NOT NULL,
  rpid smallint(5) unsigned NOT NULL DEFAULT '0',
  isadmin tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  guide varchar(80) NOT NULL,
  vdefault varchar(255) NOT NULL DEFAULT '',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  useredit tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (fid)
) TYPE=MyISAM AUTO_INCREMENT=24;

INSERT INTO {$tblprefix}ffields VALUES ('1','subject','��Ϣ����','1','1','1','0','','','0','255','text','1','0','0','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('2','linkurl','����url','1','0','1','0','','','0','255','text','1','1','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('3','linktxt','˵������','1','0','1','0','','','0','255','text','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('4','contactor','��ϵ��','1','0','1','0','','','0','255','text','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('5','email','E-mail','1','0','1','0','','','0','255','text','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('6','subject','��Ϣ����','2','1','1','0','','','0','255','text','1','0','0','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('7','subject','��Ϣ����','3','1','1','0','','','0','255','text','1','0','0','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('8','subject','��Ϣ����','4','1','1','0','','','0','255','text','1','0','0','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('9','subject','��Ϣ����','5','1','1','0','','','0','255','text','1','0','0','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('21','piclink','ͼƬ��������','2','0','1','0','','','0','0','image','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('11','linkurl','����URL','2','0','1','0','','','0','255','text','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('12','linktxt','����˵��','2','0','1','0','','','0','255','text','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('13','content','����','3','0','1','0','','','0','0','htmltext','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('14','advurl','�������','4','0','1','0','','','0','100','text','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('15','advimg','���ͼƬ','4','0','1','0','','','0','0','image','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('18','advurl','�������','5','0','1','0','','','0','80','text','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}ffields VALUES ('19','alttext','˵������','5','0','1','0','','','0','255','text','0','0','','','','','0','0','0','0','','','0','0');

DROP TABLE IF EXISTS {$tblprefix}fields;
CREATE TABLE {$tblprefix}fields (
  fid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  ename char(30) NOT NULL DEFAULT '',
  cname char(30) NOT NULL,
  chid smallint(6) unsigned NOT NULL DEFAULT '0',
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  iscustom tinyint(1) unsigned NOT NULL DEFAULT '0',
  mcommon tinyint(1) unsigned NOT NULL DEFAULT '0',
  isfunc tinyint(1) unsigned NOT NULL DEFAULT '0',
  func text NOT NULL,
  available tinyint(1) unsigned NOT NULL DEFAULT '0',
  tbl varchar(10) NOT NULL DEFAULT 'main',
  innertext text NOT NULL,
  fromcode tinyint(1) unsigned NOT NULL DEFAULT '0',
  issearch tinyint(1) unsigned NOT NULL DEFAULT '0',
  length smallint(5) unsigned NOT NULL DEFAULT '0',
  datatype char(10) NOT NULL,
  notnull tinyint(1) unsigned NOT NULL DEFAULT '0',
  nohtml tinyint(1) unsigned NOT NULL DEFAULT '0',
  mlimit char(15) NOT NULL,
  regular varchar(80) NOT NULL,
  min varchar(15) NOT NULL,
  max varchar(15) NOT NULL,
  rpid smallint(5) unsigned NOT NULL DEFAULT '0',
  isadmin tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  guide varchar(80) NOT NULL,
  vdefault varchar(255) NOT NULL DEFAULT '',
  istxt tinyint(1) unsigned NOT NULL DEFAULT '0',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  useredit tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (fid)
) TYPE=MyISAM AUTO_INCREMENT=78;

INSERT INTO {$tblprefix}fields VALUES ('1','subject','����','0','1','0','1','0','','1','main','','0','0','50','text','1','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('2','author','����','0','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('3','source','��Դ','0','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('4','keywords','�ؼ���','0','0','0','1','0','','1','main','','0','0','50','text','0','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('5','abstract','ժҪ','0','0','0','1','0','','1','main','','0','0','1000','multitext','0','0','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('6','thumb','����ͼ','0','0','0','1','0','','1','main','','0','0','0','image','0','0','0','','','','1','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('7','subject','����','1','1','0','1','0','','1','main','','0','0','50','text','1','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('8','author','����','1','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','2','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('9','source','��Դ','1','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','3','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('10','keywords','�ؼ���','1','0','0','1','0','','1','main','','0','0','50','text','0','1','','','','','0','0','4','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('11','abstract','ժҪ','1','0','0','1','0','','1','main','','0','0','1000','multitext','0','0','0','','','','0','0','5','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('12','thumb','����ͼ','1','0','0','1','0','','0','main','','0','0','0','image','0','0','0','','','','1','0','6','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('13','subtitle','������','1','0','1','0','0','','0','custom','','0','0','255','text','0','1','','','','','0','0','1','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('14','content','����','1','0','1','0','0','','1','custom','','0','0','0','htmltext','1','0','','','','','1','0','7','0','','','1','0','0');
INSERT INTO {$tblprefix}fields VALUES ('15','subject','����','2','1','0','1','0','','1','main','','0','0','50','text','1','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('16','author','����','2','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('17','source','��Դ','2','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('18','keywords','�ؼ���','2','0','0','1','0','','1','main','','0','0','50','text','0','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('19','abstract','ժҪ','2','0','0','1','0','','1','main','','0','0','1000','multitext','0','0','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('20','thumb','����ͼ','2','0','0','1','0','','1','main','','0','0','0','image','0','0','0','','','','1','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('21','subtitle','������','2','0','1','0','0','','0','custom','','0','0','255','text','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('22','content','��Ʒ���','2','0','1','0','0','','1','custom','','0','0','0','htmltext','1','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('23','subject','����','3','1','0','1','0','','1','main','','0','0','50','text','1','0','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('24','author','����','3','0','0','1','0','','1','main','','0','0','50','text','0','0','0','','','','0','0','2','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('25','source','��Դ','3','0','0','1','0','','1','main','','0','0','50','text','0','0','0','','','','0','0','3','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('26','keywords','�ؼ���','3','0','0','1','0','','1','main','','0','0','50','text','0','0','','','','','0','0','4','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('27','abstract','ժҪ','3','0','0','1','0','','1','main','','0','0','1000','multitext','0','0','0','','','','0','0','5','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('28','thumb','����ͼ','3','0','0','1','0','','1','main','','0','0','0','image','0','0','0','','','','1','0','6','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('29','subtitle','������','3','0','1','0','0','','1','custom','','0','0','255','text','0','1','','','','','0','0','1','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('30','content','����','3','0','1','0','0','','1','custom','','0','0','0','htmltext','1','0','','','','','1','0','7','0','','','1','0','0');
INSERT INTO {$tblprefix}fields VALUES ('31','subject','����','4','1','0','1','0','','1','main','','0','0','50','text','1','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('32','author','����','4','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('33','source','��Դ','4','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('34','keywords','�ؼ���','4','0','0','1','0','','1','main','','0','0','50','text','0','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('35','abstract','ժҪ','4','0','0','1','0','','1','main','','0','0','1000','multitext','0','0','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('36','thumb','����ͼ','4','0','0','1','0','','1','main','','0','0','0','image','0','0','0','','','','1','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('37','subtitle','������','4','0','1','0','0','','0','custom','','0','0','255','text','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('38','content','��Ʒ���','4','0','1','0','0','','1','custom','','0','0','0','htmltext','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('39','subject','����','5','1','0','1','0','','1','main','','0','0','50','text','1','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('40','author','����','5','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('41','source','��Դ','5','0','0','1','0','','1','main','','0','0','50','text','0','1','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('42','keywords','�ؼ���','5','0','0','1','0','','1','main','','0','0','50','text','0','1','','','','','0','0','0','1','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('43','abstract','ժҪ','5','0','0','1','0','','1','main','','0','0','1000','multitext','0','0','0','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('44','thumb','����ͼ','5','0','0','1','0','','1','main','','0','0','0','image','0','0','0','','','','1','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('45','subtitle','������','5','0','1','0','0','','0','custom','','0','0','255','text','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('46','content','��Ʒ���','5','0','1','0','0','','1','custom','','0','0','0','htmltext','1','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('47','tipimg','ͷ��ͼƬ','5','0','1','0','0','','1','custom','','0','0','0','image','0','0','','','','','0','0','0','0','ͼƬ���ؿ�����Ϊ950px','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('48','score_1','score_1','0','0','1','1','0','','1','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('49','score_1','score_1','4','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('50','score_1','score_1','3','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('51','score_1','score_1','2','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('52','score_1','score_1','5','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('53','score_1','score_1','1','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('54','score_2','score_2','0','0','1','1','0','','1','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('55','score_2','score_2','4','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('56','score_2','score_2','3','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('57','score_2','score_2','2','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('58','score_2','score_2','5','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('59','score_2','score_2','1','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','20','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('60','score_3','score_3','0','0','1','1','0','','1','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('61','score_3','score_3','4','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('62','score_3','score_3','3','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('63','score_3','score_3','2','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('64','score_3','score_3','5','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('65','score_3','score_3','1','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('66','score_4','score_4','0','0','1','1','0','','1','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('67','score_4','score_4','4','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('68','score_4','score_4','3','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('69','score_4','score_4','2','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('70','score_4','score_4','5','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('71','score_4','score_4','1','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('72','score_5','score_5','0','0','1','1','0','','1','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('73','score_5','score_5','4','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('74','score_5','score_5','3','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('75','score_5','score_5','2','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('76','score_5','score_5','5','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');
INSERT INTO {$tblprefix}fields VALUES ('77','score_5','score_5','1','0','1','1','0','','0','main','','0','0','0','int','0','0','','','','','0','0','0','0','','','0','0','0');

DROP TABLE IF EXISTS {$tblprefix}forders;
CREATE TABLE {$tblprefix}forders (
  foid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(30) NOT NULL,
  ordercells int(10) unsigned NOT NULL,
  checked tinyint(1) unsigned NOT NULL,
  editorid mediumint(8) unsigned NOT NULL,
  editor varchar(15) NOT NULL,
  createdate int(10) unsigned NOT NULL,
  orderdays int(10) unsigned NOT NULL DEFAULT '0',
  crid smallint(5) unsigned NOT NULL DEFAULT '0',
  crvalue int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (foid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}freeinfos;
CREATE TABLE {$tblprefix}freeinfos (
  fid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  sid smallint(6) unsigned NOT NULL DEFAULT '0',
  cname varchar(50) NOT NULL,
  tplname varchar(50) NOT NULL,
  arcurl varchar(80) NOT NULL,
  PRIMARY KEY (fid)
) TYPE=MyISAM AUTO_INCREMENT=17;

INSERT INTO {$tblprefix}freeinfos VALUES ('4','0','��������','notice_list.html','');
INSERT INTO {$tblprefix}freeinfos VALUES ('12','0','���¸����б��ĵ���','column_other_3.html','');

DROP TABLE IF EXISTS {$tblprefix}gmissions;
CREATE TABLE {$tblprefix}gmissions (
  gsid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL,
  gmid smallint(3) unsigned NOT NULL DEFAULT '0',
  sonid smallint(6) unsigned NOT NULL DEFAULT '0',
  pid smallint(6) unsigned NOT NULL DEFAULT '0',
  mcharset varchar(10) NOT NULL,
  timeout int(10) unsigned NOT NULL DEFAULT '5',
  mcookies varchar(255) NOT NULL,
  umode tinyint(1) unsigned NOT NULL DEFAULT '0',
  uurls mediumtext NOT NULL,
  uregular varchar(255) NOT NULL,
  ufromnum int(10) NOT NULL DEFAULT '1',
  utonum int(10) NOT NULL DEFAULT '2',
  ufrompage tinyint(1) unsigned NOT NULL DEFAULT '0',
  udesc tinyint(1) unsigned NOT NULL DEFAULT '0',
  uinclude varchar(255) NOT NULL,
  uforbid varchar(255) NOT NULL,
  uregion mediumtext NOT NULL,
  uspilit varchar(255) NOT NULL,
  uurltag varchar(255) NOT NULL,
  utitletag varchar(255) NOT NULL,
  uurltag1 varchar(255) NOT NULL,
  uinclude1 varchar(255) NOT NULL,
  uforbid1 varchar(255) NOT NULL,
  uurltag2 varchar(255) NOT NULL,
  uinclude2 varchar(255) NOT NULL,
  uforbid2 varchar(255) NOT NULL,
  mpfield varchar(50) NOT NULL,
  mpmode tinyint(1) unsigned NOT NULL DEFAULT '0',
  mptag varchar(255) NOT NULL,
  mpinclude varchar(255) NOT NULL,
  mpforbid varchar(255) NOT NULL,
  fsettings mediumtext NOT NULL,
  dvalues mediumtext NOT NULL,
  sid smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (gsid)
) TYPE=MyISAM AUTO_INCREMENT=33;

INSERT INTO {$tblprefix}gmissions VALUES ('21','������С˵','6','22','0','gbk','5','','0','','http://book.qingfo.com/modules/article/articlelist.php?class=2&page=(*)','1','1','0','0','','','<th width=\"20%\">��������</th>(*)</table>','</tr>','<td class=\"odd\"><a href=\"(*)\">','<td class=\"odd\"><a href=\"(?)\">(*)</a></td>','<a class=\"btnlink\" href=\"(*)\">','','','','','','','0','','','','a:4:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:77:\"<span style=\"font-size:16px; font-weight: bold; line-height: 150%\">(*)</span>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:6:\"author\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:15:\"��    �ߣ�</td>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:5:\"thumb\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:85:\"<td width=\"20%\" align=\"center\" valign=\"top\" style=\"font-size:13px\">\r\n		<img src=\"(*)\"\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:42:\"���ݼ�飺</span>(*)<span class=\"hottext\">\";s:11:\"fromreplace\";s:2:\"��\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:4:\"2,12\";}}','a:14:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:4:\"caid\";s:1:\"2\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:7:\"content\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";s:9:\"autothumb\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('22','�������½�','4','0','21','gbk','5','','0','','','0','0','1','0','','','<div id=\"BookText\">(*)<script(?)></SCRIPT>','<li>','<a href=\"(*)\">','\">(*)</a>','','','','','','','','0','','','','a:2:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:49:\"<div id=\"Title\"><h1><a href=\"(?)\">(?)</a>(*)</h1>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:43:\"<div class=\"content\" >(*)<div id=\"footbar\">\";s:11:\"fromreplace\";s:111:\"http://www.qingfo.com/(|)<script(*)</script>(|)</div>(|)<div(*)>(|)<font(*)</font>(|)���(|)<iframe(*)</iframe>\";s:9:\"toreplace\";s:15:\"(|)(|)(|)(|)(|)\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:12:\"1,4,5,7,8,13\";}}','a:14:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:9:\"autothumb\";s:1:\"0\";s:4:\"caid\";s:1:\"2\";s:6:\"author\";s:0:\"\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('23','�������С˵','6','24','0','gbk','5','','0','','http://book.qingfo.com/modules/article/articlelist.php?class=11&page=(*)','1','1','0','0','','','<th width=\"20%\">��������</th>(*)</table>','</tr>','<td class=\"odd\"><a href=\"(*)\">','<td class=\"odd\"><a href=\"(?)\">(*)</a></td>','<a class=\"btnlink\" href=\"(*)\">','','','','','','','0','','','','a:4:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:77:\"<span style=\"font-size:16px; font-weight: bold; line-height: 150%\">(*)</span>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:6:\"author\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:15:\"��    �ߣ�</td>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:5:\"thumb\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:85:\"<td width=\"20%\" align=\"center\" valign=\"top\" style=\"font-size:13px\">\r\n		<img src=\"(*)\"\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:42:\"���ݼ�飺</span>(*)<span class=\"hottext\">\";s:11:\"fromreplace\";s:2:\"��\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:4:\"2,12\";}}','a:13:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:4:\"caid\";s:1:\"3\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";s:9:\"autothumb\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('24','��������½�','4','0','23','gbk','5','','0','','','0','0','1','0','','','<div id=\"BookText\">(*)<script(?)></SCRIPT>','<li>','<a href=\"(*)\">','\">(*)</a>','','','','','','','','0','','','','a:2:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:49:\"<div id=\"Title\"><h1><a href=\"(?)\">(?)</a>(*)</h1>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:43:\"<div class=\"content\" >(*)<div id=\"footbar\">\";s:11:\"fromreplace\";s:111:\"http://www.qingfo.com/(|)<script(*)</script>(|)</div>(|)<div(*)>(|)<font(*)</font>(|)���(|)<iframe(*)</iframe>\";s:9:\"toreplace\";s:18:\"(|)(|)(|)(|)(|)(|)\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:12:\"1,4,5,7,8,13\";}}','a:14:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:9:\"autothumb\";s:1:\"0\";s:4:\"caid\";s:1:\"3\";s:6:\"author\";s:0:\"\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('25','�������С˵','6','26','0','gbk','5','','0','','http://book.qingfo.com/modules/article/articlelist.php?class=1&page=(*)','1','1','0','0','','','<th width=\"20%\">��������</th>(*)</table>','</tr>','<td class=\"odd\"><a href=\"(*)\">','<td class=\"odd\"><a href=\"(?)\">(*)</a></td>','<a class=\"btnlink\" href=\"(*)\">','','','','','','','0','','','','a:4:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:77:\"<span style=\"font-size:16px; font-weight: bold; line-height: 150%\">(*)</span>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:6:\"author\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:15:\"��    �ߣ�</td>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:5:\"thumb\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:85:\"<td width=\"20%\" align=\"center\" valign=\"top\" style=\"font-size:13px\">\r\n		<img src=\"(*)\"\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:42:\"���ݼ�飺</span>(*)<span class=\"hottext\">\";s:11:\"fromreplace\";s:2:\"��\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:4:\"2,12\";}}','a:13:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:4:\"caid\";s:1:\"4\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";s:9:\"autothumb\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('26','��������½�','4','0','25','gbk','5','','0','','','0','0','1','0','','','<div id=\"BookText\">(*)<script(?)></SCRIPT>','<li>','<a href=\"(*)\">','\">(*)</a>','','','','','','','','0','','','','a:2:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:49:\"<div id=\"Title\"><h1><a href=\"(?)\">(?)</a>(*)</h1>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:43:\"<div class=\"content\" >(*)<div id=\"footbar\">\";s:11:\"fromreplace\";s:111:\"http://www.qingfo.com/(|)<script(*)</script>(|)</div>(|)<div(*)>(|)<font(*)</font>(|)���(|)<iframe(*)</iframe>\";s:9:\"toreplace\";s:18:\"(|)(|)(|)(|)(|)(|)\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:12:\"1,4,5,7,8,13\";}}','a:14:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:9:\"autothumb\";s:1:\"0\";s:4:\"caid\";s:1:\"4\";s:6:\"author\";s:0:\"\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('20','��ƪ����','7','0','0','gbk','5','','0','','http://www.duwenzhang.com/wenzhang/xiaoyuanwenzhang/list_4_(*).html','5','6','0','0','','','��ǰλ�ã�(*)��ҳ','<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"tbspan\" style=\"margin-top:6px\">','<a href=\"(*)\"','class=\"ulink\">(*)</a>','','','','','','','','0','','','','a:3:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:12:\"<h1>(*)</h1>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:6:\"author\";a:8:{s:8:\"frompage\";s:1:\"1\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:0:\"\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:32:\"<div id=\"wenzhangziti\">(*)</div>\";s:11:\"fromreplace\";s:8:\"<IMG(*)>\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:24:\"1,3,4,5,6,7,8,9,10,11,13\";}}','a:14:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:9:\"autothumb\";s:1:\"0\";s:4:\"caid\";s:2:\"10\";s:8:\"subtitle\";s:0:\"\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('27','�����ʷС˵','6','28','0','gbk','5','','0','','http://book.qingfo.com/modules/article/articlelist.php?class=5&page=(*)','1','1','0','0','','','<th width=\"20%\">��������</th>(*)</table>','</tr>','<td class=\"odd\"><a href=\"(*)\">','<td class=\"odd\"><a href=\"(?)\">(*)</a></td>','<a class=\"btnlink\" href=\"(*)\">','','','','','','','0','','','','a:4:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:77:\"<span style=\"font-size:16px; font-weight: bold; line-height: 150%\">(*)</span>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:6:\"author\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:15:\"��    �ߣ�</td>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:5:\"thumb\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:85:\"<td width=\"20%\" align=\"center\" valign=\"top\" style=\"font-size:13px\">\r\n		<img src=\"(*)\"\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:42:\"���ݼ�飺</span>(*)<span class=\"hottext\">\";s:11:\"fromreplace\";s:2:\"��\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:4:\"2,12\";}}','a:13:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:4:\"caid\";s:1:\"6\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";s:9:\"autothumb\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('28','�����ʷ�½�','4','0','27','gbk','5','','0','','','0','0','1','0','','','<div id=\"BookText\">(*)<script(?)></SCRIPT>','<li>','<a href=\"(*)\">','\">(*)</a>','','','','','','','','0','','','','a:2:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:49:\"<div id=\"Title\"><h1><a href=\"(?)\">(?)</a>(*)</h1>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:43:\"<div class=\"content\" >(*)<div id=\"footbar\">\";s:11:\"fromreplace\";s:111:\"http://www.qingfo.com/(|)<script(*)</script>(|)</div>(|)<div(*)>(|)<font(*)</font>(|)���(|)<iframe(*)</iframe>\";s:9:\"toreplace\";s:18:\"(|)(|)(|)(|)(|)(|)\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:12:\"1,4,5,7,8,13\";}}','a:14:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:9:\"autothumb\";s:1:\"0\";s:4:\"caid\";s:1:\"6\";s:6:\"author\";s:0:\"\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('29','���ƻ�С˵','6','30','0','gbk','5','','0','','http://book.qingfo.com/modules/article/articlelist.php?class=7&page=(*)','1','1','0','0','','','<th width=\"20%\">��������</th>(*)</table>','</tr>','<td class=\"odd\"><a href=\"(*)\">','<td class=\"odd\"><a href=\"(?)\">(*)</a></td>','<a class=\"btnlink\" href=\"(*)\">','','','','','','','0','','','','a:4:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:77:\"<span style=\"font-size:16px; font-weight: bold; line-height: 150%\">(*)</span>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:6:\"author\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:15:\"��    �ߣ�</td>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:5:\"thumb\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:85:\"<td width=\"20%\" align=\"center\" valign=\"top\" style=\"font-size:13px\">\r\n		<img src=\"(*)\"\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:42:\"���ݼ�飺</span>(*)<span class=\"hottext\">\";s:11:\"fromreplace\";s:2:\"��\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:4:\"2,12\";}}','a:13:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:4:\"caid\";s:1:\"5\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";s:9:\"autothumb\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('30','���ƻ��½�','4','0','29','gbk','5','','0','','','0','0','1','0','','','<div id=\"BookText\">(*)<script(?)></SCRIPT>','<li>','<a href=\"(*)\">','\">(*)</a>','','','','','','','','0','','','','a:2:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:49:\"<div id=\"Title\"><h1><a href=\"(?)\">(?)</a>(*)</h1>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:43:\"<div class=\"content\" >(*)<div id=\"footbar\">\";s:11:\"fromreplace\";s:111:\"http://www.qingfo.com/(|)<script(*)</script>(|)</div>(|)<div(*)>(|)<font(*)</font>(|)���(|)<iframe(*)</iframe>\";s:9:\"toreplace\";s:18:\"(|)(|)(|)(|)(|)(|)\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:12:\"1,4,5,7,8,13\";}}','a:14:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:9:\"autothumb\";s:1:\"0\";s:4:\"caid\";s:1:\"5\";s:6:\"author\";s:0:\"\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('31','��羪�С˵','6','32','0','gbk','5','','0','','http://book.qingfo.com/modules/article/articlelist.php?class=6&page=(*)','1','1','0','0','','','<th width=\"20%\">��������</th>(*)</table>','</tr>','<td class=\"odd\"><a href=\"(*)\">','<td class=\"odd\"><a href=\"(?)\">(*)</a></td>','<a class=\"btnlink\" href=\"(*)\">','','','','','','','0','','','','a:4:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:77:\"<span style=\"font-size:16px; font-weight: bold; line-height: 150%\">(*)</span>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:6:\"author\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:15:\"��    �ߣ�</td>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:5:\"thumb\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:85:\"<td width=\"20%\" align=\"center\" valign=\"top\" style=\"font-size:13px\">\r\n		<img src=\"(*)\"\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:0:\"\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:42:\"���ݼ�飺</span>(*)<span class=\"hottext\">\";s:11:\"fromreplace\";s:2:\"��\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:4:\"2,12\";}}','a:13:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:4:\"caid\";s:1:\"7\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";s:9:\"autothumb\";s:1:\"0\";}','0');
INSERT INTO {$tblprefix}gmissions VALUES ('32','��羪��½�','4','0','31','gbk','5','','0','','','0','0','1','0','','','<div id=\"BookText\">(*)<script(?)></SCRIPT>','<li>','<a href=\"(*)\">','\">(*)</a>','','','','','','','','0','','','','a:2:{s:7:\"subject\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:49:\"<div id=\"Title\"><h1><a href=\"(?)\">(?)</a>(*)</h1>\";s:11:\"fromreplace\";s:0:\"\";s:9:\"toreplace\";s:0:\"\";s:4:\"rpid\";s:1:\"0\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:2:\"12\";}s:7:\"content\";a:8:{s:8:\"frompage\";s:1:\"0\";s:4:\"func\";s:0:\"\";s:4:\"ftag\";s:43:\"<div class=\"content\" >(*)<div id=\"footbar\">\";s:11:\"fromreplace\";s:111:\"http://www.qingfo.com/(|)<script(*)</script>(|)</div>(|)<div(*)>(|)<font(*)</font>(|)���(|)<iframe(*)</iframe>\";s:9:\"toreplace\";s:18:\"(|)(|)(|)(|)(|)(|)\";s:4:\"rpid\";s:1:\"1\";s:8:\"jumpfile\";s:0:\"\";s:9:\"clearhtml\";s:12:\"1,4,5,7,8,13\";}}','a:14:{s:5:\"musts\";s:7:\"subject\";s:12:\"autoabstract\";s:1:\"1\";s:9:\"autothumb\";s:1:\"0\";s:4:\"caid\";s:1:\"7\";s:6:\"author\";s:0:\"\";s:6:\"source\";s:0:\"\";s:8:\"keywords\";s:0:\"\";s:5:\"ccid1\";s:1:\"0\";s:5:\"ccid2\";s:1:\"0\";s:5:\"ccid3\";s:1:\"0\";s:5:\"ccid4\";s:1:\"0\";s:5:\"ccid5\";s:1:\"0\";s:5:\"ccid7\";s:1:\"0\";s:5:\"ccid6\";s:1:\"0\";}','0');

DROP TABLE IF EXISTS {$tblprefix}gmodels;
CREATE TABLE {$tblprefix}gmodels (
  gmid smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  sid smallint(6) unsigned NOT NULL DEFAULT '0',
  cname varchar(50) NOT NULL,
  chid smallint(6) unsigned NOT NULL DEFAULT '0',
  atid smallint(6) unsigned NOT NULL DEFAULT '0',
  gfields text NOT NULL,
  PRIMARY KEY (gmid)
) TYPE=MyISAM AUTO_INCREMENT=8;

INSERT INTO {$tblprefix}gmodels VALUES ('6','0','����С˵','4','0','a:4:{s:7:\"subject\";i:0;s:6:\"author\";i:0;s:5:\"thumb\";i:1;s:7:\"content\";i:0;}');
INSERT INTO {$tblprefix}gmodels VALUES ('7','0','��ƪ����','3','0','a:3:{s:7:\"subject\";i:0;s:6:\"author\";i:0;s:7:\"content\";i:0;}');
INSERT INTO {$tblprefix}gmodels VALUES ('4','0','�½�����','1','0','a:2:{s:7:\"subject\";i:0;s:7:\"content\";i:0;}');

DROP TABLE IF EXISTS {$tblprefix}grouptypes;
CREATE TABLE {$tblprefix}grouptypes (
  gtid int(3) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  forbidden tinyint(1) unsigned NOT NULL DEFAULT '0',
  afunction tinyint(1) unsigned NOT NULL DEFAULT '0',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  crid smallint(3) unsigned NOT NULL DEFAULT '0',
  mchids varchar(255) NOT NULL,
  allowance tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (gtid)
) TYPE=MyISAM AUTO_INCREMENT=7;

INSERT INTO {$tblprefix}grouptypes VALUES ('1','������ϵ','1','1','0','1','0','','0');
INSERT INTO {$tblprefix}grouptypes VALUES ('2','������ϵ','1','0','1','1','0','5','0');
INSERT INTO {$tblprefix}grouptypes VALUES ('3','��Ա��ϵ','0','0','0','2','1','','1');
INSERT INTO {$tblprefix}grouptypes VALUES ('5','������ϵ','0','0','0','1','0','','0');
INSERT INTO {$tblprefix}grouptypes VALUES ('6','VIP��ϵ','0','0','0','3','0','','0');

DROP TABLE IF EXISTS {$tblprefix}gurls;
CREATE TABLE {$tblprefix}gurls (
  guid mediumint(12) NOT NULL AUTO_INCREMENT,
  sid smallint(6) unsigned NOT NULL DEFAULT '0',
  pid mediumint(8) unsigned NOT NULL DEFAULT '0',
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  abover tinyint(8) unsigned NOT NULL DEFAULT '0',
  gurl varchar(255) NOT NULL,
  utitle varchar(255) NOT NULL,
  gurl1 varchar(255) NOT NULL,
  gurl2 varchar(255) NOT NULL,
  gsid smallint(3) unsigned NOT NULL DEFAULT '0',
  adddate int(10) unsigned NOT NULL DEFAULT '0',
  gatherdate int(10) unsigned NOT NULL DEFAULT '0',
  outputdate int(10) unsigned NOT NULL DEFAULT '0',
  contents mediumtext NOT NULL,
  ufids varchar(255) NOT NULL,
  PRIMARY KEY (guid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}inmurls;
CREATE TABLE {$tblprefix}inmurls (
  imuid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  remark varchar(80) NOT NULL,
  uclass varchar(15) NOT NULL,
  issys tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  url varchar(255) NOT NULL,
  setting text NOT NULL,
  tplname varchar(50) NOT NULL,
  onlyview tinyint(1) unsigned NOT NULL DEFAULT '0',
  mtitle varchar(80) NOT NULL,
  guide text NOT NULL,
  isbk tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (imuid)
) TYPE=MyISAM AUTO_INCREMENT=104;

INSERT INTO {$tblprefix}inmurls VALUES ('1','�༭','�༭�༭�༭','adetail','1','1','0','?action=archive&nimuid=1&aid=','a:1:{s:5:\"lists\";s:134:\"ccid1,ccid2,ccid3,ccid4,ccid5,ccid7,ucid,cpupdate,subject,author,source,keywords,abstract,thumb,subtitle,content,tipimg,salecp,fsalecp\";}','','0','','','0');
INSERT INTO {$tblprefix}inmurls VALUES ('2','�鼭','�鼭�鼭�鼭','setalbum','1','1','0','?action=setalbum&nimuid=2&aid=','a:4:{s:5:\"chids\";s:0:\"\";s:4:\"sids\";s:0:\"\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inmurls VALUES ('3','����','�ϼ����������ݵĹ���','content','1','1','0','?action=inarchives&nimuid=3&aid=','a:5:{s:4:\"sids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:41:\"catalog,channel,incheck,adddate,view,edit\";s:8:\"operates\";s:25:\"inclear,incheck,inuncheck\";}','','0','','','0');
INSERT INTO {$tblprefix}inmurls VALUES ('4','����','���������ĵ�����ǰ�ϼ�','load','1','1','0','?action=loadold&nimuid=4&aid=','a:4:{s:5:\"chids\";s:0:\"\";s:4:\"sids\";s:0:\"\";s:7:\"filters\";s:15:\"channel,catalog\";s:5:\"lists\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inmurls VALUES ('5','���','�ϼ���������ĵ�','inadd','1','1','0','addpre.php?nimuid=5&aid=','','','0','','','0');
INSERT INTO {$tblprefix}inmurls VALUES ('6','�ظ�','��ǰ�ĵ��յ����лظ�','replys','1','1','0','?action=inreplys&nimuid=6&aid=','a:4:{s:7:\"checked\";s:2:\"-1\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:0:\"\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inmurls VALUES ('7','��','��ǰ���ʵ����д�','answers','1','1','0','?action=inanswers&nimuid=7&aid=','a:3:{s:7:\"checked\";s:2:\"-1\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inmurls VALUES ('8','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('9','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('10','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('11','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('12','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('13','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('14','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('15','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('16','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('17','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('18','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('19','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('20','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('21','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('22','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('23','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('24','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('25','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('26','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('27','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('28','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('29','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('30','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('31','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('32','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('33','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('34','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('35','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('36','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('37','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('38','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('39','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('40','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('41','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('42','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('43','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('44','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('45','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('46','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('47','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('48','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('49','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('50','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('51','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('52','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('53','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('54','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('55','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('56','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('57','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('58','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('59','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('60','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('61','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('62','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('63','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('64','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('65','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('66','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('67','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('68','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('69','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('70','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('71','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('72','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('73','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('74','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('75','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('76','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('77','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('78','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('79','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('80','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('81','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('82','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('83','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('84','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('85','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('86','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('87','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('88','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('89','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('90','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('91','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('92','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('93','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('94','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('95','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('96','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('97','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('98','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('99','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('100','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inmurls VALUES ('101','����','С˵�������ݹ���','content','0','1','0','?action=inarchives&nimuid=101&aid=','a:5:{s:4:\"sids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:7:\"channel\";s:5:\"lists\";s:29:\"incheck,vol,adddate,view,edit\";s:8:\"operates\";s:28:\"delete,incheck,inuncheck,vol\";}','','0','','','0');
INSERT INTO {$tblprefix}inmurls VALUES ('103','�־�','�־����','custom','0','1','0','?action=nv_vols&aid=','a:1:{s:9:\"customurl\";s:15:\"?action=nv_vols\";}','','0','','','0');

DROP TABLE IF EXISTS {$tblprefix}inurls;
CREATE TABLE {$tblprefix}inurls (
  iuid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  remark varchar(80) NOT NULL,
  uclass varchar(15) NOT NULL,
  issys tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  url varchar(255) NOT NULL,
  setting text NOT NULL,
  tplname varchar(50) NOT NULL,
  onlyview tinyint(1) unsigned NOT NULL DEFAULT '0',
  mtitle varchar(50) NOT NULL,
  guide text NOT NULL,
  isbk tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (iuid)
) TYPE=MyISAM AUTO_INCREMENT=103;

INSERT INTO {$tblprefix}inurls VALUES ('1','�鼭','�鼭�鼭�鼭�鼭','setalbum','1','1','2','?entry=inarchive&action=setalbum&niuid=1&aid=','a:4:{s:5:\"chids\";s:0:\"\";s:4:\"sids\";s:0:\"\";s:7:\"filters\";s:15:\"channel,catalog\";s:5:\"lists\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('2','','','','1','1','3','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('3','����','���ڼ����ĵ���ϼ�','load','1','1','5','?entry=inarchive&action=loadold&niuid=3&aid=','a:4:{s:5:\"chids\";s:0:\"\";s:4:\"sids\";s:0:\"\";s:7:\"filters\";s:15:\"channel,catalog\";s:5:\"lists\";s:34:\"mname,catalog,channel,subsite,view\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('4','�Զ�','�Զ����ڹ�������','custom','1','0','100','?entry=test&aid=','a:1:{s:9:\"customurl\";s:16:\"?entry=test&aid=\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('5','����','��������','comments','1','1','6','?entry=inarchive&action=comments&niuid=5&aid=','a:4:{s:7:\"checked\";s:2:\"-1\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:0:\"\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('6','����','����������','purchases','1','1','9','?entry=inarchive&action=purchases&niuid=6&aid=','','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('7','��','���ڴ�','answers','1','1','10','?entry=inarchive&action=answers&niuid=7&aid=','a:3:{s:7:\"checked\";s:2:\"-1\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:30:\"mname,check,award,adddate,edit\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('8','���','���ڲ�ָ�����͵����','inadd','1','1','1','?entry=addpre&niuid=8&aid=','','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('9','����','�����ĵ���ϼ��Ĺ���','content','1','1','4','?entry=inarchive&action=archives&niuid=9&aid=','a:5:{s:4:\"sids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:20:\"incheck,adddate,view\";s:8:\"operates\";s:25:\"inclear,incheck,inuncheck\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('10','����','ָ���ĵ��ı�����Ϣ����','offers','1','1','8','?entry=inarchive&action=offers&niuid=10&aid=','a:5:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:40:\"mname,oprice,check,valid,updatedate,edit\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('11','�ظ�','ָ���ĵ��Ļظ���Ϣ����','replys','1','1','7','?entry=inarchive&action=replys&niuid=11&aid=','a:4:{s:7:\"checked\";s:2:\"-1\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:35:\"mname,check,adddate,updatedate,edit\";s:8:\"operates\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('12','�ٱ�','ָ���ĵ��ľٱ���Ϣ����','reports','1','1','11','?entry=inarchive&action=reports&niuid=12&aid=','a:1:{s:5:\"lists\";s:0:\"\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('13','�༭','�ĵ�������༭','adetail','1','1','0','?entry=archive&action=archivedetail&niuid=13&aid=','a:1:{s:5:\"lists\";s:62:\"subject,author,source,keywords,abstract,thumb,subtitle,content\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('14','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('15','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('16','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('17','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('18','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('19','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('20','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('21','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('22','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('23','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('24','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('25','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('26','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('27','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('28','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('29','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('30','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('31','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('32','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('33','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('34','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('35','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('36','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('37','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('38','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('39','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('40','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('41','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('42','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('43','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('44','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('45','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('46','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('47','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('48','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('49','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('50','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('51','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('52','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('53','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('54','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('55','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('56','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('57','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('58','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('59','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('60','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('61','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('62','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('63','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('64','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('65','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('66','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('67','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('68','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('69','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('70','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('71','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('72','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('73','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('74','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('75','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('76','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('77','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('78','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('79','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('80','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('81','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('82','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('83','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('84','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('85','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('86','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('87','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('88','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('89','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('90','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('91','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('92','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('93','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('94','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('95','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('96','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('97','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('98','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('99','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('100','','','','1','1','0','','','','0','','','1');
INSERT INTO {$tblprefix}inurls VALUES ('101','�½ڹ���','С˵�½ڹ���','content','0','1','0','?entry=inarchive&action=archives&niuid=101&aid=','a:5:{s:4:\"sids\";s:0:\"\";s:5:\"chids\";s:1:\"1\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:29:\"incheck,vol,adddate,view,edit\";s:8:\"operates\";s:34:\"delete,incheck,inuncheck,vol,ccid3\";}','','0','','','0');
INSERT INTO {$tblprefix}inurls VALUES ('102','�־�','��ӷ־�','custom','0','1','0','?entry=nv_vols&aid=','a:1:{s:9:\"customurl\";s:14:\"?entry=nv_vols\";}','','0','','','0');

DROP TABLE IF EXISTS {$tblprefix}keywords;
CREATE TABLE {$tblprefix}keywords (
  keyword varchar(20) NOT NULL,
  pcs int(10) unsigned NOT NULL DEFAULT '1',
  KEY keyword (keyword),
  KEY aid (pcs)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}localfiles;
CREATE TABLE {$tblprefix}localfiles (
  lfid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  extname char(10) NOT NULL,
  ftype char(10) NOT NULL,
  islocal tinyint(1) unsigned NOT NULL DEFAULT '0',
  maxsize int(10) unsigned NOT NULL DEFAULT '0',
  minisize int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (lfid)
) TYPE=MyISAM AUTO_INCREMENT=23;

INSERT INTO {$tblprefix}localfiles VALUES ('3','gif','image','1','500','1');
INSERT INTO {$tblprefix}localfiles VALUES ('2','jpg','image','1','500','1');
INSERT INTO {$tblprefix}localfiles VALUES ('4','swf','flash','1','10000','10');
INSERT INTO {$tblprefix}localfiles VALUES ('5','fla','flash','1','10000','10');
INSERT INTO {$tblprefix}localfiles VALUES ('6','png','image','1','500','1');
INSERT INTO {$tblprefix}localfiles VALUES ('7','jpeg','image','0','500','1');
INSERT INTO {$tblprefix}localfiles VALUES ('8','bmp','image','0','500','1');
INSERT INTO {$tblprefix}localfiles VALUES ('10','wmv','media','1','60000','1000');
INSERT INTO {$tblprefix}localfiles VALUES ('11','asf','media','1','60000','1000');
INSERT INTO {$tblprefix}localfiles VALUES ('12','wma','media','1','60000','1000');
INSERT INTO {$tblprefix}localfiles VALUES ('13','mpeg','media','0','60000','1000');
INSERT INTO {$tblprefix}localfiles VALUES ('14','rmvb','media','1','60000','100');
INSERT INTO {$tblprefix}localfiles VALUES ('15','zip','file','1','50000','1');
INSERT INTO {$tblprefix}localfiles VALUES ('16','rar','file','1','20000','1');
INSERT INTO {$tblprefix}localfiles VALUES ('19','txt','file','1','20','0');
INSERT INTO {$tblprefix}localfiles VALUES ('20','doc','file','0','100','1');
INSERT INTO {$tblprefix}localfiles VALUES ('21','mpg','media','0','300000','200');
INSERT INTO {$tblprefix}localfiles VALUES ('22','exe','file','0','100','1');

DROP TABLE IF EXISTS {$tblprefix}logerrortimes;
CREATE TABLE {$tblprefix}logerrortimes (
  mname char(15) NOT NULL,
  logip int(10) NOT NULL,
  errortime int(10) unsigned NOT NULL,
  times tinyint(1) unsigned NOT NULL,
  KEY mname (mname)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mafields;
CREATE TABLE {$tblprefix}mafields (
  fid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL,
  ename char(30) NOT NULL DEFAULT '',
  matid smallint(6) unsigned NOT NULL DEFAULT '0',
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  iscustom tinyint(1) unsigned NOT NULL DEFAULT '1',
  mcommon tinyint(1) unsigned NOT NULL DEFAULT '0',
  isfunc tinyint(1) unsigned NOT NULL DEFAULT '0',
  func text NOT NULL,
  tbl varchar(10) NOT NULL DEFAULT 'main',
  innertext text NOT NULL,
  fromcode tinyint(1) unsigned NOT NULL DEFAULT '0',
  issearch tinyint(1) unsigned NOT NULL DEFAULT '0',
  length smallint(6) unsigned NOT NULL DEFAULT '0',
  datatype varchar(15) NOT NULL,
  notnull tinyint(1) unsigned NOT NULL DEFAULT '0',
  nohtml tinyint(1) unsigned NOT NULL DEFAULT '0',
  mlimit varchar(15) NOT NULL DEFAULT '0',
  regular varchar(80) NOT NULL,
  min varchar(15) NOT NULL,
  max varchar(15) NOT NULL,
  rpid smallint(5) unsigned NOT NULL DEFAULT '0',
  isadmin tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  guide varchar(80) NOT NULL,
  vdefault varchar(255) NOT NULL DEFAULT '',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  useredit tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (fid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}matypes;
CREATE TABLE {$tblprefix}matypes (
  matid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL,
  autocheck tinyint(1) unsigned NOT NULL DEFAULT '0',
  autostatic tinyint(1) unsigned NOT NULL DEFAULT '0',
  allowupdate tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  apmid smallint(6) unsigned NOT NULL DEFAULT '0',
  rpmid smallint(6) unsigned NOT NULL DEFAULT '0',
  arctpl varchar(50) NOT NULL,
  parctpl varchar(50) NOT NULL,
  srhtpl varchar(50) NOT NULL,
  addtpl varchar(50) NOT NULL,
  PRIMARY KEY (matid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mcatalogs;
CREATE TABLE {$tblprefix}mcatalogs (
  mcaid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL DEFAULT '',
  maxucid smallint(6) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(5) unsigned NOT NULL DEFAULT '0',
  remark varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (mcaid)
) TYPE=MyISAM AUTO_INCREMENT=5;

INSERT INTO {$tblprefix}mcatalogs VALUES ('1','����С˵','5','0','');
INSERT INTO {$tblprefix}mcatalogs VALUES ('2','ɢ����','5','0','');
INSERT INTO {$tblprefix}mcatalogs VALUES ('3','������','5','0','');
INSERT INTO {$tblprefix}mcatalogs VALUES ('4','��ƪС˵','5','0','');

DROP TABLE IF EXISTS {$tblprefix}mchannels;
CREATE TABLE {$tblprefix}mchannels (
  mchid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  cname char(30) NOT NULL,
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  userforbidadd tinyint(1) unsigned NOT NULL DEFAULT '0',
  autocheck tinyint(1) unsigned NOT NULL DEFAULT '0',
  reply smallint(6) unsigned NOT NULL DEFAULT '0',
  `comment` smallint(6) unsigned NOT NULL DEFAULT '0',
  srhtpl varchar(50) NOT NULL DEFAULT '',
  addtpl varchar(50) NOT NULL DEFAULT '',
  acoids varchar(255) NOT NULL DEFAULT '',
  ccoids varchar(255) NOT NULL DEFAULT '',
  additems text NOT NULL,
  useredits text NOT NULL,
  PRIMARY KEY (mchid)
) TYPE=MyISAM AUTO_INCREMENT=2;

INSERT INTO {$tblprefix}mchannels VALUES ('1','������Ա','0','1','0','1','0','0','','register.html','','','mtcid,nicename,truename,gender,birthday,photo,intro','mtcid,nicename,truename,gender,birthday,photo,intro');

DROP TABLE IF EXISTS {$tblprefix}mcomments;
CREATE TABLE {$tblprefix}mcomments (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  fromid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fromname varchar(15) NOT NULL DEFAULT '',
  ucid mediumint(8) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  areply tinyint(1) unsigned NOT NULL DEFAULT '0',
  aread tinyint(1) unsigned NOT NULL DEFAULT '0',
  uread tinyint(1) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mcommus;
CREATE TABLE {$tblprefix}mcommus (
  cuid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL DEFAULT '',
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  cclass varchar(30) NOT NULL DEFAULT '',
  setting text NOT NULL,
  func text NOT NULL,
  cutpl varchar(50) NOT NULL DEFAULT '',
  addtpl varchar(50) NOT NULL DEFAULT '',
  sortable tinyint(1) unsigned NOT NULL DEFAULT '0',
  addable tinyint(1) unsigned NOT NULL DEFAULT '0',
  ch tinyint(1) unsigned NOT NULL DEFAULT '0',
  isbk tinyint(1) unsigned NOT NULL DEFAULT '0',
  ucadd varchar(80) NOT NULL,
  ucvote varchar(80) NOT NULL,
  uadetail varchar(80) NOT NULL,
  umdetail varchar(80) NOT NULL,
  usetting text NOT NULL,
  uconfig varchar(80) NOT NULL,
  PRIMARY KEY (cuid)
) TYPE=MyISAM AUTO_INCREMENT=11;

INSERT INTO {$tblprefix}mcommus VALUES ('1','����','1','1','score','','','','','0','0','0','0','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('2','����','1','1','friend','','','','','1','0','0','0','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('3','��������','1','1','flink','','','','','1','1','0','0','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('4','����','1','1','comment','','','','','1','1','1','0','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('5','�ظ�','1','1','reply','','','','','1','1','1','0','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('6','�ٱ�','1','1','report','','','','','0','1','0','0','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('7','�ղ�','1','1','favorite','','','','','1','0','0','0','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('8','','1','1','','','','','','0','0','0','1','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('9','','1','1','','','','','','0','0','0','1','','','','','','');
INSERT INTO {$tblprefix}mcommus VALUES ('10','','1','1','','','','','','0','0','0','1','','','','','','');

DROP TABLE IF EXISTS {$tblprefix}mconfigs;
CREATE TABLE {$tblprefix}mconfigs (
  varname varchar(30) NOT NULL,
  `value` text NOT NULL,
  cftype char(10) NOT NULL,
  PRIMARY KEY (varname)
) TYPE=MyISAM;

INSERT INTO {$tblprefix}mconfigs VALUES ('cms_icpno','<a href=\"http://www.miibeian.gov.cn\" target=\"_blank\">��ICP��09026950��</a>','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('cmslogo','images/common/logo.gif','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('bazscert','����֤��bazs.cert�ļ�','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('copyright','Copyright &#169; 2008-2012 <a href=\"http://www.08cms.com\" target=\"_blank\">08cms.com</a> All rights reserved.<br>','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('hostname','С˵վϵͳչʾ by 08cms','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('hosturl','http://192.168.1.60','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('cmsname','08CMSϵͳ��վ','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('cmsurl','/inovel/','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('rewritephp','','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cmstitle','��Դ,���,PHP��վ����ϵͳ','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('cmskeyword','��վ����ϵͳ cms ��Դ ��� ��վϵͳ ���¹���ϵͳ �Զ���ģ�� ���ط���cms �ʰɹ���ϵͳ �����̵�ϵͳ','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('cmsdescription','08CMS���ж��ص��������,��ȫ���û��Զ����ĵ�ģ��,����X����������Ŀϵͳ,�û��Զ������ϵͳ�ϼ�,�Զ���ģ�͵���վ������Ϣ����ϵͳ,��ȫ���滯��ģ�����ϵͳ,��Ŀ����������ĵ�ģ�ͻ���','site');
INSERT INTO {$tblprefix}mconfigs VALUES ('cmsclosed','0','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('cmsclosedreason','���ڽ�����վά�������Ժ��ٷ��ʣ�лл���٣�','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('registerclosed','0','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('regclosedreason','��վ��ͣע���»�Ա������������վ����Ŀ���ע��֪ͨ��','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('censoruser','*����Ա*\r\n*��ʼ��*\r\n','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('regcode_width','60','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('regcode_height','20','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('arcautoabstract','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('arcautothumb','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('hotkeywords','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('timezone','-8','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('virtualurl','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('dir_userfile','userfiles','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('path_userfile','day','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('backupdir','c4c8ac','');
INSERT INTO {$tblprefix}mconfigs VALUES ('watermarktype','1','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('upload_nouser','0','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('cu_nowmonth','3','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('last_patch','20100225','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('watermarkstatus','0','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('authkey','fe15445imGbJ68oI','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('watermarktrans','65','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('watermarkquality','80','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('gzipenable','1','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('dateformat','Y-n-j','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('timeformat','H:i','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('msgforwordtime','1500','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('atpp','15','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mrowpp','10','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mmaxpage','100','center');
INSERT INTO {$tblprefix}mconfigs VALUES ('templatedir','default','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('htmldir','html','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cache1circle','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cache2circle','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('liststaticnum','5','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('listcachenum','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('archtmlmode','day','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cachemscircle','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mslistcachenum','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('adminipaccess','','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('rss_enabled','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('enableupdatecheck','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('enableupdatecopy','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('autoabstractlength','200','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('debugtag','1','tpl');
INSERT INTO {$tblprefix}mconfigs VALUES ('commentmaxlength','0','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('commentminlength','0','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('enabelstat','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('clickscachetime','10','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('mclickscircle','20','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('onlinehold','900','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('onlinetimecircle','10','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('hometpl','index.html','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('maxerrtimes','3','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('cnodestatcircle','12','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('albumstatcircle','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('onlineautosaving','1','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('cfg_paymode','0','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('cartkey','QJGVMsVca666sy7Yk4zDJ1zVGOL0932i','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('player_width','500','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('player_height','400','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('enable_pptout','0','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptout_file','phpwind','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptout_charset','gbk','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptout_url','http://192.168.1.60/pw632/','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptout_key','4XSaL4BaJWnCKX26','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('enable_pptin','0','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptin_url','http://192.168.1.60/ihbcms/','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptin_register','register.php','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptin_login','login.php','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptin_logout','login.php?action=logout','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptin_key','P9ZXKrHGpFCG9vGx','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('pptin_expire','60','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('rss_ttl','30','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('search_max','200','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('search_repeat','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('atm_smallsite','','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('cms_regcode','register,admin,comment,answer,payonline','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('mcenterlogo','','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('amsgforwordtime','1500','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mmsgforwordtime','1500','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mcforbids','','center');
INSERT INTO {$tblprefix}mconfigs VALUES ('uclasslength','20','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_api','http://192.168.1.60/ucenter','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('enable_uc','0','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('clearoldcache','12','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('enablestatic','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('enableship','1','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('enablestock','1','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('cartmaxlimited','10','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('cachejscircle','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('jsrefsource','','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cnprow','10','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('sid_self','0','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('outextcredits','a:2:{i:0;a:8:{s:9:\"appiddesc\";s:1:\"6\";s:10:\"creditdesc\";s:1:\"2\";s:9:\"creditsrc\";s:1:\"2\";s:5:\"title\";s:12:\"Discuz! ��Ǯ\";s:4:\"unit\";s:2:\"��\";s:8:\"ratiosrc\";s:2:\"10\";s:9:\"ratiodesc\";s:2:\"10\";s:5:\"ratio\";s:1:\"1\";}i:1;a:8:{s:9:\"appiddesc\";s:1:\"5\";s:10:\"creditdesc\";s:1:\"1\";s:9:\"creditsrc\";s:1:\"1\";s:5:\"title\";s:13:\"���˼�԰ ����\";s:4:\"unit\";s:2:\"��\";s:8:\"ratiosrc\";s:1:\"1\";s:9:\"ratiodesc\";s:1:\"1\";s:5:\"ratio\";s:1:\"1\";}}','uc');
INSERT INTO {$tblprefix}mconfigs VALUES ('autorelates','','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('atmbrowser','1','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('catahidden','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mspacedisabled','0','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_smtp','smtp.qq.com','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_ip','192.168.1.60','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_dbhost','localhost','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_dbname','ucenter','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_dbuser','root','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_dbpwd','','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_dbpre','uc_','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_appid','2','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('uc_key','73P9dd4cy8abgb72k67417785168Oda191EbK4Qe8aM1Zea3pc45weYcY0Senei1','ppt');
INSERT INTO {$tblprefix}mconfigs VALUES ('cms_upurl','http://www.08cms.com','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_enabled','0','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_host','192.168.1.55','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_port','21','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_user','08cms','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_password','','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_timeout','0','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_pasv','0','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_ssl','0','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_dir','/','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('ftp_url','http://ftp.z/','upload');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_mode','2','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_port','25','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_auth','1','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_from','cms08@qq.com','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_user','cms08@qq.com','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_pwd','','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_delimiter','1','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('mail_silent','0','mail');
INSERT INTO {$tblprefix}mconfigs VALUES ('homedefault','index.html','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cnhtmldir','category','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('infohtmldir','freeinfos','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('ineedstatic','1265813915','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('indexcircle','10','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cnindexcircle','60','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cnlistcircle','180','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('archivecircle','300','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('nousersearch','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('monthstats','clicks,comments,favorites,praises','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('weekstats','clicks,comments,favorites,praises','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('albumstats','clicks,comments,favorites,praises,bytenum','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('aallowfloatwin','1','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('ca_vmode','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('cfg_ordermode','0','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('shipingfee1','-1','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('shipingfee2','-1','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('shipingfee3','-1','pay');
INSERT INTO {$tblprefix}mconfigs VALUES ('cotypestats','','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('minerrtime','14400','visit');
INSERT INTO {$tblprefix}mconfigs VALUES ('afloatwinwidth','800','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('afloatwinheight','550','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('arccustomurl','','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('marchtmldir','','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('maxuclassnum','0','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mallowfloatwin','1','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mfloatwinwidth','800','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('mfloatwinheight','550','view');
INSERT INTO {$tblprefix}mconfigs VALUES ('css_dir','css','tpl');
INSERT INTO {$tblprefix}mconfigs VALUES ('js_dir','js','tpl');
INSERT INTO {$tblprefix}mconfigs VALUES ('album_newstat','1','basic');
INSERT INTO {$tblprefix}mconfigs VALUES ('disable_htmldir','0','view');

DROP TABLE IF EXISTS {$tblprefix}mcufields;
CREATE TABLE {$tblprefix}mcufields (
  fid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(30) NOT NULL DEFAULT '',
  cname varchar(30) NOT NULL DEFAULT '',
  cu tinyint(3) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  isfunc tinyint(1) unsigned NOT NULL DEFAULT '0',
  func text NOT NULL,
  isadmin tinyint(1) unsigned NOT NULL DEFAULT '0',
  innertext text NOT NULL,
  fromcode tinyint(1) unsigned NOT NULL DEFAULT '0',
  length smallint(5) unsigned NOT NULL DEFAULT '0',
  datatype char(10) NOT NULL DEFAULT '',
  notnull tinyint(1) unsigned NOT NULL DEFAULT '0',
  nohtml tinyint(1) unsigned NOT NULL DEFAULT '0',
  mlimit char(15) NOT NULL DEFAULT '',
  regular varchar(80) NOT NULL DEFAULT '',
  min varchar(15) NOT NULL DEFAULT '',
  max varchar(15) NOT NULL DEFAULT '',
  rpid smallint(5) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  guide varchar(80) NOT NULL DEFAULT '',
  vdefault varchar(255) NOT NULL DEFAULT '',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  useredit tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (fid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}members;
CREATE TABLE {$tblprefix}members (
  mid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mchid smallint(6) unsigned NOT NULL DEFAULT '1',
  mname char(15) NOT NULL,
  isfounder tinyint(1) unsigned NOT NULL DEFAULT '0',
  `password` char(32) NOT NULL,
  email char(50) NOT NULL,
  mtcid smallint(6) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  regip char(15) NOT NULL,
  lastip char(15) NOT NULL,
  clicks mediumint(8) unsigned NOT NULL DEFAULT '0',
  regdate int(10) NOT NULL DEFAULT '0',
  lastvisit int(10) NOT NULL DEFAULT '0',
  lastactive int(10) unsigned NOT NULL DEFAULT '0',
  currency0 float NOT NULL DEFAULT '0',
  repus int(10) NOT NULL DEFAULT '0',
  rgid tinyint(3) unsigned NOT NULL DEFAULT '1',
  uptotal int(10) unsigned NOT NULL DEFAULT '0',
  downtotal int(10) unsigned NOT NULL DEFAULT '0',
  arcallowance int(10) NOT NULL DEFAULT '0',
  cuallowance int(10) NOT NULL DEFAULT '0',
  cuaddmonth int(10) NOT NULL DEFAULT '0',
  grouptype1 smallint(5) NOT NULL DEFAULT '0',
  grouptype1date int(10) NOT NULL DEFAULT '0',
  grouptype2 smallint(5) NOT NULL DEFAULT '0',
  grouptype2date int(10) NOT NULL DEFAULT '0',
  currency1 float NOT NULL DEFAULT '0',
  currency2 float NOT NULL DEFAULT '0',
  grouptype3 smallint(6) unsigned NOT NULL DEFAULT '0',
  grouptype3date int(10) unsigned NOT NULL DEFAULT '0',
  grouptype5 smallint(6) unsigned NOT NULL DEFAULT '0',
  grouptype5date int(10) unsigned NOT NULL DEFAULT '0',
  caid smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid1 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid2 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid3 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid4 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid5 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid6 smallint(6) unsigned NOT NULL DEFAULT '0',
  ccid7 smallint(6) unsigned NOT NULL DEFAULT '0',
  grouptype6 smallint(6) unsigned NOT NULL DEFAULT '0',
  grouptype6date int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mid),
  UNIQUE KEY mname (mname)
) TYPE=MyISAM AUTO_INCREMENT=14;

INSERT INTO {$tblprefix}members VALUES ('1','1','admin','1','c3284d0f94606de1fd2af172aba15bf3','admin@domain.com','0','1','','192.168.1.60','834','1262586518','1267663491','1267664292','320','0','1','0','0','0','0','0','0','0','0','0','120961','127','5','0','0','0','0','0','0','0','0','0','0','0','20','0');
INSERT INTO {$tblprefix}members VALUES ('3','1','aaaaa','0','b427c90b069896a917d44ad8c9407cc5','aa@qq.com','1','1','','192.168.1.60','101','0','1267498879','1267498881','0','0','1','0','0','0','0','0','0','0','0','0','50','853','1','0','13','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO {$tblprefix}members VALUES ('4','1','bbbbb','0','b4a677e8e15e8d797cff157c6ce9feef','bbbbb@qq.com','1','1','192.168.1.75','192.168.1.75','12','1262824178','1265797376','1265811234','900','0','1','0','0','0','0','0','0','0','0','0','120','0','1','0','12','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO {$tblprefix}members VALUES ('5','1','08cms','0','4fd90e24d9df0a2074fbc9506d771b5a','08cms@qq.com','1','1','192.168.1.75','192.168.1.60','1672','1262826949','1267625856','1267625857','0','0','1','73','0','0','0','0','0','0','14','0','511043','5','5','0','0','0','0','0','0','0','0','0','0','0','0','0');
INSERT INTO {$tblprefix}members VALUES ('6','1','ccccc','0','108cc6ccf5b44ff898357e18f265c6cb','ccccc@qq.com','1','1','','192.168.1.76','14','0','1267489289','1267493951','0','0','1','0','0','1','0','0','0','0','0','0','2','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0');

DROP TABLE IF EXISTS {$tblprefix}members_1;
CREATE TABLE {$tblprefix}members_1 (
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  truename varchar(255) NOT NULL DEFAULT '',
  gender varchar(10) NOT NULL DEFAULT '',
  birthday int(10) NOT NULL DEFAULT '0',
  photo varchar(255) NOT NULL DEFAULT '',
  intro text NOT NULL,
  PRIMARY KEY (mid)
) TYPE=MyISAM;

INSERT INTO {$tblprefix}members_1 VALUES ('3','����','��','354902400','userfiles/image/20090410/10070206882de92d5f3099.jpg#552#640','qqqqqqqqqqqqqqqqqqqqqqqqq');
INSERT INTO {$tblprefix}members_1 VALUES ('6','','����','0','','');
INSERT INTO {$tblprefix}members_1 VALUES ('1','','','0','','');
INSERT INTO {$tblprefix}members_1 VALUES ('4','','����','0','','');
INSERT INTO {$tblprefix}members_1 VALUES ('5','','����','0','','');

DROP TABLE IF EXISTS {$tblprefix}members_sub;
CREATE TABLE {$tblprefix}members_sub (
  mid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  msclicks int(10) unsigned NOT NULL DEFAULT '0',
  archives int(10) unsigned NOT NULL DEFAULT '0',
  checks int(10) unsigned NOT NULL DEFAULT '0',
  comments int(10) unsigned NOT NULL DEFAULT '0',
  scores int(10) unsigned NOT NULL DEFAULT '0',
  favorites int(10) unsigned NOT NULL DEFAULT '0',
  purchases int(10) unsigned NOT NULL DEFAULT '0',
  answers int(10) unsigned NOT NULL DEFAULT '0',
  freeinfos int(10) unsigned NOT NULL DEFAULT '0',
  credits int(10) unsigned NOT NULL DEFAULT '0',
  subscribes int(10) unsigned NOT NULL DEFAULT '0',
  fsubscribes int(10) unsigned NOT NULL DEFAULT '0',
  replys int(10) unsigned NOT NULL DEFAULT '0',
  offers int(10) unsigned NOT NULL DEFAULT '0',
  mscores1 int(10) unsigned NOT NULL DEFAULT '0',
  mscores2 int(10) unsigned NOT NULL DEFAULT '0',
  mscores3 int(10) unsigned NOT NULL DEFAULT '0',
  mscores4 int(10) unsigned NOT NULL DEFAULT '0',
  mscores5 int(10) unsigned NOT NULL DEFAULT '0',
  mavgscore float unsigned NOT NULL DEFAULT '0',
  confirmstr char(20) NOT NULL,
  nicename varchar(200) NOT NULL DEFAULT '',
  ordermode tinyint(1) unsigned NOT NULL DEFAULT '0',
  shipingfee1 int(10) NOT NULL DEFAULT '-1',
  shipingfee2 int(10) NOT NULL DEFAULT '-1',
  shipingfee3 int(10) NOT NULL DEFAULT '-1',
  paymode smallint(6) NOT NULL DEFAULT '0',
  alipay varchar(50) NOT NULL DEFAULT '',
  alipid char(16) NOT NULL DEFAULT '',
  alikeyt varchar(50) NOT NULL DEFAULT '',
  tenpay varchar(50) NOT NULL DEFAULT '',
  tenkeyt varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (mid)
) TYPE=MyISAM AUTO_INCREMENT=14;

INSERT INTO {$tblprefix}members_sub VALUES ('1','1100','12095','12095','6','10','13','0','0','0','0','2','0','0','0','0','0','0','0','0','0','','','0','-1','-1','-1','0','','','','','');
INSERT INTO {$tblprefix}members_sub VALUES ('3','9','5','5','1','1','5','0','0','0','0','3','0','0','0','0','0','0','0','0','0','','','0','-1','-1','-1','0','','','','','');
INSERT INTO {$tblprefix}members_sub VALUES ('4','12','2','2','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','0','-1','-1','-1','0','','','','','');
INSERT INTO {$tblprefix}members_sub VALUES ('5','2158','51096','57739','4','1','12','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','0','-1','-1','-1','0','','','','','');
INSERT INTO {$tblprefix}members_sub VALUES ('6','1','0','0','1','1','0','0','0','0','0','0','0','0','0','0','0','0','0','0','0','','','0','-1','-1','-1','0','','','','','');

DROP TABLE IF EXISTS {$tblprefix}menus;
CREATE TABLE {$tblprefix}menus (
  mnid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  url varchar(255) NOT NULL,
  mtid smallint(6) unsigned NOT NULL DEFAULT '0',
  issub tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  `fixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  isbk tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mnid)
) TYPE=MyISAM AUTO_INCREMENT=132;

INSERT INTO {$tblprefix}menus VALUES ('1','�ĵ��ϼ�����','javascript://content','1','0','1','0','1','0');
INSERT INTO {$tblprefix}menus VALUES ('2','���ݹ���','javascript://content','2','1','1','1','1','0');
INSERT INTO {$tblprefix}menus VALUES ('3','�������','javascript://fcontent','3','0','1','0','1','0');
INSERT INTO {$tblprefix}menus VALUES ('4','��Ա����','javascript://mcontent','4','0','0','0','1','0');
INSERT INTO {$tblprefix}menus VALUES ('5','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('6','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('7','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('8','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('9','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('10','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('11','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('12','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('13','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('14','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('15','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('16','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('17','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('18','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('19','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('20','','','0','0','1','0','0','1');
INSERT INTO {$tblprefix}menus VALUES ('21','���ֳ�/��ֵ','?entry=currencys&action=currencysaving','14','0','1','7','0','0');
INSERT INTO {$tblprefix}menus VALUES ('22','���ݿ����','?entry=database&action=dbexport','17','0','1','9','0','0');
INSERT INTO {$tblprefix}menus VALUES ('26','���м�¼','?entry=records&action=badlogin','17','0','1','10','0','0');
INSERT INTO {$tblprefix}menus VALUES ('27','�ɼ�����','?entry=gmissions&action=gmissionsedit','17','0','1','8','0','0');
INSERT INTO {$tblprefix}menus VALUES ('28','��������','?entry=currencys&action=currencysedit','15','0','1','1','0','0');
INSERT INTO {$tblprefix}menus VALUES ('29','��Աģ��','?entry=mchannels&action=mchannelsedit','15','0','1','2','0','0');
INSERT INTO {$tblprefix}menus VALUES ('30','��Ʒ����','?entry=orders&action=ordersedit','14','0','0','2','0','0');
INSERT INTO {$tblprefix}menus VALUES ('31','��Ա��ϵ����','?entry=grouptypes&action=grouptypesedit','15','0','1','3','0','0');
INSERT INTO {$tblprefix}menus VALUES ('32','����Ȩ�޷���','?entry=permissions&action=permissionsedit','18','0','1','2','0','0');
INSERT INTO {$tblprefix}menus VALUES ('33','��Ա��������','?entry=mcommus&action=mcommusedit','15','0','1','6','0','0');
INSERT INTO {$tblprefix}menus VALUES ('34','��Ա�������','?entry=mprojects&action=mprojectsedit','15','0','1','7','0','0');
INSERT INTO {$tblprefix}menus VALUES ('35','�ĵ�ģ��','?entry=channels&action=channeledit','15','0','1','8','0','0');
INSERT INTO {$tblprefix}menus VALUES ('36','��Ŀ����','?entry=catalogs&action=catalogedit','15','0','1','9','0','0');
INSERT INTO {$tblprefix}menus VALUES ('37','SiteMap��ͼ','?entry=sitemaps&action=sitemapsedit','17','0','1','11','0','0');
INSERT INTO {$tblprefix}menus VALUES ('38','��ϵ����','?entry=cotypes&action=cotypesedit','15','0','1','10','0','0');
INSERT INTO {$tblprefix}menus VALUES ('39','��̨������','?entry=amconfigs&action=amconfigsedit','18','0','1','3','0','0');
INSERT INTO {$tblprefix}menus VALUES ('40','�ڵ����','?entry=cnodes&action=cnodescommon','15','0','1','11','0','0');
INSERT INTO {$tblprefix}menus VALUES ('42','�ĵ���������','?entry=commus&action=commusedit','15','0','1','13','0','0');
INSERT INTO {$tblprefix}menus VALUES ('43','��վ����','?entry=mconfigs&action=cfsite','18','0','1','1','0','0');
INSERT INTO {$tblprefix}menus VALUES ('44','ҳ�澲̬','?entry=static&action=index','17','0','1','1','0','0');
INSERT INTO {$tblprefix}menus VALUES ('48','ģ�����','?entry=csstpls','16','0','1','5','0','0');
INSERT INTO {$tblprefix}menus VALUES ('106','��Ա��������','?entry=mmenus&action=mmenusedit','18','0','1','4','0','0');
INSERT INTO {$tblprefix}menus VALUES ('121','���ñ�ʶ','?entry=usualtags','21','1','1','3','0','0');
INSERT INTO {$tblprefix}menus VALUES ('51','ԭʼ��ʶ','?entry=btags','16','0','1','6','0','0');
INSERT INTO {$tblprefix}menus VALUES ('53','�����ʶ','?entry=mtags&action=mtagsedit&ttype=utag','16','0','1','7','0','0');
INSERT INTO {$tblprefix}menus VALUES ('54','���ϱ�ʶ','?entry=mtags&action=mtagsedit&ttype=ctag','16','0','1','8','0','0');
INSERT INTO {$tblprefix}menus VALUES ('55','��ҳ��ʶ','?entry=mtags&action=mtagsedit&ttype=ptag','16','0','1','9','0','0');
INSERT INTO {$tblprefix}menus VALUES ('56','����ܹ�','?entry=fchannels&action=fchannelsedit','15','0','1','14','0','0');
INSERT INTO {$tblprefix}menus VALUES ('57','�����ʶ','?entry=mtags&action=mtagsedit&ttype=rtag','16','0','1','10','0','0');
INSERT INTO {$tblprefix}menus VALUES ('111','�ɼ�����','?entry=gmodels&action=gmodeledit','23','1','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('59','ͶƱ����','?entry=votes&action=votesedit','17','0','1','2','0','0');
INSERT INTO {$tblprefix}menus VALUES ('60','վ�ڶ���','?entry=pms&action=batchpms','17','0','1','3','0','0');
INSERT INTO {$tblprefix}menus VALUES ('107','�ռ�ģ��','?entry=mtconfigs&action=mtconfigsedit','16','0','1','3','0','0');
INSERT INTO {$tblprefix}menus VALUES ('122','CSS��JS����','?entry=csstpls','16','0','1','2','0','0');
INSERT INTO {$tblprefix}menus VALUES ('120','���ñ�ʶ','?entry=usualtags','16','0','1','4','0','0');
INSERT INTO {$tblprefix}menus VALUES ('123','�ؽ�����','?entry=rebuilds','17','0','1','12','0','0');
INSERT INTO {$tblprefix}menus VALUES ('66','�ĵ�ģ��','?entry=channels&action=channeledit','20','1','1','3','0','0');
INSERT INTO {$tblprefix}menus VALUES ('67','��Ŀ����','?entry=catalogs&action=catalogedit','20','1','1','1','0','0');
INSERT INTO {$tblprefix}menus VALUES ('68','��ϵ����','?entry=cnodes&action=cnconfigs','20','1','1','2','0','0');
INSERT INTO {$tblprefix}menus VALUES ('110','��Ʒ��¼','?entry=purchases&action=purchasesedit','23','1','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('113','ģ������','?entry=tplconfig&action=tplbase','21','1','1','1','0','0');
INSERT INTO {$tblprefix}menus VALUES ('114','CSS��JS����','?entry=csstpls','21','1','1','2','0','0');
INSERT INTO {$tblprefix}menus VALUES ('115','ԭʼ��ʶ','?entry=btags','21','1','1','4','0','0');
INSERT INTO {$tblprefix}menus VALUES ('116','�����ʶ','?entry=mtags&action=mtagsedit&ttype=utag','21','1','1','5','0','0');
INSERT INTO {$tblprefix}menus VALUES ('117','���ϱ�ʶ','?entry=mtags&action=mtagsedit&ttype=ctag','21','1','1','6','0','0');
INSERT INTO {$tblprefix}menus VALUES ('78','�����ʹ���','?entry=badwords','17','0','1','5','0','0');
INSERT INTO {$tblprefix}menus VALUES ('79','���Źؼ���','?entry=wordlinks','17','0','1','7','0','0');
INSERT INTO {$tblprefix}menus VALUES ('80','��վ����','?entry=subsites&action=subsitesedit','15','0','1','15','0','0');
INSERT INTO {$tblprefix}menus VALUES ('82','�ֽ��ֵ����','?entry=pays&action=paysedit','14','0','1','8','0','0');
INSERT INTO {$tblprefix}menus VALUES ('112','�ؽ�����','?entry=rebuilds','23','1','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('86','���԰�����','?entry=alangs&action=alangsedit','18','0','1','5','0','0');
INSERT INTO {$tblprefix}menus VALUES ('88','��������','?entry=userfiles&action=userfilesedit','17','0','1','4','0','0');
INSERT INTO {$tblprefix}menus VALUES ('108','��̬ҳ��','?entry=static&action=index','23','1','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('109','վ������','?entry=mconfigs&action=cfsite','23','1','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('95','��Ա��������','?entry=matypes&action=matypesedit','15','0','1','6','0','0');
INSERT INTO {$tblprefix}menus VALUES ('96','���Ĺ���','?entry=subscribes','17','0','1','6','0','0');
INSERT INTO {$tblprefix}menus VALUES ('97','ģ�����','?entry=tplconfig&action=tplbase','16','0','1','1','0','0');
INSERT INTO {$tblprefix}menus VALUES ('118','��ҳ��ʶ','?entry=mtags&action=mtagsedit&ttype=ptag','21','1','1','7','0','0');
INSERT INTO {$tblprefix}menus VALUES ('119','�����ʶ','?entry=mtags&action=mtagsedit&ttype=rtag','21','1','1','8','0','0');
INSERT INTO {$tblprefix}menus VALUES ('125','��ͨ��Ա','?entry=members&action=membersedit&nauid=122&mchid=1','24','0','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('126','���һ�Ա','?entry=members&action=membersedit&nauid=123&mchid=1','24','0','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('127','ȫ����Ա','?entry=members&action=membersedit&nauid=13&mchid=1','24','0','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('128','��ӻ�Ա','?entry=memberadd&nauid=14&mchid=1','24','0','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('129','�������','?entry=utrans&action=utransedit&nauid=19&mchid=1','24','0','1','0','0','0');
INSERT INTO {$tblprefix}menus VALUES ('130','С˵ר�ò���','?entry=nv_configs','18','0','1','4','0','0');
INSERT INTO {$tblprefix}menus VALUES ('131','���ֹ���','?entry=extracts','14','0','1','0','0','0');

DROP TABLE IF EXISTS {$tblprefix}mfavorites;
CREATE TABLE {$tblprefix}mfavorites (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  fromid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fromname varchar(15) NOT NULL DEFAULT '',
  ucid mediumint(8) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mfields;
CREATE TABLE {$tblprefix}mfields (
  mfid smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL,
  ename char(30) NOT NULL DEFAULT '',
  mchid smallint(6) unsigned NOT NULL DEFAULT '0',
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  iscustom tinyint(1) unsigned NOT NULL DEFAULT '1',
  mcommon tinyint(1) unsigned NOT NULL DEFAULT '0',
  isfunc tinyint(1) unsigned NOT NULL DEFAULT '0',
  func text NOT NULL,
  tbl varchar(10) NOT NULL DEFAULT 'main',
  innertext text NOT NULL,
  fromcode tinyint(1) unsigned NOT NULL DEFAULT '0',
  issearch tinyint(1) unsigned NOT NULL DEFAULT '0',
  length smallint(6) unsigned NOT NULL DEFAULT '0',
  datatype varchar(15) NOT NULL,
  notnull tinyint(1) unsigned NOT NULL DEFAULT '0',
  nohtml tinyint(1) unsigned NOT NULL DEFAULT '0',
  mlimit varchar(15) NOT NULL DEFAULT '0',
  regular varchar(80) NOT NULL,
  min varchar(15) NOT NULL,
  max varchar(15) NOT NULL,
  rpid smallint(5) unsigned NOT NULL DEFAULT '0',
  isadmin tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  guide varchar(80) NOT NULL,
  vdefault varchar(255) NOT NULL DEFAULT '',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  useredit tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mfid)
) TYPE=MyISAM AUTO_INCREMENT=20;

INSERT INTO {$tblprefix}mfields VALUES ('1','�û���','mname','0','1','1','0','1','0','','main','','0','0','15','text','0','0','notnull','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('2','����','password','0','1','1','0','1','0','','main','','0','0','15','text','0','0','notnull','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('3','Email','email','0','1','1','0','1','0','','main','','0','0','50','text','0','0','notnull','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('10','�û���1','mname','1','1','1','0','1','0','','main','','0','0','15','text','0','0','notnull','','','','0','0','1','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('11','����1','password','1','1','1','0','1','0','','main','','0','0','15','text','0','0','notnull','','','','0','0','2','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('12','Email1','email','1','1','1','0','1','0','','main','','0','0','50','text','0','0','notnull','','','','0','0','3','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('13','�ǳ�','nicename','0','0','1','1','1','0','','sub','','0','0','200','text','0','1','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('14','�ǳ�','nicename','1','0','1','1','1','0','','sub','','0','0','200','text','0','1','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('15','��ʵ����','truename','1','0','1','1','0','0','','custom','','0','0','255','text','0','0','','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('16','�Ա�','gender','1','0','1','1','0','0','','custom','����\n��\nŮ','0','0','10','select','0','0','0','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('17','����','birthday','1','0','1','1','0','0','','custom','','0','0','0','date','0','0','0','','','','0','0','0','0','','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('18','ͷ��','photo','1','0','1','1','0','0','','custom','','0','0','0','image','0','0','0','','','','0','0','0','0','��66px * 66px��ͼƬΪ��','','0','0');
INSERT INTO {$tblprefix}mfields VALUES ('19','���','intro','1','0','1','1','0','0','','custom','','0','0','0','multitext','0','1','0','','','400','0','0','0','0','','','0','0');

DROP TABLE IF EXISTS {$tblprefix}mflinks;
CREATE TABLE {$tblprefix}mflinks (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  fromid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fromname varchar(15) NOT NULL DEFAULT '',
  ucid mediumint(8) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mfriends;
CREATE TABLE {$tblprefix}mfriends (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  fromid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fromname varchar(15) NOT NULL DEFAULT '',
  ucid mediumint(8) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mlangs;
CREATE TABLE {$tblprefix}mlangs (
  lid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(50) NOT NULL,
  content text NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (lid)
) TYPE=MyISAM AUTO_INCREMENT=942;

INSERT INTO {$tblprefix}mlangs VALUES ('1','madmincenter','��Ա��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('2','mindex','��Ա��ҳ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('3','mcenter','��Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('4','space','�ҵĿռ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('5','msetting','�ҵ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('6','logout','�˳�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('7','login','��½','0');
INSERT INTO {$tblprefix}mlangs VALUES ('8','register','ע��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('9','getpwd','�һ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('10','siteoff','��վ����ά�������Ժ������ӡ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('11','guide','��ʾ˵��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('12','msite','��վ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('13','selectsite','ѡ������վ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('14','submit','�ύ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('15','safecode','��֤��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('16','safetips','���ͼƬ��һ����֤��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('17','safemark','������ͼƬ���е��ַ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('18','yes','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('19','no','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('20','clickhere','��������û����ת�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('21','rightnowjump','������ת','0');
INSERT INTO {$tblprefix}mlangs VALUES ('22','closewindow','�رմ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('23','promptmessage','��ʾ��Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('610','readdoffer','�ط�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('25','waitcheck','��ȴ�����Ա��ˣ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('26','usergroupalterfinish','��Ա�����óɹ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('27','adminreply','����Ա�ظ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('28','remark','��ע','0');
INSERT INTO {$tblprefix}mlangs VALUES ('29','belongcatalog','������Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('30','catasalbumsetting','��Ŀ�ͺϼ��趨','0');
INSERT INTO {$tblprefix}mlangs VALUES ('31','addalter','��ӱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('32','alterstate','Ŀǰ���ڱ�����̵Ļ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('33','nosetting','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('34','applytime','����ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('35','user0','�����Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('36','belongalbum','�����ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('37','usergroupaltermodel','��Ա�������ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('39','inputalbumid','�ֶ����������ϼ�ID','0');
INSERT INTO {$tblprefix}mlangs VALUES ('40','usergroupneedoption','��Ա�����뷽ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('41','need','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('42','mycoclass','�ҵķ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('43','nococlass','�����÷���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('44','contentsetting','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('45','moresetting','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('46','altertargetusergroup','���Ŀ���Ա��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('47','groupcurrentuser','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('48','needusergroupalter','[%s]�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('49','miniday','��С%s��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('50','maxday','���%s��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('51','contentproject','����Ȩ�޷���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('52','archivesaleprice','����ĵ��ۼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('53','adjunctsaleprice','���������ۼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('54','settingvalidperiod','������Ч�ڣ��죩','0');
INSERT INTO {$tblprefix}mlangs VALUES ('55','freesale','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('615','choosemessage','��ָ����ȷ����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('57','allcatalog','������Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('58','allaltype','���кϼ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('59','nolimit','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('60','nocheckalbum','δ��ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('61','nopermission','û��ָ����Ŀ�Ĳ���Ȩ��!','0');
INSERT INTO {$tblprefix}mlangs VALUES ('62','checkedalbum','����ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('63','invalid','��Ч','0');
INSERT INTO {$tblprefix}mlangs VALUES ('64','available','��Ч','0');
INSERT INTO {$tblprefix}mlangs VALUES ('65','filteralbum','ɸѡ�ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('66','currentalbum','��ǰ�ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('67','checkstate','���״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('68','validperiodstate','��Ч��״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('69','belongaltype','�����ϼ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('70','searchtitle','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('71','agsearchkey','�ɺ�ͨ��� *','0');
INSERT INTO {$tblprefix}mlangs VALUES ('72','adddate','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('73','daybefore','��֮ǰ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('74','pause','��ֹ��ǰ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('75','page0','ҳ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('76','dayin','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('77','nocata','�ݸ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('78','look','�鿴','0');
INSERT INTO {$tblprefix}mlangs VALUES ('79','uploaddate','�ϴ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('80','thumb','����ͼ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('81','setalbum','�鼭','0');
INSERT INTO {$tblprefix}mlangs VALUES ('82','admin','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('83','preview','Ԥ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('84','modify','�޸�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('85','size_k','��С(K)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('86','type','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('87','cname','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('88','needing','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('89','pleaseneed','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('90','albumlist','�ϼ��б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('91','selectallpage','ȫѡ����ҳ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('92','title','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('93','del','ɾ?','0');
INSERT INTO {$tblprefix}mlangs VALUES ('94','altype','�ϼ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('95','catalog','��Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('96','check','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('97','message','��Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('212','filter0','ɸѡ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('99','album','�ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('100','edit','�༭','0');
INSERT INTO {$tblprefix}mlangs VALUES ('101','cancel','ȡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('102','abover','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('103','operateitem','������Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('104','delarchive','ɾ���ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('105','delalbumupcopy','ɾ���ϼ����¸���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('106','rearchive','�ĵ��ط���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('107','albumupdateneed','�ϼ���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('108','albumisabover','�ϼ��Ƿ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('109','cancelcoclass','ȡ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('110','setalbumtips','������ؼ�ID','0');
INSERT INTO {$tblprefix}mlangs VALUES ('111','resetvalidperiod','������Ч��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('112','albumupdatemode','�ϼ�����ģʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('113','ishavethumb','�Ƿ�������ͼ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('114','aidstxt','����ĵ�ID(���ID�ö��Ÿ���)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('115','attachmenttype','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('116','viewdetail','��ʾ��ϸ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('117','filterattachment','ɸѡ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('118','curcontentsrc','��ǰ������Դ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('119','updatecontentsaveas','�����������Ϊ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('120','albumupdatecopy','�ϼ����¸���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('121','albumself','�ϼ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('122','wantcheck','��Ҫ�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('123','permissionsetting','Ȩ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('124','havethumb','������ͼ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('125','nonethumb','û������ͼ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('126','other','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('127','media','��Ƶ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('128','flash','Flash','0');
INSERT INTO {$tblprefix}mlangs VALUES ('129','curalbumsetting','��ǰ�����ϼ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('130','image','ͼƬ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('131','alltype','ȫ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('132','id','ID','0');
INSERT INTO {$tblprefix}mlangs VALUES ('133','exit','�˳�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('134','author','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('135','subsite','��վ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('136','editcoclassfinish','�༭�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('137','inalbumcheck','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('138','exitalbum','�˳��ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('139','belongspacecatalog','�����ռ���Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('140','uclasstype','���˷�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('141','filterhasinalbum','ɸѡ��Ҫ����ĺϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('142','uclasscname','���˷�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('143','searchauthor','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('144','choosewantalbum','��ѡ����Ҫ����ĺϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('145','detail','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('146','archivemanager','�ĵ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('147','albummanager','�ϼ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('148','add','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('149','load','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('150','inalbummanager','�������ݹ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('151','inalbumlist','���������б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('152','clear','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('153','inalbumorder','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('154','allchannel','����ģ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('155','edituclass','�༭���˷���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('156','archive','�ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('157','filterarcalbum','ɸѡ�ĵ��ͺϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('158','arcbelongchannel','�ĵ�����ģ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('159','chooseyouruclass','��ѡ����ĸ��˷���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('160','albumbelongtype','�ϼ���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('161','addcoclassfinish','��ӷ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('162','coclasscname','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('163','addusercoclass','����û�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('164','order','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('165','uclassmanager','���˷������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('166','goback','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('167','channelalbum','ģ�ͻ�ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('168','basemessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('169','purchasedate','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('170','albumtitle','�ϼ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('171','currency','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('172','membercname','��Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('173','attachment','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('174','subscribelist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('175','addtime','���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('176','updatetime','����ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('177','retime','���·���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('178','archivetitle','�ĵ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('179','endtime','����ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('180','archivechannel','�ĵ�ģ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('181','subscribetype','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('182','clickcomment','����� / ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('183','uncheck','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('184','othermessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('185','filtersubscribe','���˶���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('186','checked','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('187','nocheck','δ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('188','member','��Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('189','sn','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('190','searchresultlist','��������б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('191','search','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('192','comment','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('193','outdays','��������ǰ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('194','indays','�������������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('195','ordertype','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('196','asc','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('197','nolimittype','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('198','searchkeyword','�����ؼ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('199','nocheckcomment','δ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('200','searchmode','������ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('201','checkedcomment','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('202','filtersetting','ɸѡ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('203','searchsetting','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('205','allarchive','�����ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('206','uclass','���˷���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('207','comments','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('208','clicks','�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('209','fulltxt','ȫ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('210','allcoclass','���з���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('211','srcmemberid','��Դ��ԱID','0');
INSERT INTO {$tblprefix}mlangs VALUES ('213','keyword','�ؼ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('214','srcmembercname','��Դ��Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('215','commentdate','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('216','list','�б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('217','usernosearchpermi','������Ա��û������Ȩ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('218','srcmember','��Դ��Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('219','reply0','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('220','read','�Ѷ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('221','delete','ɾ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('222','memberid','��ԱID','0');
INSERT INTO {$tblprefix}mlangs VALUES ('223','operate','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('224','nocheckfriend','δ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('225','checkedfriend','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('226','my','�ҵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('227','agree','ͬ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('228','needlist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('229','reportsucceed','�ٱ��ɹ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('230','needtime','����ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('231','deleteneed','ɾ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('232','reply','�ظ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('233','confirmselectreport','��ѡ��ٱ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('234','nocheckreply','δ��ظ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('235','checkedreply','����ظ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('236','replydate','�ظ�ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('237','noadopt','δ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('238','adopted','�Ѳ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('239','filteranswer','ɸѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('240','isadopt','�Ƿ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('241','questiontitle','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('893','closequestion','�ر�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('243','myanswerlist','�ҵĴ��б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('244','adopt','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('245','accountin','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('246','votenum','Ʊ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('247','answerdate','�ش�ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('248','source','��Դ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('249','editanswer','�༭��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('250','answercontent','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('251','updatedate','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('252','reportobject','�ٱ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('253','nosettingcoclass','�����÷���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('254','reportlist','�ٱ��б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('255','noadminpermi','��û�й���Ȩ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('256','reportdelsucceed','�ٱ�ɾ���ɹ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('257','nocheckarchive','δ���ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('258','checkedarchive','�����ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('259','selectreport','��ѡ��ٱ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('260','channel','ģ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('261','reportupdatedate','�ٱ���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('262','filterarchive','ɸѡ�ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('263','updatesucceed','���³ɹ�!','0');
INSERT INTO {$tblprefix}mlangs VALUES ('264','readonly','(ֻ��)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('265','archivelist','�ĵ��б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('266','adminmessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('267','submitmessage','�ύ��Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('268','reportmember','�ٱ���Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('269','delarchiveupcopy','ɾ���ĵ����¸���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('270','lastupdatetime','�ϴθ���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('271','lookreportobject','�鿴�ٱ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('272','archiveupdateneed','�ĵ���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('273','basedmessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('274','chooseyourreport','��ѡ�����Լ��ľٱ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('275','archiveupdatemode','�ĵ�����ģʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('276','archiveupdatecopy','�ĵ����¸���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('277','archiveself','�ĵ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('278','archivenocheck','ѡ�����ĵ�û���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('279','replysetsucceed','�ظ����óɹ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('280','albumsaleprice','����ϼ��ۼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('281','confirmselectreply','��ѡ��ظ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('282','selectoperateitem','��ѡ�������Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('283','settingcoclass','���÷���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('284','coclass','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('285','belongcoclass','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('286','email','Email','0');
INSERT INTO {$tblprefix}mlangs VALUES ('287','pm','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('288','mycartstep','�ҵĹ��ﳵ �̼ң�%s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('289','goodscname','��Ʒ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('902','alipay_partner','֧���������̻�ID','1262162565');
INSERT INTO {$tblprefix}mlangs VALUES ('838','dcprice','�ۿۼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('292','puamount','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('293','weight_kg','����(kg)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('294','stock','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('295','oldpricesum','ԭ���ܺ�&#160;%s&#160;Ԫ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('296','dcpricesum','�ۿ��ܺ�&#160;%s&#160;Ԫ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('297','weightsum','�����ܺ�&nbsp;&nbsp;%s&nbsp;kg','0');
INSERT INTO {$tblprefix}mlangs VALUES ('298','nogoods','��δ�����Ʒ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('299','settlementcenter','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('758','addinpriv','���뵽���˺ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('300','backmessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('301','settlementcenterstep','��������&#160;&#160;�̼ң�%s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('302','goodsoldpricesum','��Ʒԭ���ܺ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('303','goodsdcpricesum','��Ʒ�ۿۼ��ܺ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('304','choosecoclass','ѡ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('305','relatedmember','��ػ�Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('306','yuan','Ԫ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('307','goodsweightsum','��Ʒ�����ܺ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('308','shiping','�ͻ���ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('309','continue','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('310','lookrelatedsource','�鿴�����Դ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('311','orderssncode','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('312','chooseyourreply','��ѡ�������ѵĻظ�!','0');
INSERT INTO {$tblprefix}mlangs VALUES ('313','ordersgoodsfee','������Ʒ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('314','lookrelatedcontent','�鿴�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('315','ordersgoodsweight','������Ʒ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('316','ordersshipfee','�����ͻ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('317','ordersfeesum','���������ܶ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('318','mycashaccount','�ҵ��ֽ��ʻ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('319','payfrommyaccount','���ҵ��ʻ�֧��(Ԫ)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('320','ordersothermessage','����������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('321','onlinesaving','���߳�ֵ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('322','purchase','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('323','purchasegoods','������Ʒ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('324','goodspurchasestep1','��Ʒ������&nbsp; 1&nbsp; / &nbsp;2','0');
INSERT INTO {$tblprefix}mlangs VALUES ('325','goodspurchasestep2','��Ʒ������&nbsp; 2&nbsp; / &nbsp;2','0');
INSERT INTO {$tblprefix}mlangs VALUES ('326','goodsoldprice','��Ʒԭ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('327','goodsdcprice','��Ʒ�ۿۼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('328','goodsstock','��Ʒ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('329','goodsweight','��Ʒ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('331','lookcommentobject','�鿴���۶���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('332','commentmember','���ۻ�Ա','1263183038');
INSERT INTO {$tblprefix}mlangs VALUES ('333','commentupdatedate','���۸���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('334','commentlist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('335','commentobject','���۶���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('336','delcomment','ɾ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('337','checkcomment','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('338','addreplyoverquick','��ӻظ���������Ƶ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('339','norepeataddreply','�벻Ҫ�ظ���ӻظ�!','0');
INSERT INTO {$tblprefix}mlangs VALUES ('340','choosereplyobject','��ָ����ȷ�Ļظ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('341','memberrelatecoclass','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('342','spacetemplateproject','���˿ռ�ģ�巽��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('343','addcontentbycatalog','����Ŀ�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('344','memberchannel','��Աģ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('345','password','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('346','regcode','��֤��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('347','addinpublicalbum','�ڹ����ϼ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('348','choosememberchannel','ѡ���Աģ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('349','archiveadmin','�ĵ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('350','albumadmin','�ϼ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('351','norepeatregister','�벻Ҫ�ظ�ע��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('352','defaultregclosedreason','�Բ�����վ��ͣע���»�Ա��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('353','replys','�ظ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('354','addincatalog','��Ŀ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('355','content','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('356','contentlist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('357','filterpublicalbum','ɸѡ�����ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('358','weatherchecked','�Ƿ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('359','checkedquestion','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('360','nocheckquestion','δ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('361','related','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('362','publicalbumlist','�����ϼ��б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('363','addcontent','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('364','withoutarchiveoralbum','û����������ĵ���ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('365','exchangeto','&nbsp;&nbsp;�һ�Ϊ&nbsp;&nbsp;','0');
INSERT INTO {$tblprefix}mlangs VALUES ('366','membercurrent','��Ա��ǰ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('367','exchangescale','�һ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('369','exchangeamount','�һ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('370','exchange','�һ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('371','answerreward','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('372','checkout','�᰸','0');
INSERT INTO {$tblprefix}mlangs VALUES ('373','answer0','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('374','currencyexcurrency','���ֶһ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('375','overdate','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('376','close','�ر�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('377','spare','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('378','reward','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('379','questionlist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('380','filterquestion','ɸѡ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('381','currencytype','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('382','mode1','��ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('383','amount','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('384','noanswerchannel','δ�������ģ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('385','reason','ԭ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('386','time','ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('387','crrecord','���ֱ����־','0');
INSERT INTO {$tblprefix}mlangs VALUES ('388','orders','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('390','addfreeinfo','��Ӳ����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('391','commonoption','ͨ��ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('392','purchasedgoodslist','�ѹ���Ʒ�б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('393','messagecoclass','��Ϣ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('394','nocheckmessage','δ����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('395','checkedmessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('396','filtergoods','������Ʒ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('397','filtermessage','ɸѡ��Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('398','ordering','�µ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('399','messagelist','��Ϣ�б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('400','messagetitle','��Ϣ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('401','startdate','��ʼ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('402','enddate','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('403','all','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('614','messagefinish','��Ϣ�����ɹ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('405','messagechecked','��Ϣ��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('406','messagenocheck','��Ϣ����δ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('407','effectmessage','��Ч����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('408','flong','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('409','pmsendfinish','���ŷ��ͳɹ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('410','noeffectmessage','δ��Ч��Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('411','regcodeerror','��֤�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('412','fordermessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('413','messagepuprice','��Ϣ����۸�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('414','day','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('415','purchasecell','����Ԫ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('416','pmcontent','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('417','minipucellamount','��С����Ԫ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('418','pmtonames','<font color=\"gray\">(�ö��ŷָ������Ա����)</font> ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('419','messagecurstate','��Ϣ��ǰ״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('420','membercurcurrency','��Ա��ǰ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('421','pmtitle','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('422','fordermanager','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('423','sendpm','���Ͷ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('424','messagecontent','��Ϣ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('425','purchasedays','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('426','sendtime','����ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('427','purchasecurrency','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('428','senduser','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('429','ordersdate','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('430','pmcontentsetting','������������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('431','pointpm','��ָ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('432','pmdelfinish','����ɾ���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('433','addforder','��Ӷ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('434','choosedeltem','��ѡ��ɾ����Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('435','purchasecellamount','����Ԫ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('436','senddate','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('437','consultbasemessage','��ѯ������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('438','noread','δ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('439','consulttitle','��ѯ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('440','consultcommulist','��ѯ�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('441','consultreplycontent','��ѯ�ͻظ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('442','pmlist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('443','consult','��ѯ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('444','continueconsult','������ѯ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('445','consultcontent','��ѯ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('446','overconsult','��ǰ��ѯ�����ѱ��رգ�������ѯ���������⡣','0');
INSERT INTO {$tblprefix}mlangs VALUES ('447','paymodifyfinish','֧����Ϣ�޸����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('448','favoritedate','�ղ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('449','favoritearchivelist','�ղ��ĵ��б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('450','paynomodify','�ѳ�ֵ֧����Ϣ�����޸�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('451','nosettle','δ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('452','dealing','���ڴ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('453','settled','�ѽ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('454','closed','�ѹر�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('455','bigimage','��ͼ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('456','paywarrant','֧��ƾ֤','0');
INSERT INTO {$tblprefix}mlangs VALUES ('457','contactemail','��ϵEmail','0');
INSERT INTO {$tblprefix}mlangs VALUES ('458','contacttel','��ϵ�绰','0');
INSERT INTO {$tblprefix}mlangs VALUES ('459','contactorname','��ϵ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('460','currencysavtime','���ֳ�ֵʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('461','cashartime','�ֽ���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('462','filterconsultmessage','ɸѡ��ѯ��Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('463','dealstate','����״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('464','allstate','����״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('465','consultmessagelist','��ѯ��Ϣ�б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('466','consultaddtime','��ѯ���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('467','memberpwdsetting','��Ա��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('468','messagesendtime','��Ϣ����ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('469','payordersidsn','֧��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('470','payinterface','֧���ӿ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('471','handfeermb','������(�����)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('472','payamountrmbi','֧������(�����)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('473','inputnewpwd','����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('474','paymode','֧����ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('475','renewpwd','��������������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('476','lookpaymessage','�鿴֧����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('477','modifypaymessage','�޸�֧����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('478','choosepayrecord','��ָ����ȷ��֧����¼','0');
INSERT INTO {$tblprefix}mlangs VALUES ('479','operating','�ļ��������ڽ�����...','0');
INSERT INTO {$tblprefix}mlangs VALUES ('480','currentusergroup','��ǰ��Ա��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('481','curusergroupenddate','��ǰ��Ա���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('482','exchangeusergroup','�һ���Ա��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('483','selectpayrecord','��ѡ��֧����¼','0');
INSERT INTO {$tblprefix}mlangs VALUES ('484','currencyexusergroup','���ֶһ���Ա��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('485','savingdate','��ֵ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('486','cashaccount','�ֽ��ʻ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('487','arrivedate','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('488','recorddate','��¼����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('489','lastloginip','�ϴε�½IP','0');
INSERT INTO {$tblprefix}mlangs VALUES ('490','lastlogintime','�ϴε�½ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('491','payamount','֧������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('492','mb_state','��Ŀǰ������ǣ�%s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('493','payrecordlist','֧����¼�б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('494','messagestat','��Ϣͳ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('495','addarcamount','��Ա����ĵ����� %s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('496','onlinepayinterface','����֧���ӿ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('497','issuearcamount','��Ա�����ĵ����� %s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('498','membercomments','��Ա������ %s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('499','arcsubscribeamount','��Ա�ĵ��������� %s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('500','adjsubscribeamount','��Ա������������ %s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('501','currencyistransed','�����Ƿ��ѳ�ֵ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('502','uploadedadjunct','��Ա���ϴ����� %s (K)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('503','downloadedadjunct','��Ա�����ظ��� %s (K)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('504','friendlist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('505','cashisarrived','�ֽ��Ƿ��ѵ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('506','filterpayrecord','ɸѡ֧����¼','0');
INSERT INTO {$tblprefix}mlangs VALUES ('507','transed','�ѳ�ֵ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('508','memberlogin','��Ա��½','0');
INSERT INTO {$tblprefix}mlangs VALUES ('509','notrans','δ��ֵ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('510','loginpwd','��½����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('511','arrived','�ѵ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('512','noarrive','δ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('513','postofficeremit','�ʾֻ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('514','banktransfer','����ת��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('515','membergetpwd','��Ա�һ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('516','memberemail','��ԱEmail','0');
INSERT INTO {$tblprefix}mlangs VALUES ('517','onlinepay','����֧��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('518','visitingpay','����֧��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('519','addmember','��ӻ�Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('520','lookcommentsource','�鿴������Դ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('521','cashpayedmessageadmini','�ֽ��ֵ��֧����Ϣ֪ͨ����Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('522','activeoutsitemember','վ��ע���Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('523','memberpwd','��Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('524','baseoption','����ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('830','product','��Ʒ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('526','checkordernomodify','���󶩵������޸�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('527','ordersmessageset','������Ϣ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('528','usergroup','��Ա��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('529','weight','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('530','memberrelatecatalog','������Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('531','ordersgoodslist','������Ʒ�б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('532','payedcashyuan','��֧���ֽ�(Ԫ)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('533','oldpwd','ԭʼ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('534','newpwd','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('535','repwd','�ظ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('536','orderfeeamountyuan','���������ܶ�(Ԫ)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('537','shipfeeyuan','�ͻ�����(Ԫ)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('538','goodsfeeyuan','��Ʒ����(Ԫ)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('539','basestate','����״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('540','membercheckstate','��Ա���״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('541','memberregtime','��Աע��ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('542','memberregip','��Աע��IP','0');
INSERT INTO {$tblprefix}mlangs VALUES ('543','lastactivetime','��Ա�ϴμ���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('544','memberclicks','��Ա�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('545','memberonlinetime','��Ա����ʱ��(ʱ)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('546','addarcamount1','��Ա����ĵ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('547','issuearcamount1','��Ա�����ĵ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('548','membercomments1','��Ա������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('549','arcsubscribeamount1','��Ա�ĵ���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('550','adjsubscribeamount1','��Ա������������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('551','uploadedadjunct1','��Ա���ϴ�����(K)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('552','downloadedadjunct1','��Ա�����ظ���(K)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('553','otherstate','����״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('554','membercurrency','��Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('555','memberstate','��Ա״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('556','nocheckmember','δ���Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('557','checkedmember','�����Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('558','lookaddobject','�鿴��Ӷ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('559','needmessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('560','looklinkobject','�鿴�������Ӷ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('561','nochecklink','δ����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('562','checkedlink','������������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('563','lookreplyobject','�鿴�ظ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('564','lookreplysource','�鿴�ظ���Դ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('565','gobackmessage','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('566','received','���ջ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('567','noreceive','δ�ջ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('568','sended','�ѷ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('569','nosend','δ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('570','ordersstate','����״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('571','ordersbasedset','������������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('572','cancelorders','ȡ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('573','selectorders','��ѡ�񶩵�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('574','payed','��֧��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('575','reportdate','�ٱ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('576','ordersallamount','�����ܶ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('577','commentamount','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('578','archiveamount','�ĵ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('579','registertime','ע��ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('580','orderslist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('581','isreceived','�Ƿ����ջ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('582','issended','�Ƿ��ѷ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('583','ischecked','�Ƿ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('584','filterorders','ɸѡ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('585','needmembertypealter','�����Ա���ͱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('586','membercurrenttype','��Ա��ǰ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('587','altertargettype','���Ŀ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('588','membertypeneedoption','��Ա��������ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('589','alter_state','���״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('590','wait_check','�ȴ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('591','add_alter','��ӱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('592','checkoffer','��˱���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('593','masterreply','����Ա�ظ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('594','inputmembermessage','�����Ա��Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('595','updateoffer','���±���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('596','deleteoffer','ɾ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('597','productoffer','��Ʒ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('598','lookofferobject','�鿴���۶���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('599','offeravailabledays','������Ч����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('600','myoffer','�ҵı���(Ԫ)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('601','otheroffermessage','����������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('602','offerobject','���۶���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('603','lookprorelatedmsg','�鿴��Ʒ�����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('604','offercheckstate','�������״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('605','offerovertime','���۵���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('606','offerlist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('607','updatemyoffer','�����ҵı���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('608','noend','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('609','offeruclass','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('611','isend','�Ƿ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('612','end1','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('613','no1end1','δ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('618','marcsaveerr','�����Ա����ʱ���ִ���!','0');
INSERT INTO {$tblprefix}mlangs VALUES ('619','marcaddfinish','��Ա������ӳɹ�!','0');
INSERT INTO {$tblprefix}mlangs VALUES ('620','marchiveslist','�ҵĻ�Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('621','marctype','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('622','answer_reward','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('623','awardcurrency','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('624','msite','��վ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('625','goback','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('626','closewindow','�رմ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('627','rightnowjump','������ת','0');
INSERT INTO {$tblprefix}mlangs VALUES ('628','rightnowgoback','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('629','defaultclosedreason','��վ����ά�������Ժ������ӡ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('630','choose_reward_cutype','��ָ����ȷ�����ͻ�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('837','price','�۸�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('632','weight','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('633','rewarcurrenval','���ͻ���ֵ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('634','question','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('635','stock','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('636','questcontnotn','�������ݲ���Ϊ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('637','rewcurtychdomoarc','���ͻ������͸ı�,��Ҫ�޸��ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('638','dontredrewcur','��Ҫ�������ͻ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('639','recusmmiva','���ͻ���С����Сֵ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('640','issutaxfree','�����շѸ�����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('641','nolimit','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('642','lengsmalmilim','����С����С����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('643','lenglargmaxlimi','���ȴ����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('644','smallminilimi','С����С����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('645','largmaxlimi','�����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('646','attatamosmaminili','��������С����С����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('647','notnull','����Ϊ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('648','liminpda','����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('649','liminpint','����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('650','liminpnum','����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('651','limiinputlett','��������ĸ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('652','limitinputnumberl','��������ĸ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('653','limitinputtagtype','��������ĸ��ͷ��_��ĸ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('654','limitinputemail','������Email','0');
INSERT INTO {$tblprefix}mlangs VALUES ('655','clear','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('656','selectall','ȫѡ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('657','based_content_page0','��������ҳ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('658','content_trace_page0_1','����׷��ҳ1','0');
INSERT INTO {$tblprefix}mlangs VALUES ('659','content_trace_page0_2','����׷��ҳ2','0');
INSERT INTO {$tblprefix}mlangs VALUES ('660','remote_download','Զ�����ط���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('661','notremote','������Զ���ļ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('662','netsilistpage','��ַ�б�ҳ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('663','contensourcpage','������Դҳ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('664','resultdealfunc','���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('665','fiecontgathpatt','�ֶ�����\r\n�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('666','replmesssouront','�滻��Ϣ\r\n��Դ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('667','repmessagresulcont','�滻��Ϣ\r\n=>�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('668','lisregigathpatt','�б�����\r\n�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('669','liscellsplitag','�б�Ԫ\r\n�ָ���ʶ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('670','cellurlgathpatte','��Ԫ����<br>\r\n�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('671','celltitlgathepatt','��Ԫ����<br>\r\n�ɼ�ģӡ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('672','downjumfilsty','������ת�ļ���ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('673','detail','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('674','based_msg','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('675','order','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('676','flash','Flash','0');
INSERT INTO {$tblprefix}mlangs VALUES ('677','media','��Ƶ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('678','text','�����ı�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('679','multitext','�����ı�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('680','htmltext','Html�ı�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('681','image_f','��ͼ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('682','images','ͼ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('683','flashs','Flash��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('684','medias','��Ƶ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('685','file_f','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('686','files_f','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('687','select','����ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('688','mselect','����ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('689','date_f','����(ʱ���)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('690','int','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('691','float','С��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('692','email','Email','0');
INSERT INTO {$tblprefix}mlangs VALUES ('693','system','ϵͳ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('694','tagtype','��ʶ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('695','date','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('696','nolimitformat','���޸�ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('697','number','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('698','letter','��ĸ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('699','numberletter','��ĸ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('700','advancedmes','������Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('701','attachmentedit','�����༭','0');
INSERT INTO {$tblprefix}mlangs VALUES ('702','coclass','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('703','usergroup','��Ա��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('704','cocname','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('705','amount','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('891','award','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('892','awarded','�ѽ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('708','plepoimemid','��ָ����ԱID','0');
INSERT INTO {$tblprefix}mlangs VALUES ('709','crpolicy','������������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('710','cash','�ֽ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('711','currencyinout','���ֳ�/��ֵ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('712','otherreason','����ԭ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('713','subscribe','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('714','confchoosarchi','��ָ����ȷ���ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('715','poinarchnoch','ָ�����ĵ�δ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('716','noarchivbrowpermis','���ĵ����Ȩ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('717','subattachwanpaycur','���Ĵ˸�����Ҫ֧������ : &nbsp;:&nbsp;','0');
INSERT INTO {$tblprefix}mlangs VALUES ('718','younosuatwaencur','<br><br>��û�ж��Ĵ˸�������Ҫ���㹻����!','0');
INSERT INTO {$tblprefix}mlangs VALUES ('719','subsattach','���ĸ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('720','saleattach','���۸���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('721','lookinittag','�鿴ԭʼ��ʶ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('722','lookttype','�鿴 %s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('723','lookselecttag','�鿴ѡ�б�ʶ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('724','titleunknown','���ⲻ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('726','addinpointalbum','��ָ���ϼ����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('727','lookpointalbum','���Ѿ�ָ�������ºϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('728','allowadd_arctype','����ĵ���ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('729','allowadd_altype','��Ӻϼ���ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('730','cheforcon','���������!','0');
INSERT INTO {$tblprefix}mlangs VALUES ('731','websiteindex','��վ��ҳ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('733','arctype','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('734','inadmin','���ڹ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('735','alladmin','�ۺϹ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('736','imged','[ͼ]','0');
INSERT INTO {$tblprefix}mlangs VALUES ('737','choose_item','��ѡ�������Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('738','setting_album_abover','���úϼ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('739','cancel_album_abover','ȡ���ϼ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('740','unneedupdate','ȡ����������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('741','set','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('742','click','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('743','offer','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('744','ordersum','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('745','favorite','�ղ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('746','praise','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('747','debase','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('748','download','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('749','p_choose','��ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('750','cpupdate','ͬ�����µ�ǰ�ĵ��ĸ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('751','noupdate','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('752','cpupdate1','��ȫͬ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('753','cpupdate2','���ָ���(�����±��⡢�ؽ��ʡ�����ͼ��ժҪ)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('754','cata_choose','��ѡ����Ŀ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('755','be_catalog','������Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('756','prompt_msg','��ʾ��Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('757','allow_type','ѡ���ĵ��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('759','addinopen','���뵽���úϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('760','albumchoose','��ѡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('761','addcpinca','ͬʱ��������Ŀ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('762','addcpincc','ͬʱ������ %s �з���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('763','more_set','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('764','add_archive','����ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('765','content_set','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('766','arc_price','����ĵ��ۼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('767','annex_price','���������ۼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('768','set_valid_day','������Ч��(��)','0');
INSERT INTO {$tblprefix}mlangs VALUES ('769','belong_album','�����ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('770','mini','��С','0');
INSERT INTO {$tblprefix}mlangs VALUES ('771','max','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('772','mypaymode','�ҵ�֧����ʽ:','0');
INSERT INTO {$tblprefix}mlangs VALUES ('773','paynext','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('774','payalipay','֧����֧��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('775','paytenpay','�Ƹ�֧ͨ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('776','shipingfee1','ƽ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('777','shipingfee2','�ؿ�ר��EMS','0');
INSERT INTO {$tblprefix}mlangs VALUES ('778','shipingfee3','������ݹ�˾','0');
INSERT INTO {$tblprefix}mlangs VALUES ('779','alipay_account','֧�����ʺ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('780','tenpay_account','�Ƹ�ͨ�ʺ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('782','noshiping','�����ͻ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('783','shipingfee','�ͻ���ʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('784','add_inalbum','��ָ���ϼ� %s ������ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('785','look_album','�鿴�ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('786','paycurrency','վ���ʻ�֧��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('787','websiteseller','��վ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('788','catas_pointed','��ָ������Ŀ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('789','operate_item','������Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('790','content_list','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('791','all_channel','ȫ��ģ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('792','all_catalog','ȫ����Ŀ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('793','inclear','�˳��ϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('794','incheck','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('795','inuncheck','���ڽ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('796','readd','�ط���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('797','inorder','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('798','offers','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('799','order_num','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('800','favorites','�ղ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('801','praises','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('802','debases','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('803','answers','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('804','adopts','������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('805','add_time','���ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('806','update_time','����ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('807','readd_time','�ط�ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('808','end1_time','����ʱ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('809','current_album_set','�Ѿ�����ĺϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('810','choose_want_setin_album','��ѡ����Ҫ����ĺϼ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('811','exit_album','�˼�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('812','content_load_list','��ѡ����Ҫ���ص��ĵ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('813','orderstate','����״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('814','wait_cpcheck','�ȴ��̼�ȷ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('815','wait_pay','�ȴ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('816','wait_send','�ȴ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('817','goods_send','�ѷ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('818','order_ok','���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('819','order_cancel','ȡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('820','searchmember','������Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('821','confirmorders','ȷ�϶���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('822','deleteorders','ɾ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('823','modify_confirm','�޸Ĳ�ȷ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('824','confirm_cancel','ȷ��ȡ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('825','confirm_pay','ȷ�ϲ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('826','alipay_keyt','֧������Կ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('827','tenpay_keyt','�Ƹ�ͨ��Կ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('828','addtooffer','���뱨��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('829','seller','�̼�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('831','modify_payed','�޸��Ѹ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('832','log_order_pay','�������� �����ţ�%s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('833','log_order_rev','�����տ� �����ţ�%s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('834','ordmode','����ģʽ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('835','be_confirm','����ȷ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('836','no_confirm','����ȷ��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('840','productname','��Ʒ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('841','productlist','��Ʒ�б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('842','pro_price','�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('843','avg_price','ƽ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('844','read_state','�Ѷ�״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('845','areplyed','�з���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('846','noareply','�޷���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('847','replylist','�ظ��б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('848','areply','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('849','attachmentlist','�����б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('850','friend','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('851','qstate','��ѯ״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('852','saveforever','���ñ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('853','hours','Сʱ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('854','days','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('855','weeks','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('856','month','��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('857','inbrowser','���������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('858','ucpm','UC����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('859','syspm','ϵͳ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('860','memberpm','��Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('861','noreadpm','δ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('862','state','״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('863','nonenewpm','û���¶���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('865','onyousay','���� %s ˵��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('866','historypm','��ʷ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('867','nonepm','û�ж���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('868','pmdatamiss','�������ݲ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('869','pmsenderr','���ŷ��ʹ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('870','fupmrecord','�� %s �Ķ���Ϣ��¼��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('871','today','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('872','near3days','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('873','thisweek','����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('874','onformsay','%s �� %s ˵��','0');
INSERT INTO {$tblprefix}mlangs VALUES ('875','checksubject','�������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('876','defaultplayer','Ĭ�ϲ�����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('877','file_upload','�����ϴ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('878','att_admin','��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('879','normal_upload','��ͨ�ϴ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('880','bat_upload','�����ϴ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('881','zip_upload','����ϴ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('882','remote_att','Զ�̸���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('883','default_set','Ĭ������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('884','mwelcome','��ӭ <b>%s</b> ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('885','mb_type','���Ļ�Ա�����ǣ�%s','0');
INSERT INTO {$tblprefix}mlangs VALUES ('886','receives','�յ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('887','mymsg','��Ϣ����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('888','sorders','�Ķ���','0');
INSERT INTO {$tblprefix}mlangs VALUES ('890','answerlist','���б�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('894','newreg','ע���»�Ա','0');
INSERT INTO {$tblprefix}mlangs VALUES ('895','adminnopm','����Ա�벻Ҫ�����Ա���ͣ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('896','notranpro','û�������õı��������','0');
INSERT INTO {$tblprefix}mlangs VALUES ('897','areply_state','����״̬','0');
INSERT INTO {$tblprefix}mlangs VALUES ('898','freeinfo','�����Ϣ','0');
INSERT INTO {$tblprefix}mlangs VALUES ('899','marchive','��Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('900','mcomment','��Ա����','0');
INSERT INTO {$tblprefix}mlangs VALUES ('901','mreply','��Ա�ظ�','0');
INSERT INTO {$tblprefix}mlangs VALUES ('903','errorpaymode','֧��ģʽ�������Ϣ������','1262220454');
INSERT INTO {$tblprefix}mlangs VALUES ('904','alipay','֧����','1262221859');
INSERT INTO {$tblprefix}mlangs VALUES ('905','tenpay','�Ƹ�ͨ','1262221877');
INSERT INTO {$tblprefix}mlangs VALUES ('906','confirm_pay_info','ȷ�ϸ�����Ϣ','1262223633');
INSERT INTO {$tblprefix}mlangs VALUES ('907','systemerror','ϵͳ����','1262224835');
INSERT INTO {$tblprefix}mlangs VALUES ('908','account_plaza','%s-�ʻ���ֵ','1262225548');
INSERT INTO {$tblprefix}mlangs VALUES ('909','and_more','%s ����Ʒ','1262226432');
INSERT INTO {$tblprefix}mlangs VALUES ('910','orderspayed','�Ѹ���ȷ��','1262598113');
INSERT INTO {$tblprefix}mlangs VALUES ('911','confirm_set_payed','ȷ���Է���֧�� %s Ԫ�Ļ�����ᵥ��','1262610798');
INSERT INTO {$tblprefix}mlangs VALUES ('912','please_set_payed','�������Ѹ������','1262611388');
INSERT INTO {$tblprefix}mlangs VALUES ('913','set_payed','�Է���������������Ѹ���������ٴ��ύ��','1262611853');
INSERT INTO {$tblprefix}mlangs VALUES ('914','crproject_tip','������<b>%n</b> <span style=\"color:red\">%v</span> %u�����ĶԻ����� <span style=\"color:red\">%d</span>����������Ҫ�Ի���������','1263091556');
INSERT INTO {$tblprefix}mlangs VALUES ('915','currency_list_tip','�����б���������ͨ�����»��ֶһ�������','1262941048');
INSERT INTO {$tblprefix}mlangs VALUES ('916','currency0_extract','<b>%n</b> ������ <span style=\"color:red\">%v</span> %u�������������� <span style=\"color:red\">%d</span>��������ֶ���� <span style=\"color:red\">%c</span> %u��','1263345621');
INSERT INTO {$tblprefix}mlangs VALUES ('917','input_extract_count','��������Ҫ���ֵĽ�','1262958884');
INSERT INTO {$tblprefix}mlangs VALUES ('918','submit_extract','��������','1262959298');
INSERT INTO {$tblprefix}mlangs VALUES ('919','less_than_mincount','������������ֶ�ȣ��޷����֣�������ͨ�����ֶԻ�������','1263029083');
INSERT INTO {$tblprefix}mlangs VALUES ('920','currency_trade_tip','���Զһ��� <span style=\"color:red\">%v</span> Ԫ�ֽ�','1263085091');
INSERT INTO {$tblprefix}mlangs VALUES ('921','extract_total_tip','�ۿۺ������Ի�� <span style=\"color:red\">%v</span> Ԫ�ֽ�','1263085240');
INSERT INTO {$tblprefix}mlangs VALUES ('922','extract_total','����Ļ��ֶһ��������� <span style=\"color:red\">%v</span> Ԫ�ֽ�','1263085435');
INSERT INTO {$tblprefix}mlangs VALUES ('923','extract_confirm','ȷ��Ҫ���� %i Ԫ�ֽ����ۿۺ�������� %v Ԫ�ֽ�','1263086260');
INSERT INTO {$tblprefix}mlangs VALUES ('924','extract_mincount_tip','ϵͳ�趨����Ҫ��ȡ %v Ԫ�ֽ����������룡','1263086677');
INSERT INTO {$tblprefix}mlangs VALUES ('935','yourrepugrade','�������õȼ���','1264918870');
INSERT INTO {$tblprefix}mlangs VALUES ('925','extract_record_modify','���������¼�޸�','1263109601');
INSERT INTO {$tblprefix}mlangs VALUES ('926','extract_count','��������','1263110437');
INSERT INTO {$tblprefix}mlangs VALUES ('927','extract_discount','������','1263345606');
INSERT INTO {$tblprefix}mlangs VALUES ('928','checkdate','���ʱ��','1263191843');
INSERT INTO {$tblprefix}mlangs VALUES ('929','extract_getcount','���ֻ��','1263192013');
INSERT INTO {$tblprefix}mlangs VALUES ('930','no_modify_action','û���޸Ķ����������ύ��','1263201267');
INSERT INTO {$tblprefix}mlangs VALUES ('931','extract_record_info','���ּ�¼����','1263201721');
INSERT INTO {$tblprefix}mlangs VALUES ('932','extract_list','���ּ�¼�б�','1263257259');
INSERT INTO {$tblprefix}mlangs VALUES ('933','delstate','ɾ��״̬','1263266032');
INSERT INTO {$tblprefix}mlangs VALUES ('934','extract_remark','������������ʽ�������Ϣ��лл��','1263344300');
INSERT INTO {$tblprefix}mlangs VALUES ('936','volno','���','1265874551');
INSERT INTO {$tblprefix}mlangs VALUES ('937','vol_admin','�־����','1265874608');
INSERT INTO {$tblprefix}mlangs VALUES ('938','vol','�־�','1265874937');
INSERT INTO {$tblprefix}mlangs VALUES ('939','set_volid','���÷־�','1265874976');
INSERT INTO {$tblprefix}mlangs VALUES ('940','volname','�־����','1265875996');
INSERT INTO {$tblprefix}mlangs VALUES ('941','add_vol','��ӷ־�','1265876044');

DROP TABLE IF EXISTS {$tblprefix}mmenus;
CREATE TABLE {$tblprefix}mmenus (
  mnid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  url varchar(255) NOT NULL,
  mtid smallint(6) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  issys tinyint(1) unsigned NOT NULL DEFAULT '0',
  isbk tinyint(1) unsigned NOT NULL DEFAULT '0',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  onclick varchar(255) NOT NULL DEFAULT '',
  newwin tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mnid)
) TYPE=MyISAM AUTO_INCREMENT=253;

INSERT INTO {$tblprefix}mmenus VALUES ('1','��������','?action=memberinfo&nmuid=6','1','1','1','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('2','�޸�����','?action=memberpwd','1','1','3','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('3','�ҵ�״̬','?action=memberstate','1','1','2','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('4','�һ�����','?action=crexchange','8','1','9','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('5','��ΪVIP','?action=gtexchange','1','0','4','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('6','����֧��','?action=payonline','8','1','8','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('7','����֧��','?action=payother','8','1','7','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('8','�ֽ�֧����¼','?action=pays','8','1','6','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('9','���ֱ����¼','?action=crrecords','8','1','10','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('10','�������ĵ�','addpre.php?nmuid=7','2','1','4','1','0','2','return floatwin(\'open_acrhiveedit\',this)','0');
INSERT INTO {$tblprefix}mmenus VALUES ('250','С˵����','?action=archives&nmuid=2','2','1','1','0','0','2','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('12','ר�����','?action=archives&nmuid=3','2','1','2','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('13','��Ӳ����Ϣ','?action=farchiveadd','2','0','5','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('14','�����Ϣ����','?action=farchivesedit','2','0','6','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('15','���˷���','?action=uclasses','2','1','7','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('16','�ҵĸ���','?action=userfiles','2','1','8','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('17','վ������','?action=search','2','0','9','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('18','�ҵ��ղ�','?action=favorites','3','1','1','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('20','�ҵ�����','?action=comments','3','1','2','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('21','�ҵĴ�','?action=answers','3','0','4','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('22','�ҵ���ѯ','?action=fconsults','3','0','5','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('23','�ҵĹ��ﳵ','cart.php','8','0','3','1','0','0','return floatwin(\'open_mycart\',this)','0');
INSERT INTO {$tblprefix}mmenus VALUES ('24','�ҵĶ���','?action=orders','8','0','1','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('25','�ҵĹ����¼','?action=purchases','8','0','2','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('26','������','?action=pmsend','4','1','0','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('27','�ռ���','?action=pmbox','4','1','0','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('30','��Ա���ͱ��','?action=mtrans','1','0','6','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('31','�ҵĶ���','?action=subscribes','3','1','10','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('32','��Ϊ����','?action=utrans','1','1','5','1','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('105','�ύ�Ļظ�','?action=mreplys','9','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('106','�յ��Ļظ�','?action=amreplys','9','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('107','�ύ������','?action=mcomments','9','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('108','�յ�������','?action=amcomments','9','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('114','�ҵľٱ�','?action=mreports','3','1','6','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('115','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('116','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('117','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('118','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('119','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('120','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('121','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('122','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('123','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('124','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('125','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('126','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('127','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('128','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('129','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('130','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('131','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('132','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('133','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('134','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('135','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('136','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('137','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('138','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('139','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('140','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('141','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('142','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('143','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('144','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('145','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('146','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('147','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('148','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('149','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('150','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('151','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('152','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('153','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('154','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('155','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('156','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('157','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('158','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('159','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('160','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('161','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('162','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('163','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('164','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('165','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('166','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('167','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('168','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('169','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('170','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('171','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('172','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('173','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('174','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('175','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('176','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('177','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('178','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('179','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('180','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('181','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('182','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('183','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('184','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('185','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('186','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('187','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('188','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('189','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('190','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('191','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('192','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('193','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('194','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('195','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('196','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('197','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('198','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('199','','','0','1','0','0','1','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('238','�ҵĺ���','?action=mfriends','12','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('239','�����������','?action=amfriends','12','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('218','��������','?action=mflinks','9','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('219','������������','?action=amflinks','9','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('232','���۹���','?action=offers&nmuid=5','3','0','7','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('237','�ĵ��ظ�','?action=rarchives','3','0','8','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('242','����ͷ��','?action=memberinfo&nmuid=101','1','0','0','0','0','0','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('247','��Ʒ֧����ʽ','?action=paymanager','8','0','5','0','0','4','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('248','���۶���','?action=aorders','8','0','4','0','0','4','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('249','��ƪ���ݹ���','?action=archives&nmuid=4','2','1','3','0','0','2','','0');
INSERT INTO {$tblprefix}mmenus VALUES ('251','����ר��','archiveadd.php?caid=13&chid=2','2','1','2','0','0','0','return floatwin(\'open_acrhiveedit\',this)','0');
INSERT INTO {$tblprefix}mmenus VALUES ('252','����','?action=extracts','8','1','0','0','0','2','','0');

DROP TABLE IF EXISTS {$tblprefix}mmsgs;
CREATE TABLE {$tblprefix}mmsgs (
  lid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(50) NOT NULL,
  content text NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (lid)
) TYPE=MyISAM AUTO_INCREMENT=365;

INSERT INTO {$tblprefix}mmsgs VALUES ('1','loginsucceed','��¼�ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('2','userisforbid','���ڵ��������ֹ�˴˹���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('3','confirmaltype','��ָ����ȷ�ĺϼ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('4','noaltypepermission','û��%s�ķ���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('5','cacoverchannel','��ָ����ȷ�ĺϼ�����ģ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('6','usergroupalterfinish','��Ա�����óɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('7','waitcheck','��ȴ�����Ա��ˣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('8','ybomcnntu','�������Ļ�Աģ�Ͳ�������˻�Ա��!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('9','allowamountlimit','�޶��ĵ������������ƣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('89','choosereply','��ָ����ȷ�Ļظ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('11','cusernocatalogissue','��ǰ�û�û��ָ����Ŀ�ķ���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('12','catalognoaltype','%s ��Ŀ������� %s �ϼ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('13','safecodeerr','��֤�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('14','albumaddfailed','�ϼ����ʧ�ܣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('15','albumaddfinish','�ϼ���ӳɹ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('16','selectoperateitem','��ѡ�������Ŀ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('17','selectalbum','��ѡ��ϼ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('18','operating','�ļ��������ڽ�����...<br>�� %s ҳ�����ڴ���� %s ҳ<br><br>%s>>��ֹ��ǰ����%s','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('19','archiveoperatefinish','�ĵ��������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('20','confirmalbum','��ָ���ϼ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('21','selectownalbum','��ѡ�����Լ��ĺϼ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('22','updatearcneed','���ύ�ĵ���������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('23','arceditfailed','�ĵ��༭ʧ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('24','albumeditfinish','�ϼ��༭�ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('25','exitalbumfinish','�˳��ϼ��ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('26','setalbumfinish','�鼭�����ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('27','albumadminfinish','�ϼ�����ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('28','aboveralbum','�����ϼ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('29','ybomccntu','�������Ļ�Աģ�Ͳ�������˻�Ա��!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('30','nalarcalbum','û�п��Լ��ص��ĵ���ϼ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('31','ycnpu','����������ָ���Ļ�Ա��!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('32','choosegrouptype','��ָ����ȷ�Ļ�Ա����ϵ!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('33','nopermission','û��ָ����Ŀ�Ĳ���Ȩ��!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('34','chooseuserurlparam','��ָ����ȷ���û����Ӳ���!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('35','selectcomment','��ѡ������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('36','commentadminfinish','���۹������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('37','selectarchive','��ѡ���ĵ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('38','editcoclassfinish','�༭�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('39','selectlink','��ѡ����������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('40','linkadminfinish','�������ӹ������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('41','inputuclasscname','��������˷�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('42','dellinkconfirm','ɾ����������ȷ��<br /><br />%s[ȷ��]%s&nbsp;&nbsp;%s[ȡ��]%s','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('43','chooseyouruclass','��ѡ����ĸ��˷���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('44','addcoclassfinish','��ӷ������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('45','pcuaol','ָ������Ŀ���˷���������������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('46','succeeddellink','�ɹ�ɾ�� %s ����������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('47','pccau','ָ������Ŀ������Ӹ��˷���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('48','uclassoverlimit','���˷���������������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('49','chooseoperatemember','��ѡ�������Ա','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('50','friendneedadminok','��������������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('51','delfriendconfirm','ɾ������ȷ��<br /><br />%s[ȷ��]%s&nbsp;&nbsp;%s[ȡ��]%s','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('52','succeeddelfriend','�ɹ�ɾ�� %s ������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('53','sagreefriendadd','�ɹ�ͬ�� %s ���������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('54','subscribedelsucceed','����ɾ���ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('55','selectreply','��ѡ��ظ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('56','subscribecontent','��ѡ��������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('57','replyadminfinish','�ظ��������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('58','searchoverquick','������������Ƶ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('59','chooseanswer','��ѡ��һ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('60','usernosearchpermi','������Ա��û������Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('61','questionclose','����ر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('62','reportsucceed','�ٱ��ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('63','inputanswer','������ش�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('64','confirmselectreport','��ѡ��ٱ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('65','noadminpermi','��û�й���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('66','reportdelsucceed','�ٱ�ɾ���ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('67','updatesucceed','%s���³ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('68','chooseyourreport','��ѡ�����Լ��ľٱ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('69','choosereport','��ָ����ȷ�ľٱ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('70','archivenocheck','ѡ�����ĵ�û���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('71','younoreportpermi','��û�оٱ�Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('72','reportfunctionclose','�ٱ������ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('73','pleasesetcommuitem','�����ý�����Ŀ!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('74','choosereportobject','��ָ����ȷ�ľٱ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('75','answereditfinish','�𰸱༭�ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('76','operateoverdate','��������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('78','commuitemclose','�˽���������Ŀ�ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('79','choosearchive','ѡ���ĵ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('344','noopenalbum','û����Ч�Ĺ��úϼ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('82','choosechannel','��ָ�����ģ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('83','channelnoadd','ָ��ģ�������Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('84','confirmselectreply','��ѡ��ظ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('85','adminxchannel','����ר��ģ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('86','replysetsucceed','�ظ����óɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('87','chooseyourreply','��ѡ�������ѵĻظ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('88','choosecatalog','��ָ����ȷ��Ŀ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('90','addreplyoverquick','��ӻظ���������Ƶ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('91','norepeataddreply','�벻Ҫ�ظ���ӻظ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('92','yntrap','��û�д˻ظ�����Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('93','younoreplypermi','��û�лظ�Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('94','replyinvalid','�ظ���Ч','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('95','replyfunclosed','�ظ������ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('96','choosecomitem','��ָ����ȷ�Ľ�����Ŀ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('97','choosereplyobject','��ָ����ȷ�Ļظ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('98','arcsaveerr','�ĵ�����ʱ��������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('99','arcaddfinish','�ĵ�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('281','plogin','�ο�û�в���Ȩ�ޣ�\r\n���ȵ�½��ע���»�Ա��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('102','withoutarchiveoralbum','û����������ĵ���ϼ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('105','noanswerchannel','δ�������ģ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('106','pmsendfinish','���ŷ��ͳɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('107','pmdatamissing','�������ϲ���ȫ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('108','regcodeerror','��֤���������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('109','chooseyourarchive','��ѡ�����Լ����ĵ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('110','pointpm','��ָ������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('111','pmdelfinish','����ɾ���������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('112','choosedeltem','��ѡ��ɾ����Ŀ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('113','paymodifyfinish','֧����Ϣ�޸����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('114','paynomodify','�ѳ�ֵ֧����Ϣ�����޸�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('115','choosepayrecord','��ָ����ȷ��֧����¼','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('116','confirmchoosepays','��ָ����ȷ��֧��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('117','csmds','�ֽ��ֵ��Ϣɾ���ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('118','selectpayrecord','��ѡ��֧����¼','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('119','chooseobject','��ѡ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('120','objectnotreply','ָ���Ķ���֧�ֻظ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('121','csnsspwad','�ֽ��ֵ֪ͨ���ͳɹ�,��ȴ�����Ա����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('122','pinputpayamount','������֧������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('123','cartmodifyfinish','���ﳵ�޸����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('124','pugoodssucceed','��Ʒ�������ɳɹ����뵽��Ա���Ĺ�������<br /><br />\r\n������������%s','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('125','pugoodsfailed','������Ʒʧ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('126','nvopi','û����Ч������֧���ӿ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('127','ordersmodifyfinish','�����޸����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('128','cocm','���󶩵������޸�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('129','invaliditem','��Ч��Ŀ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('130','itemnopermission','��û�������ĿȨ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('131','choosecommentobject','ѡ�����۶���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('132','setcommuitem','���ý�����Ŀ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('133','commentclose','���۹��ܹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('134','nocommentpermission','��û������Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('135','nobrowsepermission','û���ĵ����Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('136','overquick','��������Ƶ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('137','dontreoperate','�벻Ҫ�ظ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('269','cheordcanmod','���ܶԴ�״̬�������б�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('139','choosecomment','��ָ����ȷ������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('140','chooseorders','��ָ����ȷ�Ķ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('141','orderopfinish','�����������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('142','selectorders','��ѡ�񶩵�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('143','offerupdatesucce','���۸��³ɹ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('144','nmcmessage','�����뱨�ۼ۸�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('145','pcyo','��ѡ�������ѵı���!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('146','chooseoffer','��ָ����ȷ�ı���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('147','norepeataddoffer','�벻Ҫ�ظ���ӱ���!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('148','chooseyourcomment','��ѡ�������ѵ����ۣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('149','noofferpermi','��û�б���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('150','comfunclos','���۹����ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('151','chooseproduct','��ָ����ȷ�Ĳ�Ʒ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('152','loginmemcenter','���¼��Ա���� [%s]','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('283','poinarcnoche','���޷���δ���ĵ�ִ��ָ���Ĳ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('153','commentdelsucceed','����ɾ���ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('154','noadminpermission','��û�й���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('155','membertypealter','��Ա���ͱ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('156','commentsucceed','���۲����ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('157','nousepublicaltype','û�п��õĹ����ϼ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('158','curexproject','��ָ����ǰ�һ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('159','inputexamount','������һ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('160','ycnpmt','�㲻������ָ���Ļ�Ա����!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('161','examountsmall','�һ��������ڶһ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('162','sucdelete','�ɹ�ɾ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('163','examountlarge','�һ���������ӵ������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('164','currencyexfinish','���ֶһ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('165','delreportcon','ɾ���ٱ�ȷ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('166','reportadminfin','�ٱ��������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('167','uccurrencyexitem','��ָ��UCenter���ֶһ���Ŀ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('169','nameadminfin','%s�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('170','noucuser','UCenter��û�е�ǰ��Ա���ϣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('171','pdrar','�벻Ҫ�ظ���Ӿٱ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('172','mrfc','��Ա�ٱ������ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('173','psmci','�����û�Ա������Ŀ!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('174','choosemember','��ָ����ȷ�Ļ�Ա!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('175','invalidoperate','��Ч����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('176','choosemessagecoclass','��ָ����ȷ����Ϣ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('177','nococlassaddpermi','��û�������������Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('178','msgsaveerr','��Ϣ�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('179','pcyr','��ѡ��������ۻظ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('180','freeinfoaddfinish','������Ϣ������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('181','selectmessage','��ѡ����Ϣ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('182','yntroap','��û�д˻ظ��Ĺ���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('183','memberrfc','��Ա�ظ������ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('184','chooseyourmessage','��ѡ�����Լ�����Ϣ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('185','msgforbidupdate','ָ������Ϣ��˺����޸ģ���Ҫ�޸�����ϵ����Ա��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('186','freeinfoeditfinish','������Ϣ�༭���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('187','selectfriend','��ѡ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('188','choosemessage','��ָ����ȷ����Ϣ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('189','setpurchaseamount','��ָ������Ԫ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('190','dontresendorders','��Ҫ�ظ����Ͷ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('191','fordersendfinish','�����������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('192','fordermodifyfinish','�����޸����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('193','consultchannel','��ָ����ѯ����Ϣ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('194','maxamountlimit','���������������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('195','datamissing','���ݲ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('196','confirmchooseflink','��ָ����ȷ����������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('197','addconsultsucceed','�����ѯ�ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('198','pdraf','�벻Ҫ�ظ������������!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('199','mffc','��Ա�������ӹ����ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('200','selectfavoritearc','��ѡ���ղ��ĵ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('201','favoritedelsucceed','�ղ�ɾ���ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('202','choflinkobject','��ָ����ȷ���������Ӷ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('203','addconsultcoclass','���������Ч����ѯ��Ϣ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('204','messagefinish','��Ϣ�����ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('205','nocheckmessage','δ����Ϣ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('206','consultcoclass','��ָ����ȷ����ѯ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('207','consultclosed','����ѯ��Ŀ�ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('208','choosematype','��ָ����ȷ�Ļ�Ա��������!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('209','matypenoadd','�����ڵĻ�Ա��û��ָ�����ͻ�Ա���������Ȩ��!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('210','offopesucce','���۲����ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('211','conoffer','��ѡ�񱨼�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('212','ponso','ָ���Ķ���֧�ֱ���!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('213','chooseoffbje','��ָ����ȷ�ı��۶���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('214','notsamepwd','�����������벻һ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('215','memberpwdillegal','��Ա���벻�Ϲ淶','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('216','refindpwdsucceed','��Ա�һ�����ɹ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('217','selectopeitem','��ѡ������б�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('218','addcrexusergroup','���������Ч�Ļ��ֶһ���Ա��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('219','getgrouptype','��ָ����Ա����ϵ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('220','getcytype','��ָ����������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('221','getusergroup','��ָ����Ա��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('222','noenoughcurrency','û���㹻����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('223','favadminfinish','�ղع������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('224','cyexusergroupfinish','���ֶһ���Ա�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('225','selectmember','��ѡ���Ա','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('226','dontrepeatlogin','�벻Ҫ�ظ���½&nbsp;[%s�˳�%s]','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('227','membercnameillegal','��Ա���Ʋ��Ϲ淶','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('228','mempassmodsuc','��Ա�����޸ĳɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('229','pwdillegal','���벻�淶','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('230','oldpasserror','ԭ�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('231','outmemberactive','վ��ע���Ա,��Ҫ����!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('232','nocheckmember','δ���Ա','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('233','loginfailed','��Ա��½ʧ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('234','memmesmodfin','��Ա��Ϣ�޸����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('235','mememill','��ԱEmail���Ϲ淶','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('236','memactfai','��Ա����ʧ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('237','impdra','վ�ڻ�Ա,�벻Ҫ�ظ�����!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('238','choosememchal','��ָ����ȷ�Ļ�Աģ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('239','userchecking','�û��ȴ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('240','logoutsucceed','��Ա�˳��ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('241','emailactiving','Email������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('242','memactivesucceed','��Ա����ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('243','membernamelenillegal','��Ա���Ƴ��Ȳ��淶','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('244','emailillegal','��ԱEmail���淶','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('245','ucenterdisabled','Ucenter����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('246','nomemberemail','ָ����Ա�����ڻ�Email����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('247','mastercannotuse','����Ա����ʹ�ô˹��ܣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('248','lostpwd_send','ȡ������ķ����ɹ����͵����ĵ�������!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('249','plenorepaddcomm','�벻Ҫ�ظ��������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('250','ynothcomadmpermi','��û�д����۵Ĺ���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('251','younocompermi','��û������Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('252','memcomfunclo','��Ա���۹����ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('253','selectmarchive','��ѡ���Ա����!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('254','marcnotdel','���޷�ɾ���˻�Ա�������������Ա��ϵ!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('255','selectyoumarc','��ѡ�����������ѵĻ�Ա����������ز���!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('256','marcdelfin','ָ���Ļ�Ա����ɾ���ɹ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('257','marcaddfinish','��Ա������ӳɹ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('258','choosemarchive','��ѡ����ȷ�Ļ�Ա����!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('259','chooseinalbum','��ָ����Ҫ������ݵĺϼ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('260','noinalbumaddpermission','�Բ�����û����ָ���ϼ�����������ݵ�Ȩ��!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('261','arceditfinish','�ĵ��༭���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('262','nogoods','��δ�����Ʒ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('263','paymodefinish','֧����ʽ�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('264','nopaymode','�̼�û�����ø��ʽ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('265','confchoosarchi','��ָ����ȷ���ĵ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('266','crc_error','����У��ʧ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('271','pay_no_money','�ֽ��ʻ����㣬���ȳ�ֵ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('267','nocurrency','�ֽ��ʻ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('268','goods_nums_err','��Ʒ�����ڻ���������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('272','ordopefin','�����������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('273','select_both_cc','ȷ�϶��� �� ȡ������ ���ܲ���ִ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('274','orddelfin','����ɾ���ɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('275','paymodeerr','���̼Ҳ�֧�ֵ�ǰ֧����ʽ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('276','paymodecerr','��ѡ�񸶿ʽ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('277','ordmodpay','�������޸ĳɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('282','commentsetsucceed','�������óɹ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('278','no_product','��Ʒ����û�пɹ����۵Ĳ�Ʒ!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('279','productadded','��ѡ��Ʒ�Ѽ��뵽���ı��ۿ⣡','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('284','younoitempermis','��û�д���Ŀ�Ĳ���Ȩ�ޣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('285','dontrepeatadd','�벻Ҫ�ظ�ִ�д˲�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('286','addoverquick','��������Ƶ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('287','notnull','%s ����Ϊ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('288','submitsucceed','�����͵������ύ�ɹ���','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('289','noissuepermission','û�� %s �ķ���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('290','choosealbum','��ָ����ȷ�ĺϼ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('291','albumisover','����ָ���ĺϼ�������Ϊ��ᣬ������ӻ�����µ����ݣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('292','albumisoneuser','����ָ���ĺϼ�Ϊ���˺ϼ���ֻ�кϼ����߲ſ�������µ����ݣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('293','albumisload','����ָ���ĺϼ�Ϊ�����Ժϼ�������ֱ���ںϼ�������µ����ݣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('294','albumovermax','����ָ���ĺϼ������������Ѵﵽ��������ƣ���������ּ������ݺ�ſ�����ӻ�����µ����ݣ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('295','nousernooperatepermis','�ο��޲���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('296','setcomitem','�����ý�����Ŀ!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('297','questionclosed','�����ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('298','inputanswercontent','�������������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('299','answeroverminlength','�𰸳�����С�ֳ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('300','answeraddfinish','��������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('301','choosevoteobject','��ָ����ȷ��ͶƱ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('302','loginmember','��¼��Ա','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('303','dontnrepeatvote','�벻Ҫ�ظ�ͶƱ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('304','votesucceed','ͶƱ�ɹ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('305','chooseyouanswer','��ѡ�������ѵĴ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('348','norepeatoper','�벻Ҫ�ظ�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('307','noavailableitemoper','��Ч��Ŀ����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('310','choosecoclass','��ѡ����ϵ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('311','nousnopurchasepermi','�ο�û�й���Ȩ�ޣ����ȵ�¼��ע�ᣡ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('312','nousernofavoritepermis','�ο�û���ղ�Ȩ�ޣ����ȵ�¼��ע�ᣡ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('313','choosecommuitem','����ָ���Ĳ�����Ŀ�����ڻ򱻹رգ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('314','favoriteamooverlimit','�����ղؼеĿռ�������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('315','archivealreadyfavorite','���Ѿ��ղ��˵�ǰ�ĵ�����鿴�ղؼУ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('316','favoritesucceed','�ղسɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('317','dorepeataddcomment','�벻Ҫ�ظ���������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('318','addcommentoverquick','�������۲���̫Ƶ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('319','cannotfavoritemember','�����ղش˻�Ա!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('320','favoriatefunclos','�ղع��ܹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('321','younofavoriatpermis','��û���ղ�Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('322','memalrefavorite','��Ա�Ѿ��ղ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('324','setmemcommitem','�����û�Ա������Ŀ!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('328','nousernoaddfripermis','�ο�û����Ӻ���Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('327','dorepeataddflink','�벻Ҫ�ظ������������!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('329','cannotaddyourself','������������ѵ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('330','friamountoverlim','����������������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('331','memberalreadyadd','�˻�Ա�Ѿ����!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('332','friendaddsucce','������ӳɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('334','dorepeataddreply','�벻Ҫ�ظ���ӻظ�!','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('335','dorepeataddreport','��Ҫ�ظ��ύ�ٱ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('336','scorefunclosed','���ֹ����ѹر�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('337','younoscorepermis','��û������Ȩ��','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('338','dontrepeatscore','�벻Ҫ�ظ�����','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('339','scoresucceed','���ֳɹ�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('340','nousernoofferpermis','�ο�û�б���Ȩ�ޣ����ȵ�¼��ע�ᣡ','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('341','offerexist','����Ʒ�Ѿ������ı��ۿ��У�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('342','offersubmitsucceed','������ӳɹ���<br><br>��Ա�������ϸ���ã�','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('343','commentmembernotexist','���۵Ļ�Ա������','0');
INSERT INTO {$tblprefix}mmsgs VALUES ('349','orderpayfinish','��������״̬���óɹ�','1261299745');
INSERT INTO {$tblprefix}mmsgs VALUES ('351','no_extract_permission','��û�����ֵ�Ȩ�ޣ�','1262944602');
INSERT INTO {$tblprefix}mmsgs VALUES ('352','currency_muns_lack','������� %s �������Ϸ���','1263108680');
INSERT INTO {$tblprefix}mmsgs VALUES ('353','less_than_mincount','������С��ȡ��� %s Ԫ���޷���ȡ��','1263093012');
INSERT INTO {$tblprefix}mmsgs VALUES ('354','extract_muns_lack','��ȡ��������������ӵ�е�����','1263095986');
INSERT INTO {$tblprefix}mmsgs VALUES ('355','extract_operate_finish','�������������ɣ�','1263105079');
INSERT INTO {$tblprefix}mmsgs VALUES ('356','extract_error','������ز���δ��ɣ�','1263348788');
INSERT INTO {$tblprefix}mmsgs VALUES ('357','noedit_extract_record','û�пɱ༭�����ּ�¼��','1263108117');
INSERT INTO {$tblprefix}mmsgs VALUES ('358','extract_modify_finish','���������¼�޸����','1263115425');
INSERT INTO {$tblprefix}mmsgs VALUES ('359','invalid_extract_record','��Ч�����ּ�¼','1263257199');
INSERT INTO {$tblprefix}mmsgs VALUES ('360','select_extract','��ѡ�����ּ�¼','1263264956');
INSERT INTO {$tblprefix}mmsgs VALUES ('361','del_vol','ɾ���־�ȷ��<br /><br />%s[ȷ��]%s&nbsp;&nbsp;%s[ȡ��]%s','1265873939');
INSERT INTO {$tblprefix}mmsgs VALUES ('362','voleditfin','�־�༭��ɡ�','1265874749');
INSERT INTO {$tblprefix}mmsgs VALUES ('363','voladdfin','�־������ɡ�','1265874778');
INSERT INTO {$tblprefix}mmsgs VALUES ('364','voldelfin','�־�ɾ���ɹ���','1265874810');

DROP TABLE IF EXISTS {$tblprefix}mmtypes;
CREATE TABLE {$tblprefix}mmtypes (
  mtid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  url varchar(255) NOT NULL,
  `fixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mtid)
) TYPE=MyISAM AUTO_INCREMENT=13;

INSERT INTO {$tblprefix}mmtypes VALUES ('1','��������','','0','99');
INSERT INTO {$tblprefix}mmtypes VALUES ('2','���ݹ���','','0','2');
INSERT INTO {$tblprefix}mmtypes VALUES ('3','�ĵ�����','','0','3');
INSERT INTO {$tblprefix}mmtypes VALUES ('4','����Ϣ','','0','1');
INSERT INTO {$tblprefix}mmtypes VALUES ('8','�������','','0','5');
INSERT INTO {$tblprefix}mmtypes VALUES ('9','�ռ佻��','','0','4');
INSERT INTO {$tblprefix}mmtypes VALUES ('12','����','','0','97');

DROP TABLE IF EXISTS {$tblprefix}mprojects;
CREATE TABLE {$tblprefix}mprojects (
  mpid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(10) NOT NULL,
  cname varchar(50) NOT NULL,
  smchid smallint(6) unsigned NOT NULL DEFAULT '0',
  tmchid smallint(6) unsigned NOT NULL DEFAULT '0',
  autocheck tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mpid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mreplys;
CREATE TABLE {$tblprefix}mreplys (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  fromid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fromname varchar(15) NOT NULL DEFAULT '',
  ucid mediumint(8) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  areply tinyint(1) unsigned NOT NULL DEFAULT '0',
  aread tinyint(1) unsigned NOT NULL DEFAULT '0',
  uread tinyint(1) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mreports;
CREATE TABLE {$tblprefix}mreports (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  fromid mediumint(8) unsigned NOT NULL DEFAULT '0',
  fromname varchar(15) NOT NULL DEFAULT '',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mtconfigs;
CREATE TABLE {$tblprefix}mtconfigs (
  mtcid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  mchids varchar(255) NOT NULL,
  setting mediumtext NOT NULL,
  arctpls text NOT NULL,
  PRIMARY KEY (mtcid)
) TYPE=MyISAM AUTO_INCREMENT=2;

INSERT INTO {$tblprefix}mtconfigs VALUES ('1','Ĭ��1','1','1','a:5:{i:0;a:1:{s:5:\"index\";s:12:\"index_m.html\";}i:1;a:2:{s:5:\"index\";s:0:\"\";s:4:\"list\";s:19:\"list_m_lianzai.html\";}i:2;a:2:{s:5:\"index\";s:0:\"\";s:4:\"list\";s:18:\"list_m_sanwen.html\";}i:3;a:2:{s:5:\"index\";s:0:\"\";s:4:\"list\";s:17:\"list_m_zawen.html\";}i:4;a:2:{s:5:\"index\";s:0:\"\";s:4:\"list\";s:20:\"list_m_duanpian.html\";}}','');

DROP TABLE IF EXISTS {$tblprefix}mtrans;
CREATE TABLE {$tblprefix}mtrans (
  trid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname char(15) NOT NULL,
  fromid smallint(6) unsigned NOT NULL DEFAULT '0',
  toid smallint(6) unsigned NOT NULL DEFAULT '0',
  remark varchar(255) NOT NULL,
  contentarr text NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  reply varchar(255) NOT NULL,
  PRIMARY KEY (trid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}mtypes;
CREATE TABLE {$tblprefix}mtypes (
  mtid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  url varchar(255) NOT NULL,
  `fixed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  issub tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (mtid)
) TYPE=MyISAM AUTO_INCREMENT=25;

INSERT INTO {$tblprefix}mtypes VALUES ('1','��������','?entry=archives&action=index','1','1','0');
INSERT INTO {$tblprefix}mtypes VALUES ('2','���ݹ���','?entry=archives&action=index','1','1','1');
INSERT INTO {$tblprefix}mtypes VALUES ('15','��վ�ܹ�','#','0','5','0');
INSERT INTO {$tblprefix}mtypes VALUES ('14','�������','#','0','3','0');
INSERT INTO {$tblprefix}mtypes VALUES ('20','�ܹ�����','','0','2','1');
INSERT INTO {$tblprefix}mtypes VALUES ('16','ģ����','#','0','6','0');
INSERT INTO {$tblprefix}mtypes VALUES ('17','��������','#','0','2','0');
INSERT INTO {$tblprefix}mtypes VALUES ('21','ģ���ʶ','','0','3','1');
INSERT INTO {$tblprefix}mtypes VALUES ('23','��������','','0','5','1');
INSERT INTO {$tblprefix}mtypes VALUES ('18','ϵͳ����','#','0','7','0');
INSERT INTO {$tblprefix}mtypes VALUES ('3','�������','','1','1','0');
INSERT INTO {$tblprefix}mtypes VALUES ('4','��Ա����','','1','1','0');
INSERT INTO {$tblprefix}mtypes VALUES ('24','��Ա����','','0','1','0');

DROP TABLE IF EXISTS {$tblprefix}murls;
CREATE TABLE {$tblprefix}murls (
  muid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  remark varchar(80) NOT NULL,
  uclass varchar(15) NOT NULL,
  issys tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  url varchar(255) NOT NULL,
  setting text NOT NULL,
  tplname varchar(50) NOT NULL,
  onlyview tinyint(1) unsigned NOT NULL DEFAULT '0',
  isbk tinyint(1) unsigned NOT NULL DEFAULT '0',
  mtitle varchar(80) NOT NULL,
  otitle varchar(80) NOT NULL,
  guide text NOT NULL,
  PRIMARY KEY (muid)
) TYPE=MyISAM AUTO_INCREMENT=8;

INSERT INTO {$tblprefix}murls VALUES ('1','�ҵ�����','�����������','archives','0','1','0','?action=archives&nmuid=1','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:4:\"sids\";s:0:\"\";s:5:\"caids\";s:0:\"\";s:5:\"chids\";s:2:\"11\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:32:\"answers,adopts,closed,view,admin\";s:8:\"operates\";s:12:\"delete,close\";s:6:\"imuids\";s:1:\"7\";s:7:\"ccids18\";s:0:\"\";s:7:\"ccids12\";s:0:\"\";s:7:\"ccids13\";s:0:\"\";s:7:\"ccids15\";s:0:\"\";s:7:\"ccids16\";s:0:\"\";}','','0','0','','','');
INSERT INTO {$tblprefix}murls VALUES ('2','����С˵����','����С˵����','archives','0','1','0','?action=archives&nmuid=2','a:16:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:4:\"sids\";s:0:\"\";s:5:\"caids\";s:13:\"1,2,3,4,5,6,7\";s:5:\"chids\";s:1:\"4\";s:7:\"filters\";s:13:\"catalog,check\";s:5:\"lists\";s:44:\"catalog,check,adddate,updatedate,admin,ccid3\";s:8:\"operates\";s:22:\"delete,abover,unabover\";s:6:\"imuids\";s:11:\"1,5,101,103\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','0','','','');
INSERT INTO {$tblprefix}murls VALUES ('3','ר������','ר������','archives','0','1','0','?action=archives&nmuid=3','a:16:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:4:\"sids\";s:0:\"\";s:5:\"caids\";s:2:\"13\";s:5:\"chids\";s:0:\"\";s:7:\"filters\";s:13:\"catalog,check\";s:5:\"lists\";s:33:\"catalog,uclass,adddate,view,admin\";s:8:\"operates\";s:6:\"delete\";s:6:\"imuids\";s:5:\"1,3,4\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";s:6:\"ccids6\";s:0:\"\";s:6:\"ccids7\";s:0:\"\";}','','0','0','','','');
INSERT INTO {$tblprefix}murls VALUES ('4','��ƪ���ݹ���','��ƪ���ݹ���','archives','0','1','0','?action=archives&nmuid=4','a:14:{s:7:\"checked\";s:2:\"-1\";s:5:\"valid\";s:2:\"-1\";s:4:\"sids\";s:0:\"\";s:5:\"caids\";s:6:\"8,9,10\";s:5:\"chids\";s:1:\"3\";s:7:\"filters\";s:0:\"\";s:5:\"lists\";s:28:\"catalog,uclass,adddate,admin\";s:8:\"operates\";s:6:\"delete\";s:6:\"imuids\";s:1:\"1\";s:6:\"ccids1\";s:0:\"\";s:6:\"ccids2\";s:0:\"\";s:6:\"ccids3\";s:0:\"\";s:6:\"ccids4\";s:0:\"\";s:6:\"ccids5\";s:0:\"\";}','','0','0','','','');
INSERT INTO {$tblprefix}murls VALUES ('6','��Ա��Ϣ','��Ա��Ϣ����','mdetail','0','1','0','?action=memberinfo&nmuid=6','a:1:{s:5:\"lists\";s:57:\"email,mtcid,nicename,truename,gender,birthday,photo,intro\";}','','0','0','','','');
INSERT INTO {$tblprefix}murls VALUES ('7','�������ĵ�','�������ĵ�','arcadd','0','1','0','addpre.php?nmuid=7','a:3:{s:5:\"coids\";s:0:\"\";s:5:\"chids\";s:0:\"\";s:7:\"nochids\";s:1:\"1\";}','','0','0','','','');

DROP TABLE IF EXISTS {$tblprefix}offers;
CREATE TABLE {$tblprefix}offers (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) unsigned NOT NULL DEFAULT '0',
  oprice float unsigned NOT NULL DEFAULT '0',
  `storage` int(10) NOT NULL DEFAULT '-1',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  ucid mediumint(8) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  votes1 int(10) unsigned NOT NULL DEFAULT '0',
  votes2 int(10) unsigned NOT NULL DEFAULT '0',
  votes3 int(10) unsigned NOT NULL DEFAULT '0',
  votes4 int(10) unsigned NOT NULL DEFAULT '0',
  votes5 int(10) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  updatedate int(10) unsigned NOT NULL DEFAULT '0',
  refreshdate int(10) unsigned NOT NULL DEFAULT '0',
  enddate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}orders;
CREATE TABLE {$tblprefix}orders (
  oid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  ordersn varchar(30) NOT NULL,
  orderfee float unsigned NOT NULL DEFAULT '0',
  shipingmode tinyint(1) NOT NULL DEFAULT '0',
  shipingfee float unsigned NOT NULL DEFAULT '0',
  paymode tinyint(2) NOT NULL DEFAULT '0',
  totalfee float unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL,
  tomid mediumint(8) unsigned NOT NULL DEFAULT '0',
  tomname varchar(15) NOT NULL DEFAULT '',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  payed float unsigned NOT NULL DEFAULT '0',
  state smallint(6) NOT NULL DEFAULT '0',
  delstate tinyint(1) unsigned NOT NULL DEFAULT '0',
  updatedate int(10) unsigned NOT NULL DEFAULT '0',
  ordermode tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (oid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}pays;
CREATE TABLE {$tblprefix}pays (
  pid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL,
  ordersn varchar(64) NOT NULL,
  pmode tinyint(1) unsigned NOT NULL DEFAULT '0',
  poid varchar(15) NOT NULL,
  amount float unsigned NOT NULL DEFAULT '0',
  handfee float unsigned NOT NULL DEFAULT '0',
  bank varchar(50) NOT NULL,
  senddate int(10) unsigned NOT NULL DEFAULT '0',
  receivedate int(10) unsigned NOT NULL DEFAULT '0',
  transdate int(10) unsigned NOT NULL DEFAULT '0',
  ip char(15) NOT NULL,
  truename varchar(80) NOT NULL,
  telephone varchar(30) NOT NULL,
  email varchar(100) NOT NULL,
  remark varchar(255) NOT NULL,
  warrant varchar(255) NOT NULL,
  PRIMARY KEY (pid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}permissions;
CREATE TABLE {$tblprefix}permissions (
  pmid smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL,
  aread tinyint(1) unsigned NOT NULL DEFAULT '0',
  cread tinyint(1) unsigned NOT NULL DEFAULT '0',
  aadd tinyint(1) unsigned NOT NULL DEFAULT '0',
  down tinyint(1) NOT NULL DEFAULT '0',
  fadd tinyint(1) unsigned NOT NULL DEFAULT '0',
  cuadd tinyint(1) unsigned NOT NULL DEFAULT '0',
  menu tinyint(1) unsigned NOT NULL DEFAULT '0',
  field tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  ugids varchar(255) NOT NULL,
  fugids varchar(255) NOT NULL,
  PRIMARY KEY (pmid)
) TYPE=MyISAM AUTO_INCREMENT=6;

INSERT INTO {$tblprefix}permissions VALUES ('1','���л�ԱȨ��','1','1','0','1','0','1','0','0','0','-1','');
INSERT INTO {$tblprefix}permissions VALUES ('2','���һ�ԱȨ��','1','1','1','1','0','1','1','0','0','12,13','');
INSERT INTO {$tblprefix}permissions VALUES ('3','�ĵ�����Ȩ��','0','0','1','0','0','0','0','0','0','14,12,13','');
INSERT INTO {$tblprefix}permissions VALUES ('4','�ճ�����ԱȨ��','1','1','1','1','1','1','1','1','0','14','');
INSERT INTO {$tblprefix}permissions VALUES ('5','ר������Ȩ��','0','0','1','0','0','0','1','0','0','14,13','');

DROP TABLE IF EXISTS {$tblprefix}players;
CREATE TABLE {$tblprefix}players (
  plid tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  cname char(30) NOT NULL,
  ptype char(10) NOT NULL DEFAULT 'media',
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder tinyint(3) unsigned NOT NULL DEFAULT '0',
  exts varchar(50) NOT NULL,
  template mediumtext NOT NULL,
  PRIMARY KEY (plid)
) TYPE=MyISAM AUTO_INCREMENT=6;

INSERT INTO {$tblprefix}players VALUES ('1','RealPlayer','media','1','1','1','rm,rmvb','<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n  <tr>\r\n    <td height=\"{$height}\" width=\"{$width}\">\r\n<object classid=\"clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA\" height=\"100%\" id=RP1 name=RP1 width=\"100%\">\r\n  <param name=\"AUTOSTART\" value=\"-1\">\r\n  <param name=\"SHUFFLE\" value=\"0\">\r\n  <param name=\"PREFETCH\" value=\"0\">\r\n  <param name=\"NOLABELS\" value=\"0\">\r\n  <param name=\"CONTROLS\" value=\"Imagewindow\">\r\n  <param name=\"CONSOLE\" value=\"clip1\">\r\n  <param name=\"LOOP\" value=\"0\">\r\n  <param name=\"NUMLOOP\" value=\"0\">\r\n  <param name=\"CENTER\" value=\"0\">\r\n  <param name=\"MAINTAINASPECT\" value=\"1\">\r\n  <param name=\"BACKGROUNDCOLOR\" value=\"#000000\">\r\n</object>\r\n<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA  height=30 id=RP2 name=RP2 width=\"100%\">\r\n<PARAM NAME=\"_ExtentX\" VALUE=\"4657\">\r\n<PARAM NAME=\"_ExtentY\" VALUE=\"794\">\r\n<PARAM NAME=\"AUTOSTART\" VALUE=\"-1\">\r\n<PARAM NAME=\"SRC\" VALUE=\"{$url}\">\r\n<PARAM NAME=\"SHUFFLE\" VALUE=\"0\">\r\n<PARAM NAME=\"PREFETCH\" VALUE=\"0\">\r\n<PARAM NAME=\"NOLABELS\" VALUE=\"-1\">\r\n<PARAM NAME=\"CONTROLS\" VALUE=\"ControlPanel\">\r\n<PARAM NAME=\"CONSOLE\" VALUE=\"clip1\">\r\n<PARAM NAME=\"LOOP\" VALUE=\"0\">\r\n<PARAM NAME=\"NUMLOOP\" VALUE=\"0\">\r\n<PARAM NAME=\"CENTER\" VALUE=\"0\">\r\n<PARAM NAME=\"MAINTAINASPECT\" VALUE=\"1\">\r\n<PARAM NAME=\"BACKGROUNDCOLOR\" VALUE=\"#000000\">\r\n</OBJECT>\r\n<object classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA height=30 id=RP3 name=RP3 width=\"100%\">\r\n  <param name=\"_ExtentX\" value=\"4657\">\r\n  <param name=\"_ExtentY\" value=\"794\">\r\n  <param name=\"AUTOSTART\" value=\"-1\">\r\n  <param name=\"SHUFFLE\" value=\"0\">\r\n  <param name=\"PREFETCH\" value=\"0\">\r\n  <param name=\"NOLABELS\" value=\"-1\">\r\n  <param name=\"CONTROLS\" value=\"StatusBar\">\r\n  <param name=\"CONSOLE\" value=\"clip1\">\r\n  <param name=\"LOOP\" value=\"0\">\r\n  <param name=\"NUMLOOP\" value=\"0\">\r\n  <param name=\"CENTER\" value=\"0\">\r\n  <param name=\"MAINTAINASPECT\" value=\"1\">\r\n  <param name=\"BACKGROUNDCOLOR\" value=\"#000000\">\r\n</object>\r\n    \r\n    </td>\r\n  </tr>\r\n</table>\r\n');
INSERT INTO {$tblprefix}players VALUES ('2','΢��wmPlayer','media','1','1','2','mepg,avi','<object classid=\"clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95\" id=\"MediaPlayer1\" width=\"{$width}\" height=\"{$height}\">\r\n<param name=\"AudioStream\" value=\"-1\">\r\n<param name=\"AutoSize\" value=\"-1\">\r\n<param name=\"AutoStart\" value=\"-1\">\r\n<param name=\"AnimationAtStart\" value=\"-1\">\r\n<param name=\"AllowScan\" value=\"-1\">\r\n<param name=\"AllowChangeDisplaySize\" value=\"-1\">\r\n<param name=\"AutoRewind\" value=\"0\">\r\n<param name=\"Balance\" value=\"0\">\r\n<param name=\"BaseURL\" value>\r\n<param name=\"BufferingTime\" value=\"15\">\r\n<param name=\"CaptioningID\" value>\r\n<param name=\"ClickToPlay\" value=\"-1\">\r\n<param name=\"CursorType\" value=\"0\">\r\n<param name=\"CurrentPosition\" value=\"0\">\r\n<param name=\"CurrentMarker\" value=\"0\">\r\n<param name=\"DefaultFrame\" value>\r\n<param name=\"DisplayBackColor\" value=\"0\">\r\n<param name=\"DisplayForeColor\" value=\"16777215\">\r\n<param name=\"DisplayMode\" value=\"0\">\r\n<param name=\"DisplaySize\" value=\"0\">\r\n<param name=\"Enabled\" value=\"-1\">\r\n<param name=\"EnableContextMenu\" value=\"-1\">\r\n<param name=\"EnablePositionControls\" value=\"-1\">\r\n<param name=\"EnableFullScreenControls\" value=\"-1\">\r\n<param name=\"EnableTracker\" value=\"-1\">\r\n<param name=\"Filename\" value=\"{$url}\" valuetype=\"ref\">\r\n<param name=\"InvokeURLs\" value=\"-1\">\r\n<param name=\"Language\" value=\"-1\">\r\n<param name=\"Mute\" value=\"0\">\r\n<param name=\"PlayCount\" value=\"1\">\r\n<param name=\"PreviewMode\" value=\"-1\">\r\n<param name=\"Rate\" value=\"1\">\r\n<param name=\"SAMIStyle\" value=\"1\">\r\n<param name=\"SAMILang\" value>\r\n<param name=\"SAMIFilename\" value>\r\n<param name=\"SelectionStart\" value=\"-1\">\r\n<param name=\"SelectionEnd\" value=\"-1\">\r\n<param name=\"SendOpenStateChangeEvents\" value=\"-1\">\r\n<param name=\"SendWarningEvents\" value=\"-1\">\r\n<param name=\"SendErrorEvents\" value=\"-1\">\r\n<param name=\"SendKeyboardEvents\" value=\"0\">\r\n<param name=\"SendMouseClickEvents\" value=\"0\">\r\n<param name=\"SendMousemovieeEvents\" value=\"0\">\r\n<param name=\"SendPlayStateChangeEvents\" value=\"-1\">\r\n<param name=\"ShowCaptioning\" value=\"0\">\r\n<param name=\"ShowControls\" value=\"-1\">\r\n<param name=\"ShowAudioControls\" value=\"-1\">\r\n<param name=\"ShowDisplay\" value=\"0\">\r\n<param name=\"ShowGotoBar\" value=\"0\">\r\n<param name=\"ShowPositionControls\" value=\"-1\">\r\n<param name=\"ShowStatusBar\" value=\"-1\">\r\n<param name=\"ShowTracker\" value=\"-1\">\r\n<param name=\"TransparentAtStart\" value=\"-1\">\r\n<param name=\"VideoBorderWidth\" value=\"0\">\r\n<param name=\"VideoBorderColor\" value=\"0\">\r\n<param name=\"VideoBorder3D\" value=\"0\">\r\n<param name=\"Volume\" value=\"0\">\r\n<param name=\"WindowlessVideo\" value=\"0\">\r\n</object>');
INSERT INTO {$tblprefix}players VALUES ('4','Flash������','flash','1','1','3','swf','<object classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" codebase=\"http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0\" width=\"{$width}\" height=\"{$height}\">\r\n<param name=\"movie\" value=\"{$url}\">\r\n<param name=\"quality\" value=\"high\">\r\n<param name=\"wmode\" value=\"transparent\">\r\n<embed wmode=\"transparent\" src=\"{$url}\" quality=\"high\" type=\"application/x-shockwave-flash\" \r\n   pluginspage=\"http://www.macromedia.com/go/getflashplayer\" width=\"{$width}\" height=\"{$height}\"></embed>\r\n</object>');
INSERT INTO {$tblprefix}players VALUES ('5','Flv������','flash','1','1','4','flv','<object type=\"application/x-shockwave-flash\" data=\"{$tplurl}/images/flvplayer.swf\" width=\"{$width}\" height=\"{height}\">\r\n  <param name=\"movie\" value=\"{$tplurl}/images/flvplayer.swf?autostart=true&file={$url}\">\r\n</object>\r\n');

DROP TABLE IF EXISTS {$tblprefix}pms;
CREATE TABLE {$tblprefix}pms (
  pmid int(10) unsigned NOT NULL AUTO_INCREMENT,
  fromuser varchar(30) NOT NULL,
  fromid mediumint(8) unsigned NOT NULL DEFAULT '0',
  toid mediumint(8) unsigned NOT NULL DEFAULT '0',
  viewed tinyint(1) unsigned NOT NULL DEFAULT '0',
  title varchar(50) NOT NULL,
  content mediumtext NOT NULL,
  pmdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pmid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}purchases;
CREATE TABLE {$tblprefix}purchases (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  tocid mediumint(8) NOT NULL DEFAULT '0',
  price float unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname char(15) NOT NULL,
  tomid mediumint(8) NOT NULL DEFAULT '0',
  tomname varchar(15) NOT NULL DEFAULT '',
  nums int(10) unsigned NOT NULL DEFAULT '0',
  oid mediumint(8) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}replys;
CREATE TABLE {$tblprefix}replys (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  ucid smallint(6) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  votes1 int(10) unsigned NOT NULL DEFAULT '0',
  votes2 int(10) unsigned NOT NULL DEFAULT '0',
  votes3 int(10) unsigned NOT NULL DEFAULT '0',
  votes4 int(10) unsigned NOT NULL DEFAULT '0',
  votes5 int(10) unsigned NOT NULL DEFAULT '0',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  updatedate int(10) unsigned NOT NULL DEFAULT '0',
  refreshdate int(10) unsigned NOT NULL DEFAULT '0',
  areply tinyint(1) unsigned NOT NULL DEFAULT '0',
  aread tinyint(1) unsigned NOT NULL DEFAULT '0',
  uread tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}reports;
CREATE TABLE {$tblprefix}reports (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(15) NOT NULL DEFAULT '',
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  updatedate int(10) unsigned NOT NULL DEFAULT '0',
  content text NOT NULL,
  PRIMARY KEY (cid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}repugrades;
CREATE TABLE {$tblprefix}repugrades (
  rgid tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  rgbase int(10) NOT NULL DEFAULT '0',
  thumb varchar(255) NOT NULL,
  PRIMARY KEY (rgid)
) TYPE=MyISAM AUTO_INCREMENT=21;

INSERT INTO {$tblprefix}repugrades VALUES ('1','һ��','0','images/repu/ico_1.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('2','����','100','images/repu/ico_2.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('3','����','200','images/repu/ico_3.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('4','����','300','images/repu/ico_4.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('5','����','400','images/repu/ico_5.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('6','һ��','500','images/repu/ico_6.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('7','����','600','images/repu/ico_7.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('8','����','700','images/repu/ico_8.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('9','����','800','images/repu/ico_9.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('10','����','900','images/repu/ico_10.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('11','һ��','1000','images/repu/ico_11.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('12','����','0','images/repu/ico_12.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('13','����','0','images/repu/ico_13.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('14','�Ĺ�','0','images/repu/ico_14.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('15','���','0','images/repu/ico_15.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('16','�ʹ�','0','images/repu/ico_16.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('17','���ʹ�','0','images/repu/ico_17.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('18','���ʹ�','0','images/repu/ico_18.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('19','�Ļʹ�','0','images/repu/ico_19.gif');
INSERT INTO {$tblprefix}repugrades VALUES ('20','��ʹ�','0','images/repu/ico_20.gif');

DROP TABLE IF EXISTS {$tblprefix}repus;
CREATE TABLE {$tblprefix}repus (
  rid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  repus int(10) NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname char(15) NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  reason varchar(255) NOT NULL,
  PRIMARY KEY (rid),
  KEY mid (mid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}rprojects;
CREATE TABLE {$tblprefix}rprojects (
  rpid smallint(3) NOT NULL AUTO_INCREMENT,
  cname varchar(50) NOT NULL,
  rmfiles mediumtext NOT NULL,
  timeout int(10) unsigned NOT NULL DEFAULT '0',
  excludes varchar(255) NOT NULL,
  issystem tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (rpid)
) TYPE=MyISAM AUTO_INCREMENT=2;

INSERT INTO {$tblprefix}rprojects VALUES ('1','Զ��ͼƬ����(ϵͳ)','a:4:{s:3:\"jpg\";a:5:{s:7:\"maxsize\";i:300;s:8:\"minisize\";i:1;s:4:\"mime\";s:10:\"image/jpeg\";s:5:\"ftype\";s:5:\"image\";s:7:\"extname\";s:3:\"jpg\";}s:3:\"gif\";a:5:{s:7:\"maxsize\";i:300;s:8:\"minisize\";i:1;s:4:\"mime\";s:9:\"image/gif\";s:5:\"ftype\";s:5:\"image\";s:7:\"extname\";s:3:\"gif\";}s:4:\"jpeg\";a:5:{s:7:\"maxsize\";i:300;s:8:\"minisize\";i:1;s:4:\"mime\";s:10:\"image/jpeg\";s:5:\"ftype\";s:5:\"image\";s:7:\"extname\";s:4:\"jpeg\";}s:3:\"png\";a:5:{s:7:\"maxsize\";i:300;s:8:\"minisize\";i:1;s:4:\"mime\";s:9:\"image/png\";s:5:\"ftype\";s:5:\"image\";s:7:\"extname\";s:3:\"png\";}}','10','','1');

DROP TABLE IF EXISTS {$tblprefix}shipings;
CREATE TABLE {$tblprefix}shipings (
  shid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(80) NOT NULL,
  available tinyint(1) NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  basefee float unsigned NOT NULL DEFAULT '0',
  base1 float unsigned NOT NULL DEFAULT '0',
  price1 float unsigned NOT NULL DEFAULT '0',
  unit1 float unsigned NOT NULL DEFAULT '0',
  base2 float unsigned NOT NULL DEFAULT '0',
  price2 float unsigned NOT NULL DEFAULT '0',
  unit2 float unsigned NOT NULL DEFAULT '0',
  freetop float unsigned NOT NULL DEFAULT '0',
  plus1mode tinyint(1) unsigned NOT NULL DEFAULT '0',
  plus1 float unsigned NOT NULL DEFAULT '0',
  plus2mode tinyint(1) unsigned NOT NULL DEFAULT '0',
  plus2 float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (shid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}sitemaps;
CREATE TABLE {$tblprefix}sitemaps (
  ename varchar(20) NOT NULL,
  cname varchar(50) NOT NULL,
  d_url varchar(50) NOT NULL,
  xml_url varchar(50) NOT NULL,
  available tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(3) unsigned NOT NULL DEFAULT '999',
  setting mediumtext NOT NULL,
  UNIQUE KEY ename (ename)
) TYPE=MyISAM;

INSERT INTO {$tblprefix}sitemaps VALUES ('baidu','Baidu����Э��','baidu.php','baidu.xml','1','2','');
INSERT INTO {$tblprefix}sitemaps VALUES ('google','Google Sitemap','google.php','google.xml','1','1','');

DROP TABLE IF EXISTS {$tblprefix}splangs;
CREATE TABLE {$tblprefix}splangs (
  slid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(50) NOT NULL,
  `type` varchar(15) NOT NULL,
  cname varchar(100) NOT NULL,
  content text NOT NULL,
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (slid)
) TYPE=MyISAM AUTO_INCREMENT=5;

INSERT INTO {$tblprefix}splangs VALUES ('1','member_active_subject','email','��Ա�����ʼ�����','��Ա��������ʼ�','0');
INSERT INTO {$tblprefix}splangs VALUES ('2','member_active_content','email','��Ա�����ʼ�����','{$mname}�����ã�\r\n��������� {$cmsname} ���͵ġ�\r\n\r\n���յ�����ʼ�������Ϊ��������վ�����û�ע�ᣬ���û��޸� Email ʹ��\r\n�����ĵ�ַ���������û�з��ʹ����ǵ���վ����û�н����������������\r\n������ʼ���������Ҫ�˶������������һ���Ĳ�����\r\n\r\n----------------------------------------------------------------------\r\n�ʺż���˵��\r\n----------------------------------------------------------------------\r\n\r\n����������վ�����û��������޸�����ע�� Email ʱʹ���˱���ַ��������\r\nҪ�����ĵ�ַ��Ч�Խ�����֤�Ա��������ʼ����ַ�����á�\r\n\r\n��ֻ������������Ӽ��ɼ��������ʺţ�\r\n\r\n{$cms_abs}adminm.php?action=emailactivate&mid={$mid}&id={$confirmid}\r\n\r\n(������治��������ʽ���뽫��ַ�ֹ�ճ�����������ַ���ٷ���)\r\n\r\n��л���ķ��ʣ�ף��ʹ����죡\r\n\r\n\r\n\r\n����\r\n\r\n{$cmsname}\r\n{$cms_abs}','0');
INSERT INTO {$tblprefix}splangs VALUES ('3','member_getpwd_subject','email','��Ա�������ʼ�����','��Ա����������ʼ�','0');
INSERT INTO {$tblprefix}splangs VALUES ('4','member_getpwd_content','email','��Ա�������ʼ�����','{$mname}�����ã�\r\n��������� {$cmsname} ���͵ġ�\r\n\r\n���յ�����ʼ�������Ϊ�����ǵ���վ����������ַ���Ǽ�Ϊ�û����䣬\r\n�Ҹ��û�����ʹ�� Email �������ù������¡�\r\n\r\n----------------------------------------------------------------------\r\n��Ҫ��\r\n----------------------------------------------------------------------\r\n\r\n�����û���ύ�������õ��������������վ��ע���û�������������\r\n��ɾ������ʼ���ֻ����ȷ����Ҫ�������������£��ż����Ķ������\r\n���ݡ�\r\n\r\n----------------------------------------------------------------------\r\n��������˵��\r\n----------------------------------------------------------------------\r\n\r\n��ֻ�����ύ����������֮�ڣ�ͨ�������������������������룺\r\n\r\n{$cms_abs}adminm.php?action=getpwd&mid={$mid}&id={$confirmid}\r\n\r\n(������治��������ʽ���뽫��ַ�ֹ�ճ�����������ַ���ٷ���)\r\n\r\n�����ҳ��򿪺������µ�������ύ��֮��������ʹ���µ������¼\r\n��̳�ˡ����������û������������ʱ�޸��������롣\r\n\r\n�������ύ�ߵ� IP Ϊ {$onlineip}\r\n\r\n\r\n����\r\n\r\n{$cmsname}\r\n{$cms_abs}','0');

DROP TABLE IF EXISTS {$tblprefix}sptpls;
CREATE TABLE {$tblprefix}sptpls (
  ename varchar(30) NOT NULL,
  cname varchar(80) NOT NULL,
  link varchar(80) NOT NULL,
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (ename)
) TYPE=MyISAM;

INSERT INTO {$tblprefix}sptpls VALUES ('register','��Աע��ҳ��','{$cms_abs}register.php','1');
INSERT INTO {$tblprefix}sptpls VALUES ('login','��Ա��¼ҳ��','{$cms_abs}login.php','2');
INSERT INTO {$tblprefix}sptpls VALUES ('message','ϵͳ��ʾ��Ϣģ��','��ʾ��Ϣ(ϵͳ����)','3');
INSERT INTO {$tblprefix}sptpls VALUES ('jslogin','��Ա(δ)��¼js����ģ��','{$cms_abs}login.php?mode=js','4');
INSERT INTO {$tblprefix}sptpls VALUES ('jsloginok','��Ա(��)��¼js����ģ��','{$cms_abs}login.php?mode=js','5');
INSERT INTO {$tblprefix}sptpls VALUES ('down','�������ظ���ҳ','ͨ��ģ���ʶ����','6');
INSERT INTO {$tblprefix}sptpls VALUES ('flash','FLASH���Ÿ���ҳ','ͨ��ģ���ʶ����','7');
INSERT INTO {$tblprefix}sptpls VALUES ('media','��Ƶ���Ÿ���ҳ','ͨ��ģ���ʶ����','8');
INSERT INTO {$tblprefix}sptpls VALUES ('vote','ͶƱ�鿴ҳ��','{$cms_abs}vote.php?action=view&vid={$vid}','9');
INSERT INTO {$tblprefix}sptpls VALUES ('search','��վ��������ҳ','{$cms_abs}search.php','10');
INSERT INTO {$tblprefix}sptpls VALUES ('allsearch','��վ��������ҳ','{$cms_abs}allsearch.php','11');
INSERT INTO {$tblprefix}sptpls VALUES ('msearch','������Աҳ��','{$cms_abs}msearch.php','11');

DROP TABLE IF EXISTS {$tblprefix}subscribes;
CREATE TABLE {$tblprefix}subscribes (
  id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname char(15) NOT NULL,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  isatm tinyint(1) unsigned NOT NULL DEFAULT '0',
  cridstr varchar(255) NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (id),
  KEY mid (mid,aid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}subsites;
CREATE TABLE {$tblprefix}subsites (
  sid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  sitename varchar(80) NOT NULL,
  dirname varchar(30) NOT NULL,
  templatedir varchar(30) NOT NULL,
  closed tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  channels text NOT NULL,
  commus text NOT NULL,
  smallsite varchar(50) NOT NULL,
  cmslogo varchar(100) NOT NULL,
  cmstitle varchar(100) NOT NULL,
  cmskeyword varchar(100) NOT NULL,
  cmsdescription text NOT NULL,
  hometpl varchar(30) NOT NULL,
  js_dir varchar(30) NOT NULL DEFAULT '',
  css_dir varchar(30) NOT NULL DEFAULT '',
  ineedstatic int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (sid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}uclasses;
CREATE TABLE {$tblprefix}uclasses (
  ucid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mcaid smallint(5) unsigned NOT NULL DEFAULT '0',
  cuid smallint(6) NOT NULL DEFAULT '0',
  title varchar(50) NOT NULL DEFAULT '',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (ucid)
) TYPE=MyISAM AUTO_INCREMENT=10;

INSERT INTO {$tblprefix}uclasses VALUES ('1','0','0','�ĵ�1','9','0');
INSERT INTO {$tblprefix}uclasses VALUES ('2','0','0','�ĵ�2','9','0');
INSERT INTO {$tblprefix}uclasses VALUES ('5','1','0','ddf','1','0');
INSERT INTO {$tblprefix}uclasses VALUES ('6','1','0','���ط���һ','10','0');
INSERT INTO {$tblprefix}uclasses VALUES ('7','1','0','���ط����','10','0');
INSERT INTO {$tblprefix}uclasses VALUES ('8','2','0','ɢ�ķ���һ','10','0');
INSERT INTO {$tblprefix}uclasses VALUES ('9','2','0','ɢ�ķ����','10','0');

DROP TABLE IF EXISTS {$tblprefix}ucoclass;
CREATE TABLE {$tblprefix}ucoclass (
  uccid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title char(30) NOT NULL,
  ucoid smallint(6) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (uccid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}ucotypes;
CREATE TABLE {$tblprefix}ucotypes (
  ucoid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname char(30) NOT NULL,
  cclass varchar(15) NOT NULL,
  umode tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  notblank tinyint(1) unsigned NOT NULL DEFAULT '0',
  vmode tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (ucoid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}uprojects;
CREATE TABLE {$tblprefix}uprojects (
  upid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  ename varchar(10) NOT NULL,
  cname varchar(50) NOT NULL,
  gtid smallint(6) unsigned NOT NULL DEFAULT '0',
  sugid smallint(6) unsigned NOT NULL DEFAULT '0',
  tugid smallint(6) unsigned NOT NULL DEFAULT '0',
  autocheck tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (upid)
) TYPE=MyISAM AUTO_INCREMENT=4;

INSERT INTO {$tblprefix}uprojects VALUES ('1','0_12','�����Ա���������ϵ','5','0','12','0');
INSERT INTO {$tblprefix}uprojects VALUES ('2','12_13','��ͨ���ұ��ǩԼ����','5','12','13','0');
INSERT INTO {$tblprefix}uprojects VALUES ('3','0_13','���2','5','0','13','1');

DROP TABLE IF EXISTS {$tblprefix}userfiles;
CREATE TABLE {$tblprefix}userfiles (
  ufid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  filename varchar(50) NOT NULL,
  url varchar(80) NOT NULL,
  `type` varchar(10) NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname char(15) NOT NULL,
  size int(10) unsigned NOT NULL DEFAULT '0',
  thumbed tinyint(1) unsigned NOT NULL DEFAULT '0',
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  tid tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (ufid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}usergroups;
CREATE TABLE {$tblprefix}usergroups (
  ugid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  cname varchar(30) NOT NULL,
  gtid smallint(3) unsigned NOT NULL DEFAULT '0',
  mchids varchar(255) NOT NULL,
  currency int(10) unsigned NOT NULL DEFAULT '0',
  limitday int(6) unsigned NOT NULL DEFAULT '0',
  prior int(3) unsigned NOT NULL DEFAULT '999',
  amcids text NOT NULL,
  discount float unsigned NOT NULL DEFAULT '0',
  issuepermit tinyint(1) unsigned NOT NULL DEFAULT '1',
  commentpermit tinyint(1) unsigned NOT NULL DEFAULT '1',
  purchasepermit tinyint(1) NOT NULL DEFAULT '0',
  answerpermit tinyint(1) NOT NULL DEFAULT '0',
  uploadpermit tinyint(1) unsigned NOT NULL DEFAULT '1',
  searchpermit tinyint(3) unsigned NOT NULL DEFAULT '1',
  downloadpermit tinyint(1) unsigned NOT NULL DEFAULT '1',
  freeupdatecheck tinyint(1) unsigned NOT NULL DEFAULT '0',
  freeupdatecopy tinyint(1) unsigned NOT NULL DEFAULT '0',
  denyarc tinyint(1) unsigned NOT NULL DEFAULT '0',
  denyatm tinyint(1) unsigned NOT NULL DEFAULT '0',
  maxuptotal int(10) unsigned NOT NULL DEFAULT '10000000',
  maxdowntotal int(10) unsigned NOT NULL DEFAULT '10000000',
  maxpms smallint(6) unsigned NOT NULL DEFAULT '100',
  arcallows int(10) unsigned NOT NULL DEFAULT '0',
  cuallows int(10) unsigned NOT NULL DEFAULT '0',
  ex_discount tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (ugid)
) TYPE=MyISAM AUTO_INCREMENT=21;

INSERT INTO {$tblprefix}usergroups VALUES ('1','��ϰ��Ա','3','1','0','0','999','','0','1','1','0','0','1','1','1','0','0','0','0','10','10','50','1','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('2','��ͨ��Ա','3','1','200','0','999','','0','1','1','0','0','1','1','1','0','0','0','0','10','10','50','2','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('3','�м���Ա','3','1','1000','0','999','','0','1','1','0','0','1','1','1','0','0','0','0','15','15','100','5','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('4','�߼���Ա','3','1','2000','0','999','','0','1','1','0','0','1','1','1','0','0','0','0','20','20','100','0','7','0');
INSERT INTO {$tblprefix}usergroups VALUES ('5','�����Ա','3','1','5000','0','999','','0','1','1','0','0','1','1','1','0','0','0','0','20','20','100','10','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('14','�ճ�����','2','1','0','0','999','a:1:{s:1:\"m\";s:1:\"1\";}','0','1','1','0','0','1','1','1','1','0','1','1','10000000','10000000','100','0','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('16','����7��','1','1','0','7','999','','0','0','0','0','0','0','1','0','0','0','0','0','10000000','10000000','100','0','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('17','����1��','1','1','0','30','999','','0','0','0','0','0','0','1','0','0','0','0','0','10000000','10000000','100','0','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('18','��������','1','1','0','10000000','999','','0','0','0','0','0','0','1','0','0','0','0','0','10000000','10000000','100','0','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('12','��ͨ����','5','1','0','0','999','','0','1','1','0','0','1','1','1','1','0','0','0','10000000','10000000','100','0','0','70');
INSERT INTO {$tblprefix}usergroups VALUES ('13','ǩԼ����','5','1','0','0','999','','0','1','1','0','0','1','1','1','1','1','0','0','10000000','10000000','100','0','0','80');
INSERT INTO {$tblprefix}usergroups VALUES ('15','����1��','1','1','0','1','999','','0','0','0','0','0','0','1','0','0','0','0','0','10000000','10000000','100','0','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('19','��ͨVIP','6','1','30','0','999','','0','1','1','0','0','1','1','1','0','0','0','0','10000000','10000000','100','0','0','0');
INSERT INTO {$tblprefix}usergroups VALUES ('20','�߼�VIP','6','1','50','0','999','','0','1','1','0','0','1','1','1','0','0','0','0','10000000','10000000','100','0','0','0');

DROP TABLE IF EXISTS {$tblprefix}userurls;
CREATE TABLE {$tblprefix}userurls (
  uid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  url varchar(80) NOT NULL,
  utid smallint(6) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  sids varchar(255) NOT NULL,
  newwin tinyint(1) unsigned NOT NULL DEFAULT '0',
  actsid tinyint(1) unsigned NOT NULL DEFAULT '0',
  onclick varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (uid)
) TYPE=MyISAM AUTO_INCREMENT=21;

INSERT INTO {$tblprefix}userurls VALUES ('1','���顤����','?entry=album&action=albumadd&atid=1&caid=3','2','1','2','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('2','����������','?entry=album&action=albumadd&atid=1&caid=2','2','1','1','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('3','���á����','?entry=album&action=albumadd&atid=1&caid=4','2','1','3','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('4','�ƻá�����','?entry=album&action=albumadd&atid=1&caid=5','2','1','4','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('5','��ʷ������','?entry=album&action=albumadd&atid=1&caid=6','2','1','5','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('6','���ɡ����','?entry=album&action=albumadd&atid=1&caid=7','2','1','6','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('7','��ƪС˵','?entry=archive&action=archiveadd&chid=3&caid=10','2','1','7','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('8','ɢ����','?entry=archive&action=archiveadd&chid=3&caid=8','5','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('9','������','?entry=archive&action=archiveadd&chid=3&caid=9','5','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('10','��Ʒר��','?entry=album&action=albumadd&atid=2&caid=10','5','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('11','����������','?action=albumadd&atid=1&caid=2','4','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('12','���顤����','?action=albumadd&atid=1&caid=3','4','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('13','���á����','?action=albumadd&atid=1&caid=4','4','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('14','�ƻá�����','?action=albumadd&atid=1&caid=5','4','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('15','��ʷ������','?action=albumadd&atid=1&caid=6','4','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('16','���ɡ����','?action=albumadd&atid=1&caid=7','4','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('17','��ƪС˵','?action=archiveadd&chid=3&caid=10','4','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('18','ɢ����','?action=archiveadd&chid=3&caid=8','6','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('19','������','?action=archiveadd&chid=3&caid=9','6','1','0','0','','0','0','');
INSERT INTO {$tblprefix}userurls VALUES ('20','��Ʒ�ϼ�','adminm.php?action=albumadd&atid=2&caid=2','6','1','0','0','','0','0','');

DROP TABLE IF EXISTS {$tblprefix}usualurls;
CREATE TABLE {$tblprefix}usualurls (
  uid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL DEFAULT '',
  url varchar(80) NOT NULL DEFAULT '',
  logo varchar(255) NOT NULL DEFAULT '',
  ismc tinyint(1) unsigned NOT NULL DEFAULT '0',
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  sids varchar(255) NOT NULL DEFAULT '',
  actsid tinyint(1) unsigned NOT NULL DEFAULT '0',
  newwin tinyint(1) unsigned NOT NULL DEFAULT '0',
  onclick varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (uid)
) TYPE=MyISAM AUTO_INCREMENT=4;

INSERT INTO {$tblprefix}usualurls VALUES ('1','�������','?entry=utrans&action=utransedit&nauid=19&mchid=1','','0','1','0','0','','0','0','');
INSERT INTO {$tblprefix}usualurls VALUES ('2','���ֹ���','?entry=extracts','','0','1','0','0','','0','0','');
INSERT INTO {$tblprefix}usualurls VALUES ('3','���ֳ�/��ֵ','?entry=currencys&action=currencysaving','','0','1','0','0','','0','0','');

DROP TABLE IF EXISTS {$tblprefix}utrans;
CREATE TABLE {$tblprefix}utrans (
  trid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname char(15) NOT NULL,
  gtid smallint(6) unsigned NOT NULL DEFAULT '0',
  fromid smallint(6) unsigned NOT NULL DEFAULT '0',
  toid smallint(6) unsigned NOT NULL DEFAULT '0',
  remark varchar(255) NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  reply varchar(255) NOT NULL,
  PRIMARY KEY (trid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}utypes;
CREATE TABLE {$tblprefix}utypes (
  utid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title varchar(50) NOT NULL,
  pid smallint(6) unsigned NOT NULL DEFAULT '0',
  ismc tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(6) unsigned NOT NULL DEFAULT '0',
  pmid smallint(6) unsigned NOT NULL DEFAULT '0',
  sids varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (utid)
) TYPE=MyISAM AUTO_INCREMENT=7;

INSERT INTO {$tblprefix}utypes VALUES ('1','��̨����','0','0','0','0','');
INSERT INTO {$tblprefix}utypes VALUES ('2','С˵','1','0','0','0','');
INSERT INTO {$tblprefix}utypes VALUES ('3','��������','0','1','0','0','');
INSERT INTO {$tblprefix}utypes VALUES ('4','С˵','3','1','0','0','');
INSERT INTO {$tblprefix}utypes VALUES ('5','����','1','0','0','0','');
INSERT INTO {$tblprefix}utypes VALUES ('6','����','3','1','0','0','');

DROP TABLE IF EXISTS {$tblprefix}vcatalogs;
CREATE TABLE {$tblprefix}vcatalogs (
  caid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  title char(50) NOT NULL,
  vieworder tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (caid),
  KEY parentid (vieworder)
) TYPE=MyISAM AUTO_INCREMENT=2;

INSERT INTO {$tblprefix}vcatalogs VALUES ('1','������','0');

DROP TABLE IF EXISTS {$tblprefix}vols;
CREATE TABLE {$tblprefix}vols (
  vid mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  aid mediumint(8) unsigned NOT NULL DEFAULT '0',
  volid smallint(6) unsigned NOT NULL DEFAULT '1',
  vtitle varchar(80) NOT NULL,
  PRIMARY KEY (vid),
  KEY aid (aid),
  KEY volid (volid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}voptions;
CREATE TABLE {$tblprefix}voptions (
  vopid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  vid smallint(5) unsigned NOT NULL DEFAULT '0',
  title varchar(80) NOT NULL,
  votenum int(10) unsigned NOT NULL DEFAULT '0',
  vieworder tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (vopid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}votes;
CREATE TABLE {$tblprefix}votes (
  vid smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  caid smallint(6) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(80) NOT NULL,
  content mediumtext NOT NULL,
  totalnum mediumint(8) unsigned NOT NULL DEFAULT '0',
  ismulti tinyint(1) unsigned NOT NULL DEFAULT '0',
  timelimit smallint(5) unsigned NOT NULL DEFAULT '0',
  norepeat tinyint(1) unsigned NOT NULL DEFAULT '0',
  enddate int(10) unsigned NOT NULL DEFAULT '0',
  onlyuser tinyint(1) unsigned NOT NULL DEFAULT '0',
  vieworder smallint(5) unsigned NOT NULL DEFAULT '0',
  checked tinyint(1) unsigned NOT NULL DEFAULT '0',
  mid mediumint(8) unsigned NOT NULL DEFAULT '0',
  mname varchar(30) NOT NULL,
  createdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (vid)
) TYPE=MyISAM;


DROP TABLE IF EXISTS {$tblprefix}wordlinks;
CREATE TABLE {$tblprefix}wordlinks (
  wlid smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  sword varchar(30) NOT NULL,
  url varchar(120) NOT NULL,
  available tinyint(1) unsigned NOT NULL DEFAULT '1',
  pcs int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (wlid)
) TYPE=MyISAM;


