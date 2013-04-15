<?php
function createtable($sql, $dbcharset){
	$type = strtoupper(preg_replace("/^\s*CREATE TABLE\s+.+\s+\(.+?\).*(ENGINE|TYPE)\s*=\s*([a-z]+?).*$/isU", "\\2", $sql));
	$type = in_array($type, array('MYISAM', 'HEAP')) ? $type : 'MYISAM';
	return preg_replace("/^\s*(CREATE TABLE\s+.+\s+\(.+?\)).*$/isU", "\\1", $sql).
		(mysql_get_server_info() > '4.1' ? " ENGINE=$type DEFAULT CHARSET=$dbcharset" : " TYPE=$type");
}
function in_str($me,$source){
	return !(strpos($source,$me) === FALSE);
}
function dir_writeable($dir){
	mmkdir($dir,$dir == '.' ? 0 : 1);
	if(is_dir($dir)){
		if($fp = @fopen("$dir/test.txt", 'w')) {
			@fclose($fp);
			@unlink("$dir/test.txt");
			$writeable = 1;
		}else{
			$writeable = 0;
		}
	}
	return $writeable;
}

function dir_clear($dir){
	showjsmessage(lang('initialize dir').' '.$dir);
	$directory = dir($dir);
	while($entry = $directory->read()){
		$filename = $dir.'/'.$entry;
		if(is_file($filename)){
			@unlink($filename);
		}
	}
	$directory->close();
	@touch($dir.'/index.htm');
	@touch($dir.'/index.html');
}
function ins_header($isform=0){
	global $mcharset,$cms_version,$installfile,$step,$iversion;
	$mcharset = empty($mcharset) ? 'gbk' : $mcharset;
	$formstr = empty($isform) ? "" : "<form method=\"post\" action=\"$installfile\">";
	$sbutton = (in_array($step,array('2','3','4','5','6')) ? "<a style=\"cursor:pointer\" onclick=\"window.location='?step=".($step - 1)."'\">>>".lang('goback')."</a>&nbsp;&nbsp;&nbsp;&nbsp;" : '').
	"<a style=\"cursor:pointer\" onclick=\"javascript: window.close();\">>>".lang('exit')."</a>";
	$stepstr = '';
	for($i = 1;$i < 8;$i ++){
		$stepstr .= "<div ".($step == $i ? "class='red'" : '').">".lang('ins_step'.$i)."</div>";
	}
	$ins_guide = lang('ins_guide');
	$lan_site = lang('08cmssite');
	$lan_help = lang('help');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?=$mcharset?>" />
<title>08CMS <?=$iversion?> <?=lang('install')?></title>
<link rel="stylesheet" type="text/css" id="css" href="install/install.css">
<script src="install/install.js" type="text/javascript"></script>
</head>

<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td align="center">
<table width="800" border="0" cellpadding="0" cellspacing="0">
  <tr>
	<td valign="middle" width="210" height="80"><img src="install/images/logo.gif"></td>
	<td align="left" valign="top" bgcolor="#FFFFFF">
	<div class="headmsg"><?=lang('iwelcome')?> 08CMS<?=$iversion?><?=$ins_guide?></div>
	<div class="headinfo">|&nbsp;<a href="http://www.08cms.com" target="_blank"><?=$lan_site?></a><br>|&nbsp;<a href="http://www.08cms.com" target="_blank"><?=$lan_help?></a></div>
	</td>
  </tr>
</table>
<table width="800" align="center" cellpadding="0" cellspacing="5" class="main">
  <tr>
	<td width="200" valign="top" bgcolor="#FFFFFF">
		<table width="100%" cellpadding="0" cellspacing="0" class="l_tbl">
		  <tr>
			<td height="420" align="left" valign="top"><div id="steps" style="display:;"><?=$stepstr?></div><div id="infos" style="display:none;"></div>
			</td>
		  </tr>
		  <tr>
			<td height="30" align="left"><?=$sbutton?></td>
		  </tr>
		</table>
	<td valign="top" bgcolor="#FFFFFF">
		<table width="100%" cellpadding="0" cellspacing="0">
		  <?=$formstr?>
		  <tr>
			<td height="420" align="left" valign="top">
<?
}
function ins_mider(){
?>
			</td>
		  </tr>
		  <tr>
			<td height="30"	align="center">
<?
}
function ins_footer($isform=0){
	$formstr = empty($isform) ? "" : "</form>"
?>
			</td>
		  </tr>
		  <?=$formstr?>
		</table>
	</td>
  </tr>
</table>
<table width="800" cellpadding="0" cellspacing="0">
  <tr align="center"><td>Powered by <a href="http://oa.stawin.com.cn:86" target="_blank">С˵��</a> v2013 &copy; 2013-2015 &nbsp;<a href="http://oa.stawin.com.cn:86" target="_blank">203.171.225.68:86</a></td></tr>
</table>
</td></tr></table>
</body>
</html>
<?
}
function ins_message($message){
	$message = "<font class=\"red\">".lang('install error prompt')."&nbsp;:&nbsp;</font><br>".$message;
	echo "<script>infos('".$message."')</script>";
}

function loginit($logfile) {
	showjsmessage(lang('initialize record').' '.$logfile);
	$fp = @fopen('./dynamic/records/'.$logfile.'.php', 'w');
	@fwrite($fp, '<'.'?PHP exit(); ?'.">\n");
	@fclose($fp);
}
function cacheinit(){
	global $langs;
	include_once M_ROOT.'./include/ios.fun.php';
	include_once M_ROOT.'./include/cache.fun.php';
	showjsmessage(lang('init_cache'));
	$langs = reload_cache('langs');
	rebuild_cache(-1);
}

function showjsmessage($message) {
	echo '<script type="text/javascript">showmessage(\''.addslashes($message).' \');</script>'."\r\n";
	flush();
	ob_flush();
}

function random($length) {
	$hash = '';
	$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
	$max = strlen($chars) - 1;
	PHP_VERSION < '4.2.0' && mt_srand((double)microtime() * 1000000);
	for($i = 0; $i < $length; $i++) {
		$hash .= $chars[mt_rand(0, $max)];
	}
	return $hash;
}

function result($result = 1, $output = 1, $html = 1) {
	if($result){
		$text = $html ? '<font color="#131395">'.lang('writeable').'</font><br />' : lang('writeable')."\n";
		if(!$output) return $text;
		echo $text;
	}else{
		$text = $html ? '<font color="#FF0000">'.lang('unwriteable').'</font><br />' : lang('writeable')."\n";
		if(!$output) return $text;
		echo $text;
	}
}

function redirect($url) {
	echo "<script>".
		"function redirect() {window.location.replace('$url');}\n".
		"setTimeout('redirect();', 0);\n".
		"</script>";
	exit();
}

function runquery($sql) {
	global $lang,$dbcharset,$tblprefix,$db;
	$sql = str_replace("\r", "\n", str_replace(' {$tblprefix}', ' '.$tblprefix, $sql));
	$ret = array();
	$num = 0;
	foreach(explode(";\n", trim($sql)) as $query) {
		$queries = explode("\n", trim($query));
		foreach($queries as $query) {
			$ret[$num] .= $query[0] == '#' || $query[0].$query[1] == '--' ? '' : $query;
		}
		$num++;
	}
	unset($sql);

	foreach($ret as $query) {
		$query = trim($query);
		if($query) {
			if(substr($query, 0, 12) == 'CREATE TABLE') {
				$name = preg_replace("/CREATE TABLE ([a-z0-9_]+) .*/is", "\\1", $query);
				showjsmessage($lang['create_table'].' '.$name.' ... '.$lang['succeed']);
				$db->query(createtable($query,$dbcharset));
			} else {
				$db->query($query);
			}

		}
	}
}

function setconfig($string) {
	if(!get_magic_quotes_gpc()) {
		$string = str_replace('\'', '\\\'', $string);
	} else {
		$string = str_replace('\"', '"', $string);
	}
	return $string;
}
function order_arr(&$arr,$pid){
	$tempids = $oarr = array();
	$tempids = son_ids($arr,$pid,$tempids);
	foreach($tempids as $tempid) {
		$oarr[$tempid] = $arr[$tempid];
	}
	unset($tempids);
	return $oarr;
}
function son_ids(&$arr,$pid,&$tempids){
	$narr = $arr;
	foreach($narr as $k => $v){
		if($v['pid'] == $pid){
			$tempids[] = $k;
			$tempids = son_ids($arr,$k,$tempids);
		}
	}
	unset($narr);
	return $tempids;
}
function lang($str=''){
	global $langs;
	$result = '';
	$arr = explode(' ',$str);
	if(empty($arr)) return '';
	foreach($arr as $var){
		$var = trim($var);
		$result .= isset($langs[$var]) ? $langs[$var] : $var;
	}
	return $result;
}
function button_str($name,$val='',$disabled=0){
	echo "<input class=\"button\" type=\"submit\" name=\"$name\" value=\"$val\"".($disabled ? ' disabled' : '').">\n";
}
function hidden_str($name,$val=''){
	echo "<input type=\"hidden\" name=\"$name\" value=\"$val\">\n";
}
function input_str($name,$val='',$type='text',$size=30,$readonly=0,$max=0){
	return "<input type=\"$type\" name=\"$name\" value=\"$val\"".($readonly ? ' readonly' : '')." size=\"$size\"".($max ? " maxlength=\"$max\"" : '').">";
}
function trheader($arr = array()){
	echo "<tr class=\"header\">\n";
	foreach($arr as $k){
		echo "<td>$k</td>\n";
	}
	echo "</tr>\n";
}
function trbasic($arr = array(),$center=''){
	echo "<tr".($center ? " class=\"option\"" : '').">\n";
	$i = 0;
	foreach($arr as $k){
		$i ++;
		$tdclass = $i % 2 ? 'item1' : 'item2';
		echo "<td class=\"$tdclass\">$k</td>\n";
	}
	echo "</tr>\n";
}
function mmkdir($dir,$create=1){
	if(!is_dir($dir)){
		@mkdir($dir,0777);
		if($create){
			@touch($dir.'/index.htm');
			@touch($dir.'/index.html');
		}
	}
}
function view_url($url){
	global $cmsurl;
	return empty($url) || strpos($url,'://') !== false  || strpos($url,$cmsurl) === 0 ? $url : ($cmsurl.$url);
}
function arr_tag2atm(&$item,$fmode=''){
	if(in_array($fmode,array('','f','m',))){
		$fields = read_cache($fmode.'fields',$item[$fmode == 'm' ? 'mchid' : 'chid']);
	}elseif(in_array($fmode,array('ca','cc',))){
		$fields = reload_cache($fmode.'fields');
	}
	foreach($fields as $k => $v) if(isset($item[$k]) && $v['datatype'] == 'htmltext') $item[$k] = tag2atm($item[$k],1);
}
function tag2atm(&$str,$istext=0){
	global $cms_abs,$ftp_url;
	$str = str_replace('<!cmsurl />',$cms_abs,str_replace('<!ftpurl />',$ftp_url,$str));
	if(!$istext) $str = view_url($str);
	return $str;
}

?>