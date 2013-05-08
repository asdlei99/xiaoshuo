<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
//所有的具体资料会涉及到会员，所以配置打包时最好还是不要具体的资料。
$php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
if(in_str('/hbcms/',$php_self)) amessage('开发源程序不能使用此功能<br>请先复制开发包');
load_cache('channels,fchannels,mchannels');
include_once M_ROOT."./include/database.fun.php";
if(empty($action)){
	tabheader('制作安装包','','',3);
	trcategory(array('操作项目','演示数据版','无演示数据版','模板安装包'));
	echo "<tr class=\"txt\"><td class=\"txtL w200\">清理演示数据</td>\n".
		"<td class=\"txtC\">-</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=dbclear&ver=init\">>>执行</a></td>\n".
		"<td class=\"txtC\">-</td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">当前数据库打包</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=dbpack&ver=init\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=dbpack&ver=conf\">>>执行</a></td>\n".
		"<td class=\"txtC\">-</td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">生成简体中文GBK版本</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=conf&lan=scgbk\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=init&lan=scgbk\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=tplpack&lan=scgbk\">>>执行</a></td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">生成简体中文UTF8版本</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=conf&lan=scutf8\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=init&lan=scutf8\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=tplpack&lan=scutf8\">>>执行</a></td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">生成繁体中文BIG5版本</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=conf&lan=tcbig5\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=init&lan=tcbig5\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=tplpack&lan=tcbig5\">>>执行</a></td></tr>\n";
	echo "<tr class=\"txt\"><td class=\"txtL w200\">生成繁体中文UTF8版本</td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=conf&lan=tcutf8\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=mpack&ver=init&lan=tcutf8\">>>执行</a></td>\n".
		"<td class=\"txtC\"><a href=\"?entry=atpl_pro&action=tplpack&lan=tcutf8\">>>执行</a></td></tr>\n";
	tabfooter();
}elseif($action == 'dbclear'){
	if($ver == 'init'){
		$cleartables = array(//留下了会员资料
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
		
	}elseif($ver == 'conf'){//应该不需要此功能
	
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
	$qcharset = str_replace('-','',$icharset);//使用于sql的charset
	if(is_dir($droot)) dirclear($droot,1);
	if(!dir_copy(M_ROOT,$droot,1,0)) amessage('复制'.M_ROOT.'时出错','?entry=atpl_pro');
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
		'userfiles' => array(0,0),//只有带演示数据时才拷贝附件进来
	);
	foreach($dirarr as $k => $v){
		if(!dir_copy(M_ROOT.$k,$droot.$k,$v[0],$v[1])) amessage('复制'.M_ROOT.$k.'时出错','?entry=atpl_pro');
	}
	//将文件内部的相关内容作置换/////////////////////////////////////////////////////////////////
	//base.inc.php
	if(!is_writable($droot.'base.inc.php')) amessage('配置文件base.inc.php不可写','?entry=atpl_pro');
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


	//清除多余或开发用的文件及设置
	$unlinks = array('google.xml','baidu.xml','sitemap.xml',);
	foreach(array('aguides','inscopy','inspack','tablestr','test','certificate','atpl','atpl_pro') as $k) $unlinks[] = "admina/$k.inc.php";
	foreach($unlinks as $k) @unlink($droot.$k);

	//转换编码
	$convs = array();
	//系统缓存
	$convs[] = 'include/syscache/btagnames.cac.php';
	$convs[] = 'include/syscache/nouserinfos.cac.php';
	//安装文件
	$convs[] = 'install/08cms.sql';
	$convs[] = 'install/langs/blangs.cac.php';
	$convs[] = 'install/langs/ilangs.cac.php';
	//管理后台注释
	$agarr = findfiles($droot.'dynamic/aguides/','php');
	foreach($agarr as $v) $convs[] = 'dynamic/aguides/'.$v;
	//其它文件
	$convs[] = 'upload.php';
	$convs[] = 'include/js/langs.js';
	$convs[] = 'include/js/calendar.js';
	//模板文件
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
	//处理编辑转换
	foreach($convs as $v){
		if($lan == 'tcutf8'){
			convert_file('gbk','big5',$droot.$v);
			convert_file('big5','utf-8',$droot.$v);
		}else convert_file('gbk',$icharset,$droot.$v);
	}
	amessage('安装包生成成功','?entry=atpl_pro');

}elseif($action == 'tplpack'){
	//(!$filename || preg_match("/(\.)(exe|jsp|asp|aspx|cgi|fcgi|pl)(\.|$)/i", $filename)) && amessage(lang('file cname illegal'),'?entry=package&action=tplpack');
	include_once M_ROOT."./include/charset.fun.php";

	mmkdir(M_ROOT."./../mpack/atpls/",0);
	$droot = M_ROOT."./../mpack/atpls/".date('ymdHis').'_'.$lan.'/';
	mmkdir($droot,0);
	$icharset = $lan == 'scgbk' ? 'gbk' : ($lan == 'tcbig5' ? 'big5' : 'utf-8');


	$outtables = array('asession','badwords','langs','mconfigs','msession','wordlinks',);
	$structables = array(//仅需要表结构
	'archives','archives_sub','farchives','members','members_sub','orders',		
	);
	foreach($channels as $v) $structables[] = 'archives_'.$v['chid'];
	foreach($fchannels as $v) $structables[] = 'farchives_'.$v['chid'];
	$cleartables = array(//不需要结构与数据，只需要在原系统上重建即可。
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
	if(@!fwrite($fp, $sqldump)) amessage('数据库打包不成功','?entry=atpl_pro');
	@fclose($fp);
	if(!dir_copy(M_ROOT."./template/default",$droot."template",1,1)) amessage('复制模板文件夹时出错','?entry=atpl_pro');
	if(!dir_copy(M_ROOT."./dynamic/function",$droot."function",1,0)) amessage('复制函数文件夹时出错','?entry=atpl_pro');


	$convs = array($dumpfile);
	//$convs = array();
	//模板文件
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
	amessage('模板包生成成功','?entry=atpl_pro');

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
function dirclear($dir,$mode = 1){//$mode:0 只清除文件/1 清除文件及文件夹
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
function dir_copy($source,$destination,$f = 0,$d = 0){//$f-是否复制文件夹下文件，$d是否复制搜索下级文件夹
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
