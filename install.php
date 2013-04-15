<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);
@set_time_limit(1000);
set_magic_quotes_runtime(0);
if(PHP_VERSION < '4.1.0') {
	$_GET = &$HTTP_GET_VARS;
	$_POST = &$HTTP_POST_VARS;
}
define('M_COM',TRUE);
define('M_ROOT','');
$installfile = basename(__FILE__);
$sqlfile = './install/08cms.sql';
$lockfile = './dynamic/install.lock';
$timestamp = time();
$ierror = '';
$sid = 0;

@include './install/langs/blangs.cac.php';
@include './install/langs/ilangs.cac.php';
@include './install/install.fun.php';
@include './base.inc.php';
@include './include/mysql.cls.php';


if(!function_exists('ins_message') || !is_readable($sqlfile)){
	exit("Please upload all files to install 08cms!");
}
$langs = $blangs + $ilangs;
unset($blangs,$ilangs);
$inslang = lang($lan_version.str_replace('-','',strtolower($mcharset)));
$iversion = ' v'.$cms_version.$inslang.' ';
$step = $_POST['step'] ? $_POST['step'] : ($_GET['step'] ? $_GET['step'] : 1);

if(!isset($dbhost) || !isset($ckpre)){
	$ierror = lang('base.inc.php noexist , please upload .');
}elseif(!ini_get('short_open_tag')){
	$ierror = lang('shorttaginvalid');
}elseif(file_exists($lockfile)){
	$ierror = lang('lockexist');
}elseif(!class_exists('cls_mysql')){
	$ierror = lang('include/mysql.cls.php noexist , please upload .');
}
if(empty($dbcharset) && in_array(strtolower($mcharset), array('gbk', 'big5', 'utf-8'))) {
	$dbcharset = str_replace('-', '', $mcharset);
}
if(in_array($step, array('4', '5'))) {
	if(is_writable('./base.inc.php')){
		$writeable['config'] = result(1, 0);
		$write_error = 0;
	} else {
		$writeable['config'] = result(0, 0);
		$write_error = 1;
	}
}
if($step == 1){
	ins_header(1);
	echo "<div class=\"licence\">".lang('ins_introduce')."</div>";
	ins_mider();
	hidden_str('step',2);
	button_str('submit',lang('start install'),$ierror ? 1 : 0);	
	ins_footer(1);
	$ierror && ins_message($ierror);
}elseif($step == '2'){
	ins_header(1);
	echo "<div class=\"licence\">".lang('ins_license')."</div>";
	ins_mider();
	hidden_str('step',3);
	button_str('submit',lang('agree'),$ierror ? 1 : 0);	
	ins_footer(1);
	$ierror && ins_message($ierror);
	
}elseif($step == '3'){
	$curr_os = PHP_OS;
	if(!function_exists('mysql_connect')){
		$curr_mysql = lang('nosupport');
		$ierror = lang('mysql_unsupport');
	}else $curr_mysql = lang('support');
	$curr_php_version = PHP_VERSION;
	if($curr_php_version < '4.0.6') $ierror = 'php_version_406';
	if(@ini_get('file_uploads')) {
		$max_size = @ini_get('upload_max_filesize');
		$curr_upload_status = lang('attachment max size0').$max_size;
	}else $curr_upload_status = lang('forbid upload attachment');
	$curr_disk_space = intval(diskfreespace('.') / (1024 * 1024)).'M';
	ins_header(1);
	echo "<table width=\"95%\" cellspacing=\"1\" bgcolor=\"#D0DBE7\" border=\"0\" align=\"center\">\n";
	trheader(array(lang('checkup item'),lang('env_required'),lang('env_best'),lang('env_current'),));
	trbasic(array(lang('operate system'),lang('nolimit'),'UNIX/Linux/FreeBSD',$curr_os),1);
	trbasic(array(lang('PHP version'),'4.0.6+','4.3.5+',$curr_php_version),1);
	trbasic(array(lang('attachment upload'),lang('nolimit'),lang('allow'),$curr_upload_status),1);
	trbasic(array(lang('MYSQL support'),lang('support'),lang('support'),$curr_mysql),1);
	trbasic(array(lang('disk space0'),'10M+',lang('nolimit'),$curr_disk_space),1);
	echo "</table>\n";
	ins_mider();
	hidden_str('step',4);
	button_str('submit',lang('continue'),$ierror ? 1 : 0);	
	ins_footer(1);
	$ierror && ins_message($ierror);
}elseif($step == '4'){
	$dirarr = array(
		'root' => '.',
		'tpl' => './template',
		'dftpl' => './template/default',
		'catalog' => './category',
		'freeinfo' => './freeinfos',
		'userfiles' => './userfiles',
		'dynamic' => './dynamic',
		'cache' => './dynamic/cache',
		'htmlcac' => './dynamic/htmlcac',
		'export' => './dynamic/export',
		'import' => './dynamic/import',
		'function' => './dynamic/function',
		'records' => './dynamic/records',
		'stats' => './dynamic/stats',
	);
	foreach($dirarr as $key => $dir){
		if(dir_writeable($dir)){
			$writeable[$key] = result(1, 0);
		}else{
			$writeable[$key] = result(0, 0);
			$ierror = $dir.lang('forbidwrite');
		}
	}
	if($write_error) $ierror = './base.inc.php'.lang('forbidwrite');
	ins_header(1);
	echo "<table width=\"95%\" cellspacing=\"1\" bgcolor=\"#D0DBE7\" border=\"0\" align=\"center\">\n";
	trheader(array(lang('path file cname'),lang('install want state'),lang('system current state'),));
	trbasic(array('./base.inc.php',lang('writeable'),$writeable['config']),1);
	foreach($dirarr as $k => $v){
		trbasic(array($v,lang('writeable'),$writeable[$k]),1);
	}
	echo "</table>\n";
	ins_mider();
	hidden_str('step',5);
	button_str('submit',lang('continue'),$ierror ? 1 : 0);	
	ins_footer(1);
	$ierror && ins_message($ierror);
}elseif($step == '5'){
	if($write_error){
		$readonly = 1;
		$ierror = './base.inc.php'.lang('forbidwrite');
	}else $readonly = 0;

	if($_POST['saveconfig']) {
		$dbhost = setconfig($_POST['dbhost']);
		$dbuser = setconfig($_POST['dbuser']);
		$dbpw = setconfig($_POST['dbpw']);
		$dbname = setconfig($_POST['dbname']);
		$adminemail = setconfig($_POST['adminemail']);
		$tblprefix = setconfig($_POST['tblprefix']);
		if(empty($dbname)){
			$ierror = lang('please input database cname');
		}else{
			if(!@mysql_connect($dbhost, $dbuser, $dbpw)){
				$ierror = lang('dberror'.mysql_errno());
			}else{
				if(mysql_get_server_info() > '4.1'){
					mysql_query("CREATE DATABASE IF NOT EXISTS `$dbname` DEFAULT CHARACTER SET $dbcharset");
				}else mysql_query("CREATE DATABASE IF NOT EXISTS `$dbname`");
				if(mysql_errno()) $ierror = lang('dberror'.mysql_errno());
				mysql_close();
			}
		}
		if(preg_match("/[^a-zA-Z_0-9]+/",$tblprefix)) $ierror = lang('pointed tblprefix illegal');

		if(!$ierror){
			$fp = fopen('./base.inc.php','r');
			$configfile = fread($fp, filesize('./base.inc.php'));
			fclose($fp);
			$configfile = preg_replace("/[$]dbhost\s*\=\s*[\"'].*?[\"'];/is", "\$dbhost = '$dbhost';", $configfile);
			$configfile = preg_replace("/[$]dbuser\s*\=\s*[\"'].*?[\"'];/is", "\$dbuser = '$dbuser';", $configfile);
			$configfile = preg_replace("/[$]dbpw\s*\=\s*[\"'].*?[\"'];/is", "\$dbpw = '$dbpw';", $configfile);
			$configfile = preg_replace("/[$]dbname\s*\=\s*[\"'].*?[\"'];/is", "\$dbname = '$dbname';", $configfile);
			$configfile = preg_replace("/[$]adminemail\s*\=\s*[\"'].*?[\"'];/is", "\$adminemail = '$adminemail';", $configfile);
			$configfile = preg_replace("/[$]tblprefix\s*\=\s*[\"'].*?[\"'];/is", "\$tblprefix = '$tblprefix';", $configfile);
			$configfile = preg_replace("/[$]ckpre\s*\=\s*[\"'].*?[\"'];/is", "\$ckpre = '".random(3)."_';", $configfile);
			$fp = fopen('./base.inc.php', 'w');
			fwrite($fp, trim($configfile));
			fclose($fp);
			redirect("$installfile?step=6");
		}
	}
	ins_header(1);
	echo "<table width=\"95%\" cellspacing=\"1\" bgcolor=\"#D0DBE7\" border=\"0\" align=\"center\">\n";
	trheader(array(lang('setting item'),lang('setting value'),lang('guide'),));
	trbasic(array(lang('database server'),input_str('dbhost',$dbhost,'text',30,$readonly),lang('dbhost_guide')),0);
	trbasic(array(lang('database user'),input_str('dbuser',$dbuser,'text',30,$readonly),lang('dbuser_guide')),0);
	trbasic(array(lang('database password'),input_str('dbpw',$dbpw,'password',30,$readonly),lang('dbpw_guide')),0);
	trbasic(array(lang('database cname'),input_str('dbname',$dbname,'text',30,$readonly),lang('dbname_guide')),0);
	trbasic(array(lang('system email'),input_str('adminemail',$adminemail,'text',30,$readonly),lang('email_guide')),0);
	trbasic(array(lang('tblprefix'),input_str('tblprefix',$tblprefix,'text',30,$readonly),lang('tblprefix_guide')),0);
	echo "</table>\n";
	ins_mider();
	hidden_str('step',5);
	hidden_str('saveconfig',1);
	button_str('submit',lang('continue'));	
	ins_footer();
	$ierror && ins_message($ierror);
}
elseif($step == '6'){
	if(!@mysql_connect($dbhost, $dbuser, $dbpw)){
		$ierror = lang('dberror'.mysql_errno());
	}else{
		$curr_mysql_version = mysql_get_server_info();
		if($curr_mysql_version < '3.23') $ierror = lang('mysql_version_323');
		$sqlarray = array(
			'createtable' => 'CREATE TABLE '.$tblprefix.'test (test TINYINT (3) UNSIGNED)',
			'insert' => 'INSERT INTO '.$tblprefix.'test (test) VALUES (1)',
			'select' => 'SELECT * FROM '.$tblprefix.'test',
			'update' => 'UPDATE '.$tblprefix.'test SET test=\'2\' WHERE test=\'1\'',
			'delete' => 'DELETE FROM '.$tblprefix.'test WHERE test=\'2\'',
			'droptable' => 'DROP TABLE '.$tblprefix.'test'
		);
		foreach($sqlarray as $key => $sql) {
			mysql_select_db($dbname);
			mysql_query($sql);
			if(mysql_errno()) $ierror = lang('dbpriv_'.$key);
		}
	}
	if($_POST['submit']){
		$username = $_POST['username'];
		$email = $_POST['email'];
		$password1 = $_POST['password1'];
		$password2 = $_POST['password2'];
		if($username && $email && $password1 && $password2){
			if($password1 != $password2){
				$ierror = lang('notsamepwd');
			}elseif(strlen($username) > 15 || preg_match("/^$|^c:\\con\\con$|　|[,\"\s\t\<\>&]|^Guest/is", $username)){
				$ierror = lang('founder account illegal');
			}elseif(!strstr($email, '@') || $email != stripslashes($email) || $email != htmlspecialchars($email)){
				$ierror = lang('founder email illegal');
			}
		}else{
			$ierror = lang('founder data missing');
		}
		if(!$ierror){
			redirect("$installfile?step=7&username=".rawurlencode($username)."&email=".rawurlencode($email)."&password=".md5(md5($password1)));
		}

	}else{
		$username = 'admin';
		$email = 'admin@domain.com';
	}
	ins_header(1);
	echo "<table width=\"95%\" cellspacing=\"1\" bgcolor=\"#D0DBE7\" border=\"0\" align=\"center\">\n";
	echo "<tr class=\"header\"><td colspan=\"2\">".lang('add founder')."</td></tr>\n";
	trbasic(array(lang('founder account'),input_str('username',$username,'text',30,0,15)),0);
	trbasic(array(lang('founder email'),input_str('email',$email,'text',30)),0);
	trbasic(array(lang('founder password'),input_str('password1',$password1,'password',30,0,15)),0);
	trbasic(array(lang('reinput founder password'),input_str('password2',$password2,'password',30,0,15)),0);
	echo "</table>\n";
	ins_mider();
	hidden_str('step',6);
	button_str('submit',lang('continue'));	
	ins_footer(1);
	$ierror && ins_message($ierror);
}
elseif($step == '7'){
	$username = htmlspecialchars($_GET['username']);
	$email = htmlspecialchars($_GET['email']);
	$password = htmlspecialchars($_GET['password']);

	$db = new cls_mysql;
	$db->connect($dbhost,$dbuser,$dbpw,$dbname,$pconnect,true,$dbcharset);
	$db->select_db($dbname);

	$fp = fopen($sqlfile, 'rb');
	$sql = fread($fp, filesize($sqlfile));
	fclose($fp);
	
	ins_header();
?>
<script type="text/javascript">
	function showmessage(message) {
		document.getElementById('notice').value += message + "\r\n";
	}
</script>
<table width="100%" cellspacing="0" border="0" align="center">
<tr><td align="center"><br />
<textarea name="notice" style="width: 80%; height: 400px" readonly id="notice"></textarea>
</td></tr>
</table>
<?
	ins_mider();
	echo "<input type=\"button\" name=\"submit\" value=\"".lang('installing')."\" disabled onclick=\"window.location='index.php'\" id=\"laststep\">\n";
	ins_footer();
	runquery($sql);
	$backupdir = substr(md5($_SERVER['SERVER_ADDR'].$_SERVER['HTTP_USER_AGENT'].substr($timestamp, 0, 4)),8,6);
	@mkdir('dynamic/backup_'.$backupdir, 0777);
	$hosturl = 'http://'.$_SERVER['HTTP_HOST'];
	$php_self = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
	$cmsurl = substr($php_self,0,strrpos($php_self,'/')).'/';
	$authkey = substr(md5($_SERVER['SERVER_ADDR'].$_SERVER['HTTP_USER_AGENT'].$dbhost.$dbuser.$dbpw.$dbname.$username.$password.$pconnect.substr($timestamp,0,6)),8,6).random(10);
	$db->query("REPLACE INTO {$tblprefix}mconfigs (varname, value, cftype) VALUES ('authkey','$authkey','visit')");
	$db->query("REPLACE INTO {$tblprefix}mconfigs (varname, value, cftype) VALUES ('hosturl','$hosturl','site')");
	$db->query("REPLACE INTO {$tblprefix}mconfigs (varname, value, cftype) VALUES ('cmsurl','$cmsurl','site')");
	$db->query("REPLACE INTO {$tblprefix}mconfigs (varname, value, cftype) VALUES ('backupdir','$backupdir','')");
	$db->query("REPLACE INTO {$tblprefix}mconfigs (varname, value, cftype) VALUES ('dir_userfile','userfiles','upload')");
	$db->query("REPLACE INTO {$tblprefix}members (mid,mname,isfounder,password,email,checked,regdate) VALUES ('1','$username','1','$password','$email','1','$timestamp');",'SILENT');
	$db->query("REPLACE INTO {$tblprefix}members_1 (mid) VALUES ('1')",'SILENT');
	$db->query("REPLACE INTO {$tblprefix}members_sub (mid) VALUES ('1')",'SILENT');
	dir_clear('./dynamic/records');
	$yearmonth = date('Ym_', time());
	loginit($yearmonth.'adminlog');
	loginit($yearmonth.'badlogin');
	loginit($yearmonth.'currencylog');
	cacheinit();
	@touch(M_ROOT.$lockfile);
	@unlink(M_ROOT.'index.htm');//删除首页跳转文件
	@unlink(M_ROOT.'index.html');//删除首页跳转文件
	echo '<script type="text/javascript">document.getElementById("laststep").disabled = false; </script>'."\r\n";
	echo '<script type="text/javascript">document.getElementById("laststep").value = \'OK\'; </script>'."\r\n";
	echo '<iframe width="0" height="0" src="./install/inscache.php"></iframe>';
}
?>