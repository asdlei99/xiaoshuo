<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
//���еľ������ϻ��漰����Ա���������ô��ʱ��û��ǲ�Ҫ��������ϡ�
$php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
if(in_str('/hbcms/',$php_self)) amessage('����Դ������ʹ�ô˹���<br>���ȸ��ƿ�����');
load_cache('channels,fchannels,mchannels');
include_once M_ROOT."./include/database.fun.php";
if(empty($action)){
	tabheader('������װ��','','',3);
	trcategory(array('������Ŀ','��ʾ���ݰ�','����ʾ���ݰ�','ģ�尲װ��'));
	echo "<tr class=\"txt\"><td class=\"txtL w200\">������ʾ����</td>\n".
		"<td class=\"txtC\">-</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=dbclear&ver=init\">>>ִ��</a></td>\n".
		"<td class=\"txtC\">-</td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">��ǰ���ݿ���</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=dbpack&ver=init\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=dbpack&ver=conf\">>>ִ��</a></td>\n".
		"<td class=\"txtC\">-</td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">���ɼ�������GBK�汾</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=conf&lan=scgbk\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=init&lan=scgbk\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=tplpack&lan=scgbk\">>>ִ��</a></td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">���ɼ�������UTF8�汾</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=conf&lan=scutf8\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=init&lan=scutf8\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=tplpack&lan=scutf8\">>>ִ��</a></td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">���ɷ�������BIG5�汾</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=conf&lan=tcbig5\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=init&lan=tcbig5\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=tplpack&lan=tcbig5\">>>ִ��</a></td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">���ɷ�������UTF8�汾</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=conf&lan=tcutf8\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=init&lan=tcutf8\">>>ִ��</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=tplpack&lan=tcutf8\">>>ִ��</a></td></tr>\n";
	tabfooter();
}elseif($action == 'dbclear'){
	if($ver == 'init'){
		$cleartables = array(//�����˻�Ա����
		'albums','answers','archives','archives_sub','archives_rec','arecents','comments','consults','cradminlogs','favorites','farchives',
		'gurls','keywords','logerrortimes','mcomments','mfavorites','mflinks','mfriends','mreplys','mreports','mtrans',
		'offers','orders','pays','pms','purchases','replys','reports','subscribes','userfiles',
		'voptions','votes','utrans','wordlinks',
		);
		foreach($channels as $v) $cleartables[] = 'archives_'.$v['chid'];
		foreach($fchannels as $v) $cleartables[] = 'farchives_'.$v['chid'];
		foreach($cleartables as $table){
			$db->query("TRUNCATE {$tblprefix}$table",'SILENT');
		}
		
	}elseif($ver == 'conf'){//Ӧ�ò���Ҫ�˹���
	
	}
	rebuild_cache(-1);
}elseif($action == 'dbpack'){
	$sqlcompat = 'MYSQL40';
	$sqlcharset = 'gbk';
	$usehex = 0;

	$structables = array('cradminlogs','msession',);
	$datatables = array();
	$query = $db->query("SHOW TABLES FROM $dbname");
	while($dbtable = $db->fetch_row($query)){
		$dbtable[0] = preg_replace("/^".$tblprefix."(.*?)/s","\\1",$dbtable[0]);
		!in_array($dbtable[0],$structables) && $datatables[] = $dbtable[0];
	}

	$db->query('SET SQL_QUOTE_SHOW_CREATE=0', 'SILENT');
	$idstring = '# DatafileID: '.base64_encode("$timestamp,08CMS,$cms_version,installsql")."\n";

	$dumpcharset = $sqlcharset ? $sqlcharset : str_replace('-', '',$mcharset);
	
	$setnames = ($sqlcharset && $db->version() > '4.1' && (!$sqlcompat || $sqlcompat == 'MYSQL41')) ? "SET NAMES '$dumpcharset';\n\n" : '';
	if($db->version() > '4.1'){
		if($sqlcharset) {
			$db->query("SET NAMES '".$sqlcharset."';\n\n");
		}
		if($sqlcompat == 'MYSQL40'){
			$db->query("SET SQL_MODE='MYSQL40'");
		}elseif($sqlcompat == 'MYSQL41') {
			$db->query("SET SQL_MODE=''");
		}
	}
	$dumpfile = M_ROOT.'./install/08cms.sql';
	$sqldump = '';
	foreach($structables as $table){
		$sqldump .= pack_sqldump($table,0);
	}
	foreach($datatables as $table){
		$sqldump .= pack_sqldump($table,1);
	}
	$sqldump = "$idstring".
			"# <?exit();?>\n".
			"# 08cms InstallPack Data Dump\n".
			"# Version: 08cms v$cms_version\n".
			"# Date: ".date("Y-m-d",$timestamp)."\n".
			"# --------------------------------------------------------\n".
			"# Home: www.08cms.com\n".
			"# --------------------------------------------------------\n\n\n".
			"$setnames".$sqldump;
			
	@$fp = fopen($dumpfile, 'wb');
	@flock($fp, 2);
	if(@!fwrite($fp, $sqldump)){
		@fclose($fp);
		amessage('data_export_failed','?entry=atpl_pro');
	}else{
		@fclose($fp);
		amessage('data_export_finish','?entry=atpl_pro');
	}

}elseif($action == 'mpack'){
	include_once M_ROOT."./include/charset.fun.php";
	$droot = M_ROOT."./../mpack/".date('ymdHis').'_'.$lan.'_'.$ver.'/';
	$icharset = $lan == 'scgbk' ? 'gbk' : ($lan == 'tcbig5' ? 'big5' : 'utf-8');
	$lan_ver = substr($lan,0,2);
	$qcharset = str_replace('-','',$icharset);//ʹ����sql��charset
	if(is_dir($droot)) dirclear($droot,1);
	if(!dir_copy(M_ROOT,$droot,1,0)) amessage('����'.M_ROOT.'ʱ����','?entry=atpl_pro');
	$dirarr = array(
		'admina' => array(1,0),
		'adminm' => array(1,0),
		'adminp' => array(1,1),
		'api' => array(1,0),
		'category' => array(0,0),
		'dynamic' => array(0,0),
		'dynamic/aguides' => array(1,0),
		'dynamic/cache' => array(0,0),
		'dynamic/function' => array(1,0),
		'dynamic/htmlcac' => array(0,0),
		'dynamic/htmltxt' => array(0,0),
		'freeinfos' => array(0,0),
		'images' => array(1,1),
		'include' => array(1,1),
		'install' => array(1,1),
		'mspace' => array(1,1),
		'payonline' => array(1,1),
		'template' => array(1,1),
		'uc_client' => array(1,1),
		'userfiles' => array(0,0),//ֻ�д���ʾ����ʱ�ſ�����������
	);
	foreach($dirarr as $k => $v){
		if(!dir_copy(M_ROOT.$k,$droot.$k,$v[0],$v[1])) amessage('����'.M_ROOT.$k.'ʱ����','?entry=atpl_pro');
	}
	//���ļ��ڲ�������������û�/////////////////////////////////////////////////////////////////
	//base.inc.php
	if(!is_writable($droot.'base.inc.php')) amessage('�����ļ�base.inc.php����д','?entry=atpl_pro');
	$fp = fopen($droot.'base.inc.php','r');
	$configfile = fread($fp, filesize($droot.'base.inc.php'));
	fclose($fp);
	$configfile = preg_replace("/[$]dbname\s*\=\s*[\"'].*?[\"'];/is", "\$dbname = 'db08cms';", $configfile);
	$configfile = preg_replace("/[$]dbpw\s*\=\s*[\"'].*?[\"'];/is", "\$dbpw = '';", $configfile);
	$configfile = preg_replace("/[$]mcharset\s*\=\s*[\"'].*?[\"'];/is", "\$mcharset = '".$icharset."';", $configfile);
	$configfile = preg_replace("/[$]tblprefix\s*\=\s*[\"'].*?[\"'];/is", "\$tblprefix = 'cms_';", $configfile);
	$configfile = preg_replace("/[$]ckpre\s*\=\s*[\"'].*?[\"'];/is", "\$ckpre = '';", $configfile);
	$configfile = preg_replace("/[$]lan_version\s*\=\s*[\"'].*?[\"'];/is", "\$lan_version = '".$lan_ver."';", $configfile);
	$fp = fopen($droot.'base.inc.php','w');
	fwrite($fp, trim($configfile));
	fclose($fp);
	str2file('<html><head><meta http-equiv="refresh" content="0;url=./install.php"></head></html>',$droot.'index.htm');
	str2file('<html><head><meta http-equiv="refresh" content="0;url=./install.php"></head></html>',$droot.'index.html');


	//�������򿪷��õ��ļ�������
	$unlinks = array('google.xml','baidu.xml','sitemap.xml',);
	foreach(array('aguides','inscopy','inspack','tablestr','test','certificate','atpl','atpl_pro') as $k) $unlinks[] = "admina/$k.inc.php";
	foreach($unlinks as $k) @unlink($droot.$k);

	//ת������
	$convs = array();
	//ϵͳ����
	$convs[] = 'include/syscache/btagnames.cac.php';
	$convs[] = 'include/syscache/nouserinfos.cac.php';
	//��װ�ļ�
	$convs[] = 'install/08cms.sql';
	$convs[] = 'install/langs/blangs.cac.php';
	$convs[] = 'install/langs/ilangs.cac.php';
	//�����̨ע��
	$agarr = findfiles($droot.'dynamic/aguides/','php');
	foreach($agarr as $v) $convs[] = 'dynamic/aguides/'.$v;
	//�����ļ�
	$convs[] = 'upload.php';
	$convs[] = 'include/js/langs.js';
	$convs[] = 'include/js/calendar.js';
	//ģ���ļ�
	$tpldirs = array("template/$templatedir/");
	foreach($subsites as $k => $v) $tpldirs[] = "template/$v[templatedir]/";
	foreach($tpldirs as $tpldir){
		$tplkeys = array(
		array($tpldir,'htm'),
		array($tpldir,'html'),
		array($tpldir.'js/','js'),
		array($tpldir.'css/','css'),
		array($tpldir.'function/','php'),
		array($tpldir.'cache/','php'),
		);
		foreach($tplkeys as $v){
			$tplarr = findfiles($droot.$v[0],$v[1]);
			foreach($tplarr as $u) $convs[] = $v[0].$u;
		}
	}
	//����༭ת��
	foreach($convs as $v){
		if($lan == 'tcutf8'){
			convert_file('gbk','big5',$droot.$v);
			convert_file('big5','utf-8',$droot.$v);
		}else convert_file('gbk',$icharset,$droot.$v);
	}
	amessage('��װ�����ɳɹ�','?entry=atpl_pro');

}elseif($action == 'tplpack'){
	//(!$filename || preg_match("/(\.)(exe|jsp|asp|aspx|cgi|fcgi|pl)(\.|$)/i", $filename)) && amessage(lang('file cname illegal'),'?entry=package&action=tplpack');
	include_once M_ROOT."./include/charset.fun.php";

	mmkdir(M_ROOT."./../mpack/atpls/",0);
	$droot = M_ROOT."./../mpack/atpls/".date('ymdHis').'_'.$lan.'/';
	mmkdir($droot,0);
	$icharset = $lan == 'scgbk' ? 'gbk' : ($lan == 'tcbig5' ? 'big5' : 'utf-8');


	$outtables = array('asession','badwords','langs','mconfigs','msession','wordlinks',);
	$structables = array(//����Ҫ��ṹ
	'archives','archives_sub','farchives','members','members_sub','orders',		
	);
	foreach($channels as $v) $structables[] = 'archives_'.$v['chid'];
	foreach($fchannels as $v) $structables[] = 'farchives_'.$v['chid'];
	$cleartables = array(//����Ҫ�ṹ�����ݣ�ֻ��Ҫ��ԭϵͳ���ؽ����ɡ�
	'answers','arecents','comments','cradminlogs','favorites','forders','gurls',
	'notaanswer','onlinetime','pays','pms','purchases','taxs','uclasses','userfiles',
	'voptions','votes','consults','keywords',
	);
	$datatables = array();
	$query = $db->query("SHOW TABLES FROM $dbname");
	while($dbtable = $db->fetch_row($query)){
		$dbtable[0] = preg_replace("/^".$tblprefix."(.*?)/s","\\1",$dbtable[0]);
		if(!in_array($dbtable[0],$outtables) && !in_array($dbtable[0],$structables) && !in_array($dbtable[0],$cleartables)){
			$datatables[] = $dbtable[0];
		}
	}


	$sqlcompat = 'MYSQL40';
	$sqlcharset = $dumpcharset = 'gbk';
	$usehex = 0;
	$db->query('SET SQL_QUOTE_SHOW_CREATE=0', 'SILENT');
	//$sqlcharset = $dumpcharset = $dbcharset ? $dbcharset : str_replace('-', '', $mcharset);

	$setnames = $db->version() > '4.1' && (!$sqlcompat || $sqlcompat == 'MYSQL41') ? "SET NAMES '$sqlcharset';\n\n" : '';
	if($db->version() > '4.1'){
		$db->query("SET NAMES '".$sqlcharset."';\n\n");
		$sqlcompat == 'MYSQL40' ? $db->query("SET SQL_MODE='MYSQL40'") : $db->query("SET SQL_MODE=''");
	}
	$dumpfile = $droot.'./package.sql';
	$sqldump = '';
	foreach($structables as $table) $sqldump .= pack_sqldump($table,0);
	foreach($datatables as $table) $sqldump .= pack_sqldump($table,1);
	foreach($cleartables as $table){
		$ntable = '{$tblprefix}'.$table;
		$sqldump .= "TRUNCATE $ntable;\n";
	}
	$idstring = '# DatafileID: '.base64_encode("$timestamp,08CMS,$cms_version,".str_replace('-','',$icharset).",$lan_version")."\n";
	$sqldump = "$idstring".
			"# <?exit();?>\n".
			"# 08CMS ConfigPack Data Dump\n".
			"# Version: 08CMS v$cms_version\n".
			"# Date: ".date("Y-m-d",$timestamp)."\n".
			"# --------------------------------------------------------\n".
			"# Home: www.08cms.com\n".
			"# --------------------------------------------------------\n\n\n".
			"$setnames".
		$sqldump;

	$confs = array(
		array('hometpl',$hometpl,'view'),
		array('regcode_width', $regcode_width,'visit'),
		array('regcode_height',$regcode_height,'visit'),
		array('cms_regcode',$cms_regcode,'visit'),
		array('thumbwidth',$thumbwidth,'upload'),
		array('thumbheight',$thumbheight,'upload'),
		array('shopcrid',$shopcrid,'pay'),
		array('cashscale',$cashscale,'pay'),
	);
	foreach($confs as $v){
		$sqldump .= "REPLACE INTO ".'{$tblprefix}'."mconfigs (varname, value, cftype) VALUES ('$v[0]','$v[1]','$v[2]');\n";
	}
	if($icharset != 'gbk'){
		$sqldump = str_replace("CHARSET=gbk","CHARSET=".str_replace('-','',$icharset),$sqldump);
		$sqldump = str_replace("SET NAMES 'gbk'","SET NAMES '".str_replace('-','',$icharset)."'",$sqldump);
	}

	@$fp = fopen($dumpfile, 'wb');
	@flock($fp, 2);
	if(@!fwrite($fp, $sqldump)) amessage('���ݿ������ɹ�','?entry=atpl_pro');
	@fclose($fp);
	if(!dir_copy(M_ROOT."./template/default",$droot."template",1,1)) amessage('����ģ���ļ���ʱ����','?entry=atpl_pro');
	if(!dir_copy(M_ROOT."./dynamic/function",$droot."function",1,0)) amessage('���ƺ����ļ���ʱ����','?entry=atpl_pro');


	$convs = array($dumpfile);
	//$convs = array();
	//ģ���ļ�
	$tplkeys = array(
		array('template/default/','htm'),
		array('template/default/','htm'),
		array('template/default/js/','js'),
		array('template/default/css/','css'),
		array('template/default/function/', 'php'),
		array('template/default/cache/','php'),
	);
	foreach($tplkeys as $v){
		$tplarr = findfiles($droot.$v[0],$v[1]);
		foreach($tplarr as $u) $convs[] = $v[0].$u;
	}
	foreach($convs as $v){
		if($lan == 'tcutf8'){
			convert_file('gbk','big5',$v);
			convert_file('big5','utf-8',$v);
		}else{
			convert_file('gbk',$icharset,$v);
		}
	}
	amessage('ģ������ɳɹ�','?entry=atpl_pro');

}
function convert_file($scode,$tcode,$sfile=''){//gbk,big5,utf-8
	if(!$sfile || !is_file($sfile)) return;
	if(empty($scode) || empty($tcode) || $scode == $tcode) return;
	$str = @file2str($sfile);
	$str && $str = convert_encoding($scode,$tcode,$str);
	str2file($str,$sfile);
}
function clear_files($dir,$keeps = array()){
	if(!is_dir($dir)) return;
	$handle = dir($dir);
	while($entry = $handle->read()){
		if($entry != '.' && $entry != '..' && is_file($dir.'/'.$entry)){
			if(!$keeps || !in_array($entry,$keeps)) @unlink($dir.'/'.$entry);
		}
	}
	$handle->close();
}
function dirclear($dir,$mode = 1){//$mode:0 ֻ����ļ�/1 ����ļ����ļ���
	if(!is_dir($dir)) return;
	$directory = dir($dir);
	while($entry = $directory->read()){
		$filename = $dir.'/'.$entry;
		if(is_file($filename)){
			@unlink($filename);
		}elseif(is_dir($filename) && $entry != '.' && $entry != '..'){
			dirclear($filename,$mode);
			if($mode) @rmdir($filename);
		}
	}
	$directory->close();
}
function dir_copy($source,$destination,$f = 0,$d = 0){//$f-�Ƿ����ļ������ļ���$d�Ƿ��������¼��ļ���
	if(!is_dir($source)) return false;
	mmkdir($destination,0);
	if($f || $d){
		$handle = dir($source);
		while($entry = $handle->read()){
			if(($entry != ".") && ($entry != "..")){
				if(is_dir($source."/".$entry)){
					$d && dir_copy($source."/".$entry,$destination."/".$entry,$f,$d);
				}else{
					$f && copy($source."/".$entry,$destination."/".$entry);
				}
			}
		}
		$handle->close();
	}
	return true;
}
function ocache_read($rname,$dir){
	if(!@include $dir.$rname.'.cac.php') return array();
	return ${$rname.'_0'};
}
function ocache_save($carr,$cname,$dir){
	if(!is_array($carr) || empty($cname)) return;
	$cacstr = var_export($carr,TRUE);
	mmkdir($dir);
	if(@$fp = fopen($dir.$cname.'.cac.php','wb')){
		$cname .= '_0';
		fwrite($fp,"<?php\n\$$cname = $cacstr ;\n?>");
		fclose($fp);
	}
}
?>
