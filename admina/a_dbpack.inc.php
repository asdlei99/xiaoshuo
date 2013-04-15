<?
(!defined('M_COM') || !defined('M_ADMIN')) && exit('No Permission');
aheader();
include_once M_ROOT."./include/database.fun.php";
if(!submitcheck('bdbpack')){
	$submitstr = '';
	tabheader('导出升级格式的数据表','dbpack',"?entry=a_dbpack",2,0,1);
	for($i = 1;$i < 11;$i ++){
		trbasic('数据表-'.$i.'&nbsp; &nbsp; <input class="checkbox" type="checkbox" name="nodata'.$i.'" value="1"> 仅结构','dbtable'.$i);
	}
	trbasic('操作说明','','单表生成一个.sql文件，用于升级系统时的整表复制。<br>注意：本脚本只生成gbk编码的文件。','');
	tabfooter('bdbpack');
}else{
	$sqlcompat = 'MYSQL40';
	$sqlcharset = $dumpcharset = 'gbk';
	$usehex = 0;
	$db->query('SET SQL_QUOTE_SHOW_CREATE=0', 'SILENT');
	$setnames = ($sqlcharset && $db->version() > '4.1' && (!$sqlcompat || $sqlcompat == 'MYSQL41')) ? "SET NAMES '$dumpcharset';\n\n" : '';
	if($db->version() > '4.1'){
		if($sqlcharset) $db->query("SET NAMES '".$sqlcharset."';\n\n");
		if($sqlcompat == 'MYSQL40'){
			$db->query("SET SQL_MODE='MYSQL40'");
		}elseif($sqlcompat == 'MYSQL41') {
			$db->query("SET SQL_MODE=''");
		}
	}
	for($i = 1;$i < 11;$i ++){
		$dbtable = trim(${'dbtable'.$i});
		$dbdata = empty(${'nodata'.$i}) ? 1 : 0;
		if(!$dbtable) continue;
		$sqldump = $setnames;
		$sqldump .= pack_sqldump($dbtable,$dbdata);
		$dumpfile = M_ROOT.'./updatedata/'.$dbtable.'.sql';
		@$fp = fopen($dumpfile,'wb');
		@flock($fp, 2);
		@fwrite($fp, $sqldump);
		@fclose($fp);
	}
	amessage('data_export_finish','?entry=a_dbpack');
}

?>
